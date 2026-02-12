const ColoradoPetTravelForm = {
    stateCode: "CO",
    stateName: "Colorado",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false, // No hay mención de cuarentena general para conejos
    requirements: [
        {
            id: "cvi_requirement_co",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Un Certificado de Inspección Veterinaria emitido por un veterinario acreditado es generalmente obligatorio para la entrada de animales de compañía y ganado. Válido por 30 días desde la fecha de inspección.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje",
            specialInstructions: "Debe incluir identificación oficial del animal (microchip, arete oficial, marca, etc.), origen, destino y declaración de buena salud. Para ganado, puede requerirse certificado de inspección de marcas.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_co",
            name: "Certificado de vacunación antirrábica",
            description: "Se requiere vacunación contra la rabia actualizada para perros, gatos y hurones. La edad mínima puede variar; se recomienda consultar con la Oficina del Veterinario Estatal.",
            required: true,
            type: "vaccine",
            details: "El certificado debe incluir fecha de vacunación, fabricante, número de lote y fecha de vencimiento. Debe cumplir con las pautas del compendio de rabia.",
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
            id: "health_condition_co",
            name: "Condición de salud general",
            description: "El animal debe estar libre de evidencia de enfermedades infecciosas, contagiosas o transmisibles en el momento de la inspección y no haber estado expuesto a tales enfermedades en un período razonable antes del movimiento.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_co",
            name: "Verificación de zona de cuarentena/enfermedad",
            description: "Los animales no deben provenir de un área bajo cuarentena por enfermedad declarada (ej., fiebre aftosa, influenza aviar) a menos que se cumplan condiciones específicas de permisos y pruebas.",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_co",
            name: "Permiso de entrada para ganado",
            description: "Se requiere un permiso de entrada para la mayoría de las especies de ganado (bovinos, ovinos, caprinos, porcinos, equinos, aves de corral, camélidos). Se puede obtener llamando al 303-869-9130.",
            required: true, 
            type: "permit",
            condition: "Para ganado (no típicamente para mascotas domésticas individuales)",
            contact: "Colorado State Veterinarian's Office: 303-869-9130 (L-V 8 am-5 pm MST)",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_co",
            name: "Condiciones de transporte",
            description: "Los animales deben transportarse de manera que prevengan lesiones o estrés indebido. El vehículo o contenedor debe ser sanitario y apropiado para la especie.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "international_transit_co",
            name: "Documentación para importación internacional",
            description: "Los animales importados de otros países deben cumplir primero con todos los requisitos federales de USDA-APHIS. Luego, se deben verificar los requisitos específicos de Colorado contactando al 303-869-9130.",
            required: false,
            type: "international_docs",
            condition: "Solo para animales importados directamente de otros países",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_co",
            name: "Requisitos CDC para perros (a partir del 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU. desde el extranjero: requisitos federales de los CDC, que incluyen microchip, vacuna contra la rabia válida emitida en el extranjero y, en la mayoría de los casos, un permiso de importación de CDC.",
            required: false,
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "local_requirements_co",
            name: "Requisitos para Feedlots y Sitios de Marcado Aprobados",
            description: "El ganado con destino a un 'Feedlot Aprobado de Colorado' o un 'Sitio de Marcado Aprobado' puede estar exento de ciertos requisitos de CVI o permiso. El movimiento desde estos sitios suele estar restringido a otro feedlot aprobado o a matadero.",
            required: false,
            type: "local_regulations",
            affectedAreas: ["Feedlots y Sitios de Marcado Aprobados"],
            contact: ["Colorado State Veterinarian's Office: 303-869-9130"],
            appliesTo: ["cow"]
        },
        {
            id: "airline_requirements_co",
            name: "Requisitos específicos de la aerolínea",
            description: "Las aerolíneas que operan en Colorado (ej., en DEN) pueden tener políticas propias sobre el transporte de animales, incluidos los tipos de contenedores, ventanas de tiempo para el CVI y cargos.",
            required: false,
            type: "carrier_requirements",
            instructions: "Verificar con la aerolínea específica antes del viaje.",
            appliesTo: ["all"]
        },
        {
            id: "vet_responsibilities_co",
            name: "Responsabilidades del veterinario",
            description: "El veterinario debe: estar acreditado, examinar al animal, completar el CVI con precisión, verificar la identificación y la vacunación, y declarar que el animal cumple con los requisitos estatales y federales aplicables.",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.ColoradoPetTravelForm = ColoradoPetTravelForm;
    window.COPetTravelForm = ColoradoPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('CO', ColoradoPetTravelForm);
    }
})();