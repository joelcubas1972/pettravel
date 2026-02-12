var CanadaPetTravelForm = {
    countryCode: "CA",
    countryName: "Canadá",
    acceptsDigitalSignature: true,
    isBlacklisted: false,
    daysBeforeTravelForForm: 10,
    requirements: [
        {
            id: "age_requirement",
            name: "Edad mínima",
            description: "Animales no menores de 8 semanas al momento del examen veterinario",
            required: true,
            type: "age",
            appliesto: ["all"]
        },
        {
            id: "core_vaccines",
            name: "Vacunas básicas",
            description: "Vacunas para moquillo (distemper), hepatitis, parvovirus y parainfluenza. Administradas no antes de 6 semanas de edad con vacuna USDA autorizada",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat", "ferret"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "veterinary_examination",
            name: "Examen veterinario",
            description: "Examen realizado por veterinario licenciado. Animales encontrados saludables y libres de evidencia clínica de enfermedad",
            required: true,
            type: "examination",
            appliesto: ["all"]
        },
        {
            id: "rabies_vaccine",
            name: "Vacuna antirrábica",
            description: "Vacuna contra la rabia para animales de 3 meses de edad o mayores",
            required: true,
            type: "vaccine",
            appliesto: ["dog", "cat", "ferret"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "animal_identification",
            name: "Identificación de animales",
            description: "Animales claramente identificados",
            required: true,
            type: "identification",
            appliesto: ["all"]
        },
        {
            id: "fitness_for_travel",
            name: "Aptitud para viaje",
            description: "Animales pueden transportarse a Canadá sin sufrimiento indebido por enfermedad, lesión, fatiga u otra razón",
            required: true,
            type: "travel_fitness",
            appliesto: ["all"]
        },
        {
            id: "port_entry_inspection",
            name: "Inspección en puerto de entrada",
            description: "Animales deben presentarse para inspección en primer puerto de entrada canadiense dentro de 72 horas del examen veterinario",
            required: true,
            type: "inspection",
            appliesto: ["all"]
        },
        {
            id: "licensed_veterinarian",
            name: "Veterinario licenciado",
            description: "Certificado firmado por veterinario licenciado por el estado con número de licencia",
            required: true,
            type: "certification",
            appliesto: ["all"]
        },
        {
            id: "distemper_vaccine",
            name: "Vacuna contra moquillo (Distemper)",
            description: "Protección contra virus del moquillo canino",
            required: false,
            type: "vaccine",
            appliesto: ["dog"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "hepatitis_vaccine",
            name: "Vacuna contra hepatitis",
            description: "Protección contra hepatitis infecciosa canina",
            required: false,
            type: "vaccine",
            appliesto: ["dog"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "parvovirus_vaccine",
            name: "Vacuna contra parvovirus",
            description: "Protección contra parvovirus canino",
            required: false,
            type: "vaccine",
            appliesto: ["dog"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "parainfluenza_vaccine",
            name: "Vacuna contra parainfluenza",
            description: "Protección contra parainfluenza canina",
            required: false,
            type: "vaccine",
            appliesto: ["dog"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "internal_parasite_treatment",
            name: "Tratamiento antiparasitario interno",
            description: "Desparasitación contra parásitos intestinales",
            required: false,
            type: "parasite_treatment",
            appliesto: ["all"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        },
        {
            id: "external_parasite_treatment",
            name: "Tratamiento antiparasitario externo",
            description: "Control de pulgas, garrapatas y ácaros",
            required: false,
            type: "parasite_treatment",
            appliesto: ["all"],
            formFields: {
                vaccine_name: {label: "Nombre de la vacuna", required: true, type: "text"},
                vaccine_date: {label: "Fecha de aplicación", required: true, type: "date"},
                vaccine_batch: {label: "Número de lote", required: true, type: "text"},
                vet_name: {label: "Veterinario que aplicó", required: true, type: "text"},
                vet_license: {label: "Licencia del veterinario", required: true, type: "text"},
                clinic_name: {label: "Nombre de la clínica", required: true, type: "text"},
                clinic_address: {label: "Dirección de la clínica", required: true, type: "text"}
            }
        }
    ]
};

(function () {
    if (!window.CanadaPetTravelForm) {
        window.CanadaPetTravelForm = CanadaPetTravelForm;
        window.CAPetTravelForm = CanadaPetTravelForm;
    }
    // Añadir a petTravelDB si existe
    if (typeof window !== 'undefined' && window.petTravelDB) {
        window.petTravelDB.addCountry('CA', CanadaPetTravelForm);
    }
})();