window.CostaricaPetTravelForm = {
    countryCode: "CR",
    countryName: "Costa Rica",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 15,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: 10,
    requirements: [        
        {
            id: "rabies_vaccination_cr",
            name: "Vacunación Antirrábica",
            description: "Más de 21 dias después si primo vacunación Rabia",
            required: true,
            condition: "age_months >= 3",
            type: "vaccine",
            appliesto: ["dog", "cat"],
            formFields: {
                vaccine_name: {label: "Lote", required: true, type: "text"},              
                vet_name: {label: "Marca", required: true, type: "text"},
                vet_license: {label: "Compañía manufacturera", required: true, type: "text"}                
            },
            price: 70.00
        },
        {
            id: "species_specific_vaccines_dog",
            name: "DAPP",
            description: "DAPP.",
            required: true,            
            type: "vaccine",
            appliesto: ["dog"],            
            price: 55.00
        },
        {
            id: "species_specific_vaccines_cat",
            name: "Leptospirosis.",
            description: "Leptospirosis.",
            required: true,            
            type: "vaccine",
            appliesto: ["dog"],           
            price: 45.00
        },
        {
            id: "FVRCP",
            name: "FVRCP",
            description: "FVRCP",
            required: true,            
            type: "vaccine",
            appliesto: ["cat"],            
            price: 70.00
        },
        {
            id: "desparasitacion interna y externa cat",
            name: "Desparasitacion interna y externa",
            description: "Desparasitación 15 días antes del viaje",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],
            price: 50.00
        },
        {
            id: "micro",
            name: "Microchip.",
            description: "Microchip.",
            required: true,            
            type: "identification",
            appliesto: ["dog"],
            price: 55.00
        }
        
    ]
};


    if (window.petTravelDB) {
        window.petTravelDB.addCountry('CR', CostaricaPetTravelForm);
    }
