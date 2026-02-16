var SingapurPetTravelForm = {
    countryCode: "SG",
    countryName: "Singapur",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 7, // El certificado de salud debe emitirse ≤7 días antes del embarque
    requirements: [
        {
            id: "avs_import_license_mandatory",
            name: "Licencia de importación AVS",
            description: "Licencia obligatoria del Animal & Veterinary Service (AVS) de Singapur. Debe solicitarse y obtenerse ANTES de realizar cualquier otro trámite de exportación.",
            required: true,
            type: "import_permit",
            appliesto: ["all"]
        },
        {
            id: "health_certificate_7_days",
            name: "Certificado de salud (7 días)",
            description: "Certificado emitido por un veterinario acreditado por el USDA. DEBE emitirse ≤7 DÍAS antes de la fecha de embarque (salida de EE.UU.).",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "usda_original_ink_endorsement",
            name: "Endoso USDA con tinta original",
            description: "Endoso obligatorio por parte del USDA APHIS con firma de tinta original y sello estampado. Es un requisito de validez para el certificado.",
            required: true,
            type: "endorsement",
            appliesto: ["all"]
        },
        {
            id: "species_specific_cites_permits",
            name: "Permisos CITES para especies en peligro (Aves)",
            description: "Para aves ornamentales listadas en CITES (guacamayos, cacatúas, loros - excepto 4 especies comunes): se requiere permiso CITES adicional. La importación comercial de especies del Apéndice I generalmente no está permitida, a menos que sean criadas en cautiverio registrado.",
            required: false,
            conditional: "pet_type == 'ornamental_bird' && cites_status == 'yes'",
            type: "import_permit",
            appliesto: ["bird"]
        },
        {
            id: "rabies_vaccination_dogs_cats",
            name: "Vacunación antirrábica (Perros/Gatos)",
            description: "Vacuna contra la rabia vigente, con fechas de administración y validez claramente documentadas.",
            required: true,
            conditional: "pet_type == 'dog' || pet_type == 'cat'",
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
            id: "core_canine_vaccinations",
            name: "Vacunas básicas caninas (Perros)",
            description: "Vacunas contra Moquillo, Hepatitis, Parvovirus y Leptospirosis, según recomendación veterinaria.",
            required: true,
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
        },
        {
            id: "avs_veterinary_conditions_small_mammals",
            name: "Condiciones veterinarias AVS (Pequeños mamíferos)",
            description: "Para conejos, hámsters y otros pequeños mamíferos, se deben seguir las 'Veterinary Conditions' específicas publicadas por el AVS.",
            required: false,
            conditional: "pet_type == 'small_mammal'",
            type: "health_requirement",
            appliesto: ["rabbit", "hamster"]
        },
        {
            id: "owner_declaration_and_licensing",
            name: "Declaración del propietario y documentación",
            description: "Declaración del propietario y comprobación del estatus de residencia en Singapur. La importación puede requerir justificación del propósito (mascota vs. cría).",
            required: true,
            type: "owner_declaration",
            appliesto: ["all"]
        },
        {
            id: "housing_regulations_compliance",
            name: "Cumplimiento de regulaciones de vivienda",
            description: "Confirmación de alojamiento adecuado en Singapur, respetando regulaciones locales (ej: restricciones en viviendas públicas HDB).",
            required: true,
            type: "owner_declaration",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.SingapurPetTravelForm) {
        window.SingapurPetTravelForm = SingapurPetTravelForm;
        window.SGPetTravelForm = SingapurPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('SG', SingapurPetTravelForm);
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
