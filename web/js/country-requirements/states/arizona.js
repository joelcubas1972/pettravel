const ArizonaPetTravelForm = {
    stateCode: "AZ",
    stateName: "Arizona",
    acceptsDigitalSignature: true,  
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"], 
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_az",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Certificado emitido por un veterinario acreditado. Normalmente válido por 30 días desde la fecha de emisión[citation:5], pero el período puede reducirse a 5 días para équidos[citation:2] o 14 días para ganado[citation:5] si hay brotes de enfermedades activas.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (ver notas sobre reducciones)",
            specialInstructions: "Debe incluir: número de certificado único, declaración de que el animal está libre de enfermedades infecciosas[citation:5], información completa de vacunación antirrábica. Debe enviarse al veterinario estatal (cvi@azda.gov) en un plazo de 14 días[citation:5].",
            appliesTo: ["all"]        
        },
        {
            id: "rabies_vaccine_az",
            name: "Certificado de vacunación antirrábica",
            description: "Vacuna antirrábica actualizada para perros y gatos de 12 semanas o más[citation:7]. Los títulos de anticuerpos (titers) contra la rabia no son aceptados para la entrada a Arizona[citation:7].",
            required: true,
            type: "vaccine",
            details: "Debe cumplir con los requisitos del Compendio de Control de la Rabia Animal de la Asociación Nacional de Veterinarios de Salud Pública Estatal[citation:7].",
            appliesTo: ["dog", "cat", "ferret"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "health_condition_az",
            name: "Condición de salud general",
            description: "El veterinario debe certificar que los animales mostrados en el CVI están libres de evidencia de cualquier enfermedad infecciosa, contagiosa o transmisible o exposición conocida[citation:5].",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_az",
            name: "Verificación de zona de cuarentena/enfermedad",
            description: "El animal no debe originarse de un área bajo cuarentena por rabia. Además, existen restricciones de movimiento para animales que provienen de áreas con brotes activos de enfermedades como el Virus de la Estomatitis Vesicular (VSV)[citation:5] o el Herpesvirus Equino-1 (EHV-1)[citation:2].",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_az",
            name: "Permiso de entrada (si aplica)",
            description: "El requisito de permiso de entrada está exento para animales elegibles cuando se emite y recibe un Certificado Electrónico de Inspección Veterinaria (eCVI)[citation:5]. Para otros casos, puede ser necesario; contactar a cvi@azda.gov.",
            required: false,
            type: "permit",
            condition: "Exento si se utiliza eCVI; verificar para otros casos.",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_az",
            name: "Condiciones de transporte",
            description: "Información no explícita en los textos proporcionados, pero se asume que el transporte debe ser seguro y apropiado.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "canada_transit_az",
            name: "Documentación adicional para tránsito internacional",
            description: "Arizona comparte frontera con México. Para animales que transitan por México o ingresan desde allí, pueden aplicarse requisitos adicionales (ej., uso del formulario VS 17-30 bajo condiciones específicas)[citation:5].",
            required: false,
            type: "international_docs",
            condition: "Solo si transita por o desde México",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_az",
            name: "Requisitos CDC para perros (a partir del 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU. desde el extranjero: requisitos actualizados de los Centros para el Control de Enfermedades (CDC).",
            required: false,
            type: "federal_requirements",
            appliesTo: ["dog"],
            link: "https://www.cdc.gov/importation/bringing-an-animal-into-the-united-states/dogs.html"
        },
        {
            id: "local_requirements_az",
            name: "Requisitos por brotes de enfermedad activa",
            description: "En respuesta a brotes de enfermedades como la Estomatitis Vesicular (VSV)[citation:4][citation:6] o el Herpesvirus Equino-1 (EHV-1)[citation:2], los requisitos de CVI y las declaraciones específicas pueden cambiar. La validez del CVI para équidos puede reducirse a 5 días si el estado de origen ha tenido un caso de EHV-1 en los últimos 30 días[citation:2].",
            required: false,
            type: "local_regulations",
            affectedAreas: ["Todo el estado", "Áreas específicas como el condado de Maricopa para VSV[citation:4]"],
            contact: ["Arizona Department of Agriculture"],
            appliesTo: ["all"]
        },
        {
            id: "airline_requirements_az",
            name: "Requisitos específicos de la aerolínea",
            description: "Las aerolíneas pueden tener requisitos propios (como ventanas de tiempo más cortas para el CVI) que deben verificarse directamente con ellas.",
            required: false,
            type: "carrier_requirements",
            instructions: "Verificar con la aerolínea antes del viaje.",
            appliesTo: ["all"]
        },
        {
            id: "vet_responsibilities_az",
            name: "Responsabilidades del veterinario",
            description: "El veterinario debe: estar acreditado, inspeccionar los animales para su entrada[citation:5], completar el CVI con todas las declaraciones requeridas (ej., libre de VSV o EHV-1 si corresponde)[citation:2][citation:5], y enviar una copia del CVI a la Oficina del Veterinario Estatal de Arizona (cvi@azda.gov) dentro de los 14 días de su emisión[citation:5].",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.ArizonaPetTravelForm = ArizonaPetTravelForm;
    window.AZPetTravelForm = ArizonaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('AZ', ArizonaPetTravelForm);
    }
})();