window.HondurasPetTravelForm = {
    countryCode: "HN",
    countryName: "Honduras",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    endorsementRequired: false,
    formModel: "Aphis 7001",
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "microchip_iso_nl",
            name: "Microchip",
            description: "",
            required: true,
            type: "identification",
            appliesto: ["dog", "cat"]
        },
        {
            id: "rabies_vaccination_nl",
            name: "Vacuna rabia válida",
            description: "",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"]
        }
    ]
};
    if (window.petTravelDB) {
        window.petTravelDB.addCountry('HN', HondurasPetTravelForm);
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
