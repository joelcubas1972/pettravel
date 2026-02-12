const MichiganPetTravelForm = {
    stateCode: "MI",
    stateName: "Michigan",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS 7001"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_mi",
            name: "Official Interstate Certificate of Veterinary Inspection (CVI)",
            description: "Required for all dogs being imported into Michigan from another state. Must be filled out by a USDA-accredited veterinarian in the animal's state of origin[citation:1].",
            required: true,
            type: "certificate",
            deadline: "Not specified",
            specialInstructions: "For dogs going to registered shelters, pet shops, or large-scale breeding kennels, additional vaccinations and parasite treatments must be listed on the CVI[citation:1].",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_mi",
            name: "Rabies Vaccination",
            description: "Dogs 12 weeks of age or older must be currently vaccinated against rabies[citation:1].",
            required: true,
            type: "vaccine",
            details: "The disease (rabies), date of vaccination, and (if possible) expiration date must be listed on the CVI[citation:1]. Dogs under 12 weeks from a rabies-quarantined area are not allowed entry[citation:1].",
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
            id: "shelter_imports_mi",
            name: "Additional Requirements for Shelter/Rescue Imports",
            description: "Dogs imported to a registered animal shelter have stricter rules[citation:1].",
            required: false,
            type: "additional_regulation",
            condition: "Only for dogs imported to a registered animal shelter.",
            specialInstructions: "Dogs under 6 weeks may not be imported. Dogs 6+ weeks must be vaccinated for distemper, parvovirus, and adenovirus-2. Dogs 6-8 weeks must be with their mother. Dogs 12+ weeks must also have leptospirosis and rabies vaccines. Parasite treatment is required if indicated[citation:1].",
            appliesTo: ["dog"]
        },
        {
            id: "commercial_imports_mi",
            name: "Additional Requirements for Commercial Imports",
            description: "Stricter rules apply for dogs imported to pet shops or large-scale breeding kennels (>15 breeding females)[citation:1].",
            required: false,
            type: "additional_regulation",
            condition: "Only for dogs imported to pet shops or large-scale dog breeding kennels.",
            specialInstructions: "Dogs under 8 weeks may not be imported (7-8 week-olds with mother are an exception). Must have distemper, parvovirus, and adenovirus-2 vaccines given at least 7 days before entry. Dogs 12+ weeks also need leptospirosis and rabies. Parasite treatment if indicated[citation:1].",
            appliesTo: ["all"]
        },
        {
            id: "exhibition_mi",
            name: "Requirements for Exhibition",
            description: "Dogs imported from out of state for shows/fairs require a CVI and rabies vaccination (if 12+ weeks)[citation:1].",
            required: false,
            type: "exhibition",
            condition: "Only for dogs imported from another state for exhibition.",
            appliesTo: ["dog"]
        },
        {
            id: "general_health_mi",
            name: "General Health & Parasite Control",
            description: "For shelter/rescue and commercial imports, dogs must be treated for external/internal parasites prior to import if indicated, so they cannot spread parasites[citation:1]. Heartworm-positive dogs must start treatment and test negative for microfilaria before import[citation:1].",
            required: false,
            type: "health_check",
            condition: "Specifically detailed for shelter/rescue and commercial imports.",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.MichiganPetTravelForm = MichiganPetTravelForm;
    window.MIPetTravelForm = MichiganPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MI', MichiganPetTravelForm);
    }
})();