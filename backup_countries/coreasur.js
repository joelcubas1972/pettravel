window.CoreasurPetTravelForm = {
    countryCode: "KR",
    countryName: "Corea del Sur",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 30,
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "microchip_iso_ae",
            name: "Microchip",
            description: "",
            required: true,
            type: "identification",
            appliesto: ["dog", "cat"],
            price: 45.00
        },
        {
            id: "rabies_vaccination_ae",
            name: "Vacuna rabia válida",
            description: "Más de 30 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],            
            price: 70.00
        },
        {
            id: "rabies_titer_test_ae",
            name: "Test Rabia FAVN menos 0.5 IU",
            description: "",
            required: true,
            type: "health_test",            
            appliesto: ["dog", "cat"],
            price: 50.00
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
        window.petTravelDB.addCountry('KR', CoreasurPetTravelForm);
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
