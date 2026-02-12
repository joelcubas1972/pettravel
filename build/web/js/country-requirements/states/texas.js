const TexasPetTravelForm = {
    stateCode: "TX",
    stateName: "Texas",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["OCVI, APHIS 7001"],
    
    isRabiesQuarantineArea: false,
    requirements: [
        {
            id: "rabies_vaccine_tx",
            name: "Certificado de Vacunación Antirrábica",
            description: "Vacuna antirrábica obligatoria para todos los perros y gatos de 12 semanas o más. El certificado debe estar firmado por el veterinario que administró la vacuna.",
            required: true,
            type: "vaccine",
            deadline: "Al menos 30 días antes de la entrada si es vacuna inicial",
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
            id: "confinement_initial_vax_tx",
            name: "Confinamiento por Vacunación Inicial",
            description: "Si es la primera vacuna antirrábica y se administró hace menos de 30 días, el animal debe ser confinado en casa por el resto del período de 30 días.",
            required: true,
            type: "health_order",
            condition: "Solo si vacuna inicial < 30 días antes de la entrada",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "confinement_underage_tx",
            name: "Confinamiento para Animales Menores de 12 Semanas",
            description: "Animales menores de 12 semanas que ingresen desde otro país deben ser confinados en casa hasta 30 días después de su primera vacuna antirrábica. Para animales que ingresen desde otro estado de EE.UU., se recomienda el confinamiento.",
            required: true, // Obligatorio para entrada internacional, recomendado para interestatal
            type: "health_order",
            condition: "Solo si animal < 12 semanas de edad",
            appliesTo: ["all"]
        },
        {
            id: "airline_health_cert_tx",
            name: "Certificado de Salud de la Aerolínea",
            description: "La mayoría de las aerolíneas requieren un certificado de salud emitido por un veterinario dentro de los 7 a 10 días previos al viaje, aunque Texas no lo exija por ley.",
            required: false, // Requisito de la aerolínea, no estatal
            type: "certificate",
            deadline: "7-10 días antes del viaje",
            instructions: "Verificar con la aerolínea sus requisitos específicos.",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_dogs_tx",
            name: "Requisitos Federales CDC para Perros (a partir del 1 de agosto de 2024)",
            description: "Nuevos requisitos de entrada a EE.UU. para perros, que dependen de dónde ha estado el perro en los últimos 6 meses. Estos son adicionales a la ley de Texas.",
            required: true, 
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "usda_international_tx",
            name: "Requisitos USDA/CFIA para Entrada Internacional",
            description: "Para animales que ingresan desde otro país, se deben cumplir los requisitos federales del USDA (y de la CFIA si transita por Canadá). El CDC también regula la entrada de mascotas.",
            required: true, 
            type: "federal_requirements",
            condition: "Solo para entrada desde otro país",
            contacts: ["USDA APHIS: 844-820-2234", "CDC DGMQ: 800-232-4636"],
            appliesTo: ["all"],
            links: [
                "https://www.aphis.usda.gov/aphis/pet-travel",
                "https://www.cdc.gov/importation/bringing-an-animal-into-the-united-states/index.html"
            ]
        },
        {
            id: "local_ordinances_tx",
            name: "Ordenanzas Locales de Vacunación",
            description: "Después de mudarse a Texas, debe cumplir con las ordenanzas locales (municipio/condado), que pueden ser más restrictivas que la ley estatal.",
            required: true,
            type: "local_regulations",
            instructions: "Contactar a un veterinario local después de la llegada para asegurar el cumplimiento.",
            appliesTo: ["all"]
        },
        {
            id: "livestock_requirements_tx",
            name: "Requisitos para Ganado/Mascotas Exóticas",
            description: "La Comisión de Salud Animal de Texas (TAHC) requiere CVI para ganado, aves de corral y especies exóticas de ganado.",
            required: false,
            type: "certificate",
            condition: "Solo para especies reguladas por TAHC (NO perros/gatos mascota)",
            contact: "Texas Animal Health Commission: 512-719-0700",
            appliesTo: ["cow", "horse", "sheep"]
            
        }
    ]
};

(function() {
    window.TexasPetTravelForm = TexasPetTravelForm;
    window.TXPetTravelForm = TexasPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('TX', TexasPetTravelForm);
    }
})();