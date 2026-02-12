const IllinoisPetTravelForm = {
    stateCode: "IL",
    stateName: "Illinois",
    acceptsDigitalSignature: false,
    daysBeforeTravelForForm: 30,
    airlineModelRequirements: ["OCVI"],
    
    isRabbitQuarantineArea: false,
    requirementsBySpecies: {
        // ====== PERROS Y GATOS (INTERNACIONAL & INTERESTATAL) ======
        dogs_cats: [
            {
                id: "health_certificate_dc_il",
                name: "Certificado Sanitario Oficial / CVI",
                description: "Para importaciones internacionales: certificado del país de origen emitido ≤30 días antes de la entrada. Para movimiento interestatal: CVI emitido por veterinario acreditado (válido 30 días).",
                required: true,
                type: "certificate",
                deadline: "30 días antes de la entrada",
                specialInstructions: "DEBE listar Illinois como destino final con direcciones completas. Incluir edad, sexo, raza y descripción. Una copia debe enviarse al Departamento (agr.cvi@illinois.gov) en ≤30 días desde su emisión.",
                appliesTo: ["all"]
            },
            {
                id: "rabies_vaccine_dc_il",
                name: "Vacunación contra la Rabia",
                description: "Obligatoria para todos los perros y gatos de 16 semanas (4 meses) de edad o más.",
                required: true,
                type: "vaccine",
                details: "El producto usado y la fecha deben figurar en el certificado/CVI.",
                appliesTo: ["dog", "cat", "ferret"],
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
                id: "federal_req_dc_il",
                name: "Requisitos Federales Previos (Solo Importación Internacional)",
                description: "Para ingresar a EE.UU., primero se deben cumplir los requisitos de los CDC y USDA APHIS.",
                required: true,
                type: "federal_requirements",
                appliesTo: ["dog", "cat"]
            },
            {
                id: "cvi_ls_il",
                name: "Certificado de Inspección Veterinaria (CVI)",
                description: "Requerido para todo ganado que ingresa a Illinois, excepto enviado directamente a matadero, mercado de subasta aprobado o corral de ventas federal. Válido 30 días desde la inspección.",
                required: true,
                type: "certificate",
                deadline: "30 días antes del movimiento",
                appliesTo: ["cow", "sheep", "mink"]
            },
            {
                id: "import_permit_ls_il",
                name: "Permiso de Importación en Línea",
                description: "Obligatorio para ganado con fines de producción o exhibición. Se obtiene a través del sistema 'Online Animal Import Permit'.",
                required: true,
                type: "permit",
                appliesTo: ["cow", "sheep", "mink"]
            },
            {
                id: "official_id_ls_il",
                name: "Identificación Oficial",
                description: "A partir del 5/nov/2024: dispositivo legible visual y electrónicamente (ej. etiqueta 840 RFID). Se aplica a bovinos intactos >18 meses, razas lecheras de todas las edades, y ganado para rodeo/exhibición.",
                required: true,
                type: "identification",
                appliesTo: ["cow", "sheep", "mink"]
            },
            {
                id: "brucellosis_test_ls_il",
                name: "Prueba de Brucelosis (si aplica)",
                description: "Bovinos y bisontes que NO provengan de un estado libre de brucelosis Clase A: Hembras ≥6 meses y machos ≥18 meses requieren prueba negativa dentro de 30 días antes de la entrada, o ser de rebaño certificado libre.",
                required: false,
                type: "testing",
                condition: "No aplica para ganado de estados libres de brucelosis Clase A, excepto toros de rodeo.",
                appliesTo: ["cow", "sheep", "mink"]
            },
            {
                id: "tb_test_ls_il",
                name: "Prueba de Tuberculosis (si aplica)",
                description: "Ganado de estados NO acreditados libres de TB: debe provenir de un rebaño con prueba negativa completa en los últimos 12 meses, y los animales individuales con prueba negativa adicional en los 30 días previos al movimiento.",
                required: false,
                type: "testing",
                condition: "No aplica para ganado de estados acreditados libres de tuberculosis.",
                appliesTo: ["cow", "sheep", "mink"]
            },
            {
                id: "cvi_perm_cerv_il",
                name: "CVI + Permiso Específico de Importación",
                description: "TODO movimiento de cérvidos (excepto a matadero) requiere un CVI y un permiso de importación específico. La solicitud de permiso (Request for Permit To Import Cervidae Form) debe enviarse con ≥3 días de antelación.",
                required: true,
                type: "permit",
                specialInstructions: "Procesamiento puede tomar hasta 72 horas. No se procesa fines de semana, noches o feriados.",
                appliesTo: ["cervid"]
            },
            {
                id: "dual_id_cerv_il",
                name: "Doble Identificación Oficial",
                description: "Dos formas de ID. Una debe ser un identificador oficial del USDA (ej. etiqueta 840). Ambas deben listarse en el CVI.",
                required: true,
                type: "identification",
                appliesTo: ["cervid"]
            },
            {
                id: "cwd_req_cerv_il",
                name: "Requisitos de Caquexia Crónica (CWD)",
                description: "Deben originarse de un REBAÑO CERTIFICADO PARA CWD. NO pueden provenir de una zona endémica (radio de 15 millas de un caso de CWD en los últimos 5 años).",
                required: true,
                type: "verification",
                appliesTo: ["cervid"]
            },
            {
                id: "cvi_perm_llama_il",
                name: "CVI + Permiso de Entrada",
                description: "Todas las llamas y alpacas que entren a Illinois deben estar acompañadas de un permiso de entrada emitido por el Departamento y un CVI emitido ≤30 días antes de la entrada.",
                required: true,
                type: "permit",
                appliesTo: ["camelid"]
            },
            {
                id: "cvi_perm_poultry_il",
                name: "CVI + Permiso de Entrada (para Exhibición)",
                description: "Las aves de corral (gallinas, pavos, etc.) que se importen para exposiciones, ferias o ventas requieren un CVI y un permiso de entrada del Departamento.",
                required: true,
                type: "permit",
                condition: "Para aves de exposición/eventos. Pueden haber requisitos adicionales.",
                appliesTo: ["poultry"]
            },
            {
                id: "cvi_exotic_il",
                name: "Certificado de Inspección Veterinaria (CVI) Oficial",
                description: "Requerido para mamíferos no nativos, reptiles, aves no nativas y mamíferos nativos no domesticados (ej. primates, reptiles exóticos, algunos roedores salvajes). No aplica a hámsters, cobayas o jerbos.",
                required: true,
                type: "certificate",
                specialInstructions: "Debe especificar número, especie, edad y sexo; estar aprobado por el funcionario sanitario del estado/país de origen; y declarar que los animales están libres de enfermedad.",
                appliesTo: ["exotic"]
            },
            {
                id: "permit_exotic_il",
                name: "Permiso de Importación (si va a instalación autorizada)",
                description: "Si el animal exótico va a un establecimiento con licencia de bienestar animal (criadero, refugio, tienda), el CVI debe incluir un número de permiso obtenido a través del sistema 'Online Animal Import Permit'.",
                required: false,
                type: "permit",
                condition: "Solo para envíos a licenciatarios de la Ley de Bienestar Animal.",
                appliesTo: ["exotic"]
            },
            {
                id: "no_specific_req_rabbit_il",
                name: "Sin Requisitos Específicos de Importación",
                description: "El estado de Illinois no lista requisitos de certificado de salud o permiso específicos para la importación de conejos domésticos como mascota. Se aplica el requisito general de no mostrar signos de enfermedad.",
                required: false,
                type: "general",
                appliesTo: ["rabbit"]
            },
            {
                id: "prohibited_rabbit_il",
                name: "Especies de Conejos Prohibidas",
                description: "Está PROHIBIDO importar, liberar, poseer o criar conejos de San Juan (a veces llamados europeos) en Illinois.",
                required: false,
                type: "prohibition",
                appliesTo: ["rabbit"]
            }
        ]
    }
};

(function() {
    window.IllinoisPetTravelForm = IllinoisPetTravelForm;
    window.ILPetTravelForm = IllinoisPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('IL', IllinoisPetTravelForm);
    }
})();