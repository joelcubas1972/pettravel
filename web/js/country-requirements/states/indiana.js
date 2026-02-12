const IndianaPetTravelForm = {
    stateCode: "IN",
    stateName: "Indiana",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirements: [
        {
            id: "cvi_requirement_in",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Documento obligatorio completado por un veterinario licenciado y acreditado. Debe contener una descripción física (raza, sexo, edad, color) que identifique al animal individualmente.",
            required: true,
            type: "certificate",
            deadline: "30 días antes de la entrada a Indiana",
            specialInstructions: "NO utilizar el formulario APHIS 7001 a menos que sea la versión física de copias carbón impresa por USDA, con un número de certificado único y validada con firma oficial de USDA.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_in",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para perros y gatos de 3 meses de edad o más. Perros/gatos: la vacuna debe administrarse en los 12 o 36 meses previos a la entrada (según el tipo de vacuna). Hurones: la vacuna debe administrarse en los 12 meses previos a la entrada.",
            required: true,
            type: "vaccine",
            details: "Es obligatorio por ley para todos los perros, gatos y hurones mayores de 3 meses en Indiana.",
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
            id: "health_condition_in",
            name: "Condición de Salud General y Cuarentena por Rabia",
            description: "No se puede transportar a Indiana un animal sospechoso de tener rabia. Un animal expuesto a rabia no puede ingresar a Indiana durante un año desde la fecha de exposición.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_in",
            name: "Permiso de Entrada (si aplica)",
            description: "Generalmente NO requerido. Se requiere SOLO si el animal se origina en un área bajo cuarentena por rabia.",
            required: false,
            type: "permit",
            condition: "Solo si el origen es un área bajo cuarentena por rabia.",
            contact: "Obtenible llamando al (317) 544-2400.",
            appliesTo: ["all"]
        },
        {
            id: "testing_in",
            name: "Pruebas de Enfermedad",
            description: "NO se requieren pruebas específicas para la entrada de perros, gatos o hurones a Indiana.",
            required: false,
            type: "testing"
        },
        {
            id: "federal_requirements_in",
            name: "Requisitos Federales para Importación Internacional",
            description: "Las mascotas que ingresan a Indiana desde otro país deben cumplir primero con los estándares de importación de EE.UU. establecidos por el USDA-APHIS. Los requisitos varían según el país de origen.",
            required: true, // Es un prerrequisito para la entrada internacional.
            type: "federal_requirements",
            appliesTo: ["dog", "cat", "ferret"],
            link: "https://www.aphis.usda.gov/aphis/pet-travel/bring-pet-into-the-united-states"
        },
        {
            id: "international_reporting_in",
            name: "Notificación de Importación Internacional",
            description: "Para importaciones internacionales: la persona que recibe el perro o gato en Indiana DEBE enviar por correo electrónico una copia del CVI a la Junta Estatal de Salud Animal de Indiana dentro de los 30 días posteriores a la recepción del animal.",
            required: true, // Solo para importaciones internacionales.
            type: "reporting",
            condition: "Solo para perros y gatos importados de otros países.",
            contact: "Enviar CVI a: animalhealth@boah.in.gov",
            appliesTo: ["all"]
        },
        {
            id: "age_restriction_sale_in",
            name: "Restricción de Edad para la Venta",
            description: "No se puede importar a Indiana, ni exportar desde Indiana, ningún perro menor de 8 semanas de edad para su venta, a menos que sea transportado con su madre (dama).",
            required: false,
            type: "general",
            condition: "Solo para perros destinados a la venta.",
            appliesTo: ["dog"]
        }
    ]
};

(function() {
    window.IndianaPetTravelForm = IndianaPetTravelForm;
    window.INPetTravelForm = IndianaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('IN', IndianaPetTravelForm);
    }
})();