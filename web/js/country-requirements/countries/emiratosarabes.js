window.EmiratosarabesPetTravelForm = {
    countryCode: "AE",
    countryName: "Emiratos Arabes Unidos",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10, 
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: 30,
    requirements: [
        {
            id: "microchip_iso_ae",
            name: "Microchip",
            description: "Microchip",
            required: true,
            type: "identification",
            appliesto: ["dog"],
            price: 45.00
        },
        {
            id: "rabies_vaccination_ae",
            name: "Vacuna rabia válida",
            description: "Más de 21 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],           
            price: 70.00
        },
        {
            id: "rabies_vaccination_ae1t",
            name: "Vacuna rabia válida",
            description: "",
            required: true,
            type: "vaccine",
            appliesto: ["cat"],           
            price: 70.00
        },
        {
            id: "rabies_vaccination_ae1",
            name: "Test Rabia FAVN menos 0.5 IU",
            description: "",
            required: true,
            type: "test",
            appliesto: ["dog"],           
            price: 70.00
        },
        {
            id: "No_q",
            name: "No razas peligrosas",
            description: "",
            required: true,
            type: "health_test",            
            appliesto: ["dog"],
            price: 50.00
        },
        {
            id: "despa_test_ae",
            name: "Desparasitación interna y externa",
            description: "",
            required: true,
            type: "health_test",            
            appliesto: ["dog", "cat"],
            price: 50.00
        },
        {
            id: "parasite_treatments_ae",
            name: "Coronavirus",
            description: "",
            required: true,
            type: "parasite_treatment",
            appliesto: ["dog"],
            price: 45.00
        },
        {
            id: "species_specific_vaccines_cat_ae",
            name: "DAPP",
            description: "DAPP",
            required: true,           
            type: "treatment",
            appliesto: ["dog"],
            price: 65.00
        },
        {
            id: "species_specific_vaccines_catpog",
            name: "FVRCP",
            description: "",
            required: true,
            type: "treatment",
            appliesto: ["cat"],
            price: 65.00
        },
        {
            id: "Permiso",
            name: "Import Permit",
            description: "",
            required: true,
            type: "document",
            appliesto: ["dog"],
            price: 65.00
        },
        {
            id: "species_specific_vaccines_catpogq",
            name: "Overnight Shipping Label",
            description: "Overnight Shipping Label (2 gatos o 2 perros)",
            required: true,
            type: "document",
            appliesto: ["dog", "cat"],
            price: 25.00
        }
    ]
};


    if (window.petTravelDB) {
        window.petTravelDB.addCountry('AE', EmiratosarabesPetTravelForm);
    }