var ChinaPetTravelForm = {
    countryCode: "CN",
    countryName: "China",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 14, // Certificado válido solo 14 días
    requirements: [
        {
            id: "microchip_iso_cn",
            name: "Microchip ISO 11784/11785",
            description: "Microchip compatible con ISO 11784/11785 (15 dígitos). Es esencial para la verificación de identidad y para evitar la cuarentena. Debe implantarse ANTES de la vacunación antirrábica[citation:2][citation:3][citation:4].",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccinations_cn",
            name: "Dos Vacunaciones Antirrábicas",
            description: "Se requieren AL MENOS DOS vacunas contra la rabia en la vida de la mascota. La más reciente debe estar vigente al momento de la entrada a China. NO se reconocen vacunas multianuales[citation:2][citation:3][citation:4].",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat", "ferret"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "rabies_titer_test_cn",
            name: "Prueba de Anticuerpos Neutralizantes de Rabia (FAVN/RFFIT)",
            description: "Prueba obligatoria para evitar la cuarentena para mascotas procedentes de países NO designados (como el EE.UU. continental). Mínimo de 0.5 IU/mL. La muestra de sangre debe tomarse el mismo día o DESPUÉS de la segunda vacuna. Válida por 1 año[citation:2][citation:3][citation:4].",
            required: true,
            condition: "origin !== 'Hawaii' && origin !== 'Guam'",
            type: "health_test",
            appliesto: ["dog", "cat", "ferret"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "health_certificate_cn",
            name: "Certificado de Salud Específico para China",
            description: "Formularios separados para perros y gatos, emitidos por un veterinario acreditado por USDA DENTRO de los 14 días previos a la llegada a China. Debe incluir información detallada de microchip, vacunas y prueba de titulación[citation:2][citation:3].",
            required: true,
            type: "certificate",
            validity: "14 días desde emisión hasta llegada a China",
            appliesto: ["dog", "cat"]
        },
        {
            id: "usda_aphis_endorsement_cn",
            name: "Endoso USDA APHIS",
            description: "Endoso oficial obligatorio por USDA APHIS. Firma electrónica aceptada[citation:2][citation:9].",
            required: true,
            type: "endorsement",
            appliesto: ["all"]
        },
        {
            id: "one_pet_per_passenger",
            name: "Límite de Una Mascota por Persona",
            description: "Solo se permite una mascota (perro o gato) por pasajero adulto. El nombre del dueño en el certificado debe coincidir con el pasaporte[citation:2][citation:3][citation:4].",
            required: true,
            type: "regulation",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.ChinaPetTravelForm) {
        window.ChinaPetTravelForm = ChinaPetTravelForm;
        window.CNPetTravelForm = ChinaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('CN', ChinaPetTravelForm);
    }
})();