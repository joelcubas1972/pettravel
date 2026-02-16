window.EcuadorPetTravelForm = {
    countryCode: "EC",
    countryName: "Ecuador",
    acceptsDigitalSignature: true,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccination_ec",
            name: "Vacuna rabia válida",
            description: "Más de 14 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],
            price: 70.00
        },
        {
            id: "DAPP",
            name: "DAPP",
            description: "DAPP.",
            required: true,           
            type: "vaccine",
            appliesto: ["dog", "cat"],
            price: 55.00
        },
        {
            id: "Leptospirosis",
            name: "Leptospira",
            description: "Leptospira",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],
            price: 45.00
        },
        {
            id: "desparasitacion interna y externa",
            name: "Desparasitacion interna y externa",
            description: "Desp. 21 días antes del viaje, 3 meses edad",
            required: true,
            type: "treatment",
            appliesto: ["dog", "cat"],
            price: 45.00
        }
    ]
};


    if (window.petTravelDB) {
        window.petTravelDB.addCountry('EC', EcuadorPetTravelForm);
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
