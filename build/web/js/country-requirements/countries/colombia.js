window.ColombiaPetTravelForm = {
    countryCode: "CO",
    countryName: "Colombia",
    acceptsDigitalSignature: true,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccine",
            name: "Vacuna rabia valida",
            description: "Vacuna contra la rabia vigente",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],
            price: 70.00
        },
        {
            id: "vaccin_days",
            name: "Más 21 dias despues si primo vacunación Rabia",
            description: "Desparasitación contra parásitos interno y externa",
            required: true,
            type: "parasite_treatment",
            appliesto: ["dog"],
            price: 50.00
        },
        {
            id: "parasite_treatment",
            name: "Desparasitación interna y externa",
            description: "Desparasitación contra parásitos interno y externa",
            required: true,
            type: "parasite_treatment",
            appliesto: ["dog", "cat"],
            price: 50.00
        },        
        {
            id: "DAPP",
            name: "DAPP",
            description: "DAPP",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],            
            price: 50.00
        },
        {
            id: "Leptospirosis",
            name: "Leptospira",
            description: "Leptospira",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],            
            price: 45.00
        },
        {
            id: "coronavirus",
            name: "Coronavirus",
            description: "Coronavirus",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],
            price: 45.00
        },
        {
            id: "microchip",
            name: "Microchip",
            description: "Microchip",
            required: true,
            type: "Identification",
            appliesto: ["dog"],
            price: 55.00
        },
        {
            id: "rabies_vaccine_cat",
            name: "Rabies_vaccine",
            description: "Rabies_vaccine",
            required: true,
            type: "vaccine",
            appliesto: ["cat"],
            price: 70.00
        },
        {
            id: "FVRCP",
            name: "FVRCP",
            description: "FVRCP",
            required: true,
            type: "treatment",
            appliesto: ["cat"],
            price: 45.00
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('CO', ColombiaPetTravelForm);
    }
