<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Transporte Interestatal - Pet Travel Docs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
        <style>
            :root {
                --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                --warning-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
                --danger-gradient: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            }

            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
                min-height: 100vh;
                color: #333;
                margin: 0;
                padding: 0;
                position: relative;
                overflow-x: hidden;
            }

            .wide-main-container {
                width: 95%;
                max-width: 1800px;
                margin: 0 auto;
                padding-left: 15px;
                padding-right: 15px;
            }

            @media (max-width: 768px) {
                .wide-main-container {
                    width: 100%;
                    padding-left: 10px;
                    padding-right: 10px;
                }
            }

            .navbar-brand {
                font-family: 'Montserrat', sans-serif;
                font-weight: 700;
                font-size: 1.5rem;
                background: var(--primary-gradient);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .form-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 25px;
                padding: 30px;
                margin: 0 auto 20px;
                box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
                border: 1px solid rgba(255, 255, 255, 0.3);
                width: 100%;
                max-width: none;
                position: relative;
                z-index: 1;
            }

            .form-title {
                font-family: 'Montserrat', sans-serif;
                font-weight: 700;
                font-size: 2.2rem;
                background: var(--primary-gradient);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 10px;
                text-align: center;
            }

            .form-subtitle {
                color: #666;
                text-align: center;
                margin-bottom: 30px;
                font-size: 1.1rem;
                max-width: 900px;
                margin-left: auto;
                margin-right: auto;
            }

            .form-section {
                background: white;
                border-radius: 15px;
                padding: 25px;
                margin-bottom: 20px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                border: 1px solid #e9ecef;
                transition: all 0.3s ease;
                width: 100%;
            }

            .form-section:hover {
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                transform: translateY(-1px);
            }

            .field-icon {
                width: 35px;
                height: 35px;
                background: var(--primary-gradient);
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 16px;
                margin-bottom: 15px;
            }

            .required-field::after {
                content: " *";
                color: #dc3545;
            }

            .pet-section {
                position: relative;
                padding: 20px 20px 20px 50px;
                background: #f8f9fa;
                border-radius: 12px;
                border-left: 4px solid #667eea;
                margin-bottom: 20px;
                width: 100%;
            }

            .requirements-section {
                background-color: #f8f9fa;
                border-radius: 10px;
                padding: 15px;
                margin-top: 20px;
            }

            .requirement-item {
                margin-bottom: 8px;
                padding: 10px;
                border-radius: 6px;
                border-left: 4px solid #43e97b;
                animation: fadeIn 0.5s ease;
                font-size: 0.85rem;
                transition: all 0.3s ease;
                background-color: rgba(248, 249, 250, 0.5);
            }

            .country-info-cards {
                display: flex;
                gap: 20px;
                margin: 20px 0;
                flex-wrap: wrap;
            }

            .country-info-cards .card {
                flex: 1;
                min-width: 250px;
                border: none;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                border-radius: 12px;
            }

            .country-info-cards .card:hover {
                transform: translateY(-5px);
            }

            .country-info-cards .card-body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                text-align: center;
                padding: 20px;
            }

            .country-info-cards .card-title {
                font-size: 0.9rem;
                color: #495057;
                font-weight: 600;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .country-info-cards .card-text {
                font-size: 0.85rem;
                margin-bottom: 5px;
            }

            .country-info-cards .card-text strong {
                font-size: 1.2rem;
                display: block;
                margin-bottom: 8px;
                color: #2c3e50;
            }

            /* Estilos para el progress indicator */
            .progress-indicator {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                position: relative;
                padding: 0 15px;
            }

            .progress-indicator::before {
                content: '';
                position: absolute;
                top: 12px;
                left: 15px;
                right: 15px;
                height: 2px;
                background: #e9ecef;
                z-index: 1;
            }

            .step {
                text-align: center;
                position: relative;
                z-index: 2;
            }

            .step-circle {
                width: 35px;
                height: 35px;
                background: white;
                border: 2px solid #e9ecef;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 8px;
                font-weight: 600;
                color: #6c757d;
                transition: all 0.3s ease;
                font-size: 0.9rem;
            }

            .step.active .step-circle {
                background: var(--primary-gradient);
                border-color: #667eea;
                color: white;
                transform: scale(1.1);
            }

            .step-label {
                font-size: 0.8rem;
                color: #6c757d;
                font-weight: 500;
            }

            .step.active .step-label {
                color: #2c3e50;
                font-weight: 600;
            }

            /* Estilos para botones */
            .btn-primary-custom {
                background: var(--primary-gradient);
                border: none;
                border-radius: 10px;
                padding: 10px 30px;
                font-size: 1rem;
                font-weight: 600;
                color: white;
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            }

            .btn-primary-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
                color: white;
            }

            .form-actions {
                display: flex;
                justify-content: space-between;
                gap: 15px;
                margin-top: 30px;
                padding-top: 20px;
                border-top: 2px solid #e9ecef;
            }

            /* Estilos para inputs */
            .form-control, .form-select {
                border-radius: 8px;
                border: 1px solid #ced4da;
                padding: 8px 12px;
                font-size: 0.9rem;
                transition: all 0.2s ease;
                height: 40px;
            }

            .form-control:focus, .form-select:focus {
                border-color: #86b7fe;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }

            .small-input-group .form-control {
                font-size: 0.875rem !important;
                padding: 0.375rem 0.75rem !important;
            }

            /* Para que en móviles se apilen */
            @media (max-width: 768px) {
                .country-info-cards {
                    flex-direction: column;
                }

                .form-container {
                    padding: 20px;
                    margin: 0 5px 20px;
                    border-radius: 20px;
                }

                .form-title {
                    font-size: 1.6rem;
                }

                .form-section {
                    padding: 20px;
                }

                .form-actions {
                    flex-direction: column;
                    gap: 10px;
                }

                .btn-primary-custom {
                    width: 100%;
                    padding: 12px 20px;
                }

                .country-info-cards .card {
                    min-width: 100%;
                }
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Estilos adicionales que podrían faltar */
            .pet-badge {
                position: absolute;
                top: 12px;
                left: 12px;
                font-size: 0.75rem;
                padding: 3px 7px;
            }

            .pet-remove-btn {
                position: absolute;
                top: 8px;
                right: 8px;
                opacity: 0.6;
                transition: opacity 0.2s;
                padding: 3px 7px;
                font-size: 0.8rem;
            }

            .pet-remove-btn:hover {
                opacity: 1;
            }

            .row.mb-3 {
                margin-bottom: 1rem !important;
            }

            .alert {
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 20px;
            }

            /* Estilos para radios */
            .form-check-input:checked {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }

            .form-check-input:focus {
                border-color: #86b7fe;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }
            /* Estilos específicos para campos dentro de requisitos */
            .requirement-form-fields .form-label {
                display: block !important;
                visibility: visible !important;
                opacity: 1 !important;
                color: #495057 !important;
                font-weight: 600 !important;
                margin-bottom: 5px !important;
            }

            .requirement-form-fields .form-control,
            .requirement-form-fields .form-select {
                height: 38px !important;
                font-size: 0.9rem !important;
                border: 1px solid #ced4da !important;
                border-radius: 6px !important;
            }

            .requirement-form-fields .form-control:focus,
            .requirement-form-fields .form-select:focus {
                border-color: #86b7fe !important;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25) !important;
            }

            .requirement-form-fields textarea.form-control {
                min-height: 80px !important;
                resize: vertical !important;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3 shadow-sm">
            <div class="wide-main-container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="fas fa-paw me-2"></i>Pet Travel Docs
                </a>
                <div class="navbar-text">
                    <span class="badge bg-success rounded-pill">
                        <i class="fas fa-truck me-1"></i> Interestatal
                    </span>
                </div>
            </div>
        </nav>

        <!-- Progress Indicator -->
        <div class="wide-main-container mt-3">
            <div class="progress-indicator">
                <div class="step active">
                    <div class="step-circle">1</div>
                    <div class="step-label">Información</div>
                </div>
                <div class="step">
                    <div class="step-circle">2</div>
                    <div class="step-label">Revisión</div>
                </div>
                <div class="step">
                    <div class="step-circle">3</div>
                    <div class="step-label">Documento</div>
                </div>
            </div>
        </div>

        <!-- Main Form Container -->
        <div class="wide-main-container">
            <div class="form-container">
                <h1 class="form-title">
                    <i class="fas fa-truck-moving me-2"></i>Formulario de Transporte Interestatal
                </h1>
                <p class="form-subtitle">
                    Complete los datos para transportar mascotas dentro de los Estados Unidos (hasta 6 mascotas)
                </p>

                <form action="${pageContext.request.contextPath}/MainServlet" method="post" id="interstateForm">
                    <input type="hidden" name="action" value="budget">

                    <!-- SECCIÓN 1: INFORMACIÓN DEL VIAJE INTERESTATAL -->
                    <div class="form-section">
                        <div class="field-icon"><i class="fas fa-map-marked-alt"></i></div>
                        <h4 class="mb-4" style="color: #667eea;">
                            <i class="fas fa-globe-americas me-2"></i> Información del Viaje Interestatal
                        </h4>

                        <!-- Origen y Destino -->
                        <div class="row mb-3">
                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="ownerState" class="form-label required-field">
                                    <i class="fas fa-map-marker me-1"></i> Estado de Origen
                                </label>
                                <select class="form-select" id="ownerState" name="ownerState" required 
                                        onchange="updateOriginCities(); updateStateInfo();">
                                    <option value="">Seleccione estado...</option>
                                    <option value="AL">Alabama (AL)</option>
                                    <option value="AK">Alaska (AK)</option>
                                    <option value="AZ">Arizona (AZ)</option>
                                    <option value="AR">Arkansas (AR)</option>
                                    <option value="CA">California (CA)</option>
                                    <option value="CO">Colorado (CO)</option>
                                    <option value="CT">Connecticut (CT)</option>
                                    <option value="DE">Delaware (DE)</option>
                                    <option value="FL">Florida (FL)</option>
                                    <option value="GA">Georgia (GA)</option>
                                    <option value="HI">Hawaii (HI)</option>
                                    <option value="ID">Idaho (ID)</option>
                                    <option value="IL">Illinois (IL)</option>
                                    <option value="IN">Indiana (IN)</option>
                                    <option value="IA">Iowa (IA)</option>
                                    <option value="KS">Kansas (KS)</option>
                                    <option value="KY">Kentucky (KY)</option>
                                    <option value="LA">Louisiana (LA)</option>
                                    <option value="ME">Maine (ME)</option>
                                    <option value="MD">Maryland (MD)</option>
                                    <option value="MA">Massachusetts (MA)</option>
                                    <option value="MI">Michigan (MI)</option>
                                    <option value="MN">Minnesota (MN)</option>
                                    <option value="MS">Mississippi (MS)</option>
                                    <option value="MO">Missouri (MO)</option>
                                    <option value="MT">Montana (MT)</option>
                                    <option value="NE">Nebraska (NE)</option>
                                    <option value="NV">Nevada (NV)</option>
                                    <option value="NH">New Hampshire (NH)</option>
                                    <option value="NJ">New Jersey (NJ)</option>
                                    <option value="NM">New Mexico (NM)</option>
                                    <option value="NY">New York (NY)</option>
                                    <option value="NC">North Carolina (NC)</option>
                                    <option value="ND">North Dakota (ND)</option>
                                    <option value="OH">Ohio (OH)</option>
                                    <option value="OK">Oklahoma (OK)</option>
                                    <option value="OR">Oregon (OR)</option>
                                    <option value="PA">Pennsylvania (PA)</option>
                                    <option value="RI">Rhode Island (RI)</option>
                                    <option value="SC">South Carolina (SC)</option>
                                    <option value="SD">South Dakota (SD)</option>
                                    <option value="TN">Tennessee (TN)</option>
                                    <option value="TX">Texas (TX)</option>
                                    <option value="UT">Utah (UT)</option>
                                    <option value="VT">Vermont (VT)</option>
                                    <option value="VA">Virginia (VA)</option>
                                    <option value="WA">Washington (WA)</option>
                                    <option value="WV">West Virginia (WV)</option>
                                    <option value="WI">Wisconsin (WI)</option>
                                    <option value="WY">Wyoming (WY)</option>
                                    <option value="DC">Washington D.C. (DC)</option>
                                </select>
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="destinationState" class="form-label required-field">
                                    <i class="fas fa-map-pin me-1"></i> Estado Destino
                                </label>
                                <select class="form-select" id="destinationState" name="destination" required 
                                        onchange="updateDestinationCities(); updateStateInfo();">
                                    <option value="">Seleccione estado...</option>
                                    <option value="AL">Alabama (AL)</option>
                                    <option value="AK">Alaska (AK)</option>
                                    <option value="AZ">Arizona (AZ)</option>
                                    <option value="AR">Arkansas (AR)</option>
                                    <option value="CA">California (CA)</option>
                                    <option value="CO">Colorado (CO)</option>
                                    <option value="CT">Connecticut (CT)</option>
                                    <option value="DE">Delaware (DE)</option>
                                    <option value="FL">Florida (FL)</option>
                                    <option value="GA">Georgia (GA)</option>
                                    <option value="HI">Hawaii (HI)</option>
                                    <option value="ID">Idaho (ID)</option>
                                    <option value="IL">Illinois (IL)</option>
                                    <option value="IN">Indiana (IN)</option>
                                    <option value="IA">Iowa (IA)</option>
                                    <option value="KS">Kansas (KS)</option>
                                    <option value="KY">Kentucky (KY)</option>
                                    <option value="LA">Louisiana (LA)</option>
                                    <option value="ME">Maine (ME)</option>
                                    <option value="MD">Maryland (MD)</option>
                                    <option value="MA">Massachusetts (MA)</option>
                                    <option value="MI">Michigan (MI)</option>
                                    <option value="MN">Minnesota (MN)</option>
                                    <option value="MS">Mississippi (MS)</option>
                                    <option value="MO">Missouri (MO)</option>
                                    <option value="MT">Montana (MT)</option>
                                    <option value="NE">Nebraska (NE)</option>
                                    <option value="NV">Nevada (NV)</option>
                                    <option value="NH">New Hampshire (NH)</option>
                                    <option value="NJ">New Jersey (NJ)</option>
                                    <option value="NM">New Mexico (NM)</option>
                                    <option value="NY">New York (NY)</option>
                                    <option value="NC">North Carolina (NC)</option>
                                    <option value="ND">North Dakota (ND)</option>
                                    <option value="OH">Ohio (OH)</option>
                                    <option value="OK">Oklahoma (OK)</option>
                                    <option value="OR">Oregon (OR)</option>
                                    <option value="PA">Pennsylvania (PA)</option>
                                    <option value="RI">Rhode Island (RI)</option>
                                    <option value="SC">South Carolina (SC)</option>
                                    <option value="SD">South Dakota (SD)</option>
                                    <option value="TN">Tennessee (TN)</option>
                                    <option value="TX">Texas (TX)</option>
                                    <option value="UT">Utah (UT)</option>
                                    <option value="VT">Vermont (VT)</option>
                                    <option value="VA">Virginia (VA)</option>
                                    <option value="WA">Washington (WA)</option>
                                    <option value="WV">West Virginia (WV)</option>
                                    <option value="WI">Wisconsin (WI)</option>
                                    <option value="WY">Wyoming (WY)</option>
                                    <option value="DC">Washington D.C. (DC)</option>
                                </select>
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="pickupDate" class="form-label required-field">
                                    <i class="fas fa-calendar-alt me-1"></i> Fecha de Recolección
                                </label>
                                <input type="date" class="form-control" id="pickupDate" name="pickupDate" required
                                       onchange="validateTransportDates()">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="deliveryDate" class="form-label required-field">
                                    <i class="fas fa-calendar-check me-1"></i> Fecha de Entrega
                                </label>
                                <input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required
                                       onchange="validateTransportDates()">
                            </div>
                        </div>

                        <!-- Tipo de Transporte -->
                        <div class="row mb-3">
                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="transportType" class="form-label required-field">
                                    <i class="fas fa-shipping-fast me-1"></i> Tipo de Transporte
                                </label>
                                <select class="form-select" id="transportType" name="transportType" required>
                                    <option value="">Seleccione...</option>
                                    <option value="ground">🚗 Transporte Terrestre</option>
                                    <option value="air">✈️ Transporte Aéreo</option>
                                    <option value="train">🚆 Transporte en Tren</option>
                                    <option value="owner_transport">👤 Transporte Personal</option>
                                </select>
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="ownerCity" class="form-label required-field">
                                    <i class="fas fa-city me-1"></i> Ciudad de Origen
                                </label>
                                <select class="form-select" id="ownerCity" name="ownerCity" required>
                                    <option value="">Seleccione ciudad...</option>
                                </select>
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="destinationCity" class="form-label required-field">
                                    <i class="fas fa-city me-1"></i> Ciudad Destino
                                </label>
                                <select class="form-select" id="destinationCity" name="destinationCity" required>
                                    <option value="">Seleccione ciudad...</option>
                                </select>
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="transportCompany" class="form-label">
                                    <i class="fas fa-building me-1"></i> Empresa de Transporte
                                </label>
                                <input type="text" class="form-control" id="transportCompany" name="transportCompany"
                                       placeholder="Opcional">
                            </div>
                        </div>

                        <!-- Contenedor para información del estado destino (4 tarjetas) -->
                        <div class="country-info-cards">
                            <!-- Tarjeta 1: Firma Digital -->
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title">
                                        <i class="fas fa-signature me-1"></i> Firma Digital
                                    </h6>
                                    <p class="card-text">
                                        <strong id="digitalSignatureStatus">✅ Acepta</strong>
                                        <br>
                                        <small id="digitalSignatureDesc">Se puede usar firma digital en los documentos</small>
                                    </p>
                                </div>
                            </div>

                            <!-- Tarjeta 2: Días Previos para Formulario -->
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title">
                                        <i class="fas fa-calendar-alt me-1"></i> Tiempo de Trámite
                                    </h6>
                                    <p class="card-text">
                                        <strong id="daysBeforeTravel">10 días antes</strong>
                                        <br>
                                        <small id="daysBeforeTravelDesc">Debe realizar el trámite con esta antelación al viaje</small>
                                    </p>
                                </div>
                            </div>

                            <!-- Tarjeta 3: Lo que requiere el Estado -->
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title text-center">
                                        <i class="fas fa-building-columns me-2"></i> Estado requiere:
                                    </h6>
                                    <p class="card-text text-center">
                                        <strong id="stateCertificateType" class="d-block mb-1">OCVI/APHIS 7001</strong>
                                        <small id="stateCertificateNote" class="text-muted">Formato aceptado por este estado</small>
                                    </p>
                                    <div id="stateCertificateDetails" class="mt-2" style="display: none;">
                                        <small class="text-muted d-block text-center" id="stateCertificateDetailText">
                                            <!-- Detalles específicos aparecerán aquí -->
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <!-- Tarjeta 4: Aerolínea exige modelo (INDEPENDIENTE del estado) - CON CHECKBOXES -->
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title text-center mb-3">
                                        <i class="fas fa-plane me-2"></i> Su aerolínea exige:
                                    </h6>

                                    <div class="row justify-content-center">
                                        <!-- Checkbox OCVI -->
                                        <div class="col-auto text-center">
                                            <div class="form-check">
                                                <input class="form-check-input airline-checkbox" type="checkbox" 
                                                       id="airlineOCVI" name="airlineOCVI" value="OCVI">
                                                <label class="form-check-label" for="airlineOCVI">
                                                    OCVI
                                                </label>
                                            </div>
                                        </div>

                                        <!-- Checkbox APHIS 7001 -->
                                        <div class="col-auto text-center">
                                            <div class="form-check">
                                                <input class="form-check-input airline-checkbox" type="checkbox" 
                                                       id="airlineAPHIS" name="airlineAPHIS" value="APHIS 7001">
                                                <label class="form-check-label" for="airlineAPHIS">
                                                    APHIS 7001
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <small class="text-muted d-block mt-2 text-center" id="airlineSelectionNote">
                                        Marque los formatos que su aerolínea le solicita
                                    </small>

                                    <!-- Mensaje de advertencia si hay incompatibilidad -->
                                    <div id="airlineWarning" class="alert alert-warning mt-2 p-1 text-center" style="display: none; font-size: 0.8rem;">
                                        <i class="fas fa-exclamation-triangle me-1"></i>
                                        <span id="warningText"></span>
                                    </div>

                                    <!-- Información adicional -->
                                    <div class="mt-2 small text-info text-center" id="airlineInfo" style="display: none;">
                                        <i class="fas fa-info-circle me-1"></i>
                                        <span id="airlineInfoText"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- SECCIÓN 2: INFORMACIÓN DEL DUEÑO -->
                    <div class="form-section">
                        <div class="field-icon"><i class="fas fa-user"></i></div>
                        <h4 class="mb-4" style="color: #667eea;">
                            <i class="fas fa-user-circle me-2"></i> Información del Dueño/Remitente
                        </h4>

                        <div class="row mb-3">
                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="ownerName" class="form-label required-field">
                                    <i class="fas fa-user-tag me-1"></i> Nombre Completo
                                </label>
                                <input type="text" class="form-control" id="ownerName" name="client" 
                                       required placeholder="Ej: Juan Pérez García">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="ownerEmail" class="form-label required-field">
                                    <i class="fas fa-envelope me-1"></i> Email
                                </label>
                                <input type="email" class="form-control" id="ownerEmail" name="clientEmail" 
                                       required placeholder="ejemplo@email.com">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="ownerPhone" class="form-label required-field">
                                    <i class="fas fa-phone me-1"></i> Teléfono
                                </label>
                                <input type="tel" class="form-control" id="ownerPhone" name="ownerPhone" 
                                       required placeholder="+1 (123) 456-7890">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="ownerZipCode" class="form-label required-field">
                                    <i class="fas fa-mail-bulk me-1"></i> Código Postal
                                </label>
                                <input type="text" class="form-control" id="ownerZipCode" name="ownerZipCode" 
                                       required placeholder="Ej: 12345">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-12 small-input-group">
                                <label for="ownerAddress" class="form-label required-field">
                                    <i class="fas fa-home me-1"></i> Dirección de Origen
                                </label>
                                <input type="text" class="form-control" id="ownerAddress" name="ownerAddress" 
                                       required placeholder="Calle y Número, Ciudad, Estado">
                            </div>
                        </div>
                    </div>

                    <!-- SECCIÓN 3: INFORMACIÓN DEL RECEPTOR -->
                    <div class="form-section">
                        <div class="field-icon"><i class="fas fa-user-friends"></i></div>
                        <h4 class="mb-4" style="color: #667eea;">
                            <i class="fas fa-user-check me-2"></i> Información del Receptor
                        </h4>

                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="sameAsOwner" 
                                   onchange="toggleReceiverInfo()" checked>
                            <label class="form-check-label" for="sameAsOwner">
                                <i class="fas fa-user-check me-1"></i> El receptor es la misma persona que el remitente
                            </label>
                        </div>

                        <div id="receiverSection" style="display: none;">
                            <div class="row mb-3">
                                <div class="col-md-6 col-lg-4 small-input-group">
                                    <label for="receiverName" class="form-label required-field">
                                        <i class="fas fa-user-tag me-1"></i> Nombre del Receptor
                                    </label>
                                    <input type="text" class="form-control" id="receiverName" name="receiverName" 
                                           placeholder="Ej: Ana Martínez">
                                </div>

                                <div class="col-md-6 col-lg-4 small-input-group">
                                    <label for="receiverEmail" class="form-label required-field">
                                        <i class="fas fa-envelope me-1"></i> Email del Receptor
                                    </label>
                                    <input type="email" class="form-control" id="receiverEmail" name="receiverEmail" 
                                           placeholder="ana@email.com">
                                </div>

                                <div class="col-md-6 col-lg-4 small-input-group">
                                    <label for="receiverPhone" class="form-label required-field">
                                        <i class="fas fa-phone me-1"></i> Teléfono del Receptor
                                    </label>
                                    <input type="tel" class="form-control" id="receiverPhone" name="receiverPhone" 
                                           placeholder="+1 (123) 456-7890">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-12 small-input-group">
                                    <label for="destinationAddress" class="form-label required-field">
                                        <i class="fas fa-home me-1"></i> Dirección de Destino
                                    </label>
                                    <input type="text" class="form-control" id="destinationAddress" name="destinationAddress" 
                                           required placeholder="Calle y Número, Ciudad, Estado">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- SECCIÓN 4: INFORMACIÓN DE LAS MASCOTAS -->
                    <div class="form-section">
                        <div class="field-icon"><i class="fas fa-paw"></i></div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="mb-0" style="color: #667eea;">
                                <i class="fas fa-dog me-2"></i> Información de las Mascotas
                            </h4>
                            <button type="button" class="btn btn-outline-primary btn-sm" id="addPetBtn"
                                     title="Agregar otra mascota">
                                <i class="fas fa-plus-circle me-1"></i> Agregar mascota
                            </button>
                        </div>

                        <div id="petsContainer">
                            <!-- Primera mascota se agregará por JavaScript -->
                        </div>

                        <!-- Botón para agregar todos los requisitos faltantes al presupuesto -->
                        <div class="mt-4 pt-3 border-top" id="budgetButtonContainer" style="display: none;">
                            <button type="button" class="btn btn-warning" id="budgetSummaryBtn">
                                <i class="fas fa-shopping-cart me-1"></i> Ver Presupuesto (<span id="budgetCount">0</span>)
                            </button>
                            <button type="button" class="btn btn-outline-danger btn-sm ms-2" onclick="clearTempMissingReqs()">
                                <i class="fas fa-trash me-1"></i> Limpiar
                            </button>
                        </div>
                    </div>

                    <!-- BOTONES FINALES -->
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="window.location.href = '${pageContext.request.contextPath}/'">
                            <i class="fas fa-arrow-left me-2"></i> Cancelar
                        </button>
                        <button type="button" class="btn btn-outline-success" onclick="generateInterstatePDF()">
                            <i class="fas fa-file-pdf me-2"></i> Vista Previa PDF
                        </button>
                        <button type="button" class="btn btn-outline-info" onclick="generateTotalBudget()">
                            <i class="fas fa-calculator me-2"></i> Presupuesto Total
                        </button>    
                        <button type="submit" class="btn btn-primary" id="submitBtn">
                            <i class="fas fa-file-export me-2"></i> Generar Documentos
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>      
<script src="${pageContext.request.contextPath}/js/petTravelDB.js"></script>
        <script src="${pageContext.request.contextPath}/js/country-requirements/state-codes.js"></script>
<script src="${pageContext.request.contextPath}/js/petTravelDB.js"></script>
        <script src="${pageContext.request.contextPath}/js/country-requirements/state-requirements-db.js"></script>
        <script src="${pageContext.request.contextPath}/js/interstate-form-handler.js"></script>
        <script> window.contextPath = "${pageContext.request.contextPath}";</script>
        <script>
    // Variables globales
    let petCount = 0;
    window.missingReqsTemp = [];
    window.contextPath = '${pageContext.request.contextPath}';
    window.loadedStates = {}; // Nuevo: Para rastrear estados ya cargados
    // Variable global para coordinar carga
    window.stateLoadingInProgress = {};

    function coordinatedLoadStateData(stateCode) {
        const variableName = getStateVariableName(stateCode);

        // Si ya está cargado, retornar inmediatamente
        if (window.loadedStates && window.loadedStates[stateCode] && window[variableName]) {
            
            return Promise.resolve(window[variableName]);
        }

        // Si ya hay una carga en progreso, esperar
        if (window.stateLoadingInProgress[stateCode]) {
            
            return window.stateLoadingInProgress[stateCode];
        }

        // Crear promesa para la carga
        const loadPromise = new Promise((resolve, reject) => {
            // Verificar si interstate-form-handler.js ya cargó los datos
            if (window.stateTravelDB && window.stateTravelDB[stateCode]) {                
                window[variableName] = convertToPetTravelForm(window.stateTravelDB[stateCode], stateCode);
                window.loadedStates = window.loadedStates || {};
                window.loadedStates[stateCode] = true;
                resolve(window[variableName]);
                return;
            }

            // Verificar si ya está en window con otro nombre
            const possibleNames = [
                variableName,
                stateCode.toUpperCase() + 'PetTravelForm',
                stateCode + 'PetTravelForm'
            ];

            for (const name of possibleNames) {
                if (window[name]) {
                    
                    window[variableName] = window[name];
                    window.loadedStates = window.loadedStates || {};
                    window.loadedStates[stateCode] = true;
                    resolve(window[variableName]);
                    return;
                }
            }

            // Si no hay datos, cargar con loadStateScript
            loadStateScript(stateCode)
                .then(() => {
                    if (window[variableName]) {
                        resolve(window[variableName]);
                    } else {
                        reject(new Error('Datos no cargados para ' + stateCode));
                    }
                })
                .catch(reject);
        });

        // Guardar referencia a la promesa en curso
        window.stateLoadingInProgress[stateCode] = loadPromise;

        // Limpiar cuando termine
        loadPromise.finally(() => {
            setTimeout(() => {
                delete window.stateLoadingInProgress[stateCode];
            }, 1000);
        });

        return loadPromise;
    }
    // Datos de ciudades por estado
    const citiesByState = {
        "AL": ["Birmingham", "Montgomery", "Mobile", "Huntsville", "Tuscaloosa"],
        "AK": ["Anchorage", "Fairbanks", "Juneau", "Sitka", "Ketchikan"],
        "AZ": ["Phoenix", "Tucson", "Mesa", "Chandler", "Glendale"],
        "AR": ["Little Rock", "Fort Smith", "Fayetteville", "Springdale", "Jonesboro"],
        "CA": ["Los Angeles", "San Diego", "San Jose", "San Francisco", "Sacramento"],
        "CO": ["Denver", "Colorado Springs", "Aurora", "Fort Collins", "Lakewood"],
        "CT": ["Bridgeport", "New Haven", "Stamford", "Hartford", "Waterbury"],
        "DE": ["Wilmington", "Dover", "Newark", "Middletown", "Smyrna"],
        "FL": ["Jacksonville", "Miami", "Tampa", "Orlando", "St. Petersburg"],
        "GA": ["Atlanta", "Augusta", "Columbus", "Macon", "Savannah"],
        "HI": ["Honolulu", "Hilo", "Kailua", "Kaneohe", "Pearl City"],
        "ID": ["Boise", "Meridian", "Nampa", "Idaho Falls", "Pocatello"],
        "IL": ["Chicago", "Aurora", "Rockford", "Joliet", "Naperville"],
        "IN": ["Indianapolis", "Fort Wayne", "Evansville", "South Bend", "Carmel"],
        "IA": ["Des Moines", "Cedar Rapids", "Davenport", "Sioux City", "Iowa City"],
        "KS": ["Wichita", "Overland Park", "Kansas City", "Topeka", "Olathe"],
        "KY": ["Louisville", "Lexington", "Bowling Green", "Owensboro", "Covington"],
        "LA": ["New Orleans", "Baton Rouge", "Shreveport", "Lafayette", "Lake Charles"],
        "ME": ["Portland", "Lewiston", "Bangor", "South Portland", "Auburn"],
        "MD": ["Baltimore", "Frederick", "Rockville", "Gaithersburg", "Bowie"],
        "MA": ["Boston", "Worcester", "Springfield", "Cambridge", "Lowell"],
        "MI": ["Detroit", "Grand Rapids", "Warren", "Sterling Heights", "Ann Arbor"],
        "MN": ["Minneapolis", "Saint Paul", "Rochester", "Duluth", "Bloomington"],
        "MS": ["Jackson", "Gulfport", "Southaven", "Hattiesburg", "Biloxi"],
        "MO": ["Kansas City", "St. Louis", "Springfield", "Columbia", "Independence"],
        "MT": ["Billings", "Missoula", "Great Falls", "Bozeman", "Butte"],
        "NE": ["Omaha", "Lincoln", "Bellevue", "Grand Island", "Kearney"],
        "NV": ["Las Vegas", "Henderson", "Reno", "North Las Vegas", "Sparks"],
        "NH": ["Manchester", "Nashua", "Concord", "Derry", "Dover"],
        "NJ": ["Newark", "Jersey City", "Paterson", "Elizabeth", "Edison"],
        "NM": ["Albuquerque", "Las Cruces", "Rio Rancho", "Santa Fe", "Roswell"],
        "NY": ["New York City", "Buffalo", "Rochester", "Yonkers", "Syracuse"],
        "NC": ["Charlotte", "Raleigh", "Greensboro", "Durham", "Winston-Salem"],
        "ND": ["Fargo", "Bismarck", "Grand Forks", "Minot", "West Fargo"],
        "OH": ["Columbus", "Cleveland", "Cincinnati", "Toledo", "Akron"],
        "OK": ["Oklahoma City", "Tulsa", "Norman", "Broken Arrow", "Lawton"],
        "OR": ["Portland", "Eugene", "Salem", "Gresham", "Hillsboro"],
        "PA": ["Philadelphia", "Pittsburgh", "Allentown", "Erie", "Reading"],
        "RI": ["Providence", "Warwick", "Cranston", "Pawtucket", "East Providence"],
        "SC": ["Columbia", "Charleston", "North Charleston", "Mount Pleasant", "Rock Hill"],
        "SD": ["Sioux Falls", "Rapid City", "Aberdeen", "Brookings", "Watertown"],
        "TN": ["Memphis", "Nashville", "Knoxville", "Chattanooga", "Clarksville"],
        "TX": ["Houston", "San Antonio", "Dallas", "Austin", "Fort Worth"],
        "UT": ["Salt Lake City", "West Valley City", "Provo", "West Jordan", "Orem"],
        "VT": ["Burlington", "South Burlington", "Rutland", "Barre", "Montpelier"],
        "VA": ["Virginia Beach", "Norfolk", "Chesapeake", "Richmond", "Newport News"],
        "WA": ["Seattle", "Spokane", "Tacoma", "Vancouver", "Bellevue"],
        "WV": ["Charleston", "Huntington", "Morgantown", "Parkersburg", "Wheeling"],
        "WI": ["Milwaukee", "Madison", "Green Bay", "Kenosha", "Racine"],
        "WY": ["Cheyenne", "Casper", "Laramie", "Gillette", "Rock Springs"],
        "DC": ["Washington D.C."]
    };

    // Razas por especie
    const breedsBySpecies = {
        dog: ["Labrador Retriever","Pastor Alemán","Golden Retriever","Bulldog Francés","Bulldog Inglés","Poodle","Beagle","Rottweiler","Yorkshire Terrier","Boxer","Dachshund","Siberian Husky","Doberman","Great Dane","Shih Tzu","Border Collie","Chihuahua","Pomeranian","Cocker Spaniel","Australian Shepherd","Pug","Boston Terrier","Maltese","Havanese","Shetland Sheepdog","Cavalier King Charles Spaniel","Bichon Frisé","Weimaraner","Basset Hound","Mastín Inglés","San Bernardo","Bloodhound","Akita","Alaskan Malamute","Shiba Inu","Bull Terrier","Staffordshire Terrier","Pitbull","Whippet","Greyhound","Saluki","Afghan Hound","Corgi Galés","Pastor Belga","Pastor Australiano","Terranova","Leonberger","Otra raza"],
        cat: ["Siamés","Persa","Maine Coon","Bengalí","Esfinge","Ragdoll","British Shorthair","Scottish Fold","Angora Turco","Siberiano","Noruego del Bosque","Abisinio","Birmano","Azul Ruso","Oriental","Devon Rex","Cornish Rex","Manx","American Shorthair","Bombay","Burmés","Chartreux","Himalayo","Tonkinés","Selkirk Rex","Exótico","Munchkin","Savannah","Peterbald","Korat","LaPerm","Gato del Bosque Noruego","Gato Van Turco","Gato Habana","Gato Sokoke","Gato Burmilla","Otra raza"],
        bird: ["Periquito Australiano","Cacatúa","Agapornis","Canario","Guacamayo","Ninfas (Carolina)","Loro Gris Africano","Loro Amazonas","Cacatúa Ninfa","Jilguero","Diamante Mandarín","Diamante de Gould","Cotorra Argentina","Loro Eclectus","Cacatúa Galerita","Loro Senegalés","Cacatúa Alba","Periquito de Bourke","Periquito Espléndido","Ruiseñor del Japón","Estornino","Mainate","Cardenal","Pinzón Cebra","Pinzón de Gould","Pinzón de Java","Tórtola Diamante","Paloma","Cotorra de Kramer","Otra especie"],
        rabbit: ["Holandés","Mini Rex","Mini Lop","Cabeza de León","Angora Inglés","Flemish Giant","Californiano","New Zealand","Belier","Hotot","Polish","Britannia Petite","English Spot","French Lop","American Fuzzy Lop","Jersey Wooly","Mini Satin","Rex","Silver","Tan","Himalayan","Otra raza"],
        hamster: ["Sirio (Dorado)","Ruso Enano","Roborovski","Chino","Campbell","Hámster de Winter White","Hámster de Roborovski","Hámster Sirio Largo","Hámster Panda","Hámster Albino","Otra especie"],
        pig: ["Vietnamita","Mini Pig","Juliana","Kunekune","American Mini Pig","Potbelly","Teacup Pig","Yorkshire","Hampshire","Duroc","Otra raza"],
        sheep: ["Merino","Dorper","Suffolk","Hampshire","Dorset","Rambouillet","Columbia","Corriedale","Border Leicester","Cheviot","Otra raza"],
        cow: ["Holstein","Angus","Hereford","Jersey","Guernsey","Simmental","Limousin","Charolais","Brahman","Texas Longhorn","Highland","Otra raza"],
        horse: ["Pura Sangre","Árabe","Quarter Horse","Appaloosa","Paint Horse","Andaluz","Frisón","Percherón","Mustang","Tennessee Walker","Morgan","Paso Fino","Clydesdale","Shetland","Hanoveriano","Otra raza"],
        reptile: ["Gecko Leopardo","Iguana Verde","Tortuga de Tierra","Tortuga de Agua","Serpiente de Maíz","Camaleón","Dragón Barbudo","Tortuga Rusa","Pitón Real","Boa Constrictor","Anolis Verde","Tegu","Monstruo de Gila","Basilisco","Uromastyx","Serpiente del Maíz","Otra especie"],
        ferret: ["Hurón Estándar","Hurón Angora","Hurón Sable","Hurón Albino","Hurón Canela","Hurón Chocolate","Hurón Blanco de Ojos Negros","Otra raza"],
        fish: ["Betta","Guppy","Goldfish","Ángel","Disco","Tetra Neón","Cíclido Africano","Pez Arcoíris","Molly","Platy","Pez Gato","Pez Cebra","Pez Luchador Siamés","Pez Payaso","Pez Cirujano","Pez Ángel de Agua Dulce","Otra especie"],
        other: ["Erizo","Chinchilla","Cobaya","Ratón","Rata","Gerbo","Ardilla","Mapache","Zorro Fennec","Suricata","Petauro del Azúcar","Capibara","Cacatúa","Hurón","Otro"]
    };

    // ============ FUNCIONES DE CARGA DE ARCHIVOS ============

    function getStateVariableName(stateCode) {
        return stateCode.toUpperCase() + 'PetTravelForm';
    }

    function getStateFileName(stateCode) {
        // Primero intentar con StateCodeMap
        if (window.StateCodeMap && window.StateCodeMap[stateCode]) {
            const stateName = window.StateCodeMap[stateCode];
            // Convertir "alaska" a "alaska-pet-travel-form"
            return stateName.toLowerCase() + '-pet-travel-form';
        }
        
        // Si no hay StateCodeMap, usar nombre del select
        const stateSelect = document.getElementById('destinationState');
        if (stateSelect && stateSelect.selectedIndex >= 0) {
            const stateText = stateSelect.options[stateSelect.selectedIndex].text;
            // Extraer nombre del estado (ej: "Alaska (AK)" -> "alaska")
            const stateName = stateText.split(' (')[0].toLowerCase().replace(/\s+/g, '-');
            return stateName + '-pet-travel-form';
        }
        
        // Último recurso: usar código en minúscula
        return stateCode.toLowerCase() + '-pet-travel-form';
    }

    function loadStateScript(stateCode) {
        return new Promise((resolve, reject) => {
            // Verificar si ya está cargado
            const variableName = getStateVariableName(stateCode);

            if (window.loadedStates[stateCode] && window[variableName]) {
                
                resolve();
                return;
            }           

            // Obtener nombre del estado para construir el nombre de archivo
            const stateSelect = document.getElementById('destinationState');
            let stateName = '';

            if (stateSelect && stateSelect.selectedIndex >= 0) {
                const stateText = stateSelect.options[stateSelect.selectedIndex].text;
                // Extraer nombre del estado (ej: "Alaska (AK)" -> "Alaska")
                stateName = stateText.split(' (')[0];
            }

            if (!stateName && window.StateCodeMap && window.StateCodeMap[stateCode]) {
                stateName = window.StateCodeMap[stateCode];
            }

            if (!stateName) {
                stateName = stateCode; // Usar código como fallback
            }

            // SOLO INTENTAR LA RUTA CORRECTA
            const stateNameLower = stateName.toLowerCase();
            const possiblePaths = [
                window.contextPath + '/js/country-requirements/states/' + stateNameLower + '.js'
            ];

            // Agregar ruta alternativa si existe en StateCodeMap
            if (window.StateCodeMap && window.StateCodeMap[stateCode]) {
                const mappedName = window.StateCodeMap[stateCode].toLowerCase();
                if (mappedName !== stateNameLower) {
                    possiblePaths.push(window.contextPath + '/js/country-requirements/states/' + mappedName + '.js');
                }
            }

            function tryLoad(index) {
                if (index >= possiblePaths.length) {
                    
                    // Verificar si los datos ya fueron cargados por interstate-form-handler.js
                    if (window[variableName]) {
                        
                        window.loadedStates[stateCode] = true;
                        resolve();
                    } else {
                        
                        reject(new Error('No se encontraron datos para ' + stateCode));
                    }
                    return;
                }

                const fullPath = possiblePaths[index];
                
                const script = document.createElement('script');
                script.src = fullPath;
                script.id = 'script_' + stateCode + '_' + index;

                script.onload = () => {
                    
                    // Verificar si la variable se creó
                    setTimeout(() => {
                        if (window[variableName]) {
                            window.loadedStates[stateCode] = true;
                            
                            resolve();
                        } else {
                            
                            script.remove();
                            tryLoad(index + 1);
                        }
                    }, 500);
                };

                script.onerror = () => {
                   
                    script.remove();
                    tryLoad(index + 1);
                };

                document.head.appendChild(script);
            }

            tryLoad(0);
        });
    }

    // ============ FUNCIONES PRINCIPALES ============

    function updateOriginCities() {
        const stateSelect = document.getElementById('ownerState');
        const citySelect = document.getElementById('ownerCity');
        const selectedState = stateSelect.value;
        
        citySelect.innerHTML = '<option value="">Seleccione ciudad...</option>';
        
        if (selectedState && citiesByState[selectedState]) {
            citiesByState[selectedState].forEach(city => {
                const option = document.createElement('option');
                option.value = city;
                option.textContent = city;
                citySelect.appendChild(option);
            });
            citySelect.disabled = false;
        } else {
            citySelect.disabled = true;
        }
    }

    function updateDestinationCities() {
        const stateSelect = document.getElementById('destinationState');
        const citySelect = document.getElementById('destinationCity');
        const selectedState = stateSelect.value;
        
        citySelect.innerHTML = '<option value="">Seleccione ciudad...</option>';
        
        if (selectedState && citiesByState[selectedState]) {
            citiesByState[selectedState].forEach(city => {
                const option = document.createElement('option');
                option.value = city;
                option.textContent = city;
                citySelect.appendChild(option);
            });
            citySelect.disabled = false;
        } else {
            citySelect.disabled = true;
        }
    }

    function updateStateInfo() {
        const stateSelect = document.getElementById('destinationState');
        const stateCode = stateSelect.value;

        if (!stateCode) {
            clearStateCards();
            for (let i = 0; i < petCount; i++) {
                clearPetRequirements(i);
            }
            return;
        }

               // Mostrar mensaje de carga
        showLoadingStateMessage(stateCode);

        // Usar carga coordinada
        coordinatedLoadStateData(stateCode)
            .then(stateData => {
                
                updateCardsWithStateData(stateData, stateCode);
                updateAllPetRequirementsWithStateData(stateData);
            })
            .catch(error => {
                
                // Intentar con datos genéricos
                const variableName = getStateVariableName(stateCode);
                if (window[variableName]) {
                    
                    updateCardsWithStateData(window[variableName], stateCode);
                } else {
                    showGenericStateInfo(stateCode);
                }
            });
    }

    function continueUpdateStateInfo(stateSelect, stateCode) {
        const variableName = getStateVariableName(stateCode);
        const stateData = window[variableName];
        
        if (stateData) {
            // Actualizar tarjetas con datos reales
            updateCardsWithStateData(stateData, stateCode);
            
            // Actualizar requerimientos para mascotas que ya tienen nombre
            updateAllPetRequirementsWithStateData(stateData);
        } else {
            // Si aún no hay datos después de cargar, mostrar genérico            
            showGenericStateInfo(stateCode);
        }
    }

    function showLoadingStateMessage(stateCode) {
        // Tarjeta 1
        document.getElementById('digitalSignatureStatus').textContent = '⌛';
        document.getElementById('digitalSignatureDesc').textContent = 'Cargando datos...';
        
        // Tarjeta 2
        document.getElementById('daysBeforeTravel').textContent = '...';
        document.getElementById('daysBeforeTravelDesc').textContent = 'Cargando información...';
        
        // Tarjeta 3
        document.getElementById('stateCertificateType').textContent = '...';
        document.getElementById('stateCertificateNote').textContent = `Cargando datos para ${stateCode}...`;
        
        // Tarjeta 4 - IMPORTANTE: Resetear completamente
        const airlineOCVI = document.getElementById('airlineOCVI');
        const airlineAPHIS = document.getElementById('airlineAPHIS');
        const airlineSelectionNote = document.getElementById('airlineSelectionNote');
        const airlineWarning = document.getElementById('airlineWarning');
        
        if (airlineOCVI) {
            airlineOCVI.checked = false;
            airlineOCVI.disabled = true;
        }
        if (airlineAPHIS) {
            airlineAPHIS.checked = false;
            airlineAPHIS.disabled = true;
        }
        if (airlineSelectionNote) {
            airlineSelectionNote.textContent = 'Cargando datos del estado...';
            airlineSelectionNote.className = 'text-warning d-block mt-2 text-center';
        }
        if (airlineWarning) {
            airlineWarning.style.display = 'none';
        }
    }

    function showGenericStateInfo(stateCode) {
        
        // Verificar si ya tenemos los datos cargados desde interstate-form-handler.js
        const variableName = getStateVariableName(stateCode);
        if (window[variableName]) {
            
            updateCardsWithStateData(window[variableName], stateCode);
            return;
        }
        
        // Tarjeta 1: Firma Digital
        document.getElementById('digitalSignatureStatus').textContent = '---';
        document.getElementById('digitalSignatureDesc').textContent = 'Cargando datos...';

        // Tarjeta 2: Días Previos
        document.getElementById('daysBeforeTravel').textContent = '---';
        document.getElementById('daysBeforeTravelDesc').textContent = 'Cargando...';

        // Tarjeta 3: Lo que requiere el Estado
        document.getElementById('stateCertificateType').textContent = '---';
        document.getElementById('stateCertificateNote').textContent = 'Cargando datos...';

        // Tarjeta 4: Resetear completamente
        const airlineOCVI = document.getElementById('airlineOCVI');
        const airlineAPHIS = document.getElementById('airlineAPHIS');
        const airlineSelectionNote = document.getElementById('airlineSelectionNote');

        if (airlineOCVI) {
            airlineOCVI.checked = false;
            airlineOCVI.disabled = false;
        }
        if (airlineAPHIS) {
            airlineAPHIS.checked = false;
            airlineAPHIS.disabled = false;
        }
        if (airlineSelectionNote) {
            airlineSelectionNote.textContent = 'Marque los formatos que su aerolínea le solicita';
            airlineSelectionNote.className = 'text-muted d-block mt-2 text-center';
        }
    }

    function updateCardsWithStateData(stateData, stateCode) {
       
        // Tarjeta 1: Firma Digital - CORREGIR
        const digitalSignatureStatus = document.getElementById('digitalSignatureStatus');
        const digitalSignatureDesc = document.getElementById('digitalSignatureDesc');

        if (digitalSignatureStatus) {
            digitalSignatureStatus.textContent = 
                stateData.acceptsDigitalSignature ? '✅ Acepta' : '❌ No acepta';
            digitalSignatureStatus.className = 'd-block mb-1';
        }

        if (digitalSignatureDesc) {
            digitalSignatureDesc.textContent = 
                stateData.acceptsDigitalSignature ? 
                'Se puede usar firma digital en los documentos' : 
                'Se requiere firma física del veterinario';
        }

        // Tarjeta 2: Días Previos - CORREGIR
        const daysBeforeTravelElement = document.getElementById('daysBeforeTravel');
        const daysBeforeTravelDescElement = document.getElementById('daysBeforeTravelDesc');

        if (daysBeforeTravelElement) {
            const days = stateData.daysBeforeTravelForForm || 10;
            daysBeforeTravelElement.textContent = days + ' días antes';
        }

        if (daysBeforeTravelDescElement) {
            daysBeforeTravelDescElement.textContent = 
                'Debe realizar el trámite con esta antelación al viaje';
        }

        // ============ TARJETA 3: Lo que requiere el Estado ============
        const stateCertificateType = document.getElementById('stateCertificateType');
        const stateCertificateNote = document.getElementById('stateCertificateNote');
        const stateCertificateDetails = document.getElementById('stateCertificateDetails');

        if (stateCertificateType && stateCertificateNote) {
            if (stateData.airlineModelRequirements && stateData.airlineModelRequirements.length > 0) {
                const requirements = stateData.airlineModelRequirements;

                if (requirements.includes("OCVI") && !requirements.includes("APHIS 7001")) {
                    // Solo OCVI
                    stateCertificateType.textContent = 'OCVI';
                    stateCertificateType.className = 'd-block mb-1 text-danger';
                    stateCertificateNote.textContent = 'Este estado NO acepta APHIS 7001';
                    stateCertificateNote.className = 'text-danger';

                } else if (requirements.includes("APHIS 7001") && !requirements.includes("OCVI")) {
                    // Solo APHIS 7001
                    stateCertificateType.textContent = 'APHIS 7001';
                    stateCertificateType.className = 'd-block mb-1 text-warning';
                    stateCertificateNote.textContent = 'Este estado NO acepta OCVI';
                    stateCertificateNote.className = 'text-warning';

                } else if (requirements.includes("OCVI") && requirements.includes("APHIS 7001")) {
                    // Ambos
                    stateCertificateType.textContent = 'OCVI o APHIS 7001';
                    stateCertificateType.className = 'd-block mb-1 text-success';
                    stateCertificateNote.textContent = 'Acepta ambos formatos';
                    stateCertificateNote.className = 'text-success';
                } else {
                    // Ninguno especificado
                    stateCertificateType.textContent = 'OCVI/APHIS 7001';
                    stateCertificateType.className = 'd-block mb-1';
                    stateCertificateNote.textContent = 'Consulte requisitos específicos';
                    stateCertificateNote.className = 'text-muted';
                }

                // Mostrar notas especiales si existen
                if (stateData.specialNotes && stateCertificateDetails) {
                    const stateCertificateDetailText = document.getElementById('stateCertificateDetailText');
                    if (stateCertificateDetailText) {
                        stateCertificateDetailText.textContent = stateData.specialNotes;
                        stateCertificateDetails.style.display = 'block';
                    }
                } else if (stateCertificateDetails) {
                    stateCertificateDetails.style.display = 'none';
                }
            } else {
                // No hay datos de airlineModelRequirements
                stateCertificateType.textContent = 'OCVI/APHIS 7001';
                stateCertificateType.className = 'd-block mb-1';
                stateCertificateNote.textContent = 'Consulte requisitos específicos';
                stateCertificateNote.className = 'text-muted';
                if (stateCertificateDetails) {
                    stateCertificateDetails.style.display = 'none';
                }
            }
        }

        // Configurar radios de aerolínea (TARJETA 4) - IMPORTANTE
        configureAirlineCheckboxes(stateData, stateCode);
        updateAirlineInfo(stateData);
        
    }
    function updateAirlineInfo(stateData) {
        const airlineInfo = document.getElementById('airlineInfo');
        const airlineInfoText = document.getElementById('airlineInfoText');

        if (!airlineInfo || !airlineInfoText || !stateData) return;

        if (stateData.airlineModelRequirements) {
            const requirements = stateData.airlineModelRequirements;
            const acceptsOCVI = requirements.includes("OCVI");
            const acceptsAPHIS = requirements.includes("APHIS 7001");

            if (acceptsOCVI && !acceptsAPHIS) {
                airlineInfo.style.display = 'block';
                airlineInfoText.textContent = 'Este estado solo acepta OCVI oficialmente';
            } else if (!acceptsOCVI && acceptsAPHIS) {
                airlineInfo.style.display = 'block';
                airlineInfoText.textContent = 'Este estado solo acepta APHIS 7001 oficialmente';
            } else if (acceptsOCVI && acceptsAPHIS) {
                airlineInfo.style.display = 'block';
                airlineInfoText.textContent = 'Este estado acepta ambos formatos';
            } else {
                airlineInfo.style.display = 'none';
            }
        } else {
            airlineInfo.style.display = 'none';
        }
    }
    function updateAllPetRequirementsWithStateData(stateData) {
       
        for (let i = 0; i < petCount; i++) {
            const petNameInput = document.querySelector('[name="pets[' + i + '].name"]');
            const petName = petNameInput ? petNameInput.value.trim() : '';
            
            if (petName && stateData.requirements && stateData.requirements.length > 0) {                
                updatePetRequirementsWithStateData(i, stateData);
            }
        }
    }

    function updatePetRequirementsWithStateData(petIndex, stateData) {
        const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
        const petSpeciesSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        const petName = petNameInput ? petNameInput.value.trim() : 'Mascota ' + (petIndex + 1);
        const petSpecies = petSpeciesSelect ? petSpeciesSelect.value : '';

        const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
        const reqMessage = document.getElementById('reqMessage_' + petIndex);

        if (!reqContainer) return;

        reqContainer.innerHTML = '';
        if (reqMessage) reqMessage.style.display = 'none';

        // MAPEO CORREGIDO de especies
        const speciesMap = {
            'dog': ['dog', 'dogs', 'canine', 'caninos'],
            'cat': ['cat', 'cats', 'feline', 'felinos'],
            'bird': ['bird', 'birds', 'aves', 'avian'],
            'rabbit': ['rabbit', 'rabbits', 'conejo', 'conejos'],
            'hamster': ['hamster', 'rodent', 'rodents', 'roedor', 'roedores'],
            'pig': ['pig', 'pigs', 'porcine', 'cerdo', 'cerdos'],
            'sheep': ['sheep', 'ovine', 'oveja', 'ovejas'],
            'cow': ['cow', 'cows', 'bovine', 'vaca', 'vacas'],
            'horse': ['horse', 'horses', 'equine', 'caballo', 'caballos'],
            'reptile': ['reptile', 'reptiles', 'reptil'],
            'ferret': ['ferret', 'ferrets', 'hurón', 'hurones'],
            'fish': ['fish', 'fishes', 'pez', 'peces'],
            'other': ['other', 'others', 'otro', 'otros']
        };

        const currentSpecies = petSpecies || 'other';
        const currentSpeciesVariations = speciesMap[currentSpecies] || ['other'];

        // Verificar que stateData tenga requisitos
        if (!stateData.requirements || stateData.requirements.length === 0) {
            reqContainer.innerHTML = '<div class="alert alert-warning">No hay requisitos específicos para este estado</div>';
            return;
        }

        let html = '<div class="state-requirements">';
        html += '<h6 class="text-primary border-bottom pb-2 mb-3">';
        html += '<i class="fas fa-flag-usa me-2"></i>';
        html += stateData.stateName + ' - Requisitos para ' + getSpeciesName(petSpecies);
        html += '</h6>';

        // FILTRO CORREGIDO - más inclusivo
        const filteredRequirements = stateData.requirements.filter(req => {
            // Si no tiene appliesTo o es vacío, mostrar para todos
            if (!req.appliesTo || req.appliesTo === '' || req.appliesTo === undefined) {
                return true;
            }

            // Si appliesTo es 'all', mostrar para todos
            if (req.appliesTo === 'all') {
                return true;
            }

            // Convertir appliesTo a array para procesar
            let appliesToArray = [];
            if (Array.isArray(req.appliesTo)) {
                appliesToArray = req.appliesTo;
            } else if (typeof req.appliesTo === 'string') {
                // Separar por comas, pipes, o espacios
                appliesToArray = req.appliesTo.split(/[,|]/).map(item => item.trim().toLowerCase());
            }

            // Verificar si alguna de las variaciones de la especie actual coincide
            for (let i = 0; i < currentSpeciesVariations.length; i++) {
                const speciesVar = currentSpeciesVariations[i].toLowerCase();

                for (let j = 0; j < appliesToArray.length; j++) {
                    const applies = appliesToArray[j].toLowerCase();

                    // Comparaciones más flexibles
                    if (applies === speciesVar || 
                        applies === 'all' ||
                        speciesVar === 'all' ||
                        applies.includes(speciesVar) ||
                        speciesVar.includes(applies)) {
                        return true;
                    }
                }
            }

            return false;
        });
        
        if (filteredRequirements.length === 0) {
            html += '<div class="alert alert-info">';
            html += '<i class="fas fa-info-circle me-2"></i>';
            html += 'No hay requisitos específicos para ' + getSpeciesName(petSpecies) + ' en este estado.';
            html += '</div>';
        } else {
            // Separar requisitos obligatorios y opcionales
            const requiredReqs = filteredRequirements.filter(req => req.required === true);
            const optionalReqs = filteredRequirements.filter(req => req.required !== true);

            // Mostrar requisitos obligatorios
            if (requiredReqs.length > 0) {
                html += '<div class="mb-4">';
                html += '<strong class="text-danger d-block mb-2">';
                html += '<i class="fas fa-exclamation-circle me-1"></i> REQUISITOS OBLIGATORIOS PARA ' + getSpeciesName(petSpecies).toUpperCase();
                html += '</strong>';
                html += '<div class="ps-3">';

                requiredReqs.forEach(req => {
                    html += createRequirementCheckbox(req, petIndex, true);
                });

                html += '</div>';
                html += '</div>';
            }

            // Mostrar requisitos opcionales
            if (optionalReqs.length > 0) {
                html += '<div class="mb-4">';
                html += '<strong class="text-info d-block mb-2">';
                html += '<i class="fas fa-check-circle me-1"></i> RECOMENDACIONES PARA ' + getSpeciesName(petSpecies).toUpperCase();
                html += '</strong>';
                html += '<div class="ps-3">';

                optionalReqs.forEach(req => {
                    html += createRequirementCheckbox(req, petIndex, false);
                });

                html += '</div>';
                html += '</div>';
            }
        }

        html += '</div>';
        reqContainer.innerHTML = html;
    }

    // Función auxiliar para obtener nombre de especie
    function getSpeciesName(speciesCode) {
        const speciesNames = {
            "dog": "Perros",
            "cat": "Gatos", 
            "bird": "Aves",
            "rabbit": "Conejos",
            "hamster": "Hámsteres/Roedores",
            "pig": "Cerdos",
            "sheep": "Ovejas",
            "cow": "Vacas",
            "horse": "Caballos",
            "reptile": "Reptiles",
            "ferret": "Hurones",
            "fish": "Peces",
            "other": "Otras mascotas"
        };
        return speciesNames[speciesCode] || "Mascotas";
    }

    function clearPetRequirements(petIndex) {
        const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
        const reqMessage = document.getElementById('reqMessage_' + petIndex);
        
        if (reqContainer) {
            reqContainer.innerHTML = '';
        }
        if (reqMessage) {
            reqMessage.innerHTML = '<i class="fas fa-info-circle me-1"></i> Seleccione un estado destino';
            reqMessage.style.display = 'block';
        }
    }

    function clearStateCards() {
        // Tarjeta 1: Firma Digital
        document.getElementById('digitalSignatureStatus').textContent = '---';
        document.getElementById('digitalSignatureDesc').textContent = 'Seleccione estado destino';
        
        // Tarjeta 2: Días Previos
        document.getElementById('daysBeforeTravel').textContent = '---';
        document.getElementById('daysBeforeTravelDesc').textContent = 'Seleccione estado destino';
        
        // Tarjeta 3: Lo que requiere el Estado
        const stateCertificateType = document.getElementById('stateCertificateType');
        const stateCertificateNote = document.getElementById('stateCertificateNote');
        const stateCertificateDetails = document.getElementById('stateCertificateDetails');
        
        stateCertificateType.textContent = '---';
        stateCertificateType.className = 'd-block mb-1';
        stateCertificateNote.textContent = 'Seleccione estado destino';
        stateCertificateNote.className = 'text-muted';
        stateCertificateDetails.style.display = 'none';
        
        // Tarjeta 4: Resetear radios de aerolínea - ARREGLADO
        const airlineOCVI = document.getElementById('airlineOCVI');
        const airlineAPHIS = document.getElementById('airlineAPHIS');
        const airlineSelectionNote = document.getElementById('airlineSelectionNote');
        const airlineWarning = document.getElementById('airlineWarning');

        if (airlineOCVI) {
            airlineOCVI.checked = false;
            airlineOCVI.disabled = false;
        }
        if (airlineAPHIS) {
            airlineAPHIS.checked = false;
            airlineAPHIS.disabled = false;
        }
        if (airlineSelectionNote) {
            airlineSelectionNote.textContent = 'Marque los formatos que su aerolínea le solicita';
            airlineSelectionNote.className = 'text-muted d-block mt-2 text-center';
        }
        if (airlineWarning) {
            airlineWarning.style.display = 'none';
        }
    }

    function configureAirlineCheckboxes(stateData, stateCode) {
    const airlineOCVI = document.getElementById('airlineOCVI');
    const airlineAPHIS = document.getElementById('airlineAPHIS');
    const airlineSelectionNote = document.getElementById('airlineSelectionNote');
    const airlineWarning = document.getElementById('airlineWarning');
    const airlineInfo = document.getElementById('airlineInfo');

    // RESET COMPLETO - siempre habilitar ambas opciones y dejarlas en blanco
    if (airlineOCVI) {
        airlineOCVI.checked = false;
        airlineOCVI.disabled = false;
        airlineOCVI.classList.remove('is-invalid');
        airlineOCVI.type = 'checkbox'; // Asegurar que sea checkbox
    }
    if (airlineAPHIS) {
        airlineAPHIS.checked = false;
        airlineAPHIS.disabled = false;
        airlineAPHIS.classList.remove('is-invalid');
        airlineAPHIS.type = 'checkbox'; // Asegurar que sea checkbox
    }
    if (airlineWarning) {
        airlineWarning.style.display = 'none';
    }
    if (airlineInfo) {
        airlineInfo.style.display = 'none';
    }

    // SOLO mostrar información informativa, sin restricciones
    if (airlineSelectionNote) {
        airlineSelectionNote.textContent = 'Marque los formatos que su aerolínea le solicita';
        airlineSelectionNote.className = 'text-muted d-block mt-2 text-center';
    }
}
    
    function validateTransportDates() {
        const pickupDate = document.getElementById('pickupDate');
        const deliveryDate = document.getElementById('deliveryDate');
        
        if (pickupDate.value && deliveryDate.value) {
            const pickup = new Date(pickupDate.value);
            const delivery = new Date(deliveryDate.value);
            
            if (delivery < pickup) {
                alert('La fecha de entrega no puede ser anterior a la fecha de recolección');
                deliveryDate.value = '';
            }
        }
    }

    function toggleReceiverInfo() {
        const checkbox = document.getElementById('sameAsOwner');
        const receiverSection = document.getElementById('receiverSection');
        
        if (checkbox.checked) {
            receiverSection.style.display = 'none';
            // Copiar datos del dueño al receptor
            document.getElementById('receiverName').value = document.getElementById('ownerName').value;
            document.getElementById('receiverEmail').value = document.getElementById('ownerEmail').value;
            document.getElementById('receiverPhone').value = document.getElementById('ownerPhone').value;
            document.getElementById('destinationAddress').value = document.getElementById('ownerAddress').value;
        } else {
            receiverSection.style.display = 'block';
        }
    }

    // ============ FUNCIONES DE MASCOTAS ============

    function addPetSection() {
        if (petCount >= 6) {
            alert('Máximo 6 mascotas permitidas');
            return;
        }

        const container = document.getElementById('petsContainer');
        const index = petCount;

        // CREAR UN SOLO CONTENEDOR
        const petContainer = document.createElement('div');
        petContainer.className = 'mb-4 border rounded bg-light';
        petContainer.id = 'petContainer_' + index;

        // CONSTRUIR TODO EL HTML DE UNA VEZ - SIN DUPLICADOS
        let html = '';
        html += '<div class="pet-section p-3 position-relative">';
        html += '<div class="position-absolute top-0 start-0">';
        html += '<span class="badge bg-primary rounded-pill pet-badge">#' + (index + 1) + '</span>';
        html += '</div>';

        if (index > 0) {
            html += '<button type="button" class="btn btn-sm btn-outline-danger pet-remove-btn" style="position: absolute; top: 8px; right: 8px;" onclick="removePetSection(this)">';
            html += '<i class="fas fa-trash-alt"></i></button>';
        }

        html += '<div class="row mb-3">';
        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label required-field">';
        html += '<i class="fas fa-tag me-1"></i> Nombre';
        html += '</label>';
        html += '<input type="text" class="form-control" name="pets[' + index + '].name" ';
        html += 'required placeholder="Nombre de la mascota" oninput="checkAndUpdateRequirements(this,' + index + ')">';
        html += '</div>';

        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label required-field">';
        html += '<i class="fas fa-cat me-1"></i> Especie';
        html += '</label>';
        html += '<select class="form-select" name="pets[' + index + '].type" required onchange="updatePetBreeds(' + index + '); updatePetRequirements(' + index + ');">';
        html += '<option value="">Seleccione...</option>';
        html += '<option value="dog">🐕 Canino</option>';
        html += '<option value="cat">🐈 Felino</option>';
        html += '<option value="bird">🦜 Ave</option>';
        html += '<option value="rabbit">🐇 Conejo</option>';
        html += '<option value="hamster">🐹 Hámster</option>';
        html += '<option value="pig">🐖 Porcino</option>';
        html += '<option value="sheep">🐑 Ovino</option>';
        html += '<option value="cow">🐄 Bovino</option>';
        html += '<option value="horse">🐎 Equino</option>';
        html += '<option value="reptile">🦎 Reptil</option>';
        html += '<option value="ferret">🐾 Hurón</option>';
        html += '<option value="fish">🐠 Pez</option>';
        html += '<option value="other">🐾 Otro</option>';
        html += '</select>';
        html += '</div>';

        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label">';
        html += '<i class="fas fa-dna me-1"></i> Raza';
        html += '</label>';
        html += '<select class="form-select breed-select" id="petBreed_' + index + '" name="pets[' + index + '].breed">';
        html += '<option value="">Primero seleccione especie...</option>';
        html += '</select>';
        html += '</div>';

        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label required-field">';
        html += '<i class="fas fa-venus-mars me-1"></i> Sexo';
        html += '</label>';
        html += '<select class="form-select" name="pets[' + index + '].gender" required>';
        html += '<option value="">Seleccione...</option>';
        html += '<option value="male">♂ Macho</option>';
        html += '<option value="female">♀ Hembra</option>';
        html += '<option value="malec">♂ Macho Castrado</option>';
        html += '<option value="femalec">♀ Hembra Esterilizada</option>';
        html += '</select>';
        html += '</div>';
        html += '</div>';

        html += '<div class="row mb-3">';
        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label">';
        html += '<i class="fas fa-birthday-cake me-1"></i> Edad';
        html += '</label>';
        html += '<input type="text" class="form-control" name="pets[' + index + '].age"';
        html += 'placeholder="Ej: 3 años">';
        html += '</div>';

        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label">';
        html += '<i class="fas fa-weight me-1"></i> Peso (lbs)';
        html += '</label>';
        html += '<input type="number" class="form-control" name="pets[' + index + '].weight"';
        html += 'placeholder="Ej: 25">';
        html += '</div>';

        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label">';
        html += '<i class="fas fa-microchip me-1"></i> Microchip';
        html += '</label>';
        html += '<input type="text" class="form-control" name="pets[' + index + '].microchip"';
        html += 'placeholder="Número de microchip">';
        html += '</div>';

        html += '<div class="col-md-6 col-lg-3 small-input-group">';
        html += '<label class="form-label">';
        html += '<i class="fas fa-syringe me-1"></i> Última Vacuna Rabia';
        html += '</label>';
        html += '<input type="date" class="form-control" name="pets[' + index + '].rabiesVaccine">';
        html += '</div>';
        html += '</div>';

        // ✅ SECCIÓN DE REQUERIMIENTOS - INTEGRADA CORRECTAMENTE
        html += '<div class="requirements-section p-3 border-top bg-white" id="requirements_' + index + '">';
        html += '<h5 class="mb-3" style="color: #dc3545;">';
        html += '<i class="fas fa-tasks me-2"></i> Requerimientos del Estado Destino';
        html += '</h5>';
        html += '<div class="requirements-container" id="requirementsContainer_' + index + '">';
        html += '<div class="alert alert-info small" id="reqMessage_' + index + '">';
        html += '<i class="fas fa-info-circle me-1"></i> Seleccione un estado destino para ver los requerimientos específicos';
        html += '</div>';
        html += '</div>';
        html += '</div>';

        html += '</div>'; // Cierre final del pet-section

        // ✅ ASIGNAR TODO EL HTML DE UNA SOLA VEZ
        petContainer.innerHTML = html;

        // ✅ AGREGAR AL CONTENEDOR SOLO UNA VEZ
        container.appendChild(petContainer);

        // ✅ INCREMENTAR CONTADOR SOLO UNA VEZ
        petCount++;

        // Actualizar botón
        document.getElementById('addPetBtn').disabled = petCount >= 6;

        // Mostrar botón de presupuesto si hay mascotas
        document.getElementById('budgetButtonContainer').style.display = 'block';

        // Configurar event listeners
        setTimeout(function() {
            const petNameInput = petContainer.querySelector('[name="pets[' + index + '].name"]');
            if (petNameInput) {
                petNameInput.addEventListener('input', function() {
                    const stateCode = document.getElementById('destinationState').value;
                    if (this.value.trim() && stateCode) {
                        updatePetRequirements(index);
                    }
                });
            }
        }, 100);

        // Si ya hay estado seleccionado, actualizar requerimientos
        const stateCode = document.getElementById('destinationState').value;
        if (stateCode) {
            setTimeout(() => {
                updatePetRequirements(index);
            }, 150);
        }

        return index;
    }

    function checkAndUpdateRequirements(inputElement, petIndex) {
        const stateCode = document.getElementById('destinationState').value;
        const petName = inputElement.value.trim();
        
        if (petName && stateCode) {
            updatePetRequirements(petIndex);
        } else if (!petName) {
            // Si borran el nombre, ocultar requerimientos
            const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
            const reqMessage = document.getElementById('reqMessage_' + petIndex);
            
            if (reqContainer) {
                reqContainer.innerHTML = '';
                if (reqMessage) {
                    reqMessage.innerHTML = '<i class="fas fa-info-circle me-1"></i> Escriba el nombre de la mascota para ver los requerimientos';
                    reqMessage.style.display = 'block';
                }
            }
        }
    }

    function removePetSection(button) {
        if (petCount <= 1) {
            alert('Debe haber al menos una mascota');
            return;
        }

        // Encontrar el contenedor principal de la mascota
        const petContainer = button.closest('.mb-4.border.rounded.bg-light');
        if (petContainer) {
            petContainer.remove();
            petCount--;

            document.getElementById('addPetBtn').disabled = petCount >= 6;

            // Renumerar badges
            const badges = document.querySelectorAll('.pet-badge');
            badges.forEach((badge, index) => {
                badge.textContent = '#' + (index + 1);
            });
        }
    }

    function updatePetBreeds(petIndex) {
        const speciesSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        const breedSelect = document.getElementById('petBreed_' + petIndex);
        const selectedSpecies = speciesSelect ? speciesSelect.value : null;

        if (!breedSelect) return;

        // Limpiar opciones anteriores
        breedSelect.innerHTML = '<option value="">Seleccione raza...</option>';

        if (selectedSpecies && breedsBySpecies[selectedSpecies]) {
            const breeds = breedsBySpecies[selectedSpecies];

            // Agregar todas las razas de la especie seleccionada
            breeds.forEach(breed => {
                const option = document.createElement('option');
                option.value = breed.toLowerCase().replace(/ /g, '_');
                option.textContent = breed;
                breedSelect.appendChild(option);
            });

            // Opción para "Otra raza"
            const otherOption = document.createElement('option');
            otherOption.value = 'other';
            otherOption.textContent = 'Otra raza';
            breedSelect.appendChild(otherOption);
        } else if (selectedSpecies === 'other') {
            // Para "Otro" mostrar campo de texto
            breedSelect.innerHTML = '<option value="">Especifique...</option>';
            const otherOption = document.createElement('option');
            otherOption.value = 'custom';
            otherOption.textContent = 'Especifique la especie';
            breedSelect.appendChild(otherOption);
        }
    }

    // ============ FUNCIONES DE REQUERIMIENTOS ============

    function updatePetRequirements(petIndex) {
        const stateSelect = document.getElementById('destinationState');
        const stateCode = stateSelect.value;
        const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
        const petSpeciesSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        const petName = petNameInput ? petNameInput.value.trim() : '';
        const petSpecies = petSpeciesSelect ? petSpeciesSelect.value : '';        

        if (!stateCode) {
            
            clearPetRequirements(petIndex);
            return;
        }

        if (!petName) {
            
            clearPetRequirements(petIndex);
            return;
        }

        if (!petSpecies) {
            
            const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
            if (reqContainer) {
                reqContainer.innerHTML = '<div class="alert alert-info">Seleccione la especie para ver los requisitos específicos</div>';
            }
            return;
        }

        // Obtener datos del estado
        const variableName = getStateVariableName(stateCode);
        const stateData = window[variableName];

        if (stateData) {
            
            updatePetRequirementsWithStateData(petIndex, stateData);
        } else {
            
            const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
            if (reqContainer) {
                reqContainer.innerHTML = '<div class="alert alert-warning">No hay datos disponibles para este estado</div>';
            }
        }
    }

    function createRequirementCheckbox(requirement, petIndex, isRequired) {
        const requirementId = 'req_' + petIndex + '_' + requirement.id;

        // Obtener la especie de la mascota
        const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        const petType = petTypeSelect ? petTypeSelect.value : '';

        let html = '<div class="requirement-item mb-2 p-2 border rounded ';
        html += isRequired ? 'border-danger border-start border-5' : 'border-info';
        html += '">';

        // Mostrar icono de especie si aplica solo a ciertas especies
        if (requirement.appliesTo && requirement.appliesTo !== 'all') {
            html += '<div class="small mb-1">';
            html += '<i class="fas fa-paw me-1 text-muted"></i>';
            html += '<span class="text-muted">Aplica para: ' + formatAppliesTo(requirement.appliesTo) + '</span>';
            html += '</div>';
        }

        html += '<div class="form-check">';
        html += '<input type="checkbox" class="form-check-input requirement-checkbox" id="' + requirementId + '"';
        html += 'data-pet-index="' + petIndex + '"';
        html += 'data-req-id="' + requirement.id + '"';
        html += 'data-req-type="' + requirement.type + '"';
        html += 'data-req-name="' + requirement.name + '"';
        html += 'data-req-desc="' + requirement.description + '"';
        html += 'data-req-appliesTo="' + (Array.isArray(requirement.appliesTo) ? requirement.appliesTo.join(',') : requirement.appliesTo || 'all') + '"';

        // Agregar atributos para formFields
        if (requirement.formFields) {
            html += 'data-has-form-fields="true"';
            html += 'data-form-fields=\'' + JSON.stringify(requirement.formFields) + '\'';
        } else {
            html += 'data-has-form-fields="false"';
        }

        // 🔥 SOLO UN onchange - CORREGIDO
        html += 'onchange="handleRequirementCheckbox(this)"';

        html += '>';
        html += '<label class="form-check-label" for="' + requirementId + '" style="cursor: pointer;">';
        html += '<strong>' + requirement.name + '</strong>';

        if (isRequired) {
            html += ' <span class="text-danger">*</span>';
        }

        html += '<div class="small text-muted mt-1">' + requirement.description + '</div>';

        // Mostrar detalles específicos si existen
        if (requirement.specialInstructions) {
            html += '<div class="small mt-1"><strong>Instrucciones especiales:</strong> ' + requirement.specialInstructions + '</div>';
        }

        if (requirement.deadline) {
            html += '<div class="small mt-1"><i class="fas fa-calendar me-1"></i><strong>Plazo:</strong> ' + requirement.deadline + '</div>';
        }

        html += '</label>';
        html += '</div>';

        // Contenedor para los campos del formulario
        html += '<div id="formFields_' + petIndex + '_' + requirement.id + '" class="requirement-form-fields mt-3 p-3 border rounded bg-light" style="display: none;">';
        html += '<div class="alert alert-info p-2 small mb-3">';
        html += '<i class="fas fa-info-circle me-1"></i> Complete los detalles de <strong>' + requirement.name + '</strong>:';
        html += '</div>';
        html += '<div class="row g-3" id="fieldsContainer_' + petIndex + '_' + requirement.id + '">';
        // Los campos se generarán dinámicamente cuando se marque el checkbox
        html += '</div>';
        html += '</div>';

        html += '</div>';

        return html;
    }
    function handleRequirementCheckbox(checkbox) {
        console.log("📋 handleRequirementCheckbox ejecutado");

        // 1. Manejar los campos del formulario
        toggleRequirementDetails(checkbox);

        // 2. Manejar el presupuesto si es requerido
        const isRequired = checkbox.closest('.requirement-item').classList.contains('border-danger');
        if (isRequired) {
            console.log("Requisito obligatorio, actualizando presupuesto");
            toggleRequiredRequirement(checkbox);
        }
    }
    function toggleRequirementDetails(checkbox) {
        const petIndex = checkbox.dataset.petIndex;
        const reqId = checkbox.dataset.reqId;
        const hasFormFields = checkbox.dataset.hasFormFields === 'true';
        const isChecked = checkbox.checked;

        const formFieldsContainer = document.getElementById('formFields_' + petIndex + '_' + reqId);
        const fieldsContainer = document.getElementById('fieldsContainer_' + petIndex + '_' + reqId);

        if (isChecked && hasFormFields) {
            // Mostrar campos del formulario
            formFieldsContainer.style.display = 'block';

            // Generar los campos si aún no se han generado
            if (fieldsContainer.children.length === 0) {
                const formFieldsData = JSON.parse(checkbox.dataset.formFields);
                generateFormFields(petIndex, reqId, formFieldsData, fieldsContainer);
            }
        } else {
            // Ocultar campos del formulario
            formFieldsContainer.style.display = 'none';
        }
    }
 
    function generateFormFields(petIndex, reqId, formFieldsData, container) {
        container.innerHTML = '';

        Object.entries(formFieldsData).forEach(([fieldName, field], index) => {
            const fieldId = 'field_' + petIndex + '_' + reqId + '_' + fieldName + '_' + index;
            const label = field.label || fieldName;
            const type = field.type || 'text';
            const required = field.required ? 'required' : '';
            const placeholder = field.placeholder || '';

            // Iconos
            let iconClass = 'fas fa-edit text-primary';
            if (type === 'date') iconClass = 'fas fa-calendar text-primary';
            if (type === 'number') iconClass = 'fas fa-hashtag text-primary';
            if (type === 'email') iconClass = 'fas fa-envelope text-primary';

            // Concatenación MANUAL
            let fieldHtml = '<div class="col-md-6 mb-3">';
            fieldHtml += '<label for="' + fieldId + '" class="form-label fw-bold d-block" style="color: #2c3e50; font-size: 14px; margin-bottom: 8px;">';
            fieldHtml += '<i class="' + iconClass + ' me-1"></i>';
            fieldHtml += label;
            if (field.required) {
                fieldHtml += ' <span class="text-danger">*</span>';
            }
            fieldHtml += '</label>';
            fieldHtml += '<input type="' + type + '" class="form-control" id="' + fieldId + '"';
            fieldHtml += ' name="requirementDetails[' + petIndex + '][' + reqId + '][' + fieldName + ']"';
            if (required) {
                fieldHtml += ' ' + required;
            }
            fieldHtml += ' placeholder="' + placeholder + '"';
            fieldHtml += ' style="height: 38px;"';
            if (type === 'date') {
                fieldHtml += ' onchange="saveRequirementDetails()"';
            } else {
                fieldHtml += ' oninput="saveRequirementDetails()"';
            }
            fieldHtml += '>';
            fieldHtml += '</div>';

            container.innerHTML += fieldHtml;
        });
    }

    // Variable global para almacenar los detalles de los requisitos
    window.requirementDetails = {};

    function saveRequirementDetails() {
        // Recolectar todos los datos de los campos de requisitos
        window.requirementDetails = {};

        document.querySelectorAll('.requirement-form-fields').forEach(container => {
            const inputs = container.querySelectorAll('input, select, textarea');
            inputs.forEach(input => {
                if (input.name && input.value) {
                    // Extraer índices del nombre
                    const matches = input.name.match(/requirementDetails\[(\d+)\]\[([^\]]+)\]\[([^\]]+)\]/);
                    if (matches) {
                        const petIndex = matches[1];
                        const reqId = matches[2];
                        const fieldName = matches[3];

                        if (!window.requirementDetails[petIndex]) {
                            window.requirementDetails[petIndex] = {};
                        }
                        if (!window.requirementDetails[petIndex][reqId]) {
                            window.requirementDetails[petIndex][reqId] = {};
                        }

                        window.requirementDetails[petIndex][reqId][fieldName] = input.value;
                    }
                }
            });
        });

        console.log('Detalles guardados:', window.requirementDetails);
    }
    function formatAppliesTo(appliesTo) {
        if (!appliesTo) return 'Todas las mascotas';
        if (appliesTo === 'all') return 'Todas las mascotas';
        if (typeof appliesTo === 'string') {
            const speciesMap = {
                'dog': 'Perros',
                'cat': 'Gatos',
                'bird': 'Aves',
                'rabbit': 'Conejos',
                'hamster': 'Roedores',
                'pig': 'Cerdos',
                'sheep': 'Ovejas',
                'cow': 'Vacas',
                'horse': 'Caballos',
                'reptile': 'Reptiles',
                'ferret': 'Hurones',
                'fish': 'Peces',
                'other': 'Otras mascotas'
            };
            return speciesMap[appliesTo] || appliesTo;
        }
        if (Array.isArray(appliesTo)) {
            return appliesTo.map(s => formatAppliesTo(s)).join(', ');
        }
        return appliesTo;
    }

    function toggleRequiredRequirement(checkbox) {
        const petIndex = checkbox.dataset.petIndex;
        const reqId = checkbox.dataset.reqId;
        const reqName = checkbox.dataset.reqName;
        const reqType = checkbox.dataset.reqType;
        const reqDesc = checkbox.dataset.reqDesc;
        const hasFormFields = checkbox.dataset.hasFormFields === 'true';
        const isChecked = checkbox.checked;

        // Determinar si es requerido basado en la clase del contenedor
        const isRequired = checkbox.closest('.requirement-item').classList.contains('border-danger');

        const requirement = {
            id: reqId,
            name: reqName,
            type: reqType,
            description: reqDesc,
            required: isRequired,
            hasFormFields: hasFormFields
        };

        // Si tiene campos de formulario y está marcado, mostrar los campos
        if (isChecked && hasFormFields) {
            toggleRequirementDetails(checkbox);
        } else if (!isChecked) {
            // Ocultar campos si se desmarca
            const formFieldsContainer = document.getElementById('formFields_' + petIndex + '_' + reqId);
            if (formFieldsContainer) {
                formFieldsContainer.style.display = 'none';
            }
        }

        // MODIFICADO: Agregar/remover de presupuesto sin importar si es required o no
        addToBudgetIfMissing(requirement, petIndex, isChecked);

        if (isChecked) {
            checkbox.parentElement.classList.add('text-success');
        } else {
            checkbox.parentElement.classList.remove('text-success');
        }

        updateBudgetDisplay();
    }
    function getRequirementDetailsForPDF() {
        const details = {};

        // Recorrer todos los checkboxes marcados que tienen formFields
        document.querySelectorAll('.requirement-checkbox:checked').forEach(checkbox => {
            const petIndex = checkbox.dataset.petIndex;
            const reqId = checkbox.dataset.reqId;
            const hasFormFields = checkbox.dataset.hasFormFields === 'true';

            if (hasFormFields) {
                const formFieldsContainer = document.getElementById('formFields_' + petIndex + '_' + reqId);
                if (formFieldsContainer) {
                    const inputs = formFieldsContainer.querySelectorAll('input, select, textarea');
                    const fieldData = {};

                    inputs.forEach(input => {
                        if (input.name && input.value) {
                            const fieldName = input.name.split('[').pop().replace(']', '');
                            fieldData[fieldName] = input.value;
                        }
                    });

                    if (Object.keys(fieldData).length > 0) {
                        if (!details[petIndex]) details[petIndex] = {};
                        details[petIndex][reqId] = {
                            name: checkbox.dataset.reqName,
                            details: fieldData
                        };
                    }
                }
            }
        });

        return details;
    }
    // ============ FUNCIONES DE PRESUPUESTO ============

    function addToBudgetIfMissing(requirement, petIndex, isCompleted) {
        const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
        const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        let petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);
        const petSpecies = petTypeSelect ? petTypeSelect.value : '';

        // Verificar si este requisito aplica a la especie de la mascota
        const appliesToThisPet = checkRequirementAppliesToPet(requirement, petSpecies);

        if (!appliesToThisPet) {
            // Si no aplica a esta especie, no agregar al presupuesto
            console.log(`Requisito "${requirement.name}" no aplica para especie ${petSpecies}, ignorando...`);
            return;
        }

        if (!isCompleted) {  // Si NO está completado, agregar al presupuesto
            const missingReq = {
                name: requirement.name,
                description: requirement.description,
                type: requirement.type,
                estimatedCost: estimateCost(requirement.type),
                petName: petName,
                petIndex: petIndex,
                requirementId: requirement.id,
                required: requirement.required || false,
                addedAt: new Date().toISOString(),
                appliesTo: requirement.appliesTo || 'all',
                species: petSpecies
            };

            let alreadyExists = false;
            if (window.missingReqsTemp) {
                for (let i = 0; i < window.missingReqsTemp.length; i++) {
                    const existingReq = window.missingReqsTemp[i];
                    if (existingReq.petIndex === petIndex && existingReq.requirementId === requirement.id) {
                        alreadyExists = true;
                        break;
                    }
                }
            }

            if (!alreadyExists) {
                if (!window.missingReqsTemp) {
                    window.missingReqsTemp = [];
                }
                window.missingReqsTemp.push(missingReq);
                showAlert(requirement.name + ' agregado al presupuesto para ' + petName, 'info');
            }

        } else if (isCompleted) {  // Si SÍ está completado, remover del presupuesto
            if (window.missingReqsTemp) {
                const initialLength = window.missingReqsTemp.length;
                window.missingReqsTemp = window.missingReqsTemp.filter(function(req) {
                    return !(req.petIndex === petIndex && req.requirementId === requirement.id);
                });
                if (window.missingReqsTemp.length < initialLength) {
                    showAlert(requirement.name + ' removido del presupuesto para ' + petName, 'info');
                }
            }
        }
    }

    // Función auxiliar para verificar si un requisito aplica a una mascota específica
    function checkRequirementAppliesToPet(requirement, petSpecies) {
        if (!requirement.appliesTo || requirement.appliesTo === '' || requirement.appliesTo === 'all') {
            return true;
        }

        const speciesMap = {
            'dog': ['dog', 'dogs', 'canine', 'caninos'],
            'cat': ['cat', 'cats', 'feline', 'felinos'],
            'bird': ['bird', 'birds', 'aves', 'avian'],
            'rabbit': ['rabbit', 'rabbits', 'conejo', 'conejos'],
            'hamster': ['hamster', 'rodent', 'rodents', 'roedor', 'roedores'],
            'pig': ['pig', 'pigs', 'porcine', 'cerdo', 'cerdos'],
            'sheep': ['sheep', 'ovine', 'oveja', 'ovejas'],
            'cow': ['cow', 'cows', 'bovine', 'vaca', 'vacas'],
            'horse': ['horse', 'horses', 'equine', 'caballo', 'caballos'],
            'reptile': ['reptile', 'reptiles', 'reptil'],
            'ferret': ['ferret', 'ferrets', 'hurón', 'hurones'],
            'fish': ['fish', 'fishes', 'pez', 'peces'],
            'other': ['other', 'others', 'otro', 'otros']
        };

        const currentSpeciesVariations = speciesMap[petSpecies] || [petSpecies];
        let appliesToArray = [];

        if (Array.isArray(requirement.appliesTo)) {
            appliesToArray = requirement.appliesTo;
        } else if (typeof requirement.appliesTo === 'string') {
            appliesToArray = requirement.appliesTo.split(/[,|]/).map(item => item.trim().toLowerCase());
        }

        for (let j = 0; j < currentSpeciesVariations.length; j++) {
            const speciesVar = currentSpeciesVariations[j].toLowerCase();

            for (let k = 0; k < appliesToArray.length; k++) {
                const applies = appliesToArray[k].toLowerCase();

                if (applies === speciesVar || 
                    applies === 'all' ||
                    speciesVar === 'all' ||
                    applies.includes(speciesVar) ||
                    speciesVar.includes(applies)) {
                    return true;
                }
            }
        }

        return false;
    }

    function estimateCost(type) {
        const costs = {
            'vaccine': 50,
            'parasite_treatment': 30,
            'test': 80,
            'certificate': 100,
            'health_certificate': 120,
            'microchip': 40,
            'quarantine': 200,
            'registration': 25,
            'license': 20,
            'ownership': 15,
            'other': 40
        };
        return costs[type] || 50;
    }

    function updateBudgetDisplay() {
        const count = window.missingReqsTemp ? window.missingReqsTemp.length : 0;
        const budgetCount = document.getElementById('budgetCount');
        const budgetBtn = document.getElementById('budgetSummaryBtn');
        
        if (budgetCount) budgetCount.textContent = count;
        if (budgetBtn) {
            if (count > 0) {
                budgetBtn.style.display = 'inline-block';
            } else {
                budgetBtn.style.display = 'none';
            }
        }
        
        // Actualizar botón en navbar también
        const navbarBudgetCount = document.getElementById('navbarBudgetCount');
        const navbarBudgetBtn = document.getElementById('navbarBudgetBtn');
        
        if (navbarBudgetCount) navbarBudgetCount.textContent = count;
        if (navbarBudgetBtn) {
            if (count > 0) {
                navbarBudgetBtn.classList.remove('btn-outline-warning');
                navbarBudgetBtn.classList.add('btn-warning');
            } else {
                navbarBudgetBtn.classList.remove('btn-warning');
                navbarBudgetBtn.classList.add('btn-outline-warning');
            }
        }
    }

    function addMissingToBudget(petIndex) {
        const stateCode = document.getElementById('destinationState').value;

        // Intentar obtener datos reales del estado
        const variableName = getStateVariableName(stateCode);
        const stateData = window[variableName];

        if (!stateData || !stateData.requirements) {
            openBudgetPage(petIndex, []);
            return;
        }

        const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
        const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);
        const petSpecies = petTypeSelect ? petTypeSelect.value : '';
        const missingReqs = [];

        // Si no hay especie seleccionada, mostrar alerta
        if (!petSpecies) {
            alert('Por favor, seleccione la especie de la mascota primero');
            return;
        }

        // FILTRAR requisitos por especie antes de agregar al presupuesto
        const filteredRequirements = stateData.requirements.filter(req => {
            if (!req.appliesTo || req.appliesTo === '' || req.appliesTo === 'all') {
                return true;
            }

            const speciesMap = {
                'dog': ['dog', 'dogs', 'canine', 'caninos'],
                'cat': ['cat', 'cats', 'feline', 'felinos'],
                'bird': ['bird', 'birds', 'aves', 'avian'],
                'rabbit': ['rabbit', 'rabbits', 'conejo', 'conejos'],
                'hamster': ['hamster', 'rodent', 'rodents', 'roedor', 'roedores'],
                'pig': ['pig', 'pigs', 'porcine', 'cerdo', 'cerdos'],
                'sheep': ['sheep', 'ovine', 'oveja', 'ovejas'],
                'cow': ['cow', 'cows', 'bovine', 'vaca', 'vacas'],
                'horse': ['horse', 'horses', 'equine', 'caballo', 'caballos'],
                'reptile': ['reptile', 'reptiles', 'reptil'],
                'ferret': ['ferret', 'ferrets', 'hurón', 'hurones'],
                'fish': ['fish', 'fishes', 'pez', 'peces'],
                'other': ['other', 'others', 'otro', 'otros']
            };

            const currentSpeciesVariations = speciesMap[petSpecies] || [petSpecies];
            let appliesToArray = [];

            if (Array.isArray(req.appliesTo)) {
                appliesToArray = req.appliesTo;
            } else if (typeof req.appliesTo === 'string') {
                appliesToArray = req.appliesTo.split(/[,|]/).map(item => item.trim().toLowerCase());
            }

            for (let j = 0; j < currentSpeciesVariations.length; j++) {
                const speciesVar = currentSpeciesVariations[j].toLowerCase();

                for (let k = 0; k < appliesToArray.length; k++) {
                    const applies = appliesToArray[k].toLowerCase();

                    if (applies === speciesVar || 
                        applies === 'all' ||
                        speciesVar === 'all' ||
                        applies.includes(speciesVar) ||
                        speciesVar.includes(applies)) {
                        return true;
                    }
                }
            }

            return false;
        });

        // Agregar solo los requisitos FILTRADOS no marcados
        filteredRequirements.forEach(req => {
            const checkbox = document.getElementById('req_' + petIndex + '_' + req.id);
            if (checkbox && !checkbox.checked) {
                missingReqs.push({
                    name: req.name,
                    description: req.description,
                    type: req.type,
                    required: req.required || false,
                    estimatedCost: estimateCost(req.type),
                    petName: petName,
                    requirementId: req.id,
                    petIndex: petIndex,
                    badge: req.required ? 'OBLIGATORIO' : 'RECOMENDADO',
                    colorClass: req.required ? 'danger' : 'info',
                    appliesTo: req.appliesTo || 'all',
                    species: petSpecies
                });
            }
        });

        if (missingReqs.length > 0) {
            const ownerName = document.getElementById('ownerName');
            const ownerEmail = document.getElementById('ownerEmail');
            const pickupDate = document.getElementById('pickupDate');
            const destinationState = document.getElementById('destinationState');

            // CREAR FORMULARIO OCULTO PARA POST
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = window.contextPath + '/budget';
            form.style.display = 'none';

            // Agregar campos ocultos
            const addField = (name, value) => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = name;
                input.value = value;
                form.appendChild(input);
            };

            addField('client', ownerName ? ownerName.value : '');
            addField('pets', petName);
            addField('petType', petTypeSelect ? 
                     petTypeSelect.options[petTypeSelect.selectedIndex].text : '');
            addField('destination', destinationState ? 
                     destinationState.options[destinationState.selectedIndex].text : '');
            addField('petCount', '1');
            addField('clientEmail', ownerEmail ? ownerEmail.value : '');
            addField('travelDate', pickupDate ? pickupDate.value : '');
            addField('missingRequirements', JSON.stringify(missingReqs));
            addField('formType', 'interstate');
            addField('hasAllRequirements', 'false');
            addField('petIndex', petIndex);
            addField('budgetType', 'individual');
            addField('petSpecies', petSpecies);

            // Agregar formulario al documento y enviar
            document.body.appendChild(form);

            showAlert(missingReqs.length + ' requisitos agregados al presupuesto para ' + petName, 'info');
            form.submit();
        } else {
            showAlert('No hay requisitos faltantes para ' + petName, 'info');
        }
    }
