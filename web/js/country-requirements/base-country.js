class CountryPetRequirements {
    constructor(data) {
        this.country = data.country;
        this.countryName = data.country_name;
        this.requirements = data.requirements;
        this.certificationStatement = data.certification_statement;
        this.formStructure = data.form_structure;
        this.translations = data.translations || {};
        this.currentLanguage = 'es';
    }

    setLanguage(language) {
        this.currentLanguage = language;
    }

    getTranslatedText(key, fallback) {
        if (this.translations[this.currentLanguage] && 
            this.translations[this.currentLanguage][key]) {
            return this.translations[this.currentLanguage][key];
        }
        return fallback;
    }

    isDesignatedPersonAllowed() {
        return this.requirements.designated_person?.allowed || false;
    }

    getEditableFields() {
        const editableFields = [];
        this.requirements.documentation_requirements?.forEach(doc => {
            if (doc.editable_fields) {
                editableFields.push(...doc.editable_fields);
            }
        });
        return editableFields;
    }

    getDesignatedPersonFields() {
        return this.requirements.designated_person?.fields_required || [];
    }

    getLegacyFormat() {
        const legacy = [];
        const title = this.getTranslatedText('Requisitos para', 'Requisitos para');
        legacy.push(`${title} ${this.getCountryName()}`);

        if (this.requirements.general?.title) {
            legacy.push(this.getTranslatedText(this.requirements.general.title, this.requirements.general.title));
        }

        this.requirements.health_requirements?.forEach(req => {
            if (req.type === 'vaccination') {
                if (req.name === 'rabies') {
                    legacy.push(this.getTranslatedText('Prueba de vacuna antirrábica', 'Prueba de vacuna antirrábica'));
                } else {
                    legacy.push(this.getTranslatedText('Certificado de salud veterinario', 'Certificado de salud veterinario'));
                }
            }
        });

        this.requirements.identification_requirements?.forEach(req => {
            if (req.type === 'microchip' && req.recommended) {
                legacy.push(this.getTranslatedText('Microchip recomendado', 'Microchip recomendado'));
            }
        });

        this.requirements.documentation_requirements?.forEach(doc => {
            legacy.push(this.getTranslatedText(doc.document, doc.document));
        });

        return Array.from(new Set(legacy));
    }

    getCountryName() {
        return this.getTranslatedText('country_name', this.countryName);
    }

    getCertificationStatement() {
        return this.getTranslatedText('certification_statement', this.certificationStatement);
    }

    getFormFields() {
        const allFields = [];
        this.requirements.documentation_requirements?.forEach(doc => {
            if (doc.form_sections) {
                doc.form_sections.forEach(section => {
                    if (section.fields) {
                        section.fields.forEach(field => {
                            const sectionTitle = this.getTranslatedText(
                                `section_${section.title}`, 
                                this.decodeText(section.title)
                            );
                            
                            const fieldLabel = this.getTranslatedText(
                                `field_${field.name}_label`, 
                                this.decodeText(field.label)
                            );
                            
                            const fieldPlaceholder = field.placeholder ? 
                                this.getTranslatedText(
                                    `field_${field.name}_placeholder`, 
                                    this.decodeText(field.placeholder)
                                ) : null;
                            
                            const fieldNote = field.note ? 
                                this.getTranslatedText(
                                    `field_${field.name}_note`, 
                                    this.decodeText(field.note)
                                ) : null;

                            let translatedOptions = field.options;
                            if (field.type === 'select' && field.options) {
                                translatedOptions = field.options.map(option => ({
                                    value: option.value,
                                    label: this.getTranslatedText(
                                        `option_${option.value}`, 
                                        option.label
                                    )
                                }));
                            }

                            allFields.push({
                                ...field,
                                sectionTitle: sectionTitle,
                                label: fieldLabel,
                                placeholder: fieldPlaceholder,
                                note: fieldNote,
                                options: translatedOptions || field.options
                            });
                        });
                    }
                });
            }
        });
        return allFields;
    }

    decodeText(text) {
        if (!text) return text;

        return text
            .replace(/Ã¡/g, 'á').replace(/Ã©/g, 'é').replace(/Ã­/g, 'í')
            .replace(/Ã³/g, 'ó').replace(/Ãº/g, 'ú').replace(/Ã±/g, 'ñ')
            .replace(/Ã/g, 'Á').replace(/Ã‰/g, 'É').replace(/Ã/g, 'Í')
            .replace(/Ã“/g, 'Ó').replace(/Ãš/g, 'Ú').replace(/Ã‘/g, 'Ñ')
            .replace(/Ã£/g, 'ã').replace(/Ãµ/g, 'õ').replace(/Ã§/g, 'ç')
            .replace(/Ã /g, 'à').replace(/Ã¨/g, 'è').replace(/Ã¬/g, 'ì')
            .replace(/Ã²/g, 'ò').replace(/Ã¹/g, 'ù');
    }
}

// Exportar para uso en Node.js o como módulo
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CountryPetRequirements;
} else if (typeof window !== 'undefined') {
    window.CountryPetRequirements = CountryPetRequirements;
}