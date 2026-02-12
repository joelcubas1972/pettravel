var UcraniaPetTravelForm = {
    countryCode: "UA",
    countryName: "Ucrania",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10, // Los requisitos de tiempo pueden variar; consultar la fecha exacta
    requirements: [
        {
            id: "import_permit",
            name: "Permiso de Importación / Notificación",
            description: "Comunicación requerida con el Servicio Estatal de Seguridad Alimentaria y Protección del Consumidor de Ucrania antes del envío.",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "iso_microchip",
            name: "Microchip ISO 11784/11785",
            description: "Obligatorio para identificación. Debe implantarse ANTES de la vacunación antirrábica.",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccine",
            name: "Vacunación Antirrábica",
            description: "Vacuna válida según las directrices de la OIE. La vacunación primaria debe realizarse con al menos 12 semanas de edad.",
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
            id: "rabies_titer_test",
            name: "Prueba de Anticuerpos (FAVN/RFFIT)",
            description: "Obligatoria. Realizada al menos 30 días después de la vacunación en un laboratorio aprobado por la UE. Título mínimo: ≥ 0.5 IU/mL.",
            required: true,
            type: "laboratory_test",
            appliesto: ["dog", "cat","ferret"],
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
            id: "usda_health_certificate",
            name: "Certificado de Salud USDA",
            description: "Modelo oficial bilingüe (Ucraniano/Inglés). Emitido por veterinario acreditado USDA y ENDOSADO por USDA APHIS.",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "echinococcus_treatment_dog",
            name: "Tratamiento contra Echinococcus - Perros",
            description: "Tratamiento contra la equinococosis (Echinococcus granulosus) administrado por un veterinario entre 24 y 120 horas (1-5 días) ANTES de la llegada a Ucrania.",
            required: true,
            conditional: "species == 'dog'",
            type: "parasite_treatment",
            appliesto: ["dog"],
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
            id: "travel_health_certificate",
            name: "Certificado Sanitario de Viaje",
            description: "Debe emitirse dentro de un plazo específico antes del viaje (consultar la fecha exacta; comúnmente 10 días).",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "travel_with_owner",
            name: "Acompañamiento por el Propietario",
            description: "El movimiento no comercial requiere que la mascota viaje con su propietario o una persona autorizada.",
            required: true,
            type: "regulation",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.UcraniaPetTravelForm) {
        window.UcraniaPetTravelForm = UcraniaPetTravelForm;
        window.UAPetTravelForm = UcraniaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('UA', UcraniaPetTravelForm);
    }
})();