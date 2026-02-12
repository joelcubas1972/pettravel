const VermontPetTravelForm = {
    stateCode: "VT",
    stateName: "Vermont",
    acceptsDigitalSignature: null, 
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["APHIS 7001"], 
    
    isRabiesQuarantineArea: false, // No mencionado
    requirements: [
        {
            id: "interstate_movement_link_vt",
            name: "Requisitos de Movimiento Interestatal de Animales",
            description: "VAAFM proporciona un enlace a los requisitos oficiales para mover animales a través de las fronteras estatales. Este es el recurso principal para ganado.",
            required: true, // Para ganado/livestock
            type: "regulation_link",
            link: "Interstate Animal Movement Requirements", // Texto del enlace en la página
            instructions: "Se debe consultar este enlace para obtener los requisitos específicos por especie (ganado vacuno, equinos, aves de corral, etc.).",
            appliesTo: ["all"]
        },
        {
            id: "cvi_assumption_vt",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Aunque no se afirma explícitamente en el texto proporcionado, un CVI es un requisito casi universal para el movimiento interestatal de ganado y animales de granja en los EE. UU.",
            required: true,
            type: "assumed_certificate",
            condition: "Probablemente aplica a ganado, caballos, aves de corral, etc. NO confirmado para mascotas (perros/gatos).",
            specialInstructions: "CONTACTAR A LA AGENCIA para confirmar. Los requisitos pueden variar según la especie y la enfermedad.",
            appliesTo: ["all"]
        },
        {
            id: "hpai_alert_vt",
            name: "Alerta por Influenza Aviar de Alta Patogenicidad (HPAI)",
            description: "Vermont ha detectado HPAI en aves de corral de traspatio. Esto implica restricciones y requisitos de prueba estrictos para la importación de aves vivas, huevos para incubar y productos avícolas.",
            required: true, 
            type: "disease_control",
            appliesTo: ["poultry", "gamebirds", "captive wild birds"]
        },
        {
            id: "pets_requirement_vt",
            name: "Requisitos para Perros y Gatos (Mascotas)",
            description: "La información proporcionada no menciona requisitos de entrada para perros y gatos. Es probable que no se requiera un CVI estatal para mascotas que se mudan con dueños.",
            required: false, 
            type: "unclear",
            specialInstructions: "VERIFICACIÓN CRÍTICA REQUERIDA. Contactar al Programa de Salud Animal al 802.828.2421. Las aerolíneas y los transportistas tienen sus propias normas.",
            appliesTo: ["dog", "cat"]
        },
        {
            id: "contact_animal_health_vt",
            name: "Contacto Directo - Programa de Salud Animal",
            description: "La fuente de información definitiva para todos los requisitos de importación, especialmente para especies no cubiertas claramente en línea.",
            required: true, 
            type: "mandatory_contact",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.VermontPetTravelForm = VermontPetTravelForm;
    window.VTPetTravelForm = VermontPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('VT', VermontPetTravelForm);
    }
})();