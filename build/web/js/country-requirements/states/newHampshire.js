const NewHampshirePetTravelForm = {
    stateCode: "NH",
    stateName: "New Hampshire",
    acceptsDigitalSignature: true,
    daysBeforeTravelForForm: 10,
    airlineModelRequirements: ["APHIS 7001"],
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_nh",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Requerido para todos los perros, gatos y hurones introducidos o enviados al estado de New Hampshire para fines de transferencia de propiedad. Debe ser emitido por un veterinario acreditado.",
            required: true,
            type: "certificate",
            specialInstructions: "Para perros y gatos: el CVI debe certificar que están libres de evidencia visual de enfermedades contagiosas e infecciosas. Para hurones: debe certificar que están inmunizados contra el moquillo canino."
        },
        {
            id: "vaccination_requirement_nh",
            name: "Vacunación contra Enfermedades Virales Comunes",
            description: "Perros y gatos deben estar inoculados contra enfermedades virales caninas o felinas comunes. La vacunación debe administrarse dentro del año anterior, pero NO menos de 7 días antes de la entrada.",
            required: true,
            type: "vaccine",
            appliesTo: ["dog", "cat"],
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
            id: "minimum_age_nh",
            name: "Edad Mínima para Importación",
            description: "Está prohibido enviar al estado o ofrecer para transferencia de propiedad a cualquier perro o gato menor de 8 semanas de edad.",
            required: true,
            type: "restriction",
            appliesTo: ["dog", "cat"]
        },
        {
            id: "no_specific_req_nh",
            name: "Sin Requisitos Específicos Estatales Encontrados",
            description: "Las reglas administrativas oficiales de New Hampshire (AGR 2112) se aplican específicamente a animales importados 'para fines de transferencia de propiedad'. No se encontraron reglas estatales publicadas para mascotas que viajan personalmente con sus dueños sin cambio de propiedad.",
            required: false,
            type: "general",
            specialInstructions: "Se recomienda consultar con la aerolínea y un veterinario local. Se aplican las regulaciones federales de los CDC para perros que ingresan a EE.UU."
        }
    ]
};

(function () {
    window.NewHampshirePetTravelForm = NewHampshirePetTravelForm;
    window.NHPetTravelForm = NewHampshirePetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('NH', NewHampshirePetTravelForm);
    }
})();