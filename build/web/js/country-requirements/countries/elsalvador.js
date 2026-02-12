var ElSalvadorPetTravelForm = {
    countryCode: "SV",
    countryName: "El Salvador",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 30,
    requirements: [
        {
            id: "health_examination_sv",
            name: "Examen Clínico Veterinario",
            description: "Examen completo realizado por un veterinario acreditado por el USDA DENTRO de los 30 días previos a la fecha de partida, certificando que la mascota está en buen estado de salud.",
            required: true,
            type: "health_check",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccination_sv",
            name: "Vacunación Antirrábica",
            description: "Vacuna contra la rabia obligatoria para perros y gatos mayores de 2 meses. La vacunación NO debe realizarse más de 365 días (aproximadamente 12 meses) antes de la fecha de embarque. Se requieren certificados originales de vacunación.",
            required: true,
            condition: "age_months > 2",
            type: "vaccine",
            appliesto: ["dog", "cat", "ferret"],
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
            id: "parasite_treatment_sv",
            name: "Tratamiento Antiparasitario",
            description: "Tratamiento recomendado para parásitos internos y externos con productos aprobados por las autoridades sanitarias estadounidenses. Este requisito se marca en el formulario pero no se detallan plazos específicos.",
            required: false,
            recommended: true,
            type: "parasite_treatment",
            appliesto: ["all"],
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
            id: "health_certificate_sv",
            name: "Certificado de Salud USDA-APHIS El Salvador",
            description: "Certificado bilingüe (español/inglés) específico de 2 páginas para El Salvador. Un requisito único es que debe emitirse y viajarse con un mínimo de 2 copias (duplicado).",
            required: true,
            type: "certificate",
            copiesRequired: 2,
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.ElSalvadorPetTravelForm) {
        window.ElSalvadorPetTravelForm = ElSalvadorPetTravelForm;
        window.SVPetTravelForm = ElSalvadorPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('SV', ElSalvadorPetTravelForm);
    }
})();