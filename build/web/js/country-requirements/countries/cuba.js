window.CubaPetTravelForm = {
    cuountryCode: "CU",
    countryName: "Cuba",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "Aphis 7001", 
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccine",
            name: "Vacuna rabia válida",
            description: "Más de 21 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],           
            price: 70.00
        },        
        {
            id: "rabbit_myxomatosis_free",
            name: "microchip",
            description: "microchip",
            required: true,
            type: "identification",
            appliesto: ["dog", "cat"],
            price: 50.00
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
        window.petTravelDB.addCountry('CU', CubaPetTravelForm);
    }