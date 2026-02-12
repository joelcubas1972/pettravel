const IowaPetTravelForm = {
    stateCode: "IA",
    stateName: "Iowa",
    acceptsDigitalSignature: true,
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"],

    isRabbitQuarantineArea: false, // No information found suggesting Iowa is a rabbit quarantine area.
    requirements: [
        {
            id: "cvi_requirement_ia",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "An official health certificate issued by a licensed and accredited veterinarian. It must indicate the animal is free from disease and exposure to infectious or contagious disease[citation:2].",
            required: true,
            type: "certificate",
            deadline: "30 days before travel (implied standard validity)",
            specialInstructions: "Can be issued electronically through the state's free VET CVI program[citation:6]. For interstate movements, the federal APHIS Form 7001 has specific usage notes[citation:1].",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_ia_dogs",
            name: "Rabies Vaccination (Dogs)",
            description: "All dogs over four months of age must have a current rabies vaccination with a USDA-approved vaccine[citation:2][citation:10].",
            required: true,
            type: "vaccine",
            appliesTo: ["dog"],
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
            id: "rabies_vaccine_ia_cats",
            name: "Rabies Vaccination (Cats)",
            description: "The official state requirements listed in the search results do not specify a rabies vaccine mandate for cats entering Iowa[citation:2][citation:10].",
            required: false,
            type: "vaccine",
            appliesTo: ["cat"],
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
            id: "quarantine_ban_ia",
            name: "Ban on Animals from Rabies-Quarantined Areas",
            description: "Dogs or cats originating from any area under an official rabies quarantine are prohibited from entering Iowa[citation:2].",
            required: true,
            type: "prohibition",
            specialInstructions: "The CVI should presumably affirm the animal's origin is not from such an area.",
            appliesTo: ["dog", "cat"]
        }
    ]
};

(function () {
    window.IowaPetTravelForm = IowaPetTravelForm;
    window.IAPetTravelForm = IowaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('IA', IowaPetTravelForm);
    }
})();