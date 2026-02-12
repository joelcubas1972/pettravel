const MassachusettsPetTravelForm = {
    stateCode: "MA",
    stateName: "Massachusetts",
    acceptsDigitalSignature: true,
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"],
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "health_certificate_ma_pets",
            name: "Certificado de Salud Oficial",
            description: "Requerido para la entrada de perros y gatos al estado. Debe indicar que el animal no ha estado expuesto a la rabia.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (válido por 30 días)",
            appliesTo: ["dog", "cat"]
        },
        {
            id: "rabies_vaccine_ma",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para perros y gatos mayores de 6 meses. La vacuna debe haberse administrado NO MÁS de 12 meses antes de la importación.",
            required: true,
            type: "vaccine",
            details: "Los animales no vacunados al ingresar DEBEN ser vacunados dentro de los 30 días posteriores a la entrada o al cumplir 6 meses de edad, lo que ocurra ÚLTIMO.",
            appliesTo: ["dog", "cat", "ferret"],
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
            id: "rescue_shelter_ma",
            name: "Requisitos Adicionales para Refugios/Rescates",
            description: "Los animales importados de refugios u organizaciones de rescate desde otro estado también deben cumplir con las regulaciones específicas del Programa de Refugios y Rescates de Animales (330 CMR 30.00).",
            required: true,
            type: "additional_regulation",
            condition: "Aplica a animales de refugios y organizaciones de rescate.",
            appliesTo: ["all"]
        },  
        {
            id: "health_certificate_ma_rabbits",
            name: "Certificado de Salud Oficial",
            description: "Requerido para todos los conejos importados. Debe declarar que están sanos, libres de síntomas de enfermedad infecciosa o transmisible, parásitos internos/externos, y exposición a enfermedades contagiosas.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (válido por 30 días)",
            appliesTo: ["rabbit"]
        },
        {
            id: "slaughter_rabbits_ma",
            name: "Para Transporte a Matadero",
            description: "Los conejos transportados para sacrificio deben estar acompañados por guías de ruta (waybills) aprobadas por el USDA e identificados con aretes, etiquetas dorsales u otra identificación aprobada por el USDA.",
            required: false,
            type: "transport",
            condition: "Solo para conejos destinados a sacrificio.",
            appliesTo: ["rabbit"]
        },
        {
            id: "health_certificate_ma_birds",
            name: "Certificado de Salud Oficial",
            description: "Requerido para TODAS las aves importadas (loros/exóticas, palomas/tórtolas). Debe declarar que están sanas, libres de síntomas de enfermedad, parásitos y exposición a enfermedades contagiosas.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (válido por 30 días)",
            appliesTo: ["bird"]
        },
        {
            id: "origin_health_ma_birds",
            name: "Origen de Bandadas Sanas",
            description: "Todas las aves deben originarse de bandadas y predios sanos. La psitacosis es prevalente en loros y es muy infecciosa para los humanos; los casos identificados serán rastreados y las fuentes puestas en cuarentena.",
            required: true,
            type: "verification",
            appliesTo: ["bird"]
        }
    ]

};

(function () {
    window.MassachusettsPetTravelForm = MassachusettsPetTravelForm;
    window.MAPetTravelForm = MassachusettsPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MA', MassachusettsPetTravelForm);
    }
})();