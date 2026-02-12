const ConnecticutPetTravelForm = {
    stateCode: "CT",
    stateName: "Connecticut",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS 7001"], 
    
    isRabbitQuarantineArea: false, // No se menciona cuarentena específica para conejos
    requirements: [
        {
            id: "cvi_requirement_ct",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Un Certificado de Inspección Veterinaria emitido por un veterinario acreditado es generalmente obligatorio para la entrada de ganado y puede ser recomendado o requerido para mascotas domésticas. Válido por 30 días desde la fecha de inspección.",
            required: true, // Específico para ganado, muy recomendado para mascotas
            type: "certificate",
            deadline: "30 días antes del viaje",
            specialInstructions: "Debe incluir identificación del animal, origen, destino y declaración de buena salud. Para ganado, debe seguir las reglas de Trazabilidad de Enfermedades Animales (ADT).",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_ct",
            name: "Vacunación antirrábica y licencia para perros",
            description: "Vacunación contra la rabia actualizada para perros (y gatos, altamente recomendada). Es un requisito legal para obtener la licencia municipal obligatoria para perros mayores de 6 meses.",
            required: true,
            type: "vaccine",
            details: "El certificado de vacunación debe ser presentado al registrador municipal de la ciudad para obtener la licencia del perro. Siga el 'Rabies Manual' de CT para orientación oficial.",
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
            id: "health_condition_ct",
            name: "Condición de salud general",
            description: "El animal debe estar clínicamente sano y libre de evidencia de enfermedades infecciosas, contagiosas o transmisibles en el momento del movimiento.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_ct",
            name: "Verificación de zona de cuarentena/enfermedad",
            description: "Los animales no deben provenir de áreas bajo restricción o cuarentena por enfermedades de declaración obligatoria (ej., influenza aviar, rabia) a menos que se cumplan condiciones específicas.",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_ct",
            name: "Permiso de importación de ganado",
            description: "Se requiere un permiso de importación para traer ganado (incluyendo aves de corral) a Connecticut. El proceso es obligatorio.",
            required: true, // Requisito explícito y destacado para ganado
            type: "permit",
            condition: "Para ganado y aves de corral (no típicamente para mascotas domésticas individuales)",
            link: "Siga los 'pasos obligatorios' en la página de Livestock importation permit",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_ct",
            name: "Condiciones de transporte",
            description: "Los animales deben transportarse en condiciones que aseguren su seguridad, comodidad y bienestar, previniendo lesiones y estrés.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "international_transit_ct",
            name: "Documentación para importación internacional",
            description: "Los animales importados de otros países deben cumplir primero con todos los requisitos federales de USDA-APHIS y CDC. Luego, verificar los requisitos estatales de CT.",
            required: false,
            type: "international_docs",
            condition: "Solo para animales importados directamente de otros países",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_ct",
            name: "Requisitos CDC para perros (a partir del 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU. desde el extranjero: requisitos federales de los CDC, que incluyen microchip, vacuna contra la rabia válida emitida en el extranjero y un permiso de importación de CDC.",
            required: false,
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "local_requirements_ct",
            name: "Licencia municipal para perros y programas locales",
            description: "Todos los perros mayores de 6 meses deben tener una licencia del municipio donde residen. Además, existen programas estatales de esterilización/vacunación a bajo costo y un Sistema de Trazabilidad de Enfermedades Animales (CATS).",
            required: true, // La licencia para perros es un requisito legal estatal
            type: "local_regulations",
            affectedAreas: ["Todos los municipios de CT"],
            contact: ["Registrador municipal local", "CT DoAg: 860-713-2500"],
            appliesTo: ["all"]
        },
        {
            id: "airline_requirements_ct",
            name: "Requisitos específicos de la aerolínea",
            description: "Las aerolíneas que operan en CT (ej., en BDL) tienen políticas propias sobre el transporte de mascotas, incluidos contenedores, ventanas de tiempo para la documentación y tarifas.",
            required: false,
            type: "carrier_requirements",
            instructions: "Verificar con la aerolínea específica antes del viaje.",
            appliesTo: ["all"]
        },
        {
            id: "vet_responsibilities_ct",
            name: "Responsabilidades del veterinario",
            description: "El veterinario debe: estar acreditado, examinar al animal, completar el CVI con precisión, verificar la identificación y la vacunación, y declarar que el animal cumple con los requisitos estatales y federales aplicables.",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.ConnecticutPetTravelForm = ConnecticutPetTravelForm;
    window.CTPetTravelForm = ConnecticutPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('CT', ConnecticutPetTravelForm);
    }
})();