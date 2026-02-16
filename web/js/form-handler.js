const CountryFormLoader = {
    currentCountry: null,
    petTravelForm: null,
    loadedCountries: new Set(),
    
    getVariableName: function (countryCode) {
        const codeToVarMap = {
            'DE': 'AlemaniaPetTravelForm',
            'FR': 'FranciaPetTravelForm',
            'ES': 'SpainPetTravelForm',
            'IT': 'ItaliaPetTravelForm',
            'AG': 'AntiguaPetTravelForm',
            'UK': 'ReinounidoPetTravelForm',
            'ZC': 'EscociaPetTravelForm',
            'WL': 'GalesPetTravelForm',
            'PT': 'PortugalPetTravelForm',
            'GR': 'GreciaPetTravelForm',
            'NL': 'HolandaPetTravelForm',
            'HN': 'HondurasPetTravelForm',
            'HU': 'HungaryPetTravelForm',
            'IE': 'IrlandaPetTravelForm',
            'SE': 'SueciaPetTravelForm',
            'FI': 'FinlandiaPetTravelForm',
            'CH': 'SuizaPetTravelForm',
            'CY': 'CyprusPetTravelForm',
            'MT': 'MaltaPetTravelForm',
            'BG': 'BulgariaPetTravelForm',
            'GD': 'GranadaPetTravelForm',
            'TR': 'TurquiaPetTravelForm',
            'UA': 'UcraniaPetTravelForm',
            'RU': 'RusiaPetTravelForm',
            'BY': 'BelarusPetTravelForm',
            'CA': 'CanadaPetTravelForm',
            'MX': 'MexicoPetTravelForm',
            'BR': 'BrasilPetTravelForm',
            'AR': 'ArgentinaPetTravelForm',
            'CL': 'ChilePetTravelForm', 
            'CO': 'ColombiaPetTravelForm',
            'EC': 'EcuadorPetTravelForm',
            'UY': 'UruguayPetTravelForm',
            'VE': 'VenezuelaPetTravelForm',
            'CR': 'CostaricaPetTravelForm',
            'PA': 'PanamaPetTravelForm',
            'CU': 'CubaPetTravelForm',
            'DO': 'RepdomPetTravelForm',
            'SV': 'ElsalvadorPetTravelForm',
            'NI': 'NicaraguaPetTravelForm',
            'JM': 'JamaicaPetTravelForm',
            'TT': 'TrinidadtobagoPetTravelForm',
            'BB': 'BarbadosPetTravelForm',
            'AU': 'AustraliaPetTravelForm',
            'NZ': 'NuevazelandaPetTravelForm',
            'JP': 'JaponPetTravelForm',
            'CN': 'ChinaPetTravelForm',
            'SG': 'SingapurPetTravelForm',
            'KR': 'CoreasurPetTravelForm',
            'TH': 'ThailandiaPetTravelForm',
            'IL': 'IsraelPetTravelForm',
            'AE': 'EmiratosarabesPetTravelForm',
            'QA': 'CatarPetTravelForm',
            'KZ': 'KazajastanPetTravelForm',
            'KG': 'KirgyzistanPetTravelForm',
            'UZ': 'UzbekistanPetTravelForm',
            'MV': 'MaldivasPetTravelForm',
            'AM': 'ArmeniaPetTravelForm',
            'ZA': 'SudafricaPetTravelForm',
            'EG': 'EgiptoPetTravelForm',
            'MA': 'MarruecosPetTravelForm',
            'KY': 'IslascaimanPetTravelForm',
            'US': 'EstadosunidosPetTravelForm',
            'AT': 'AustriaPetTravelForm',
            'BE': 'BelgiumPetTravelForm',
            'HR': 'CroatiaPetTravelForm',
            'DK': 'DenmarkPetTravelForm',
            'SK': 'SlovakiaPetTravelForm',
            'SI': 'SloveniaPetTravelForm',
            'EE': 'EstoniaPetTravelForm',
            'LT': 'LithuaniaPetTravelForm',
            'LU': 'LuxembourgPetTravelForm',
            'PL': 'PolandPetTravelForm',
            'CZ': 'CzechRepublicPetTravelForm',
            'RO': 'RomaniaPetTravelForm',
            'LV': 'LatviaPetTravelForm'
        };
        if (codeToVarMap[countryCode]) {
            return codeToVarMap[countryCode];
        }
        return countryCode.charAt(0).toUpperCase() + countryCode.slice(1).toLowerCase() + 'PetTravelForm';
    },

    getCountryFileName: function (countryCode) {
        const map = {
            'DE': 'alemania',
            'FR': 'francia',
            'ES': 'spain',
            'IT': 'italia',
            'AG': 'antigua',
            'UK': 'reinounido',
            'ZC': 'escocia',
            'WL': 'gales',
            'PT': 'portugal',
            'GR': 'grecia',
            'GD': 'granada',
            'NL': 'holanda',
            'HN': 'honduras',
            'HU': 'hungary',
            'IE': 'irlanda',
            'SE': 'suecia',
            'FI': 'finlandia',
            'CH': 'suiza',
            'CY': 'cyprus',
            'MT': 'malta',
            'BG': 'bulgaria',
            'TR': 'turquia',
            'UA': 'ucrania',
            'RU': 'rusia',
            'CA': 'canada',
            'MX': 'mexico',
            'BR': 'brasil',
            'AR': 'argentina',
            'CL': 'chile',
            'CO': 'colombia',
            'EC': 'ecuador',
            'UY': 'uruguay',
            'VE': 'venezuela',
            'CR': 'costarica',
            'PA': 'panama',
            'CU': 'cuba',
            'DO': 'repdom',
            'SV': 'elsalvador',
            'NI': 'nicaragua',
            'JM': 'jamaica',
            'TT': 'trinidadtobago',
            'BB': 'barbados',
            'AU': 'australia',
            'NZ': 'nuevazelanda',
            'JP': 'japon',
            'CN': 'china',
            'SG': 'singapur',
            'KR': 'coreasur',
            'TH': 'thailandia',
            'IL': 'israel',
            'AE': 'emiratosarabes',
            'QA': 'catar',
            'KZ': 'kazajastan',
            'KG': 'kirgyzistan',
            'UZ': 'uzbekistan',
            'MV': 'maldivas',
            'AM': 'armenia',
            'ZA': 'sudafrica',
            'EG': 'egipto',
            'MA': 'marruecos',
            'KY': 'islascaiman',
            'BY': 'belarus',
            'AT': 'austria',
            'BE': 'belgium',
            'HR': 'croatia',
            'DK': 'denmark',
            'SK': 'slovakia',
            'SI': 'slovenia',
            'EE': 'estonia',
            'LT': 'lithuania',
            'LU': 'luxembourg',
            'PL': 'poland',
            'CZ': 'czechrepublic',
            'RO': 'romania',
            'LV': 'latvia',
            'US': 'estadosunidos'
        };
        return map[countryCode] || countryCode.toLowerCase();
    },

    init: function () {
        const countrySelect = document.getElementById('destinationCountry');
        if (countrySelect) {
            let lastCountry = null;
            let isProcessing = false;
            countrySelect.addEventListener('change', function () {
                const selectedCountry = this.value;
                if (selectedCountry === lastCountry || isProcessing) {
                    return;
                }
                lastCountry = selectedCountry;
                isProcessing = true;
                CountryFormLoader.clearCountryForm();
                if (selectedCountry && selectedCountry.trim() !== '') {
                    CountryFormLoader.loadCountryForm(selectedCountry)
                            .then(() => {                                
                                isProcessing = false;
                            })
                            .catch(error => {
                                console.error('Error cargando formulario:', error);
                                isProcessing = false;
                            });
                } else {
                    isProcessing = false;
                }
            });
            if (countrySelect.value) {
                setTimeout(() => {
                    CountryFormLoader.loadCountryForm(countrySelect.value);
                }, 500);
            }
        }
    },

    clearCountryForm: function () {
        const container = document.getElementById('countryFieldsContainer');
        if (container) {
            container.innerHTML = '';
            container.style.display = 'none';
        }
        this.currentCountry = null;
        this.petTravelForm = null;
    },

    loadCountryForm: async function (countryCode) {
        const self = this;
        try {            
            self.currentCountry = countryCode;
            self.showLoading(true);
            await self.loadCountryScript(countryCode);
            const variableName = self.getVariableName(countryCode);
            self.petTravelForm = window[variableName];
            if (!self.petTravelForm) {
                console.error('No se pudo obtener formulario para:', countryCode);
                self.petTravelForm = self.createNoFormObject(countryCode);
            }
            self.generateCountryForm();
        } catch (error) {
            console.error('Error crítico en loadCountryForm:', error);
            self.showErrorMessage(`No se pudo cargar la información para ${countryCode}. Error: ${error.message || 'Desconocido'}`);
            try {
                self.petTravelForm = self.createNoFormObject(countryCode);
                self.generateCountryForm();
            } catch (fallbackError) {
                console.error('Error en fallback:', fallbackError);
            }
        } finally {
            self.showLoading(false);
        }
    },

    loadCountryScript: function (countryCode) {    
    const self = this;
    return new Promise((resolve, reject) => {        
        const variableName = self.getVariableName(countryCode);
        if (window[variableName]) {
            const countryData = window[variableName];
            if (countryData && countryData.requirements && window.petTravelDB && !window.petTravelDB.getCountry(countryCode)) {
                self.loadIntoPetTravelDB(countryCode, countryData);
            }
            resolve();
            return;
        }
        const fileName = self.getCountryFileName(countryCode);        
        const countriesWithFiles = [
            'DE', 'FR', 'ES', 'IT', 'UK', 'PT', 'GR', 'NL', 'HU', 'IE', 'SE', 'FI', 'CH',
            'CY', 'MT', 'BG', 'TR', 'UA', 'RU', 'ZC', 'WL', "AG",
            'CA', 'MX', 'BR', 'AR', 'CL', 'CO', 'EC', 'UY', 'VE', 'CR', 'PA', 'CU',
            'DO', 'SV', 'NI', 'JM', 'TT', 'BB', 'BY', 'HN', 'GD', 'AT', 'BE', 'HR', 'DK', 'SK', 'SI', 'EE', 'LT', 'LU', 'PL', 'CZ', 'RO',
            'AU', 'NZ', 'JP', 'CN', 'SG', 'KR', 'TH', 'IL', 'AE', 'QA', 'KZ', 'UZ', 'KG', 'LV',
            'MV', 'AM', 'ZA', 'EG', 'MA', 'KY', 'US'
        ];
        if (!countriesWithFiles.includes(countryCode)) {            
            const countryName = self.getCountryNameFromSelect(countryCode) || countryCode;
            const noFormObject = {
                country: countryCode,
                country_name: countryName,
                no_form_available: true,
                form_title: `Información para ${countryName}`,
                form_description: `El país ${countryName} no tiene un formulario específico configurado en nuestro sistema.`,
                important_notices: [
                    '⚠️ No hay formulario específico disponible',
                    '📋 Consulte directamente con las autoridades del país',
                    '🌐 Verifique requisitos actualizados antes de viajar',
                    '📞 Contacte embajada o consulado para información oficial'
                ],
                show_no_form_message: true
            };
            window[variableName] = noFormObject;            
            resolve();
            return;
        }
        const scriptId = 'script-' + countryCode;
        let script = document.getElementById(scriptId);
        if (script) {
            if (script.getAttribute('data-loaded') === 'true') {
                const countryData = window[variableName];
                if (countryData && countryData.requirements && window.petTravelDB && !window.petTravelDB.getCountry(countryCode)) {
                    self.loadIntoPetTravelDB(countryCode, countryData);
                }
                resolve();
                return;
            }
            script.onload = () => {
                const countryData = window[variableName];
                if (countryData && countryData.requirements && window.petTravelDB) {
                    self.loadIntoPetTravelDB(countryCode, countryData);
                }
                resolve();
            };
            script.onerror = () => {
                console.warn('Error cargando script existente:', countryCode);
                const noFormObj = self.createNoFormObject(countryCode);
                window[variableName] = noFormObj;
                resolve();
            };
            return;
        }
        script = document.createElement('script');
        script.id = scriptId;
        const isRender = window.location.hostname.includes('onrender.com');
        const basePath = isRender ? '' : '/PetTravelDocs';
        script.src = basePath + '/js/country-requirements/countries/' + fileName + '.js';  
        script.async = true;
        script.defer = true;
        script.onload = () => {
            script.setAttribute('data-loaded', 'true');
            if (!window[variableName]) {
                console.warn('Script cargado pero objeto no creado:', variableName);
                const noFormObj = self.createNoFormObject(countryCode);
                window[variableName] = noFormObj;
            }
            const countryData = window[variableName];
            if (countryData && window.petTravelDB) {
                self.loadIntoPetTravelDB(countryCode, countryData);
            }
            resolve();
        };
        script.onerror = (error) => {
            console.error('Error cargando script:', countryCode, error);
            const noFormObj = self.createNoFormObject(countryCode);
            window[variableName] = noFormObj;
            resolve();
        };
        document.head.appendChild(script);
    });
},

loadIntoPetTravelDB: function(countryCode, countryData) {
    if (!window.petTravelDB) {
        console.warn('petTravelDB no está disponible');
        return;
    }
    if (window.petTravelDB.getCountry(countryCode)) {
        return;
    }
    const petReqData = {
        countryCode: countryData.countryCode || countryCode,
        countryName: countryData.countryName || countryData.country_name || this.getCountryNameFromSelect(countryCode) || countryCode,
        acceptsDigitalSignature: countryData.acceptsDigitalSignature || countryData.accepts_digital_signature || false,
        isBlacklisted: countryData.isBlacklisted || countryData.is_blacklisted || false,
        daysBeforeTravelForForm: countryData.daysBeforeTravelForForm || countryData.days_before_travel_for_form || 0,
        requirements: countryData.requirements || []
    };
    window.petTravelDB.addCountry(countryCode, petReqData);    
},

    createNoFormObject: function (countryCode) {
        const variableName = this.getVariableName(countryCode);
        const countryName = this.getCountryNameFromSelect(countryCode) || countryCode;
        const noFormObject = {
            country: countryCode,
            country_name: countryName,
            no_form_available: true,
            form_title: `Información para ${countryName}`,
            form_description: `El país ${countryName} no tiene un formulario específico configurado. Consulte con las autoridades locales para requisitos actualizados.`,
            important_notices: [
                '⚠️ Formulario específico no disponible',
                '📋 Contacte directamente con las autoridades de ' + countryName,
                '🌐 Verifique requisitos en el sitio oficial del gobierno',
                '📞 Consulte con su veterinario para asesoramiento'
            ],
            show_no_form_message: true,
            timestamp: new Date().toISOString()
        };
        return noFormObject;
    },

    getCountryNameFromSelect: function (countryCode) {
        const select = document.getElementById('destinationCountry');
        if (!select) {
            console.warn('Select de países no encontrado');
            return countryCode;
        }
        const option = select.querySelector(`option[value="${countryCode}"]`);
        if (option) {
            return option.textContent
                    .replace(/[^\w\sáéíóúÁÉÍÓÚñÑ()\-]/gi, '')
                    .trim();
        }
        console.warn('Opción no encontrada para país:', countryCode);
        return countryCode;
    },

    getCountryFormObject: function (countryCode) {
        const variableName = this.getVariableName(countryCode);
        return window[variableName];
    },

    generateCountryForm: function () {
        if (!this.petTravelForm) {
            console.error('No hay formulario para generar');
            return;
        }
        const countryCode = this.currentCountry;
        const formData = this.petTravelForm;
        let container = document.getElementById('countryFieldsContainer');
        if (!container) {
            container = document.createElement('div');
            container.id = 'countryFieldsContainer';
            container.className = 'country-fields-container';
            const countrySelect = document.getElementById('destinationCountry');
            if (countrySelect && countrySelect.parentNode) {
                const parentSection = countrySelect.closest('.form-section');
                if (parentSection) {
                    parentSection.appendChild(container);
                } else {
                    countrySelect.parentNode.insertBefore(container, countrySelect.nextSibling);
                }
            }
        }
        container.innerHTML = this.buildFormHTML(formData, countryCode);
        container.style.display = 'block';
        this.applyStyles();
        this.setupFormEvents(countryCode);
    },

    buildFormHTML: function (formData, countryCode) {
        if (formData.no_form_available || formData.show_no_form_message) {
            return this.buildNoFormMessage(formData, countryCode);
        }
        if (formData.form_structure) {
            return this.buildFormFromStructure(formData.form_structure, countryCode);
        }
        let html = '';
        if (formData.form_title) {
            html += '<div class="card border-primary shadow-sm mt-4">';
            html += '<div class="card-header bg-primary text-white">';
            html += '<h5 class="mb-0">';
            html += '<i class="fas fa-file-medical me-2"></i>';
            html += formData.form_title;
            html += '</h5>';
            html += '</div>';
            html += '<div class="card-body">';
        }
        if (formData.form_description) {
            html += '<div class="alert alert-info">';
            html += '<i class="fas fa-info-circle me-2"></i>';
            html += formData.form_description;
            html += '</div>';
        }
        if (formData.important_notices && formData.important_notices.length > 0) {
            html += '<div class="mb-4">';
            for (let i = 0; i < formData.important_notices.length; i++) {
                const notice = formData.important_notices[i];
                html += '<div class="alert alert-warning alert-dismissible fade show mb-2">';
                html += '<i class="fas fa-exclamation-triangle me-2"></i>';
                html += notice;
                html += '<button type="button" class="btn-close" data-bs-dismiss="alert"></button>';
                html += '</div>';
            }
            html += '</div>';
        }
        if (formData.form_sections && formData.form_sections.length > 0) {
            for (let i = 0; i < formData.form_sections.length; i++) {
                const section = formData.form_sections[i];
                if (section.conditional) {
                    if (!this.evaluateCondition(section.conditional, countryCode)) {
                        continue;
                    }
                }
                html += this.buildSectionHTML(section, countryCode);
            }
        }
        if (formData.footer_notes && formData.footer_notes.length > 0) {
            html += '<div class="mt-4 pt-3 border-top">';
            for (let i = 0; i < formData.footer_notes.length; i++) {
                const note = formData.footer_notes[i];
                html += '<p class="text-muted small mb-1"><i class="fas fa-sticky-note me-1"></i> ' + note + '</p>';
            }
            html += '</div>';
        }
        if (formData.contact_information) {
            html += '<div class="mt-4 alert alert-light">';
            html += '<h6><i class="fas fa-address-book me-2"></i>Contacto:</h6>';
            html += '<div class="row">';
            const contactEntries = Object.entries(formData.contact_information);
            for (let i = 0; i < contactEntries.length; i++) {
                const [key, value] = contactEntries[i];
                html += '<div class="col-md-6">';
                html += '<strong>' + this.formatKey(key) + ':</strong><br>';
                html += '<small>' + value + '</small>';
                html += '</div>';
            }
            html += '</div>';
            html += '</div>';
        }
        html += '</div></div></div>';
        return html;
    },

    buildNoFormMessage: function (formData, countryCode) {
        const countryName = formData.country_name || countryCode;

        // Intentar obtener datos del país desde petTravelDB
        let countryInfo = null;
        if (window.petTravelDB) {
            countryInfo = window.petTravelDB.getCountry(countryCode);
        }

        // Si no está en petTravelDB, intentar desde el objeto del país
        if (!countryInfo) {
            const variableName = this.getVariableName(countryCode);
            const countryObject = window[variableName];
            if (countryObject) {
                countryInfo = {
                    acceptsDigitalSignature: countryObject.acceptsDigitalSignature || countryObject.accepts_digital_signature || false,
                    isBlacklisted: countryObject.isBlacklisted || countryObject.is_blacklisted || false,
                    daysBeforeTravelForForm: countryObject.daysBeforeTravelForForm || countryObject.days_before_travel_for_form || 0,
                    requirements: countryObject.requirements || []
                };
            }
        }

        let infoCardsHtml = '';
        if (countryInfo) {
            infoCardsHtml = `
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card h-100 border-start border-5 border-primary">
                        <div class="card-body text-center">
                            <i class="fas fa-signature fa-2x text-primary mb-2"></i>
                            <h6 class="card-title">Firma Digital</h6>
                            <div class="mt-2">
                                ${countryInfo.acceptsDigitalSignature ? 
                                    '<span class="badge bg-success">✅ SÍ</span>' : 
                                    '<span class="badge bg-danger">❌ NO</span>'}
                            </div>
                            ${countryInfo.acceptsDigitalSignature ? 
                                '<p class="text-muted small mt-2">Se aceptan firmas digitales en documentos</p>' : 
                                '<p class="text-muted small mt-2">Requiere firma física original</p>'}
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 border-start border-5 ${countryInfo.isBlacklisted ? 'border-danger' : 'border-success'}">
                        <div class="card-body text-center">
                            <i class="fas fa-ban fa-2x ${countryInfo.isBlacklisted ? 'text-danger' : 'text-success'} mb-2"></i>
                            <h6 class="card-title">Lista Negra</h6>
                            <div class="mt-2">
                                ${countryInfo.isBlacklisted ? 
                                    '<span class="badge bg-danger">⚠️ EN LISTA NEGRA</span>' : 
                                    '<span class="badge bg-success">✅ NO EN LISTA</span>'}
                            </div>
                            ${countryInfo.isBlacklisted ? 
                                '<p class="text-muted small mt-2">Restricciones especiales aplican</p>' : 
                                '<p class="text-muted small mt-2">Sin restricciones especiales</p>'}
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 border-start border-5 border-info">
                        <div class="card-body text-center">
                            <i class="fas fa-calendar-days fa-2x text-info mb-2"></i>
                            <h6 class="card-title">Presentar Formulario</h6>
                            <div class="mt-2">
                                <span class="badge bg-info">📅 ${countryInfo.daysBeforeTravelForForm} días antes</span>
                            </div>
                            <p class="text-muted small mt-2">
                                ${countryInfo.daysBeforeTravelForForm > 0 ? 
                                    `Debe presentar formulario ${countryInfo.daysBeforeTravelForForm} días antes del viaje` :
                                    'Sin plazo específico de presentación'}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            `;
        }

        return `
        <div class="card border-primary shadow-sm mt-4">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">
                    <i class="fas fa-flag me-2"></i>
                    ${formData.form_title || `Información para ${countryName}`}
                </h5>
            </div>
            <div class="card-body">
                ${infoCardsHtml}

                <div class="alert ${formData.no_form_available ? 'alert-warning' : 'alert-info'}">
                    <h4 class="alert-heading">
                        <i class="fas ${formData.no_form_available ? 'fa-exclamation-triangle' : 'fa-info-circle'} me-2"></i>
                        ${formData.form_title || `Información para ${countryName}`}
                    </h4>
                    <p class="mb-3">${formData.form_description}</p>
                    ${formData.important_notices && formData.important_notices.length > 0 ? `
                        <hr>
                        <h6 class="mt-3">Recomendaciones:</h6>
                        <ul class="mb-0">
                            ${formData.important_notices.map(notice => 
                                `<li>${notice}</li>`
                            ).join('')}
                        </ul>
                    ` : ''}
                </div>
            </div>
        </div>
        `;
    },

    buildFormFromStructure: function (formStructure, countryCode) {
        let html = '';
        html += '<div class="card border-primary shadow-sm mt-4">';
        html += '<div class="card-header bg-primary text-white">';
        html += '<h5 class="mb-0">';
        html += '<i class="fas fa-file-medical me-2"></i>';
        html += 'Formulario para ' + (formStructure.country_name || countryCode);
        html += '</h5>';
        html += '</div>';
        html += '<div class="card-body">';
        if (formStructure.certification_statement) {
            html += '<div class="alert alert-info">';
            html += '<i class="fas fa-certificate me-2"></i>';
            html += '<strong>Declaración de Certificación:</strong><br>';
            html += formStructure.certification_statement;
            html += '</div>';
        }
        if (formStructure.requirements?.general) {
            const general = formStructure.requirements.general;
            html += '<div class="mb-4">';
            html += '<h5><i class="fas fa-list-check me-2"></i>Requisitos Generales</h5>';
            html += '<div class="row g-3">';
            if (general.title) {
                html += '<div class="col-12">';
                html += '<div class="form-control border-0 bg-transparent p-0">';
                html += '<strong>Título:</strong> ' + general.title;
                html += '</div>';
                html += '</div>';
            }
            if (general.species_applicable) {
                html += '<div class="col-md-6">';
                html += '<div class="mb-3">';
                html += '<label class="form-label"><i class="fas fa-paw me-1"></i>Especies aplicables</label>';
                html += '<div class="form-control border-0 bg-transparent p-0">';
                general.species_applicable.forEach(species => {
                    html += '<div class="form-check">';
                    html += '<input class="form-check-input" type="checkbox" checked disabled>';
                    html += '<label class="form-check-label">' + species + '</label>';
                    html += '</div>';
                });
                html += '</div>';
                html += '</div>';
                html += '</div>';
            }
            if (general.validity_period) {
                html += '<div class="col-md-6">';
                html += '<div class="mb-3">';
                html += '<label class="form-label"><i class="fas fa-calendar-check me-1"></i>Validez</label>';
                html += '<input type="text" class="form-control" value="' + general.validity_period + '" readonly>';
                html += '</div>';
                html += '</div>';
            }
            html += '</div>';
            html += '</div>';
        }
        if (formStructure.requirements?.identification_requirements) {
            html += '<div class="mb-4">';
            html += '<h5><i class="fas fa-id-card me-2"></i>Identificación</h5>';
            html += '<div class="row g-3">';
            formStructure.requirements.identification_requirements.forEach(req => {
                html += '<div class="col-md-6">';
                html += '<div class="mb-3">';
                html += '<label class="form-label">' + req.type + ' ' + (req.required ? '<span class="text-danger">*</span>' : '') + '</label>';
                if (req.fields && req.fields.length > 0) {
                    req.fields.forEach(field => {
                        html += '<input type="text" class="form-control mb-2" placeholder="' + field + '">';
                    });
                } else {
                    html += '<input type="text" class="form-control" placeholder="Ingrese información">';
                }
                if (req.details) {
                    html += '<small class="form-text text-muted">' + req.details + '</small>';
                }
                html += '</div>';
                html += '</div>';
            });
            html += '</div>';
            html += '</div>';
        }
        if (formStructure.requirements?.health_requirements) {
            const health = formStructure.requirements.health_requirements;
            html += '<div class="mb-4">';
            html += '<h5><i class="fas fa-heart-pulse me-2"></i>Requisitos de Salud</h5>';
            if (health.rabies_vaccination) {
                html += '<div class="row g-3">';
                html += '<div class="col-md-6">';
                html += '<div class="mb-3">';
                html += '<label class="form-label">Fecha de vacunación antirrábica <span class="text-danger">*</span></label>';
                html += '<input type="date" class="form-control" required>';
                if (health.rabies_vaccination.details) {
                    html += '<small class="form-text text-muted">' + health.rabies_vaccination.details + '</small>';
                }
                html += '</div>';
                html += '</div>';
                html += '</div>';
            }
            if (health.common_all_species) {
                html += '<div class="row g-3">';
                health.common_all_species.forEach(req => {
                    html += '<div class="col-md-6">';
                    html += '<div class="mb-3">';
                    html += '<label class="form-label">' + req.type + ' ' + (req.required ? '<span class="text-danger">*</span>' : '') + '</label>';
                    if (req.type === 'clinical_examination') {
                        html += '<div class="form-control border-0 bg-transparent p-0">';
                        html += '<div class="form-check">';
                        html += '<input class="form-check-input" type="checkbox" id="exam_' + countryCode + '">';
                        html += '<label class="form-check-label" for="exam_' + countryCode + '">Examen clínico realizado por: ' + (req.performed_by || 'veterinario') + '</label>';
                        html += '</div>';
                        html += '</div>';
                    } else {
                        html += '<input type="text" class="form-control" placeholder="Ingrese información">';
                    }
                    if (req.details) {
                        html += '<small class="form-text text-muted">' + req.details + '</small>';
                    }
                    html += '</div>';
                    html += '</div>';
                });
                html += '</div>';
            }
            html += '</div>';
        }
        if (formStructure.additional_notes && formStructure.additional_notes.length > 0) {
            html += '<div class="alert alert-warning">';
            html += '<h6><i class="fas fa-sticky-note me-2"></i>Notas Adicionales</h6>';
            html += '<ul class="mb-0">';
            formStructure.additional_notes.forEach(note => {
                html += '<li>' + note + '</li>';
            });
            html += '</ul>';
            html += '</div>';
        }
        html += '</div></div>';
        return html;
    },

    buildSectionHTML: function (section, countryCode) {
        let html = '<div class="form-section mb-4" id="section-' + section.section_id + '">';
        html += '<div class="field-icon">';
        html += '<i class="fas fa-folder-open"></i>';
        html += '</div>';
        html += '<h4 class="mb-3 text-primary">';
        html += '<i class="fas fa-list-alt me-2"></i>';
        html += section.section_title;
        html += '</h4>';
        if (section.warning) {
            html += '<div class="alert alert-danger">';
            html += '<i class="fas fa-exclamation-circle me-2"></i>';
            html += section.warning;
            html += '</div>';
        }
        if (section.fields && section.fields.length > 0) {
            html += '<div class="row g-3">';
            for (let i = 0; i < section.fields.length; i++) {
                const field = section.fields[i];
                if (field.conditional) {
                    if (!this.evaluateCondition(field.conditional, countryCode)) {
                        continue;
                    }
                }
                html += this.buildFieldHTML(field, countryCode);
            }
            html += '</div>';
        }
        html += '</div>';
        return html;
    },

    buildFieldHTML: function (field, countryCode) {
        const requiredClass = field.required ? 'required-field' : '';
        const requiredStar = field.required ? '<span class="text-danger">*</span> ' : '';
        const fieldId = 'field_' + countryCode + '_' + field.field_id;
        let colClass = 'col-md-6 col-lg-4';
        if (field.type === 'textarea' || field.type === 'note') {
            colClass = 'col-12';
        }
        let fieldHTML = '<div class="' + colClass + '" id="container_' + fieldId + '">';
        fieldHTML += '<div class="mb-3">';
        if (field.type !== 'checkbox-group' && field.type !== 'radio') {
            fieldHTML += '<label for="' + fieldId + '" class="form-label ' + requiredClass + '">';
            fieldHTML += requiredStar;
            fieldHTML += field.label;
            fieldHTML += '</label>';
        }
        switch (field.type) {
            case 'text':
            case 'email':
            case 'tel':
            case 'date':
            case 'time':
                fieldHTML += '<input type="' + field.type + '" ';
                fieldHTML += 'class="form-control" ';
                fieldHTML += 'id="' + fieldId + '" ';
                fieldHTML += 'name="' + field.field_id + '" ';
                if (field.required)
                    fieldHTML += 'required ';
                if (field.placeholder)
                    fieldHTML += 'placeholder="' + field.placeholder + '" ';
                if (field.default)
                    fieldHTML += 'value="' + field.default + '"';
                fieldHTML += '>';
                break;
            case 'textarea':
                fieldHTML += '<textarea class="form-control" ';
                fieldHTML += 'id="' + fieldId + '" ';
                fieldHTML += 'name="' + field.field_id + '" ';
                fieldHTML += 'rows="3" ';
                if (field.required)
                    fieldHTML += 'required ';
                if (field.placeholder)
                    fieldHTML += 'placeholder="' + field.placeholder + '"';
                fieldHTML += '>';
                if (field.default)
                    fieldHTML += field.default;
                fieldHTML += '</textarea>';
                break;
            case 'select':
                fieldHTML += '<select class="form-select" ';
                fieldHTML += 'id="' + fieldId + '" ';
                fieldHTML += 'name="' + field.field_id + '" ';
                if (field.required)
                    fieldHTML += 'required';
                fieldHTML += '>';
                fieldHTML += '<option value="">Seleccione...</option>';
                if (field.options && field.options.length > 0) {
                    for (let i = 0; i < field.options.length; i++) {
                        const opt = field.options[i];
                        const selected = field.default === opt.value ? 'selected' : '';
                        fieldHTML += '<option value="' + opt.value + '" ' + selected + '>';
                        fieldHTML += opt.label;
                        fieldHTML += '</option>';
                    }
                }
                fieldHTML += '</select>';
                break;
            case 'radio':
                fieldHTML += '<div class="form-control border-0 bg-transparent p-0">';
                if (field.options && field.options.length > 0) {
                    for (let i = 0; i < field.options.length; i++) {
                        const opt = field.options[i];
                        const radioId = fieldId + '_' + i;
                        fieldHTML += '<div class="form-check">';
                        fieldHTML += '<input class="form-check-input" ';
                        fieldHTML += 'type="radio" ';
                        fieldHTML += 'name="' + field.field_id + '" ';
                        fieldHTML += 'id="' + radioId + '" ';
                        fieldHTML += 'value="' + opt.value + '" ';
                        if (field.required)
                            fieldHTML += 'required';
                        fieldHTML += '>';
                        fieldHTML += '<label class="form-check-label" for="' + radioId + '">';
                        fieldHTML += opt.label;
                        fieldHTML += '</label>';
                        fieldHTML += '</div>';
                    }
                }
                fieldHTML += '</div>';
                break;
            case 'checkbox-group':
                fieldHTML += '<div class="form-control border-0 bg-transparent p-0">';
                if (field.options && field.options.length > 0) {
                    for (let i = 0; i < field.options.length; i++) {
                        const opt = field.options[i];
                        const checkboxId = fieldId + '_' + i;
                        fieldHTML += '<div class="form-check">';
                        fieldHTML += '<input class="form-check-input" ';
                        fieldHTML += 'type="checkbox" ';
                        fieldHTML += 'name="' + field.field_id + '[]" ';
                        fieldHTML += 'id="' + checkboxId + '" ';
                        fieldHTML += 'value="' + opt.value + '">';
                        fieldHTML += '<label class="form-check-label" for="' + checkboxId + '">';
                        fieldHTML += opt.label;
                        fieldHTML += '</label>';
                        fieldHTML += '</div>';
                    }
                }
                fieldHTML += '</div>';
                break;
            case 'note':
                let noteContent = field.content || '';
                noteContent = noteContent.replace(/\n/g, '<br>');
                fieldHTML += '<div class="alert alert-info p-3">' + noteContent + '</div>';
                break;
            default:
                fieldHTML += '<input type="text" ';
                fieldHTML += 'class="form-control" ';
                fieldHTML += 'id="' + fieldId + '" ';
                fieldHTML += 'name="' + field.field_id + '" ';
                if (field.required)
                    fieldHTML += 'required ';
                if (field.placeholder)
                    fieldHTML += 'placeholder="' + field.placeholder + '"';
                fieldHTML += '>';
        }
        if (field.note) {
            fieldHTML += '<div class="form-text text-muted">';
            fieldHTML += '<i class="fas fa-info-circle me-1"></i>';
            fieldHTML += field.note;
            fieldHTML += '</div>';
        }
        if (field.warning) {
            fieldHTML += '<div class="form-text text-danger small">';
            fieldHTML += '<i class="fas fa-exclamation-triangle me-1"></i>';
            fieldHTML += field.warning;
            fieldHTML += '</div>';
        }
        fieldHTML += '</div></div>';
        return fieldHTML;
    },

    evaluateCondition: function (condition, countryCode) {
        try {
            return eval(condition);
        } catch (e) {
            console.warn('Error evaluando condición:', condition, e);
            return true;
        }
    },

    formatKey: function (key) {
        const words = key.split('_');
        let result = '';
        for (let i = 0; i < words.length; i++) {
            const word = words[i];
            result += word.charAt(0).toUpperCase() + word.slice(1);
            if (i < words.length - 1)
                result += ' ';
        }
        return result;
    },

    applyStyles: function () {
        const container = document.getElementById('countryFieldsContainer');
        if (!container)
            return;
        container.style.width = '100%';
        container.style.maxWidth = '100%';
        container.style.margin = '20px 0';
        container.style.padding = '0';
        container.classList.add('country-form-styled');
        const formControls = container.querySelectorAll('.form-control, .form-select');
        for (let i = 0; i < formControls.length; i++) {
            formControls[i].classList.add('form-control-sm');
        }
        const rows = container.querySelectorAll('.row');
        for (let i = 0; i < rows.length; i++) {
            rows[i].style.marginLeft = '-7.5px';
            rows[i].style.marginRight = '-7.5px';
        }
        const cols = container.querySelectorAll('.row > [class*="col-"]');
        for (let i = 0; i < cols.length; i++) {
            cols[i].style.paddingLeft = '7.5px';
            cols[i].style.paddingRight = '7.5px';
        }
        const cards = container.querySelectorAll('.card');
        for (let i = 0; i < cards.length; i++) {
            cards[i].style.width = '100%';
            cards[i].style.maxWidth = '100%';
        }
        const labels = container.querySelectorAll('.form-label');
        for (let i = 0; i < labels.length; i++) {
            labels[i].style.marginBottom = '0.5rem';
            labels[i].style.fontWeight = '500';
        }
    },

    setupFormEvents: function (countryCode) {
        this.setupDependentFields(countryCode);
        this.setupValidations(countryCode);
    },

    setupDependentFields: function (countryCode) {
        const dependentFields = document.querySelectorAll('[data-depends-on]');
        for (let i = 0; i < dependentFields.length; i++) {
            const field = dependentFields[i];
            const dependsOnId = field.getAttribute('data-depends-on');
            const dependsOnValue = field.getAttribute('data-depends-value');
            const targetField = document.getElementById(dependsOnId);
            if (targetField) {
                const toggleField = () => {
                    const show = targetField.value === dependsOnValue;
                    field.style.display = show ? 'block' : 'none';
                    const inputField = field.querySelector('input, select, textarea');
                    if (!show) {
                        if (inputField) {
                            inputField.setAttribute('disabled', 'true');
                            if (inputField.tagName === 'INPUT' || inputField.tagName === 'TEXTAREA') {
                                inputField.value = '';
                            }
                        }
                    } else {
                        if (inputField) {
                            inputField.removeAttribute('disabled');
                        }
                    }
                };
                targetField.addEventListener('change', toggleField);
                toggleField();
            }
        }
    },

    setupValidations: function (countryCode) {
        const form = document.getElementById('countryFieldsContainer');
        if (!form)
            return;
        const requiredFields = form.querySelectorAll('[required]');
        for (let i = 0; i < requiredFields.length; i++) {
            const field = requiredFields[i];
            field.addEventListener('invalid', function (e) {
                e.preventDefault();
                this.classList.add('is-invalid');
                const nextSibling = this.nextElementSibling;
                if (!nextSibling || !nextSibling.classList.contains('invalid-feedback')) {
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'invalid-feedback';
                    errorDiv.textContent = 'Este campo es requerido';
                    this.parentNode.appendChild(errorDiv);
                }
            });
            field.addEventListener('input', function () {
                if (this.classList.contains('is-invalid')) {
                    this.classList.remove('is-invalid');
                    const nextSibling = this.nextElementSibling;
                    if (nextSibling && nextSibling.classList.contains('invalid-feedback')) {
                        nextSibling.remove();
                    }
                }
            });
        }
    },

    showLoading: function (show) {
        let loadingDiv = document.getElementById('countryFormLoading');
        if (show) {
            if (!loadingDiv) {
                loadingDiv = document.createElement('div');
                loadingDiv.id = 'countryFormLoading';
                loadingDiv.className = 'text-center py-4';
                loadingDiv.innerHTML = '';
                loadingDiv.innerHTML += '<div class="spinner-border text-primary" role="status">';
                loadingDiv.innerHTML += '<span class="visually-hidden">Cargando formulario...</span>';
                loadingDiv.innerHTML += '</div>';
                loadingDiv.innerHTML += '<p class="mt-2">Cargando formulario del país...</p>';
                const container = document.getElementById('countryFieldsContainer');
                if (container) {
                    container.innerHTML = '';
                    container.appendChild(loadingDiv);
                }
            }
        } else {
            if (loadingDiv) {
                loadingDiv.remove();
            }
        }
    },

    showErrorMessage: function (message) {
        const container = document.getElementById('countryFieldsContainer');
        if (!container)
            return;
        container.innerHTML = '';
        container.innerHTML += '<div class="alert alert-danger">';
        container.innerHTML += '<i class="fas fa-exclamation-triangle me-2"></i>';
        container.innerHTML += '<strong>Error:</strong> ' + message;
        container.innerHTML += '<br>';
        container.innerHTML += '<small>Intente seleccionar otro país o recargar la página.</small>';
        container.innerHTML += '</div>';
    },

    getCountryFormData: function () {
        const formData = {};
        const countryCode = this.currentCountry;
        if (!countryCode)
            return formData;
        const container = document.getElementById('countryFieldsContainer');
        if (!container)
            return formData;
        const inputs = container.querySelectorAll('input, select, textarea');
        for (let i = 0; i < inputs.length; i++) {
            const input = inputs[i];
            if (input.name && input.name.trim() !== '') {
                if (input.type === 'checkbox') {
                    if (!formData[input.name]) {
                        formData[input.name] = [];
                    }
                    if (input.checked) {
                        formData[input.name].push(input.value);
                    }
                } else if (input.type === 'radio') {
                    if (input.checked) {
                        formData[input.name] = input.value;
                    }
                } else {
                    formData[input.name] = input.value;
                }
            }
        }
        return {
            country: countryCode,
            formData: formData,
            timestamp: new Date().toISOString()
        };
    }
};

document.addEventListener('DOMContentLoaded', function () {
    CountryFormLoader.init();
});

if (typeof window !== 'undefined') {
    window.CountryFormLoader = CountryFormLoader;
}