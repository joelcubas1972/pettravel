const RhodeIslandPetTravelForm = {
    stateCode: "RI",
    stateName: "Rhode Island",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "portal_requirement_ri",
            name: "DAFE Online Application Portal (Mandatory)",
            description: "The Rhode Island DEM requires all applications for animal health permits, licenses, and related forms to be submitted through their dedicated online portal.",
            required: true,
            type: "procedure",
            specialInstructions: "Visit the DAFE Portal to begin the application process. This is the primary method for obtaining import authorization.",            
            appliesTo: ["all"]
        },
        {
            id: "state_vet_contact_ri",
            name: "Consultation with State Veterinarian",
            description: "For detailed import requirements, the state directs inquiries to the State Veterinarian's office. Specific rules (CVI validity, vaccinations, testing) are established on a case-by-case or species-specific basis.",
            required: true,
            type: "procedure",
            contact: "Dr. Scott Marshall, Deputy Chief of Agriculture/State Veterinarian. Phone: 401-537-4281.",
            appliesTo: ["all"]
        },
        {
            id: "cvi_general_ri",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "A CVI is a standard requirement for interstate animal movement. Rhode Island almost certainly requires one, but the exact specifications must be confirmed via the portal or with the State Veterinarian.",
            required: null, // Must be verified through official channels.
            type: "certificate",
            appliesTo: ["all"]
        },
        {
            id: "federal_baseline_ri",
            name: "Federal Requirements",
            description: "All animals must meet applicable federal interstate movement and importation regulations as a baseline.",
            required: true,
            type: "federal_requirements",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.RhodeIslandPetTravelForm = RhodeIslandPetTravelForm;
    window.RIPetTravelForm = RhodeIslandPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('RI', RhodeIslandPetTravelForm);
    }
})();