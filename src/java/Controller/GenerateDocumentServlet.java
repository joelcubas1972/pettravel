package Controller;

import Modelo.CarrierInfo;
import Modelo.PetInfo;
import Modelo.Vaccine;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "GenerateDocumentServlet", urlPatterns = {"/generate", "/GenerateDocumentServlet"})
public class GenerateDocumentServlet extends HttpServlet {

    private static final Map<String, Map<String, String>> COUNTRY_REQUIREMENTS = new HashMap<>();

    static {
        Map<String, String> euRequirements = new HashMap<>();
        euRequirements.put("microchip", "Requerido (ISO 11784/11785)");
        euRequirements.put("rabies", "Vacuna obligatoria");
        euRequirements.put("health_cert", "Certificado de salud veterinario");
        euRequirements.put("waiting_period", "21 días después de la vacuna antirrábica");
        COUNTRY_REQUIREMENTS.put("EU", euRequirements);

        Map<String, String> ukRequirements = new HashMap<>();
        ukRequirements.put("microchip", "Requerido");
        ukRequirements.put("rabies", "Vacuna obligatoria");
        ukRequirements.put("tapeworm", "Tratamiento contra tenia (1-5 días antes)");
        ukRequirements.put("health_cert", "Certificado oficial veterinario");
        COUNTRY_REQUIREMENTS.put("UK", ukRequirements);

        Map<String, String> auRequirements = new HashMap<>();
        auRequirements.put("microchip", "Requerido");
        auRequirements.put("rabies", "Vacuna y test de titulación");
        auRequirements.put("quarantine", "10 días mínimo de cuarentena");
        auRequirements.put("import_permit", "Permiso de importación requerido");
        COUNTRY_REQUIREMENTS.put("AU", auRequirements);

        Map<String, String> jpRequirements = new HashMap<>();
        jpRequirements.put("microchip", "Requerido (ISO 11784/11785)");
        jpRequirements.put("rabies", "Vacuna y prueba de anticuerpos");
        jpRequirements.put("quarantine", "Entre 12 horas y 180 días según procedimiento");
        jpRequirements.put("notification", "Notificación previa al Ministerio");
        COUNTRY_REQUIREMENTS.put("JP", jpRequirements);

        Map<String, String> caRequirements = new HashMap<>();
        caRequirements.put("rabies", "Certificado de vacunación actual");
        caRequirements.put("health_cert", "Certificado de salud veterinario");
        caRequirements.put("microchip", "Recomendado");
        COUNTRY_REQUIREMENTS.put("CA", caRequirements);

        Map<String, String> mxRequirements = new HashMap<>();
        mxRequirements.put("rabies", "Vacuna vigente");
        mxRequirements.put("health_cert", "Certificado de salud veterinario");
        mxRequirements.put("vaccination", "Cartilla de vacunación");
        COUNTRY_REQUIREMENTS.put("MX", mxRequirements);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<PetInfo> pets = new ArrayList<>();
        PetInfo templatePet = new PetInfo();
        CarrierInfo carrier = null;

        try {
            // === 1. Datos compartidos (dueño y viaje) ===
            templatePet.setOwnerName(request.getParameter("ownerName"));
            templatePet.setOwnerEmail(request.getParameter("ownerEmail"));
            templatePet.setOwnerPhone(request.getParameter("ownerPhone"));
            templatePet.setOwnerAddress(request.getParameter("ownerAddress"));
            templatePet.setOwnerState(request.getParameter("ownerState"));
            templatePet.setOwnerCity(request.getParameter("ownerCity"));
            templatePet.setOwnerZipCode(request.getParameter("ownerZipCode"));
            templatePet.setDestinationCountry(request.getParameter("destinationCountry"));
            templatePet.setTravelDate(parseDate(request, "travelDate", sdf));
            templatePet.setRegresoDate(parseDate(request, "regresoDate", sdf));
            templatePet.setTravelType(request.getParameter("travelType"));
            templatePet.setLugar(request.getParameter("arrivalPlace"));

            // === 2. Leer todas las mascotas (hasta 6) ===
            int petIndex = 0;
            while (true) {
                String petName = request.getParameter("pets[" + petIndex + "].petName");
                String petType = request.getParameter("pets[" + petIndex + "].petType");

                // Si no hay nombre de mascota, terminamos
                if (petName == null || petName.trim().isEmpty()) {
                    break;
                }

                PetInfo pet = new PetInfo();

                // Copiar datos compartidos del dueño y viaje
                copySharedFields(templatePet, pet);

                // Datos específicos de la mascota
                pet.setPetName(petName);
                pet.setPetType(petType);
                pet.setPetBreed(request.getParameter("pets[" + petIndex + "].petBreed"));
                pet.setPetColor(request.getParameter("pets[" + petIndex + "].petColor"));
                pet.setPetGender(request.getParameter("pets[" + petIndex + "].petGender"));
                pet.setPetBirthDate(parseDate(request, "pets[" + petIndex + "].petBirthDate", sdf));
                pet.setMicrochipNumber(request.getParameter("pets[" + petIndex + "].microchipNumber"));

                // Información del veterinario (por mascota)
                pet.setVetName(request.getParameter("pets[" + petIndex + "].vetName"));
                pet.setVetLicense(request.getParameter("pets[" + petIndex + "].vetLicense"));
                pet.setClinicName(request.getParameter("pets[" + petIndex + "].clinicName"));
                pet.setClinicAddress(request.getParameter("pets[" + petIndex + "].clinicAddress"));

                // === 3. Leer vacunas de esta mascota ===
                List<Vaccine> vaccines = new ArrayList<>();
                int vaccineIndex = 0;

                while (true) {
                    String vaccineName = request.getParameter("pets[" + petIndex + "].vaccines[" + vaccineIndex + "].name");

                    // Si no hay más vacunas, terminamos
                    if (vaccineName == null || vaccineName.trim().isEmpty()) {
                        // Verificar si al menos hay una vacuna (índice 0)
                        if (vaccineIndex == 0) {
                            // No hay vacunas para esta mascota
                            break;
                        }
                        break;
                    }

                    Vaccine vaccine = new Vaccine();
                    vaccine.setName(vaccineName);
                    vaccine.setDate(parseDate(request, "pets[" + petIndex + "].vaccines[" + vaccineIndex + "].date", sdf));
                    vaccine.setBatch(request.getParameter("pets[" + petIndex + "].vaccines[" + vaccineIndex + "].batch"));
                    vaccine.setVetName(request.getParameter("pets[" + petIndex + "].vaccines[" + vaccineIndex + "].vetName"));
                    vaccine.setVetLicense(request.getParameter("pets[" + petIndex + "].vaccines[" + vaccineIndex + "].vetLicense"));
                    vaccine.setClinicName(request.getParameter("pets[" + petIndex + "].vaccines[" + vaccineIndex + "].clinicName"));
                    vaccine.setClinicAddress(request.getParameter("pets[" + petIndex + "].vaccines[" + vaccineIndex + "].clinicAddress"));
                    vaccines.add(vaccine);
                    vaccineIndex++;
                }

                pet.setVaccines(vaccines);
                pets.add(pet);
                petIndex++;

                // Máximo 6 mascotas
                if (petIndex >= 6) {
                    break;
                }
            }

            // Verificar que al menos haya una mascota
            if (pets.isEmpty()) {
                throw new ServletException("No se proporcionó información de mascota.");
            }

            // === 4. Encargado del traslado ===
            String useCarrierParam = request.getParameter("useCarrier");
            boolean useCarrier = useCarrierParam != null && "on".equals(useCarrierParam);

            if (useCarrier) {
                carrier = new CarrierInfo();
                carrier.setName(request.getParameter("carrierName"));
                carrier.setEmail(request.getParameter("carrierEmail"));
                carrier.setPhone(request.getParameter("carrierPhone"));
                carrier.setAddress(request.getParameter("carrierAddress"));
                carrier.setCountry(request.getParameter("carrierCountry"));
            }

            // === 5. Requerimientos ===
            String country = pets.get(0).getDestinationCountry();
            Map<String, String> requirements = COUNTRY_REQUIREMENTS.getOrDefault(
                    Optional.ofNullable(country).map(String::toUpperCase).orElse(""),
                    getDefaultRequirements()
            );

            // === 6. Guardar y redirigir ===
            request.getSession().setAttribute("pets", pets);
            request.getSession().setAttribute("carrier", carrier);
            request.getSession().setAttribute("petCount", pets.size());
            request.setAttribute("requirements", requirements);
            request.setAttribute("currentDate", new Date());

            request.getRequestDispatcher("/WEB-INF/views/preview.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/?error=true");
        }
    }

