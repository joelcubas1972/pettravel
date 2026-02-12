const DistrictOfColumbiaPetTravelForm = {
    stateCode: "DC",
    stateName: "District of Columbia",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false, // No hay mención de requisitos específicos de cuarentena para conejos.
    requirements: [
        {
            id: "cvi_requirement_dc",
            name: "Certificado de Inspección Veterinaria",
            description: "Certificado emitido por un veterinario licenciado dentro de los 30 días previos al viaje para ingresar al Distrito de Columbia.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (válido por 30 días desde la emisión)",
            specialInstructions: "Requisito básico de entrada para mascotas.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_dc",
            name: "Vacunación contra la Rabia",
            description: "Los perros y gatos deben estar vacunados contra la rabia. Para los perros, la vacuna debe administrarse al menos 30 días antes del viaje[citation:1].",
            required: true,
            type: "vaccine",
            details: "Aplicable a perros y gatos. Para perros, el plazo mínimo de 30 días antes del viaje es obligatorio.",
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
            id: "distemper_vaccine_dc",
            name: "Vacunación contra el Moquillo (Perros)",
            description: "Los perros también deben estar vacunados contra el moquillo (distemper), con al menos 30 días de antelación al viaje[citation:1].",
            required: true,
            type: "vaccine",
            appliesTo: ["dog"],
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
            id: "health_condition_dc",
            name: "Condición de Salud General",
            description: "Se asume que el certificado de salud acredita que el animal está clínica y aparentemente sano, libre de enfermedades infecciosas o contagiosas.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "airline_coordination_dc",
            name: "Coordinación con la Aerolínea y Jurisdicción Correcta",
            description: "Es crucial verificar los requisitos con la aerolínea y confirmar la jurisdicción del aeropuerto de llegada. Los aeropuertos DCA e IAD están en Virginia, y BWI en Maryland[citation:1].",
            required: true,
            type: "verification",
            specialInstructions: "Contactar: Virginia Department of Agriculture (804-786-2483) o Maryland Department of Agriculture (410-841-5810) si el aeropuerto de llegada está en esos estados[citation:1].",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_dc",
            name: "Condiciones de Transporte",
            description: "Información no especificada en la fuente oficial, pero se aplican las mejores prácticas estándar para el transporte seguro de mascotas.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_dc",
            name: "Requisitos Federales CDC para Perros (desde el 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU. desde el extranjero, los Centros para el Control de Enfermedades (CDC) tienen requisitos específicos que incluyen microchip, vacunación antirrábica, formulario de importación y, en algunos casos, cuarentena[citation:5].",
            required: false, 
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "vet_responsibilities_dc",
            name: "Responsabilidades del Veterinario",
            description: "El veterinario debe estar licenciado y emitir el Certificado de Inspección Veterinaria dentro del plazo válido de 30 días[citation:1].",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.DistrictOfColumbiaPetTravelForm = DistrictOfColumbiaPetTravelForm;
    window.DCPetTravelForm = DistrictOfColumbiaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('DC', DistrictOfColumbiaPetTravelForm);
    }
})();