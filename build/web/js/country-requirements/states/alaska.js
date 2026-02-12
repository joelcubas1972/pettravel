const AlaskaPetTravelForm = {
    stateCode: "AK",
    stateName: "Alaska",
    acceptsDigitalSignature: false,
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"],
    isRabiesQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_ak",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Certificado emitido por veterinario licenciado y acreditado con número único de certificado. Válido por 30 días desde la fecha de inspección. NO se acepta el formulario USDA APHIS 7001 en línea.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje",
            specialInstructions: "Debe incluir: número de certificado único, declaración de que el animal está libre de enfermedades infecciosas, información completa de vacunación antirrábica",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_ak",
            name: "Certificado de vacunación antirrábica",
            description: "Vacuna antirrábica actualizada para perros, gatos y hurones de 12 semanas o más. Si es la primera vacuna administrada dentro de los 30 días previos, el animal debe estar confinado por los 30 días restantes.",
            required: true,
            type: "vaccine",
            details: "Debe incluir: fecha de vacunación, fabricante, número de lote, y si es vacuna de 1 o 3 años",
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
            id: "health_condition_ak",
            name: "Condición de salud general",
            description: "El animal no debe estar afectado por enfermedades infecciosas, contagiosas o transmisibles, ni haber estado expuesto a ellas en los últimos 30 días.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_ak",
            name: "Verificación de zona de cuarentena",
            description: "El animal no debe originarse de un área bajo cuarentena por rabia designada por otro estado, gobierno federal o país extranjero.",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_ak",
            name: "Permiso de importación (si aplica)",
            description: "Solo requerido si el animal proviene de un área bajo cuarentena por rabia. Contactar a la Oficina del Veterinario Estatal de Alaska al 907-375-8215.",
            required: false,
            type: "permit",
            condition: "Solo si origen es zona de cuarentena de rabia",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_ak",
            name: "Condiciones de transporte",
            description: "El vehículo debe ser apropiado para el tamaño y número de animales, libre de peligros que puedan lesionarlos y mantenerse en condiciones sanitarias.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "canada_transit_ak",
            name: "Documentación adicional para tránsito por Canadá",
            description: "Para animales que transitan por Canadá desde EE.UU. contiguo: requisitos adicionales de USDA APHIS y Canadian Food Inspection Agency (CFIA).",
            required: false,
            type: "international_docs",
            condition: "Solo si transita por Canadá",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_ak",
            name: "Requisitos CDC para perros (a partir del 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU.: requisitos actualizados de los Centros para el Control de Enfermedades (CDC).",
            required: false,
            type: "federal_requirements",
            appliesTo: ["dog"],
            link: "https://www.cdc.gov/importation/bringing-an-animal-into-the-united-states/dogs.html"
        },
        {
            id: "local_requirements_ak",
            name: "Requisitos locales específicos",
            description: "Algunas comunidades tienen requisitos adicionales: Kotzebue y Nome requieren vacuna contra parvovirus al menos 7 días antes de la llegada.",
            required: false,
            type: "local_regulations",
            affectedAreas: ["Kotzebue", "Nome"],
            contact: ["Kotzebue Animal Control", "Nome Animal Control"],
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
            id: "airline_requirements_ak",
            name: "Requisitos específicos de la aerolínea",
            description: "Algunas aerolíneas requieren CVI emitido dentro de 10 días de viaje o declaraciones específicas en el certificado.",
            required: false,
            type: "carrier_requirements",
            instructions: "Verificar con la aerolínea antes del viaje",
            appliesTo: ["all"]
        },
        {
            id: "vet_responsibilities_ak",
            name: "Responsabilidades del veterinario",
            description: "El veterinario debe: estar licenciado y acreditado, verificar todos los requisitos, enviar copia del CVI a OSV (akcvi@alaska.gov).",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function () {
    window.AlaskaPetTravelForm = AlaskaPetTravelForm;
    window.AKPetTravelForm = AlaskaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('AK', AlaskaPetTravelForm);
    }
})();