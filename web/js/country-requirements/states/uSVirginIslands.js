const USVirginIslandsPetTravelForm = {
    stateCode: "VI",
    stateName: "U.S. Virgin Islands",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["APHIS 7001"],
    
    isRabiesQuarantineArea: true, // Confiscation and quarantine for non-compliance
    requirements: [
        {
            id: "health_certificate_vi",
            name: "Health Certificate (APHIS 7001 or State ICVI)",
            description: "Official health certificate issued by USDA-accredited veterinarian (Category I or II) within 10 days of arrival in USVI. Certificate must include veterinarian's accreditation number.",
            required: true,
            type: "certificate",
            deadline: "10 days before arrival",
            appliesTo: ["all"],
            specialInstructions: "Email completed certificate to veterinaryservices@doa.vi.gov prior to arrival. Corporate or business health certificates NOT accepted."
        },
        {
            id: "rabies_vaccine_vi",
            name: "Rabies Vaccination Certificate",
            description: "Current rabies vaccination required for all dogs and cats. Certificate must include: date of vaccination, product used, and lot number. 3-year vaccines accepted if product label indicates.",
            required: true,
            type: "vaccine",
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
            id: "age_requirement_vi",
            name: "Minimum Age Requirement",
            description: "Dogs and cats must be at least 12 weeks old to enter USVI. Animals too young for rabies vaccination will not be allowed entry.",
            required: true,
            appliesTo: ["all"],
            type: "age_restriction"
        },
        {
            id: "rabies_titer_vi",
            name: "Rabies Titer Test (Alternative)",
            description: "Adequate rabies antibody titer on FAVN test within 12 months of travel can substitute for current vaccination.",
            required: false,
            type: "test",
            appliesTo: ["dog", "cat", "ferret"],
            condition: "Alternative to current vaccination",
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
            id: "recommended_vaccines_vi",
            name: "Recommended Vaccines & Prevention",
            description: "Leptospirosis vaccine recommended for dogs. Flea/tick/heartworm prevention recommended for all dogs and cats.",
            required: false,
            appliesTo: ["dog", "cat"],
            type: "recommendation",
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
            id: "quarantine_warning_vi",
            name: "Quarantine Warning for Non-Compliance",
            description: "Animals without current rabies vaccination, adequate titer, or proper documentation will be CONFISCATED and quarantined for minimum 10 days at owner's expense. USVI government assumes no liability.",
            required: true,
            type: "warning",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "travel_restriction_vi",
            name: "Travel Origin Restriction",
            description: "These requirements apply ONLY to travel directly from U.S. mainland or Puerto Rico. Different requirements apply for international travel, cruise ships, or private boats.",
            required: true,
            type: "restriction",
            validOrigins: ["U.S. Mainland", "Puerto Rico"],
            appliesTo: ["all"]
        },
        {
            id: "international_requirements_vi",
            name: "International Import Requirements",
            description: "For animals originating outside U.S. or Puerto Rico: subject to USVI regulations PLUS USDA APHIS federal regulations. Requires import permit.",
            required: false,
            type: "federal_requirements",
            condition: "Only for international travel",
            contact: "David Wenger, DVM - david.wenger@doa.vi.gov",
            appliesTo: ["all"]
        },
        {
            id: "other_species_vi",
            name: "Other Animal Species",
            description: "Different requirements apply for species other than dogs and cats. Contact Veterinary Services for specific regulations.",
            required: false,
            type: "species_specific",     
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.USVirginIslandsPetTravelForm = USVirginIslandsPetTravelForm;
    window.VIPetTravelForm = USVirginIslandsPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('VI', USVirginIslandsPetTravelForm);
    }
})();