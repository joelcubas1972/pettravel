const AphisPetTravelForm = {
    "form_number": "APHIS 7001",
    "form_title": "UNITED STATES INTERSTATE AND INTERNATIONAL CERTIFICATE OF HEALTH EXAMINATION FOR SMALL ANIMALS",
    "issuing_agency": "UNITED STATES DEPARTMENT OF AGRICULTURE, ANIMAL AND PLANT HEALTH INSPECTION SERVICE",
    "requirements": {
        "general": {
            "applicable_laws": [
                "7 U.S.C. 21.43.9",
                "CFR, Subchapter A, Part 2",
                "Paperwork Reduction Act of 1995 (OMB 0579-0020, 0579-0036)"
            ],
            "purpose": "Required for delivery of dogs, cats, nonhuman primates, or other designated animals to any intermediate handler or carrier for transportation in commerce",
            "validity_period": "30 days after issuance",
            "warning": "False statements may result in fine up to $10,000 or imprisonment up to 5 years (18 U.S.C. 1001)",
            "estimated_completion_time": "0.13 to 0.25 hours per response"
        },
        "animal_categories": {
            "primary_types": [
                "Dog",
                "Cat",
                "Nonhuman Primate",
                "Ferret",
                "Rodent"
            ],
            "additional_types": "Other (specify)"
        },
        "identification_requirements": [
            {
                "type": "animal_identification",
                "required": true,
                "methods": [
                    "Name",
                    "Tattoo number",
                    "Microchip",
                    "Other identification"
                ],
                "additional_fields": [
                    "Breed – common or scientific name",
                    "Age",
                    "Sex",
                    "Color or distinctive marks"
                ]
            }
        ],
        "health_documentation_requirements": [
            {
                "type": "vaccination_history",
                "required": true,
                "sections": {
                    "rabies_vaccination": {
                        "documentation_format": "table with columns for 1 YEAR, 2 YEARS, 3 YEARS",
                        "fields": ["Vaccination Date", "Product"]
                    },
                    "other_vaccinations_treatments": {
                        "documentation_format": "free text or table",
                        "fields": ["Date", "Product Type and/or Results"]
                    }
                }
            }
        ],
        "certification_requirements": [
            {
                "certifying_authority": "Licensed Veterinarian",
                "minimum_statements": [
                    "Animals examined on certificate date",
                    "Vaccination/treatment history true and accurate",
                    "Verification of microchip if listed"
                ],
                "health_findings": [
                    "Free of infectious or contagious diseases",
                    "No known exposure to diseases endangering animal/public health",
                    "Originated from non-rabies quarantined area",
                    "Not exposed to rabies"
                ],
                "format": "Checkbox (X) applicable statements"
            }
        ],
        "export_requirements": [
            {
                "type": "international_export",
                "usda_endorsement": "Required if needed",
                "accredited_veterinarian": {
                    "required_for_international": "May require certification by accredited veterinarian",
                    "accreditation_fields": [
                        "Accredited (Yes/No)",
                        "National Accreditation Number"
                    ]
                },
                "usda_veterinarian_fields": [
                    "Printed name of USDA Veterinarian",
                    "Signature of USDA Veterinarian",
                    "Date",
                    "USDA Seal or Stamp"
                ]
            }
        ],
        "form_fields": [
            {
                "section": "Basic Information",
                "fields": [
                    {"name": "TYPE OF ANIMAL SHIPPED", "type": "select", "options": ["Dog", "Cat", "Nonhuman Primate", "Ferret", "Rodent", "Other"], "required": true},
                    {"name": "TOTAL NUMBER OF ANIMALS", "type": "number", "required": true},
                    {"name": "PAGE", "type": "text", "required": true},
                    {"name": "CERTIFICATE NUMBER", "type": "text", "required": false, "note": "Official use only"}
                ]
            },
            {
                "section": "Owner/Recipient Information",
                "fields": [
                    {"name": "NAME, ADDRESS, AND TELEPHONE NUMBER OF OWNER (CONSIGNOR)", "type": "text", "required": true},
                    {"name": "USDA License/or Registration Number (if applicable)", "type": "text", "required": false},
                    {"name": "NAME, ADDRESS, AND TELEPHONE NUMBER OF RECIPIENT AT DESTINATION (CONSIGNEE)", "type": "text", "required": true}
                ]
            },
            {
                "section": "Animal Details",
                "fields": [
                    {"name": "ANIMAL IDENTIFICATION", "type": "table", "columns": ["NAME, AND/OR TATTOO NUMBER OR OTHER IDENTIFICATION", "BREED – COMMON OR SCIENTIFIC NAME", "AGE", "SEX", "COLOR OR DISTINCTIVE MARKS OR MICROCHIP"], "required": true},
                    {"name": "PERTINENT VACCINATION, TREATMENT, AND TESTING HISTORY", "type": "table", "columns": ["RABIES VACCINATION (1 YEAR, 2 YEARS, 3 YEARS)", "OTHER VACCINATIONS, TREATMENT, AND/OR TESTS AND RESULTS"], "subcolumns": ["Vaccination Date", "Product", "Date", "Product Type and/or Results"], "required": true}
                ]
            },
            {
                "section": "Veterinarian Information",
                "fields": [
                    {"name": "NAME, ADDRESS, AND TELEPHONE NUMBER OF ISSUING VETERINARIAN", "type": "text", "required": true},
                    {"name": "LICENSE NUMBER AND STATE", "type": "text", "required": true},
                    {"name": "Accredited", "type": "select", "options": ["Yes", "No"], "required": true},
                    {"name": "NATIONAL ACCREDITATION NUMBER", "type": "text", "required": false, "condition": "if accredited = Yes"},
                    {"name": "SIGNATURE OF ISSUING VETERINARIAN", "type": "signature", "required": true},
                    {"name": "DATE", "type": "date", "required": true}
                ]
            }
        ],
        "additional_sections": [
            {
                "name": "REMARKS OR ADDITIONAL CERTIFICATION STATEMENTS",
                "required": "When required",
                "type": "free_text"
            },
            {
                "name": "ENDORSEMENT FOR INTERNATIONAL EXPORT",
                "required": "If needed",
                "fields": ["PRINTED NAME OF USDA VETERINARIAN", "SIGNATURE OF USDA VETERINARIAN", "DATE", "USDA Seal or Stamp"]
            }
        ]
    },
    "certification_statements": [
        "I have verified the presence of the microchip, if a microchip is listed in box 7.",
        "I certify that the animal(s) described above and on continuation sheet(s), if applicable, have been inspected by me on this date and appear to be free of any infectious or contagious diseases and to the best of my knowledge, exposure thereto, which would endanger the animal or other animals or would endanger public health.",
        "To my knowledge, the animal(s) described above and on continuation sheet(s) if applicable, originated from an area not quarantined for rabies and has/have not been exposed to rabies."
    ],
    "notes": {
        "international_shipments": "International shipments may require certification by an accredited veterinarian",
        "continuation_sheets": "Continuation sheets may be used if additional space is needed",
        "legal_requirements": "Required for transportation in commerce of designated animals",
        "validity": "Certificate is valid for 30 days after issuance"
    },
    "form_structure": {
        "sections": [
            "Header: OMB approval and legal warnings",
            "Section 1-4: Basic animal and certificate information",
            "Section 5-6: Owner and recipient details",
            "Section 7-8: Animal identification and health history tables",
            "Section 9: Remarks and additional certifications",
            "Veterinary certification statements",
            "Veterinarian information and signature",
            "International export endorsement (if needed)"
        ],
        "special_features": [
            "Dual-purpose: Interstate and International",
            "Table format for animal identification and vaccination history",
            "Checkbox certification statements",
            "Optional USDA endorsement for international export",
            "Accreditation status tracking"
        ]
    }
};

// Exportar
if (typeof module !== 'undefined' && module.exports) {
    module.exports = AphisPetTravelForm;
} else if (typeof window !== 'undefined') {
    window.AphisPetTravelForm = AphisPetTravelForm;
}