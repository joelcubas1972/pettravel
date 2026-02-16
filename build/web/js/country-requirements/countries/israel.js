window.IsraelPetTravelForm = {
    countryCode: "IL",
    countryName: "Israel",
    acceptsDigitalSignature: true,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccination",
            name: "Vacuna rabia válida",
            description: "Más de 30 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],            
            price: 70.00
        },
        {
            id: "iso_microchip",
            name: "Microchip",
            description: "Microchip.",
            required: true,
            type: "identification",
            appliesto: ["dog", "cat"],
            price: 55.00
        },      
        {
            id: "test_breed_ban",
            name: "Test Rabia FAVN menos 0.5 IU",
            description: "Test Rabia FAVN menos 0.5 IU",
            required: true,
            type: "breed_restriction",
            appliesto: ["dog", "cat"],
            price: 45.00
        },      
        {
            id: "dangerous_breed_ban",
            name: "No razas peligrosas",
            description: "No se admiten razas peligrosas",
            required: true,
            type: "breed_restriction",
            appliesto: ["dog", "cat"],
            price: 45.00
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('IL', IsraelPetTravelForm);
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
