const NorthDakotaPetTravelForm = {
    stateCode: "ND",
    stateName: "North Dakota",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["OCVI"],
   
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_nd",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Requerido para todos los perros, gatos y hurones que ingresen al estado por MÁS de 30 días.",
            required: true,
            type: "certificate",
            condition: "Para estancias superiores a 30 días.",
            specialInstructions: "Debe ser un formulario oficial del estado o federal. NO se acepta el USDA APHIS Form 7001.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_nd",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para perros, gatos y hurones mayores de 12 semanas que ingresen al estado, sin importar la duración de la estancia.",
            required: true,
            type: "vaccine",
            details: "La vacuna debe administrarse de acuerdo con las especificaciones del producto utilizado. Una copia del certificado de vacunación antirrábica actual debe acompañar al animal.",
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
            id: "age_quarantine_restriction_nd",
            name: "Restricción de Edad para Zonas en Cuarentena",
            description: "No se acepta el ingreso de perros, gatos o hurones menores de 12 semanas procedentes de áreas en cuarentena por rabia.",
            required: true,
            type: "prohibition",
            condition: "Solo aplica si el or,igen es un área bajo cuarentena oficial por rabia.",
            appliesTo: ["all"]
        },
        {
            id: "general_health_nd",
            name: "Condición de Salud General",
            description: "Ningún animal infectado o recientemente expuesto a enfermedades infecciosas o transmisibles puede importarse a Dakota del Norte.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.NorthDakotaPetTravelForm = NorthDakotaPetTravelForm;
    window.NDPetTravelForm = NorthDakotaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('ND', NorthDakotaPetTravelForm);
    }
})();