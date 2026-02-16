// Datos para Cyprus
window.CyprusPetTravelForm = {
    countryCode: "CY",
    countryName: "Cyprus",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: "",
    requirements: []
};

// Inicialización segura
window.petTravelDB = window.petTravelDB || { database: {} };
if (window.petTravelDB.addCountry) {
    window.petTravelDB.addCountry("CY", window.CyprusPetTravelForm);
}
