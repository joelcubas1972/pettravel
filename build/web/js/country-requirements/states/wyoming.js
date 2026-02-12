const WyomingPetTravelForm = {
    stateCode: "WY",
    stateName: "Wyoming",
    acceptsDigitalSignature: null, 
    daysBeforeTravelForForm: null, 
    airlineModelRequirements: ["OCVI"],    
    isRabiesQuarantineArea: false, 
    requirements: [
        {
            id: "import_regulations_chapter_wy",
            name: "Official Import Regulations (Chapter 8)",
            description: "The primary source for all animal import requirements into Wyoming. Contains species-specific rules.",
            required: true,
            type: "regulation_link",
            reference: "Wyoming Livestock Board Rules, Chapter 8: Import Regulations",
            instructions: "MUST CONSULT for accurate, official rules. Do not rely on summaries alone.",
            appliesTo: ["all"]
        },
        {
            id: "livestock_focus_wy",
            name: "Livestock Health Focus",
            description: "Wyoming's core import regulations address key livestock diseases with significant economic impact.",
            required: true,
            type: "disease_management",
            appliesTo: ["all"]           
        },
        {
            id: "news_alert_oct2025_wy",
            name: "New Import Rules (October 2025)",
            description: "Import regulations were updated in October 2025. It is critical to use the current version of Chapter 8.",
            required: true,
            type: "update_notice",
            date: "October 2025",
            instructions: "Verify all information against the post-October 2025 rules.",
            appliesTo: ["all"]
        },
        {
            id: "cvi_assumption_wy",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "While not explicitly stated for all species in the snippet, a CVI is a standard requirement for the interstate movement of livestock and many other animals into most states, including Wyoming.",
            required: true,
            type: "assumed_certificate",
            condition: "Almost certainly required for livestock, likely for many other animals.",
            specialInstructions: "Confirmed in Chapter 8. Required information may include official ID, tests, and origin statements.",
            appliesTo: ["all"]
        },
        {
            id: "cattle_quick_guide_wy",
            name: "Cattle, Bison, Yak: Quick Look Guide",
            description: "The WLSB provides a quick-reference guide for importing cattle, bison, and yak.",
            required: true,
            type: "species_specific_guide",
            appliesTo: ["cattle", "bison", "yak"],
            link: "Cattle Bison and Yak: Quick look at Import Requirements"
        },
        {
            id: "pets_requirement_wy",
            name: "Dogs and Cats (Pets)",
            description: "This Animal Health Unit page does not list specific entry requirements for dogs and cats. They may be covered under Chapter 8 or may have minimal requirements (e.g., rabies vaccination).",
            required: false, 
            type: "unclear",
            specialInstructions: "VERIFICATION REQUIRED. Contact the Animal Health Unit. Do not assume no rules apply.",
            appliesTo: ["dog", "cat"]
        },
        {
            id: "disease_alerts_wy",
            name: "Active Disease Alerts & News",
            description: "Wyoming has active incidents of nationally significant animal diseases. These may trigger temporary additional import restrictions.",
            required: true,
            type: "alert",
            appliesTo: ["all"]            
        },
        {
            id: "reportable_diseases_wy",
            name: "Reportable Disease List",
            description: "A veterinarian or owner must report suspected cases of listed diseases to the State Veterinarian within 24 hours. This affects animals already in Wyoming.",
            required: true,
            type: "legal_obligation",            
            appliesTo: ["all"]
        },
        {
            id: "interstate_livestock_resource_wy",
            name: "InterstateLivestock.com Resource",
            description: "The WLSB directs the public to this third-party site for livestock requirement summaries.",
            required: false,
            type: "third_party_reference",
            appliesTo: ["all"],
            link: "https://interstatelivestock.com",
            note: "A helpful guide, but the official Chapter 8 rules are controlling."
        }
    ]
};

(function() {
    window.WyomingPetTravelForm = WyomingPetTravelForm;
    window.WYPetTravelForm = WyomingPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('WY', WyomingPetTravelForm);
    }
})();