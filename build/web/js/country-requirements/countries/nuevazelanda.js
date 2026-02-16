var NuevazelandaPetTravelForm = {
    countryCode: "NZ",
    countryName: "Nueva Zelanda",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10, // Valor genérico; los requisitos específicos dependen de la categoría
    requirements: [
        {
            id: "mpi_import_permit_20_days",
            name: "Permiso de importación MPI",
            description: "Permiso obligatorio del Ministerio de Industrias Primarias (MPI) de Nueva Zelanda. Solicitar con MÍNIMO 20 días hábiles de anticipación. Las solicitudes posteriores al 8 de noviembre de 2024 pueden sufrir retrasos.",
            required: true,
            type: "import_permit",
            appliesto: ["all"]
        },
        {
            id: "dual_health_certificates_endorsed",
            name: "Dos certificados de salud endosados",
            description: "Certificado de Salud A (veterinario acreditado USDA) y Certificado de Salud B (USDA). AMBOS requieren endoso con firma de tinta original y sello de USDA APHIS.",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "minimum_10_day_quarantine",
            name: "Cuarentena mínima de 10 días",
            description: "Cuarentena obligatoria al llegar a Nueva Zelanda en una instalación aprobada por MPI. El arreglo debe confirmarse con antelación.",
            required: true,
            type: "quarantine_requirement",
            appliesto: ["all"]
        },
        {
            id: "prohibited_breed_restriction",
            name: "Restricción de razas peligrosas/híbridos",
            description: "PERROS PROHIBIDOS: Brazilian Fila, Dog Argentino, Japanese Tosa, Perro de Presa Canario, American Pit Bull Terrier e híbridos. GATOS: Híbridos prohibidos (excepto Bengala con documentación de 5 generaciones domésticas).",
            required: true,
            type: "breed_restriction",
            appliesto: ["dog"]
        },
        {
            id: "brucella_canis_approved_test",
            name: "Prueba Brucella canis (Perros)",
            description: "Obligatoria para perros. Métodos aceptados: RSAT (NO 2ME-RSAT), TAT, CPAg-AGID o IFAT. Debe aparecer el número de microchip en el informe.",
            required: true,
            conditional: "pet_type == 'dog'",
            type: "test",
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
            id: "origin_category_requirements",
            name: "Requisitos según categoría de origen",
            description: "Continente EE.UU., Puerto Rico, Islas Vírgenes, Marianas del Norte = Categoría 3 (rabia ausente/controlada). Hawaii, Guam, Samoa Americana = Categoría 2 (libres de rabia, requisitos diferentes).",
            required: true,
            type: "origin_requirement",
            appliesto: ["all"]
        },
        {
            id: "iso_microchip_all_docs",
            name: "Microchip ISO en toda la documentación",
            description: "Microchip ISO 11784/11785 obligatorio. El número DEBE aparecer y coincidir en TODOS los documentos: certificados, informes de laboratorio, permisos y declaraciones.",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "parasite_treatments_june2025_list",
            name: "Tratamientos antiparasitarios (Lista junio 2025)",
            description: "Tratamientos internos y externos obligatorios dentro de las 24 horas previas al viaje, siguiendo las combinaciones aceptadas en la lista actualizada de MPI de junio de 2025.",
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
            id: "mpi_notification_72h_before",
            name: "Notificación a MPI (72 horas antes)",
            description: "Contactar al MPI obligatoriamente al menos 72 horas antes del viaje para coordinar la inspección veterinaria a la llegada.",
            required: true,
            type: "prior_notification",
            appliesto: ["all"]
        },
        {
            id: "lab_reports_original_or_endorsed",
            name: "Informes de laboratorio originales o endosados",
            description: "Todos los informes de laboratorio (Brucella, etc.) deben ser originales o copias endosadas por APHIS, con el microchip claramente indicado.",
            required: true,
            type: "test",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.NuevazelandaPetTravelForm) {
        window.NuevazelandaPetTravelForm = NuevazelandaPetTravelForm;
        window.NZPetTravelForm = NuevazelandaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('NZ', NuevazelandaPetTravelForm);
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
