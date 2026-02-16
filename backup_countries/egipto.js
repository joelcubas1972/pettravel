var EgiptoPetTravelForm = {
    countryCode: "EG",
    countryName: "Egipto",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "microchip_iso",
            name: "Microchip ISO 11784/11785",
            description: "Microchip compatible con ISO 11784/11785 (15 dígitos). Aunque no es un requisito formal para la entrada directa, es muy recomendado para facilitar la identificación y por si el itinerario incluye tránsito por un país de la UE[citation:8].",
            required: false,
            recommended: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccination_eg",
            name: "Vacunación Antirrábica",
            description: "Vacuna obligatoria contra la rabia. Debe administrarse al menos **30 días antes del ingreso** a Egipto[citation:4][citation:5][citation:8]. La vacunación no debe realizarse antes de los 3 meses de edad[citation:8].",
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
            id: "health_certificate_eg",
            name: "Certificado de Salud USDA y Endoso",
            description: "Certificado de salud para mascotas emitido por un veterinario acreditado por el USDA. Este certificado debe ser **refrendado y estampado (endorsed)** por una oficina del USDA APHIS. El proceso puede realizarse a través del sistema VEHCS[citation:2].",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.EgiptoPetTravelForm) {
        window.EgiptoPetTravelForm = EgiptoPetTravelForm;
        window.EGPetTravelForm = EgiptoPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('EG', EgiptoPetTravelForm);
    }
})();
// ✅ CORREGIDO: Espera a que petTravelDB exista
(function ensurePetTravelDB() {
    if (window.petTravelDB && typeof window.petTravelDB.addCountry === 'function') {
        if (window.SpainPetTravelForm) {
            window.petTravelDB.addCountry(window.SpainPetTravelForm.countryCode, window.SpainPetTravelForm);
        }
    } else {
        setTimeout(ensurePetTravelDB, 50);
    }
})();
