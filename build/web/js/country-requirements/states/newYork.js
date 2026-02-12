const NewYorkPetTravelForm = {
    stateCode: "NY",
    stateName: "New York",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS 7001"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "rabies_vaccine_ny",
            name: "Rabies Vaccination Certificate (Strict Requirements)",
            description: "Dogs, cats, and ferrets 3 months of age or older must be vaccinated against rabies. The PRIMARY (first) rabies vaccination must be administered at least 30 days prior to entry into NY.",
            required: true,
            type: "vaccine",
            details: "A valid, original rabies certificate signed by a licensed veterinarian must accompany the animal. It must include: animal description, owner info, vaccine manufacturer, product name, serial/lot number, date of vaccination, and duration of immunity. For booster vaccines, the previous certificate must also be presented if the booster was given before the previous vaccine expired.",
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
            id: "cvi_requirement_ny",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "A CVI issued by a licensed, accredited veterinarian is required for all dogs, cats, and ferrets being imported into New York State.",
            required: true,
            type: "certificate",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "age_restriction_ny",
            name: "Minimum Age & Vaccination Schedule",
            description: "Animals must be at least 3 months old to receive the rabies vaccination, which is required for entry. Therefore, unvaccinated animals under 3 months are generally not eligible for entry unless an exemption is granted.",
            required: true,
            type: "restriction",
            appliesTo: ["all"]
        },
        {
            id: "exemption_ny",
            name: "Medical Exemption from Vaccination",
            description: "A licensed veterinarian may issue a certificate exempting an animal from rabies vaccination for a specified period due to a medical condition. This exemption certificate must accompany the animal and is valid for up to one year.",
            required: false,
            type: "exemption",
            condition: "Only with a veterinarian's certification of a medical condition.",
            appliesTo: ["all"]
        },
        {
            id: "ferret_rule_ny",
            name: "Specific Rule for Ferrets",
            description: "Ferrets are regulated under the same rabies and CVI requirements as dogs and cats. There is no separate ferret import permit required by the Department of Agriculture and Markets.",
            required: true,
            type: "general",
            appliesTo: ["ferret"]
        }
    ]
};

(function() {
    window.NewYorkPetTravelForm = NewYorkPetTravelForm;
    window.NYPetTravelForm = NewYorkPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('NY', NewYorkPetTravelForm);
    }
})();