window.VenezuelaPetTravelForm = {
    countryCode: "VE",
    countryName: "Venezuela",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: 14,
    requirements: [        
        {
            id: "rabies_vaccine_dogs",
            name: "Vacuna rabia válida",
            description: "Más de 30 dias después si primo vacunación Rabia",
            required: true,            
            type: "vaccine",
            appliesto: ["dog"],            
            price: 70.00
        },
        {
            id: "rabies_vaccine_cats",
            name: "Vacuna rabia válida",
            description: "Vacuna rabia válida",
            required: true,            
            type: "vaccine",
            appliesto: ["cat"],            
            price: 70.00
        },
        {
            id: "dog_vaccines_combo",
            name: "DAPP",
            description: "DAPP",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],           
            price: 60.00
        },
        {
            id: "dog_vaccines_combo2",
            name: "Leptospirosis",
            description: "Leptospirosis",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],            
            price: 60.00
        },
        {
            id: "desparasitacion interna y externa 15 dias.",
            name: "Desparasitacion interna y externa.",
            description: "Desparasitación 15 días antes del viaje",
            required: true,            
            type: "treatment",
            appliesto: ["dog", "cat"],            
            price: 40.00
        },
        {
            id: "pet_identification",
            name: "Microchip",
            description: "Microchip",
            required: true,
            type: "identification",
            appliesto: ["dog"],
            price: 50.00
        },
        {
            id: "cat_vaccines_combo",
            name: "FVRCP",
            description: "FVRCP.",
            required: true,
            type: "vaccine",
            appliesto: ["cat"],            
            price: 65.00
        },     
        {
            id: "Overnihgt",
            name: "Overnight Shipping Label",
            description: "Overnihgt Shipping Label",
            required: true,
            type: "document_exemption",
            appliesto: ["dog", "cat"],
            price: 25.00 
        }
    ]    
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('VE', VenezuelaPetTravelForm);
    }