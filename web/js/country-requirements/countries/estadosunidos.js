window.EstadosunidosPetTravelForm = {
    countryCode: "US",
    countryName: "Estadosunidos",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 30,
    endorsementRequired: true,
    formModel: "OCVI",
    transitCountries: false,
    certificateValidityDays: "",
    requirements: [
        {
            id: "rabies_vaccine",
            name: "Vacuna rabia válida",
            description: "Edad minima 6 meses, valid until rabies expire (1-3 year)",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat"],
            formFields: {
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_license: {label: "Marca", required: true, type: "text"},
                clinic_name: {label: "Compañía manufacturera", required: true, type: "text"},
                clinic_address: {label: "Fecha de expiración", required: true, type: "date"}
            },
            price: 70.00
        },
        {
            id: "microchip1",
            name: " Información de vacuna rabia de los ultimos 3 años, fecha estimada retorno",
            description: "Información de vacuna rabia de los ultimos 3 años, fecha estimada retorno",
            required: true,
            type: "Identification",
            appliesto: ["dog", "cat"],
            formFields: {
                vaccine_date: {label: "Fecha de estimada de retorno", required: true, type: "date"}
            },
            price: 55.00
        },
        {
            id: "microchip",
            name: "Microchip",
            description: "Microchip",
            required: true,
            type: "Identification",
            appliesto: ["dog", "cat"],
            price: 55.00
        }
    ]
};

    if (window.petTravelDB) {
        window.petTravelDB.addCountry('US', EstadosunidosPetTravelForm);
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
