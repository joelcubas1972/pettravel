var JaponPetTravelForm = {
    countryCode: "JP",
    countryName: "Japón",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "advance_notification_40_days",
            name: "Notificación previa al AQS (40 días)",
            description: "Notificación obligatoria al Animal Quarantine Service (AQS) de Japón con al menos 40 días de anticipación a la llegada[citation:4]",
            required: true,
            type: "prior_notification",
            appliesto: ["all"]
        },
        {
            id: "iso_microchip_before_vaccine",
            name: "Microchip ISO antes de la vacuna",
            description: "Implantación de microchip ISO 11784/11785 antes (o el mismo día) de la primera vacunación antirrábica[citation:4]",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "two_rabies_vaccinations",
            name: "Dos vacunaciones antirrábicas",
            description: "Dos vacunas con virus inactivado o recombinante. La primera a los ≥91 días de edad, la segunda al menos 30 días después, dentro del periodo de inmunidad de la primera[citation:4]",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat", "ferret"],
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
            id: "rabies_titer_test_0.5",
            name: "Prueba de anticuerpos antirrábicos",
            description: "Titulación de anticuerpos ≥0.5 IU/ml, realizada después de la segunda vacuna en un laboratorio designado por Japón. Muestra válida por 2 años[citation:4]",
            required: true,
            type: "test",
            appliesto: ["dog", "cat", "ferret"],
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
            id: "180_day_waiting_period",
            name: "Periodo de espera de 180 días",
            description: "La entrada a Japón debe ocurrir 180 días o más después de la fecha de la muestra de sangre para la prueba de anticuerpos (contando el día de la muestra como día 0)[citation:4]",
            required: true,
            type: "waiting_period",
            appliesto: ["all"]
        },
        {
            id: "health_certificate_endorsement",
            name: "Certificado de salud y endoso USDA",
            description: "Certificado de salud (preferiblemente Formulario AC) completado por veterinario acreditado y endosado por USDA APHIS, emitido dentro de los 10 días previos a la salida[citation:4][citation:6]",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "pre_export_clinical_inspection",
            name: "Inspección clínica previa a la salida",
            description: "Examen clínico dentro de los 10 días anteriores a la salida para verificar ausencia de signos de rabia y, para perros, leptospirosis[citation:4]",
            required: true,
            type: "health_check",
            appliesto: ["dog", "cat", "ferret"]
        }
    ]
};

(function () {
    if (!window.JaponPetTravelForm) {
        window.JaponPetTravelForm = JaponPetTravelForm;
        window.JPPetTravelForm = JaponPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('JP', JaponPetTravelForm);
    }
})();