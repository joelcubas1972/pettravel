window.BelarusPetTravelForm = {
    countryCode: "BY",
    countryName: "Belarus",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 14,
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: true,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccination_max_20_days",
            name: "Vacuna rabia válida",
            description: "until 5 pets",
            required: true,            
            type: "vaccine",
            appliesto: ["dog", "cat"],            
            price: 70.00
        },
        {
            id: "rosselhoznadzor_import_permit",
            name: "DAPP",
            description: "until 5 pets",
            required: true,
            type: "import_permit",
            appliesto: ["dog"],
            price: 60.00
        },
        {
            id: "laboratory_tests_specific_species",
            name: "Leptospira",
            description: "until 5 pets",
            required: true,
            type: "test",
            appliesto: ["dog"],
            price: 60.00
        },
        {
            id: "transport_cleaning_certification",
            name: "FVRCP",
            description: "until 5 pets",
            required: true,
            type: "transport_requirement",
            appliesto: ["cat"],
            price: 65.00
        },
        {
            id: "transport_cleaning",
            name: "Overnight Shipping Label",
            description: "until 5 pets",
            required: true,
            type: "transport_requirement",
            appliesto: ["dog", "cat"],
            price: 65.00
        }
    ]
};
    if (window.petTravelDB) {
        window.petTravelDB.addCountry('BY', BelarusPetTravelForm);
    }