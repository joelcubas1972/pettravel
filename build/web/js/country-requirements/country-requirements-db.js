class CountryPetRequirements {
    constructor(data) {
        this.countryCode = data.countryCode;
        this.countryName = data.countryName;
        this.acceptsDigitalSignature = data.acceptsDigitalSignature || false;
        this.isBlacklisted = data.isBlacklisted || false;
        this.requirements = data.requirements || [];
    }

    // Método simple para obtener requisitos
    getRequirements() {
        return this.requirements;
    }

    // Método simple para agregar un requisito
    addRequirement(requirement) {
        this.requirements.push(requirement);
    }

    // Método simple para eliminar un requisito
    removeRequirement(requirementId) {
        this.requirements = this.requirements.filter(req => req.id !== requirementId);
    }
}

class PetTravelRequirementsDatabase {
    constructor() {
        this.database = {};
    }

    addCountry(countryCode, data) {
        this.database[countryCode] = new CountryPetRequirements({
            countryCode: countryCode,
            countryName: data.countryName || countryCode,
            acceptsDigitalSignature: data.acceptsDigitalSignature || false,
            isBlacklisted: data.isBlacklisted || false,
            requirements: data.requirements || []
        });
    }

    getCountry(countryCode) {
        return this.database[countryCode] || null;
    }

    getCountryInfo(countryCode) {
        const country = this.getCountry(countryCode);
        if (!country) return null;
        
        return {
            countryCode: country.countryCode,
            countryName: country.countryName,
            acceptsDigitalSignature: country.acceptsDigitalSignature,
            isBlacklisted: country.isBlacklisted,
            requirementsCount: country.requirements.length
        };
    }

    getAllCountries() {
        return Object.keys(this.database);
    }

    hasCountry(countryCode) {
        return this.database.hasOwnProperty(countryCode);
    }
}

// Instancia global
const petTravelDB = new PetTravelRequirementsDatabase();

// Exportación simple
if (typeof window !== 'undefined') {
    window.petTravelDB = petTravelDB;
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = petTravelDB;
}