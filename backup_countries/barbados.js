var BarbadosPetTravelForm = {
    countryCode: "BB",
    countryName: "Barbados",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "import_permit",
            name: "Permiso de Importación de Barbados",
            description: "Número de permiso de importación requerido por Barbados",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "residency_requirement",
            name: "Requisito de residencia",
            description: "Animales residentes en Estados Unidos o país categoría 1 desde nacimiento o últimos 3 meses continuos",
            required: true,
            type: "residency",
            appliesto: ["all"]
        },
        {
            id: "microchip_iso",
            name: "Microchip compatible ISO",
            description: "Microchip compatible con ISO 11784/11785",
            required: true,
            type: "microchip",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccine",
            name: "Vacuna antirrábica",
            description: "Vacuna contra la rabia administrada después del microchip. Animales ≥3 meses. 35 días de espera después de vacunación",
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
            id: "favn_test",
            name: "Prueba de anticuerpos antirrábicos (FAVN ≥0.5 IU/ml)",
            description: "Prueba de laboratorio aprobado. 90 días de espera después de toma de muestra",
            required: false,
            type: "test",
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
            id: "heartworm_test",
            name: "Prueba de Dirofilaria immitis (gusano del corazón)",
            description: "Prueba ELISA negativa dentro de 30 días antes de exportación (no aplica a gatos o perros <6 meses)",
            required: true,
            type: "test",
            appliesto: ["dog", "cat"],
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
            id: "tick_treatment",
            name: "Tratamiento contra garrapatas",
            description: "Tratamiento con producto aprobado dentro de 7 días antes de exportación (solo perros)",
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
            id: "tapeworm_treatment",
            name: "Tratamiento contra tenias",
            description: "Tratamiento con praziquantel dentro de 7 días antes de exportación (solo perros)",
            required: true,
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
            id: "veterinary_inspection",
            name: "Inspección veterinaria",
            description: "Examen clínico dentro de 7 días antes del viaje. Libre de heridas, signos clínicos de gusano barrenador y enfermedades contagiosas",
            required: true,
            type: "inspection",
            appliesto: ["all"]
        },
        {
            id: "screwworm_free",
            name: "Libre de gusano barrenador",
            description: "Animales de zona no bajo control de gusano barrenador, sin tránsito por zona controlada en últimos 60 días",
            required: true,
            type: "health_status",
            appliesto: ["all"]
        },
        {
            id: "disease_free_status",
            name: "Estatus libre de enfermedades",
            description: "Estados Unidos es libre de Leishmaniasis, virus Nipah y virus Hendra",
            required: true,
            type: "health_status",
            appliesto: ["all"]
        },
        {
            id: "usda_certificate",
            name: "Certificado veterinario USDA",
            description: "Certificado oficial USDA para exportación a Barbados (válido 10 días desde firma)",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "external_parasite_free",
            name: "Libre de parásitos externos",
            description: "Examen veterinario confirma ausencia de parásitos externos",
            required: true,
            type: "health_status",
            appliesto: ["all"]
        },
        {
            id: "category1_country_residency",
            name: "Residencia en país categoría 1",
            description: "Lista de países categoría 1 incluye: EE.UU., Canadá, UE, Reino Unido, Japón, Australia, etc.",
            required: false,
            type: "residency",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.BarbadosPetTravelForm) {
        window.BarbadosPetTravelForm = BarbadosPetTravelForm;
        window.BBPetTravelForm = BarbadosPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('BB', BarbadosPetTravelForm);
    }
})();
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
