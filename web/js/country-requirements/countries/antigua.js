window.AntiguaPetTravelForm = {
    countryCode: "AG",
    countryName: "Antigua y Barbuda",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    endorsementRequired: false,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [        
        {
            id: "rabies_vaccine",
            name: "Vacuna rabia válida",
            description: "Más de 30 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],            
            price: 70.00
        },
        {
            id: "rabies_vaccine_cat",
            name: "Vacuna rabia válida",
            description: "",
            required: true,
            type: "vaccine",
            appliesto: ["cat"],            
            price: 70.00
        },
        {
            id: "microchip_iso",
            name: "Microchip compatible ISO",
            description: "Microchip compatible con ISO 11784/11785",
            required: true,
            type: "microchip",
            appliesto: ["dog"],
            price: 4.00
        },
        {
            id: "favn_test",
            name: "Test Rabia FAVN menos 0.5 IU",
            description: "Test Rabia FAVN menos 0.5 IU",
            required: true,
            type: "test",
            appliesto: ["dog"],
            price: 65.00
        },
        {
            id: "heartworm_test",
            name: "Desparasitacion interna y externa",
            description: "Desparasitación 7 días antes del viaje",
            required: true,
            type: "test",
            appliesto: ["dog"],
            price: 55.50 
            
        },
        {
            id: "tick_treatment",
            name: "FIV/Leuk test",
            description: "FIV/Leuk test",
            required: true,
            type: "parasite_treatment",
            appliesto: ["dog", "cat"],
            price: 65.00
        },
        {
            id: "tapeworm_treatment",
            name: "FVRCP",
            description: "FVRCP",
            required: true,
            type: "parasite_treatment",
            appliesto: ["cat"],
            price: 55.00
        },
        {
            id: "veterinary_inspection",
            name: "Leukemia",
            description: "Leukemia",
            required: true,
            type: "inspection",
            appliesto: ["cat"]
        },
        {
            id: "razas_inspection",
            name: "No razas peligrosas",
            description: "Prohibido trasladar razas peligrosas",
            required: true,
            type: "inspection",
            appliesto: ["dog"]
        },
        {
            id: "entry_point_checks_1",
            name: "Overnight Shipping Label",
            description: "Overnight Shipping Label",
            required: true,
            type: "treatment",
            appliesto: ["dog", "cat"],
            price: 25.00
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('AG', AntiguaPetTravelForm);
    }
// ✅ CORREGIDO: Espera a que petTravelDB exista
(function ensurePetTravelDB() {
    if (window.petTravelDB && typeof window.petTravelDB.addCountry === 'function') {
        if (window.SpainPetTravelForm) {
            window.petTravelDB.addCountry(window.SpainPetTravelForm.countryCode, window.SpainPetTravelForm);
        }
    } else {
        setTimeout(ensurePetTravelDB, 50);
    }
})();
