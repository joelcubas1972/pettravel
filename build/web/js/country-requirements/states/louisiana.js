const LouisianaPetTravelForm = {
    stateCode: "LA",
    stateName: "Louisiana",
    acceptsDigitalSignature: null,
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_la",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Certificado emitido por un veterinario acreditado. Válido por 30 días desde su emisión.",
            required: true,
            type: "certificate",
            deadline: "30 días antes de la entrada",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_la",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para perros mayores de 3 meses.",
            required: true,
            type: "vaccine",
            appliesTo: ["dog", "cat", "ferret"],
            details: null,
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
            id: "health_condition_la",
            name: "Condición de Salud General",
            description: null, // No especificado en la fuente.
            required: null,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_la",
            name: "Permiso de Entrada",
            description: null, 
            required: false,
            type: "permit",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.LouisianaPetTravelForm = LouisianaPetTravelForm;
    window.LAPetTravelForm = LouisianaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('LA', LouisianaPetTravelForm);
    }
})();