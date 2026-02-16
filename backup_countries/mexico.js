var MexicoPetTravelForm = {
    countryCode: "MX",
    countryName: "México",
    acceptsDigitalSignature: false,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "no_health_certificate_dogs_cats",
            name: "NO se requiere certificado de salud para perros y gatos",
            description: "Desde el 16 de diciembre de 2019, perros y gatos NO requieren certificado de salud para ingresar a México",
            required: false,
            type: "policy",
            appliesto: ["dog", "cat"]
        },
        {
            id: "senasica_inspection",
            name: "Inspección obligatoria por SENASICA",
            description: "Todos los perros y gatos serán inspeccionados por SENASICA en la frontera",
            required: true,
            type: "inspection",
            appliesto: ["dog", "cat"]
        },
        {
            id: "health_certificate_birds",
            name: "Certificado de salud para aves",
            description: "Aves REQUIEREN certificado de salud con firma digital APHIS",
            required: false,
            type: "certificate",
            appliesto: ["bird"]
        },
        {
            id: "health_certificate_chinchillas",
            name: "Certificado de salud para chinchillas",
            description: "Chinchillas REQUIEREN certificado de salud con firma en tinta + sello APHIS",
            required: false,
            type: "certificate",
            appliesto: ["chinchillas"]
        },
        {
            id: "health_certificate_ferrets",
            name: "Certificado de salud para hurones",
            description: "Hurones REQUIEREN certificado de salud con firma en tinta + sello APHIS",
            required: false,
            type: "certificate",
            appliesto: ["ferret"]
        },
        {
            id: "free_infectious_diseases",
            name: "Libre de enfermedades infecciosas",
            description: "Mascotas deben estar libres de signos de enfermedades infecciosas",
            required: true,
            type: "health_status",
            appliesto: ["all"]
        },
        {
            id: "free_ectoparasites",
            name: "Libre de ectoparásitos",
            description: "Sin pulgas, garrapatas o piojos. Si se detectan garrapatas: SENASICA toma muestra para diagnóstico",
            required: true,
            type: "parasite_treatment",
            appliesto: ["all"]
        },
        {
            id: "no_fresh_wounds",
            name: "Sin heridas frescas o en cicatrización",
            description: "Mascotas no deben presentar heridas visibles. Si hay heridas: documentación veterinaria requerida",
            required: true,
            type: "health_status",
            appliesto: ["all"]
        },
        {
            id: "format_requirements",
            name: "Requisitos de formato estricto",
            description: "Para certificados requeridos: mecanografiado, sin abreviaturas, impreso una cara, sin correcciones",
            required: false,
            type: "format",
            appliesto: ["all"]
        },
        {
            id: "screwworm_awareness",
            name: "México afectado por gusano barrenador",
            description: "México considerado afectado por gusano barrenador desde noviembre 2024. Perros que regresan a EE.UU. requieren certificación",
            required: true,
            type: "health_status",
            appliesto: ["dog"]
        },
        {
            id: "avian_influenza_free",
            name: "Estado libre de influenza aviar",
            description: "Para aves: estado de origen debe estar libre de HPAI en aves comerciales",
            required: false,
            type: "health_status",
            appliesto: ["bird"]
        },
        {
            id: "container_cleanliness",
            name: "Limpieza del contenedor/corral",
            description: "Contenedores deben estar limpios. Contenidos de contenedores sucios serán destruidos",
            required: true,
            type: "container",
            appliesto: ["all"]
        },
        {
            id: "identification_requirements",
            name: "Identificación de aves",
            description: "Aves: placa o anillo numerado. Aves <10cm: sin identificación requerida",
            required: false,
            type: "identification",
            appliesto: ["bird"]
        },
        {
            id: "disease_reporting",
            name: "Reporte de enfermedades",
            description: "Reportar cualquier enfermedad o muerte a DGSA: 018007512100, 55-5905-1000 Ext. 51242",
            required: true,
            type: "reporting",
            appliesto: ["all"]
        },
        {
            id: "rabbits_entry_refused",
            name: "Conejos: entrada rechazada",
            description: "Conejos tienen ENTRADA RECHAZADA desde el 23 de abril de 2010 (excepto investigación)",
            required: false,
            type: "restriction",
            appliesto: ["rabbit"]
        },
        {
            id: "frequent_traveler_program",
            name: "Programa Viajero Frecuente",
            description: "Contactar SENASICA para registro: 59051000 ext. 53611",
            required: false,
            type: "program",
            appliesto: ["all"]
        }
    ]
};

(function () {
    if (!window.MexicoPetTravelForm) {
        window.MexicoPetTravelForm = MexicoPetTravelForm;
        window.MXPetTravelForm = MexicoPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('MX', MexicoPetTravelForm);
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
