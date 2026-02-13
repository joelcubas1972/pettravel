// PetTravel Database - SINGLETON PERSISTENTE
window.petTravelDB = (function() {
    // Si ya existe, devolver la instancia existente
    if (window._petTravelDBInstance) {
        console.log('✅ Reusando petTravelDB existente');
        return window._petTravelDBInstance;
    }
    
    // Crear nueva instancia solo si no existe
    console.log('🆕 Creando nueva instancia de petTravelDB');
    const instance = {
        database: {},
        
        addCountry: function(code, data) {
            if (!code) return this;
            this.database[code.toUpperCase()] = data;
            console.log(`✅ País agregado/actualizado: ${code}`, data?.countryName);
            // Disparar evento para notificar cambios
            window.dispatchEvent(new CustomEvent('petTravelDBUpdated', {
                detail: { code, data }
            }));
            return this;
        },
        
        getCountry: function(code) {
            if (!code) return null;
            return this.database[code.toUpperCase()];
        },
        
        listCountries: function() {
            return Object.keys(this.database);
        },
        
        getAllCountries: function() {
            return {...this.database}; // Copia para evitar modificaciones
        },
        
        removeCountry: function(code) {
            if (code && this.database[code.toUpperCase()]) {
                delete this.database[code.toUpperCase()];
                console.log(`🗑️ País eliminado: ${code}`);
            }
            return this;
        },
        
        clearAll: function() {
            this.database = {};
            console.log('🧹 Base de datos limpiada');
            return this;
        }
    };
    
    // Guardar instancia para reuso
    window._petTravelDBInstance = instance;
    return instance;
})();

// Escuchar cambios en el DOM para preservar datos
document.addEventListener('DOMContentLoaded', function() {
    console.log('📊 petTravelDB persistente listo. Países cargados:', 
        window.petTravelDB.listCountries());
});
