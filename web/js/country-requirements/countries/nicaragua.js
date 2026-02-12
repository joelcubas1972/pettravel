window.NicaraguaPetTravelForm = {
    countryCode: "NI",
    countryName: "Nicaragua",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 15, 
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccination_current",
            name: "Vacuna antirrábica vigente",
            description: "Vacuna antirrábica vigente ",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],
            price: 70.00
        },
        {
            id: "desparas. int ext",
            name: "Desparasitación interna y externa",
            description: "Desparasitación interna y externa",
            required: true,         
            type: "permit",
            appliesto: ["dog", "cat"],
            price: 30.00
        },
        {
            id: "Overnihgt",
            name: "Overnight Shipping Label",
            description: "Overnihgt Shipping Label",
            required: true,
            type: "document_exemption",
            appliesto: ["dog", "cat"],
            price: 25.00 //El precio sera en doláres
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('NI', NicaraguaPetTravelForm);
    }
