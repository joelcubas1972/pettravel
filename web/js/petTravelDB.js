// PetTravel Database - Inicialización global
window.petTravelDB = window.petTravelDB || {
    database: {},
    
    addCountry: function(code, data) {
        this.database[code] = data;
        console.log('País agregado:', code, data?.countryName || code);
        return this;
    },
    
    getCountry: function(code) {
        return this.database[code];
    },
    
    listCountries: function() {
        return Object.keys(this.database);
    },
    
    getAllCountries: function() {
        return this.database;
    }
};

console.log('✅ petTravelDB inicializado');
