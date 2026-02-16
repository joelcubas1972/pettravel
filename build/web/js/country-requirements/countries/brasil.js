window.BrasilPetTravelForm = {
    countryCode: "BR",
    countryName: "Brasil",
    acceptsDigitalSignature: true,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: 60,
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
            id: "microchip_optional",
            name: "Microchip",
            description: "Microchip",
            required: true,
            type: "microchip",
            appliesto: ["dog", "cat"],
            price: 45.00
        },
        {
            id: "distemper_vaccine",
            name: "Desparasitacion interna y externa",
            description: "Desparasitación 15 días antes del viaje",
            required: true,
            type: "treatment",
            appliesto: ["dog", "cat"],
            price: 65.00
        },
        {
            id: "transito_vaccine",
            name: "Mercosur free transit",
            description: "Mercosur tránsito libre",
            required: true,
            type: "treatment",
            appliesto: ["dog", "cat"],
            price: 65.00
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('BR', BrasilPetTravelForm);
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
