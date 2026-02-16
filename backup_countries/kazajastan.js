var KazajastanPetTravelForm = {
    countryCode: "KZ",
    countryName: "Kazajastán",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "rabies_vaccine",
            name: "Vacuna antirrábica",
            description: "Vacuna contra la rabia. Carnívoros (excepto hurones y perros/gatos menores de 3 meses) vacunados no más de 20 días antes del embarque, o si fueron vacunados en los últimos 12 meses (o inmunidad ≥0.5 IU/ml confirmada por laboratorio)",
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
            id: "clinical_examination",
            name: "Examen clínico durante cuarentena",
            description: "Examen clínico realizado durante el período de cuarentena",
            required: true,
            type: "examination",
            appliesto: ["all"]
        },
        {
            id: "anthrax_free",
            name: "Libre de ántrax",
            description: "Animales provenientes de territorios libres de ántrax durante los últimos 20 días",
            required: true,
            type: "health_status",
            appliesto: ["all"]
        },
        {
            id: "rabies_free",
            name: "Libre de rabia",
            description: "Zorros, zorros árticos, perros y gatos de territorios libres de rabia durante los últimos 6 meses",
            required: true,
            type: "health_status",
            appliesto: ["dog", "cat", "zorro"]
        },
        {
            id: "tuberculosis_free",
            name: "Libre de tuberculosis",
            description: "Zorros, zorros árticos, perros y gatos de territorios libres de tuberculosis durante los últimos 6 meses",
            required: true,
            type: "health_status",
            appliesto: ["dog", "cat", "zorro"]
        },
        {
            id: "distemper_vaccine",
            name: "Vacuna contra moquillo (Distemper)",
            description: "Para perros: protección contra moquillo, hepatitis, infecciones por parvovirus y adenovirus",
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
            id: "leptospirosis_vaccine",
            name: "Vacuna contra leptospirosis",
            description: "Para perros: protección contra leptospirosis (o tratamiento profiláctico con dihidroestreptomicina)",
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
            id: "panleukopenia_vaccine",
            name: "Vacuna contra panleucopenia felina",
            description: "Para gatos: protección contra panleucopenia (parvovirus felino)",
            required: false,
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
        },
        {
            id: "ferret_distemper_vaccine",
            name: "Vacuna contra moquillo para hurones",
            description: "Para hurones: protección contra moquillo, enteritis viral y pseudomonosis",
            required: false,
            type: "vaccine",
            appliesto: ["ferret"],
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
            id: "mink_aleutian_disease_test",
            name: "Prueba de enfermedad aleutiana del visón",
            description: "Para visones: prueba de laboratorio para enfermedad aleutiana del visón (método OIE)",
            required: false,
            type: "test",
            appliesto: ["mink"],
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
            id: "cat_dermatophytosis_test",
            name: "Prueba de dermatofitosis para gatos",
            description: "Para gatos: prueba de laboratorio para dermatofitosis (método OIE)",
            required: false,
            type: "test",
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
        },
        {
            id: "mink_encephalopathy_free",
            name: "Libre de encefalopatía del visón",
            description: "Visones y hurones de territorios libres de encefalopatía del visón durante los últimos 36 meses",
            required: false,
            type: "health_status",
            appliesto: ["mink", "ferret"]
        },
        {
            id: "aleutian_disease_free",
            name: "Libre de enfermedad aleutiana",
            description: "Visones de territorios libres de enfermedad aleutiana durante los últimos 36 meses",
            required: false,
            type: "health_status",
            appliesto: ["mink"]
        },
        {
            id: "tularemia_free",
            name: "Libre de tularemia",
            description: "Visones, hurones y conejos de territorios libres de tularemia durante los últimos 12 meses",
            required: false,
            type: "health_status",
            appliesto: ["mink", "ferret", "rabbit"]
        },
        {
            id: "rabbit_vhd_free",
            name: "Libre de enfermedad hemorrágica viral",
            description: "Conejos de territorios libres de enfermedad hemorrágica viral durante los últimos 12 meses",
            required: false,
            type: "health_status",
            appliesto: ["rabbit"]
        },
        {
            id: "rabbit_pasteurellosis_free",
            name: "Libre de pasteurelosis",
            description: "Conejos de territorios libres de pasteurelosis durante los últimos 12 meses",
            required: false,
            type: "health_status",
            appliesto: ["rabbit"]
        },
        {
            id: "rabbit_myxomatosis_free",
            name: "Libre de mixomatosis",
            description: "Conejos de territorios libres de mixomatosis durante los últimos 6 meses",
            required: false,
            type: "health_status",
            appliesto: ["rabbit"]
        },
        {
            id: "animal_identification",
            name: "Identificación de animales",
            description: "Todos los animales importados deben estar identificados",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "transport_treatment",
            name: "Tratamiento del transporte",
            description: "Medio de transporte tratado y preparado de acuerdo con las reglas del país exportador",
            required: true,
            type: "transport",
            appliesto: ["all"]
        },
        {
            id: "veterinary_certificate",
            name: "Certificado veterinario USDA Forma № 15",
            description: "Certificado veterinario oficial USDA para exportación a Kazajastán (Forma № 15, edición 9 julio 2019)",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.KazajastanPetTravelForm) {
        window.KazajastanPetTravelForm = KazajastanPetTravelForm;
        window.KZPetTravelForm = KazajastanPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('KZ', KazajastanPetTravelForm);
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
