const MontanaPetTravelForm = {
    stateCode: "MT",
    stateName: "Montana",
    acceptsDigitalSignature: false,
    daysBeforeTravelForForm: null,
    airlineModelRequirements: ["OCVI"],
    isRabbitQuarantineArea: false,
        requirements: [
            {
                id: "health_certificate_travel_mt",
                name: "Official Health Certificate (CVI)",
                description: "A health certificate issued by an accredited veterinarian in the state of origin is required[citation:1]. The certificate must attest the animal is free from evidence of infectious, contagious, communicable, or parasitic disease and has not been exposed to such diseases[citation:1].",
                required: true,
                type: "certificate",
                appliesTo: ["all"]
            },
            {
                id: "rabies_vaccine_travel_mt",
                name: "Official Rabies Vaccination",
                description: "The animal must be officially vaccinated against rabies by a licensed veterinarian, following the latest U.S. Public Health Compendium guidelines[citation:1]. The health certificate must identify the animal by the date of vaccination and the serial number of the vaccine and tag[citation:1].",
                required: true,
                type: "vaccine",
                exception: "Puppies and kittens under three months of age are exempt from the rabies vaccine requirement[citation:1].",
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
                id: "health_certificate_sale_mt",
                name: "Official Health Certificate (CVI)",
                description: "Required. Must be issued by an accredited veterinarian and meet all criteria for health and vaccination status.",
                required: true,
                type: "certificate",
                appliesTo: ["all"]
            },
            {
                id: "rabies_vaccine_sale_mt",
                name: "Official Rabies Vaccination",
                description: "Required for animals three months and older, as per the standard rule.",
                required: true,
                type: "vaccine",
                appliesTo: ["all"]
            },

            {
                id: "requirements_shelter_mt",
                name: "Compliance with All Entry Requirements",
                description: "Animals transferred by shelters or rescues must meet all standard Montana import requirements for dogs and cats, including health certificate and rabies vaccination.",
                required: true,
                type: "general",
                appliesTo: ["all"]
            },
          {
            id: "quarantine_area_ban_mt",
            name: "Ban on Animals from Rabies-Quarantine Areas",
            description: "Dogs and cats from any area under a federal, state, county, or municipal rabies quarantine are prohibited from entering Montana[citation:1].",
            required: true,
            type: "prohibition",
            exception: "Entry may be allowed only with an advance permit issued by the Montana State Veterinarian before shipment[citation:1].",
            appliesTo: ["dog", "cat"]
        },
        {
            id: "federal_requirements_mt",
            name: "Federal Requirements (For Specific Cases)",
            description: "The USDA APHIS does not regulate the interstate movement of pets by their owners; requirements are set by the destination state[citation:2]. However, APHIS regulates businesses that transport pets, and different federal rules apply for importing dogs for resale or adoption[citation:2][citation:4].",
            required: false,
            type: "federal_requirements",
            appliesTo: ["all"]
        }
    ]
};

(function () {
    window.MontanaPetTravelForm = MontanaPetTravelForm;
    window.MTPetTravelForm = MontanaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MT', MontanaPetTravelForm);
    }
})();