const MinnesotaPetTravelForm = {
    stateCode: "MN",
    stateName: "Minnesota",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["APHIS 7001"],
    
    isRabbitQuarantineArea: false, 
    requirements: [
        {
            id: "cvi_requirement_mn",
            name: "Certificado de Inspección Veterinaria (CVI)",
            description: "Requerido para todos los perros, gatos y hurones importados a Minnesota desde otro estado de EE.UU. o desde otro país[citation:1]. Debe ser emitido por un veterinario acreditado por el USDA en el estado o país de origen. Es válido para viajar durante 30 días después de su emisión[citation:1].",
            required: true,
            type: "certificate",
            deadline: "30 días antes del viaje (válido por 30 días)[citation:1]",
            specialInstructions: "El CVI debe incluir una declaración de salud específica y ser remitido a las autoridades sanitarias del estado de origen para su aprobación en un plazo de 7 días[citation:1]. **A partir del 1 de julio de 2026, deberá ser un eCVI[citation:1][citation:6]**. Para el ganado, el uso de un eCVI exime del requisito de permiso de importación[citation:1].",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_mn",
            name: "Vacunación contra la Rabia",
            description: "Obligatoria para todos los perros, gatos y hurones de tres meses de edad o más que ingresan a Minnesota. Deben estar vacunados actualmente[citation:1][citation:10].",
            required: true,
            type: "vaccine",
            details: "Los detalles de la vacuna (nombre del producto, fecha de administración) deben figurar en el CVI o debe adjuntarse un certificado de vacunación antirrábica válido[citation:1]. Se aceptan firmas de tinta o firmas digitales verificables[citation:1].",
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
            id: "excepciones_cvi_mn",
            name: "Excepciones al Requisito del CVI",
            description: "Un CVI NO es requerido en las siguientes situaciones[citation:1][citation:10]:",
            required: false,
            type: "exemption",
            specialInstructions: "1) Animales que ingresan a una instalación veterinaria para tratamiento, cirugía o procedimientos de diagnóstico[citation:1][citation:10]. 2) Animales que ingresan temporalmente al estado sin cambio de propiedad y que saldrán dentro de los 30 días[citation:1][citation:10]. 3) Perros o gatos importados para investigación en instituciones educativas y científicas[citation:1][citation:10]. 4) Animales de un estado adyacente que ingresan a una perrera autorizada que cumple condiciones específicas[citation:10].",
            appliesTo: ["all"]
        },
        {
            id: "importacion_internacional_mn",
            name: "Requisitos de Importación Internacional",
            description: "Los perros, gatos y hurones que llegan desde otro país deben cumplir con los requisitos federales de los CDC y el USDA, y además necesitan un CVI válido del país de origen[citation:1]. Aquellos provenientes de países con Peste Porcina Africana (ASF) están sujetos a una cuarentena de 10 días[citation:1].",
            required: true,
            type: "international_docs",
            specialInstructions: "El CVI internacional debe cumplir con la misma declaración de salud y listar la información del propietario, descripción del animal y vacunas[citation:1]. El Pasaporte de Mascotas de la UE **NO** es aceptado como un CVI válido, pero SÍ puede ser aceptado como prueba de vacunación antirrábica[citation:1].",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "permiso_importacion_mn",
            name: "Permiso de Importación (para otras especies)",
            description: "Se requiere un permiso de importación para el ganado (según su categoría), cérvidos de granja, y pollitos, aves de corral y ratites[citation:1][citation:4]. Los permisos para ganado son gratuitos y se solicitan en línea[citation:1][citation:4].",
            required: false,
            type: "permit",
            condition: "Para ganado (bovinos/bisontes) de cría, exposición o que requieran prueba de tuberculosis; cérvidos de granja; aves de corral/pollitos[citation:1][citation:4].",
            specialInstructions: "La exención del permiso para ganado: si se emite y recibe un CVI electrónico (eCVI) que cumpla con las reglas estatales[citation:1][citation:4]. Contacto para permisos: 651-296-2942 o correo electrónico[citation:1][citation:2].",
            appliesTo: ["all"]
        }
    ]
   
};

(function() {
    window.MinnesotaPetTravelForm = MinnesotaPetTravelForm;
    window.MNPetTravelForm = MinnesotaPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MN', MinnesotaPetTravelForm);
    }
})();