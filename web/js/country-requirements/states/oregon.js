const OregonPetTravelForm = {
    stateCode: "OR",
    stateName: "Oregon",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "database_check_requirement_or",
            name: "Mandatory Use of Import Requirements Database",
            description: "The Oregon Department of Agriculture requires all importers to use their official online database to determine the exact requirements for their specific animal species and type of movement.",
            required: true,
            type: "procedure",            
            appliesTo: ["all"]
        },
        {
            id: "import_permit_process_or",
            name: "Import Permit Process",
            description: "Oregon requires import permits for many animals. These permits can ONLY be applied for and issued to accredited veterinarians, not directly to animal owners.",
            required: false, 
            type: "permit",
            condition: "For species and movements that require a permit.",            
            appliesTo: ["all"]
        },
        {
            id: "cvi_general_or",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "A CVI is a common requirement for interstate movement. Oregon likely requires one for most livestock and companion animals, but the specifics (validity period, tests) are determined by the database.",
            required: null, 
            type: "certificate",
            appliesTo: ["all"]
        },
        {
            id: "federal_baseline_or",
            name: "Federal Requirements as Baseline",
            description: "All animals must meet federal interstate movement guidelines. Oregon's state requirements are in addition to these federal rules.",
            required: true,
            type: "federal_requirements",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.OregonPetTravelForm = OregonPetTravelForm;
    window.ORPetTravelForm = OregonPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('OR', OregonPetTravelForm);
    }
})();