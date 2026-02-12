const SouthCarolinaPetTravelForm = {
    stateCode: "SC",
    stateName: "South Carolina",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS 7001"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_sc",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Requerido para la entrada de perros, gatos y hurones. Es válido por 30 días.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_sc",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para perros, gatos y hurones. La vacuna debe ser aprobada por el departamento y autorizada por el USDA, y debe administrarse con una frecuencia que brinde protección continua.",
            required: true,
            type: "vaccine",
            details: "El dueño debe tener prueba de la inoculación.",
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
            id: "quarantine_ban_sc",
            name: "Prohibición de Áreas en Cuarentena por Rabia",
            description: "Los animales no deben provenir de, ni haber estado expuestos a, un área bajo cuarentena por rabia.",
            required: true,
            type: "prohibition",
            appliesTo: ["all"]
        },
        {
            id: "emergency_notices_sc",
            name: "Verificación de Avisos de Emergencia",
            description: "Se debe verificar la página de 'Emergency Notices' para conocer cualquier requisito adicional temporal (ej. por brotes de enfermedad).",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.SouthCarolinaPetTravelForm = SouthCarolinaPetTravelForm;
    window.SCPetTravelForm = SouthCarolinaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('SC', SouthCarolinaPetTravelForm);
    }
})();