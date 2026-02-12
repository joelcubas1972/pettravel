var SudafricaPetTravelForm = {
    countryCode: "ZA",
    countryName: "South Africa",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "rabies_vaccine",
            name: "Vacuna antirrábica",
            description: "Vacuna contra la rabia vigente (mínimo 30 días antes del viaje)",
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
            id: "import_permit",
            name: "Permiso de importación DAFF",
            description: "Permiso del Departamento de Agricultura, Silvicultura y Pesca de Sudáfrica",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "microchip",
            name: "Microchip ISO 11784/11785",
            description: "Microchip implantado (debe aparecer en todos los documentos)",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "health_certificate",
            name: "Certificado de salud USDA",
            description: "Certificado veterinario endosado por USDA APHIS (≤10 días antes del viaje)",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "surra_test_dogs",
            name: "Prueba Trypanosoma evansi (Surra) - Perros",
            description: "CATT + Frotis Giemsa negativo en laboratorio de referencia OIE",
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
            id: "bird_quarantine",
            name: "Aislamiento 28 días - Aves",
            description: "Aislamiento pre-exportación en instalación aprobada por APHIS",
            required: true,
            conditional: "species == 'bird'",
            type: "quarantine",
            appliesto: ["bird"]
        },
        {
            id: "bird_residency",
            name: "Residencia ≥3 meses en EE.UU. - Aves",
            description: "Deben haber permanecido en EE.UU. al menos 3 meses antes de exportación",
            required: true,
            conditional: "species == 'bird'",
            type: "residency",
            appliesto: ["bird"]
        },
        {
            id: "bird_disease_testing",
            name: "Pruebas enfermedades aviares",
            description: "Influenza aviar y enfermedad de Newcastle (2 pruebas con ≥14 días de diferencia)",
            required: true,
            conditional: "species == 'bird'",
            type: "laboratory_test",
            appliesto: ["bird"],
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
            id: "captivity_declaration_birds",
            name: "Declaración de cautiverio - Aves",
            description: "Deben haber nacido y permanecido en cautiverio",
            required: true,
            conditional: "species == 'bird'",
            type: "declaration",
            appliesto: ["bird"]
        },
        {
            id: "internal_parasite_treatment",
            name: "Tratamiento antiparasitario interno",
            description: "Desparasitación contra parásitos intestinales",
            required: false,
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
            id: "external_parasite_treatment",
            name: "Tratamiento antiparasitario externo",
            description: "Control de pulgas, garrapatas y ácaros",
            required: false,
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
            id: "distemper_vaccine",
            name: "Vacuna contra moquillo (Distemper)",
            description: "Protección contra virus del moquillo canino",
            required: false,
            type: "vaccine",
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
            id: "feline_vaccines",
            name: "Vacunas felinas básicas",
            description: "Panleucopenia, calicivirus, rinotraqueitis para gatos",
            required: false,
            conditional: "species == 'cat'",
            type: "vaccine",
            appliesto: ["cat"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        }
    ]
};

(function () {
    if (!window.SudafricaPetTravelForm) {
        window.SudafricaPetTravelForm = SudafricaPetTravelForm;
        window.ZAPetTravelForm = SudafricaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('ZA', SudafricaPetTravelForm);
    }
})();