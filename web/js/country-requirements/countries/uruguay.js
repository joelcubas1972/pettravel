window.UruguayPetTravelForm = {
    countryCode: "UY",
    countryName: "Uruguay",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10, 
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: 30,
    requirements: [
        {
            id: "rabies_vaccination",
            name: "Vacuna rabia válida",
            description: "Más de 21 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],            
            price: 70.00
        },
        {
            id: "travel_evidence",
            name: "Microchip",
            description: "",
            required: true,
            type: "document_requirement",
            appliesto: ["dog", "cat"],
            price: 60.00
        },
        {
            id: "entry_point_checks",
            name: "Desparasitacion interna y externa",
            description: "Desparasitacion 15 dias antes del viaje",
            required: true,
            type: "tretment",
            appliesto: ["dog", "cat"],
            price: 55.00
        },
        {
            id: "entry_point_checks_1",
            name: "Antiechinoccus 1-5 dias antes viajar",
            description: "",
            required: true,
            type: "treatment",
            appliesto: ["dog"],
            price: 25.00
        },
        {
            id: "entry_point_checks_12",
            name: "Test Rabia FAVN menos 0.5 IU",
            description: "",
            required: true,
            type: "treatment",
            appliesto: ["dog"],
            price: 25.00
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('UY', UruguayPetTravelForm);
    }