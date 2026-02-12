function validateForm() {
    const requiredFields = [
        'ownerName', 'ownerEmail', 'ownerPhone', 'ownerAddress',
        'petName', 'petType', 'destinationCountry', 'travelDate'
    ];
    
    for (let field of requiredFields) {
        const element = document.getElementById(field);
        if (!element || !element.value.trim()) {
            alert(`Por favor complete el campo: ${element ? element.labels[0].textContent : field}`);
            if (element) element.focus();
            return false;
        }
    }
    
    // Validar email
    const email = document.getElementById('ownerEmail').value;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert('Por favor ingrese un email válido');
        return false;
    }
    
    // Validar fecha de viaje
    const travelDate = new Date(document.getElementById('travelDate').value);
    const today = new Date();
    if (travelDate < today) {
        alert('La fecha de viaje no puede ser en el pasado');
        return false;
    }
    
    return true;
}

function toggleVaccinationDate() {
    const vaccinated = document.getElementById('vaccinated').checked;
    const dateGroup = document.getElementById('vaccinationDateGroup');
    dateGroup.style.display = vaccinated ? 'block' : 'none';
}

function toggleRabiesDate() {
    const rabiesVaccinated = document.getElementById('rabiesVaccinated').checked;
    const dateGroup = document.getElementById('rabiesDateGroup');
    dateGroup.style.display = rabiesVaccinated ? 'block' : 'none';
}

function updateCountryInfo() {
    const countrySelect = document.getElementById('destinationCountry');
    const selectedValue = countrySelect.value;
    const countryText = countrySelect.options[countrySelect.selectedIndex].text;
    const infoBox = document.getElementById('countryInfo');
    const requirementsList = document.getElementById('requirementsList');
    
    if (!selectedValue || selectedValue === 'other') {
        infoBox.style.display = 'none';
        return;
    }
    
    const requirements = getCountryRequirements(selectedValue);
    
    document.getElementById('selectedCountry').textContent = countryText;
    requirementsList.innerHTML = '';
    
    requirements.forEach(req => {
        const li = document.createElement('li');
        li.textContent = req;
        requirementsList.appendChild(li);
    });
    
    infoBox.style.display = 'block';
}

function getCountryRequirements(countryCode) {
    const requirements = {
        'EU': [
            'Microchip ISO 11784/11785 requerido',
            'Vacuna antirrábica obligatoria',
            'Certificado de salud veterinario',
            'Espera 21 días después de la vacuna',
            'Documento de identificación de mascota'
        ],
        'UK': [
            'Microchip requerido',
            'Vacuna antirrábica actualizada',
            'Tratamiento contra tenia (1-5 días antes)',
            'Certificado sanitario oficial',
            'Pasaporte para mascotas de la UE'
        ],
        'AU': [
            'Microchip requerido',
            'Prueba de titulación de anticuerpos antirrábicos',
            'Permiso de importación necesario',
            'Cuarentena mínima de 10 días',
            'Exámenes de sangre adicionales'
        ],
        'JP': [
            'Microchip ISO requerido',
            'Prueba de anticuerpos antirrábicos',
            'Espera 180 días después de la prueba',
            'Certificado de inspección',
            'Notificación previa al Ministerio'
        ],
        'CA': [
            'Certificado de salud veterinario',
            'Prueba de vacuna antirrábica actual',
            'Microchip recomendado',
            'Verificación en punto de entrada'
        ],
        'MX': [
            'Certificado de salud veterinario',
            'Vacuna antirrábica al día',
            'Cartilla de vacunación',
            'Microchip recomendado'
        ]
    };
    
    return requirements[countryCode] || [
        'Verificar requisitos específicos con la embajada',
        'Microchip recomendado',
        'Vacuna antirrábica generalmente requerida',
        'Certificado de salud veterinario necesario'
    ];
}

// Inicializar fechas mínimas
window.onload = function() {
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('travelDate').min = today;
    document.getElementById('petBirthDate').max = today;
    document.getElementById('lastVaccinationDate').max = today;
    document.getElementById('rabiesVaccinationDate').max = today;
};