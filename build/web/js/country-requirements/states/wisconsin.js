const WisconsinPetTravelForm = {
    stateCode: "WI",
    stateName: "State of Wisconsin",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 10, 
    validityPeriodForForm: 30, 
    airlineModelRequirements: ["OCVI"],    
    isRabiesQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_wi",
            name: "Certificate of Veterinary Inspection (CVI / Health Certificate)",
            description: "Required for ALL animals imported into Wisconsin, with very few exceptions. Must be issued by a licensed veterinarian within 10 days of examination and is valid for 30 days from the exam date.",
            required: true,
            type: "certificate",
            deadline: "Issued within 10 days of vet exam",
            validity: "30 days from date of vet exam",
            reference: "Federal law & WI admin code",
            appliesTo: ["all"]
        },
        {
            id: "cvi_exemptions_wi",
            name: "CVI Exemptions",
            description: "Specific scenarios where a CVI is NOT required for import.",
            required: false,
            type: "exemption",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_wi",
            name: "Import Permit",
            description: "Required for certain imports in addition to the CVI. The permit application and a copy of the CVI must be faxed or emailed to the import coordinator. Permits are only issued during business hours (M-F, 7:45 AM - 4 PM CT); plan ahead.",
            required: false, 
            type: "permit",
            appliesTo: ["all"]
        },
        {
            id: "pets_requirement_wi",
            name: "Household and Exotic Pets",
            description: "Pets (e.g., dogs, cats, exotic pets) are subject to the general CVI requirement. Species-specific disease testing or vaccination rules may apply.",
            required: true,
            type: "species_regulations",
            appliesTo: ["dog", "cat", "exotic_pet"]
        },
        {
            id: "prohibited_species_wi",
            name: "Prohibited Species",
            description: "The following species are known carriers of highly contagious diseases and may NOT be imported into Wisconsin under any circumstances.",
            required: true,
            type: "restriction",
            appliesTo: ["all"]
        },
        {
            id: "restricted_wildlife_wi",
            name: "Restricted Native & Wild Animals",
            description: "Importation of native wild species or animals classified as 'harmful wild animals' by the WI DNR requires prior approval from the Wisconsin Department of Natural Resources (WDNR).",
            required: true,
            type: "permit",
            condition: "For native wild species and DNR-classified harmful wild animals.",
            authority: "Wisconsin Department of Natural Resources (WDNR)",
            instructions: "Contact WDNR for approval before attempting import.",
            appliesTo: ["all"]
        },
        {
            id: "testing_requirement_wi",
            name: "Disease Testing Requirement",
            description: "If tests are required for movement, results must be final and current. Animals tested for a reportable disease cannot be sold, moved, or disposed of until results are known.",
            required: true,
            type: "test",
            condition: "When specific tests are required for the species.",
            rule: "No movement with 'pending' or out-of-date test results.",
            appliesTo: ["all"]
        },
        {
            id: "species_specific_wi",
            name: "Species-Specific Information",
            description: "Wisconsin provides detailed entry requirements for numerous animal categories. The core CVI requirement applies to all, but additional rules exist.",
            required: true,
            type: "species_regulations",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.WisconsinPetTravelForm = WisconsinPetTravelForm;
    window.WIPetTravelForm = WisconsinPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('WI', WisconsinPetTravelForm);
    }
})();