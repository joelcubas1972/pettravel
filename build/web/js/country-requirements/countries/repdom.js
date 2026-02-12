window.RepdomPetTravelForm = {
    countryCode: "DO",
    countryName: "República Dominicana",
    acceptsDigitalSignature: true,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: 10,
    requirements: [
        {
            id: "rabies_vaccination",
            name: "Vacuna rabia válida",
            description: "Más de 30 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],            
            price: 70.00
        }
    ]
};
    if (window.petTravelDB) {
        window.petTravelDB.addCountry('DO', RepdomPetTravelForm);
    }