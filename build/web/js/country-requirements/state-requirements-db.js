(function() {
    'use strict';

    class StatePetRequirements {
        constructor(data) {
            this.stateCode = data.stateCode;
            this.stateName = data.stateName;
            this.acceptsDigitalSignature = data.acceptsDigitalSignature || false;
            this.isBlacklisted = data.isBlacklisted || false;
            this.daysBeforeTravelForForm = data.daysBeforeTravelForForm || 10;
            this.airlineModelRequirements = data.airlineModelRequirements || []; // ["OCVI"], ["APHIS7001"], o ambos
            this.requirements = data.requirements || [];
        }

        // Método para obtener requisitos
        getRequirements() {
            return this.requirements;
        }

        // Método para obtener requisitos obligatorios
        getRequiredRequirements() {
            return this.requirements.filter(req => req.required === true);
        }

        // Método para obtener requisitos opcionales
        getOptionalRequirements() {
            return this.requirements.filter(req => !req.required || req.required === false);
        }

        // Método para agregar un requisito
        addRequirement(requirement) {
            this.requirements.push(requirement);
        }

        // Método para eliminar un requisito
        removeRequirement(requirementId) {
            this.requirements = this.requirements.filter(req => req.id !== requirementId);
        }

        // Método para verificar si acepta OCVI
        acceptsOCVI() {
            return this.airlineModelRequirements.includes('OCVI');
        }

        // Método para verificar si acepta APHIS7001
        acceptsAPHIS7001() {
            return this.airlineModelRequirements.includes('APHIS7001');
        }

        // Método para información resumida
        getStateInfo() {
            return {
                stateCode: this.stateCode,
                stateName: this.stateName,
                acceptsDigitalSignature: this.acceptsDigitalSignature,
                isBlacklisted: this.isBlacklisted,
                daysBeforeTravelForForm: this.daysBeforeTravelForForm,
                airlineModelRequirements: this.airlineModelRequirements,
                requirementsCount: this.requirements.length,
                requiredRequirementsCount: this.getRequiredRequirements().length
            };
        }
    }

    class StateTravelRequirementsDatabase {
        constructor() {
            this.database = new Map();
            this.loadedStates = new Set();
        }

        addState(stateCode, data) {
            const stateData = new StatePetRequirements({
                stateCode: stateCode,
                stateName: data.stateName || stateCode,
                acceptsDigitalSignature: data.acceptsDigitalSignature || false,
                isBlacklisted: data.isBlacklisted || false,
                daysBeforeTravelForForm: data.daysBeforeTravelForForm || 10,
                airlineModelRequirements: data.airlineModelRequirements || [],
                requirements: data.requirements || []
            });
            
            this.database.set(stateCode.toUpperCase(), stateData);
            this.loadedStates.add(stateCode.toUpperCase());
            return stateData;
        }

        getState(stateCode) {
            return this.database.get(stateCode.toUpperCase()) || null;
        }

        getStateInfo(stateCode) {
            const state = this.getState(stateCode);
            if (!state) return null;
            return state.getStateInfo();
        }

        getRequirements(stateCode) {
            const state = this.getState(stateCode);
            return state ? state.getRequirements() : [];
        }

        getRequiredRequirements(stateCode) {
            const state = this.getState(stateCode);
            return state ? state.getRequiredRequirements() : [];
        }

        getOptionalRequirements(stateCode) {
            const state = this.getState(stateCode);
            return state ? state.getOptionalRequirements() : [];
        }

        hasState(stateCode) {
            return this.database.has(stateCode.toUpperCase());
        }

        isLoaded(stateCode) {
            return this.loadedStates.has(stateCode.toUpperCase());
        }

        getAllStates() {
            return Array.from(this.database.keys());
        }

        getAllStatesInfo() {
            return Array.from(this.database.values()).map(state => state.getStateInfo());
        }

        // Método para buscar estado por nombre (parcial)
        searchStateByName(searchTerm) {
            const results = [];
            searchTerm = searchTerm.toLowerCase();
            
            for (const [code, state] of this.database.entries()) {
                if (state.stateName.toLowerCase().includes(searchTerm) || 
                    code.toLowerCase().includes(searchTerm)) {
                    results.push(state.getStateInfo());
                }
            }
            
            return results;
        }

        // Método para cargar datos por defecto (estados comunes)
        loadDefaultData() {
            // Datos por defecto para estados comunes
            const defaultStates = {
                'CA': {
                    stateName: 'California',
                    acceptsDigitalSignature: false,
                    isBlacklisted: false,
                    daysBeforeTravelForForm: 7,
                    airlineModelRequirements: ['OCVI'],
                    requirements: [
                        {
                            id: 'rabies_vaccine_ca',
                            name: 'Vacuna antirrábica (CA)',
                            description: 'Vacuna contra rabia actualizada según regulaciones de California',
                            required: true,
                            type: 'vaccine'
                        },
                        {
                            id: 'import_permit_ca',
                            name: 'Permiso de importación CA',
                            description: 'Permiso requerido para ingresar mascotas a California',
                            required: true,
                            type: 'permit'
                        }
                    ]
                },
                'TX': {
                    stateName: 'Texas',
                    acceptsDigitalSignature: true,
                    isBlacklisted: false,
                    daysBeforeTravelForForm: 10,
                    airlineModelRequirements: ['APHIS7001'],
                    requirements: [
                        {
                            id: 'rabies_vaccine_tx',
                            name: 'Vacuna antirrábica (TX)',
                            description: 'Certificado de vacunación contra rabia vigente',
                            required: true,
                            type: 'vaccine'
                        },
                        {
                            id: 'health_certificate_tx',
                            name: 'Certificado de salud TX',
                            description: 'Certificado emitido dentro de 10 días',
                            required: true,
                            type: 'certificate'
                        }
                    ]
                },
                'NY': {
                    stateName: 'New York',
                    acceptsDigitalSignature: true,
                    isBlacklisted: false,
                    daysBeforeTravelForForm: 5,
                    airlineModelRequirements: ['OCVI', 'APHIS7001'], // Ambos aceptados
                    requirements: [
                        {
                            id: 'rabies_vaccine_ny',
                            name: 'Vacuna antirrábica (NY)',
                            description: 'Vacuna contra rabia para entrada a Nueva York',
                            required: true,
                            type: 'vaccine'
                        },
                        {
                            id: 'city_permit_ny',
                            name: 'Permiso ciudad de NY',
                            description: 'Permiso especial para ciudad de Nueva York',
                            required: false,
                            type: 'permit'
                        }
                    ]
                },
                'FL': {
                    stateName: 'Florida',
                    acceptsDigitalSignature: true,
                    isBlacklisted: true, // Florida tiene restricciones
                    daysBeforeTravelForForm: 14,
                    airlineModelRequirements: ['APHIS7001'],
                    requirements: [
                        {
                            id: 'rabies_vaccine_fl',
                            name: 'Vacuna antirrábica (FL)',
                            description: 'Certificado de vacunación contra rabia',
                            required: true,
                            type: 'vaccine'
                        },
                        {
                            id: 'quarantine_certificate_fl',
                            name: 'Certificado de cuarentena',
                            description: 'Documento de cuarentena para Florida',
                            required: true,
                            type: 'certificate'
                        }
                    ]
                }
            };

            // Cargar datos por defecto
            Object.entries(defaultStates).forEach(([code, data]) => {
                this.addState(code, data);
            });

        }
    }

    // Instancia global
    const stateTravelDB = new StateTravelRequirementsDatabase();
    
    // Cargar datos por defecto automáticamente
    stateTravelDB.loadDefaultData();

    // Exportación global
    if (typeof window !== 'undefined') {
        window.stateTravelDB = stateTravelDB;
        
    }

    // Exportación para Node.js (si es necesario)
    if (typeof module !== 'undefined' && module.exports) {
        module.exports = stateTravelDB;
    }

})();