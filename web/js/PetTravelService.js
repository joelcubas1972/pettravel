class PetTravelService {
    constructor(baseUrl = '') {
        this.baseUrl = baseUrl;
        this.countriesCache = new Map();
        this.currentCountry = null;
    }

    async loadCountryRequirements(countryCode, language = 'es') {
        const cacheKey = `${countryCode}_${language}`;
        
        // Verificar caché
        if (this.countriesCache.has(cacheKey)) {
            this.currentCountry = this.countriesCache.get(cacheKey);
            return this.currentCountry;
        }

        try {
            const response = await fetch(
                `${this.baseUrl}/api/pet-requirements/${countryCode}?lang=${language}`
            );
            
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }
            
            const data = await response.json();
            
            // Crear instancia del país
            const countryReq = new CountryPetRequirements(data);
            countryReq.setLanguage(language);
            
            // Cachear
            this.countriesCache.set(cacheKey, countryReq);
            this.currentCountry = countryReq;
            
            return countryReq;
            
        } catch (error) {
            console.error('Error loading country requirements:', error);
            return this.getDefaultRequirements(countryCode, language);
        }
    }

    getDefaultRequirements(countryCode, language) {
        return {
            country: countryCode,
            isDesignatedPersonAllowed: () => false,
            getDesignatedPersonFields: () => [],
            getCertificationStatement: () => 'Default requirements apply',
            getFormFields: () => [],
            getLegacyFormat: () => ['Default requirements for ' + countryCode],
            setLanguage: (lang) => {}
        };
    }

    async saveFormData(formData, countryCode) {
        try {
            const response = await fetch(`${this.baseUrl}/api/save-form`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    country: countryCode,
                    formData: formData,
                    timestamp: new Date().toISOString()
                })
            });
            
            return await response.json();
            
        } catch (error) {
            console.error('Error saving form:', error);
            return { success: false, error: error.message };
        }
    }

    async generatePDF(countryCode, formData) {
        try {
            const response = await fetch(`${this.baseUrl}/api/generate-pdf`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    country: countryCode,
                    data: formData
                })
            });
            
            if (response.ok) {
                const blob = await response.blob();
                return blob;
            }
            
            throw new Error('PDF generation failed');
            
        } catch (error) {
            console.error('Error generating PDF:', error);
            return null;
        }
    }

    clearCache() {
        this.countriesCache.clear();
        this.currentCountry = null;
    }

    getCurrentCountry() {
        return this.currentCountry;
    }
}