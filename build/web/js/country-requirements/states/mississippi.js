const MississippiPetTravelForm = {
    stateCode: "MS",
    stateName: "Mississippi",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["OCVI"],
   
    isRabbitQuarantineArea: false, // Rabbits must only meet "General Requirements."
    requirements: [
        {
            id: "rabies_vaccine_ms",
            name: "Rabies Vaccination (Mandatory)",
            description: "All dogs, cats, and ferrets three (3) months of age or older must have proof of CURRENT rabies vaccination. The vaccine must follow guidelines from the National Association of State Public Health Veterinarians Rabies Compendium.",
            required: true,
            type: "vaccine",
            details: "Proof is a signed rabies vaccination certificate from a licensed veterinarian. Mississippi state law requires use of a 3-year vaccine, but for entry, manufacturer recommendations are accepted. Animals staying in MS must comply with the 3-year rule for boosters.",
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
            id: "cvi_requirement_ms",
            name: "Certificate of Veterinary Inspection (CVI) (Conditional)",
            description: "A CVI is required ONLY for dogs, cats, and ferrets entering for: exhibition, change of ownership, adoption, or if the animal is unaccompanied by its owner.",
            required: false,
            type: "certificate",
            condition: "Required for exhibition, sale, adoption, or unaccompanied transport.",
            specialInstructions: "The CVI must certify the animal is healthy, free from contagious diseases, and did not originate from a rabies-quarantined area. If traveling with owner for personal reasons (not for the conditions above), a CVI is NOT required.",
            appliesTo: ["all"]
        },
        {
            id: "health_condition_ms",
            name: "General Health & Disease Restrictions",
            description: "No animal affected with, recently exposed to, or originating from a quarantined herd/area for any infectious disease shall be imported, except for USDA-approved immediate slaughter.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_general_ms",
            name: "Import Permits (For Other Species)",
            description: "Import permits are required for many species (swine, cervids, exotics, ratites, etc.) and for ALL international imports. Permits are obtained from the State Veterinarian.",
            required: false, 
            type: "permit",
            condition: "For livestock, exotics, ratites, wild animals, and international imports.",
            contact: "Call 601-359-1170 (24/7, after-hours answered by machine).",
            appliesTo: ["all"]
        },
        {
            id: "federal_traceability_ms",
            name: "Federal Animal Disease Traceability",
            description: "All livestock entering Mississippi must comply with the USDA's Animal Disease Traceability Rule (official ID requirements).",
            required: true,
            type: "federal_requirements",
            appliesTo: ["cattle", "bison", "swine", "sheep", "goats", "equine", "poultry", "cervids"]            
        }
    ]   
};

(function() {
    window.MississippiPetTravelForm = MississippiPetTravelForm;
    window.MSPetTravelForm = MississippiPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MS', MississippiPetTravelForm);
    }
})();