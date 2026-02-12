const WashingtonPetTravelForm = {
    stateCode: "WA",
    stateName: "Washington State",
    acceptsDigitalSignature: true,
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"],
    isRabiesQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_wa",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "A health certificate issued by an accredited veterinarian is required for the importation of most animals into Washington State.",
            required: true,
            type: "certificate",
            reference: "WAC 16-54-030",
            appliesTo: ["all"]
        },
        {
            id: "entry_permit_wa",
            name: "Entry Permit",
            description: "An entry permit from the Washington State Department of Agriculture may be required in addition to the CVI for certain animals or situations.",
            required: false,
            type: "permit",
            appliesTo: ["all"]

        },
        {
            id: "physical_address_wa",
            name: "Physical Address Requirement",
            description: "The CVI and any permits must list the physical destination address (street address) of where the animal will be located in Washington, not just a P.O. Box.",
            required: true,
            type: "verification",
            appliesTo: ["all"]

        },
        {
            id: "pets_requirement_wa",
            name: "Dogs, Cats, and Ferrets",
            description: "Specific importation and testing requirements for common pet species. The core requirements are a CVI and proof of current rabies vaccination for dogs, cats, and ferrets.",
            required: true,
            type: "species_regulations",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "livestock_general_wa",
            name: "General Livestock Requirements",
            description: "All livestock must be transported in a sanitary manner and are subject to inspection and quarantine if necessary.",
            required: true,
            type: "health_and_transport",
            appliesTo: ["livestock"],
            reference: "WAC 16-54-025, 16-54-060"
        },
        {
            id: "prohibited_restricted_wa",
            name: "Prohibited and Restricted Entries",
            description: "The importation of certain animals or animals from specific disease areas is prohibited or restricted.",
            required: true,
            type: "restriction",
            appliesTo: ["all"]
        },
        {
            id: "species_specific_wa",
            name: "Detailed Species-Specific Rules",
            description: "Washington has extensive, separate chapters of rules for different animal groups. Each has unique testing, certification, and sometimes permit requirements.",
            required: true,
            type: "species_regulations",
            appliesTo: ["all"]
        }
    ]
};

(function () {
    window.WashingtonPetTravelForm = WashingtonPetTravelForm;
    window.WAPetTravelForm = WashingtonPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('WA', WashingtonPetTravelForm);
    }
})();