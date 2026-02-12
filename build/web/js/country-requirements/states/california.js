const CaliforniaPetTravelForm = {
    stateCode: "CA",
    stateName: "California",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS 7001"],
    isRabbitQuarantineArea: false, 
    requirements: [
        {
            id: "cvi_requirement_ca",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Un Certificado Oficial de Inspección Veterinaria emitido por un veterinario acreditado es generalmente obligatorio para la entrada de la mayoría de los animales de compañía y ganado. Válido por 30 días.",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje",
            specialInstructions: "Debe incluir identificación oficial del animal (microchip, tatuaje, etc.), origen, destino y declaración de buena salud. Verifique requisitos específicos por especie en el portal CDFA.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_ca",
            name: "Certificado de vacunación antirrábica",
            description: "Se requiere vacunación contra la rabia actualizada para perros, gatos y hurones mayores de 4 meses. Las mascotas más jóvenes deben estar acompañadas por la madre o confinadas.",
            required: true,
            type: "vaccine",
            details: "El certificado debe incluir fecha de vacunación, fabricante, número de lote y fecha de vencimiento. La vacuna debe administrarse de acuerdo con el compendio de rabia de la NASPHV.",
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
            id: "health_condition_ca",
            name: "Condición de salud general",
            description: "El veterinario certifica que los animales han sido inspeccionados y se encuentran libres de evidencia de enfermedades infecciosas, contagiosas o transmisibles, y no han estado expuestos a tales enfermedades en los 30 días anteriores.",
            required: true,
            type: "health_check",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_check_ca",
            name: "Verificación de zona de cuarentena/enfermedad",
            description: "Los animales no deben provenir de un área bajo cuarentena por enfermedad declarada (rabia, enfermedades exóticas) en los 30 días anteriores al movimiento.",
            required: true,
            type: "verification",
            appliesTo: ["all"]
        },
        {
            id: "import_permit_ca",
            name: "Permiso de entrada (si aplica)",
            description: "Se pueden requerir permisos de entrada adicionales para animales exóticos, primates, camélidos, cérvidos o importaciones de otros países. No es típico para mascotas domésticas comunes.",
            required: false,
            type: "permit",
            condition: "Para especies no domésticas comunes (exóticas, ganado especial) o importaciones internacionales",
            appliesTo: ["all"]
        },
        {
            id: "transport_conditions_ca",
            name: "Condiciones de transporte",
            description: "Los animales deben transportarse en vehículos o contenedores adecuados para su especie, tamaño y número, que los protejan de lesiones y mantengan condiciones sanitarias.",
            required: true,
            type: "transport",
            appliesTo: ["all"]
        },
        {
            id: "international_transit_ca",
            name: "Documentación adicional para importación internacional",
            description: "Los animales importados de otros países deben cumplir con los requisitos federales de USDA-APHIS y CDC, y pueden necesitar cuarentena o pruebas adicionales.",
            required: false,
            type: "international_docs",
            condition: "Solo para animales importados directamente de otros países",
            appliesTo: ["all"]
        },
        {
            id: "cdc_requirements_ca",
            name: "Requisitos CDC para perros (a partir del 1 de agosto de 2024)",
            description: "Para perros que ingresan a EE.UU. desde el extranjero: requisitos actualizados de los Centros para el Control de Enfermedades (CDC), que pueden incluir microchip, vacuna contra la rabia válida emitida en el extranjero y permiso CDC.",
            required: false,
            type: "federal_requirements",
            appliesTo: ["dog"]
        },
        {
            id: "local_requirements_ca",
            name: "Requisitos locales específicos",
            description: "Algunos condados o ciudades dentro de California pueden tener ordenanzas adicionales sobre licencias, vacunas (como la de la tos de las perreras) o restricciones de razas.",
            required: false,
            type: "local_regulations",
            affectedAreas: ["Varía por ciudad/condado"],
            contact: ["Departamento de salud o control animal local"],
            appliesTo: ["all"]
        },
        {
            id: "airline_requirements_ca",
            name: "Requisitos específicos de la aerolínea",
            description: "Las aerolíneas que operan en California pueden tener políticas propias sobre el transporte de mascotas, incluidos los tipos de contenedores, ventanas de tiempo para el CVI y cargos.",
            required: false,
            type: "carrier_requirements",
            instructions: "Verificar con la aerolínea específica y el aeropuerto de llegada (LAX, SFO, etc.) antes del viaje.",
            appliesTo: ["all"]
        },
        {
            id: "vet_responsibilities_ca",
            name: "Responsabilidades del veterinario",
            description: "El veterinario debe: estar acreditado y licenciado, examinar al animal, completar el CVI con precisión, verificar la identificación y la vacunación, y declarar que el animal cumple con los requisitos de entrada de California.",
            required: true,
            type: "vet_verification",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.CaliforniaPetTravelForm = CaliforniaPetTravelForm;
    window.CAPetTravelForm = CaliforniaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('CA', CaliforniaPetTravelForm);
    }
})();