window.ReinounidoPetTravelForm = {
    countryCode: "GB",
    countryName: "Reino Unido (Gran Bretaña, Islas del Canal, Isla de Man)",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10, 
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: 30,
    requirements: [
        {
            id: "rabies_vaccination",
            name: "Vacuna rabia válida",
            description: "Más de 21 dias después si primo vacunación Rabia. First vaccine only 1 year",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],            
            price: 70.00
        },
        {
            id: "travel_evidence",
            name: "Microchip",
            description: "Microchip (Especificar fecha de implantacion",
            required: true,
            type: "document_requirement",
            formFields: {                
                vaccine_date: {label: "Fecha de implantación", required: true, type: "date"}               
            },
            appliesto: ["dog", "cat"],
            price: 60.00
        },
        {
            id: "entry_point_checks",
            name: "Antiechinoccus 1-5 dias antes viajar",
            description: "Antiechinococus tratamiento 1-5 dias antes del viaje",
            required: true,
            type: "tretment",
            appliesto: ["dog", "cat"],
            price: 55.00
        },
        {
            id: "entry_point_checks_1",
            name: "Overnight Shipping Label",
            description: "Overnight Shipping Label",
            required: true,
            type: "treatment",
            appliesto: ["dog", "cat"],
            price: 25.00
        }
    ]
};
    
    if (window.petTravelDB) {
        window.petTravelDB.addCountry('GB', ReinounidoPetTravelForm);
    }