function openBudgetPage(petIndex, missingReqs) {
    const ownerName = document.getElementById('ownerName');
    const ownerEmail = document.getElementById('ownerEmail');
    const pickupDate = document.getElementById('pickupDate');
    const destinationState = document.getElementById('destinationState');
    const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
    const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);
    const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
    const petType = petTypeSelect ? petTypeSelect.options[petTypeSelect.selectedIndex].text : '';
    
    const formData = {
        client: ownerName ? ownerName.value : '',
        pets: petName,
        petType: petType,
        destination: destinationState ? 
                     destinationState.options[destinationState.selectedIndex].text : '',
        petCount: 1, // Solo esta mascota
        clientEmail: ownerEmail ? ownerEmail.value : '',
        travelDate: pickupDate ? pickupDate.value : '',
        missingRequirements: JSON.stringify(missingReqs),
        formType: 'interstate',
        // Nuevos campos para otros servicios del presupuesto
        hasAllRequirements: missingReqs.length === 0,
        petIndex: petIndex
    };
    
    let url = window.contextPath + '/budget?';
    url += 'client=' + encodeURIComponent(formData.client);
    url += '&pets=' + encodeURIComponent(formData.pets);
    url += '&petType=' + encodeURIComponent(formData.petType);
    url += '&destination=' + encodeURIComponent(formData.destination);
    url += '&petCount=' + encodeURIComponent(formData.petCount);
    url += '&clientEmail=' + encodeURIComponent(formData.clientEmail);
    url += '&travelDate=' + encodeURIComponent(formData.travelDate);
    url += '&missingRequirements=' + encodeURIComponent(formData.missingRequirements);
    url += '&formType=' + encodeURIComponent(formData.formType);
    url += '&hasAllRequirements=' + encodeURIComponent(formData.hasAllRequirements);
    url += '&petIndex=' + encodeURIComponent(formData.petIndex);
    
    // Mostrar mensaje diferente según si hay requisitos faltantes o no
    if (missingReqs.length > 0) {
        showAlert(missingReqs.length + ' requisitos agregados al presupuesto para ' + petName + '. Redirigiendo...', 'info');
    } else {
        showAlert('Abriendo presupuesto para ' + petName + '. Puede agregar otros servicios.', 'info');
    }
    
    setTimeout(() => {
        window.location.href = url;
    }, 1500);
}
    function clearTempMissingReqs() {
        if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
            if (confirm('¿Está seguro de limpiar todos los requisitos del presupuesto temporal?')) {
                window.missingReqsTemp = [];
                updateBudgetDisplay();
                showAlert('Presupuesto temporal limpiado', 'info');
                
                // Desmarcar todos los checkboxes
                document.querySelectorAll('.requirement-checkbox').forEach(cb => {
                    cb.checked = false;
                    cb.parentElement.classList.remove('text-success');
                });
            }
        } else {
            showAlert('No hay requisitos en el presupuesto temporal', 'info');
        }
    }

    function generateRequirementsPDF(petIndex) {
        // Obtener datos de la mascota específica
        const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
        const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].type"]');
        const petBreedSelect = document.getElementById('petBreed_' + petIndex);
        const petGenderSelect = document.querySelector('[name="pets[' + petIndex + '].gender"]');
        const petAgeInput = document.querySelector('[name="pets[' + petIndex + '].age"]');
        const petWeightInput = document.querySelector('[name="pets[' + petIndex + '].weight"]');
        const petMicrochipInput = document.querySelector('[name="pets[' + petIndex + '].microchip"]');
        const petRabiesInput = document.querySelector('[name="pets[' + petIndex + '].rabiesVaccine"]');

        // Obtener datos del viaje
        const ownerState = document.getElementById('ownerState');
        const destinationState = document.getElementById('destinationState');
        const ownerCity = document.getElementById('ownerCity');
        const destinationCity = document.getElementById('destinationCity');
        const pickupDate = document.getElementById('pickupDate');
        const deliveryDate = document.getElementById('deliveryDate');
        const transportType = document.getElementById('transportType');
        const transportCompany = document.getElementById('transportCompany');

        // Obtener datos del dueño
        const ownerName = document.getElementById('ownerName');
        const ownerEmail = document.getElementById('ownerEmail');
        const ownerPhone = document.getElementById('ownerPhone');
        const ownerZipCode = document.getElementById('ownerZipCode');
        const ownerAddress = document.getElementById('ownerAddress');

        // Obtener datos del receptor
        const sameAsOwner = document.getElementById('sameAsOwner');
        const receiverName = document.getElementById('receiverName');
        const receiverEmail = document.getElementById('receiverEmail');
        const receiverPhone = document.getElementById('receiverPhone');
        const destinationAddress = document.getElementById('destinationAddress');

        // Obtener datos de la aerolínea
        const airlineOCVI = document.getElementById('airlineOCVI');
        const airlineAPHIS = document.getElementById('airlineAPHIS');

        // Crear ventana de impresión
        const printWindow = window.open('', '_blank');

        // Construir HTML manualmente con concatenación
        let html = '<!DOCTYPE html>';
        html += '<html>';
        html += '<head>';
        html += '<title>Requisitos de Transporte Interestatal - ' + (petNameInput ? petNameInput.value : 'Mascota') + '</title>';
        html += '<meta charset="UTF-8">';
        html += '<style>';
        html += 'body { font-family: Arial, sans-serif; margin: 20px; }';
        html += 'h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }';
        html += 'h2 { color: #34495e; margin-top: 20px; border-left: 4px solid #3498db; padding-left: 10px; }';
        html += '.section { margin-bottom: 25px; padding: 15px; border: 1px solid #ddd; border-radius: 5px; }';
        html += '.info-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; }';
        html += '.info-item { margin-bottom: 8px; }';
        html += '.label { font-weight: bold; color: #2c3e50; }';
        html += '.value { color: #34495e; }';
        html += '.requirements-list { margin-left: 20px; }';
        html += '.requirement-item { margin-bottom: 5px; padding: 5px; border-left: 3px solid #3498db; background: #f8f9fa; }';
        html += '.required { border-left-color: #e74c3c; background: #fdf2f2; }';
        html += '.optional { border-left-color: #f39c12; background: #fef9f3; }';
        html += '.header { background: #2c3e50; color: white; padding: 15px; border-radius: 5px; margin-bottom: 20px; }';
        html += '.footer { margin-top: 30px; padding-top: 15px; border-top: 2px solid #ddd; font-size: 12px; color: #7f8c8d; }';
        html += '.checkbox-status { display: inline-block; padding: 2px 8px; border-radius: 3px; font-size: 12px; }';
        html += '.checked { background: #27ae60; color: white; }';
        html += '.unchecked { background: #e74c3c; color: white; }';
        html += 'table { width: 100%; border-collapse: collapse; margin: 10px 0; }';
        html += 'th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }';
        html += 'th { background-color: #f2f2f2; }';
        html += '</style>';
        html += '</head>';
        html += '<body>';

        // HEADER
        html += '<div class="header">';
        html += '<h1>📋 Formulario de Transporte Interestatal</h1>';
        html += '<p>Pet Travel Docs - Documento de Requisitos</p>';
        html += '<p>Generado: ' + new Date().toLocaleDateString() + ' ' + new Date().toLocaleTimeString() + '</p>';
        html += '</div>';

        // SECCIÓN 1: INFORMACIÓN DEL VIAJE
        html += '<div class="section">';
        html += '<h2>✈️ Información del Viaje</h2>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Origen:</span>';
        html += '<span class="value">' + (ownerState ? ownerState.options[ownerState.selectedIndex].text : '') + ', ' + (ownerCity ? ownerCity.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Destino:</span>';
        html += '<span class="value">' + (destinationState ? destinationState.options[destinationState.selectedIndex].text : '') + ', ' + (destinationCity ? destinationCity.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Fecha Recolección:</span>';
        html += '<span class="value">' + (pickupDate ? pickupDate.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Fecha Entrega:</span>';
        html += '<span class="value">' + (deliveryDate ? deliveryDate.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Tipo Transporte:</span>';
        html += '<span class="value">' + (transportType ? transportType.options[transportType.selectedIndex].text : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Empresa Transporte:</span>';
        html += '<span class="value">' + (transportCompany ? transportCompany.value : 'No especificada') + '</span>';
        html += '</div>';

        html += '</div>';
        html += '</div>';

        // SECCIÓN 2: INFORMACIÓN DEL DUEÑO
        html += '<div class="section">';
        html += '<h2>👤 Información del Dueño/Remitente</h2>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Nombre:</span>';
        html += '<span class="value">' + (ownerName ? ownerName.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Email:</span>';
        html += '<span class="value">' + (ownerEmail ? ownerEmail.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Teléfono:</span>';
        html += '<span class="value">' + (ownerPhone ? ownerPhone.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Código Postal:</span>';
        html += '<span class="value">' + (ownerZipCode ? ownerZipCode.value : '') + '</span>';
        html += '</div>';

        html += '<div class="info-item" style="grid-column: span 2;">';
        html += '<span class="label">Dirección:</span>';
        html += '<span class="value">' + (ownerAddress ? ownerAddress.value : '') + '</span>';
        html += '</div>';

        html += '</div>';
        html += '</div>';

        // SECCIÓN 3: INFORMACIÓN DEL RECEPTOR
        html += '<div class="section">';
        html += '<h2>👥 Información del Receptor</h2>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Mismo que Remitente:</span>';
        html += '<span class="value">' + (sameAsOwner && sameAsOwner.checked ? 'Sí' : 'No') + '</span>';
        html += '</div>';

        html += '</div>';

        // Si el receptor es diferente
        if (!sameAsOwner || !sameAsOwner.checked) {
            html += '<div class="info-grid">';

            html += '<div class="info-item">';
            html += '<span class="label">Nombre Receptor:</span>';
            html += '<span class="value">' + (receiverName ? receiverName.value : '') + '</span>';
            html += '</div>';

            html += '<div class="info-item">';
            html += '<span class="label">Email Receptor:</span>';
            html += '<span class="value">' + (receiverEmail ? receiverEmail.value : '') + '</span>';
            html += '</div>';

            html += '<div class="info-item">';
            html += '<span class="label">Teléfono Receptor:</span>';
            html += '<span class="value">' + (receiverPhone ? receiverPhone.value : '') + '</span>';
            html += '</div>';

            html += '<div class="info-item" style="grid-column: span 2;">';
            html += '<span class="label">Dirección Destino:</span>';
            html += '<span class="value">' + (destinationAddress ? destinationAddress.value : '') + '</span>';
            html += '</div>';

            html += '</div>';
        }

        html += '</div>';

        // SECCIÓN 4: INFORMACIÓN DE LA MASCOTA
        html += '<div class="section">';
        html += '<h2>🐾 Información de la Mascota</h2>';
        html += '<table>';
        html += '<tr><th>Campo</th><th>Valor</th></tr>';

        html += '<tr>';
        html += '<td><strong>Nombre</strong></td>';
        html += '<td>' + (petNameInput ? petNameInput.value : 'No especificado') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Especie</strong></td>';
        html += '<td>' + (petTypeSelect ? petTypeSelect.options[petTypeSelect.selectedIndex].text : 'No especificada') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Raza</strong></td>';
        html += '<td>' + (petBreedSelect ? petBreedSelect.options[petBreedSelect.selectedIndex].text : 'No especificada') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Sexo</strong></td>';
        html += '<td>' + (petGenderSelect ? petGenderSelect.options[petGenderSelect.selectedIndex].text : 'No especificado') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Edad</strong></td>';
        html += '<td>' + (petAgeInput ? petAgeInput.value : 'No especificada') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Peso (lbs)</strong></td>';
        html += '<td>' + (petWeightInput ? petWeightInput.value : 'No especificado') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Microchip</strong></td>';
        html += '<td>' + (petMicrochipInput ? petMicrochipInput.value : 'No especificado') + '</td>';
        html += '</tr>';

        html += '<tr>';
        html += '<td><strong>Última Vacuna Rabia</strong></td>';
        html += '<td>' + (petRabiesInput ? petRabiesInput.value : 'No especificado') + '</td>';
        html += '</tr>';

        html += '</table>';
        html += '</div>';

        // SECCIÓN 5: REQUISITOS DEL ESTADO
        html += '<div class="section">';
        html += '<h2>📋 Requisitos del Estado Destino</h2>';

        const stateCode = document.getElementById('destinationState').value;
        if (stateCode) {
            const variableName = getStateVariableName(stateCode);
            const stateData = window[variableName];

            if (stateData && stateData.requirements) {
                html += '<div class="requirements-list">';

                stateData.requirements.forEach(function(req) {
                    const checkbox = document.getElementById('req_' + petIndex + '_' + req.id);
                    const isChecked = checkbox ? checkbox.checked : false;
                    const reqClass = req.required ? 'required' : 'optional';
                    const reqLabel = req.required ? 'OBLIGATORIO' : 'RECOMENDADO';

                    html += '<div class="requirement-item ' + reqClass + '">';
                    html += '<strong>' + req.name + '</strong> ';
                    html += '<span class="checkbox-status ' + (isChecked ? 'checked' : 'unchecked') + '">';
                    html += (isChecked ? '✓ COMPLETADO' : '✗ PENDIENTE');
                    html += '</span>';
                    html += '<div style="font-size: 12px; color: #666;">' + req.description + '</div>';
                    html += '<div style="font-size: 11px; margin-top: 3px;">';
                    html += '<strong>Tipo:</strong> ' + req.type + ' | ';
                    html += '<strong>Estado:</strong> ' + reqLabel;
                    html += '</div>';
                    html += '</div>';
                });

                html += '</div>';
            } else {
                html += '<p>No hay requisitos específicos cargados para este estado.</p>';
            }
        } else {
            html += '<p>Seleccione un estado destino para ver los requisitos.</p>';
        }

        html += '</div>';

        // SECCIÓN 6: INFORMACIÓN ADICIONAL
        html += '<div class="section">';
        html += '<h2>ℹ️ Información Adicional</h2>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Formato Aerolínea (OCVI):</span>';
        html += '<span class="value">' + (airlineOCVI && airlineOCVI.checked ? '✅ REQUERIDO' : '❌ NO requerido') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Formato Aerolínea (APHIS 7001):</span>';
        html += '<span class="value">' + (airlineAPHIS && airlineAPHIS.checked ? '✅ REQUERIDO' : '❌ NO requerido') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Total Mascotas en Formulario:</span>';
        html += '<span class="value">' + petCount + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">ID de Mascota:</span>';
        html += '<span class="value">#' + (petIndex + 1) + '</span>';
        html += '</div>';

        html += '</div>';
        html += '</div>';

        // FOOTER
        html += '<div class="footer">';
        html += '<p><strong>Nota:</strong> Este documento es una vista previa de los requisitos. Consulte con las autoridades estatales para requisitos oficiales.</p>';
        html += '<p>Documento generado por Pet Travel Docs - Formulario Interestatal</p>';
        html += '</div>';

        // SCRIPT PARA AUTO-IMPRIMIR
       html += '<script>';
        html += 'window.onload = function() {';
        html += '    setTimeout(function() {';
        html += '        window.print();';
        html += '    }, 500);';
        html += '};';
        html += '<\/script>';

        html += '</body>';
        html += '</html>';

        printWindow.document.write(html);
        printWindow.document.close();
    }

    function generateInterstatePDF() {
    // Obtener datos del viaje
        const ownerState = document.getElementById('ownerState');
        const destinationState = document.getElementById('destinationState');
        const ownerCity = document.getElementById('ownerCity');
        const destinationCity = document.getElementById('destinationCity');
        const pickupDate = document.getElementById('pickupDate');
        const deliveryDate = document.getElementById('deliveryDate');
        const transportType = document.getElementById('transportType');
        const transportCompany = document.getElementById('transportCompany');

        // Obtener datos del dueño
        const ownerName = document.getElementById('ownerName');
        const ownerEmail = document.getElementById('ownerEmail');
        const ownerPhone = document.getElementById('ownerPhone');
        const ownerZipCode = document.getElementById('ownerZipCode');
        const ownerAddress = document.getElementById('ownerAddress');

        // Obtener datos del receptor
        const sameAsOwner = document.getElementById('sameAsOwner');
        const receiverName = document.getElementById('receiverName');
        const receiverEmail = document.getElementById('receiverEmail');
        const receiverPhone = document.getElementById('receiverPhone');
        const destinationAddress = document.getElementById('destinationAddress');

        // Obtener datos de aerolínea
        const airlineOCVI = document.getElementById('airlineOCVI');
        const airlineAPHIS = document.getElementById('airlineAPHIS');

        // 🔥🔥🔥 AQUÍ VA LA DEFINICIÓN DE stateData 🔥🔥🔥
        let stateData = null;
        const stateCodeForPDF = destinationState ? destinationState.value : null;
        if (stateCodeForPDF) {
            const variableName = getStateVariableName(stateCodeForPDF);
            stateData = window[variableName];
        }

        // Obtener todas las mascotas
        const petsData = [];
        for (let i = 0; i < petCount; i++) {
            const petName = document.querySelector('[name="pets[' + i + '].name"]');
            const petType = document.querySelector('[name="pets[' + i + '].type"]');
            const petBreed = document.getElementById('petBreed_' + i);
            const petGender = document.querySelector('[name="pets[' + i + '].gender"]');
            const petAge = document.querySelector('[name="pets[' + i + '].age"]');
            const petWeight = document.querySelector('[name="pets[' + i + '].weight"]');
            const petMicrochip = document.querySelector('[name="pets[' + i + '].microchip"]');
            const petRabies = document.querySelector('[name="pets[' + i + '].rabiesVaccine"]');

            if (petName && petName.value) {
                petsData.push({
                    index: i + 1,
                    name: petName.value,
                    type: petType ? petType.options[petType.selectedIndex].text : '',
                    breed: petBreed ? petBreed.options[petBreed.selectedIndex].text : '',
                    gender: petGender ? petGender.options[petGender.selectedIndex].text : '',
                    age: petAge ? petAge.value : '',
                    weight: petWeight ? petWeight.value : '',
                    microchip: petMicrochip ? petMicrochip.value : '',
                    rabies: petRabies ? petRabies.value : ''
                });
            }
        }

        // Obtener requisitos faltantes
        const missingReqs = window.missingReqsTemp || [];
        const missingReqsByPet = {};
        missingReqs.forEach(function(req) {
            if (!missingReqsByPet[req.petName]) {
                missingReqsByPet[req.petName] = [];
            }
            missingReqsByPet[req.petName].push(req);
        });

        // Crear ventana de impresión
        const printWindow = window.open('', '_blank');

        // Construir HTML manualmente con concatenación
        let html = '<!DOCTYPE html>';
        html += '<html>';
        html += '<head>';
        html += '<title>Formulario Completo Transporte Interestatal - Pet Travel Docs</title>';
        html += '<meta charset="UTF-8">';
        html += '<style>';
        html += '@media print {';
        html += '  body { font-family: "Arial", sans-serif; margin: 15mm; font-size: 12pt; }';
        html += '  .page-break { page-break-after: always; }';
        html += '  .no-print { display: none; }';
        html += '}';
        html += 'body { font-family: Arial, sans-serif; margin: 20px; color: #333; }';
        html += 'h1 { color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 10px; }';
        html += 'h2 { color: #34495e; margin-top: 25px; border-left: 5px solid #3498db; padding-left: 15px; }';
        html += 'h3 { color: #2c3e50; margin-top: 20px; padding-bottom: 5px; border-bottom: 2px solid #eee; }';
        html += '.section { margin-bottom: 30px; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background: #fff; }';
        html += '.info-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; margin-top: 15px; }';
        html += '.info-item { margin-bottom: 12px; }';
        html += '.label { font-weight: bold; color: #2c3e50; min-width: 200px; display: inline-block; }';
        html += '.value { color: #34495e; }';
        html += '.pets-table { width: 100%; border-collapse: collapse; margin: 20px 0; }';
        html += '.pets-table th { background: #2c3e50; color: white; padding: 12px; text-align: left; }';
        html += '.pets-table td { padding: 10px; border: 1px solid #ddd; }';
        html += '.pets-table tr:nth-child(even) { background: #f9f9f9; }';
        html += '.requirements-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 15px; }';
        html += '.requirement-card { padding: 15px; border-radius: 6px; border-left: 4px solid #3498db; background: #f8f9fa; }';
        html += '.requirement-card.required { border-left-color: #e74c3c; background: #fdf2f2; }';
        html += '.requirement-card.optional { border-left-color: #f39c12; background: #fef9f3; }';
        html += '.header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 25px; border-radius: 10px; margin-bottom: 30px; }';
        html += '.footer { margin-top: 40px; padding-top: 20px; border-top: 2px solid #ddd; font-size: 11pt; color: #7f8c8d; text-align: center; }';
        html += '.status-badge { display: inline-block; padding: 4px 12px; border-radius: 20px; font-size: 11pt; font-weight: bold; margin-left: 10px; }';
        html += '.status-completed { background: #27ae60; color: white; }';
        html += '.status-pending { background: #e74c3c; color: white; }';
        html += '.summary-box { background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0; border: 2px solid #3498db; }';
        html += '.summary-item { display: flex; justify-content: space-between; margin-bottom: 10px; padding-bottom: 10px; border-bottom: 1px solid #eee; }';
        html += '.warning-box { background: #fff3cd; border: 1px solid #ffeaa7; padding: 15px; border-radius: 6px; margin: 15px 0; }';
        html += '.signature-line { margin-top: 50px; padding-top: 20px; border-top: 1px solid #333; }';
        html += '</style>';
        html += '</head>';
        html += '<body>';

        // HEADER
        html += '<div class="header">';
        html += '<h1 style="color: white; margin-bottom: 10px;">📋 FORMULARIO COMPLETO DE TRANSPORTE INTERESTATAL</h1>';
        html += '<p style="font-size: 14pt; opacity: 0.9;">Pet Travel Docs - Documento Oficial</p>';

        const now = new Date();
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        const formattedDate = now.toLocaleDateString('es-ES', options);
        const formattedTime = now.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit' });

        html += '<p style="font-size: 12pt; opacity: 0.8;">Generado: ' + formattedDate + ' ' + formattedTime + '</p>';
        html += '</div>';

        // RESUMEN EJECUTIVO
        html += '<div class="summary-box">';
        html += '<h2 style="color: #2c3e50; margin-top: 0;">📊 RESUMEN EJECUTIVO</h2>';

        html += '<div class="summary-item">';
        html += '<span class="label">Cliente:</span>';
        html += '<span class="value">' + (ownerName ? ownerName.value : 'No especificado') + '</span>';
        html += '</div>';

        html += '<div class="summary-item">';
        html += '<span class="label">Ruta:</span>';
        html += '<span class="value">' + (ownerState ? ownerState.options[ownerState.selectedIndex].text : '') + ' → ' + (destinationState ? destinationState.options[destinationState.selectedIndex].text : '') + '</span>';
        html += '</div>';

        html += '<div class="summary-item">';
        html += '<span class="label">Fecha Viaje:</span>';
        html += '<span class="value">' + (pickupDate ? pickupDate.value : '') + ' al ' + (deliveryDate ? deliveryDate.value : '') + '</span>';
        html += '</div>';

        html += '<div class="summary-item">';
        html += '<span class="label">Total Mascotas:</span>';
        html += '<span class="value">' + petsData.length + ' mascota(s)</span>';
        html += '</div>';

        html += '<div class="summary-item">';
        html += '<span class="label">Requisitos Pendientes:</span>';
        html += '<span class="value">' + missingReqs.length + ' requisito(s)</span>';
        html += '</div>';

        html += '</div>';

        // SECCIÓN 1: INFORMACIÓN DEL VIAJE
        html += '<div class="section">';
        html += '<h2>✈️ INFORMACIÓN DEL VIAJE INTERESTATAL</h2>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Estado Origen:</span>';
        html += '<span class="value">' + (ownerState ? ownerState.options[ownerState.selectedIndex].text : 'No seleccionado') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Ciudad Origen:</span>';
        html += '<span class="value">' + (ownerCity ? ownerCity.value : 'No seleccionada') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Estado Destino:</span>';
        html += '<span class="value">' + (destinationState ? destinationState.options[destinationState.selectedIndex].text : 'No seleccionado') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Ciudad Destino:</span>';
        html += '<span class="value">' + (destinationCity ? destinationCity.value : 'No seleccionada') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Fecha Recolección:</span>';
        html += '<span class="value">' + (pickupDate ? pickupDate.value : 'No especificada') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Fecha Entrega:</span>';
        html += '<span class="value">' + (deliveryDate ? deliveryDate.value : 'No especificada') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Tipo de Transporte:</span>';
        html += '<span class="value">' + (transportType ? transportType.options[transportType.selectedIndex].text : 'No seleccionado') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Empresa Transporte:</span>';
        html += '<span class="value">' + (transportCompany ? transportCompany.value : 'No especificada') + '</span>';
        html += '</div>';

        html += '</div>';
        html += '</div>';

        // SECCIÓN 2: INFORMACIÓN DEL DUEÑO/RECEPTOR
        html += '<div class="section">';
        html += '<h2>👤 INFORMACIÓN DE CONTACTO</h2>';

        html += '<h3>Dueño/Remitente</h3>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Nombre Completo:</span>';
        html += '<span class="value">' + (ownerName ? ownerName.value : 'No especificado') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Correo Electrónico:</span>';
        html += '<span class="value">' + (ownerEmail ? ownerEmail.value : 'No especificado') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Teléfono:</span>';
        html += '<span class="value">' + (ownerPhone ? ownerPhone.value : 'No especificado') + '</span>';
        html += '</div>';

        html += '<div class="info-item">';
        html += '<span class="label">Código Postal:</span>';
        html += '<span class="value">' + (ownerZipCode ? ownerZipCode.value : 'No especificado') + '</span>';
        html += '</div>';

        html += '<div class="info-item" style="grid-column: span 2;">';
        html += '<span class="label">Dirección Completa:</span>';
        html += '<span class="value">' + (ownerAddress ? ownerAddress.value : 'No especificada') + '</span>';
        html += '</div>';

        html += '</div>';

        html += '<h3>Receptor</h3>';
        html += '<div class="info-grid">';

        html += '<div class="info-item">';
        html += '<span class="label">Mismo que Remitente:</span>';
        html += '<span class="value">' + (sameAsOwner && sameAsOwner.checked ? '✅ Sí' : '❌ No') + '</span>';
        html += '</div>';

        html += '</div>';

        // Si el receptor es diferente
        if (!sameAsOwner || !sameAsOwner.checked) {
            html += '<div class="info-grid">';

            html += '<div class="info-item">';
            html += '<span class="label">Nombre del Receptor:</span>';
            html += '<span class="value">' + (receiverName ? receiverName.value : 'No especificado') + '</span>';
            html += '</div>';

            html += '<div class="info-item">';
            html += '<span class="label">Email del Receptor:</span>';
            html += '<span class="value">' + (receiverEmail ? receiverEmail.value : 'No especificado') + '</span>';
            html += '</div>';

            html += '<div class="info-item">';
            html += '<span class="label">Teléfono del Receptor:</span>';
            html += '<span class="value">' + (receiverPhone ? receiverPhone.value : 'No especificado') + '</span>';
            html += '</div>';

            html += '<div class="info-item" style="grid-column: span 2;">';
            html += '<span class="label">Dirección de Destino:</span>';
            html += '<span class="value">' + (destinationAddress ? destinationAddress.value : 'No especificada') + '</span>';
            html += '</div>';

            html += '</div>';
        }

        html += '</div>';

        // SECCIÓN 3: INFORMACIÓN DE LAS MASCOTAS
        html += '<div class="section">';
        html += '<h2>🐾 INFORMACIÓN DE LAS MASCOTAS (' + petsData.length + ')</h2>';

        if (petsData.length > 0) {
            html += '<table class="pets-table">';
            html += '<thead>';
            html += '<tr>';
            html += '<th>#</th>';
            html += '<th>Nombre</th>';
            html += '<th>Especie</th>';
            html += '<th>Raza</th>';
            html += '<th>Sexo</th>';
            html += '<th>Edad</th>';
            html += '<th>Peso (lbs)</th>';
            html += '<th>Microchip</th>';
            html += '</tr>';
            html += '</thead>';
            html += '<tbody>';

            for (let i = 0; i < petsData.length; i++) {
                const pet = petsData[i];
                html += '<tr>';
                html += '<td>' + pet.index + '</td>';
                html += '<td><strong>' + pet.name + '</strong></td>';
                html += '<td>' + pet.type + '</td>';
                html += '<td>' + pet.breed + '</td>';
                html += '<td>' + pet.gender + '</td>';
                html += '<td>' + pet.age + '</td>';
                html += '<td>' + pet.weight + '</td>';
                html += '<td>' + (pet.microchip || 'No') + '</td>';
                html += '</tr>';
            }

            html += '</tbody>';
            html += '</table>';

            html += '<h3 style="margin-top: 30px;">📋 Detalles Adicionales por Mascota</h3>';

            for (let i = 0; i < petsData.length; i++) {
                const pet = petsData[i];
                html += '<div style="margin-bottom: 20px; padding: 15px; border: 1px solid #eee; border-radius: 5px;">';
                html += '<h4 style="color: #3498db; margin-top: 0;">' + pet.index + '. ' + pet.name + '</h4>';
                html += '<div class="info-grid">';

                html += '<div class="info-item">';
                html += '<span class="label">Última Vacuna Rabia:</span>';
                html += '<span class="value">' + (pet.rabies || 'No especificada') + '</span>';
                html += '</div>';

                html += '<div class="info-item">';
                html += '<span class="label">Requisitos Pendientes:</span>';
                html += '<span class="value">';

                if (missingReqsByPet[pet.name]) {
                    html += '<span class="status-badge status-pending">' + missingReqsByPet[pet.name].length + ' pendiente(s)</span>';
                } else {
                    html += '<span class="status-badge status-completed">Completado</span>';
                }

                html += '</span>';
                html += '</div>';

                html += '</div>';
                html += '</div>';
            }
        } else {
            html += '<p class="warning-box">⚠️ No hay mascotas registradas en el formulario.</p>';
        }

        html += '</div>';

        // SECCIÓN 4: REQUISITOS DEL ESTADO POR MASCOTA (FILTRADO POR ESPECIE)
        html += '<div class="section">';
        html += '<h2>📋 REQUISITOS DEL ESTADO POR MASCOTA (FILTRADO POR ESPECIE)</h2>';

        if (stateCodeForPDF && stateData && stateData.requirements) {
            // Variables para el resumen general
            let totalAllFilteredReqs = 0;
            let checkedAllFilteredReqs = 0;

            // Para cada mascota, mostrar sus requisitos FILTRADOS
            for (let i = 0; i < petsData.length; i++) {
                const pet = petsData[i];

                // Obtener la especie REAL de esta mascota
                const petTypeSelect = document.querySelector('[name="pets[' + i + '].type"]');
                const petSpecies = petTypeSelect ? petTypeSelect.value : 'dog'; // Por defecto dog si no se encuentra

                html += '<div style="margin-bottom: 30px; padding: 15px; border: 2px solid #3498db; border-radius: 8px;">';
                html += '<h3 style="color: #2c3e50; margin-top: 0; border-bottom: 2px solid #eee; padding-bottom: 10px;">';
                html += '<i class="fas fa-paw me-2"></i> ' + pet.name + ' - Requisitos para ' + getSpeciesName(petSpecies);
                html += '</h3>';

                // ============ FILTRAR REQUISITOS POR ESPECIE ============
                const filteredRequirements = stateData.requirements.filter(req => {
                    // Si no tiene appliesTo o es 'all', mostrar para todos
                    if (!req.appliesTo || req.appliesTo === '' || req.appliesTo === 'all') {
                        return true;
                    }

                    // Mapeo de especies (igual que en el formulario)
                    const speciesMap = {
                        'dog': ['dog', 'dogs', 'canine', 'caninos'],
                        'cat': ['cat', 'cats', 'feline', 'felinos'],
                        'bird': ['bird', 'birds', 'aves', 'avian'],
                        'rabbit': ['rabbit', 'rabbits', 'conejo', 'conejos'],
                        'hamster': ['hamster', 'rodent', 'rodents', 'roedor', 'roedores'],
                        'pig': ['pig', 'pigs', 'porcine', 'cerdo', 'cerdos'],
                        'sheep': ['sheep', 'ovine', 'oveja', 'ovejas'],
                        'cow': ['cow', 'cows', 'bovine', 'vaca', 'vacas'],
                        'horse': ['horse', 'horses', 'equine', 'caballo', 'caballos'],
                        'reptile': ['reptile', 'reptiles', 'reptil'],
                        'ferret': ['ferret', 'ferrets', 'hurón', 'hurones'],
                        'fish': ['fish', 'fishes', 'pez', 'peces'],
                        'other': ['other', 'others', 'otro', 'otros']
                    };

                    const currentSpeciesVariations = speciesMap[petSpecies] || [petSpecies];
                    let appliesToArray = [];

                    if (Array.isArray(req.appliesTo)) {
                        appliesToArray = req.appliesTo;
                    } else if (typeof req.appliesTo === 'string') {
                        appliesToArray = req.appliesTo.split(/[,|]/).map(item => item.trim().toLowerCase());
                    }

                    // Verificar si coincide con alguna variación de la especie
                    for (let j = 0; j < currentSpeciesVariations.length; j++) {
                        const speciesVar = currentSpeciesVariations[j].toLowerCase();

                        for (let k = 0; k < appliesToArray.length; k++) {
                            const applies = appliesToArray[k].toLowerCase();

                            if (applies === speciesVar || 
                                applies === 'all' ||
                                speciesVar === 'all' ||
                                applies.includes(speciesVar) ||
                                speciesVar.includes(applies)) {
                                return true;
                            }
                        }
                    }

                    return false;
                });

                // Separar requisitos obligatorios y opcionales (SOLO LOS FILTRADOS)
                const requiredReqs = [];
                const optionalReqs = [];

                filteredRequirements.forEach(req => {
                    const checkbox = document.getElementById('req_' + i + '_' + req.id);
                    const isChecked = checkbox ? checkbox.checked : false;

                    if (req.required === true) {
                        requiredReqs.push({...req, checked: isChecked});
                    } else {
                        optionalReqs.push({...req, checked: isChecked});
                    }
                });

                // Actualizar contadores para el resumen general
                totalAllFilteredReqs += filteredRequirements.length;
                filteredRequirements.forEach(req => {
                    const checkbox = document.getElementById('req_' + i + '_' + req.id);
                    if (checkbox && checkbox.checked) {
                        checkedAllFilteredReqs++;
                    }
                });

                // Mostrar requisitos obligatorios FILTRADOS
                if (requiredReqs.length > 0) {
                    html += '<h4 style="color: #e74c3c; margin-top: 15px;"><i class="fas fa-exclamation-circle me-2"></i>REQUISITOS OBLIGATORIOS PARA ' + getSpeciesName(petSpecies).toUpperCase() + '</h4>';
                    html += '<div style="margin-left: 20px;">';

                    requiredReqs.forEach(req => {
                        const statusIcon = req.checked ? '✅' : '❌';
                        const statusClass = req.checked ? 'text-success' : 'text-danger';
                        const statusText = req.checked ? 'COMPLETADO' : 'PENDIENTE';

                        html += '<div style="margin-bottom: 10px; padding: 8px; border-left: 4px solid #e74c3c; background: #fdf2f2;">';
                        html += '<strong>' + statusIcon + ' ' + req.name + '</strong>';
                        html += '<span style="margin-left: 10px; padding: 2px 8px; border-radius: 3px; font-size: 10pt; font-weight: bold;" class="' + statusClass + '">' + statusText + '</span>';
                        html += '<div style="font-size: 11pt; color: #666; margin-top: 5px;">' + req.description + '</div>';

                        // Mostrar a qué especies aplica
                        if (req.appliesTo && req.appliesTo !== 'all') {
                            html += '<div style="font-size: 10pt; color: #888; margin-top: 3px;">';
                            html += '<strong>Aplica para:</strong> ';
                            if (Array.isArray(req.appliesTo)) {
                                html += req.appliesTo.map(applies => getSpeciesName(applies) || applies).join(', ');
                            } else {
                                html += req.appliesTo;
                            }
                            html += '</div>';
                        }

                        html += '</div>';
                    });

                    html += '</div>';
                }

                // Mostrar requisitos opcionales FILTRADOS
                if (optionalReqs.length > 0) {
                    html += '<h4 style="color: #f39c12; margin-top: 15px;"><i class="fas fa-check-circle me-2"></i>RECOMENDACIONES PARA ' + getSpeciesName(petSpecies).toUpperCase() + '</h4>';
                    html += '<div style="margin-left: 20px;">';

                    optionalReqs.forEach(req => {
                        const statusIcon = req.checked ? '✅' : '❓';
                        const statusClass = req.checked ? 'text-success' : 'text-warning';
                        const statusText = req.checked ? 'COMPLETADO' : 'NO COMPLETADO';

                        html += '<div style="margin-bottom: 10px; padding: 8px; border-left: 4px solid #f39c12; background: #fef9f3;">';
                        html += '<strong>' + statusIcon + ' ' + req.name + '</strong>';
                        html += '<span style="margin-left: 10px; padding: 2px 8px; border-radius: 3px; font-size: 10pt; font-weight: bold;" class="' + statusClass + '">' + statusText + '</span>';
                        html += '<div style="font-size: 11pt; color: #666; margin-top: 5px;">' + req.description + '</div>';

                        // Mostrar a qué especies aplica
                        if (req.appliesTo && req.appliesTo !== 'all') {
                            html += '<div style="font-size: 10pt; color: #888; margin-top: 3px;">';
                            html += '<strong>Aplica para:</strong> ';
                            if (Array.isArray(req.appliesTo)) {
                                html += req.appliesTo.map(applies => getSpeciesName(applies) || applies).join(', ');
                            } else {
                                html += req.appliesTo;
                            }
                            html += '</div>';
                        }

                        html += '</div>';
                    });

                    html += '</div>';
                }

                // Resumen de ESTA mascota (solo requisitos filtrados)
                const checkedFilteredReqs = filteredRequirements.filter(req => {
                    const checkbox = document.getElementById('req_' + i + '_' + req.id);
                    return checkbox ? checkbox.checked : false;
                }).length;

                html += '<div style="margin-top: 15px; padding: 10px; background: #f8f9fa; border-radius: 5px;">';
                html += '<strong>Resumen para ' + pet.name + ': </strong>';
                html += '<span class="' + (checkedFilteredReqs === filteredRequirements.length ? 'text-success' : 'text-warning') + '">';
                html += checkedFilteredReqs + ' de ' + filteredRequirements.length + ' requisitos completados';

                if (checkedFilteredReqs === filteredRequirements.length) {
                    html += ' ✅';
                } else {
                    html += ' ⚠️';
                }

                html += '</span>';
                html += '</div>';

                html += '</div>'; // Cierre del contenedor de la mascota
            }

            // Resumen general de todas las mascotas (solo requisitos filtrados)
            html += '<div style="margin-top: 20px; padding: 15px; background: #e8f4fd; border-radius: 8px; border: 2px solid #3498db;">';
            html += '<h4 style="color: #2c3e50; margin-top: 0;"><i class="fas fa-clipboard-check me-2"></i>RESUMEN GENERAL (FILTRADO POR ESPECIE)</h4>';
            html += '<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; margin-top: 10px;">';

            html += '<div style="padding: 10px; background: white; border-radius: 5px;">';
            html += '<strong>Total Mascotas:</strong><br>';
            html += '<span style="font-size: 14pt; color: #2c3e50;">' + petsData.length + '</span>';
            html += '</div>';

            html += '<div style="padding: 10px; background: white; border-radius: 5px;">';
            html += '<strong>Total Requisitos (filtrados):</strong><br>';
            html += '<span style="font-size: 14pt; color: #2c3e50;">' + totalAllFilteredReqs + '</span>';
            html += '</div>';

            html += '<div style="padding: 10px; background: white; border-radius: 5px;">';
            html += '<strong>Completados:</strong><br>';
            html += '<span style="font-size: 14pt; color: ' + (checkedAllFilteredReqs === totalAllFilteredReqs ? '#27ae60' : '#f39c12') + ';">';
            html += checkedAllFilteredReqs + ' (' + (totalAllFilteredReqs > 0 ? Math.round((checkedAllFilteredReqs / totalAllFilteredReqs) * 100) : 0) + '%)';
            html += '</span>';
            html += '</div>';

            html += '<div style="padding: 10px; background: white; border-radius: 5px;">';
            html += '<strong>Pendientes:</strong><br>';
            html += '<span style="font-size: 14pt; color: ' + (totalAllFilteredReqs - checkedAllFilteredReqs === 0 ? '#27ae60' : '#e74c3c') + ';">';
            html += (totalAllFilteredReqs - checkedAllFilteredReqs);
            html += '</span>';
            html += '</div>';

            html += '</div>'; // Cierre grid

            if (totalAllFilteredReqs - checkedAllFilteredReqs > 0) {
                html += '<div style="margin-top: 15px; padding: 10px; background: #fff3cd; border: 1px solid #ffeaa7; border-radius: 5px;">';
                html += '<i class="fas fa-exclamation-triangle me-2"></i>';
                html += '<strong>Atención:</strong> ' + (totalAllFilteredReqs - checkedAllFilteredReqs) + ' requisitos están pendientes. Complete los requisitos faltantes antes del viaje.';
                html += '</div>';
            } else if (totalAllFilteredReqs > 0) {
                html += '<div style="margin-top: 15px; padding: 10px; background: #d4edda; border: 1px solid #c3e6cb; border-radius: 5px;">';
                html += '<i class="fas fa-check-circle me-2"></i>';
                html += '<strong>¡Todo listo!</strong> Todos los requisitos están completados para todas las mascotas.';
                html += '</div>';
            }

            html += '</div>'; // Cierre del resumen general

        } else {
            html += '<p>No hay requisitos específicos cargados para este estado.</p>';
        }

        html += '</div>';
        // 🔥 NUEVA SECCIÓN: Detalles de Requisitos Completados
        const requirementDetails = getRequirementDetailsForPDF();
        if (Object.keys(requirementDetails).length > 0) {
            html += '<div class="section">';
            html += '<h2>📝 DETALLES DE REQUISITOS CUMPLIDOS</h2>';

            for (const petIndex in requirementDetails) {
                const petReqs = requirementDetails[petIndex];
                const petNameInput = document.querySelector('[name="pets[' + petIndex + '].name"]');
                const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);

                html += '<h3 style="color: #27ae60; margin-top: 20px;">';
                html += '<i class="fas fa-check-circle me-2"></i>' + petName;
                html += '</h3>';

                for (const reqId in petReqs) {
                    const req = petReqs[reqId];
                    html += '<div style="margin-bottom: 15px; padding: 10px; border-left: 4px solid #27ae60; background: #f8f9fa;">';
                    html += '<strong>' + req.name + '</strong>';
                    html += '<div style="margin-top: 10px; font-size: 11pt;">';

                    for (const fieldName in req.details) {
                        html += '<div><strong>' + fieldName + ':</strong> ' + req.details[fieldName] + '</div>';
                    }

                    html += '</div>';
                    html += '</div>';
                }
            }

            html += '</div>';
        }
        // SECCIÓN 4.5: INFORMACIÓN DE FORMATOS AEROLÍNEA
        html += '<div class="section">';
        html += '<h2>✈️ INFORMACIÓN DE FORMATOS AEROLÍNEA</h2>';

        html += '<div style="margin-top: 15px; padding: 15px; background: #f8f9fa; border-radius: 8px;">';
        html += '<h4 style="color: #2c3e50; margin-top: 0;"><i class="fas fa-plane me-2"></i>FORMATOS SELECCIONADOS</h4>';

        html += '<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; margin-top: 10px;">';

        html += '<div style="padding: 12px; background: white; border-radius: 6px; border: 2px solid ' + (airlineOCVI && airlineOCVI.checked ? '#27ae60' : '#e0e0e0') + ';">';
        html += '<div style="font-weight: bold; margin-bottom: 5px;">Formato OCVI</div>';
        html += '<div style="font-size: 14pt; color: ' + (airlineOCVI && airlineOCVI.checked ? '#27ae60' : '#95a5a6') + ';">';
        html += (airlineOCVI && airlineOCVI.checked ? '✅ REQUERIDO' : '❌ No requerido');
        html += '</div>';
        html += '<div style="font-size: 10pt; color: #666; margin-top: 5px;">Certificado Oficial de Inspección Veterinaria</div>';
        html += '</div>';

        html += '<div style="padding: 12px; background: white; border-radius: 6px; border: 2px solid ' + (airlineAPHIS && airlineAPHIS.checked ? '#27ae60' : '#e0e0e0') + ';">';
        html += '<div style="font-weight: bold; margin-bottom: 5px;">Formato APHIS 7001</div>';
        html += '<div style="font-size: 14pt; color: ' + (airlineAPHIS && airlineAPHIS.checked ? '#27ae60' : '#95a5a6') + ';">';
        html += (airlineAPHIS && airlineAPHIS.checked ? '✅ REQUERIDO' : '❌ No requerido');
        html += '</div>';
        html += '<div style="font-size: 10pt; color: #666; margin-top: 5px;">USDA APHIS Form 7001</div>';
        html += '</div>';

        html += '</div>'; // Cierre del grid

        // 🔥 CAMBIADO: Usa stateData que ya definimos al inicio
        if (stateData && stateData.airlineModelRequirements) {
            const prefersOCVI = stateData.airlineModelRequirements.includes("OCVI");
            const prefersAPHIS = stateData.airlineModelRequirements.includes("APHIS 7001");

            if (prefersOCVI && !prefersAPHIS) {
                html += '<div style="margin-top: 15px; padding: 12px; background: #d1ecf1; border: 1px solid #bee5eb; border-radius: 6px;">';
                html += '<i class="fas fa-info-circle me-2" style="color: #0c5460;"></i>';
                html += '<strong style="color: #0c5460;">Nota importante del estado:</strong>';
                html += '<div style="margin-top: 5px; color: #0c5460;">';
                html += 'Este estado <strong>solo acepta formato OCVI</strong>. El formato APHIS 7001 <strong>NO es válido</strong> para entrada a ' + (stateData.stateName || (destinationState ? destinationState.options[destinationState.selectedIndex].text : 'el estado destino')) + '.';
                html += '</div>';
                html += '</div>';
            } else if (!prefersOCVI && prefersAPHIS) {
                html += '<div style="margin-top: 15px; padding: 12px; background: #d1ecf1; border: 1px solid #bee5eb; border-radius: 6px;">';
                html += '<i class="fas fa-info-circle me-2" style="color: #0c5460;"></i>';
                html += '<strong style="color: #0c5460;">Nota importante del estado:</strong>';
                html += '<div style="margin-top: 5px; color: #0c5460;">';
                html += 'Este estado <strong>solo acepta formato APHIS 7001</strong>. El formato OCVI <strong>NO es válido</strong> para entrada a ' + (stateData.stateName || (destinationState ? destinationState.options[destinationState.selectedIndex].text : 'el estado destino')) + '.';
                html += '</div>';
                html += '</div>';
            } else if (prefersOCVI && prefersAPHIS) {
                html += '<div style="margin-top: 15px; padding: 12px; background: #d4edda; border: 1px solid #c3e6cb; border-radius: 6px;">';
                html += '<i class="fas fa-check-circle me-2" style="color: #155724;"></i>';
                html += '<strong style="color: #155724;">Flexibilidad de formatos:</strong>';
                html += '<div style="margin-top: 5px; color: #155724;">';
                html += 'Este estado acepta <strong>ambos formatos (OCVI y APHIS 7001)</strong>. Use el que su aerolínea prefiera.';
                html += '</div>';
                html += '</div>';
            }
        }

        // Verificar consistencia entre selección del usuario y requerimientos del estado
        if (airlineOCVI && airlineOCVI.checked && stateData && stateData.airlineModelRequirements) {
            if (!stateData.airlineModelRequirements.includes("OCVI")) {
                html += '<div style="margin-top: 15px; padding: 12px; background: #f8d7da; border: 1px solid #f5c6cb; border-radius: 6px;">';
                html += '<i class="fas fa-exclamation-triangle me-2" style="color: #721c24;"></i>';
                html += '<strong style="color: #721c24;">⚠️ ALERTA DE INCOMPATIBILIDAD:</strong>';
                html += '<div style="margin-top: 5px; color: #721c24;">';
                html += 'Ha seleccionado formato OCVI, pero el estado de destino <strong>NO acepta este formato</strong>.';
                html += ' Por favor, verifique los requerimientos del estado.';
                html += '</div>';
                html += '</div>';
            }
        }

        if (airlineAPHIS && airlineAPHIS.checked && stateData && stateData.airlineModelRequirements) {
            if (!stateData.airlineModelRequirements.includes("APHIS 7001")) {
                html += '<div style="margin-top: 15px; padding: 12px; background: #f8d7da; border: 1px solid #f5c6cb; border-radius: 6px;">';
                html += '<i class="fas fa-exclamation-triangle me-2" style="color: #721c24;"></i>';
                html += '<strong style="color: #721c24;">⚠️ ALERTA DE INCOMPATIBILIDAD:</strong>';
                html += '<div style="margin-top: 5px; color: #721c24;">';
                html += 'Ha seleccionado formato APHIS 7001, pero el estado de destino <strong>NO acepta este formato</strong>.';
                html += ' Por favor, verifique los requerimientos del estado.';
                html += '</div>';
                html += '</div>';
            }
        }

        html += '</div>'; // Cierre del contenedor de información
        html += '</div>'; // Cierre de la sección

        // SECCIÓN 5: RESUMEN DEL ESTADO DESTINO
        if (destinationState && destinationState.value) {
            html += '<div class="section">';
            html += '<h2>🏛️ INFORMACIÓN DEL ESTADO DESTINO</h2>';
            html += '<div class="info-grid">';

            html += '<div class="info-item">';
            html += '<span class="label">Estado:</span>';
            html += '<span class="value">' + destinationState.options[destinationState.selectedIndex].text + '</span>';
            html += '</div>';

            // 🔥 CAMBIADO: Usa stateData que ya definimos al inicio, NO lo declares de nuevo
            html += '<div class="info-item">';
            html += '<span class="label">Firma Digital Aceptada:</span>';
            html += '<span class="value">' + (stateData && stateData.acceptsDigitalSignature ? '✅ Sí' : '❌ No') + '</span>';
            html += '</div>';

            html += '<div class="info-item">';
            html += '<span class="label">Tiempo de Trámite:</span>';
            html += '<span class="value">' + (stateData && stateData.daysBeforeTravelForForm ? stateData.daysBeforeTravelForForm + ' días antes' : '10 días antes') + '</span>';
            html += '</div>';

            html += '<div class="info-item">';
            html += '<span class="label">Formato Requerido:</span>';
            html += '<span class="value">';

            if (stateData && stateData.airlineModelRequirements) {
                html += stateData.airlineModelRequirements.join(' o ');
            } else {
                html += 'OCVI/APHIS 7001';
            }

            html += '</span>';
            html += '</div>';

            html += '</div>';
            html += '</div>';
        }

        // SECCIÓN 6: FIRMAS Y AUTORIZACIONES
        html += '<div class="section">';
        html += '<h2>🖋️ FIRMAS Y AUTORIZACIONES</h2>';
        html += '<div style="margin-top: 30px;">';

        html += '<div class="signature-line">';
        html += '<p><strong>Firma del Dueño/Remitente:</strong></p>';
        html += '<p style="height: 50px; margin-top: 30px;">_________________________________________</p>';
        html += '<p>Nombre: ' + (ownerName ? ownerName.value : '') + '</p>';
        html += '<p>Fecha: ___________________________</p>';
        html += '</div>';

        html += '<div class="signature-line" style="margin-top: 50px;">';
        html += '<p><strong>Firma del Receptor (si aplica):</strong></p>';
        html += '<p style="height: 50px; margin-top: 30px;">_________________________________________</p>';

        let receiverDisplayName = '';
        if ((!sameAsOwner || !sameAsOwner.checked) && receiverName) {
            receiverDisplayName = receiverName.value;
        } else if (ownerName) {
            receiverDisplayName = ownerName.value;
        }

        html += '<p>Nombre: ' + receiverDisplayName + '</p>';
        html += '<p>Fecha: ___________________________</p>';
        html += '</div>';

        html += '</div>';
        html += '</div>';

        // PIE DE PÁGINA
        html += '<div class="footer">';
        html += '<p><strong>PET TRAVEL DOCS - FORMULARIO INTERESTATAL</strong></p>';
        html += '<p>Este documento es una vista previa del formulario de transporte interestatal.</p>';
        html += '<p>Para documentos oficiales, contacte con las autoridades estatales correspondientes.</p>';
        html += '<p>Documento ID: ' + Date.now() + ' | ' + petsData.length + ' mascota(s) | ' + missingReqs.length + ' requisito(s) pendiente(s)</p>';
        html += '</div>';

        printWindow.document.write(html);
        printWindow.document.close();

        // Auto-imprimir después de cargar
        setTimeout(function() {
            printWindow.print();
        }, 500);
    }

    function generateTotalBudget() {
        if (petCount === 0) {
            alert('Debe agregar al menos una mascota para generar un presupuesto');
            return;
        }

        const allPetsData = [];
        let totalGeneral = 0;
        const allMissingReqs = [];

        // Para cada mascota
        for (let i = 0; i < petCount; i++) {
            const petNameInput = document.querySelector('[name="pets[' + i + '].name"]');
            const petTypeSelect = document.querySelector('[name="pets[' + i + '].type"]');
            const petBreedSelect = document.getElementById('petBreed_' + i);
            const petGenderSelect = document.querySelector('[name="pets[' + i + '].gender"]');

            if (petNameInput && petNameInput.value.trim()) {
                const petName = petNameInput.value.trim();
                const petSpecies = petTypeSelect ? petTypeSelect.value : '';
                let subtotalMascota = 75; // Costo base por mascota
                const requisitosMascota = [];

                // 1. Buscar requisitos de missingReqsTemp para ESTA mascota
                if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
                    for (let j = 0; j < window.missingReqsTemp.length; j++) {
                        const req = window.missingReqsTemp[j];
                        if (req.petIndex === i.toString() || req.petName === petName) {
                            requisitosMascota.push(req);
                            subtotalMascota += req.estimatedCost;
                            allMissingReqs.push(req);
                        }
                    }
                }

                // 2. Verificar los requisitos del estado para ESTA mascota (FILTRADO POR ESPECIE)
                const stateCode = document.getElementById('destinationState').value;
                if (stateCode && petSpecies) {
                    const variableName = getStateVariableName(stateCode);
                    const stateData = window[variableName];

                    if (stateData && stateData.requirements) {
                        // FILTRAR requisitos por especie
                        const filteredRequirements = stateData.requirements.filter(req => {
                            if (!req.appliesTo || req.appliesTo === '' || req.appliesTo === 'all') {
                                return true;
                            }

                            const speciesMap = {
                                'dog': ['dog', 'dogs', 'canine', 'caninos'],
                                'cat': ['cat', 'cats', 'feline', 'felinos'],
                                'bird': ['bird', 'birds', 'aves', 'avian'],
                                'rabbit': ['rabbit', 'rabbits', 'conejo', 'conejos'],
                                'hamster': ['hamster', 'rodent', 'rodents', 'roedor', 'roedores'],
                                'pig': ['pig', 'pigs', 'porcine', 'cerdo', 'cerdos'],
                                'sheep': ['sheep', 'ovine', 'oveja', 'ovejas'],
                                'cow': ['cow', 'cows', 'bovine', 'vaca', 'vacas'],
                                'horse': ['horse', 'horses', 'equine', 'caballo', 'caballos'],
                                'reptile': ['reptile', 'reptiles', 'reptil'],
                                'ferret': ['ferret', 'ferrets', 'hurón', 'hurones'],
                                'fish': ['fish', 'fishes', 'pez', 'peces'],
                                'other': ['other', 'others', 'otro', 'otros']
                            };

                            const currentSpeciesVariations = speciesMap[petSpecies] || [petSpecies];
                            let appliesToArray = [];

                            if (Array.isArray(req.appliesTo)) {
                                appliesToArray = req.appliesTo;
                            } else if (typeof req.appliesTo === 'string') {
                                appliesToArray = req.appliesTo.split(/[,|]/).map(item => item.trim().toLowerCase());
                            }

                            for (let j = 0; j < currentSpeciesVariations.length; j++) {
                                const speciesVar = currentSpeciesVariations[j].toLowerCase();

                                for (let k = 0; k < appliesToArray.length; k++) {
                                    const applies = appliesToArray[k].toLowerCase();

                                    if (applies === speciesVar || 
                                        applies === 'all' ||
                                        speciesVar === 'all' ||
                                        applies.includes(speciesVar) ||
                                        speciesVar.includes(applies)) {
                                        return true;
                                    }
                                }
                            }

                            return false;
                        });

                        // Agregar solo los requisitos FILTRADOS no marcados
                        filteredRequirements.forEach(req => {
                            const checkbox = document.getElementById('req_' + i + '_' + req.id);

                            // Verificar si ya está en requisitosMascota
                            let alreadyExists = false;
                            for (let k = 0; k < requisitosMascota.length; k++) {
                                const existingReq = requisitosMascota[k];
                                if (existingReq.requirementId === req.id) {
                                    alreadyExists = true;
                                    break;
                                }
                            }

                            // Si NO existe y NO está marcado, agregarlo
                            if (!alreadyExists && (!checkbox || !checkbox.checked)) {
                                const newReq = {
                                    name: req.name,
                                    description: req.description,
                                    type: req.type,
                                    estimatedCost: estimateCost(req.type),
                                    petName: petName,
                                    petIndex: i.toString(),
                                    requirementId: req.id,
                                    required: req.required || false,
                                    badge: req.required ? 'OBLIGATORIO' : 'RECOMENDADO',
                                    colorClass: req.required ? 'danger' : 'info',
                                    addedAutomatically: true,
                                    appliesTo: req.appliesTo || 'all',
                                    species: petSpecies
                                };

                                requisitosMascota.push(newReq);
                                subtotalMascota += newReq.estimatedCost;
                                allMissingReqs.push(newReq);
                            }
                        });
                    }
                }

                totalGeneral += subtotalMascota;

                // Guardar datos de la mascota
                allPetsData.push({
                    nombre: petName,
                    tipo: petTypeSelect ? petTypeSelect.options[petTypeSelect.selectedIndex].text : 'No especificada',
                    raza: petBreedSelect ? petBreedSelect.options[petBreedSelect.selectedIndex].text : 'No especificada',
                    sexo: petGenderSelect ? petGenderSelect.options[petGenderSelect.selectedIndex].text : 'No especificado',
                    subtotal: subtotalMascota,
                    costoBase: 75,
                    requisitos: requisitosMascota,
                    cantidadRequisitos: requisitosMascota.length,
                    cantidadObligatorios: requisitosMascota.filter(r => r.required === true).length,
                    cantidadRecomendados: requisitosMascota.filter(r => r.required !== true).length,
                    index: i,
                    especie: petSpecies
                });
            }
        }

        // Obtener datos del formulario
        const ownerName = document.getElementById('ownerName');
        const ownerEmail = document.getElementById('ownerEmail');
        const pickupDate = document.getElementById('pickupDate');
        const destinationState = document.getElementById('destinationState');

        // CREAR FORMULARIO OCULTO PARA POST (NO GET)
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = window.contextPath + '/budget';
        form.style.display = 'none';

        // Agregar todos los campos como inputs ocultos
        function addHiddenField(name, value) {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = value;
            form.appendChild(input);
        }

        addHiddenField('client', ownerName ? ownerName.value : '');
        addHiddenField('clientEmail', ownerEmail ? ownerEmail.value : '');
        addHiddenField('pets', allPetsData.map(p => p.nombre).join(', '));
        addHiddenField('petType', 'Varias especies');
        addHiddenField('destination', destinationState ? destinationState.options[destinationState.selectedIndex].text : '');
        addHiddenField('petCount', allPetsData.length.toString());
        addHiddenField('travelDate', pickupDate ? pickupDate.value : '');
        addHiddenField('formType', 'interstate');
        addHiddenField('budgetType', 'total');
        addHiddenField('hasAllRequirements', allMissingReqs.length === 0 ? 'true' : 'false');
        addHiddenField('missingRequirements', JSON.stringify(allMissingReqs));
        addHiddenField('allPetsData', JSON.stringify(allPetsData));
        addHiddenField('totalGeneral', totalGeneral.toString());

        // Agregar formulario al documento y enviar
        document.body.appendChild(form);

        // Mostrar mensaje
        showAlert('Generando presupuesto total para ' + allPetsData.length + ' mascota(s). Total: $' + totalGeneral, 'info');

        // Enviar formulario
        form.submit();
    }
    
    function addBudgetButtonToNavbar() {
        const navbar = document.querySelector('.navbar .container');
        if (navbar) {
            const existingBudgetBtn = document.getElementById('navbarBudgetBtn');
            if (!existingBudgetBtn) {
                const budgetBtn = document.createElement('button');
                budgetBtn.type = 'button';
                budgetBtn.className = 'btn btn-outline-warning btn-sm ms-2';
                budgetBtn.id = 'navbarBudgetBtn';
                budgetBtn.innerHTML = '<i class="fas fa-calculator me-1"></i> <span id="navbarBudgetCount">0</span>';
                budgetBtn.title = 'Ver presupuesto de requisitos faltantes';
                budgetBtn.onclick = function() {
                    redirectToBudget();
                };
                
                navbar.appendChild(budgetBtn);
                
                // Actualizar contador cada segundo
                setInterval(updateBudgetDisplay, 1000);
            }
        }
    }

    function redirectToBudget() {
    
    const clientName = document.getElementById('ownerName') ? document.getElementById('ownerName').value : '';
    const clientEmail = document.getElementById('ownerEmail') ? document.getElementById('ownerEmail').value : '';
    const pickupDate = document.getElementById('pickupDate') ? document.getElementById('pickupDate').value : '';
    const destinationState = document.getElementById('destinationState');

    // MODIFICAR: Obtener todas las mascotas, no solo las de missingReqsTemp
    const petsMap = {};
    // Primero, de las mascotas con missingReqs
    if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
        for (let i = 0; i < window.missingReqsTemp.length; i++) {
            const req = window.missingReqsTemp[i];
            if (!petsMap[req.petName]) {
                petsMap[req.petName] = true;
            }
        }
    }
    
    // Si no hay missingReqs, obtener las mascotas del formulario
    if (Object.keys(petsMap).length === 0) {
        for (let i = 0; i < petCount; i++) {
            const petNameInput = document.querySelector('[name="pets[' + i + '].name"]');
            if (petNameInput && petNameInput.value.trim()) {
                petsMap[petNameInput.value.trim()] = true;
            }
        }
    }
    
    const petsList = Object.keys(petsMap).join(', ') || 'Mascotas varias';

    const formData = {
        client: clientName,
        pets: petsList,
        petType: 'Varias especies',
        destination: destinationState ? destinationState.options[destinationState.selectedIndex].text : '',
        petCount: Object.keys(petsMap).length > 0 ? Object.keys(petsMap).length.toString() : '1',
        clientEmail: clientEmail,
        travelDate: pickupDate,
        missingRequirements: window.missingReqsTemp ? JSON.stringify(window.missingReqsTemp) : '[]',
        formType: 'interstate',
        hasAllRequirements: !window.missingReqsTemp || window.missingReqsTemp.length === 0
    };

    let url = window.contextPath + '/budget?';
    url += 'client=' + encodeURIComponent(formData.client);
    url += '&pets=' + encodeURIComponent(formData.pets);
    url += '&petType=' + encodeURIComponent(formData.petType);
    url += '&destination=' + encodeURIComponent(formData.destination);
    url += '&petCount=' + encodeURIComponent(formData.petCount);
    url += '&clientEmail=' + encodeURIComponent(formData.clientEmail);
    url += '&travelDate=' + encodeURIComponent(formData.travelDate);
    url += '&missingRequirements=' + encodeURIComponent(formData.missingRequirements);
    url += '&formType=' + encodeURIComponent(formData.formType);
    url += '&hasAllRequirements=' + encodeURIComponent(formData.hasAllRequirements);

    // Mostrar mensaje apropiado
    if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
        showAlert('Abriendo presupuesto con ' + window.missingReqsTemp.length + ' requisitos pendientes', 'info');
    } else {
        showAlert('Abriendo presupuesto. Puede agregar servicios adicionales.', 'info');
    }
    
    setTimeout(() => {
        window.location.href = url;
    }, 1000);
}

    function showAlert(message, type) {
        const alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-' + type + ' alert-dismissible fade show position-fixed';
        alertDiv.style.cssText = 'top: 20px; right: 20px; z-index: 9999; max-width: 400px;';
        const icon = type === 'warning' ? '⚠️ ' : 'ℹ️ ';
        alertDiv.innerHTML = '<strong>' + icon + '</strong> ' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert"></button>';
        document.body.appendChild(alertDiv);
        setTimeout(() => {
            if (alertDiv.parentNode) alertDiv.remove();
        }, 5000);
    }

    document.addEventListener('DOMContentLoaded', function() {
        // Configurar fechas mínimas
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('pickupDate').min = today;
        document.getElementById('deliveryDate').min = today;
        
        // Inicializar tarjetas en blanco
        clearStateCards();
        
        // Agregar primera mascota
        addPetSection();
        
        // Agregar botón de presupuesto al navbar
        addBudgetButtonToNavbar();
               
        // Event listener para el select de estado
        const destinationState = document.getElementById('destinationState');
        if (destinationState) {
            destinationState.addEventListener('change', function() {
                // Actualizar ciudades
                updateDestinationCities();
                
                setTimeout(() => {        
                    // Actualizar información del estado
                    updateStateInfo();                
                    // Actualizar requerimientos solo para mascotas que ya tienen nombre
                    for (let i = 0; i < petCount; i++) {
                        const petNameInput = document.querySelector('[name="pets[' + i + '].name"]');
                        const petName = petNameInput ? petNameInput.value.trim() : '';

                        if (petName) {
                            updatePetRequirements(i);
                        }
                    }
                }, 100);
            });
        }
        
        // Event listener para el formulario
        const interstateForm = document.getElementById('interstateForm');
        if (interstateForm) {
            interstateForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Validar formulario
                let isValid = true;
                const requiredFields = ['ownerName', 'ownerEmail', 'ownerPhone', 'ownerState', 'destinationState', 
                                       'pickupDate', 'deliveryDate', 'transportType'];
                
                requiredFields.forEach(fieldId => {
                    const field = document.getElementById(fieldId);
                    if (field && !field.value.trim()) {
                        isValid = false;
                        field.classList.add('is-invalid');
                    } else if (field) {
                        field.classList.remove('is-invalid');
                    }
                });
                
                // Validar fechas
                const pickupDate = document.getElementById('pickupDate').value;
                const deliveryDate = document.getElementById('deliveryDate').value;
                if (pickupDate && deliveryDate) {
                    const pickup = new Date(pickupDate);
                    const delivery = new Date(deliveryDate);
                    if (delivery <= pickup) {
                        isValid = false;
                        alert('La fecha de entrega debe ser posterior a la fecha de recolección');
                    }
                }
                
                // Validar al menos una mascota
                if (petCount === 0) {
                    isValid = false;
                    alert('Debe agregar al menos una mascota');
                }              
                
                if (isValid) {
                    const submitBtn = document.getElementById('submitBtn');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i> Procesando...';
                    submitBtn.disabled = true;
                    
                    setTimeout(() => {
                        showAlert('Formulario enviado exitosamente', 'success');
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;
                        // this.submit(); // Descomentar para enviar realmente
                    }, 2000);
                }
            });
        }
        
        // Inicializar contador de presupuesto
        updateBudgetDisplay();
    });
</script>
    </body>
</html>