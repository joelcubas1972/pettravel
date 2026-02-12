const DelawarePetTravelForm = {
    stateCode: "DE",
    stateName: "Delaware",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["APHIS 7001"], 
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "official_health_certificate_de",
            name: "Certificado de Salud Oficial",
            description: "Certificado legible en un formulario oficial del estado de origen, aprobado por el funcionario sanitario de ganado de ese estado y emitido por un veterinario acreditado. Es nulo a los 30 días de su emisión.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (válido por 30 días desde la emisión)",
            specialInstructions: "Debe incluir: nombres y direcciones del consignador y consignatario, identificación precisa del animal, estado de salud y resultados de pruebas requeridas. Una copia debe enviarse al Veterinario Estatal antes de la llegada.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_de",
            name: "Vacunación contra la Rabia",
            description: "Perros mayores de 4 meses y gatos mayores de 6 meses deben estar adecuadamente vacunados contra la rabia. El tipo de vacuna y la fecha de administración deben figurar en el certificado de salud oficial.",
            required: true,
            type: "vaccine",
            details: "Aplicable a perros (sección 10.1) y gatos (sección 11.2). El animal NO debe originarse de un área bajo cuarentena por rabia.",
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
            id: "health_condition_de",
            name: "Condición de Salud General",
            description: "El certificado debe indicar que los animales están libres de cualquier enfermedad infecciosa, contagiosa o transmisible y que no han estado expuestos a ellas. Para caballos, se debe incluir una lectura de temperatura tomada no más de 10 días antes de la entrada (<102°F).",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_de",
            name: "Verificación de Zona de Cuarentena",
            description: "Los animales no deben originarse en áreas bajo cuarentena por rabia (para perros/gatos) o por otras enfermedades como brucelosis o tuberculosis (para ganado).",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_de",
            name: "Permiso de Importación (para animales exóticos)",
            description: "Se requiere un permiso para importar muchas especies de animales no nativos de Delaware, incluidos animales de zoológico, híbridos de lobo y ciertos reptiles, ya sean para circos, exhibidores o dueños privados.",
            required: false,
            type: "permit",
            condition: "Para animales silvestres, híbridos o especies no nativas según la sección 20.1.",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_de",
            name: "Condiciones de Transporte y Deberes del Transportista",
            description: "Los vehículos de transporte deben mantenerse en condiciones sanitarias. Los que hayan transportado animales enfermos deben ser limpiados y desinfectados bajo supervisión oficial antes de un nuevo uso.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "species_specific_tests_de",
            name: "Pruebas Específicas por Especie",
            description: "Además del certificado general, existen requisitos de pruebas específicas: Caballos: prueba negativa de Anemia Infecciosa Equina (6-12 meses, según destino). Ganado: pruebas negativas de Brucelosis (30 días) y Tuberculosis (60 días). Ovejas: origen de rebaño libre de prurigo lumbar en 4 años.",
            required: true, 
            type: "testing",
            appliesTo: ["horse", "cattle", "sheep", "goat", "mink", "ratites"]
        },
        {
            id: "federal_cdc_requirements_de",
            name: "Requisitos Federales (USDA/CDC)",
            description: "Todas las importaciones deben cumplir con los requisitos interestatales federales. Para perros que ingresan a EE.UU. desde el extranjero, se aplican las reglas de los CDC a partir del 1 de agosto de 2024.",
            required: true,
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "vet_responsibilities_de",
            name: "Responsabilidades del Veterinario",
            description: "El veterinario emisor debe estar: licenciado, graduado, acreditado y aprobado por el funcionario sanitario de ganado del estado de origen. Debe realizar la inspección, las pruebas requeridas y completar el certificado oficial.",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.DelawarePetTravelForm = DelawarePetTravelForm;
    window.DEPetTravelForm = DelawarePetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('DE', DelawarePetTravelForm);
    }
})();