window.FranciaPetTravelForm = {
    countryCode: "FR",
    countryName: "Francia",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
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
            description: "Microchip (Fecha implantación",
            required: true,
            type: "identification",
            appliesto: ["dog", "cat"],
            formFields: {
                vaccine_date: {label: "Fecha de implantación", required: true, type: "date"}
            },
            price: 55.00
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
    window.petTravelDB.addCountry('FR', FranciaPetTravelForm);
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
