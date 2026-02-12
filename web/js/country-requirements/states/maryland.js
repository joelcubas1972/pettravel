const MarylandPetTravelForm = {
    stateCode: "MD",
    stateName: "Maryland",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],  
    isRabbitQuarantineArea: false, 
    requirements: [
        {
            id: "cvi_requirement_md",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "An official health certificate is required. It must be on a form issued/approved by the animal health official of the state of origin or USDA. A hard or electronic copy must be sent to Maryland Animal Health from the state of origin[citation:user].",
            required: true,
            type: "certificate",
            deadline: "Issued within 30 days of entry[citation:user]",
            specialInstructions: "The CVI must include a statement that the animal is free from disease, has not been exposed to rabies in the last 6 months, and does not originate from a rabies-quarantined area[citation:user]. USDA APHIS Form 7001 is not accepted[citation:user].",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_md",
            name: "Rabies Vaccination & Reporting",
            description: "Dogs, cats, and ferrets 4 months or older must be vaccinated with an approved rabies vaccine. The most recent dose must be given MORE than 30 days before arrival in Maryland[citation:8]. A certificate must be sent to the state within 10 days of arrival[citation:8].",
            required: true,
            type: "vaccine",
            details: "The certificate sent to the state must include a description of the animal, vaccine manufacturer/brand, vaccination date(s), and proof of adequate vaccination[citation:8].",
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
            id: "rabies_exposure_ban_md",
            name: "Rabies Exposure & Quarantine Area Ban",
            description: "Animals may NOT originate from an area under quarantine for rabies[citation:user]. Animals suspected of having rabies or exposed to a rabid animal within the previous 6 months may not be imported[citation:user].",
            required: true,
            type: "prohibition",
            appliesTo: ["all"]
        },
        {
            id: "short_stay_exemption_md",
            name: "Short Stay (Less than 30 Days) Exemption",
            description: "Animals brought into Maryland for less than 30 days are exempt from the state rabies reporting requirement, provided a copy of the rabies certificate can be presented to the local health officer if requested[citation:8].",
            required: false,
            type: "exemption",
            condition: "Applies only to visits under 30 days.",
            appliesTo: ["all"]
        },
        {
            id: "federal_requirements_md",
            name: "Federal Requirements (For International Entry)",
            description: "All animals entering the United States are subject to federal import regulations set by the CDC[citation:9] and USDA. These are separate from and in addition to Maryland's state requirements.",
            required: true,
            type: "federal_requirements",
            link: "https://www.cdc.gov/importation/bringing-an-animal-into-the-united-states/index.html",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.MarylandPetTravelForm = MarylandPetTravelForm;
    window.MDPetTravelForm = MarylandPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MD', MarylandPetTravelForm);
    }
})();