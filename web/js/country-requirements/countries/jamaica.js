var JamaicaPetTravelForm = {
    countryCode: "JM",
    countryName: "Jamaica",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 7,
    requirements: [
        {
            id: "iso_microchip_rabies_first",
            name: "Microchip ISO 11784/11785",
            description: "Implantado ANTES de la vacunación antirrábica",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccination",
            name: "Vacuna antirrábica",
            description: "Vacuna primaria (≥3 meses, entre 6 meses y 1 año antes) o refuerzo (≥3 meses, ≤1 año antes)",
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
            id: "favn_rabies_titer_test",
            name: "Prueba FAVN de anticuerpos antirrábicos",
            description: "Título ≥0.5 IU/mL, realizada 3-12 meses antes de exportación",
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
            id: "double_parasite_treatments",
            name: "Tratamientos antiparasitarios dobles",
            description: "Dos tratamientos separados por 14 días para parásitos internos y externos. Último tratamiento dentro de 7 días antes de exportación",
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
            id: "dog_specific_comprehensive_tests",
            name: "Pruebas exhaustivas específicas para perros",
            description: "Leishmania (45 días), Babesia/Borrelia/Ehrlichia (16 días), Dirofilaria (30 días), Brucella canis (45 días)",
            required: false,
            conditional: "pet_type == 'dog'",
            type: "test",
            appliesto: ["dog"]
        },
        {
            id: "import_permit_required",
            name: "Permiso de importación",
            description: "Obligatorio obtener ANTES de la exportación",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "aphis_endorsement_all_tests",
            name: "Endoso APHIS para pruebas de laboratorio",
            description: "Endoso APHIS requerido para TODAS las pruebas de laboratorio",
            required: true,
            type: "endorsement",
            appliesto: ["all"]
        },
        {
            id: "health_certificate_7_days",
            name: "Certificado de salud veterinario",
            description: "Certificado USDA-APHIS Jamaica, válido 7 días desde emisión hasta exportación",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "fecal_examination_double",
            name: "Exámenes fecales dobles",
            description: "Dos exámenes fecales obligatorios",
            required: true,
            type: "test",
            appliesto: ["all"]
        },
        {
            id: "cat_optional_vaccinations",
            name: "Vacunaciones opcionales para gatos",
            description: "Herpesvirus, Calicivirus, Panleucopenia, Leucemia felina (>2 semanas antes)",
            required: false,
            conditional: "pet_type == 'cat'",
            type: "vaccine",
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
            id: "dog_optional_vaccinations",
            name: "Vacunaciones opcionales para perros",
            description: "Moquillo, Parvovirus, Hepatitis, Parainfluenza (>14 días antes)",
            required: false,
            conditional: "pet_type == 'dog'",
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
        }
    ]
};

(function () {
    if (!window.JamaicaPetTravelForm) {
        window.JamaicaPetTravelForm = JamaicaPetTravelForm;
        window.JMPetTravelForm = JamaicaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('JM', JamaicaPetTravelForm);
    }
})();