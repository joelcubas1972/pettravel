const MainePetTravelForm = {
    stateCode: "ME",
    stateName: "Maine",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: null, 
    airlineModelRequirements: ["APHIS 7001"],
    isRabbitQuarantineArea: false, 
    requirements: [
        {
            id: "import_permit_me_pets",
            name: "Import Permit (Not Required for Personal Pets)",
            description: "An import permit is NOT required for cats and dogs being moved for personal companionship and not for resale or adoption[citation:2][citation:3].",
            required: false,
            type: "permit",
            condition: "Permits are required for livestock and animals imported for resale/adoption.",
            specialInstructions: "For rescue, resale, or adoption of dogs/cats, contact the Animal Welfare Program at (207) 287-3846[citation:2][citation:3].",
            appliesTo: ["all"]
        },
        {
            id: "holding_period_me",
            name: "Holding Period (Resale/Adoption Only)",
            description: "Dogs and cats imported for resale or adoption must be held by the importer for a period of five days if 6 months or younger, or 48 hours if older than 6 months, before being offered[citation:9].",
            required: false,
            type: "quarantine",
            condition: "Only applies to dogs and cats imported for commercial resale or adoption, not personal pets.",
            specialInstructions: "Animals showing signs of illness during this period must be isolated and examined by a veterinarian[citation:9].",
            appliesTo: ["dog", "cat"]
        },
        {
            id: "federal_cdc_requirements_me",
            name: "Federal CDC Requirements for Dogs",
            description: "All dogs entering the United States are subject to federal CDC import rules. As of Fall 2024, CDC is revising rules for dogs from rabies-free countries like Canada[citation:7]. Current requirements include being at least 6 months old and microchipped[citation:7].",
            required: true,
            type: "federal_requirements",
            appliesTo: ["dog"],
            link: "https://www.cdc.gov/importation/bringing-an-animal-into-the-united-states/dogs.html"
        },
        {
            id: "livestock_permit_me",
            name: "Import Permit for Livestock & Other Animals",
            description: "An import permit is REQUIRED for: cattle, camelids, goats, sheep, swine, and farmed deer/elk. It is NOT required for poultry or equine[citation:3].",
            required: false, // Not required for dogs/cats, but true for listed species.
            type: "permit",
            condition: "For cattle, camelids, sheep, goats, swine, farmed cervids.",
            specialInstructions: "Permit requests for weekend transport must be made by the preced,ing Thursday[citation:3]. Contact Animal Health at (207) 287-3701 for specific requirements[citation:3].",
            appliesTo: ["all"]
        },
        {
            id: "cvi_general_me",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "While not explicitly stated for private pets, a CVI is a common interstate requirement. It is explicitly required for livestock importation alongside permits[citation:3].",
            required: null, // Strongly recommended/common practice, but official requirement not specified for pets.
            type: "certificate",
            deadline: null,
            specialInstructions: "For specific livestock, the CVI must include disease-free statements (e.g., for swine)[citation:3]. Consult InterstateLivestock.com or Animal Health for details[citation:3].",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.MainePetTravelForm = MainePetTravelForm;
    window.MEPetTravelForm = MainePetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('ME', MainePetTravelForm);
    }
})();