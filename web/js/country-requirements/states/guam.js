const GuamPetTravelForm = {
    stateCode: "GU",
    stateName: "Guam",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 10, 
    airlineModelRequirements: ["APHIS 7001"], 
    
    isRabbitQuarantineArea: false, // No aplica; la normativa se centra en perros, gatos y carnívoros.
    requirements: [
        {
            id: "entry_permit_gu",
            name: "Permiso de Entrada (Entry Permit)",
            description: "Documento obligatorio por ley (Título 10 Código de Guam) para TODO animal vivo que ingrese a Guam. Se debe solicitar con antelación enviando la documentación y un pago no reembolsable de $60 por animal + $5 por licencia anual.",
            required: true,
            type: "permit",
            deadline: "Solicitar con 2-3 meses de antelación (recomendado).",
            specialInstructions: "Enviar solicitud completa al Departamento de Agricultura de Guam (doag.guam.gov). El permiso debe adjuntarse al transportín/kennel durante el viaje.",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_gu",
            name: "Certificado de Vacunación Antirrábica",
            description: "Se requieren AL MENOS DOS vacunas antirrábicas a lo largo de la vida del animal para su liberación. La más reciente debe ser monovalente, inactivada y estar vigente (≤365 días o ≤36 meses si es vacuna trienal aprobada).",
            required: true,
            type: "vaccine",
            details: "NO vacunar después de extraer sangre para la prueba FAVN. Evitar el uso de vacunas de virus vivo modificado (puede alargar la cuarentena 6 meses). El certificado debe incluir fabricante, número de lote y fecha de vencimiento.",
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
            id: "favn_test_gu",
            name: "Prueba de Anticuerpos contra la Rabia (OIE-FAVN Test)",
            description: "Prueba de sangre para medir el nivel de anticuerpos contra la rabia. Requisito FUNDAMENTAL para optar a cuarentenas reducidas (Calculada o en Hogar). El resultado debe ser ≥0.5 IU/mL (Calculada) o ≥1.0 IU/mL (Cuarentena en Hogar).",
            required: true, // Para cualquier programa que no sea la Cuarentena Comercial de 120 días.
            type: "testing",
            deadline: "La muestra debe llegar al laboratorio autorizado (ej. Kansas State Univ.) al menos 120 días antes de la llegada a Guam para la 'Cuarentena Calculada'.",
            specialInstructions: "El laboratorio debe enviar los resultados DIRECTAMENTE al Departamento de Agricultura de Guam. El número de microchip debe estar en el informe.",
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
            id: "microchip_gu",
            name: "Microchip Electrónico",
            description: "Obligatorio para todos los animales que busquen una cuarentena inferior a 120 días. Debe ser fabricado en EE.UU. y legible con un escáner universal AVID (ej. chips AVID, HomeAgain).",
            required: true, // Para programas de cuarentena reducida.
            type: "identification",
            specialInstructions: "Debe implantarse ANTES de la extracción de sangre para la prueba FAVN. El número debe registrarse en todos los documentos (FAVN, certificado de salud).",
            appliesTo: ["all"]
        },
        {
            id: "health_certificate_gu",
            name: "Certificado de Salud",
            description: "Debe ser emitido por un veterinario acreditado dentro de los 10 DÍAS previos a la llegada a Guam. Debe ser un documento original (se acepta copia para trámite) en inglés.",
            required: true,
            type: "certificate",
            deadline: "10 días antes de la llegada.",
            specialInstructions: "Debe incluir: descripción completa del animal, declaración de estar libre de enfermedades, detalles del tratamiento antiparasitario interno/externo (dentro de 14 días), número de microchip y detalles de la vacuna antirrábica.",
            appliesTo: ["all"]
        },
        {
            id: "other_vaccines_gu",
            name: "Otras Vacunas Obligatorias",
            description: "Además de la rabia, se requieren otras vacunas específicas por especie, administradas al menos 10 días antes del viaje y vigentes a la llegada.",
            required: true,
            type: "vaccine",
            details: "PERROS: Moquillo, Hepatitis/ Adenovirus-2, Leptospirosis, Parainfluenza, Parvovirus, Bordetella (tos de las perreras). GATOS: Panleucopenia, Rinotraqueítis Viral, Calicivirus.",
            appliesTo: ["dog", "cat", "ferret"]
        },
        {
            id: "quarantine_program_gu",
            name: "Reserva y Cumplimiento del Programa de Cuarentena",
            description: "Dependiendo del origen y preparación, el animal ingresará en uno de los 4 programas: 1) Cuarentena Comercial de 120 días (defecto), 2) Cuarentena Calculada, 3) ≤5 días en Instalación + Cuarentena en Hogar (solo EE.UU./personal militar), 4) Exento (solo de áreas libres de rabia como Hawái o Japón).",
            required: true,
            type: "quarantine",
            specialInstructions: "Para animales de áreas no exentas, se debe adjuntar al paquete de solicitud la reserva CONFIRMADA en una instalación de cuarentena aprobada (ej. Harper Valley Kennels). Contactarlas directamente para tarifas.",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.GuamPetTravelForm = GuamPetTravelForm;
    window.GUPetTravelForm = GuamPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('GU', GuamPetTravelForm);
    }
})();