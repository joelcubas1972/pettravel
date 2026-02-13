// Datos para Bélgica - VERSIÓN PERSISTENTE
(function() {
    const COUNTRY_CODE = 'BE';
    const COUNTRY_NAME = 'Bélgica';
    
    // Definir el formulario
    window.BelgiumPetTravelForm = {
        countryCode: COUNTRY_CODE,
        countryName: COUNTRY_NAME,
        acceptsDigitalSignature: false,
        isBlacklisted: false,
        daysBeforeTravelForForm: 0,
        endorsementRequired: true,
        formModel: "EU",
        transitCountries: false,
        certificateValidityDays: "10 días",
        requirements: [
            {
                id: "rabies_vaccination",
                name: "Vacuna rabia válida",
                description: "Más de 30 días después si primo vacunación",
                required: true,
                type: "vaccine",
                appliesto: ["dog", "cat"],
                price: 70.00
            },
            {
                id: "iso_microchip",
                name: "Microchip ISO",
                description: "Microchip de 15 dígitos ISO 11784/11785",
                required: true,
                type: "identification",
                appliesto: ["dog", "cat"],
                price: 55.00
            },
            {
                id: "tapeworm_treatment",
                name: "Tratamiento anti-equinos",
                description: "Tratamiento para equinococos 24-120h antes",
                required: true,
                type: "treatment",
                appliesto: ["dog"],
                price: 45.00
            }
        ]
    };

    // Función para registrar el país de forma SEGURA y PERSISTENTE
    function registerBelgium() {
        if (window.petTravelDB && typeof window.petTravelDB.addCountry === 'function') {
            window.petTravelDB.addCountry(COUNTRY_CODE, window.BelgiumPetTravelForm);
            console.log(`🇧🇪 Bélgica registrada exitosamente en petTravelDB`);
            return true;
        }
        return false;
    }

    // Intentar registrar inmediatamente
    if (!registerBelgium()) {
        // Si falla, esperar a que petTravelDB esté listo
        let attempts = 0;
        const maxAttempts = 50;
        const interval = setInterval(function() {
            attempts++;
            if (registerBelgium() || attempts >= maxAttempts) {
                clearInterval(interval);
                if (attempts >= maxAttempts) {
                    console.warn('⚠️ No se pudo registrar Bélgica después de', maxAttempts, 'intentos');
                }
            }
        }, 100);
    }
})();
