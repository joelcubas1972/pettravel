const HawaiiPetTravelForm = {
    stateCode: "HI",
    stateName: "Hawaii",
    acceptsDigitalSignature: false, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["APHIS 7001"], 
    
    isRabbitQuarantineArea: false, // No aplica; la normativa es solo para perros, gatos y carnívoros.
    requirements: [
        {
            id: "import_form_aqs279_hi",
            name: "Formulario de Importación de Perros y Gatos (AQS-279)",
            description: "Formulario oficial obligatorio que debe completarse y enviarse, junto con todos los documentos previos a la llegada y el pago, AL MENOS 10 DÍAS ANTES de la llegada de la mascota a Hawái para calificar para programas de cuarentena reducida.",
            required: true,
            type: "application",
            deadline: "10 días antes de la llegada a Hawái.",
            specialInstructions: "Un formulario por mascota. Debe incluir información completa del propietario y la mascota. Se envía junto con: certificados originales de vacunación antirrábica (las 2 más recientes), certificado de salud, y pago (cheque de cajero o giro postal a nombre del 'Department of Agriculture & Biosecurity').",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_hi",
            name: "Certificado de Vacunación Antirrábica",
            description: "Se requieren AL MENOS DOS vacunas antirrábicas a lo largo de la vida. La más reciente debe administrarse NO MENOS de 30 días antes de la llegada a Hawái y debe estar vigente.",
            required: true,
            type: "vaccine",
            details: "Certificado original requerido. Debe incluir fabricante, número de lote y fecha de vencimiento. No se aceptan vacunas de virus vivo modificado.",
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
            id: "favn_test_hi",
            name: "Prueba de Anticuerpos contra la Rabia (OIE-FAVN Test)",
            description: "Prueba de sangre obligatoria para calificar para la Liberación Directa en el Aeropuerto o el programa de 5 Días o Menos. El resultado debe ser 'PASANDO' y la muestra debe llegar al laboratorio autorizado (ej. Kansas State University) AL MENOS 120 días antes de la llegada a Hawái. Además, debe haber un período de espera de 30 días desde que la muestra llega al laboratorio antes de que la mascota pueda entrar a Hawái.",
            required: true, 
            type: "testing",
            deadline: "Muestra al laboratorio ≥120 días antes de la llegada; espera de 30 días después de la muestra.",
            specialInstructions: "'Hawái' debe listarse como destino en el formulario de envío al laboratorio. Los resultados los envía el laboratorio directamente a Hawái. Se puede verificar el estatus en línea en el sitio web del Departamento de Agricultura de Hawái.",
            appliesTo: ["all"]
        },
        {
            id: "microchip_hi",
            name: "Microchip Electrónico",
            description: "Obligatorio para todos los animales en los programas de cuarentena reducida. Debe implantarse ANTES de la prueba de sangre FAVN.",
            required: true, // Para programas de cuarentena reducida.
            type: "identification",
            specialInstructions: "El número del microchip debe coincidir en todos los documentos (FAVN, certificado de salud, formulario AQS-279).",
            appliesTo: ["all"]
        },
        {
            id: "health_certificate_hi",
            name: "Certificado de Salud",
            description: "Debe ser emitido por un veterinario acreditado dentro de los 14 días previos a la llegada a Hawái. Si no se puede enviar con 10 días de anticipación, el ORIGINAL debe presentarse al inspector a la llegada.",
            required: true,
            type: "certificate",
            deadline: "Emitido ≤14 días antes de la llegada; enviado idealmente ≥10 días antes.",
            specialInstructions: "Debe indicar que la mascota está libre de garrapatas (o tratada con un producto aceptado), libre de signos de enfermedad infecciosa, e incluir el número de microchip.",
            appliesTo: ["all"]
        },
        {
            id: "quarantine_fee_hi",
            name: "Pago de Tarifas de Cuarentena",
            description: "Tarifas varían según el programa y deben pagarse por adelantado con cheque de cajero o giro postal.",
            required: true,
            type: "fee",
            details: "Liberación Directa en Honolulu: $185* ($244 si documentos no se reciben 10+ días antes). 5 Días o Menos: $244. Permiso para Isla Vecina: $165. *Honolulu: llegada entre 8:30 am y 3:30 pm para liberación el mismo día.",
            appliesTo: ["all"]
        },
        {
            id: "neighbor_island_permit_hi",
            name: "Permiso de Inspección para Islas Vecinas (NIIP)",
            description: "OBLIGATORIO para volar con una mascota DIRECTAMENTE a los aeropuertos de Kona (KOA), Kahului (OGG) en Maui, o Līhu'e (LIH) en Kaua'i. NO se requiere para llegar al aeropuerto de Honolulu (HNL).",
            required: false, // Solo si se vuela directamente a una isla vecina.
            type: "permit",
            condition: "Para vuelos directos a Kona, Maui o Kaua'i.",
            specialInstructions: "Debe solicitarse CON AL MENOS 30 DÍAS de antelación al Departamento de Cuarentena Animal, adjuntando confirmación de reserva con una clínica veterinaria aprobada en esa isla para realizar la inspección a la llegada. La clínica cobrará una tarifa adicional.",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.HawaiiPetTravelForm = HawaiiPetTravelForm;
    window.HIPetTravelForm = HawaiiPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('HI', HawaiiPetTravelForm);
    }
})();