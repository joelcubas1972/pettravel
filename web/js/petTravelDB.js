window.petTravelDB = (function() {
    if (window._petTravelDBInstance) {
        return window._petTravelDBInstance;
    }
    const instance = {
        database: {},
        
        addCountry: function(code, data) {
            if (!code) return this;
            this.database[code.toUpperCase()] = data;
            
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
            return {...this.database}; 
        },
        
        removeCountry: function(code) {
            if (code && this.database[code.toUpperCase()]) {
                delete this.database[code.toUpperCase()];
            }
            return this;
        },
        
        clearAll: function() {
            this.database = {};
            return this;
        }
    };
  
    window._petTravelDBInstance = instance;
    return instance;
})();

document.addEventListener('DOMContentLoaded', function() {
    console.log('📊 petTravelDB persistente listo. Países cargados:', 
        window.petTravelDB.listCountries());
});
