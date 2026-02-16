window.UzbekistanPetTravelForm = {
    cuountryCode: "UZ",
    countryName: "Uzbekistan",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    endorsementRequired: true,
    formModel: "OCVI", 
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccine",
            name: "Vacuna rabia válida",
            description: "Más de 21 dias después si primo vacunación Rabia",
            required: true,
            type: "vaccine",
            appliesto: ["dog"],
            formFields: {            
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                clinic_name: {label: "Marca", required: true, type: "text"},
                clinic_address: {label: "Compañía manufacturera", required: true, type: "text"}
            },
            price: 70.00
        }, 
        {
            id: "rabies_vaccine_cat",
            name: "Vacuna rabia válida",
            description: "",
            required: true,
            type: "vaccine",
            appliesto: ["cat"],
            formFields: {            
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                clinic_name: {label: "Marca", required: true, type: "text"},
                clinic_address: {label: "Compañía manufacturera", required: true, type: "text"}
            },
            price: 70.00
        },
        {
            id: "rabbit_myxomatosis_free",
            name: "microchip",
            description: "microchip",
            required: true,
            type: "identification",
            appliesto: ["dog"],
            price: 50.00
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
        window.petTravelDB.addCountry('UZ', UzbekistanPetTravelForm);
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