    // Helper: copiar campos compartidos
    private void copySharedFields(PetInfo source, PetInfo target) {
        target.setOwnerName(source.getOwnerName());
        target.setOwnerEmail(source.getOwnerEmail());
        target.setOwnerPhone(source.getOwnerPhone());
        target.setOwnerAddress(source.getOwnerAddress());
        target.setOwnerState(source.getOwnerState());
        target.setOwnerCity(source.getOwnerCity());
        target.setOwnerZipCode(source.getOwnerZipCode());
        target.setDestinationCountry(source.getDestinationCountry());
        target.setTravelDate(source.getTravelDate());
        target.setRegresoDate(source.getRegresoDate());
        target.setTravelType(source.getTravelType());
        target.setLugar(source.getLugar());
    }

    // Helper seguro: parsea y devuelve Date
    private Date parseDate(HttpServletRequest request, String paramName, SimpleDateFormat sdf) {
        String val = request.getParameter(paramName);
        if (val != null && !val.trim().isEmpty()) {
            try {
                return sdf.parse(val);
            } catch (ParseException ignored) {
                // Log opcional
            }
        }
        return null;
    }

    // Helper: requisitos por defecto
    private Map<String, String> getDefaultRequirements() {
        Map<String, String> reqs = new HashMap<>();
        reqs.put("general1", "Verificar requisitos con embajada/consulado del país");
        reqs.put("general2", "Microchip ISO 11784/11785 recomendado");
        reqs.put("general3", "Vacuna antirrábica actualizada obligatoria");
        reqs.put("general4", "Certificado de salud veterinario necesario");
        return reqs;
    }
}
