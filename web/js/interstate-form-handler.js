(function() {
    'use strict';

    const InterstateFormHandler = {
        // Variables globales
        petCount: 0,
        missingReqsTemp: [],
        stateLoadingInProgress: {},
        
        // Inicialización
        init: function() {
            
            this.setupEventListeners();
            this.setupDateRestrictions();
            this.updateBudgetButton();
            
            // Verificar si hay estado seleccionado inicialmente
            const initialState = document.getElementById('destinationState')?.value;
            if (initialState) {
                setTimeout(() => this.handleStateChange(), 100);
            }
        },

        setupEventListeners: function() {
            // Estado destino - USAR DELEGACIÓN para evitar conflictos
            document.addEventListener('change', (e) => {
                if (e.target.id === 'destinationState') {
                    this.handleStateChange();
                }
                
                // Validar selección de aerolínea
                if (e.target.name === 'airlineModel') {
                    this.validateAirlineSelection();
                }
            });

            // Fechas
            const pickupDate = document.getElementById('pickupDate');
            const deliveryDate = document.getElementById('deliveryDate');
            if (pickupDate && deliveryDate) {
                pickupDate.addEventListener('change', () => this.validateDates());
                deliveryDate.addEventListener('change', () => this.validateDates());
            }

            // Checkbox receptor mismo que dueño
            const sameAsOwner = document.getElementById('sameAsOwner');
            if (sameAsOwner) {
                sameAsOwner.addEventListener('change', (e) => this.toggleReceiverInfo(e.target.checked));
            }

            // Botón agregar mascota
            const addPetBtn = document.getElementById('addPetBtn');
            if (addPetBtn) {
                addPetBtn.addEventListener('click', () => this.addPetSection());
            }
        },

        setupDateRestrictions: function() {
            const today = new Date().toISOString().split('T')[0];
            const pickupDate = document.getElementById('pickupDate');
            const deliveryDate = document.getElementById('deliveryDate');
            
            if (pickupDate) pickupDate.min = today;
            if (deliveryDate) deliveryDate.min = today;
        },

        toggleReceiverInfo: function(isChecked) {
            const receiverSection = document.getElementById('receiverSection');
            if (!receiverSection) return;
            
            if (isChecked) {
                receiverSection.style.display = 'none';
                // Copiar datos del dueño
                const ownerName = document.getElementById('ownerName')?.value || '';
                const ownerEmail = document.getElementById('ownerEmail')?.value || '';
                const ownerPhone = document.getElementById('ownerPhone')?.value || '';
                const ownerAddress = document.getElementById('ownerAddress')?.value || '';
                
                document.getElementById('receiverName').value = ownerName;
                document.getElementById('receiverEmail').value = ownerEmail;
                document.getElementById('receiverPhone').value = ownerPhone;
                document.getElementById('destinationAddress').value = ownerAddress;
            } else {
                receiverSection.style.display = 'block';
            }
        },

        handleStateChange: async function() {
            const stateCode = document.getElementById('destinationState')?.value;
            if (!stateCode) {
                this.hideStateInfo();
                return;
            }
           
            try {
                // Verificar si ya hay una carga en progreso
                if (window.stateLoadingInProgress && window.stateLoadingInProgress[stateCode]) {
                    
                    return;
                }
                
                // Usar el sistema de carga coordinada del JSP principal
                if (window.coordinatedLoadStateData) {
                    
                    const stateData = await window.coordinatedLoadStateData(stateCode);
                    if (stateData) {
                        this.updateDisplayWithStateData(stateData);
                    }
                } else {
                    // Fallback: usar nuestra propia lógica pero SIN cargar scripts
                    await this.getStateDataSafely(stateCode);
                }
            } catch (error) {
                console.error('❌ Error manejando cambio de estado:', error);
            }
        },

        // FUNCIÓN SEGURA - NO CARGA ARCHIVOS, solo consulta
        getStateDataSafely: async function(stateCode) {
                       
            // 1. Verificar si ya está cargado por el JSP principal
            const variableName = this.getStateVariableName(stateCode);
            if (window[variableName]) {
                
                this.updateDisplayWithStateData(window[variableName]);
                return window[variableName];
            }
            
            // 2. Verificar en stateTravelDB (datos por defecto)
            if (window.stateTravelDB && window.stateTravelDB[stateCode]) {
               
                const stateData = this.convertToPetTravelForm(window.stateTravelDB[stateCode], stateCode);
                this.updateDisplayWithStateData(stateData);
                return stateData;
            }
            
            // 3. Si no hay datos, esperar - NO cargar aquí
            
            return null;
        },

        convertToPetTravelForm: function(stateData, stateCode) {
            if (!stateData) return null;
            
            return {
                stateCode: stateCode,
                stateName: stateData.stateName || stateCode,
                acceptsDigitalSignature: stateData.acceptsDigitalSignature || false,
                daysBeforeTravelForForm: stateData.daysBeforeTravelForForm || 10,
                airlineModelRequirements: stateData.airlineModelRequirements || ["OCVI", "APHIS7001"],
                specialNotes: stateData.specialNotes || "",
                isRabiesQuarantineArea: stateData.isRabiesQuarantineArea || false,
                requirements: stateData.requirements || [],
                additionalInformation: stateData.additionalInformation || {}
            };
        },

        getStateVariableName: function(stateCode) {
            if (!stateCode) return null;
            
            // Si el JSP principal tiene su propia función, usarla
            if (typeof window.getStateVariableName === 'function') {
                return window.getStateVariableName(stateCode);
            }
            
            // Fallback
            return stateCode.toUpperCase() + 'PetTravelForm';
        },

        updateDisplayWithStateData: function(stateData) {
                        
            if (!stateData) {
                console.warn('⚠️ No hay datos para actualizar');
                return;
            }
            
            // Solo actualizar la UI con los datos disponibles
            // NO intentar cargar archivos adicionales
            
            if (stateData.requirements && stateData.requirements.length > 0) {
                
            }
            
            // Notificar al JSP principal que los datos están disponibles
            this.notifyJSPDataLoaded(stateData);
        },

        notifyJSPDataLoaded: function(stateData) {
            // Disparar evento personalizado para que el JSP sepa que hay datos
            const event = new CustomEvent('stateDataLoaded', {
                detail: { stateData: stateData }
            });
            document.dispatchEvent(event);
            
            
        },

        validateAirlineSelection: function() {
            const airlineOCVI = document.getElementById('airlineOCVI');
            const airlineAPHIS = document.getElementById('airlineAPHIS');
            const airlineWarning = document.getElementById('airlineWarning');
            const warningText = document.getElementById('warningText');

            if (!airlineOCVI || !airlineAPHIS || !airlineWarning) return;
            // Resetear advertencia
            airlineWarning.style.display = 'none';
            // Obtener estado actual
            const stateCode = document.getElementById('destinationState')?.value;
            if (!stateCode) return;
            // Obtener datos del estado
            const variableName = this.getStateVariableName(stateCode);
            const stateData = window[variableName];
            if (!stateData || !stateData.airlineModelRequirements) return;
            const requirements = stateData.airlineModelRequirements;
            const acceptsOCVI = requirements.includes("OCVI");
            const acceptsAPHIS = requirements.includes("APHIS7001");
            // Validar cada checkbox individualmente
            let warnings = [];
            if (airlineAPHIS.checked && !acceptsAPHIS) {
                warnings.push('APHIS 7001');
            }
            if (airlineOCVI.checked && !acceptsOCVI) {
                warnings.push('OCVI');
            }
            // Mostrar advertencia si hay incompatibilidades
            if (warnings.length > 0 && warningText) {
                airlineWarning.style.display = 'block';
                if (warnings.length === 2) {
                    warningText.innerHTML = 
                        '<i class="fas fa-exclamation-triangle me-1"></i>' +
                        '<strong>¡Atención!</strong> Este estado NO acepta ninguno de los formatos marcados oficialmente. ' +
                        'Consulte con el estado sobre formatos alternativos.';
                } else {
                    warningText.innerHTML = 
                        '<i class="fas fa-exclamation-triangle me-1"></i>' +
                        `<strong>¡Atención!</strong> Este estado NO acepta ${warnings.join(' ni ')} oficialmente. ` +
                        'Si su aerolínea le exige este(s) formato(s), deberá contactar al estado para verificar alternativas.';
                }
            }
        },

        // Funciones para mascotas
        addPetSection: function() {
            // Esta función debería estar en el JSP principal
            // Solo redirigir si existe
            if (typeof window.addPetSection === 'function') {
                window.addPetSection();
            } else {
                console.warn('⚠️ Función addPetSection no encontrada en window');
            }
        },

        updatePetRequirements: function(petIndex) {
            // Esta función debería estar en el JSP principal
            if (typeof window.updatePetRequirements === 'function') {
                window.updatePetRequirements(petIndex);
            }
        },

        validateDates: function() {
            const pickupDate = document.getElementById('pickupDate');
            const deliveryDate = document.getElementById('deliveryDate');
            
            if (!pickupDate || !deliveryDate || !pickupDate.value || !deliveryDate.value) {
                return true;
            }
            
            const pickup = new Date(pickupDate.value);
            const delivery = new Date(deliveryDate.value);
            
            if (delivery < pickup) {
                this.showAlert('La fecha de entrega debe ser posterior a la fecha de recolección', 'warning');
                deliveryDate.value = '';
                return false;
            }
            
            return true;
        },

        validateForm: function(e) {
            e.preventDefault();
            
            if (!this.validateAllFields()) {
                this.showAlert('Por favor complete todos los campos requeridos', 'warning');
                return false;
            }
            
            if (!this.validateDates()) {
                return false;
            }
            
            // Validar al menos una mascota
            if (this.petCount < 1 && typeof window.petCount === 'undefined') {
                this.showAlert('Debe agregar al menos una mascota', 'warning');
                return false;
            }
            
            // Validar selección de aerolínea si hay estado
            const stateCode = document.getElementById('destinationState')?.value;
            if (stateCode) {
                const airlineOCVI = document.getElementById('airlineOCVI');
                const airlineAPHIS = document.getElementById('airlineAPHIS');
                
                if (airlineOCVI && airlineAPHIS && !airlineOCVI.checked && !airlineAPHIS.checked) {
                    // Opcional: Si quieres que sea obligatorio marcar al menos uno
                    showAlert('Por favor marque al menos un formato si su aerolínea lo requiere', 'danger');
                    isValid = false;
                }
            }
            
            // Si todo está bien, enviar formulario
            
            document.getElementById('interstateForm').submit();
            return true;
        },

        validateAllFields: function() {
            const requiredFields = document.querySelectorAll('#interstateForm [required]');
            let isValid = true;
            
            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    field.classList.add('is-invalid');
                    isValid = false;
                } else {
                    field.classList.remove('is-invalid');
                }
            });
            
            return isValid;
        },

        showAlert: function(message, type) {
            // Usar sistema de alertas de Bootstrap si está disponible
            if (typeof bootstrap !== 'undefined' && bootstrap.Alert) {
                const alertDiv = document.createElement('div');
                alertDiv.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
                alertDiv.style.cssText = 'top: 20px; right: 20px; z-index: 9999; max-width: 400px;';
                alertDiv.innerHTML = `
                    <strong>${type === 'warning' ? '⚠️' : 'ℹ️'}</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                `;
                document.body.appendChild(alertDiv);
                
                setTimeout(() => {
                    if (alertDiv.parentNode) alertDiv.remove();
                }, 5000);
            } else {
                alert(`${type.toUpperCase()}: ${message}`);
            }
        },

        updateBudgetButton: function() {
            const budgetBtn = document.getElementById('budgetSummaryBtn');
            if (budgetBtn) {
                const count = window.missingReqsTemp ? window.missingReqsTemp.length : 0;
                budgetBtn.innerHTML = `<i class="fas fa-shopping-cart me-1"></i> Ver Presupuesto (${count})`;
                budgetBtn.style.display = count > 0 ? 'inline-block' : 'none';
            }
        },

        hideStateInfo: function() {
            
            // Esta función debería estar en el JSP principal
            if (typeof window.clearStateCards === 'function') {
                window.clearStateCards();
            }
        }
    };

    // Exportar al objeto global
    window.InterstateFormHandler = InterstateFormHandler;

    // Inicializar cuando el DOM esté listo
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            
            if (window.InterstateFormHandler && typeof window.InterstateFormHandler.init === 'function') {
                setTimeout(() => window.InterstateFormHandler.init(), 100);
            }
        });
    } else {
        
        setTimeout(() => {
            if (window.InterstateFormHandler && typeof window.InterstateFormHandler.init === 'function') {
                window.InterstateFormHandler.init();
            }
        }, 100);
    }

})();