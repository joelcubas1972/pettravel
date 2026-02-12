package Controller;

import Modelo.PetInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DocumentServlet", urlPatterns = {"/document", "/DocumentServlet"})
public class DocumentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Obtener información de la sesión
        PetInfo petInfo = (PetInfo) request.getSession().getAttribute("petInfo");
        
        if (petInfo == null) {
            // Si no hay información en sesión, redirigir al inicio
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        // Simular requisitos del país
        Map<String, String> requirements = getCountryRequirements(petInfo.getDestinationCountry());
        
        // Configurar atributos para la vista
        request.setAttribute("requirements", requirements);
        request.setAttribute("currentDate", new Date());
        
        // Mostrar documento final
        request.getRequestDispatcher("/WEB-INF/views/document.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Si se envía por POST, procesar como GET
        doGet(request, response);
    }
    
    private Map<String, String> getCountryRequirements(String country) {
        Map<String, String> requirements = new HashMap<>();
        
        if (country == null) {
            country = "";
        }
        
        switch (country.toUpperCase()) {
            case "EU":
                requirements.put("microchip", "Requerido (ISO 11784/11785)");
                requirements.put("rabies", "Vacuna obligatoria");
                requirements.put("health_cert", "Certificado de salud veterinario");
                requirements.put("waiting_period", "21 días después de la vacuna antirrábica");
                break;
            case "UK":
                requirements.put("microchip", "Requerido");
                requirements.put("rabies", "Vacuna obligatoria");
                requirements.put("tapeworm", "Tratamiento contra tenia (1-5 días antes)");
                requirements.put("health_cert", "Certificado oficial veterinario");
                break;
            case "AU":
                requirements.put("microchip", "Requerido");
                requirements.put("rabies", "Vacuna y test de titulación");
                requirements.put("quarantine", "10 días mínimo de cuarentena");
                requirements.put("import_permit", "Permiso de importación requerido");
                break;
            case "JP":
                requirements.put("microchip", "Requerido (ISO 11784/11785)");
                requirements.put("rabies", "Vacuna y prueba de anticuerpos");
                requirements.put("quarantine", "Entre 12 horas y 180 días según procedimiento");
                requirements.put("notification", "Notificación previa al Ministerio");
                break;
            default:
                requirements.put("general1", "Verificar requisitos específicos con la embajada");
                requirements.put("general2", "Microchip ISO 11784/11785 recomendado");
                requirements.put("general3", "Vacuna antirrábica actualizada obligatoria");
                requirements.put("general4", "Certificado de salud veterinario necesario");
                break;
        }
        
        return requirements;
    }
}