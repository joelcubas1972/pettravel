const PennsylvaniaPetTravelForm = {
    stateCode: "PA",
    stateName: "Pennsylvania",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_pa",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "An official health certificate is required for animals imported into Pennsylvania, but the specifics (validity period, required tests) are determined by the state of origin's animal health officials and must meet PA's standards.",
            required: true,
            type: "certificate",
            specialInstructions: "Must be completed by an accredited veterinarian on an official state form. The online-only APHIS Form 7001 is NOT accepted. All sections must be filled out completely.",
            appliesTo: ["all"]
        },
        {
            id: "no_import_permit_pets_pa",
            name: "No Import Permit for Pets",
            description: "Pennsylvania does NOT require an import permit for dogs, cats, poultry, cattle, bison, horses, swine, camelids, sheep, or goats.",
            required: false,
            type: "permit",
            condition: "Permits are required for farmed cervids (deer, elk).",
            appliesTo: ["all"]
        },        
        {
            id: "find_vet_pa",
            name: "Accredited Veterinarian Required",
            description: "Only an accredited veterinarian can complete a valid CVI for entry into Pennsylvania.",
            required: true,
            type: "procedure",
            specialInstructions: "Pet owners should find an accredited veterinarian in their state to issue the CVI.",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.PennsylvaniaPetTravelForm = PennsylvaniaPetTravelForm;
    window.PAPetTravelForm = PennsylvaniaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('PA', PennsylvaniaPetTravelForm);
    }
})();