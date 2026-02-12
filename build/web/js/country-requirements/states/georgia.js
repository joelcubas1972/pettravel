const GeorgiaPetTravelForm = {
    stateCode: "GA",
    stateName: "Georgia",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false, // No hay mención de cuarentena específica para conejos.
    requirements: [
        {
            id: "cvi_requirement_ga",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Certificado emitido por un veterinario acreditado que declara que el animal ha sido inspeccionado y está sano. Es el documento principal para la entrada.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (asumido)",
            specialInstructions: "Debe indicar que el animal está libre de enfermedades infecciosas o contagiosas y no ha estado expuesto a ellas.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_ga",
            name: "Certificado de Vacunación Antirrábica",
            description: "Se requiere vacunación contra la rabia actualizada para perros, gatos y hurones. La edad mínima y el periodo de validez siguen las pautas del compendio de rabia.",
            required: true,
            type: "vaccine",
            details: "Debe incluir fecha de vacunación, fabricante, número de lote y fecha de vencimiento.",
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
            id: "health_condition_ga",
            name: "Condición de Salud General",
            description: "El animal no debe estar afectado por enfermedades infecciosas, contagiosas o transmisibles, ni haber estado expuesto a ellas.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_ga",
            name: "Verificación de Zona de Cuarentena/Enfermedad",
            description: "El animal no debe originarse de un área bajo cuarentena por rabia u otras enfermedades de declaración obligatoria.",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_ga",
            name: "Permiso de Entrada (si aplica)",
            description: "Pueden requerirse permisos específicos para cerdos, aves de corral o animales exóticos/silvestres. Para estos últimos, contactar al Departamento de Recursos Naturales de Georgia (GA DNR).",
            required: false,
            type: "permit",
            condition: "Para cerdos, aves de corral y animales silvestres/exóticos.",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_ga",
            name: "Condiciones de Transporte",
            description: "El vehículo debe ser apropiado para el tamaño y número de animales, libre de peligros y mantenido en condiciones sanitarias.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_ga",
            name: "Requisitos CDC para Perros (a partir del 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU. desde el extranjero: requisitos actualizados de los CDC, que incluyen microchip, vacuna contra la rabia válida emitida en el extranjero y permiso de importación de CDC.",
            required: false,
            type: "federal_requirements",
            appliesTo: ["dog"],
            link: "https://www.cdc.gov/importation/bringing-an-animal-into-the-united-states/dogs.html"
        },
        {
            id: "vet_responsibilities_ga",
            name: "Responsabilidades del Veterinario",
            description: "El veterinario debe: estar acreditado, verificar todos los requisitos, completar el CVI con precisión y declarar que el animal cumple con las normas de entrada de Georgia.",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.GeorgiaPetTravelForm = GeorgiaPetTravelForm;
    window.GAPetTravelForm = GeorgiaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('GA', GeorgiaPetTravelForm);
    }
})();