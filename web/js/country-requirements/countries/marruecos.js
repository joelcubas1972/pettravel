var MarruecosPetTravelForm = {
    countryCode: "MA",
    countryName: "Marruecos",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 3, // El certificado es válido por 3 días después del visado USDA APHIS antes de la salida
    requirements: [
        {
            id: "permanent_identification",
            name: "Identificación permanente",
            description: "Marca de identificación permanente (tatuaje o microchip) DEBE realizarse ANTES de la vacunación antirrábica",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccination",
            name: "Vacunación antirrábica",
            description: "Vacuna válida contra la rabia con detalles completos: nombre, fabricante, lote, fechas de primovacunación y último refuerzo",
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
            id: "origin_rabies_free",
            name: "Origen libre de rabia",
            description: "Los animales deben provenir de instalaciones libres de rabia desde su nacimiento o al menos durante los últimos 6 meses",
            required: true,
            type: "origin_requirement",
            appliesto: ["all"]
        },
        {
            id: "usda_endorsement_3_days",
            name: "Endoso USDA APHIS con validez estricta",
            description: "Certificado USDA APHIS obligatorio con visado. Válido por SOLO 3 días después del visado antes de la salida hacia Marruecos",
            required: true,
            type: "endorsement",
            appliesto: ["all"]
        },
        {
            id: "final_veterinary_exam_24h",
            name: "Examen veterinario final (24 horas)",
            description: "Examen veterinario adicional obligatorio dentro de las 24 horas previas al embarque, con addendum específico",
            required: true,
            type: "health_check",
            appliesto: ["all"]
        },
        {
            id: "good_health_declaration",
            name: "Declaración de buen estado de salud",
            description: "Declaración obligatoria de que los animales han sido examinados y se encuentran en buen estado de salud",
            required: true,
            type: "health_declaration",
            appliesto: ["all"]
        },
        {
            id: "no_disease_signs",
            name: "Declaración de ausencia de enfermedades",
            description: "Declaración obligatoria de que los animales no muestran signos clínicos de enfermedades contagiosas específicas",
            required: true,
            type: "health_declaration",
            appliesto: ["all"]
        },
        {
            id: "complete_transport_details",
            name: "Detalles completos de transporte",
            description: "Información detallada del medio de transporte (naturaleza, identificación, lugar y fecha de embarque)",
            required: true,
            type: "transport_requirement",
            appliesto: ["all"]
        },
        {
            id: "origin_destination_details",
            name: "Detalles de origen y destino",
            description: "Información completa del establecimiento de origen y destino, incluyendo nombres y direcciones del expedidor y destinatario",
            required: true,
            type: "location_requirement",
            appliesto: ["all"]
        },
        {
            id: "species_restriction",
            name: "Restricción de especies",
            description: "Aplicable solo para perros y gatos",
            required: true,
            type: "species_restriction",
            appliesto: ["dog", "cat"]
        }
    ]
};

(function () {
    if (!window.MarruecosPetTravelForm) {
        window.MarruecosPetTravelForm = MarruecosPetTravelForm;
        window.MAPetTravelForm = MarruecosPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('MA', MarruecosPetTravelForm);
    }
})();