window.ChilePetTravelForm = {
    countryCode: "CL",
    countryName: "Chile",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: 10,
    requirements: [
        {
            id: "rabies_vaccination_cl",
            name: "Vacuna rabia válida",
            description: "Más de 21 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],
            price: 70.00
        },
        {
            id: "antiparasitic_treatment_cl",
            name: "Desparasitación interna y externa",
            description: "Desparasitación interna y externa",
            required: true,
            type: "parasite_treatment",
            timing: "5-30 días antes del ingreso",
            appliesto: ["dog", "cat"],
            price: 55.00
        }
    ]
};


    if (window.petTravelDB) {
        window.petTravelDB.addCountry('CL', ChilePetTravelForm);
    }
