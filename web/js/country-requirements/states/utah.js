const UtahPetTravelForm = {
    stateCode: "UT",
    stateName: "Utah",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS7001"], 
    
    isRabiesQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_ut",
            name: "Certificado de Inspección Veterinaria (CVI / Health Certificate)",
            description: "Documento obligatorio para la entrada de casi todas las especies de animales, excepto perros, gatos y hurones. También se requiere para animales enviados directamente a matadero o mercado de subastas (con certificado de inspección de marca).",
            required: true,
            type: "certificate",
            condition: "NO aplica para perros, gatos, hurones como mascotas.",
            deadline: "Generalmente 30 días. En casos de Estomatitis Vesicular, 14 días.",
            specialInstructions: "Para caballos de condados positivos a Estomatitis Vesicular, NO se acepta un EECVI (pasaporte equino extendido); se necesita un CVI por cada movimiento.",
            appliesTo: ["all"]
        },
        {
            id: "vs_declaration_ut",
            name: "Declaración de Estomatitis Vesicular (VS)",
            description: "Declaración especial requerida en el CVI para caballos o ganado que provengan de un condado donde se haya diagnosticado VS en los últimos 14 días, o que contenga una granja en cuarentena por VS.",
            required: true,
            type: "health_declaration",
            condition: "Solo si el animal viene de un área con VS.",
            statement: "El certificado debe contener: 'Todos los animales identificados en este certificado de inspección veterinaria han sido inspeccionados y se encontraron libres de signos clínicos de Estomatitis Vesicular.'",
            appliesTo: ["hourse", "cow"]
        },
        {
            id: "import_permit_ut",
            name: "Número de Permiso de Importación",
            description: "Solo se requiere para categorías específicas de animales.",
            required: false,
            type: "permit",
            appliesTo: ["all"]
        },
        {
            id: "pets_requirement_ut",
            name: "Requisitos para Perros, Gatos y Hurones (Mascotas)",
            description: "No se requiere un Certificado de Inspección Veterinaria (CVI) para la entrada a Utah.",
            required: false,
            type: "exemption",
            specialInstructions: "Aunque el estado de Utah no lo requiere, las aerolíneas, los campamentos o los complejos de apartamentos pueden tener sus propias normas (como prueba de vacunación contra la rabia). Se recomienda verificar con ellos.",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "official_id_ut",
            name: "Identificación Oficial",
            description: "Los animales que ingresan deben tener una forma de identificación oficial aceptable.",
            required: true,
            type: "identification",
            appliesTo: ["all"],
            link: "Official Eartags: General Criteria and Options" // Enlace del texto original
        },
        {
            id: "commuter_permit_ut",
            name: "Permiso de Traslado Regular (Commuter Permit)",
            description: "Para movimientos frecuentes de ganado entre propiedades (por ejemplo, para pastoreo). Requiere una aplicación y pruebas específicas.",
            required: false,
            type: "permit",
            condition: "Para movimientos regulares de ganado entre dos localizaciones.",
            appliesTo: ["cow", "horse", "sheep"]
        },
        {
            id: "species_specific_ut",
            name: "Requisitos Específicos por Especie",
            description: "Utah tiene requisitos detallados de importación para diferentes tipos de animales. Es fundamental consultar las reglas para la especie exacta.",
            required: true,
            type: "species_regulations",
            appliesTo: ["all"],
            instructions: "Consulta la sección 'Import Requirements by Species' en el sitio web de UDAF para obtener detalles completos."
        }
    ]   
};

(function() {
    window.UtahPetTravelForm = UtahPetTravelForm;
    window.UTPetTravelForm = UtahPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('UT', UtahPetTravelForm);
    }
})();