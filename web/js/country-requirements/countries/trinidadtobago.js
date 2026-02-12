var TrinidadtobagoPetTravelForm = {
    countryCode: "TT",
    countryName: "Trinidad and Tobago",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "import_permit",
            name: "Permiso de Importación",
            description: "Obligatorio. Solicitar al menos 1 mes antes del viaje a la Office of the Chief Veterinary Officer (CVO)[citation:1].",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "iso_microchip",
            name: "Microchip ISO 11784/11785",
            description: "Implantado ANTES de la vacunación antirrábica. Marca aceptada por la Organización Internacional de Normalización[citation:1].",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccine",
            name: "Vacunación Antirrábica",
            description: "Vacuna válida contra la rabia[citation:1].",
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
            description: "Obligatoria. Realizada al menos 1 mes después de la vacunación en un laboratorio aprobado[citation:1]. Título mínimo: ≥ 0.5 IU/mL.",
            required: true,
            type: "laboratory_test",
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
            id: "brucella_canis_test",
            name: "Prueba de Brucella canis",
            description: "Obligatoria para perros no esterilizados (intact). Resultado debe ser negativo[citation:1].",
            required: true,
            conditional: "species == 'dog'",
            type: "laboratory_test",
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
            id: "parasite_treatment",
            name: "Tratamiento Antiparasitario",
            description: "Tratamiento para parásitos internos y externos antes de la exportación[citation:1].",
            required: true,
            type: "parasite_treatment",
            appliesto: ["all"],
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
            description: "Emitido por veterinario acreditado USDA y ENDOSADO por USDA APHIS. Inspección debe realizarse dentro de los 7 días previos a la llegada a Trinidad y Tobago[citation:1].",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "residence_history",
            name: "Historial de Residencia (últimos 6 meses)",
            description: "Proporcionar lista de todos los países donde ha residido la mascota en los 6 meses previos a la exportación[citation:1].",
            required: true,
            type: "declaration",
            appliesto: ["all"]
        },
        {
            id: "arrival_notification",
            name: "Notificación de Llegada",
            description: "Obligatoria. Notificar al Veterinary Officer, Quarantine al menos 2 días hábiles antes de la hora programada de llegada[citation:1].",
            required: true,
            type: "notification",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.TrinidadtobagoPetTravelForm) {
        window.TrinidadtobagoPetTravelForm = TrinidadtobagoPetTravelForm;
        window.TTPetTravelForm = TrinidadtobagoPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('TT', TrinidadtobagoPetTravelForm);
    }
})();