var TurquiaPetTravelForm = {
    countryCode: "TR",
    countryName: "Turquía",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "pet_limit",
            name: "Límite de mascotas por persona",
            description: "Máximo 2 mascotas (perro/gato/ave) o 10 peces de acuario por persona[citation:2][citation:4].",
            required: true,
            type: "regulation",
            appliesto: ["all"]
        },
        {
            id: "banned_breeds",
            name: "Razas caninas prohibidas",
            description: "Entrada prohibida para: Pitbull Terrier, Japanese Tosa, Dogo Argentino, Fila Brasileiro, Staffordshire Terrier y razas similares[citation:2][citation:4].",
            required: true,
            conditional: "species == 'dog'",
            type: "regulation",
            appliesto: ["dog"]
        },
        {
            id: "rabies_vaccine",
            name: "Vacuna Antirrábica",
            description: "Certificado de vacunación válido. Nota: Existe discrepancia en el plazo (15 vs. 30 días antes del viaje)[citation:2][citation:4].",
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
            id: "rabies_titer_test",
            name: "Prueba de Anticuerpos (Titulación)",
            description: "Realizada en un laboratorio acreditado (lista de la UE). Mínimo 30 días después de la vacunación. Nivel ≥ 0.5 IU/mL[citation:2].",
            required: true,
            type: "laboratory_test",
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
            id: "usda_health_certificate",
            name: "Certificado de Salud USDA (Formulario 7001)",
            description: "United States Interstate and International Certificate of Health Examination for Small Animals (Form 7001)[citation:2][citation:4]. Debe estar completo y firmado por un veterinario acreditado por el USDA.",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "turkey_veterinary_certificate",
            name: "Certificado Veterinario de Turquía (Anexo)",
            description: "Formulario específico de Turquía adjunto ('Veterinary Certificate (Encl.)')[citation:2][citation:4].",
            required: true,
            type: "certificate",
            appliesto: ["all"]
        },
        {
            id: "microchip",
            name: "Microchip",
            description: "ISO 11784/11785. Para aves, anillo de identificación en la pata[citation:2][citation:4].",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "bird_restrictions",
            name: "Restricciones para aves",
            description: "No se conocen requisitos oficiales para aves no de corral desde EE.UU. Existen restricciones comerciales para aves de ciertos estados por gripe aviar[citation:1].",
            required: false,
            conditional: "species == 'bird'",
            type: "regulation",
            appliesto: ["bird"]
        }
    ]
};

(function () {
    if (!window.TurquiaPetTravelForm) {
        window.TurquiaPetTravelForm = TurquiaPetTravelForm;
        window.TRPetTravelForm = TurquiaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('TR', TurquiaPetTravelForm);
    }
})();