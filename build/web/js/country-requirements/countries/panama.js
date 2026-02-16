var PanamaPetTravelForm = {
    countryCode: "PA",
    countryName: "Panamá",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 30, 
    requirements: [
        {
            id: "species_restriction_dogs_only",
            name: "Restricción a perros solamente",
            description: "Este formulario aplica SOLO para perros. NO para gatos ni otras especies.",
            required: true,
            type: "species_restriction",
            appliesto: ["dog"]
        },
        {
            id: "minimum_age_3_months",
            name: "Edad mínima 3 meses",
            description: "Todos los perros deben tener más de 3 meses de edad (perros menores de 4 meses NO pueden exportarse).",
            required: true,
            type: "age_requirement",
            appliesto: ["dog"]
        },
        {
            id: "rabies_vaccination_30_day_wait",
            name: "Vacuna antirrábica con espera",
            description: "Vacuna contra la rabia vigente. Para la primera vacunación: deben transcurrir al menos 30 días antes del embarque.",
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
            id: "core_canine_vaccinations",
            name: "Vacunas básicas para perros",
            description: "Vacunas obligatorias contra Moquillo (Distemper), Parvovirus, Leptospirosis y Hepatitis canina, con detalles completos de fabricante, lote y fecha de vencimiento.",
            required: true,
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
            id: "broad_spectrum_parasite_treatment",
            name: "Tratamiento antiparasitario amplio",
            description: "Tratamiento de amplio espectro contra parásitos internos y externos administrado antes del embarque, con productos autorizados en EE.UU.",
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
            id: "consular_stamp_or_apostille",
            name: "Sello consular o apostilla",
            description: "Sello del Consulado de Panamá O apostilla del documento REQUERIDA para la validez del certificado.",
            required: true,
            type: "legalization_requirement",
            appliesto: ["all"]
        },
        {
            id: "health_certificate_30_day_validity",
            name: "Certificado de salud con validez limitada",
            description: "Certificado USDA-APHIS Panamá bilingüe (5 páginas). Válido por SOLO 30 días después de firmado o emitido.",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "detailed_vaccination_tables",
            name: "Tablas detalladas de vacunación",
            description: "El formulario incluye 5 tablas detalladas obligatorias en la página 4 para documentar todas las vacunaciones.",
            required: true,
            type: "document_format",
            appliesto: ["all"]
        },
        {
            id: "multiple_dogs_section",
            name: "Sección para múltiples perros",
            description: "Recuadro 21 específico para identificación y datos de múltiples perros en un mismo envío.",
            required: false,
            type: "additional_documentation",
            appliesto: ["dog"]
        },
        {
            id: "health_examination_usda_vet",
            name: "Examen de salud por veterinario USDA",
            description: "Examen clínico que certifique que el perro está libre de enfermedades infecciosas o contagiosas que pongan en peligro la salud pública o animal.",
            required: true,
            type: "health_check",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.PanamaPetTravelForm) {
        window.PanamaPetTravelForm = PanamaPetTravelForm;
        window.PAPetTravelForm = PanamaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('PA', PanamaPetTravelForm);
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
