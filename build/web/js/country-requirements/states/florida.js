const FloridaPetTravelForm = {
    stateCode: "FL",
    stateName: "Florida",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["APHIS 7001"],
    
    isRabbitQuarantineArea: false, // No se menciona cuarentena específica para conejos en los requisitos generales.
    requirements: [
        {
            id: "ocvi_requirement_fl",
            name: "Certificado Oficial de Inspección Veterinaria (OCVI)",
            description: "Documento firmado por un veterinario acreditado que declara que el animal ha sido examinado, está sano y no muestra signos de enfermedad contagiosa[citation:7]. También conocido como 'certificado de salud'.",
            required: true,
            type: "certificate",
            deadline: null, // INFORMACIÓN NO ESPECÍFICA. No se define un plazo claro de emisión antes del viaje.
            specialInstructions: "Debe indicar que el animal: 1) Está libre de signos de enfermedad infecciosa o contagiosa, 2) NO se origina en un área bajo cuarentena por rabia, y 3) No tiene historial de exposición conocida a un animal rabioso[citation:7].",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_fl",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para perros, gatos y hurones de 3 meses de edad o más que son transportados a Florida. La vacuna inicial debe administrarse a las 12 semanas y el animal debe estar vacunado a los 4 meses[citation:7].",
            required: true,
            type: "vaccine",
            details: "El animal se considera 'actualmente vacunado' 28 días después de la dosis inicial. Un refuerzo es obligatorio 1 año después de la primera vacuna, independientemente de si fue de 1 o 3 años. Posteriormente, el intervalo sigue la etiqueta del fabricante[citation:7].",
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
            id: "health_condition_fl",
            name: "Condición de Salud General",
            description: "El OCVI debe certificar que el animal está libre de signos de cualquier enfermedad infecciosa o contagiosa[citation:7].",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_fl",
            name: "Verificación de Cuarentena por Rabia",
            description: "El OCVI debe declarar que el animal NO se origina en un área bajo cuarentena por rabia[citation:7]. Si proviene de tal área, se requiere un 'Número de Permiso Previo' del Departamento de Florida escrito en el OCVI[citation:7].",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_fl",
            name: "Permiso de Importación para Animales Exóticos/Silvestres",
            description: "Cualquier especie no nativa (mamífero, ave, reptil, anfibio) que ingrese a Florida para cualquier propósito (mascota personal, vacaciones, exposición) requiere un permiso de importación de la Comisión de Conservación de Vida Silvestre (FWC) ANTES de ingresar al estado[citation:5].",
            required: false, 
            type: "permit",
            condition: "Para animales silvestres no nativos. No aplica a perros, gatos domésticos, hurones, conejos[citation:5].",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_fl",
            name: "Condiciones de Transporte",
            description: "Información no especificada en las fuentes oficiales consultadas. Se aplican las mejores prácticas estándar.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_fl",
            name: "Requisitos CDC para Perros que Ingresan a EE.UU.",
            description: "Para perros que ingresan a EE.UU. desde el extranjero, los Centros para el Control de Enfermedades (CDC) tienen requisitos obligatorios separados (microchip, vacunación antirrábica, formulario). Esto es independiente de los requisitos de Florida[citation:6].",
            required: false, 
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "vet_responsibilities_fl",
            name: "Responsabilidades del Veterinario",
            description: "El veterinario debe estar acreditado y licenciado para emitir el OCVI. Debe mantener los registros de vacunación antirrábica durante al menos 3 años[citation:7].",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.FloridaPetTravelForm = FloridaPetTravelForm;
    window.FLPetTravelForm = FloridaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('FL', FloridaPetTravelForm);
    }
})();