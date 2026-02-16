var ThailandiaPetTravelForm = {
    countryCode: "TH",
    countryName: "Thailandia",
    acceptsDigitalSignature: false,
    isBlacklisted: true,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "import_permit",
            name: "Permiso de Importación Tailandés",
            description: "Obligatorio. Se solicita por email a la Animal Quarantine Station (AQS) del aeropuerto de entrada, al menos 7 días antes del viaje[citation:2]",
            required: true,
            type: "permit",
            appliesto: ["all"]
        },
        {
            id: "official_health_certificate",
            name: "Certificado Oficial de Salud (OHC)",
            description: "Emitido por veterinario acreditado USDA y ENDOSADO CON TINTA ORIGINAL por USDA APHIS. Válido 10 días desde el endoso[citation:2][citation:3]",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "microchip",
            name: "Microchip",
            description: "Recomendado ISO 11784/11785. El número debe figurar en todos los documentos[citation:2][citation:8]",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccine_dogs_cats",
            name: "Vacuna Antirrábica - Perros y Gatos",
            description: "Obligatoria. Primera vacuna: mascota ≥12 semanas. Período de espera de 21 días tras vacunación primaria[citation:2]",
            required: true,
            conditional: "species == 'dog' || species == 'cat'",
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
            id: "dog_vaccines",
            name: "Otras Vacunas para Perros",
            description: "Moquillo, Hepatitis, Parvovirus, Leptospirosis. Espera de 21 días. Sin vacuna válida de Leptospirosis, requiere prueba negativa ≤30 días antes[citation:2]",
            required: true,
            conditional: "species == 'dog'",
            type: "vaccine",
            appliesto: ["dog"],
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
            id: "cat_vaccines",
            name: "Vacuna para Gatos - Panleucopenia Felina",
            description: "Obligatoria. Período de espera de 21 días tras vacunación primaria[citation:2]",
            required: true,
            conditional: "species == 'cat'",
            type: "vaccine",
            appliesto: ["cat"],
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
            id: "rabbit_requirements",
            name: "Requisitos para Conejos",
            description: "Vacuna antirrábica y tratamiento antiparasitario interno ≥7 días antes de la exportación[citation:2]",
            required: true,
            conditional: "species == 'rabbit'",
            type: "vaccine_treatment",
            appliesto: ["rabbit"],
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
            id: "owner_passport_copy",
            name: "Copia del Pasaporte del Propietario",
            description: "Adjuntar a la solicitud del permiso de importación y llevar original a la inspección[citation:2]",
            required: true,
            type: "document",
            appliesto: ["all"]
        },
        {
            id: "pet_traveling_alone_docs",
            name: "Documentos para Mascotas que Viajan Solas",
            description: "Notificar a la AQS, copia de pasaporte del remitente y de quien recoge en Tailandia, itinerario de vuelo[citation:1]",
            required: true,
            conditional: "traveling_with_pet == 'no'",
            type: "document",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.ThailandiaPetTravelForm) {
        window.ThailandiaPetTravelForm = ThailandiaPetTravelForm;
        window.THPetTravelForm = ThailandiaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('TH', ThailandiaPetTravelForm);
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
