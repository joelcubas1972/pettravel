const MissouriPetTravelForm = {
    stateCode: "MO",
    stateName: "Missouri",
    acceptsDigitalSignature: true, 
    daysBeforeTravelForForm: 30, 
    airlineModelRequirements: ["OCVI"],    
    isRabbitQuarantineArea: false, 
    requirements: [
        {
            id: "cvi_requirement_mo",
            name: "Certificate of Veterinary Inspection (CVI)",
            description: "A health certificate issued by an accredited veterinarian. Commonly required for interstate travel into Missouri[citation:5][citation:8].",
            required: true, // Common requirement, but official stance is unknown.
            type: "certificate",
            deadline: "30 days before travel (commonly cited)", // A separate source suggests 10 days[citation:8].
            specialInstructions: "The CVI should state the animal is free from signs of infectious or contagious disease[citation:6]. An official 'MO Small Animal Health Certificate' form exists[citation:6].",
            appliesTo: ["all"]
        },
        {
            id: "rabies_vaccine_mo",
            name: "Rabies Vaccination",
            description: "Dogs, cats, and ferrets over 4 months of age must be currently vaccinated against rabies[citation:5][citation:8].",
            required: true,
            type: "vaccine",
            details: "Vaccine must be administered by a licensed veterinarian. Missouri state law requires the vaccine for resident pets[citation:8].",
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
            id: "exhibition_livestock_mo",
            name: "Livestock & Exhibition Requirements (For Reference)",
            description: "Detailed public rules exist for animals exhibited at fairs/shows. For example, beef and swine require a CVI within 30 days of the event and official identification[citation:2][citation:4].",
            required: false,
            type: "general",
            condition: "For livestock (cattle, swine, sheep, goats, equine) imported for exhibition.",
            specialInstructions: "These are NOT pet requirements but are provided for completeness, as the state publishes these rules prominently[citation:2][citation:4].",
            appliesTo: ["all"]
        }
    ]
};

(function() {
    window.MissouriPetTravelForm = MissouriPetTravelForm;
    window.MOPetTravelForm = MissouriPetTravelForm;
    if (typeof window !== 'undefined' && window.stateTravelDB) {
        window.stateTravelDB.addState('MO', MissouriPetTravelForm);
    }
})();