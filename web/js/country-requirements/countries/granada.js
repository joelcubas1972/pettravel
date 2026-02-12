window.GranadaPetTravelForm = {
    countryCode: "GD",
    countryName: "Granada",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 21,
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: 21,
    requirements: [
        {
            id: "rabies_vaccination",
            name: "Vacuna rabia válida",
            description: "",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],
            price: 70.00
        },
        {
            id: "entry_point_checks_1",
            name: "Import Permit",
            description: "",
            required: true,
            type: "treatment",
            appliesto: ["dog", "cat"],
            price: 25.00
        }
    ]
};

if (window.petTravelDB) {
    window.petTravelDB.addCountry('GD', GranadaPetTravelForm);
}
