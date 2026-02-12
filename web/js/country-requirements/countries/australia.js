var AustraliaPetTravelForm = {
    countryCode: "AU",
    countryName: "Australia",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 180, // Proceso toma 6-9 meses
    requirements: [
        {
            id: "microchip_iso_australia",
            name: "Microchip ISO 11784/11785",
            description: "Microchip compatible con ISO 11784/11785, escaneable. Debe implantarse antes de cualquier procedimiento.",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "three_part_identity_verification",
            name: "Verificación de Identidad en 3 Partes",
            description: "Proceso obligatorio que requiere DOS veterinarios USDA en DOS clínicas diferentes. Incluye fotos con escáner de microchip y mascota.",
            required: true,
            type: "identity_verification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccination_australia",
            name: "Vacunación Antirrábica",
            description: "Vacuna contra la rabia vigente. Estado completo de vacunación documentado.",
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
            id: "brucella_canis_testing",
            name: "Prueba Brucella Canis",
            description: "SOLO para perros intactos. Pruebas aceptadas: RSAT, TAT, IFAT (versiones estándar). NO aceptados: 2ME-RSAT, 2ME-TAT, AGID.",
            required: false,
            condition: "pet_type === 'dog' && (sex === 'male_intact' || sex === 'female_intact')",
            type: "health_test",
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
            id: "leptospirosis_vaccination",
            name: "Vacunación contra Leptospirosis",
            description: "Curso primario (dos vacunas) o refuerzo anual. Detalles completos requeridos.",
            required: true,
            type: "vaccine",
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
            id: "aus_import_permit",
            name: "Permiso de Importación DAFF Australia",
            description: "Permiso oficial emitido por el Departamento de Agricultura, Pesca y Silvicultura de Australia.",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "quarantine_reservation",
            name: "Reserva de Cuarentena",
            description: "Reserva confirmada en instalación de cuarentena aprobada en Australia (ej: Mickleham Quarantine Facility).",
            required: true,
            type: "quarantine",
            appliesto: ["all"]
        },
        {
            id: "crate_seal_usda",
            name: "Sello de Jaula USDA",
            description: "Sello físico obtenido de oficina USDA, colocado el día de salida.",
            required: true,
            type: "certification",
            appliesto: ["all"]
        },
        {
            id: "vehcs_export_certificate",
            name: "Certificado de Exportación VEHCS",
            description: "Certificado emitido electrónicamente en VEHCS y endosado digitalmente por USDA APHIS.",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.AustraliaPetTravelForm) {
        window.AustraliaPetTravelForm = AustraliaPetTravelForm;
        window.AUPetTravelForm = AustraliaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('AU', AustraliaPetTravelForm);
    }
})();