const VirginiaPetTravelForm = {
    stateCode: "VA",
    stateName: "Commonwealth of Virginia",
    acceptsDigitalSignature: true,
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS7001"],
    
    isRabiesQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_va",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "A health certificate issued by an accredited veterinarian is required for most animals entering Virginia. Virginia accepts electronic CVIs (eCVIs) from specific platforms.",
            required: true,
            type: "certificate",
            appliesTo: ["all"]
        },
        {
            id: "species_specific_va",
            name: "Species-Specific Entry Requirements",
            description: "Virginia has detailed, separate entry rules for different types of animals. The core CVI requirement applies, but additional tests or declarations may be needed.",
            required: true,
            type: "species_regulations",
            appliesTo: ["all"]
        },
        {
            id: "vs_requirement_va",
            name: "Livestock from Vesicular Stomatitis (VS) Areas",
            description: "Special, stricter requirements apply for livestock imported from regions with confirmed VS cases within the last 14 days.",
            required: true,
            type: "health_declaration",
            appliesTo: ["all"]
        },
        {
            id: "permit_va",
            name: "Import Permit",
            description: "May be required in addition to the CVI for certain animals or situations. Using an approved electronic CVI platform may eliminate the need for a separate permit.",
            required: false, // Conditional
            type: "permit",
            condition: "Required for some species/situations not covered by an eCVI.",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.VirginiaPetTravelForm = VirginiaPetTravelForm;
    window.VAPetTravelForm = VirginiaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('VA', VirginiaPetTravelForm);
    }
})();