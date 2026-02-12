const NewJerseyPetTravelForm = {
    stateCode: "NJ",
    stateName: "New Jersey",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_nj",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "Required for dogs being imported into New Jersey. Must be completed and signed by a veterinarian licensed in the state or country of origin.",
            required: true,
            type: "certificate",
            deadline: "Issued within 30 days of travel.",
            specialInstructions: "Must certify the dog is free from rabies and other communicable diseases and has not been recently exposed. Must include breed, sex, age, origin, destination, owner/shipper details, and vaccination information if applicable. The CVI and import records must be maintained by the animal owner in NJ.",
            appliesTo: ["dog"]
        },
        {
            id: "rabies_license_nj",
            name: "Rabies Vaccination & Dog Licensing (Post-Entry)",
            description: "Rabies vaccination is not an import requirement but is legally required for all dogs 7 months or older to obtain a municipal dog license in New Jersey.",
            required: true,
            type: "legal_requirement",
            condition: "For dogs staying in New Jersey.",
            details: "Dogs licensed in another state must apply for an NJ license immediately if staying 90+ days. Unlicensed dogs must apply immediately if staying more than 10 days.",
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
            id: "cat_import_nj",
            name: "Importation of Cats",
            description: "There are no specific state requirements for importing cats into New Jersey.",
            required: false,
            type: "general",
            specialInstructions: "Cats must appear healthy upon entry to the U.S.[citation:1]. Rabies vaccination is strongly recommended for all cats in NJ due to high rabies risk.",
            appliesTo: ["cat"]
        },
        {
            id: "health_condition_nj",
            name: "Health Condition on Arrival",
            description: "Dogs exposed to, infected with, or showing signs of communicable diseases shall not be imported until treated, recovered, and re-certified as healthy by a veterinarian.",
            required: true,
            type: "health_check",
            appliesTo: ["dog"]
        },
        {
            id: "federal_requirements_nj",
            name: "Federal Requirements",
            description: "All animals entering the United States are subject to federal regulations. For dogs, this includes the mandatory CDC Dog Import Form for entry into the U.S.[citation:2][citation:8]. Cats must appear healthy.[citation:1]",
            required: true,
            type: "federal_requirements",
            appliesTo: ["dog", "cat"]
        }
    ]
};

(function() {
    window.NewJerseyPetTravelForm = NewJerseyPetTravelForm;
    window.NJPetTravelForm = NewJerseyPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('NJ', NewJerseyPetTravelForm);
    }
})();