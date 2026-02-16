var IslascaimanPetTravelForm = {
    countryCode: "KY",
    countryName: "Islas Caimán",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 14,
    requirements: [
        {
            id: "iso_microchip",
            name: "Microchip ISO",
            description: "Microchip ISO implantado antes o al momento de la vacunación antirrábica",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccination",
            name: "Vacuna antirrábica",
            description: "Vacuna contra la rabia (edad mínima 12 semanas al momento de vacunación)",
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
            name: "Prueba de titulación antirrábica",
            description: "Prueba de anticuerpos neutralizantes ≥0.5 IU/ml, realizada dentro de los últimos 12 meses",
            required: true,
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
            id: "core_vaccinations",
            name: "Vacunas básicas",
            description: "DHP para perros (Moquillo, Hepatitis, Parvovirus) o FVRCP para gatos (Rinotraqueitis, Calicivirus, Panleucopenia)",
            required: true,
            type: "vaccine",
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
            id: "external_parasite_treatment",
            name: "Tratamiento antiparasitario externo",
            description: "Tratamiento acaricida con acción residual contra garrapatas, administrado el día del examen",
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
            description: "Praziquantel (5mg/kg de peso corporal), administrado el día del examen",
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
            id: "health_certificate_14_days",
            name: "Certificado de salud veterinario",
            description: "Examen veterinario no más de 14 días antes de la exportación",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "minimum_age_12_weeks",
            name: "Edad mínima 12 semanas",
            description: "Mínimo 12 semanas de edad al momento de la vacunación antirrábica",
            required: true,
            type: "age_requirement",
            appliesto: ["all"]
        },
        {
            id: "residency_history",
            name: "Historial de residencia",
            description: "Residente desde nacimiento, o continuamente en país de exportación últimos 3 meses, o en países sin/bajo riesgo de rabia",
            required: true,
            type: "residency_requirement",
            appliesto: ["all"]
        },
        {
            id: "no_rabies_quarantine_area",
            name: "Sin exposición a áreas de cuarentena por rabia",
            description: "No presente en áreas oficialmente en cuarentena o designadas de riesgo de rabia en los últimos 3 meses",
            required: true,
            type: "exposure_requirement",
            appliesto: ["all"]
        },
        {
            id: "microchip_scan_before_treatment",
            name: "Escaneo de microchip antes del tratamiento",
            description: "Microchip debe ser escaneado antes de administrar cualquier tratamiento",
            required: true,
            type: "verification",
            appliesto: ["all"]
        },
        {
            id: "fitness_to_travel",
            name: "Aptitud para viajar",
            description: "Animal libre de enfermedades contagiosas, parásitos externos y apto para viajar",
            required: true,
            type: "health_declaration",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.IslascaimanPetTravelForm) {
        window.IslascaimanPetTravelForm = IslascaimanPetTravelForm;
        window.KYPetTravelForm = IslascaimanPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('KY', IslascaimanPetTravelForm);
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
