const NebraskaPetTravelForm = {
    stateCode: "NE",
    stateName: "Nebraska",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: null, 
    airlineModelRequirements: ["OCVI"],
   
    isRabbitQuarantineArea: false, // Not mentioned.
    requirements: [
        {
            id: "import_permit_ne",
            name: "Pre-Entry Import Permit",
            description: "A permit number from the NDA is required BEFORE the import of most livestock. This requirement is WAIVED if an approved electronic Certificate of Veterinary Inspection (eCVI) is used.",
            required: true,
            type: "permit",
            condition: "For livestock. Requirement waived with approved eCVI.",
            specialInstructions: "Permits can be obtained through the Nebraska Permitting System. Register using the 'Nebraska Permitting System Registration Form.'",
            appliesTo: ["all"]
        },
        {
            id: "cvi_requirement_ne",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "An official CVI is required for animal importation. For exhibition, animals must be examined for Vesicular Stomatitis within 48 hours of import, and this must be stated on the CVI.",
            required: true,
            type: "certificate",
            appliesTo: ["all"]
        },
        {
            id: "az_vs_statement_ne",
            name: "Arizona Origin VS Statement",
            description: "For all livestock and horses originating from Arizona, the CVI must include a specific statement verifying the animals are not from a VS-quarantined area and show no signs of Vesicular Stomatitis.",
            required: false,
            type: "statement",
            condition: "Only for animals originating from Arizona.",
            appliesTo: ["all"]
        },
        {
            id: "dairy_import_order_ne",
            name: "Special Order: Breeding Female Dairy Cattle",
            description: "An active importation order requires ALL breeding female dairy cattle entering Nebraska to obtain an NDA permit prior to entry. This order is in effect until February 28, 2026.",
            required: true,
            type: "special_order",
            condition: "For breeding female dairy cattle only.",
            specialInstructions: "More details can be found via the provided link on the NDA site.",
            appliesTo: ["all"]
        },
        {
            id: "eecvi_ban_ne",
            name: "EECVI Not Accepted",
            description: "Due to an Equine Herpes Myeloencephalopathy (EHM) incident, Nebraska is currently NOT accepting Extended Equine Certificates of Veterinary Inspection (EECVIs).",
            required: false,
            type: "prohibition",
            condition: "Applies to equine imports.",
            specialInstructions: "Standard CVIs are still required.",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.NebraskaPetTravelForm = NebraskaPetTravelForm;
    window.NEPetTravelForm = NebraskaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('NE', NebraskaPetTravelForm);
    }
})();