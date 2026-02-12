const CountryCodeMap = {
    'AT': 'austria',
    'BE': 'belgium',
    'BG': 'bulgaria',
    'HR': 'croatia',
    'CY': 'cyprus',
    'CZ': 'czechrepublic',
    'DK': 'denmark',
    'EE': 'estonia',
    'FI': 'finlandia',
    'FR': 'francia',
    'DE': 'alemania',
    'GR': 'grecia',
    'HU': 'hungary',
    'IE': 'irlanda',
    'IT': 'italia',
    'LV': 'latvia',
    'LT': 'lithuania',
    'LU': 'luxembourg',
    'MT': 'malta',
    'NL': 'holanda',
    'PL': 'poland',
    'PT': 'portugal',
    'RO': 'romania',
    'SK': 'slovakia',
    'SI': 'slovenia',
    'ES': 'spain',
    'SE': 'suecia',
    
    // Otros países europeos (no UE)
    'UK': 'reinounido',
    'ZC': 'escocia',// Otros países europeos (no UE)
    'WL': 'gales',
    'CH': 'suiza',
    'TR': 'turquia',
    'UA': 'ucrania',
    'RU': 'rusia',
    'BY': 'belarus',
    
    // América
    'CA': 'canada',
    'MX': 'mexico',
    'BR': 'brasil',
    'AR': 'argentina',
    'CL': 'chile',
    'CO': 'colombia',
    'EC': 'ecuador',
    'US': 'estadosunidos',
    'UY': 'uruguay',
    'VE': 'venezuela',
    'CR': 'costarica',
    'PA': 'panama',
    'HN': 'honduras',
    'GD': 'granada',
    'CU': 'cuba',
    'DO': 'repdom',
    'SV': 'elsalvador',
    'NI': 'nicaragua',
    'JM': 'jamaica',
    'TT': 'trinidadtobago',
    'BB': 'barbados',
    'AG': 'antigua',
    'KY': 'islascaiman',
        
    // Asia/Oceanía
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
    
    // África
    'ZA': 'sudafrica',
    'EG': 'egipto',
    'MA': 'marruecos'
};

function getCountryFileCode(countryCode) {
    return CountryCodeMap[countryCode] || countryCode.toLowerCase();
}
if (typeof window !== 'undefined') {
    window.CountryCodeMap = CountryCodeMap;
    window.getCountryFileCode = getCountryFileCode;
}