<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Mascota - Pet Travel Docs</title>
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
        body.modal-open {
            overflow: hidden !important;
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
        .main-container {
            min-height: calc(100vh - 76px);
            display: flex;
            flex-direction: column;
            padding: 0;
            width: 100%;
        }
        .form-container-wrapper {
            flex: 1;
            overflow-y: auto;
            overflow-x: hidden;
            padding: 10px 0;
            width: 100%;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            padding: 30px;
            margin: 0 auto 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            width: 95%;
            max-width: none;
            position: relative;
            z-index: 1;
        }
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999 !important;
            overflow: hidden;
            outline: 0;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal.show {
            display: block !important;
            opacity: 1 !important;
            visibility: visible !important;
        }
        .modal-dialog {
            position: relative;
            width: auto;
            margin: 10px;
            pointer-events: none;
            z-index: 10000 !important;
            max-width: 800px;
        }
        .modal.fade .modal-dialog {
            transition: transform .3s ease-out;
            transform: translate(0, -50px);
        }
        .modal.show .modal-dialog {
            transform: none;
        }
        .modal-content {
            position: relative;
            display: flex;
            flex-direction: column;
            width: 100%;
            pointer-events: auto;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid rgba(0, 0, 0, .2);
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3) !important;
            outline: 0;
            z-index: 10001 !important;
        }
        .modal-header {
            display: flex;
            flex-shrink: 0;
            align-items: center;
            justify-content: space-between;
            padding: 1rem 1.5rem;
            border-bottom: 1px solid #dee2e6;
            border-top-left-radius: calc(15px - 1px);
            border-top-right-radius: calc(15px - 1px);
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
        }
        .modal-header .btn-close {
            padding: 0.5rem;
            margin: -0.5rem -0.5rem -0.5rem auto;
            background: transparent;
            border: 0;
            filter: brightness(0) invert(1);
            opacity: 0.8;
        }
        .modal-header .btn-close:hover {
            opacity: 1;
        }
        .modal-body {
            position: relative;
            flex: 1 1 auto;
            padding: 1.5rem;
            max-height: 70vh;
            overflow-y: auto;
        }
        .modal-footer {
            display: flex;
            flex-wrap: wrap;
            flex-shrink: 0;
            align-items: center;
            justify-content: flex-end;
            padding: 1rem 1.5rem;
            border-top: 1px solid #dee2e6;
            border-bottom-right-radius: calc(15px - 1px);
            border-bottom-left-radius: calc(15px - 1px);
        }
        .modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9998 !important;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.5) !important;
        }
        .modal-backdrop.show {
            opacity: 1 !important;
            display: block !important;
        }
        body.modal-open {
            overflow: hidden;
            padding-right: 17px;
        }
        .modal-dialog-centered {
            display: flex;
            align-items: center;
            min-height: calc(100% - 20px);
        }
        .modal-dialog-centered::before {
            display: block;
            height: calc(100vh - 20px);
            content: "";
        }
        .form-container-wrapper::-webkit-scrollbar {
            width: 8px;
        }
        .form-container-wrapper::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }
        .form-container-wrapper::-webkit-scrollbar-thumb {
            background: #667eea;
            border-radius: 10px;
        }
        .form-container-wrapper::-webkit-scrollbar-thumb:hover {
            background: #5a67d8;
        }
        .form-title {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 2rem;
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
            font-size: 1rem;
        }
        .form-section {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid #e9ecef;
            transition: all 0.3s ease;
        }
        .form-section:hover {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transform: translateY(-1px);
        }
        .row.mb-3 {
            margin-bottom: 1rem !important;
        }
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 0.9rem;
        }
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
        textarea.form-control {
            min-height: 70px;
            resize: vertical;
        }
        .required-field::after {
            content: " *";
            color: #dc3545;
        }
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
        .btn-secondary-custom {
            background: #6c757d;
            border: none;
            border-radius: 10px;
            padding: 10px 30px;
            font-size: 1rem;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-secondary-custom:hover {
            background: #5a6268;
            transform: translateY(-2px);
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
        .info-box {
            background: linear-gradient(135deg, #e8f4fd 0%, #f0f8ff 100%);
            border-left: 5px solid #2196F3;
            padding: 15px;
            border-radius: 10px;
            margin-top: 15px;
            animation: fadeIn 0.5s ease;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 10px;
        }
        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            border-radius: 4px;
            cursor: pointer;
        }
        .checkbox-group label {
            margin-bottom: 0;
            cursor: pointer;
            font-weight: 500;
            font-size: 0.9rem;
        }
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
            margin-bottom: 10px;
        }
        .character-count {
            font-size: 0.75rem;
            color: #6c757d;
            text-align: right;
            margin-top: 3px;
        }
        .return-error {
            border-color: #dc3545 !important;
            background-color: rgba(220, 53, 69, 0.05);
        }
        .return-valid {
            border-color: #198754 !important;
            background-color: rgba(25, 135, 84, 0.05);
        }
        .requirements-checklist {
            list-style: none;
            padding-left: 0;
            margin-top: 10px;
        }
        .requirement-item {
            margin-bottom: 8px;
            padding: 6px 10px;         
            border-radius: 6px;
            border-left: 3px solid #43e97b;
            display: block;
            animation: fadeIn 0.5s ease;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            background-color: rgba(248, 249, 250, 0.5);
        }
        .requirement-item .form-check {
            display: flex;
            align-items: center;
        }
        .requirement-item .form-check-input {
            margin-right: 8px;
            width: 16px;
            height: 16px;
        }
        .requirement-item .form-check-label {
            cursor: pointer;
            user-select: none;
            flex: 1;
            font-size: 0.85rem;
        }
        .missing-reqs {
            background-color: #fff8e1;
            border: 1px solid #ffecb3;
            border-radius: 5px;
            padding: 10px;
            max-height: 150px;
            overflow-y: auto;
            margin-bottom: 1rem;
        }
        .missing-req-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 4px 8px;
            background-color: white;
            border-radius: 3px;
            margin-bottom: 4px;
            font-size: 0.85rem;
        }
        #budgetTable {
            width: 100%;
            margin-bottom: 1rem;
        }
        #budgetTable input {
            width: 100%;
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 5px 10px;
            font-size: 13px;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        #budgetTable input:focus {
            outline: none;
            border-color: #86b7fe;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        #budgetTable .btn-danger {
            padding: 2px 6px;
            font-size: 11px;
            line-height: 1.5;
        }
        .pet-section {
            position: relative;
            padding: 15px 15px 15px 45px;
            background: #f8f9fa;
            border-radius: 12px;
            border-left: 4px solid #667eea;
            margin-bottom: 15px;
        }
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
        .pet-section:hover .pet-remove-btn {
            opacity: 1;
        }
        .vaccine-section {
            background-color: #fff;
            border-radius: 8px;
            padding: 10px;
            border: 1px solid #dee2e6;
            margin-bottom: 10px;
        }
        .vaccine-vet-info {
            background: #f8f9fa;
            padding: 8px;
            border-radius: 6px;
            margin-top: 8px;
        }
        @media (max-width: 1200px) {
            .form-container {
                padding: 25px;
                margin: 0 10px 25px;
                width: 97%;
            }
            .form-title {
                font-size: 1.8rem;
            }
        }
        @media (max-width: 768px) {
            .main-container {
                height: auto;
                min-height: calc(100vh - 76px);
            }
            .form-container {
                padding: 20px;
                margin: 0 5px 20px;
                border-radius: 20px;
                width: 100%;
            }
            .form-title {
                font-size: 1.6rem;
            }
            .form-section {
                padding: 20px;
                margin-bottom: 15px;
            }
            .form-actions {
                flex-direction: column;
                gap: 10px;
            }
            .btn-primary-custom,
            .btn-secondary-custom {
                width: 100%;
                padding: 12px 20px;
            }
            .row.mb-3 {
                margin-bottom: 0.8rem !important;
            }
            .requirement-item .form-check {
                flex-direction: column;
                align-items: flex-start;
            }
            .requirement-item .form-check-input {
                margin-bottom: 4px;
            }
            .modal-dialog {
                margin: 5px;
                max-width: calc(100% - 10px);
            }
            .modal-body {
                max-height: 60vh;
                padding: 1rem;
            }
            .missing-req-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
            .missing-req-item button {
                align-self: flex-end;
            }
        }
        @media (max-width: 576px) {
            .modal-dialog {
                margin: 5px;
                max-width: calc(100% - 10px);
            }
            .modal-header,
            .modal-body,
            .modal-footer {
                padding: 0.8rem;
            }
            .form-container {
                padding: 15px;
            }
        }
        @media (min-width: 1400px) {
            .form-container {
                width: 98%;
                padding: 35px;
            }
        }
        @media (min-width: 1600px) {
            .form-container {
                width: 95%;
                max-width: 1600px;
            }
        }
        .country-fields-container {
            width: 100% !important;
            max-width: 100% !important;
            margin: 20px 0 !important;
            padding: 0 !important;
        }

        .country-fields-container .row {
            margin-left: 0 !important;
            margin-right: 0 !important;
        }

        .country-fields-container .card {
            width: 100% !important;
        }

        .form-group {
            width: 100%;
        }

        .small-input-group .form-control {
            font-size: 0.875rem !important;
            padding: 0.375rem 0.75rem !important;
        }
        .requirements-section {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
        }

        .requirement-item {
            transition: all 0.3s ease;
            border-left: 4px solid #dee2e6 !important;
        }

        .requirement-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .requirement-checkbox:checked + label {
            text-decoration: line-through;
            color: #6c757d;
        }

        .requirement-form-fields {
            animation: slideDown 0.3s ease;
            border-left: 4px solid #0d6efd !important;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        /* Estilos para la información del país */
        #countryInfoContainer {
            animation: fadeIn 0.5s ease;
        }

        #countryInfoContainer .card {
            transition: transform 0.3s ease;
            border: none;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        #countryInfoContainer .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        #countryInfoContainer .card-title {
            font-size: 0.9rem;
            color: #495057;
            font-weight: 600;
        }

        #countryInfoContainer .card-text {
            font-size: 0.85rem;
        }

        #countryInfoContainer .card-text strong {
            font-size: 1.1rem;
            display: block;
            margin-bottom: 5px;
        }

        #countryInfoContainer .alert {
            font-size: 0.85rem;
            padding: 10px 15px;
        }
        .requirement-with-fields {
            border: 2px solid #17a2b8 !important;
            background-color: #f8f9fa !important;
        }

        .requirement-fields-container {
            animation: fadeIn 0.3s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .requirement-checkbox:checked ~ .requirement-fields-container {
            display: block !important;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white py-3 shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-paw me-2"></i>Pet Travel Docs
            </a>
            <div class="navbar-text">
                <span class="badge bg-primary rounded-pill">
                    <i class="fas fa-file-alt me-1"></i> Formulario
                </span>
            </div>
        </div>
    </nav>

    <div class="container mt-3">
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

    <div class="container-fluid main-container">
    <div class="form-container-wrapper">
        <div class="form-container">
            <h1 class="form-title">
                <i class="fas fa-file-medical-alt me-2"></i>Formulario de Viaje para Mascotas
            </h1>
            <p class="form-subtitle">
                Complete todos los campos requeridos para generar los documentos oficiales de viaje (hasta 6 mascotas)
            </p>

            <form action="${pageContext.request.contextPath}/generate" method="post" id="petTravelForm">
                <!-- SECCIÓN 1: VIAJE (MOVIDA AL PRINCIPIO) -->
                <input type="hidden" id="countryFormModel" name="countryFormModel" value="">
                <input type="hidden" id="countryEndorsementRequired" name="countryEndorsementRequired" value="">
                <div class="form-section">
                    <div class="field-icon"><i class="fas fa-plane"></i></div>
                    <h4 class="mb-4" style="color: #667eea;">
                        <i class="fas fa-globe-americas me-2"></i> Información del Viaje
                    </h4>

                    <!-- Fila 1: 4 campos en 4 columnas -->
                    <div class="row mb-3">
                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="destinationCountry" class="form-label required-field">
                                <i class="fas fa-flag me-1"></i> País Destino
                            </label>
                            <select class="form-select" id="destinationCountry" name="destinationCountry" 
                                    required onchange="validateReturnDate();">
                                <option value="">Seleccione país...</option>
                                <optgroup label="🌍 Europa">
                                    <option value="EU">🇪🇺 Unión Europea (General)</option>
                                    <option value="AL">🇦🇱 Albania</option>
                                    <option value="DE">🇩🇪 Alemania</option>
                                    <option value="AD">🇦🇩 Andorra</option>
                                    <option value="AT">🇦🇹 Austria</option>
                                    <option value="BE">🇧🇪 Bélgica</option>
                                    <option value="BY">🇧🇾 Bielorrusia</option>
                                    <option value="BA">🇧🇦 Bosnia y Herzegovina</option>
                                    <option value="BG">🇧🇬 Bulgaria</option>
                                    <option value="CY">🇨🇾 Chipre</option>
                                    <option value="HR">🇭🇷 Croacia</option>
                                    <option value="DK">🇩🇰 Dinamarca</option>
                                    <option value="SK">🇸🇰 Eslovaquia</option>
                                    <option value="SI">🇸🇮 Eslovenia</option>
                                    <option value="ES">🇪🇸 España</option>
                                    <option value="EE">🇪🇪 Estonia</option>
                                    <option value="FI">🇫🇮 Finlandia</option>
                                    <option value="FR">🇫🇷 Francia</option>
                                    <option value="GR">🇬🇷 Grecia</option>
                                    <option value="HU">🇭🇺 Hungría</option>
                                    <option value="IE">🇮🇪 Irlanda</option>
                                    <option value="IS">🇮🇸 Islandia</option>
                                    <option value="IT">🇮🇹 Italia</option>
                                    <option value="LV">🇱🇻 Letonia</option>
                                    <option value="LI">🇱🇮 Liechtenstein</option>
                                    <option value="LT">🇱🇹 Lituania</option>
                                    <option value="LU">🇱🇺 Luxemburgo</option>
                                    <option value="MT">🇲🇹 Malta</option>
                                    <option value="MD">🇲🇩 Moldavia</option>
                                    <option value="MC">🇲🇨 Mónaco</option>
                                    <option value="ME">🇲🇪 Montenegro</option>
                                    <option value="NO">🇳🇴 Noruega</option>
                                    <option value="NL">🇳🇱 Países Bajos</option>
                                    <option value="PL">🇵🇱 Polonia</option>
                                    <option value="PT">🇵🇹 Portugal</option>
                                    <option value="UK">🇬🇧 Reino Unido</option>
                                    <option value="ZC">🇬🇧 Escocia</option>
                                    <option value="WL">🇬🇧 Gales</option>
                                    <option value="CZ">🇨🇿 República Checa</option>
                                    <option value="RO">🇷🇴 Rumanía</option>
                                    <option value="RU">🇷🇺 Rusia</option>
                                    <option value="SM">🇸🇲 San Marino</option>
                                    <option value="RS">🇷🇸 Serbia</option>
                                    <option value="SE">🇸🇪 Suecia</option>
                                    <option value="CH">🇨🇭 Suiza</option>
                                    <option value="UA">🇺🇦 Ucrania</option>
                                    <option value="VA">🇻🇦 Vaticano</option>
                                </optgroup>
                                <optgroup label="🌏 Asia">
                                    <option value="AF">🇦🇫 Afganistán</option>
                                    <option value="SA">🇸🇦 Arabia Saudita</option>
                                    <option value="AM">🇦🇲 Armenia</option>
                                    <option value="AZ">🇦🇿 Azerbaiyán</option>
                                    <option value="BD">🇧🇩 Bangladesh</option>
                                    <option value="BH">🇧🇭 Baréin</option>
                                    <option value="BY">🇧🇾 Belarus</option>
                                    <option value="BN">🇧🇳 Brunéi</option>
                                    <option value="BT">🇧🇹 Bután</option>
                                    <option value="KH">🇰🇭 Camboya</option>
                                    <option value="CN">🇨🇳 China</option>
                                    <option value="KP">🇰🇵 Corea del Norte</option>
                                    <option value="KR">🇰🇷 Corea del Sur</option>
                                    <option value="AE">🇦🇪 Emiratos Árabes Unidos</option>
                                    <option value="PH">🇵🇭 Filipinas</option>
                                    <option value="GE">🇬🇪 Georgia</option>
                                    <option value="IN">🇮🇳 India</option>
                                    <option value="ID">🇮🇩 Indonesia</option>
                                    <option value="IQ">🇮🇶 Irak</option>
                                    <option value="IR">🇮🇷 Irán</option>
                                    <option value="IL">🇮🇱 Israel</option>
                                    <option value="JP">🇯🇵 Japón</option>
                                    <option value="JO">🇯🇴 Jordania</option>
                                    <option value="KZ">🇰🇿 Kazajistán</option>
                                    <option value="KG">🇰🇬 Kirgyzistan</option>
                                    <option value="KW">🇰🇼 Kuwait</option>
                                    <option value="LA">🇱🇦 Laos</option>
                                    <option value="LB">🇱🇧 Líbano</option>
                                    <option value="MY">🇲🇾 Malasia</option>
                                    <option value="MV">🇲🇻 Maldivas</option>
                                    <option value="MN">🇲🇳 Mongolia</option>
                                    <option value="MM">🇲🇲 Myanmar</option>
                                    <option value="NP">🇳🇵 Nepal</option>
                                    <option value="OM">🇴🇲 Omán</option>
                                    <option value="PK">🇵🇰 Pakistán</option>
                                    <option value="PS">🇵🇸 Palestina</option>
                                    <option value="QA">🇶🇦 Qatar</option>
                                    <option value="SG">🇸🇬 Singapur</option>
                                    <option value="SY">🇸🇾 Siria</option>
                                    <option value="LK">🇱🇰 Sri Lanka</option>
                                    <option value="TH">🇹🇭 Tailandia</option>
                                    <option value="TJ">🇹🇯 Tayikistán</option>
                                    <option value="TL">🇹🇱 Timor Oriental</option>
                                    <option value="TM">🇹🇲 Turkmenistán</option>
                                    <option value="TR">🇹🇷 Turquía</option>
                                    <option value="UZ">🇺🇿 Uzbekistán</option>
                                    <option value="VN">🇻🇳 Vietnam</option>
                                    <option value="YE">🇾🇪 Yemen</option>
                                </optgroup>
                                <optgroup label="🌎 América">
                                    <option value="US">🇺🇸 Estados Unidos</option>
                                    <option value="CA">🇨🇦 Canadá</option>
                                    <option value="MX">🇲🇽 México</option>
                                    <option value="AG">🇦🇬 Antigua y Barbuda</option>
                                    <option value="AR">🇦🇷 Argentina</option>
                                    <option value="BB">🇧🇧 Barbados</option>
                                    <option value="BO">🇧🇴 Bolivia</option>
                                    <option value="BR">🇧🇷 Brasil</option>
                                    <option value="CL">🇨🇱 Chile</option>
                                    <option value="CO">🇨🇴 Colombia</option>
                                    <option value="CR">🇨🇷 Costa Rica</option>
                                    <option value="CU">🇨🇺 Cuba</option>
                                    <option value="US">🇺🇸 Estados Unidos</option>
                                    <option value="DO">🇩🇴 República Dominicana</option>
                                    <option value="EC">🇪🇨 Ecuador</option>
                                    <option value="SV">🇸🇻 El Salvador</option>
                                    <option value="GT">🇬🇹 Guatemala</option>
                                    <option value="HT">🇭🇹 Haití</option>
                                    <option value="HN">🇭🇳 Honduras</option>
                                    <option value="GD">🇬🇩 Granada</option>
                                    <option value="KY">🇰🇾 Islas Caimán</option>
                                    <option value="JM">🇯🇲 Jamaica</option>
                                    <option value="NI">🇳🇮 Nicaragua</option>
                                    <option value="PA">🇵🇦 Panamá</option>
                                    <option value="PY">🇵🇾 Paraguay</option>
                                    <option value="PE">🇵🇪 Perú</option>
                                    <option value="PR">🇵🇷 Puerto Rico</option>
                                    <option value="TT">🇹🇹 Trinidad y Tobago</option>
                                    <option value="UY">🇺🇾 Uruguay</option>
                                    <option value="VE">🇻🇪 Venezuela</option>
                                </optgroup>
                                <optgroup label="🌍 África">
                                    <option value="DZ">🇩🇿 Argelia</option>
                                    <option value="AO">🇦🇴 Angola</option>
                                    <option value="BJ">🇧🇯 Benín</option>
                                    <option value="BW">🇧🇼 Botsuana</option>
                                    <option value="BF">🇧🇫 Burkina Faso</option>
                                    <option value="BI">🇧🇮 Burundi</option>
                                    <option value="CM">🇨🇲 Camerún</option>
                                    <option value="CV">🇨🇻 Cabo Verde</option>
                                    <option value="TD">🇹🇩 Chad</option>
                                    <option value="KM">🇰🇲 Comoras</option>
                                    <option value="CG">🇨🇬 Congo</option>
                                    <option value="CD">🇨🇩 Congo (RDC)</option>
                                    <option value="CI">🇨🇮 Costa de Marfil</option>
                                    <option value="EG">🇪🇬 Egipto</option>
                                    <option value="ER">🇪🇷 Eritrea</option>
                                    <option value="SZ">🇸🇿 Esuatini</option>
                                    <option value="ET">🇪🇹 Etiopía</option>
                                    <option value="GA">🇬🇦 Gabón</option>
                                    <option value="GM">🇬🇲 Gambia</option>
                                    <option value="GH">🇬🇭 Ghana</option>
                                    <option value="GN">🇬🇳 Guinea</option>
                                    <option value="GQ">🇬🇶 Guinea Ecuatorial</option>
                                    <option value="GW">🇬🇼 Guinea-Bisáu</option>
                                    <option value="KE">🇰🇪 Kenia</option>
                                    <option value="LS">🇱🇸 Lesoto</option>
                                    <option value="LR">🇱🇷 Liberia</option>
                                    <option value="LY">🇱🇾 Libia</option>
                                    <option value="MG">🇲🇬 Madagascar</option>
                                    <option value="MW">🇲🇼 Malaui</option>
                                    <option value="ML">🇲🇱 Malí</option>
                                    <option value="MA">🇲🇦 Marruecos</option>
                                    <option value="MU">🇲🇺 Mauricio</option>
                                    <option value="MR">🇲🇷 Mauritania</option>
                                    <option value="MZ">🇲🇿 Mozambique</option>
                                    <option value="NA">🇳🇦 Namibia</option>
                                    <option value="NE">🇳🇪 Níger</option>
                                    <option value="NG">🇳🇬 Nigeria</option>
                                    <option value="RW">🇷🇼 Ruanda</option>
                                    <option value="ST">🇸🇹 Santo Tomé y Príncipe</option>
                                    <option value="SN">🇸🇳 Senegal</option>
                                    <option value="SC">🇸🇨 Seychelles</option>
                                    <option value="SL">🇸🇱 Sierra Leona</option>
                                    <option value="SO">🇸🇴 Somalia</option>
                                    <option value="ZA">🇿🇦 Sudáfrica</option>
                                    <option value="SS">🇸🇸 Sudán del Sur</option>
                                    <option value="SD">🇸🇩 Sudán</option>
                                    <option value="TZ">🇹🇿 Tanzania</option>
                                    <option value="TG">🇹🇬 Togo</option>
                                    <option value="TN">🇹🇳 Túnez</option>
                                    <option value="UG">🇺🇬 Uganda</option>
                                    <option value="ZM">🇿🇲 Zambia</option>
                                    <option value="ZW">🇿imbabwe</option>
                                </optgroup>
                                <option value="AU">🇦🇺 Australia</option>
                                <option value="NZ">🇳🇿 Nueva Zelanda</option>
                            </select>
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="travelDate" class="form-label required-field">
                                <i class="fas fa-plane-departure me-1"></i> Fecha Ida
                            </label>
                            <input type="date" class="form-control" id="travelDate" name="travelDate" required
                                   onchange="validateReturnDate()">
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="regresoDate" class="form-label">
                                <i class="fas fa-plane-arrival me-1"></i> Fecha Regreso
                                <span id="returnFlag" style="display: none; margin-left: 5px;">
                                    <i class="fas fa-ban text-danger"></i>
                                </span>
                            </label>
                            <div class="input-group">
                                <input type="date" class="form-control" id="regresoDate" name="regresoDate"
                                       onchange="validateReturnDate()">
                                <button type="button" class="btn btn-outline-info" onclick="showReturnInfo()"
                                        title="Información sobre límites de estancia">
                                    <i class="fas fa-info-circle"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="travelType" class="form-label">
                                <i class="fas fa-shipping-fast me-1"></i> Transporte
                            </label>
                            <select class="form-select" id="travelType" name="travelType" onchange="updateArrivalPoints()">
                                <option value="">Seleccione...</option>
                                <option value="airplane_cabin">✈️ Avión (cabina)</option>
                                <option value="airplane_cargo">📦 Avión (carga)</option>
                                <option value="car">🚗 Automóvil</option>
                                <option value="ship">🛳️ Barco/Crucero</option>
                                <option value="train">🚆 Tren</option>
                            </select>
                        </div>
                    </div>

                    <!-- Fila 2: Lugar de arribo -->
                    <div class="row mb-3">
                        <div class="col-12 small-input-group">
                            <label for="arrivalPlace" class="form-label">
                                <i class="fas fa-map-marker-alt me-1"></i> Lugar de Arribo
                            </label>
                            <input type="text" class="form-control" id="arrivalPlace" name="arrivalPlace" 
                                   placeholder="Ej: Aeropuerto Madrid-Barajas T4..."
                                   maxlength="100">
                        </div>
                    </div>

                    <!-- Botones de acción (ELIMINADOS) -->

                    <!-- Info del país y alertas -->
                    <div class="alert alert-warning mt-2" id="returnWarning" style="display: none;"></div>

                    <div class="row mb-3">
                        <div class="col-12">
                            <div class="alert alert-warning" id="travelDurationAlert" style="display: none;">
                                <i class="fas fa-clock me-2"></i>
                                <strong>Duración del viaje:</strong> 
                                <span id="travelDuration">0 días</span>
                                <div id="longStayWarning" style="display: none; margin-top: 5px;">
                                    <i class="fas fa-exclamation-circle text-danger me-1"></i>
                                    <small>Para estadías largas, verifique requisitos adicionales del país</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Contenedor para el formulario específico del país -->
                    <div id="countryFieldsContainer" style="display: none;"></div>
                </div>

                <!-- SECCIÓN 2: INFORMACIÓN DEL DUEÑO (ANTES SECCIÓN 1) -->
                <div class="form-section">
                    <div class="field-icon"><i class="fas fa-user"></i></div>
                    <h4 class="mb-4" style="color: #667eea;">
                        <i class="fas fa-user-circle me-2"></i> Información del Dueño
                    </h4>

                    <!-- Fila 1: 4 campos pequeños -->
                    <div class="row mb-3">
                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="ownerName" class="form-label required-field">
                                <i class="fas fa-user-tag me-1"></i> Nombre Completo
                            </label>
                            <input type="text" class="form-control form-control-sm" id="ownerName" name="ownerName" 
                                   required placeholder="Ej: Juan Pérez García">
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="ownerEmail" class="form-label required-field">
                                <i class="fas fa-envelope me-1"></i> Email
                            </label>
                            <input type="email" class="form-control form-control-sm" id="ownerEmail" name="ownerEmail" 
                                   required placeholder="ejemplo@email.com">
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="ownerPhone" class="form-label required-field">
                                <i class="fas fa-phone me-1"></i> Teléfono
                            </label>
                            <input type="tel" class="form-control form-control-sm" id="ownerPhone" name="ownerPhone" 
                                   required placeholder="+1 (123) 456-7890">
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="ownerState" class="form-label required-field">
                                <i class="fas fa-map-marked-alt me-1"></i> Estado
                            </label>
                            <select class="form-select form-select-sm" id="ownerState" name="ownerState" required onchange="updateCities()">
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
                                <option value="PR">Puerto Rico (PR)</option>
                                <option value="GU">Guam (GU)</option>
                                <option value="VI">Islas Vírgenes (VI)</option>
                                <option value="AS">Samoa Americana (AS)</option>
                                <option value="MP">Islas Marianas del Norte (MP)</option>
                            </select>
                        </div>
                    </div>

                    <!-- Fila 2: 2 campos restantes pequeños -->
                    <div class="row mb-3">
                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="ownerCity" class="form-label required-field">
                                <i class="fas fa-city me-1"></i> Ciudad
                            </label>
                            <select class="form-select form-select-sm" id="ownerCity" name="ownerCity" required>
                                <option value="">Seleccione ciudad...</option>
                            </select>
                        </div>

                        <div class="col-md-6 col-lg-3 small-input-group">
                            <label for="ownerZipCode" class="form-label required-field">
                                <i class="fas fa-mail-bulk me-1"></i> Código Postal
                            </label>
                            <input type="text" class="form-control form-control-sm" id="ownerZipCode" name="ownerZipCode" 
                                   required placeholder="Ej: 12345">
                        </div>

                        <div class="col-md-6 col-lg-6 small-input-group">
                            <label for="ownerAddress" class="form-label required-field">
                                <i class="fas fa-home me-1"></i> Dirección en EE.UU.
                            </label>
                            <input type="text" class="form-control form-control-sm" id="ownerAddress" name="ownerAddress" 
                                   required placeholder="Calle y Entrecalles, No.">
                        </div>
                    </div>
                </div>

                <!-- SECCIÓN 3: ENCARGADO DE TRASLADO (ANTES SECCIÓN 2) -->
                <div class="form-section">
                    <div class="field-icon"><i class="fas fa-user-hard-hat"></i></div>
                    <h4 class="mb-4" style="color: #667eea;">
                        <i class="fas fa-truck-moving me-2"></i> Persona Encargada del Traslado (Opcional)
                    </h4>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="useCarrier" onchange="toggleCarrierSection()">
                        <label class="form-check-label" for="useCarrier">
                            <i class="fas fa-user-check me-1"></i> Una persona diferente al dueño llevará a la(s) mascota(s)
                        </label>
                    </div>

                    <div id="carrierSection" style="display: none;">
                        <!-- Fila 1: 4 campos pequeños -->
                        <div class="row mb-3">
                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="carrierName" class="form-label">
                                    <i class="fas fa-user-tag me-1"></i> Nombre Completo
                                </label>
                                <input type="text" class="form-control form-control-sm" id="carrierName" name="carrierName"
                                       placeholder="Ej: Ana Martínez">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="carrierEmail" class="form-label">
                                    <i class="fas fa-envelope me-1"></i> Email
                                </label>
                                <input type="email" class="form-control form-control-sm" id="carrierEmail" name="carrierEmail"
                                       placeholder="ana@email.com">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="carrierPhone" class="form-label">
                                    <i class="fas fa-phone me-1"></i> Teléfono
                                </label>
                                <input type="tel" class="form-control form-control-sm" id="carrierPhone" name="carrierPhone"
                                       placeholder="+1 (123) 456-7890">
                            </div>

                            <div class="col-md-6 col-lg-3 small-input-group">
                                <label for="carrierCountry" class="form-label">
                                    <i class="fas fa-globe-americas me-1"></i> País
                                </label>
                                <select class="form-select form-select-sm" id="carrierCountry" name="carrierCountry">
                                    <option value="">Seleccione país...</option>
                                    <!-- Opciones igual que en el select de país destino -->
                                    <optgroup label="🌍 Europa">
                                        <option value="EU">🇪🇺 Unión Europea (General)</option>
                                        <option value="AL">🇦🇱 Albania</option>
                                        <option value="DE">🇩🇪 Alemania</option>
                                        <option value="AD">🇦🇩 Andorra</option>
                                        <option value="AT">🇦🇹 Austria</option>
                                        <option value="BE">🇧🇪 Bélgica</option>
                                        <option value="BY">🇧🇾 Bielorrusia</option>
                                        <option value="BA">🇧🇦 Bosnia y Herzegovina</option>
                                        <option value="BG">🇧🇬 Bulgaria</option>
                                        <option value="CY">🇨🇾 Chipre</option>
                                        <option value="HR">🇭🇷 Croacia</option>
                                        <option value="DK">🇩🇰 Dinamarca</option>
                                        <option value="SK">🇸🇰 Eslovaquia</option>
                                        <option value="SI">🇸🇮 Eslovenia</option>
                                        <option value="ES">🇪🇸 España</option>
                                        <option value="EE">🇪🇪 Estonia</option>
                                        <option value="FI">🇫🇮 Finlandia</option>
                                        <option value="FR">🇫🇷 Francia</option>
                                        <option value="GR">🇬🇷 Grecia</option>
                                        <option value="HU">🇭🇺 Hungría</option>
                                        <option value="IE">🇮🇪 Irlanda</option>
                                        <option value="IS">🇮🇸 Islandia</option>
                                        <option value="IT">🇮🇹 Italia</option>
                                        <option value="LV">🇱🇻 Letonia</option>
                                        <option value="LI">🇱🇮 Liechtenstein</option>
                                        <option value="LT">🇱🇹 Lituania</option>
                                        <option value="LU">🇱🇺 Luxemburgo</option>
                                        <option value="MT">🇲🇹 Malta</option>
                                        <option value="MD">🇲🇩 Moldavia</option>
                                        <option value="MC">🇲🇨 Mónaco</option>
                                        <option value="ME">🇲🇪 Montenegro</option>
                                        <option value="NO">🇳🇴 Noruega</option>
                                        <option value="NL">🇳🇱 Países Bajos</option>
                                        <option value="PL">🇵🇱 Polonia</option>
                                        <option value="PT">🇵🇹 Portugal</option>
                                        <option value="UK">🇬🇧 Reino Unido</option>
                                        <option value="ZC">🇬🇧 Escocia</option>
                                        <option value="WL">🇬🇧 Gales</option>
                                        <option value="CZ">🇨🇿 República Checa</option>
                                        <option value="RO">🇷🇴 Rumanía</option>
                                        <option value="RU">🇷🇺 Rusia</option>
                                        <option value="SM">🇸🇲 San Marino</option>
                                        <option value="RS">🇷🇸 Serbia</option>
                                        <option value="SE">🇸🇪 Suecia</option>
                                        <option value="CH">🇨🇭 Suiza</option>
                                        <option value="UA">🇺🇦 Ucrania</option>
                                        <option value="VA">🇻🇦 Vaticano</option>
                                    </optgroup>
                                    <optgroup label="🌏 Asia">
                                        <option value="AF">🇦🇫 Afganistán</option>
                                        <option value="SA">🇸🇦 Arabia Saudita</option>
                                        <option value="AM">🇦🇲 Armenia</option>
                                        <option value="AZ">🇦🇿 Azerbaiyán</option>
                                        <option value="BD">🇧🇩 Bangladesh</option>
                                        <option value="BH">🇧🇭 Baréin</option>
                                        <option value="BY">🇧🇾 Belarus</option>
                                        <option value="BN">🇧🇳 Brunéi</option>
                                        <option value="BT">🇧🇹 Bután</option>
                                        <option value="KH">🇰🇭 Camboya</option>
                                        <option value="CN">🇨🇳 China</option>
                                        <option value="KP">🇰🇵 Corea del Norte</option>
                                        <option value="KR">🇰🇷 Corea del Sur</option>
                                        <option value="AE">🇦🇪 Emiratos Árabes Unidos</option>
                                        <option value="PH">🇵🇭 Filipinas</option>
                                        <option value="GE">🇬🇪 Georgia</option>
                                        <option value="IN">🇮🇳 India</option>
                                        <option value="ID">🇮🇩 Indonesia</option>
                                        <option value="IQ">🇮🇶 Irak</option>
                                        <option value="IR">🇮🇷 Irán</option>
                                        <option value="IL">🇮🇱 Israel</option>
                                        <option value="JP">🇯🇵 Japón</option>
                                        <option value="JO">🇯🇴 Jordania</option>
                                        <option value="KZ">🇰🇿 Kazajistán</option>
                                        <option value="KG">🇰🇬 Kirgyzistan</option>
                                        <option value="KW">🇰🇼 Kuwait</option>
                                        <option value="LA">🇱🇦 Laos</option>
                                        <option value="LB">🇱🇧 Líbano</option>
                                        <option value="MY">🇲🇾 Malasia</option>
                                        <option value="MV">🇲🇻 Maldivas</option>
                                        <option value="MN">🇲🇳 Mongolia</option>
                                        <option value="MM">🇲🇲 Myanmar</option>
                                        <option value="NP">🇳🇵 Nepal</option>
                                        <option value="OM">🇴🇲 Omán</option>
                                        <option value="PK">🇵🇰 Pakistán</option>
                                        <option value="PS">🇵🇸 Palestina</option>
                                        <option value="QA">🇶🇦 Qatar</option>
                                        <option value="SG">🇸🇬 Singapur</option>
                                        <option value="SY">🇸🇾 Siria</option>
                                        <option value="LK">🇱🇰 Sri Lanka</option>
                                        <option value="TH">🇹🇭 Tailandia</option>
                                        <option value="TJ">🇹🇯 Tayikistán</option>
                                        <option value="TL">🇹🇱 Timor Oriental</option>
                                        <option value="TM">🇹🇲 Turkmenistán</option>
                                        <option value="TR">🇹🇷 Turquía</option>
                                        <option value="UZ">🇺🇿 Uzbekistán</option>
                                        <option value="VN">🇻🇳 Vietnam</option>
                                        <option value="YE">🇾🇪 Yemen</option>
                                    </optgroup>
                                    <optgroup label="🌎 América">
                                        <option value="US">🇺🇸 Estados Unidos</option>
                                        <option value="CA">🇨🇦 Canadá</option>
                                        <option value="MX">🇲🇽 México</option>
                                        <option value="AR">🇦🇷 Argentina</option>
                                        <option value="AG">🇦🇬 Antigua y Barbuda</option>
                                        <option value="BB">BB Barbados</option>
                                        <option value="BO">🇧🇴 Bolivia</option>
                                        <option value="BR">🇧🇷 Brasil</option>
                                        <option value="CL">🇨🇱 Chile</option>
                                        <option value="CO">🇨🇴 Colombia</option>
                                        <option value="CR">🇨🇷 Costa Rica</option>
                                        <option value="CU">🇨🇺 Cuba</option>
                                        <option value="US">🇺🇸 Estados Unidos</option>
                                        <option value="DO">🇩🇴 República Dominicana</option>
                                        <option value="EC">🇪🇨 Ecuador</option>
                                        <option value="SV">🇸🇻 El Salvador</option>
                                        <option value="GT">🇬🇹 Guatemala</option>
                                        <option value="HT">🇭🇹 Haití</option>
                                        <option value="HN">🇭🇳 Honduras</option>
                                        <option value="GD">🇬🇩 Granada</option>
                                        <option value="KY">🇰🇾 Islas Caimán</option>
                                        <option value="JM">🇯🇲 Jamaica</option>
                                        <option value="NI">🇳🇮 Nicaragua</option>
                                        <option value="PA">🇵🇦 Panamá</option>
                                        <option value="PY">🇵🇾 Paraguay</option>
                                        <option value="PE">🇵🇪 Perú</option>
                                        <option value="PR">🇵🇷 Puerto Rico</option>
                                        <option value="TT">🇹🇹 Trinidad y Tobago</option> 
                                        <option value="UY">🇺🇾 Uruguay</option>
                                        <option value="VE">🇻🇪 Venezuela</option>
                                    </optgroup>
                                    <optgroup label="🌍 África">
                                        <option value="DZ">🇩🇿 Argelia</option>
                                        <option value="AO">🇦🇴 Angola</option>
                                        <option value="BJ">🇧🇯 Benín</option>
                                        <option value="BW">🇧🇼 Botsuana</option>
                                        <option value="BF">🇧🇫 Burkina Faso</option>
                                        <option value="BI">🇧🇮 Burundi</option>
                                        <option value="CM">🇨🇲 Camerún</option>
                                        <option value="CV">🇨🇻 Cabo Verde</option>
                                        <option value="TD">🇹🇩 Chad</option>
                                        <option value="KM">🇰🇲 Comoras</option>
                                        <option value="CG">🇨🇬 Congo</option>
                                        <option value="CD">🇨🇩 Congo (RDC)</option>
                                        <option value="CI">🇨🇮 Costa de Marfil</option>
                                        <option value="EG">🇪🇬 Egipto</option>
                                        <option value="ER">🇪🇷 Eritrea</option>
                                        <option value="SZ">🇸🇿 Esuatini</option>
                                        <option value="ET">🇪🇹 Etiopía</option>
                                        <option value="GA">🇬🇦 Gabón</option>
                                        <option value="GM">🇬🇲 Gambia</option>
                                        <option value="GH">🇬🇭 Ghana</option>
                                        <option value="GN">🇬🇳 Guinea</option>
                                        <option value="GQ">🇬🇶 Guinea Ecuatorial</option>
                                        <option value="GW">🇬🇼 Guinea-Bisáu</option>
                                        <option value="KE">🇰🇪 Kenia</option>
                                        <option value="LS">🇱🇸 Lesoto</option>
                                        <option value="LR">🇱🇷 Liberia</option>
                                        <option value="LY">🇱🇾 Libia</option>
                                        <option value="MG">🇲🇬 Madagascar</option>
                                        <option value="MW">🇲🇼 Malaui</option>
                                        <option value="ML">🇲🇱 Malí</option>
                                        <option value="MA">🇲🇦 Marruecos</option>
                                        <option value="MU">🇲🇺 Mauricio</option>
                                        <option value="MR">🇲🇷 Mauritania</option>
                                        <option value="MZ">🇲🇿 Mozambique</option>
                                        <option value="NA">🇳🇦 Namibia</option>
                                        <option value="NE">🇳🇪 Níger</option>
                                        <option value="NG">🇳🇬 Nigeria</option>
                                        <option value="RW">🇷🇼 Ruanda</option>
                                        <option value="ST">🇸🇹 Santo Tomé y Príncipe</option>
                                        <option value="SN">🇸🇳 Senegal</option>
                                        <option value="SC">🇸🇨 Seychelles</option>
                                        <option value="SL">🇸🇱 Sierra Leona</option>
                                        <option value="SO">🇸🇴 Somalia</option>
                                        <option value="ZA">🇿🇦 Sudáfrica</option>
                                        <option value="SS">🇸🇸 Sudán del Sur</option>
                                        <option value="SD">🇸🇩 Sudán</option>
                                        <option value="TZ">🇹🇿 Tanzania</option>
                                        <option value="TG">🇹🇬 Togo</option>
                                        <option value="TN">🇹🇳 Túnez</option>
                                        <option value="UG">🇺🇬 Uganda</option>
                                        <option value="ZM">🇿🇲 Zambia</option>
                                        <option value="ZW">🇿imbabwe</option>
                                    </optgroup>
                                    <option value="AU">🇦🇺 Australia</option>
                                    <option value="NZ">🇳🇿 Nueva Zelanda</option>
                                </select>
                            </div>
                        </div>

                        <!-- Fila 2: 1 campo dirección -->
                        <div class="row mb-3">
                            <div class="col-md-12 col-lg-6 small-input-group">
                                <label for="carrierAddress" class="form-label">
                                    <i class="fas fa-home me-1"></i> Dirección
                                </label>
                                <input type="text" class="form-control form-control-sm" id="carrierAddress" name="carrierAddress"
                                       placeholder="Calle, Número, Ciudad, Estado">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SECCIÓN 4: MASCOTAS (ANTES SECCIÓN 3) -->
                <div class="form-section">
                    <div class="field-icon"><i class="fas fa-paw"></i></div>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="mb-0" style="color: #667eea;">
                            <i class="fas fa-dog me-2"></i> Información de las Mascotas
                        </h4>
                        <button type="button" class="btn btn-outline-primary btn-sm" id="addPetBtn"
                                onclick="addPetSection()" title="Agregar otra mascota">
                            <i class="fas fa-plus-circle me-1"></i> Agregar mascota
                        </button>
                    </div>

                    <div id="petsContainer">
                        <div class="pet-section mb-4 p-3 border rounded bg-light position-relative">
                            <div class="position-absolute top-0 start-0">
                                <span class="badge bg-primary rounded-pill pet-badge">#1</span>
                            </div>
                            <button type="button" class="btn btn-sm btn-outline-danger pet-remove-btn" disabled>
                                <i class="fas fa-trash-alt"></i>
                            </button>

                            <!-- Fila 1: 4 campos pequeños -->
                            <div class="row mb-3">
                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label required-field">
                                        <i class="fas fa-tag me-1"></i> Nombre Mascota
                                    </label>
                                    <input type="text" class="form-control form-control-sm" name="pets[0].petName" required
                                           placeholder="Nombre de la mascota">
                                </div>

                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label required-field">
                                        <i class="fas fa-cat me-1"></i> Especie
                                    </label>
                                    <select class="form-select form-select-sm" name="pets[0].petType" required 
                                            onchange="updatePetBreeds(this, 0)">
                                        <option value="">Seleccione...</option>
                                        <option value="dog">🐕 Canino</option>
                                        <option value="cat">🐈 Felino</option>
                                        <option value="bird" hidden>🦜 Ave</option>
                                        <option value="rabbit" hidden>🐇 Conejo</option>
                                        <option value="hamster" hidden>🐹 Hámster</option>
                                        <option value="pig" hidden>🐖 Porcino</option>
                                        <option value="sheep" hidden>🐑 Ovino</option>
                                        <option value="cow" hidden>🐄 Bovino</option>
                                        <option value="horse" hidden>🐎 Equino</option>
                                        <option value="reptile" hidden>🦎 Reptil</option>
                                        <option value="ferret" hidden>🐾 Hurón</option>
                                        <option value="fish" hidden>🐠 Pez</option>
                                        <option value="mink" hidden>🦡 Visón</option>                                       
                                        <option value="other" hidden>🐾 Otro</option>
                                    </select>
                                </div>

                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label">
                                        <i class="fas fa-dna me-1"></i> Raza
                                    </label>
                                    <select class="form-select form-select-sm" name="pets[0].petBreed" id="petBreed_0">
                                        <option value="">Seleccione raza...</option>
                                    </select>
                                </div>

                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label">
                                        <i class="fas fa-palette me-1"></i> Color
                                    </label>
                                    <input type="text" class="form-control form-control-sm" name="pets[0].petColor"
                                           placeholder="Color principal">
                                </div>
                            </div>

                            <!-- Fila 2: 4 campos pequeños -->
                            <div class="row mb-3">
                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label">
                                        <i class="fas fa-venus-mars me-1"></i> Género
                                    </label>
                                    <select class="form-select form-select-sm" name="pets[0].petGender">
                                        <option value="">Seleccione...</option>
                                        <option value="male_intact">♂ Macho </option>
                                        <option value="male_neutered">♂ Macho (Castrado)</option>
                                        <option value="female_intact">♀ Hembra </option>
                                        <option value="female_spayed">♀ Hembra (Esterilizada)</option>
                                    </select>
                                </div>

                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label">
                                        <i class="fas fa-birthday-cake me-1"></i> Fecha Nacimiento
                                    </label>
                                    <input type="date" class="form-control form-control-sm" name="pets[0].petBirthDate">
                                </div>

                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <label class="form-label">
                                        <i class="fas fa-microchip me-1"></i> Microchip (15 dígitos)
                                    </label>
                                    <input type="text" class="form-control form-control-sm" name="pets[0].microchipNumber"
                                           placeholder="Ej: 985123456789012">
                                </div>

                                <div class="col-md-6 col-lg-3 small-input-group">
                                    <!-- Campo vacío para completar 4 columnas -->
                                </div>
                            </div>                                     
                        </div>
                        <div class="requirements-section mt-4 pt-3 border-top" id="requirements_0">
                            <h5 class="mb-3" style="color: #dc3545;">
                                <i class="fas fa-tasks me-2"></i> Requerimientos del País
                            </h5>
                            <div class="requirements-container" id="requirementsContainer_0">
                                <div class="alert alert-info small" id="reqMessage_0">
                                    <i class="fas fa-info-circle me-1"></i> Seleccione un país destino para ver los requerimientos específicos
                                </div>
                            </div>
                        </div>                    
                    </div>
                </div>
                <div id="countrySpecificFields" style="display: none;">
                    <!-- Estos campos se mostrarán dinámicamente según el país seleccionado -->
                </div>
                <!-- BOTONES FINALES -->
                <div class="form-actions">
                    <button type="button" class="btn-secondary-custom" onclick="window.location.href = '${pageContext.request.contextPath}/'">
                        <i class="fas fa-arrow-left me-2"></i> Cancelar y Volver
                    </button>
                    <button type="button" class="btn btn-info" id="previewPDFBtn" onclick="generateInternationalPDF()" style="background: linear-gradient(135deg, #17a2b8 0%, #138496 100%); color: white; border: none; border-radius: 10px; padding: 10px 30px; font-size: 1rem; font-weight: 600; transition: all 0.3s ease;">
                        <i class="fas fa-file-pdf me-2"></i> Vista Previa PDF
                    </button>
                   <button type="button" class="btn btn-warning" id="totalBudgetBtn" onclick="addAllMissingToBudget()" 
                            style="background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%); color: white; border: none; border-radius: 10px; padding: 10px 30px; font-size: 1rem; font-weight: 600; transition: all 0.3s ease;">
                        <i class="fas fa-calculator me-2"></i> Presupuesto Total
                    </button>
                    <button type="submit" class="btn-primary-custom" id="submitBtn">
                        <i class="fas fa-file-export me-2"></i> Generar Documentos
                    </button>
                </div>

                <div class="alert alert-light mt-4 text-center">
                    <i class="fas fa-lock me-2"></i>
                    <small>Toda la información proporcionada es confidencial y solo se utiliza para generar los documentos de viaje.</small>
                </div>
            </form>
        </div>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/petTravelDB.js"></script>
    <script src="${pageContext.request.contextPath}/js/country-requirements/country-codes.js"></script>
<script src="${pageContext.request.contextPath}/js/petTravelDB.js"></script>
    <script src="${pageContext.request.contextPath}/js/country-requirements/country-requirements-db.js"></script>
    <script src="${pageContext.request.contextPath}/js/form-handler.js"></script>
    <script> window.contextPath = "${pageContext.request.contextPath}";</script>
    <script>
        let petCount = 1;        
        function getCountryVariableName(countryCode) {
            if (!countryCode) {
                console.error('Error: countryCode vacío');
                return null;
            }

            // Primero intentar con CountryCodeMap
            if (window.CountryCodeMap && window.CountryCodeMap[countryCode]) {
                const fileCode = window.CountryCodeMap[countryCode];                

                const varName = fileCode
                    .split('_')
                    .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
                    .join('') + 'PetTravelForm';                
                return varName;
            }

            // Fallback: usar código de país directamente
            return countryCode.toUpperCase() + 'PetTravelForm';
        }
        const vaccineCounters = {0: 1};
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
        const citiesByState = {
            "AL": ["Birmingham","Montgomery","Mobile","Huntsville","Tuscaloosa"],
            "AK": ["Anchorage","Fairbanks","Juneau","Sitka","Ketchikan"],
            "AZ": ["Phoenix","Tucson","Mesa","Chandler","Glendale"],
            "AR": ["Little Rock","Fort Smith","Fayetteville","Springdale","Jonesboro"],
            "CA": ["Los Angeles","San Diego","San Jose","San Francisco","Sacramento","Fresno","Long Beach","Oakland"],
            "CO": ["Denver","Colorado Springs","Aurora","Fort Collins","Lakewood"],
            "CT": ["Bridgeport","New Haven","Stamford","Hartford","Waterbury"],
            "DE": ["Wilmington","Dover","Newark","Middletown","Smyrna"],
            "FL": ["Jacksonville","Miami","Tampa","Orlando","St. Petersburg","Hialeah","Tallahassee","Fort Lauderdale"],
            "GA": ["Atlanta","Augusta","Columbus","Macon","Savannah"],
            "HI": ["Honolulu","Hilo","Kailua","Kaneohe","Pearl City"],
            "ID": ["Boise","Meridian","Nampa","Idaho Falls","Pocatello"],
            "IL": ["Chicago","Aurora","Rockford","Joliet","Naperville","Springfield"],
            "IN": ["Indianapolis","Fort Wayne","Evansville","South Bend","Carmel"],
            "IA": ["Des Moines","Cedar Rapids","Davenport","Sioux City","Iowa City"],
            "KS": ["Wichita","Overland Park","Kansas City","Topeka","Olathe"],
            "KY": ["Louisville","Lexington","Bowling Green","Owensboro","Covington"],
            "LA": ["New Orleans","Baton Rouge","Shreveport","Lafayette","Lake Charles"],
            "ME": ["Portland","Lewiston","Bangor","South Portland","Auburn"],
            "MD": ["Baltimore","Frederick","Rockville","Gaithersburg","Bowie"],
            "MA": ["Boston","Worcester","Springfield","Cambridge","Lowell"],
            "MI": ["Detroit","Grand Rapids","Warren","Sterling Heights","Ann Arbor"],
            "MN": ["Minneapolis","Saint Paul","Rochester","Duluth","Bloomington"],
            "MS": ["Jackson","Gulfport","Southaven","Hattiesburg","Biloxi"],
            "MO": ["Kansas City","St. Louis","Springfield","Columbia","Independence"],
            "MT": ["Billings","Missoula","Great Falls","Bozeman","Butte"],
            "NE": ["Omaha","Lincoln","Bellevue","Grand Island","Kearney"],
            "NV": ["Las Vegas","Henderson","Reno","North Las Vegas","Sparks"],
            "NH": ["Manchester","Nashua","Concord","Derry","Dover"],
            "NJ": ["Newark","Jersey City","Paterson","Elizabeth","Edison"],
            "NM": ["Albuquerque","Las Cruces","Rio Rancho","Santa Fe","Roswell"],
            "NY": ["New York City","Buffalo","Rochester","Yonkers","Syracuse"],
            "NC": ["Charlotte","Raleigh","Greensboro","Durham","Winston-Salem"],
            "ND": ["Fargo","Bismarck","Grand Forks","Minot","West Fargo"],
            "OH": ["Columbus","Cleveland","Cincinnati","Toledo","Akron"],
            "OK": ["Oklahoma City","Tulsa","Norman","Broken Arrow","Lawton"],
            "OR": ["Portland","Eugene","Salem","Gresham","Hillsboro"],
            "PA": ["Philadelphia","Pittsburgh","Allentown","Erie","Reading"],
            "RI": ["Providence","Warwick","Cranston","Pawtucket","East Providence"],
            "SC": ["Columbia","Charleston","North Charleston","Mount Pleasant","Rock Hill"],
            "SD": ["Sioux Falls","Rapid City","Aberdeen","Brookings","Watertown"],
            "TN": ["Memphis","Nashville","Knoxville","Chattanooga","Clarksville"],
            "TX": ["Houston","San Antonio","Dallas","Austin","Fort Worth","El Paso","Arlington"],
            "UT": ["Salt Lake City","West Valley City","Provo","West Jordan","Orem"],
            "VT": ["Burlington","South Burlington","Rutland","Barre","Montpelier"],
            "VA": ["Virginia Beach","Norfolk","Chesapeake","Richmond","Newport News"],
            "WA": ["Seattle","Spokane","Tacoma","Vancouver","Bellevue"],
            "WV": ["Charleston","Huntington","Morgantown","Parkersburg","Wheeling"],
            "WI": ["Milwaukee","Madison","Green Bay","Kenosha","Racine"],
            "WY": ["Cheyenne","Casper","Laramie","Gillette","Rock Springs"]
        };
        const countryStayLimits = {
            'EU': { maxDays: 90, requiresReturnForm: true, message: "La UE permite estancias de hasta 90 días dentro de un período de 180 días" },
            'UK': { maxDays: 180, requiresReturnForm: false, message: "El Reino Unido permite estancias de hasta 6 meses sin requisitos adicionales" },
            'CA': { maxDays: 180, requiresReturnForm: false, message: "Canadá permite estancias de hasta 6 meses para mascotas" },
            'MX': { maxDays: 180, requiresReturnForm: false, message: "México permite estancias de hasta 6 meses" },
            'AU': { maxDays: 90, requiresReturnForm: true, message: "Australia requiere formulario de regreso para estancias mayores a 90 días" },
            'JP': { maxDays: 90, requiresReturnForm: true, message: "Japón permite estancias de hasta 90 días sin requisitos adicionales" },
            'CH': { maxDays: 90, requiresReturnForm: true, message: "Suiza sigue las reglas de Schengen (90 días en 180 días)" },
            'NO': { maxDays: 90, requiresReturnForm: true, message: "Noruega sigue las reglas de Schengen (90 días en 180 días)" }
        };        
        function addVaccine(petIndex) {
            const container = document.getElementById('vaccinesContainer_' + petIndex);
            if (!container) return;

            const vaccineCounter = vaccineCounters[petIndex] || 0;
            const vaccineDiv = document.createElement('div');
            vaccineDiv.className = 'vaccine-section mb-3 p-2 border rounded';
            const row1 = document.createElement('div');
            row1.className = 'row';
            const col1 = document.createElement('div');
            col1.className = 'col-md-4';
            const label1 = document.createElement('label');
            label1.className = 'form-label required-field';
            label1.textContent = 'Nombre de la vacuna';
            const input1 = document.createElement('input');
            input1.type = 'text';
            input1.className = 'form-control vaccine-name';
            input1.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].name';
            input1.required = true;
            input1.placeholder = 'Ej: Defensor 3';
            col1.appendChild(label1);
            col1.appendChild(input1);
            row1.appendChild(col1);

            const col2 = document.createElement('div');
            col2.className = 'col-md-3';
            const label2 = document.createElement('label');
            label2.className = 'form-label required-field';
            label2.textContent = 'Fecha';
            const input2 = document.createElement('input');
            input2.type = 'date';
            input2.className = 'form-control';
            input2.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].date';
            input2.required = true;
            col2.appendChild(label2);
            col2.appendChild(input2);
            row1.appendChild(col2);

            const col3 = document.createElement('div');
            col3.className = 'col-md-3';
            const label3 = document.createElement('label');
            label3.className = 'form-label';
            label3.textContent = 'N° de lote';
            const input3 = document.createElement('input');
            input3.type = 'text';
            input3.className = 'form-control';
            input3.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].batch';
            input3.placeholder = 'VAC-2024-001';
            col3.appendChild(label3);
            col3.appendChild(input3);
            row1.appendChild(col3);

            const col4 = document.createElement('div');
            col4.className = 'col-md-2 d-flex align-items-end';
            const button1 = document.createElement('button');
            button1.type = 'button';
            button1.className = 'btn btn-sm btn-outline-danger';
            button1.setAttribute('onclick', 'removeVaccine(this, ' + petIndex + ')');
            const icon1 = document.createElement('i');
            icon1.className = 'fas fa-trash';
            button1.appendChild(icon1);
            col4.appendChild(button1);
            row1.appendChild(col4);

            vaccineDiv.appendChild(row1);

            const vetInfoRow = document.createElement('div');
            vetInfoRow.className = 'row mt-2 vaccine-vet-info';

            const vetCol1 = document.createElement('div');
            vetCol1.className = 'col-md-4';
            const vetLabel1 = document.createElement('label');
            vetLabel1.className = 'form-label required-field';
            vetLabel1.textContent = 'Nombre del veterinario';
            const vetInput1 = document.createElement('input');
            vetInput1.type = 'text';
            vetInput1.className = 'form-control';
            vetInput1.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].vetName';
            vetInput1.required = true;
            vetInput1.placeholder = 'Dr. Ana López';
            vetCol1.appendChild(vetLabel1);
            vetCol1.appendChild(vetInput1);
            vetInfoRow.appendChild(vetCol1);

            const vetCol2 = document.createElement('div');
            vetCol2.className = 'col-md-3';
            const vetLabel2 = document.createElement('label');
            vetLabel2.className = 'form-label required-field';
            vetLabel2.textContent = 'Licencia';
            const vetInput2 = document.createElement('input');
            vetInput2.type = 'text';
            vetInput2.className = 'form-control';
            vetInput2.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].vetLicense';
            vetInput2.required = true;
            vetInput2.placeholder = 'VET-CA-12345';
            vetCol2.appendChild(vetLabel2);
            vetCol2.appendChild(vetInput2);
            vetInfoRow.appendChild(vetCol2);

            const vetCol3 = document.createElement('div');
            vetCol3.className = 'col-md-5';
            const vetLabel3 = document.createElement('label');
            vetLabel3.className = 'form-label required-field';
            vetLabel3.textContent = 'Clínica';
            const vetInput3 = document.createElement('input');
            vetInput3.type = 'text';
            vetInput3.className = 'form-control';
            vetInput3.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].clinicName';
            vetInput3.required = true;
            vetInput3.placeholder = 'Clínica Veterinaria San Pablo';
            vetCol3.appendChild(vetLabel3);
            vetCol3.appendChild(vetInput3);
            vetInfoRow.appendChild(vetCol3);

            vaccineDiv.appendChild(vetInfoRow);

            const addressRow = document.createElement('div');
            addressRow.className = 'row mt-2';

            const addressCol1 = document.createElement('div');
            addressCol1.className = 'col-md-8';
            const addressLabel = document.createElement('label');
            addressLabel.className = 'form-label';
            addressLabel.textContent = 'Dirección de la clínica';
            const addressInput = document.createElement('input');
            addressInput.type = 'text';
            addressInput.className = 'form-control';
            addressInput.name = 'pets[' + petIndex + '].vaccines[' + vaccineCounter + '].clinicAddress';
            addressInput.placeholder = 'Calle 123, Ciudad, Estado';
            addressCol1.appendChild(addressLabel);
            addressCol1.appendChild(addressInput);
            addressRow.appendChild(addressCol1);

            const addressCol2 = document.createElement('div');
            addressCol2.className = 'col-md-4 d-flex align-items-end';
            const copyButton = document.createElement('button');
            copyButton.type = 'button';
            copyButton.className = 'btn btn-sm btn-outline-info copy-vet-data';
            copyButton.setAttribute('onclick', 'copyVetDataToAll(this, ' + petIndex + ')');
            copyButton.title = 'Copiar estos datos a todas las vacunas';
            const copyIcon = document.createElement('i');
            copyIcon.className = 'fas fa-copy me-1';
            const copyText = document.createTextNode(' Copiar a todas');
            copyButton.appendChild(copyIcon);
            copyButton.appendChild(copyText);
            addressCol2.appendChild(copyButton);
            addressRow.appendChild(addressCol2);

            vaccineDiv.appendChild(addressRow);

            container.appendChild(vaccineDiv);
            vaccineCounters[petIndex] = vaccineCounter + 1;

            const firstVaccineRemoveBtn = container.querySelector('.vaccine-section:first-child .btn-outline-danger');
            if (firstVaccineRemoveBtn && container.querySelectorAll('.vaccine-section').length === 1) {
                firstVaccineRemoveBtn.style.display = 'none';
            }
        }        
        function removeVaccine(button, petIndex) {
            const container = document.getElementById('vaccinesContainer_' + petIndex);
            if (!container) return;
            const section = button.closest('.vaccine-section');
            if (container.querySelectorAll('.vaccine-section').length > 1) {
                section.remove();
                const firstVaccineRemoveBtn = container.querySelector('.vaccine-section:first-child .btn-outline-danger');
                if (firstVaccineRemoveBtn && container.querySelectorAll('.vaccine-section').length === 1) {
                    firstVaccineRemoveBtn.style.display = 'none';
                }
            }
        }        
        function copyVetDataToAll(button, petIndex) {
            const vaccineSection = button.closest('.vaccine-section');

            const vetName = vaccineSection.querySelector('[name*=".vetName"]').value;
            const vetLicense = vaccineSection.querySelector('[name*=".vetLicense"]').value;
            const clinicName = vaccineSection.querySelector('[name*=".clinicName"]').value;
            const clinicAddress = vaccineSection.querySelector('[name*=".clinicAddress"]').value;

            const container = document.getElementById('vaccinesContainer_' + petIndex);
            const allVaccineSections = container.querySelectorAll('.vaccine-section');

            allVaccineSections.forEach(section => {
                if (section !== vaccineSection) {
                    section.querySelector('[name*=".vetName"]').value = vetName;
                    section.querySelector('[name*=".vetLicense"]').value = vetLicense;
                    section.querySelector('[name*=".clinicName"]').value = clinicName;
                    section.querySelector('[name*=".clinicAddress"]').value = clinicAddress;
                }
            });

            alert('Datos del veterinario copiados a todas las vacunas de esta mascota.');
        }
        function addPetSection() {
            if (petCount >= 6) {
                showAlert("Máximo 6 mascotas permitidas.", "warning");
                return;
            }

            const container = document.getElementById('petsContainer');
            const index = petCount;

            const petDiv = document.createElement('div');
            petDiv.className = 'pet-section mb-4 p-3 border rounded bg-light position-relative';

            const badgeSpan = document.createElement('span');
            badgeSpan.className = 'badge bg-primary rounded-pill pet-badge';
            badgeSpan.textContent = '#' + (index + 1);
            badgeSpan.style.position = 'absolute';
            badgeSpan.style.top = '12px';
            badgeSpan.style.left = '12px';
            petDiv.appendChild(badgeSpan);

            if (index > 0) {
                const removeBtn = document.createElement('button');
                removeBtn.type = 'button';
                removeBtn.className = 'btn btn-sm btn-outline-danger pet-remove-btn';
                removeBtn.style.position = 'absolute';
                removeBtn.style.top = '8px';
                removeBtn.style.right = '8px';
                removeBtn.onclick = function() { 
                    if (petCount > 1) {
                        petDiv.remove();
                        petCount--;
                        document.getElementById('addPetBtn').disabled = petCount >= 6;

                        // Actualizar contador de requisitos totales si existe
                        if (typeof updateTotalMissingCount === 'function') {
                            setTimeout(updateTotalMissingCount, 100);
                        }
                    }
                };
                removeBtn.innerHTML = '<i class="fas fa-trash-alt"></i>';
                petDiv.appendChild(removeBtn);
            }

            const row1 = document.createElement('div');
            row1.className = 'row mb-3';
            row1.innerHTML = '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label required-field">' +
                '<i class="fas fa-tag me-1"></i> Nombre Mascota' +
                '</label>' +
                '<input type="text" class="form-control form-control-sm" name="pets[' + index + '].petName" required placeholder="Nombre de la mascota">' +
                '</div>' +
                '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label required-field">' +
                '<i class="fas fa-cat me-1"></i> Especie' +
                '</label>' +
                '<select class="form-select form-select-sm" name="pets[' + index + '].petType" required onchange="updatePetBreeds(this, ' + index + ')">' +
                '<option value="">Seleccione...</option>' +
                '<option value="dog">🐕 Canino</option>' +
                '<option value="cat">🐈 Felino</option>' +
                '<option value="bird">🦜 Ave</option>' +
                '<option value="rabbit">🐇 Conejo</option>' +
                '<option value="hamster">🐹 Hámster</option>' +
                '<option value="pig">🐖 Porcino</option>' +
                '<option value="sheep">🐑 Ovino</option>' +
                '<option value="cow">🐄 Bovino</option>' +
                '<option value="horse">🐎 Equino</option>' +
                '<option value="reptile">🦎 Reptil</option>' +
                '<option value="ferret">🐾 Hurón</option>' +
                '<option value="fish">🐠 Pez</option>' +
                '<option value="mink">🦡 Visón</option>' +
                '<option value="other">🐾 Otro</option>' +
                '</select>' +
                '</div>' +
                '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label">' +
                '<i class="fas fa-dna me-1"></i> Raza' +
                '</label>' +
                '<select class="form-select form-select-sm" name="pets[' + index + '].petBreed" id="petBreed_' + index + '">' +
                '<option value="">Seleccione raza...</option>' +
                '</select>' +
                '</div>' +
                '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label">' +
                '<i class="fas fa-palette me-1"></i> Color' +
                '</label>' +
                '<input type="text" class="form-control form-control-sm" name="pets[' + index + '].petColor" placeholder="Color principal">' +
                '</div>';
            petDiv.appendChild(row1);

            const row2 = document.createElement('div');
            row2.className = 'row mb-3';
            row2.innerHTML = '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label">' +
                '<i class="fas fa-venus-mars me-1"></i> Género' +
                '</label>' +
                '<select class="form-select form-select-sm" name="pets[' + index + '].petGender">' +
                '<option value="">Seleccione...</option>' +
                '<option value="male_intact">♂ Macho </option>' +
                '<option value="male_neutered">♂ Macho (Castrado)</option>' +
                '<option value="female_intact">♀ Hembra </option>' +
                '<option value="female_spayed">♀ Hembra (Esterilizada)</option>' +
                '</select>' +
                '</div>' +
                '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label">' +
                '<i class="fas fa-birthday-cake me-1"></i> Fecha Nacimiento' +
                '</label>' +
                '<input type="date" class="form-control form-control-sm" name="pets[' + index + '].petBirthDate">' +
                '</div>' +
                '<div class="col-md-6 col-lg-3 small-input-group">' +
                '<label class="form-label">' +
                '<i class="fas fa-microchip me-1"></i> Microchip (15 dígitos)' +
                '</label>' +
                '<input type="text" class="form-control form-control-sm" name="pets[' + index + '].microchipNumber" placeholder="Ej: 985123456789012">' +
                '</div>' +
                '<div class="col-md-6 col-lg-3"></div>';
            petDiv.appendChild(row2);

            // ✅ SECCIÓN DE REQUERIMIENTOS
            const requirementsSection = document.createElement('div');
            requirementsSection.className = 'requirements-section mt-4 pt-3 border-top';
            requirementsSection.id = 'requirements_' + index;
            requirementsSection.innerHTML = '<h5 class="mb-3" style="color: #dc3545;">' +
                '<i class="fas fa-tasks me-2"></i> Requerimientos del País' +
                '</h5>' +
                '<div class="requirements-container" id="requirementsContainer_' + index + '">' +
                '<div class="alert alert-info small" id="reqMessage_' + index + '">' +
                '<i class="fas fa-info-circle me-1"></i> Seleccione un país destino para ver los requerimientos específicos' +
                '</div>' +
                '</div>';
            petDiv.appendChild(requirementsSection);

            // ✅ CONTAINER DE VACUNAS
            const vacContainer = document.createElement('div');
            vacContainer.id = 'vaccinesContainer_' + index;
            vacContainer.className = 'mt-3';
            petDiv.appendChild(vacContainer);

            container.appendChild(petDiv);
            petCount++;

            // ✅ AGREGAR LISTENER AL NOMBRE DE LA MASCOTA
            const petNameInput = petDiv.querySelector('[name="pets[' + index + '].petName"]');
            if (petNameInput) {
                petNameInput.addEventListener('input', function() {
                    const countryCode = document.getElementById('destinationCountry').value;
                    if (this.value.trim() && countryCode) {
                        updatePetRequirements(index);
                    }
                });
            }

            // ✅ AGREGAR EVENT LISTENER AL SELECT DE ESPECIE
            const speciesSelect = petDiv.querySelector('[name="pets[' + index + '].petType"]');
            if (speciesSelect) {
                // Ya tiene onchange en el HTML para updatePetBreeds
                // Agregamos también el listener para updatePetRequirements
                speciesSelect.addEventListener('change', function() {
                    // updatePetBreeds ya se llama desde el onchange del HTML
                    // Actualizar requisitos basados en la especie
                    setTimeout(() => {
                        updatePetRequirements(index);

                        // También actualizar contador total de requisitos faltantes
                        if (typeof updateTotalMissingCount === 'function') {
                            updateTotalMissingCount();
                        }
                    }, 150);
                });
            }

            // ✅ AGREGAR EVENT LISTENER AL SELECT DE RAZA (por si hay cambios)
            // El select de raza se creará dinámicamente en updatePetBreeds
            // Podemos agregar el listener después de que se cree

            // ✅ SI YA HAY PAÍS SELECCIONADO, ACTUALIZAR REQUERIMIENTOS INMEDIATAMENTE
            const countryCode = document.getElementById('destinationCountry').value;
            if (countryCode) {
                setTimeout(() => {
                    // Primero actualizar razas si hay especie seleccionada
                    if (speciesSelect.value) {
                        // Simular el cambio para actualizar razas
                        updatePetBreeds(speciesSelect, index);
                    }

                    // Luego actualizar requisitos
                    updatePetRequirements(index);

                    // Actualizar contador total
                    if (typeof updateTotalMissingCount === 'function') {
                        updateTotalMissingCount();
                    }
                }, 100);
            }

            if (petCount >= 6) {
                document.getElementById('addPetBtn').disabled = true;
            }

            return index;
        }        
        function removePetSection(button) {
            if (petCount <= 1) return;
            const section = button.closest('.pet-section');
            if (section) {
                section.remove();
                petCount--;
                document.getElementById('addPetBtn').disabled = petCount >= 6;
            }
        }        
        function updateCities() {
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
        function updatePetBreeds(selectElement, index) {
            const species = selectElement.value;

            // Buscar select de raza por ID
            let breedSelect = document.getElementById('petBreed_' + index);

            // Si no lo encuentra, buscar por nombre
            if (!breedSelect) {
                breedSelect = document.querySelector('select[name="pets[' + index + '].petBreed"]');

                // Si lo encuentra pero no tiene ID, asignarle uno
                if (breedSelect && !breedSelect.id) {
                    breedSelect.id = 'petBreed_' + index;
                }
            }

            if (!breedSelect) {
                return;
            }

            // Limpiar opciones actuales
            breedSelect.innerHTML = '';

            // Opción por defecto
            const defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.textContent = 'Seleccione raza...';
            breedSelect.appendChild(defaultOption);

            // Llenar con razas según especie
            if (species && breedsBySpecies[species]) {
                const breeds = breedsBySpecies[species];

                for (let i = 0; i < breeds.length; i++) {
                    const breed = breeds[i];
                    const option = document.createElement('option');
                    option.value = breed.toLowerCase().replace(/ /g, '_');
                    option.textContent = breed;
                    breedSelect.appendChild(option);
                }

                // Opción "Otra raza"
                const otherOption = document.createElement('option');
                otherOption.value = 'other_breed';
                otherOption.textContent = 'Otra raza no listada';
                breedSelect.appendChild(otherOption);
            }
        }        
        function toggleCarrierSection() {
            const carrierSection = document.getElementById('carrierSection');
            const checkbox = document.getElementById('useCarrier');
            carrierSection.style.display = checkbox.checked ? 'block' : 'none';
        }        
        function validateReturnDate() {
            const travelDateInput = document.getElementById('travelDate');
            const returnDateInput = document.getElementById('regresoDate');
            const returnFlag = document.getElementById('returnFlag');
            const travelDurationAlert = document.getElementById('travelDurationAlert');
            const travelDuration = document.getElementById('travelDuration');
            const longStayWarning = document.getElementById('longStayWarning');
            const submitBtn = document.getElementById('submitBtn');
            const countrySelect = document.getElementById('destinationCountry');
            const selectedCountry = countrySelect.value;

            let returnWarning = document.getElementById('returnWarning');
            if (!returnWarning) {
                const warningDiv = document.createElement('div');
                warningDiv.id = 'returnWarning';
                warningDiv.className = 'alert alert-warning mt-2';
                warningDiv.style.display = 'none';
                returnDateInput.parentNode.parentNode.appendChild(warningDiv);
                returnWarning = warningDiv;
            }

            returnFlag.style.display = 'none';
            returnWarning.style.display = 'none';
            travelDurationAlert.style.display = 'none';
            returnDateInput.classList.remove('is-invalid', 'is-valid', 'return-error', 'return-valid');

            if (!travelDateInput.value || !returnDateInput.value) return;

            const travelDate = new Date(travelDateInput.value);
            const returnDate = new Date(returnDateInput.value);

            if (returnDate <= travelDate) {
                returnFlag.style.display = 'inline';
                returnWarning.style.display = 'block';
                returnWarning.innerHTML = '<i class="fas fa-exclamation-triangle text-danger"></i> La fecha de regreso debe ser posterior a la fecha de ida';
                returnDateInput.classList.add('is-invalid', 'return-error');
                if (submitBtn) submitBtn.disabled = true;
                return;
            }

            const timeDiff = returnDate.getTime() - travelDate.getTime();
            const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
            travelDuration.textContent = daysDiff + ' días';
            travelDurationAlert.style.display = 'block';

            const countryLimit = countryStayLimits[selectedCountry];
            if (countryLimit) {
                if (daysDiff > countryLimit.maxDays) {
                    returnFlag.style.display = 'inline';
                    returnWarning.style.display = 'block';
                    returnWarning.innerHTML = '<i class="fas fa-ban text-danger"></i> <strong>NO PERMITIDO:</strong> ' + countryLimit.message + '. La estancia de ' + daysDiff + ' días excede el límite de ' + countryLimit.maxDays + ' días permitidos.<br><small>Seleccione una fecha de regreso dentro del período permitido.</small>';
                    returnDateInput.classList.add('is-invalid', 'return-error');
                    if (submitBtn) submitBtn.disabled = true;
                } else {
                    returnDateInput.classList.add('is-valid', 'return-valid');
                    if (daysDiff > (countryLimit.maxDays * 0.8)) {
                        longStayWarning.style.display = 'block';
                    } else {
                        longStayWarning.style.display = 'none';
                    }
                    if (submitBtn) submitBtn.disabled = false;
                }
            } else {
                const defaultLimit = 30;
                if (daysDiff > defaultLimit) {
                    returnFlag.style.display = 'inline';
                    returnWarning.style.display = 'block';
                    returnWarning.innerHTML = '<i class="fas fa-exclamation-triangle text-warning"></i> Para estadías mayores a ' + defaultLimit + ' días, consulte los requisitos específicos del país de destino';
                    returnDateInput.classList.add('is-warning');
                } else {
                    if (submitBtn) submitBtn.disabled = false;
                }
            }
        }        
        function showReturnInfo() {
            const countrySelect = document.getElementById('destinationCountry');
            const selectedCountry = countrySelect.value;
            const countryText = countrySelect.options[countrySelect.selectedIndex].text;

            const modalHtml = `
                <div class="modal fade" id="returnInfoModal" tabindex="-1" aria-labelledby="returnInfoModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header bg-primary text-white">
                                <h5 class="modal-title" id="returnInfoModalLabel">
                                    <i class="fas fa-info-circle me-2"></i>Información sobre Límites de Estancia
                                </h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="countrySpecificReturnInfo"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            if (!document.getElementById('returnInfoModal')) {
                document.body.insertAdjacentHTML('beforeend', modalHtml);
            }

            const modalElement = document.getElementById('returnInfoModal');
            const countrySpecificInfo = document.getElementById('countrySpecificReturnInfo');
            const countryLimit = countryStayLimits[selectedCountry];

            if (countryLimit) {
                let statusHtml = '';
                if (countryLimit.requiresReturnForm) {
                    statusHtml = '<div class="alert alert-info mt-3"><h6><i class="fas fa-file-contract me-2"></i>Formulario de Regreso Requerido:</h6><ul class="mb-0"><li>Límite de estancia: ' + countryLimit.maxDays + ' días</li><li>Regreso después de ' + countryLimit.maxDays + ' días requiere nuevo formulario</li><li>' + countryLimit.message + '</li></ul></div>';
                } else {
                    statusHtml = '<div class="alert alert-success mt-3"><h6><i class="fas fa-check-circle me-2"></i>Sin Restricciones de Regreso:</h6><ul class="mb-0"><li>Límite de estancia: ' + countryLimit.maxDays + ' días</li><li>No se requiere formulario separado para el regreso</li><li>' + countryLimit.message + '</li></ul></div>';
                }
                if (countrySpecificInfo) countrySpecificInfo.innerHTML = statusHtml;
            } else {
                const warningHtml = '<div class="alert alert-warning mt-3"><h6><i class="fas fa-exclamation-triangle me-2"></i>Verificar Requisitos:</h6><p>Para ' + countryText + ', no tenemos información específica de límites de estancia.</p><p class="mb-0">Se recomienda:</p><ul class="mb-0"><li>Consultar con la embajada o consulado del país</li><li>Verificar regulaciones específicas para mascotas</li><li>Confirmar requisitos de regreso</li></ul></div>';
                if (countrySpecificInfo) countrySpecificInfo.innerHTML = warningHtml;
            }

            const modal = new bootstrap.Modal(modalElement);
            modal.show();
        }                        
        function updateArrivalPoints() {
            const travelType = document.getElementById('travelType').value;
            const arrivalPlace = document.getElementById('arrivalPlace');
            if (travelType) {
                arrivalPlace.disabled = false;
                switch(travelType) {
                    case 'airplane_cabin':
                    case 'airplane_cargo':
                        arrivalPlace.placeholder = 'Ej: Aeropuerto Madrid-Barajas T4';
                        break;
                    case 'car':
                        arrivalPlace.placeholder = 'Ej: Frontera de Irún-Hendaya';
                        break;
                    case 'ship':
                        arrivalPlace.placeholder = 'Ej: Puerto de Barcelona';
                        break;
                    case 'train':
                        arrivalPlace.placeholder = 'Ej: Estación de Atocha, Madrid';
                        break;
                    default:
                        arrivalPlace.placeholder = 'Especifique punto exacto de llegada';
                }
            } else {
                arrivalPlace.disabled = true;
                arrivalPlace.placeholder = 'Primero seleccione tipo de transporte';
            }
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
        //Nuevas
        function updateCountryInfo() {
            const countrySelect = document.getElementById('destinationCountry');
            const countryCode = countrySelect.value;

            const container = document.getElementById('countryInfoContainer');

            // 1️⃣ Sin país seleccionado → ocultar
            if (!countryCode) {
                if (container) container.style.display = 'none';
                return;
            }

            // 2️⃣ Obtener nombre de variable JS esperada
            const variableName = getCountryVariableName(countryCode);

            // 3️⃣ Si el objeto YA está cargado → usarlo
            if (window[variableName]) {
                continueUpdateCountryInfo(countrySelect, countryCode);
                return;
            }

            // 4️⃣ Obtener nombre de archivo (SOLO si existe)
            const fileCode = getCountryFileCode(countryCode);

            // ❌ Si no hay JSON definido para ese país → NO INVENTAR DATOS
            if (!fileCode) {
                console.warn('[PetTravel] País sin JSON definido:', countryCode);
                if (container) container.style.display = 'none';
                return;
            }

            // 5️⃣ Cargar script dinámicamente
            loadCountryScript(fileCode)
                .then(() => {
                    // 6️⃣ Verificar que el JSON realmente exista
                    if (window[variableName]) {
                        continueUpdateCountryInfo(countrySelect, countryCode);
                    } else {
                        console.warn('[PetTravel] Script cargado pero sin variable:', variableName);
                        if (container) container.style.display = 'none';
                    }
                })
                .catch((error) => {
                    console.error('[PetTravel] Error cargando JSON país:', countryCode, error);
                    if (container) container.style.display = 'none';
                });
        }
        // Función para cargar archivos de país dinámicamente
        function loadCountryScript(countryFileName) {
            return new Promise((resolve, reject) => {
                const variableName = countryFileName
                    .split('_')
                    .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
                    .join('') + 'PetTravelForm';

                // ✅ VERIFICAR SI YA ESTÁ CARGADO
                if (window[variableName]) {
                    resolve();
                    return;
                }

                // ✅ VERIFICAR SI EL SCRIPT YA SE CARGÓ PREVIAMENTE
                const existingScript = document.querySelector(`script[src*="${countryFileName}.js"]`);
                if (existingScript) {
                    resolve();
                    return;
                }

                const script = document.createElement('script');
                script.src = window.contextPath + '/js/country-requirements/countries/' + countryFileName + '.js';

                let loaded = false;
                const timeoutId = setTimeout(() => {
                    if (!loaded) {
                        script.remove();
                        reject(new Error('Timeout loading ' + countryFileName));
                    }
                }, 5000);

                script.onload = () => {
                    clearTimeout(timeoutId);
                    loaded = true;

                    // Esperar a que la variable esté disponible
                    const checkInterval = setInterval(() => {
                        if (window[variableName]) {
                            clearInterval(checkInterval);
                            resolve();
                        }
                    }, 100);

                    setTimeout(() => {
                        if (!window[variableName]) {
                            clearInterval(checkInterval);
                            resolve(); // Resolver de todos modos
                        }
                    }, 3000);
                };

                script.onerror = () => {
                    clearTimeout(timeoutId);
                    loaded = true;
                    reject(new Error('Failed to load script ' + countryFileName));
                };

                document.head.appendChild(script);
            });
        }
        function updateHiddenCountryFields(countryData) {
            document.getElementById('countryFormModel').value = countryData.formModel || '';
            document.getElementById('countryEndorsementRequired').value = countryData.endorsementRequired || '';
        }
        // Mover el contenido original a una función separada
        function continueUpdateCountryInfo(countrySelect, countryCode) {
            // Crear/obtener contenedor
            let countryInfoContainer = document.getElementById('countryInfoContainer');
            if (!countryInfoContainer) {
                const travelSection = document.querySelector('.form-section');
                if (!travelSection) return;

                countryInfoContainer = document.createElement('div');
                countryInfoContainer.id = 'countryInfoContainer';
                countryInfoContainer.className = 'mt-3 p-3 border rounded bg-light';
                travelSection.appendChild(countryInfoContainer);
            }

            const container = countryInfoContainer;

            // OBTENER DATOS DEL PAÍS
            let countryData = null;

            // Buscar variable del país
            const variableName = getCountryVariableName(countryCode);
            
            if (window[variableName]) {
                
                countryData = window[variableName];
            }

            // Si no se encontró, intentar desde petTravelDB
            if (!countryData && window.petTravelDB) {
                
                const dbData = window.petTravelDB.getCountry(countryCode);
                if (dbData) {
                    
                    countryData = {
                        countryCode: dbData.countryCode || countryCode,
                        countryName: dbData.countryName,
                        acceptsDigitalSignature: dbData.acceptsDigitalSignature,
                        isBlacklisted: dbData.isBlacklisted,
                        daysBeforeTravelForForm: dbData.daysBeforeTravelForForm,
                        requirements: dbData.requirements || []
                    };
                }
            }

            // Si todavía no hay datos, usar valores por defecto
            if (!countryData) {
                container.innerHTML = '';
                container.style.display = 'none';
                console.warn('[PetTravel] País sin JSON:', countryCode);
                return;
            }          
            let html = '<h6 class="mb-3"><i class="fas fa-info-circle me-2 text-primary"></i>';
            html += 'Información para ' + countryData.countryName + '</h6>';
            html += '<div class="row">';

            // Tarjeta 1: Firma Digital - USAR VALOR REAL
            html += '<div class="col-md-3">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-signature me-1"></i> Firma Digital</h6>';
            html += '<p class="card-text">';
            const firmaDigital = typeof countryData.acceptsDigitalSignature === 'boolean' ? countryData.acceptsDigitalSignature : null;
            html += firmaDigital === null ? '<strong>No especificado</strong>' : '<strong>' + (firmaDigital ? '✅ Acepta' : '❌ No acepta') + '</strong>';
            html += '<br>';
            html += '<small>' + (firmaDigital ? 
                'Se puede usar firma digital en los documentos' : 
                'Se requiere firma física del veterinario') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 2: Lista Negra - USAR VALOR REAL
            html += '<div class="col-md-3">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-ban me-1"></i> Lista Negra</h6>';
            html += '<p class="card-text">';
            const listaNegra = typeof countryData.isBlacklisted === 'boolean' ? countryData.isBlacklisted : null;
            html += listaNegra === null ? '<strong>No especificado</strong>' : '<strong>' + (listaNegra ? '✅ Está en Lista Negra' : '❌ No está en Lista Negra') + '</strong>';            
            html += '<br>';
            html += '<small>' + (listaNegra ? 
                'Requiere trámites adicionales y cuarentena' : 
                'No tiene restricciones especiales') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 3: Endorsement Required (NUEVO)
            html += '<div class="col-md-3">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-stamp me-1"></i> Endorsement</h6>';
            html += '<p class="card-text">';
            const endorsementReq = countryData.endorsementRequired;
            html += endorsementReq === true ? '<strong>✅ Requerido</strong>' : 
                    endorsementReq === false ? '<strong>❌ No requerido</strong>' : 
                    '<strong>No especificado</strong>';
            html += '<br>';
            html += '<small>' + (endorsementReq ? 
                'El documento requiere sello oficial' : 
                'No requiere sello oficial adicional') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 4: Modelo de Formulario (NUEVO)
            html += '<div class="col-md-3">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-file-alt me-1"></i> Modelo</h6>';
            html += '<p class="card-text">';
            const modelo = countryData.formModel;
            html += '<strong>' + (modelo ? modelo : 'No especificado') + '</strong>';
            html += '<br>';
            html += '<small>' + (modelo === 'OCVI' ? 
                'Formulario oficial UE' : 
                modelo === 'APHIS7001' ? 'Formulario USDA' : 'Verificar con autoridad') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Segunda fila de tarjetas
            html += '</div><div class="row mt-3">';

            // Tarjeta 5: Tiempo de Trámite
            html += '<div class="col-md-4">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-calendar-alt me-1"></i> Tiempo de Trámite</h6>';
            html += '<p class="card-text">';
            const days = typeof countryData.daysBeforeTravelForForm === 'number' ? countryData.daysBeforeTravelForForm : 'No especificado';
            html += '<strong>' + days + ' días antes</strong>';
            html += '<br>';
            html += '<small>Debe realizar el trámite con esta antelación al viaje</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 6: Días de Validez Certificado (SOLO INFORMATIVA)
            html += '<div class="col-md-3">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-calendar-check me-1"></i> Validez Certificado</h6>';
            html += '<p class="card-text">';

            // Manejar diferentes casos de certificateValidityDays
            const validityDays = countryData.certificateValidityDays;

            if (validityDays === null || validityDays === undefined || validityDays === '') {
                // Si está vacío o no definido
                html += '<strong>No especificado</strong>';
                html += '<br>';
                html += '<small>Verificar con autoridades</small>';
            } else if (typeof validityDays === 'number' || !isNaN(validityDays)) {
                // Si es un número
                const daysNum = Number(validityDays);
                html += '<strong>' + daysNum + ' días</strong>';
                html += '<br>';
                html += '<small>Duración oficial del certificado</small>';
            } else if (typeof validityDays === 'string') {
                // Si es un string
                html += '<strong>' + validityDays + '</strong>';
                html += '<br>';
                html += '<small>Validez del certificado</small>';
            } else {
                // Cualquier otro caso
                html += '<strong>No disponible</strong>';
                html += '<br>';
                html += '<small>Consultar información</small>';
            }

            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 7: Países de Tránsito (NUEVO)
            html += '<div class="col-md-4">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-route me-1"></i> Tránsito</h6>';
            html += '<p class="card-text">';
            const transitCountries = countryData.transitCountries;
            html += transitCountries === true ? '<strong>⚠️ Requiere trámite</strong>' : 
                    transitCountries === false ? '<strong>✅ No requiere</strong>' : 
                    '<strong>No especificado</strong>';
            html += '<br>';
            html += '<small>' + (transitCountries ? 
                'Puede necesitar permisos para países de tránsito' : 
                'Sin trámites de tránsito especiales') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            html += '<div class="col-md-3">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-info-circle me-1"></i> Observaciones</h6>';
            html += '<p class="card-text">';
            html += '<small>';

            // Alerta si está en lista negra
            if (countryData.isBlacklisted) {
                html += '<div class="alert alert-danger mt-3" id="blacklistWarning">';
                html += '<h6><i class="fas fa-exclamation-triangle me-2"></i>ATENCIÓN: País en Lista Negra</h6>';
                html += '<p class="mb-2">Este país está en la lista negra de los Estados Unidos. Para el regreso de su mascota necesita:</p>';
                html += '<ul class="mb-2">';
                html += '<li>Documentación de entrada a EE.UU. (Formulario APHIS 7001)</li>';
                html += '<li>Vacunas antirrábicas válidas de los últimos 3 años</li>';
                html += '<li>Cuarentena posible al regreso</li>';
                html += '</ul>';
                html += '<p class="mb-0"><strong>Estos datos son necesarios para poder regresar con su mascota a USA.</strong></p>';
                html += '</div>';
            }

            // CAMPOS DINÁMICOS ADICIONALES
            html += '<div id="additionalCountryFields" class="mt-3">';
            // Aquí se agregarán campos dinámicamente según las necesidades
            html += '</div>';

            // ⭐⭐ CIERRA LOS ELEMENTOS DE LA TARJETA ⭐⭐
            html += '</small>';
            html += '</p>';
            html += '</div>';  // Cierra card-body
            html += '</div>';  // Cierra card
            html += '</div>';  // Cierra col-md-3

            // ⭐⭐ CIERRA EL ROW ⭐⭐
            html += '</div>';  // Cierra el <div class="row mt-3">

            container.innerHTML = html;
            loadAdditionalCountryFields(countryData);
            container.style.display = 'block';
            
            const countryFieldsContainer = document.getElementById('countryFieldsContainer');
            if (countryFieldsContainer) {
                countryFieldsContainer.style.display = 'none';
            }
            updateCountrySpecificFields(countryData);
        }
        function loadAdditionalCountryFields(countryData) {
            const container = document.getElementById('additionalCountryFields');
            if (!container) return;

            let fieldsHtml = '';

            // Campo para países de tránsito (si transitCountries es true)
            if (countryData.transitCountries === true) {
                fieldsHtml += '<div class="mt-3">';
                fieldsHtml += '<h6><i class="fas fa-plane me-2"></i>Países de Tránsito</h6>';
                fieldsHtml += '<div class="alert alert-warning">';
                fieldsHtml += '<p><strong>Información importante:</strong> Este destino requiere gestionar permisos para países de tránsito. Por favor liste todos los países por los que transitará antes de llegar a su destino.</p>';
                fieldsHtml += '</div>';
                fieldsHtml += '<label class="form-label">Países de tránsito (separe con comas):</label>';
                fieldsHtml += '<textarea class="form-control" id="transitCountries" name="transitCountries" ';
                fieldsHtml += 'rows="3" placeholder="Ej: España, Francia, Alemania">';
                fieldsHtml += (countryData.transitCountriesList ? countryData.transitCountriesList.join(', ') : '') + '</textarea>';
                fieldsHtml += '<small class="text-muted">Ingrese todos los países por los que transitará antes de llegar al destino principal.</small>';
                fieldsHtml += '</div>';
            }

            // Campos especiales para países en lista negra
            if (countryData.isBlacklisted === true) {
                fieldsHtml += '<div class="mt-3">';
                fieldsHtml += '<h6><i class="fas fa-syringe me-2 text-danger"></i>Vacunas Antirrábicas para Regreso a USA</h6>';

                fieldsHtml += '<div class="alert alert-info mb-3">';
                fieldsHtml += '<p><strong>Requisito para regreso a EE.UU.:</strong> Para países en lista negra, debe tener registro de las vacunas antirrábicas aplicadas en los últimos 3 años.</p>';
                fieldsHtml += '</div>';

                // Campo para información de vacunas de los últimos 3 años
                fieldsHtml += '<label class="form-label required-field">Historial de Vacunas Antirrábicas (últimos 3 años):</label>';
                fieldsHtml += '<textarea class="form-control" id="rabiesVaccineHistory" name="rabiesVaccineHistory" ';
                fieldsHtml += 'rows="4" required placeholder="Detalle todas las vacunas antirrábicas aplicadas en los últimos 3 años, incluyendo fechas, números de lote y clínica">';
                fieldsHtml += '</textarea>';
                fieldsHtml += '<small class="text-muted">Ej: 15/03/2022 - Rabisin, Lote: RB2022-001, Clínica Veterinaria Central...</small>';

                // Campo para fecha estimada de retorno
                fieldsHtml += '<div class="row mt-3">';
                fieldsHtml += '<div class="col-md-6">';
                fieldsHtml += '<label class="form-label required-field">Fecha estimada de retorno a EE.UU.:</label>';
                fieldsHtml += '<input type="date" class="form-control" id="estimatedReturnDate" name="estimatedReturnDate" required>';
                fieldsHtml += '</div>';
                fieldsHtml += '</div>';

                // Recordatorio importante
                fieldsHtml += '<div class="alert alert-warning mt-3">';
                fieldsHtml += '<i class="fas fa-info-circle me-2"></i>';
                fieldsHtml += '<strong>Importante:</strong> Esta información es necesaria para el proceso de regreso a Estados Unidos. Mantenga estos documentos durante su viaje.';
                fieldsHtml += '</div>';

                fieldsHtml += '</div>';
            }

            // Si hay modelo específico, mostrarlo
            if (countryData.formModel) {
                fieldsHtml += '<div class="mt-3">';
                fieldsHtml += '<div class="alert alert-secondary">';
                fieldsHtml += '<i class="fas fa-file-contract me-2"></i>';
                fieldsHtml += '<strong>Modelo de documento:</strong> Se utilizará el formulario <strong>' + countryData.formModel + '</strong> para este destino.';
                if (countryData.formModel === 'APHIS7001') {
                    fieldsHtml += '<div class="mt-2"><small>Este formulario es requerido por el USDA para la exportación de animales.</small></div>';
                } else if (countryData.formModel === 'OCVI') {
                    fieldsHtml += '<div class="mt-2"><small>Certificado Veterinario Internacional oficial para la Unión Europea.</small></div>';
                }
                fieldsHtml += '</div>';
                fieldsHtml += '</div>';
            }

            container.innerHTML = fieldsHtml;

            // Establecer fecha mínima para el retorno (hoy + 1 día)
            if (countryData.isBlacklisted) {
                const today = new Date();
                today.setDate(today.getDate() + 1);
                const minDate = today.toISOString().split('T')[0];
                const returnDateInput = document.getElementById('estimatedReturnDate');
                if (returnDateInput) {
                    returnDateInput.min = minDate;
                }
            }
        }
        // Función auxiliar para obtener nombre de archivo
        function getCountryFileCode(countryCode) {
            // Si tienes el objeto CountryCodeMap, usarlo
            if (window.CountryCodeMap && window.CountryCodeMap[countryCode]) {
                return window.CountryCodeMap[countryCode];
            }
            console.warn('[PetTravel] No hay JSON para el país:', countryCode);
            return null;
        }
        // También para mostrar información de cualquier país del DB
        function showGeneralCountryInfo(countryCode) {
            const countryData = window.petTravelDB ? window.petTravelDB.getCountry(countryCode) : null;

            if (!countryData) return;

            const container = document.getElementById('countryInfoContainer') || document.createElement('div');

            if (!container.id) {
                container.id = 'countryInfoContainer';
                container.className = 'mt-3 p-3 border rounded bg-light';
                document.querySelector('.form-section').appendChild(container);
            }

            let html = '<h6 class="mb-3"><i class="fas fa-info-circle me-2 text-primary"></i>';
            html += 'Información para ' + (countryData.countryName || 'el país seleccionado') + '</h6>';
            html += '<div class="row">';

            // Tarjeta 1: Firma Digital
            html += '<div class="col-md-4">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-signature me-1"></i> Firma Digital</h6>';
            html += '<p class="card-text">';
            html += '<strong>' + (countryData.acceptsDigitalSignature ? '✅ Acepta' : '❌ No acepta') + '</strong>';
            html += '<br>';
            html += '<small>' + (countryData.acceptsDigitalSignature ? 
                'Se puede usar firma digital en los documentos' : 
                'Se requiere firma física del veterinario') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 2: Lista Negra
            html += '<div class="col-md-4">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-ban me-1"></i> Lista Negra</h6>';
            html += '<p class="card-text">';
            html += '<strong>' + (countryData.isBlacklisted ? '⚠️ En lista negra' : '✅ No está en lista negra') + '</strong>';
            html += '<br>';
            html += '<small>' + (countryData.isBlacklisted ? 
                'Requiere trámites adicionales y cuarentena' : 
                'No tiene restricciones especiales') + '</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            // Tarjeta 3: Tiempo de Trámite
            html += '<div class="col-md-4">';
            html += '<div class="card h-100">';
            html += '<div class="card-body">';
            html += '<h6 class="card-title"><i class="fas fa-calendar-alt me-1"></i> Tiempo de Trámite</h6>';
            html += '<p class="card-text">';
            const days = typeof countryData.daysBeforeTravelForForm === 'number' ? countryData.daysBeforeTravelForForm : 'No especificado';
            html += '<strong>' + days + ' días antes</strong>';
            html += '<br>';
            html += '<small>Debe realizar el trámite con esta antelación al viaje</small>';
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '</div>';

            html += '</div>';

            if (countryData.isBlacklisted) {
                html += '<div class="alert alert-danger mt-3">';
                html += '<i class="fas fa-exclamation-triangle me-2"></i>';
                html += 'Este país tiene restricciones especiales. Contacte con la embajada para más información.';
                html += '</div>';
            }

            container.innerHTML = html;
            container.style.display = 'block';
        }
        function updatePetRequirements(petIndex) {
            const countrySelect = document.getElementById('destinationCountry');
            const countryCode = countrySelect.value;

            if (!countryCode) {
                const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
                const reqMessage = document.getElementById('reqMessage_' + petIndex);

                if (reqContainer) {
                    reqContainer.innerHTML = '';
                    if (reqMessage) {
                        reqMessage.innerHTML = '<i class="fas fa-info-circle me-1"></i> Seleccione un país destino';
                        reqMessage.style.display = 'block';
                    }
                }
                return;
            }

            // Obtener datos del país/estado
            const variableName = getCountryVariableName(countryCode);
            let countryData = window[variableName];

            // Obtener la especie de la mascota
            const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].petType"]');
            const petType = petTypeSelect ? petTypeSelect.value : '';

            // Mapear los valores del select a valores para appliesTo
            const speciesMap = {
                'dog': 'dog',
                'cat': 'cat',
                'bird': 'bird',
                'rabbit': 'rabbit',
                'hamster': 'small_mammal',
                'pig': 'pig',
                'sheep': 'livestock',
                'cow': 'livestock',
                'horse': 'horse',
                'reptile': 'reptile',
                'ferret': 'ferret',
                'fish': 'fish',
                'mink': 'Visón',
                'other': 'other'
            };

            const currentSpecies = speciesMap[petType] || 'other';

            const reqContainer = document.getElementById('requirementsContainer_' + petIndex);
            const reqMessage = document.getElementById('reqMessage_' + petIndex);

            if (!reqContainer) return;

            reqContainer.innerHTML = '';
            if (reqMessage) reqMessage.style.display = 'none';

            const countryName = countrySelect.options[countrySelect.selectedIndex].text;
            const petNameInput = document.querySelector('[name="pets[' + petIndex + '].petName"]');
            const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);

            let html = '<div class="country-requirements">';
            html += '<h6 class="text-primary border-bottom pb-2 mb-3">';
            html += '<i class="fas fa-flag me-2"></i>';
            html += (countryData && countryData.countryName ? countryData.countryName : countryName) + ' - Requisitos para ' + petName;
            html += '</h6>';

            if (!countryData || !countryData.requirements || countryData.requirements.length === 0) {
                html += '<div class="alert alert-info">';
                html += '<i class="fas fa-info-circle me-2"></i>';
                html += 'No hay requisitos específicos disponibles para este país.';
                html += '</div>';
            } else {
                // Filtrar requisitos por especie
                const filteredRequirements = countryData.requirements.filter(req => {
                    // Si no tiene appliesTo, mostrar para todos
                    if (!req.appliesto) return true;

                    // Si appliesTo es 'all', mostrar para todos
                    if (req.appliesto === 'all') return true;

                    // Si appliesTo es un array, verificar si incluye la especie actual
                    if (Array.isArray(req.appliesto)) {
                        return req.appliesto.includes(currentSpecies) || 
                               req.appliesto.includes('all');
                    }

                    // Si appliesTo es string, comparar
                    if (typeof req.appliesto === 'string') {
                        return req.appliesto === currentSpecies || 
                               req.appliesto === 'all';
                    }

                    return true;
                });

                // También incluir requisitos generales (sin appliesTo específico)
                const generalRequirements = countryData.requirements.filter(req => !req.appliesto);
                const allReqs = [...new Set([...filteredRequirements, ...generalRequirements])];

                if (allReqs.length === 0) {
                    html += '<div class="alert alert-info">';
                    html += '<i class="fas fa-info-circle me-2"></i>';
                    html += 'No hay requisitos específicos para ' + getSpeciesName(petType) + ' en este destino.';
                    html += '</div>';
                } else {
                    const required = [];
                    const optional = [];

                    for (let i = 0; i < allReqs.length; i++) {
                        const req = allReqs[i];
                        if (req.required === true) {
                            required.push(req);
                        } else {
                            optional.push(req);
                        }
                    }

                    if (required.length > 0) {
                        html += '<div class="mb-4">';
                        html += '<strong class="text-danger d-block mb-2">';
                        html += '<i class="fas fa-exclamation-circle me-1"></i> REQUISITOS OBLIGATORIOS PARA ' + getSpeciesName(petType).toUpperCase();
                        html += '</strong>';
                        html += '<div class="ps-3">';

                        for (let i = 0; i < required.length; i++) {
                            html += createRequirementCheckbox(required[i], petIndex, true);
                        }

                        html += '</div>';
                        html += '</div>';
                    }

                    if (optional.length > 0) {
                        html += '<div class="mb-4">';
                        html += '<strong class="text-info d-block mb-2">';
                        html += '<i class="fas fa-check-circle me-1"></i> RECOMENDACIONES PARA ' + getSpeciesName(petType).toUpperCase();
                        html += '</strong>';
                        html += '<div class="ps-3">';

                        for (let i = 0; i < optional.length; i++) {
                            html += createRequirementCheckbox(optional[i], petIndex, false);
                        }

                        html += '</div>';
                        html += '</div>';
                    }
                }
            }

            html += '</div>';
            reqContainer.innerHTML = html;

            initializeRequirementCheckboxes(petIndex);
        }
        // Función auxiliar para obtener nombre legible de la especie
        function getSpeciesName(speciesCode) {
            const speciesNames = {
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
                'mink': 'Visón',
                'other': 'Otras mascotas'
            };
            return speciesNames[speciesCode] || 'Mascotas';
        }
        function createRequirementCheckbox(requirement, petIndex, isRequired) {
            const requirementId = 'req_' + petIndex + '_' + requirement.id;

            // Obtener la especie de la mascota para mostrar contexto
            const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].petType"]');
            const petType = petTypeSelect ? petTypeSelect.value : '';

            let html = '<div class="requirement-item mb-2 p-2 border rounded ';
            html += isRequired ? 'border-danger border-start border-5' : 'border-info';
            html += '" id="req_item_' + petIndex + '_' + requirement.id + '">';

            // Mostrar icono de especie si aplica solo a ciertas especies
            if (requirement.appliesto && requirement.appliesto !== 'all') {
                html += '<div class="small mb-1">';
                html += '<i class="fas fa-paw me-1 text-muted"></i>';
                html += '<span class="text-muted">Aplica para: ' + formatAppliesto(requirement.appliesto) + '</span>';
                html += '</div>';
            }

            html += '<div class="form-check">';
            html += '<input type="checkbox" class="form-check-input requirement-checkbox" id="' + requirementId + '"';
            html += 'data-pet-index="' + petIndex + '"';
            html += 'data-req-id="' + requirement.id + '"';
            html += 'data-req-type="' + requirement.type + '"';
            html += 'data-req-name="' + requirement.name + '"';
            html += 'data-req-desc="' + requirement.description + '"';
            html += 'data-req-appliesto="' + (Array.isArray(requirement.appliesto) ? requirement.appliesto.join(',') : requirement.appliesto || 'all') + '"';
            // NUEVO: Indicar si tiene campos dinámicos
            html += 'data-has-form-fields="' + (requirement.formFields ? 'true' : 'false') + '"';

            // IMPORTANTE: Usar la MISMA función para todos los checkboxes
            html += 'onchange="toggleRequirementWithFields(this, ' + petIndex + ')"';

            html += '>';
            html += '<label class="form-check-label" for="' + requirementId + '">';
            html += '<strong>' + requirement.name + '</strong>';

            if (isRequired) {
                html += ' <span class="text-danger">*</span>';
            }

            html += '<div class="small text-muted">' + requirement.description + '</div>';

            // Mostrar icono si tiene campos dinámicos
            if (requirement.formFields) {
                html += '<div class="small text-primary mt-1"><i class="fas fa-file-medical me-1"></i> Requiere detalles adicionales</div>';
            }

            // Mostrar detalles específicos si existen
            if (requirement.details) {
                html += '<div class="small mt-1"><strong>Detalles:</strong> ' + requirement.details + '</div>';
            }

            if (requirement.deadline) {
                html += '<div class="small mt-1"><i class="fas fa-calendar me-1"></i><strong>Plazo:</strong> ' + requirement.deadline + '</div>';
            }

            html += '</label>';
            html += '</div>';

            // CONTENEDOR PARA CAMPOS DINÁMICOS (oculto inicialmente)
            html += '<div class="requirement-fields-container mt-3" id="req_fields_' + petIndex + '_' + requirement.id + '" style="display: none;">';
            html += '</div>';

            html += '</div>';

            return html;
        }
        function toggleRequirementWithFields(checkbox, petIndex) {
            const reqId = checkbox.getAttribute('data-req-id');
            const hasFormFields = checkbox.getAttribute('data-has-form-fields') === 'true';
            const isChecked = checkbox.checked;

            const fieldsContainer = document.getElementById('req_fields_' + petIndex + '_' + reqId);
            const requirementItem = document.getElementById('req_item_' + petIndex + '_' + reqId);

            // 1. Manejar presupuesto (como antes)
            if (window.toggleRequiredRequirement) {
                window.toggleRequiredRequirement(checkbox);
            }

            // 2. Manejar campos dinámicos si los tiene
            if (hasFormFields && isChecked) {
                // Obtener datos completos del requisito
                const countryCode = document.getElementById('destinationCountry').value;
                const variableName = getCountryVariableName(countryCode);
                const countryData = window[variableName];

                if (!countryData) return;

                const requirement = countryData.requirements.find(r => r.id === reqId);

                if (!requirement || !requirement.formFields) return;

                // Mostrar campos
                fieldsContainer.style.display = 'block';
                generateFormFieldsFromConfig(petIndex, reqId, requirement);

                // Agregar clase visual
                requirementItem.classList.add('requirement-with-fields');

            } else if (hasFormFields && !isChecked) {
                // Ocultar campos
                fieldsContainer.style.display = 'none';
                fieldsContainer.innerHTML = '';
                requirementItem.classList.remove('requirement-with-fields');
            }
        }
        function updateCountrySpecificFields(countryData) {
            const container = document.getElementById('countrySpecificFields');
            if (!container) return;

            // Limpiar contenedor
            container.innerHTML = '';

            // Si no hay datos de país, ocultar
            if (!countryData) {
                container.style.display = 'none';
                return;
            }

            let fieldsHtml = '';
            if (typeof countryData.certificateValidityDays === 'number') {
                html += '<div class="alert alert-secondary mb-3">';
                html += '<h6><i class="fas fa-calendar-check me-2"></i>Validez del Certificado</h6>';
                html += '<p class="mb-1">El certificado de salud tiene una validez de <strong>' + countryData.certificateValidityDays + ' días</strong>.</p>';

                if (countryData.certificateValidityDays < 15) {
                    html += '<div class="alert alert-warning small mt-2 p-2">';
                    html += '<i class="fas fa-exclamation-triangle me-1"></i>';
                    html += '<strong>Planificación importante:</strong> Con esta validez corta, se recomienda:';
                    html += '<ul class="mb-0 mt-1">';
                    html += '<li>Coordinar la cita veterinaria 2-3 días antes del viaje</li>';
                    html += '<li>Verificar horarios de la autoridad certificadora</li>';
                    html += '<li>Considerar días festivos/no laborables</li>';
                    html += '</ul>';
                    html += '</div>';
                }

                html += '</div>';
            }
            // Solo mostrar si el país tiene alguna característica especial
            if (countryData.transitCountries === true || countryData.isBlacklisted === true || countryData.formModel) {
                container.style.display = 'block';

                fieldsHtml += '<div class="form-section">';
                fieldsHtml += '<div class="field-icon"><i class="fas fa-globe-americas"></i></div>';
                fieldsHtml += '<h4 class="mb-4" style="color: #667eea;">';
                fieldsHtml += '<i class="fas fa-passport me-2"></i> Requisitos Específicos del País';
                fieldsHtml += '</h4>';

                // Campos dinámicos se cargarán aquí
                fieldsHtml += '<div id="dynamicCountryFields"></div>';

                fieldsHtml += '</div>';

                container.innerHTML = fieldsHtml;

                // Cargar campos dinámicos
                setTimeout(() => {
                    loadDynamicCountryFields(countryData);
                }, 100);
            } else {
                container.style.display = 'none';
            }
        }

        function loadDynamicCountryFields(countryData) {
            const container = document.getElementById('dynamicCountryFields');
            if (!container) return;

            let html = '';

            if (countryData.transitCountries === true) {
                html += '<div class="mb-3">';
                html += '<label class="form-label required-field">';
                html += '<i class="fas fa-route me-1"></i> Países de Tránsito';
                html += '</label>';
                html += '<textarea class="form-control" id="transitCountriesList" name="transitCountriesList" ';
                html += 'rows="3" required placeholder="Liste todos los países por los que transitará (ej: España, Francia, Alemania)"></textarea>';
                html += '<small class="text-muted">Ingrese todos los países, separados por comas</small>';
                html += '</div>';
            }

            if (countryData.isBlacklisted === true) {
                html += '<div class="alert alert-danger">';
                html += '<h6><i class="fas fa-exclamation-triangle me-2"></i>Importante para el Regreso a EE.UU.</h6>';
                html += '<p>Este país está en lista negra. Para poder regresar a Estados Unidos necesita:</p>';
                html += '<ul>';
                html += '<li>Formulario APHIS 7001 completado</li>';
                html += '<li>Historial completo de vacunas antirrábicas (últimos 3 años)</li>';
                html += '<li>Documentación adicional de entrada a EE.UU.</li>';
                html += '</ul>';
                html += '</div>';

                html += '<div class="row mb-3">';
                html += '<div class="col-md-6">';
                html += '<label class="form-label required-field">';
                html += '<i class="fas fa-calendar-day me-1"></i> Fecha estimada de retorno a EE.UU.';
                html += '</label>';
                html += '<input type="date" class="form-control" id="returnToUSDate" name="returnToUSDate" required>';
                html += '</div>';
                html += '</div>';

                html += '<div class="mb-3">';
                html += '<label class="form-label required-field">';
                html += '<i class="fas fa-syringe me-1"></i> Historial de Vacunas Antirrábicas (últimos 3 años)';
                html += '</label>';
                html += '<textarea class="form-control" id="rabiesHistory" name="rabiesHistory" rows="4" required ';
                html += 'placeholder="Detalle todas las vacunas antirrábicas aplicadas en los últimos 3 años:&#10;- Fecha&#10;- Nombre de vacuna&#10;- Número de lote&#10;- Clínica veterinaria"></textarea>';
                html += '<small class="text-muted">Esta información es necesaria para el regreso a Estados Unidos</small>';
                html += '</div>';
            }

            if (countryData.formModel) {
                html += '<div class="alert alert-info">';
                html += '<i class="fas fa-file-medical me-2"></i>';
                html += '<strong>Modelo de documento:</strong> Se generará el formulario <strong>' + countryData.formModel + '</strong>';
                html += '</div>';
            }

            container.innerHTML = html;

            // Establecer fecha mínima para retorno
            if (countryData.isBlacklisted) {
                const today = new Date();
                const futureDate = new Date(today);
                futureDate.setDate(futureDate.getDate() + 1);
                document.getElementById('returnToUSDate').min = futureDate.toISOString().split('T')[0];
            }
        }
        function generateFormFieldsFromConfig(petIndex, reqId, requirement) {
            const container = document.getElementById('req_fields_' + petIndex + '_' + reqId);
            if (!container || !requirement.formFields) return;

            let html = '<div class="p-3 border rounded bg-light">';
            html += '<h6 class="mb-3"><i class="fas fa-file-medical me-2"></i> Detalles de "' + requirement.name + '"</h6>';

            html += '<div class="row g-3">';

            // Generar campos según la configuración
            for (const [fieldName, fieldConfig] of Object.entries(requirement.formFields)) {
                const isRequired = fieldConfig.required === true;
                const colClass = fieldConfig.type === 'date' ? 'col-md-6' : 'col-md-6';

                html += '<div class="' + colClass + '">';
                html += '<label class="form-label small ' + (isRequired ? 'required-field' : '') + '">';
                html += fieldConfig.label;
                if (isRequired) {
                    html += ' *';
                }
                html += '</label>';

                if (fieldConfig.type === 'date') {
                    html += '<input type="date" class="form-control form-control-sm" ';
                    html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.' + fieldName + '" ';
                    html += (isRequired ? 'required' : '') + '>';

                } else if (fieldConfig.type === 'text' || fieldConfig.type === 'email' || fieldConfig.type === 'tel') {
                    html += '<input type="' + fieldConfig.type + '" class="form-control form-control-sm" ';
                    html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.' + fieldName + '" ';
                    html += 'placeholder="' + fieldConfig.label + '" ';
                    html += (isRequired ? 'required' : '') + '>';

                } else if (fieldConfig.type === 'textarea') {
                    html += '<textarea class="form-control form-control-sm" rows="2" ';
                    html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.' + fieldName + '" ';
                    html += 'placeholder="' + fieldConfig.label + '" ';
                    html += (isRequired ? 'required' : '') + '></textarea>';

                } else if (fieldConfig.type === 'select' && fieldConfig.options) {
                    html += '<select class="form-select form-select-sm" ';
                    html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.' + fieldName + '" ';
                    html += (isRequired ? 'required' : '') + '>';
                    html += '<option value="">Seleccione...</option>';

                    for (const option of fieldConfig.options) {
                        html += '<option value="' + option.value + '">' + option.label + '</option>';
                    }

                    html += '</select>';
                }

                html += '</div>';
            }

            // Botón para copiar información del veterinario (si hay campos de vet)
            const hasVetFields = Object.keys(requirement.formFields).some(field => 
                field.includes('vet') || field.includes('clinic')
            );

            if (hasVetFields) {
                html += '<div class="col-12 mt-2">';
                html += '<button type="button" class="btn btn-sm btn-outline-info" ';
                html += 'onclick="copyVetInfoToAll(' + petIndex + ', \'' + reqId + '\')">';
                html += '<i class="fas fa-copy me-1"></i> Copiar información del veterinario a todos los requisitos';
                html += '</button>';
                html += '</div>';
            }

            html += '</div>';
            html += '</div>';

            container.innerHTML = html;
        }
        function toggleRequiredRequirement(checkbox) {
            const petIndex = checkbox.dataset.petIndex;
            const reqId = checkbox.dataset.reqId;
            const reqName = checkbox.dataset.reqName;
            const reqType = checkbox.dataset.reqType;
            const reqDesc = checkbox.dataset.reqDesc;
            const isChecked = checkbox.checked;

            // Crear objeto requirement
            const requirement = {
                id: reqId,
                name: reqName,
                type: reqType,
                description: reqDesc,
                required: true
            };

            // Llamar a la función principal del presupuesto
            if (window.addToBudgetIfMissing) {
                window.addToBudgetIfMissing(requirement, petIndex, isChecked);
            }

            // También verificar si necesita campos dinámicos
            const hasFormFields = checkbox.getAttribute('data-has-form-fields') === 'true';
            if (hasFormFields) {
                // Dejar que toggleRequirementWithFields maneje los campos
                // Ya está integrado en la función anterior
            }

            // Actualizar visualmente el checkbox
            if (isChecked) {
                checkbox.parentElement.classList.add('text-success');
            } else {
                checkbox.parentElement.classList.remove('text-success');
            }
        }
        function createVaccineFields(petIndex, reqId, requirement) {
            let html = '<div class="row g-3">';

            // Campos específicos del país si existen
            if (requirement.formFields) {
                for (const [fieldName, fieldConfig] of Object.entries(requirement.formFields)) {
                    html += '<div class="' + (fieldConfig.required ? 'col-md-6' : 'col-md-4') + '">';
                    html += '<label class="form-label small ' + (fieldConfig.required ? 'required-field' : '') + '">';
                    html += fieldConfig.label;
                    html += '</label>';

                    if (fieldConfig.type === 'date') {
                        html += '<input type="date" class="form-control form-control-sm" ';
                        html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.' + fieldName + '" ';
                        html += (fieldConfig.required ? 'required' : '') + '>';
                    } else {
                        html += '<input type="' + fieldConfig.type + '" class="form-control form-control-sm" ';
                        html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.' + fieldName + '" ';
                        html += 'placeholder="' + fieldConfig.label + '" ';
                        html += (fieldConfig.required ? 'required' : '') + '>';
                    }

                    html += '</div>';
                }
            } else {
                // Campos por defecto para vacunas
                html += '<div class="col-md-6">';
                html += '<label class="form-label small required-field">Fecha de aplicación</label>';
                html += '<input type="date" class="form-control form-control-sm" ';
                html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.date" required>';
                html += '</div>';

                html += '<div class="col-md-6">';
                html += '<label class="form-label small">Número de lote</label>';
                html += '<input type="text" class="form-control form-control-sm" ';
                html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.batch" ';
                html += 'placeholder="Ej: VAC-2024-001">';
                html += '</div>';

                html += '<div class="col-md-6">';
                html += '<label class="form-label small required-field">Nombre del veterinario</label>';
                html += '<input type="text" class="form-control form-control-sm" ';
                html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vet_name" required ';
                html += 'placeholder="Dr. Nombre Apellido">';
                html += '</div>';

                html += '<div class="col-md-6">';
                html += '<label class="form-label small required-field">Licencia del veterinario</label>';
                html += '<input type="text" class="form-control form-control-sm" ';
                html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vet_license" required ';
                html += 'placeholder="Ej: VET-12345">';
                html += '</div>';

                html += '<div class="col-md-8">';
                html += '<label class="form-label small required-field">Nombre de la clínica</label>';
                html += '<input type="text" class="form-control form-control-sm" ';
                html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.clinic_name" required ';
                html += 'placeholder="Clínica Veterinaria">';
                html += '</div>';

                html += '<div class="col-md-4">';
                html += '<button type="button" class="btn btn-sm btn-outline-info mt-4" ';
                html += 'onclick="copyVetInfoToAll(' + petIndex + ', \'' + reqId + '\')">';
                html += '<i class="fas fa-copy me-1"></i> Copiar a todos</button>';
                html += '</div>';

                html += '<div class="col-12">';
                html += '<label class="form-label small">Dirección de la clínica</label>';
                html += '<input type="text" class="form-control form-control-sm" ';
                html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.clinic_address" ';
                html += 'placeholder="Calle 123, Ciudad, Estado">';
                html += '</div>';
            }

            html += '</div>';
            return html;
        }
        function copyVetInfoToAll(petIndex, sourceReqId) {
            const sourceFields = {
                vet_name: document.querySelector('[name="pets[' + petIndex + '].requirements.' + sourceReqId + '.vet_name"]')?.value,
                vet_license: document.querySelector('[name="pets[' + petIndex + '].requirements.' + sourceReqId + '.vet_license"]')?.value,
                clinic_name: document.querySelector('[name="pets[' + petIndex + '].requirements.' + sourceReqId + '.clinic_name"]')?.value,
                clinic_address: document.querySelector('[name="pets[' + petIndex + '].requirements.' + sourceReqId + '.clinic_address"]')?.value
            };

            // Validar que los campos obligatorios estén llenos
            if (!sourceFields.vet_name || !sourceFields.vet_license || !sourceFields.clinic_name) {
                showAlert('Complete los campos obligatorios primero', 'warning');
                return;
            }

            // Copiar a todos los otros requisitos de vacuna/desparasitante
            const allInputs = document.querySelectorAll(`[name^="pets[${petIndex}].requirements."]`);

            allInputs.forEach(input => {
                const fieldName = input.name.split('.').pop();

                if (sourceFields[fieldName] && 
                    !input.name.includes(sourceReqId) && 
                    (input.name.includes('vet_name') || 
                     input.name.includes('vet_license') || 
                     input.name.includes('clinic_name') || 
                     input.name.includes('clinic_address'))) {
                    input.value = sourceFields[fieldName];
                }
            });

            showAlert('Información del veterinario copiada a todos los requisitos', 'success');
        }
        function formatAppliesto(appliesto) {
            if (!appliesto) return 'Todas las mascotas';
            if (appliesto === 'all') return 'Todas las mascotas';
            if (typeof appliesto === 'string') {
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
                    'mink': 'Visón',
                    'other': 'Otras mascotas'
                };
                return speciesMap[appliesto] || appliesto;
            }
            if (Array.isArray(appliesto)) {
                return appliesto.map(s => formatAppliesto(s)).join(', ');
            }
            return appliesto;
        }
        function toggleRequiredRequirement(checkbox) {
            const petIndex = checkbox.dataset.petIndex;
            const reqId = checkbox.dataset.reqId;
            const reqName = checkbox.dataset.reqName;
            const reqType = checkbox.dataset.reqType;
            const reqDesc = checkbox.dataset.reqDesc;
            const isChecked = checkbox.checked;

            // Crear objeto requirement
            const requirement = {
                id: reqId,
                name: reqName,
                type: reqType,
                description: reqDesc,
                required: true
            };

            // Llamar a la función principal
            addToBudgetIfMissing(requirement, petIndex, isChecked);

            // También actualizar visualmente el checkbox
            if (isChecked) {
                checkbox.parentElement.classList.add('text-success');
            } else {
                checkbox.parentElement.classList.remove('text-success');
            }
        }
        function addToBudget(petIndex, reqId) {
            // Obtener datos del país y del requerimiento
            const countryCode = document.getElementById('destinationCountry').value;
            const variableName = countryCode.toUpperCase() + 'PetTravelForm';
            const countryData = window[variableName];

            if (!countryData || !countryData.requirements) return;

            const requirement = countryData.requirements.find(r => r.id === reqId);
            if (!requirement) return;

            // Obtener nombre de la mascota
            const petNameInput = document.querySelector(`[name="pets[${petIndex}].petName"]`);
            const petName = petNameInput ? petNameInput.value : 'Mascota ' + (Number(petIndex) + 1);

            // Agregar al presupuesto (aquí integrarías con tu sistema de presupuesto)
            const budgetItem = {
                petIndex: petIndex,
                petName: petName,
                requirementId: reqId,
                requirementName: requirement.name,
                type: requirement.type,
                cost: estimateCost(requirement.type),
                addedAt: new Date().toISOString()
            };

            // Guardar en localStorage o enviar al servidor
            saveToBudget(budgetItem);

            // Mostrar notificación
            showAlert(`"${requirement.name}" agregado al presupuesto para ${petName}`, 'warning');
        }
        function generateRequirementsPDF(petIndex) {
            const petNameInput = document.querySelector('[name="pets[' + petIndex + '].petName"]');
            const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);
            const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].petType"]');
            const petType = petTypeSelect ? petTypeSelect.options[petTypeSelect.selectedIndex].text : '';

            const countrySelect = document.getElementById('destinationCountry');
            const countryName = countrySelect ? countrySelect.options[countrySelect.selectedIndex].text : '';

            // Obtener datos del propietario
            const ownerName = document.getElementById('ownerName') ? document.getElementById('ownerName').value : '';
            const ownerEmail = document.getElementById('ownerEmail') ? document.getElementById('ownerEmail').value : '';
            const ownerPhone = document.getElementById('ownerPhone') ? document.getElementById('ownerPhone').value : '';

            // Obtener datos del encargado si está activo
            const useCarrier = document.getElementById('useCarrier') ? document.getElementById('useCarrier').checked : false;
            let carrierInfo = '';
            if (useCarrier) {
                const carrierName = document.getElementById('carrierName') ? document.getElementById('carrierName').value : '';
                const carrierEmail = document.getElementById('carrierEmail') ? document.getElementById('carrierEmail').value : '';
                carrierInfo = 'Encargado: ' + carrierName + ' (' + carrierEmail + ')';
            }

            // Obtener fecha de viaje
            const travelDate = document.getElementById('travelDate') ? document.getElementById('travelDate').value : '';

            // Recolectar todos los requisitos y su estado
            const checkboxes = document.querySelectorAll('.requirement-checkbox[data-pet-index="' + petIndex + '"]');
            const requirements = [];

            for (let i = 0; i < checkboxes.length; i++) {
                const checkbox = checkboxes[i];
                const isChecked = checkbox.checked;
                const reqName = checkbox.dataset.reqName;
                const reqDesc = checkbox.dataset.reqDesc;
                const reqType = checkbox.dataset.reqType;

                requirements.push({
                    name: reqName,
                    description: reqDesc,
                    type: reqType,
                    status: isChecked ? 'Completado ✓' : 'Pendiente ✗',
                    checked: isChecked
                });
            }

            // Separar requerimientos y recomendaciones
            const requiredReqs = [];
            const optionalReqs = [];

            for (let i = 0; i < requirements.length; i++) {
                const req = requirements[i];
                if (req.type && req.type.includes('required') || !req.type) {
                    requiredReqs.push(req);
                } else {
                    optionalReqs.push(req);
                }
            }

            // Crear contenido HTML para el PDF CON CONCATENACIÓN MANUAL
            let htmlContent = '';
            htmlContent += '<!DOCTYPE html>';
            htmlContent += '<html>';
            htmlContent += '<head>';
            htmlContent += '<meta charset="UTF-8">';
            htmlContent += '<title>Requisitos de Viaje - ' + petName + '</title>';
            htmlContent += '<style>';
            htmlContent += 'body { font-family: Arial, sans-serif; margin: 20px; }';
            htmlContent += '.header { text-align: center; margin-bottom: 30px; border-bottom: 2px solid #333; padding-bottom: 20px; }';
            htmlContent += '.section { margin-bottom: 25px; }';
            htmlContent += '.section-title { background-color: #f0f0f0; padding: 10px; font-weight: bold; margin-bottom: 10px; }';
            htmlContent += '.pet-info, .owner-info, .travel-info { margin-bottom: 15px; }';
            htmlContent += '.requirement-list { margin-left: 20px; }';
            htmlContent += '.requirement-item { margin-bottom: 10px; padding: 8px; border-left: 4px solid #ccc; }';
            htmlContent += '.requirement-completed { border-left-color: #28a745; background-color: #f8fff8; }';
            htmlContent += '.requirement-pending { border-left-color: #dc3545; background-color: #fff8f8; }';
            htmlContent += '.status-badge { padding: 2px 8px; border-radius: 3px; font-size: 12px; }';
            htmlContent += '.completed { background-color: #28a745; color: white; }';
            htmlContent += '.pending { background-color: #dc3545; color: white; }';
            htmlContent += '.footer { margin-top: 30px; text-align: center; font-size: 12px; color: #666; border-top: 1px solid #ccc; padding-top: 10px; }';
            htmlContent += 'table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }';
            htmlContent += 'table, th, td { border: 1px solid #ddd; }';
            htmlContent += 'th, td { padding: 8px; text-align: left; }';
            htmlContent += 'th { background-color: #f2f2f2; }';
            htmlContent += '</style>';
            htmlContent += '</head>';
            htmlContent += '<body>';
            htmlContent += '<div class="header">';
            htmlContent += '<h1>Requisitos de Viaje para Mascota</h1>';
            htmlContent += '<h2>' + petName + ' - ' + countryName + '</h2>';
            htmlContent += '<p>Fecha de emisión: ' + new Date().toLocaleDateString() + '</p>';
            htmlContent += '</div>';

            htmlContent += '<div class="section">';
            htmlContent += '<div class="section-title">Información del Viaje</div>';
            htmlContent += '<div class="travel-info">';
            htmlContent += '<p><strong>País Destino:</strong> ' + countryName + '</p>';
            htmlContent += '<p><strong>Fecha de Viaje:</strong> ' + travelDate + '</p>';
            htmlContent += '</div>';
            htmlContent += '</div>';

            htmlContent += '<div class="section">';
            htmlContent += '<div class="section-title">Información de la Mascota</div>';
            htmlContent += '<div class="pet-info">';
            htmlContent += '<p><strong>Nombre:</strong> ' + petName + '</p>';
            htmlContent += '<p><strong>Tipo:</strong> ' + petType + '</p>';
            htmlContent += '<p><strong>Número de Identificación:</strong> ' + (petIndex + 1) + '</p>';
            htmlContent += '</div>';
            htmlContent += '</div>';

            htmlContent += '<div class="section">';
            htmlContent += '<div class="section-title">Información del Propietario</div>';
            htmlContent += '<div class="owner-info">';
            htmlContent += '<p><strong>Nombre:</strong> ' + ownerName + '</p>';
            htmlContent += '<p><strong>Email:</strong> ' + ownerEmail + '</p>';
            htmlContent += '<p><strong>Teléfono:</strong> ' + ownerPhone + '</p>';
            if (carrierInfo) {
                htmlContent += '<p><strong>' + carrierInfo + '</strong></p>';
            }
            htmlContent += '</div>';
            htmlContent += '</div>';

            htmlContent += '<div class="section">';
            htmlContent += '<div class="section-title">Requerimientos Obligatorios</div>';
            htmlContent += '<div class="requirement-list">';

            if (requiredReqs.length > 0) {
                for (let i = 0; i < requiredReqs.length; i++) {
                    const req = requiredReqs[i];
                    const statusClass = req.checked ? 'requirement-completed' : 'requirement-pending';
                    const badgeClass = req.checked ? 'completed' : 'pending';

                    htmlContent += '<div class="requirement-item ' + statusClass + '">';
                    htmlContent += '<strong>' + req.name + '</strong>';
                    htmlContent += '<span class="status-badge ' + badgeClass + '">' + req.status + '</span>';
                    htmlContent += '<p>' + req.description + '</p>';
                    htmlContent += '</div>';
                }
            } else {
                htmlContent += '<p>No hay requerimientos obligatorios para este país.</p>';
            }

            htmlContent += '</div>';
            htmlContent += '</div>';

            if (optionalReqs.length > 0) {
                htmlContent += '<div class="section">';
                htmlContent += '<div class="section-title">Recomendaciones</div>';
                htmlContent += '<div class="requirement-list">';

                for (let i = 0; i < optionalReqs.length; i++) {
                    const req = optionalReqs[i];
                    const statusClass = req.checked ? 'requirement-completed' : 'requirement-pending';
                    const badgeClass = req.checked ? 'completed' : 'pending';

                    htmlContent += '<div class="requirement-item ' + statusClass + '">';
                    htmlContent += '<strong>' + req.name + '</strong>';
                    htmlContent += '<span class="status-badge ' + badgeClass + '">' + req.status + '</span>';
                    htmlContent += '<p>' + req.description + '</p>';
                    htmlContent += '</div>';
                }

                htmlContent += '</div>';
                htmlContent += '</div>';
            }

            htmlContent += '<div class="footer">';
            htmlContent += '<p>Documento generado automáticamente por Pet Travel Docs</p>';
            htmlContent += '<p>Fecha de validez: ' + new Date().toLocaleDateString() + '</p>';
            htmlContent += '</div>';
            htmlContent += '</body>';
            htmlContent += '</html>';

            // Abrir ventana para imprimir/guardar como PDF
            const printWindow = window.open('', '_blank');
            printWindow.document.write(htmlContent);
            printWindow.document.close();

            // Esperar a que cargue y mostrar diálogo de impresión
            printWindow.onload = function() {
                printWindow.print();
            };

            showAlert('PDF generado para ' + petName + '. Se abrirá el diálogo de impresión.', 'success');
        }
        function estimateCost(type) {
            // Estimaciones de costo (ajustar según tu sistema)
            const costs = {
                'vaccine': 50,
                'parasite_treatment': 30,
                'test': 80,
                'certificate': 100,
                'health_certificate': 120,
                'microchip': 40,
                'quarantine': 200,
                'other': 40
            };
            return costs[type] || 50;
        }
        function saveToBudget(item) {
            // Obtener presupuesto actual de localStorage
            let budget = JSON.parse(localStorage.getItem('petTravelBudget')) || [];

            // Evitar duplicados
            const existingIndex = budget.findIndex(i => 
                i.petIndex === item.petIndex && i.requirementId === item.requirementId
            );

            if (existingIndex === -1) {
                budget.push(item);
                localStorage.setItem('petTravelBudget', JSON.stringify(budget));

                // Actualizar visualización del presupuesto si existe
                updateBudgetDisplay();
            }
        }
        function updateBudgetDisplay() {
            // Esta función actualizaría la visualización del presupuesto en tu página
            // Depende de cómo tengas estructurado tu sistema de presupuesto
            const budget = JSON.parse(localStorage.getItem('petTravelBudget')) || [];

            // Ejemplo: Actualizar un contador
            const budgetCounter = document.getElementById('budgetCounter');
            if (budgetCounter) {
                budgetCounter.textContent = budget.length;
                budgetCounter.style.display = budget.length > 0 ? 'inline' : 'none';
            }
        }
        function addMissingToBudget(petIndex) {
            const countryCode = document.getElementById('destinationCountry').value;
            const variableName = getCountryVariableName(countryCode);
            const countryData = window[variableName];

            if (!countryData || !countryData.requirements) {
                showAlert('No hay datos de país disponibles', 'warning');
                return;
            }

            const petNameInput = document.querySelector('[name="pets[' + petIndex + '].petName"]');
            const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);

            const missingReqs = [];

            // SOLUCIÓN: Iterar sobre los checkboxes REALES en el DOM
            const checkboxes = document.querySelectorAll('.requirement-checkbox[data-pet-index="' + petIndex + '"]');

            checkboxes.forEach(checkbox => {
                if (!checkbox.checked) {
                    const reqId = checkbox.getAttribute('data-req-id');
                    const reqName = checkbox.getAttribute('data-req-name');
                    const reqDesc = checkbox.getAttribute('data-req-desc');
                    const reqType = checkbox.getAttribute('data-req-type');
                    const appliesto = checkbox.getAttribute('data-req-appliesto');

                    // Encontrar el requisito completo en countryData para más detalles
                    const fullReq = countryData.requirements.find(r => r.id === reqId);

                    missingReqs.push({
                        name: reqName,
                        description: reqDesc,
                        type: reqType,
                        required: fullReq ? fullReq.required : true,
                        estimatedCost: window.estimateCost ? window.estimateCost(reqType) : 50,
                        petName: petName,
                        requirementId: reqId,
                        petIndex: petIndex,
                        badge: (fullReq && fullReq.required === true) ? 'OBLIGATORIO' : 'RECOMENDADO',
                        colorClass: (fullReq && fullReq.required === true) ? 'danger' : 'warning',
                        appliesto: appliesto
                    });
                }
            });

            // El resto del código para redirigir al presupuesto...
            if (missingReqs.length > 0) {
                // Obtener todos los datos del formulario
                const ownerName = document.getElementById('ownerName');
                const ownerEmail = document.getElementById('ownerEmail');
                const travelDate = document.getElementById('travelDate');
                const formData = {
                    client: ownerName ? ownerName.value : '',
                    pets: petName,
                    petType: document.querySelector('[name="pets[' + petIndex + '].petType"]') ? 
                             document.querySelector('[name="pets[' + petIndex + '].petType"]').options[document.querySelector('[name="pets[' + petIndex + '].petType"]').selectedIndex].text : '',
                    destination: document.getElementById('destinationCountry') ? 
                                 document.getElementById('destinationCountry').options[document.getElementById('destinationCountry').selectedIndex].text : '',
                    petCount: window.petCount || 1,
                    clientEmail: ownerEmail ? ownerEmail.value : '',
                    travelDate: travelDate ? travelDate.value : '',
                    missingRequirements: JSON.stringify(missingReqs)
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

                showAlert(missingReqs.length + ' requisitos agregados al presupuesto para ' + petName + '. Redirigiendo...', 'info');

                setTimeout(() => {
                    window.location.href = url;
                }, 1500);

            } else {
                showAlert('No hay requisitos faltantes para ' + petName, 'info');
            }
        }
        function addAllMissingToBudget() {
            const countryCode = document.getElementById('destinationCountry').value;
            const variableName = getCountryVariableName(countryCode);  // Usar la función correcta
            const countryData = window[variableName];

            if (!countryData || !countryData.requirements) {
                showAlert('No hay datos de país disponibles', 'warning');
                return;
            }

            let totalAdded = 0;

            for (let petIndex = 0; petIndex < petCount; petIndex++) {
                const petNameInput = document.querySelector('[name="pets[' + petIndex + '].petName"]');
                const petName = petNameInput ? petNameInput.value : 'Mascota ' + (parseInt(petIndex) + 1);

                // Obtener TODOS los checkboxes REALES de esta mascota (los que están en el DOM filtrados)
                const checkboxes = document.querySelectorAll('.requirement-checkbox[data-pet-index="' + petIndex + '"]');

                let petAddedCount = 0;

                // Iterar sobre los checkboxes que realmente existen en el DOM
                checkboxes.forEach(checkbox => {
                    if (!checkbox.checked) {
                        const reqId = checkbox.getAttribute('data-req-id');
                        const reqName = checkbox.getAttribute('data-req-name');
                        const reqType = checkbox.getAttribute('data-req-type');
                        const reqDesc = checkbox.getAttribute('data-req-desc');
                        const appliesto = checkbox.getAttribute('data-req-appliesto');

                        // Encontrar el requisito completo en los datos del país para verificar si es requerido
                        const fullReq = countryData.requirements.find(r => r.id === reqId);

                        // Solo agregar si es un requisito requerido (o si no encontramos info, asumir que sí)
                        if (fullReq && fullReq.required === true) {
                            const requirement = {
                                id: reqId,
                                name: reqName,
                                type: reqType,
                                description: reqDesc,
                                required: true,
                                appliesto: appliesto
                            };

                            if (window.addToBudgetIfMissing) {
                                window.addToBudgetIfMissing(requirement, petIndex, false);
                                petAddedCount++;
                                totalAdded++;

                                console.log(`Agregado al presupuesto: ${reqName} para ${petName}`);
                            }
                        }
                    }
                });

                if (petAddedCount > 0) {
                    console.log(`${petAddedCount} requisitos agregados para ${petName}`);
                }
            }

            if (totalAdded > 0) {
                showAlert('Se agregaron ' + totalAdded + ' requisitos al presupuesto para todas las mascotas', 'success');

                setTimeout(function() {
                    if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
                        if (confirm('¿Desea ver el presupuesto ahora con los ' + window.missingReqsTemp.length + ' requisitos agregados?')) {
                            window.redirectToBudgetWithAllMissing();
                        }
                    } else {
                        // Si por alguna razón no se guardó en missingReqsTemp, redirigir igual
                        window.redirectToBudgetWithAllMissing();
                    }
                }, 1500);

            } else {
                showAlert('No hay requisitos faltantes para ninguna mascota', 'info');

                if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
                    if (confirm('Ya tiene ' + window.missingReqsTemp.length + ' requisitos en el presupuesto. ¿Desea ver el presupuesto?')) {
                        window.redirectToBudgetWithAllMissing();
                    }
                }
            }
        }
        function initializeRequirementCheckboxes(petIndex) {
            const budget = JSON.parse(localStorage.getItem('petTravelBudget')) || [];
            budget.forEach(item => {
                if (item.petIndex == petIndex) {
                    const checkbox = document.getElementById(`req_${petIndex}_${item.requirementId}`);
                    if (checkbox) {
                        checkbox.checked = true;
                    }
                }
            });
        }
        function createRequirementForm(requirement, petIndex) {
            let html = '<div class="requirement-form-fields p-3 border rounded bg-white">';
            html += '<h6 class="mb-3"><i class="fas fa-file-medical me-2"></i> Detalles del ' + requirement.name + '</h6>';

            switch(requirement.type) {
                case 'vaccine':
                    html += `
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Fecha de aplicación *</label>
                                <input type="date" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.date" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Número de lote</label>
                                <input type="text" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.batch"
                                       placeholder="Ej: VAC-2024-001">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Laboratorio fabricante</label>
                                <input type="text" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.laboratory"
                                       placeholder="Nombre del laboratorio">
                            </div>
                        </div>
                    `;
                    break;

                case 'parasite_treatment':
                    html += `
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Fecha de tratamiento *</label>
                                <input type="date" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.date" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Medicamento utilizado *</label>
                                <input type="text" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.medication" required
                                       placeholder="Nombre del medicamento">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Próximo tratamiento recomendado</label>
                                <input type="date" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.next_treatment">
                            </div>
                        </div>
                    `;
                    break;

                default:
                    html += `
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Fecha *</label>
                                <input type="date" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.date" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Detalles</label>
                                <input type="text" class="form-control form-control-sm" 
                                       name="pets[${petIndex}].requirements.${requirement.id}.details"
                                       placeholder="Información adicional">
                            </div>
                        </div>
                    `;
            }

            // Información del veterinario (común para todos)
            html += `
                <hr class="my-4">
                <h6 class="mb-3"><i class="fas fa-user-md me-2"></i> Información del Veterinario</h6>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Nombre del veterinario *</label>
                        <input type="text" class="form-control form-control-sm" 
                               name="pets[${petIndex}].requirements.${requirement.id}.vet_name" required
                               placeholder="Dr. Nombre Apellido">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Número de licencia *</label>
                        <input type="text" class="form-control form-control-sm" 
                               name="pets[${petIndex}].requirements.${requirement.id}.vet_license" required
                               placeholder="Ej: VET-12345">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Nombre de la clínica *</label>
                        <input type="text" class="form-control form-control-sm" 
                               name="pets[${petIndex}].requirements.${requirement.id}.clinic_name" required
                               placeholder="Clínica Veterinaria">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Dirección de la clínica</label>
                        <input type="text" class="form-control form-control-sm" 
                               name="pets[${petIndex}].requirements.${requirement.id}.clinic_address"
                               placeholder="Dirección completa">
                    </div>
                </div>

                <div class="mt-3 text-end">
                    <button type="button" class="btn btn-sm btn-outline-success" 
                            onclick="copyVetInfoToAllRequirements(${petIndex}, '${requirement.id}')">
                        <i class="fas fa-copy me-1"></i> Copiar información veterinaria a todos
                    </button>
                </div>
            `;

            html += '</div>';
            return html;
        }
        function addToBudgetIfMissing(requirement, petIndex, isCompleted) {
            // Obtener nombre de la mascota CON CONCATENACIÓN MANUAL
            const petNameInput = document.querySelector('[name="pets[' + petIndex + '].petName"]');
            let petName = '';
            if (petNameInput) {
                petName = petNameInput.value;
            } else {
                petName = 'Mascota ' + (parseInt(petIndex) + 1);
            }

            // Obtener país destino
            const countrySelect = document.getElementById('destinationCountry');
            const countryCode = countrySelect ? countrySelect.value : '';
            const countryName = countrySelect ? countrySelect.options[countrySelect.selectedIndex].text : '';

            // Obtener datos del propietario
            const ownerName = document.getElementById('ownerName') ? document.getElementById('ownerName').value : '';
            const ownerEmail = document.getElementById('ownerEmail') ? document.getElementById('ownerEmail').value : '';
            const ownerPhone = document.getElementById('ownerPhone') ? document.getElementById('ownerPhone').value : '';
            const travelDate = document.getElementById('travelDate') ? document.getElementById('travelDate').value : '';

            // Obtener tipo de mascota
            const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].petType"]');
            let petType = '';
            if (petTypeSelect) {
                petType = petTypeSelect.options[petTypeSelect.selectedIndex].text;
            }

            // Si no está completado y es requerido, agregar al presupuesto
            if (!isCompleted ) {
                // Crear objeto del requisito faltante
                const missingReq = {
                    name: requirement.name || '',
                    description: requirement.description || '',
                    type: requirement.type || 'other',
                    estimatedCost: estimateCost(requirement.type),
                    petName: petName,
                    petIndex: petIndex,
                    requirementId: requirement.id || '',
                    addedAt: new Date().toISOString()
                };

                // Agregar a la lista local (si quieres mantenerla en memoria)
                if (!window.missingReqsTemp) {
                    window.missingReqsTemp = [];
                }
                window.missingReqsTemp.push(missingReq);

                // Mostrar alerta CON CONCATENACIÓN MANUAL
                showAlert(requirement.name + ' agregado al presupuesto para ' + petName, 'info');

                // También puedes redirigir directamente al presupuesto si es un solo requisito
                // O acumular varios y luego redirigir

            } else if (isCompleted && requirement.required === true) {
                // Si se marca como completado, remover de la lista temporal si existe
                if (window.missingReqsTemp) {
                    window.missingReqsTemp = window.missingReqsTemp.filter(function(req) {
                        return !(req.petIndex === petIndex && req.requirementId === requirement.id);
                    });
                }
            }
        }
        function redirectToBudgetWithAllMissing() {
            if (!window.missingReqsTemp || window.missingReqsTemp.length === 0) {
                showAlert('No hay requisitos faltantes para agregar al presupuesto', 'warning');
                return;
            }

            // Obtener datos del formulario
            const clientName = document.getElementById('ownerName') ? document.getElementById('ownerName').value : '';
            const clientEmail = document.getElementById('ownerEmail') ? document.getElementById('ownerEmail').value : '';
            const travelDate = document.getElementById('travelDate') ? document.getElementById('travelDate').value : '';
            const countrySelect = document.getElementById('destinationCountry');
            const destination = countrySelect ? countrySelect.options[countrySelect.selectedIndex].text : '';

            // Agrupar mascotas
            const petsMap = {};
            for (let i = 0; i < window.missingReqsTemp.length; i++) {
                const req = window.missingReqsTemp[i];
                if (!petsMap[req.petName]) {
                    petsMap[req.petName] = true;
                }
            }
            const petsList = Object.keys(petsMap).join(', ');

            // Crear datos para enviar
            const formData = {
                client: clientName,
                pets: petsList,
                petType: 'Varias especies', // Podrías obtener esto de las mascotas
                destination: destination,
                petCount: Object.keys(petsMap).length.toString(),
                clientEmail: clientEmail,
                travelDate: travelDate,
                missingRequirements: JSON.stringify(window.missingReqsTemp)
            };

            // Construir URL CON CONCATENACIÓN MANUAL
            let url = '${pageContext.request.contextPath}/budget?';
            url += 'client=' + encodeURIComponent(formData.client);
            url += '&pets=' + encodeURIComponent(formData.pets);
            url += '&petType=' + encodeURIComponent(formData.petType);
            url += '&destination=' + encodeURIComponent(formData.destination);
            url += '&petCount=' + encodeURIComponent(formData.petCount);
            url += '&clientEmail=' + encodeURIComponent(formData.clientEmail);
            url += '&travelDate=' + encodeURIComponent(formData.travelDate);
            url += '&missingRequirements=' + encodeURIComponent(formData.missingRequirements);

            // Redirigir
            window.location.href = url;
        }
        function clearTempMissingReqs() {
            window.missingReqsTemp = [];
            showAlert('Requisitos temporales limpiados', 'info');
        }
        function showMissingReqsCount() {
            const count = window.missingReqsTemp ? window.missingReqsTemp.length : 0;
            if (count > 0) {
                showAlert('Tienes ' + count + ' requisitos pendientes en el presupuesto temporal', 'info');
            } else {
                showAlert('No hay requisitos pendientes en el presupuesto temporal', 'info');
            }
        }
        // Función para copiar información veterinaria a todos los requerimientos
        function copyVetInfoToAllRequirements(petIndex, sourceReqId) {
            const sourceVetName = document.querySelector(`[name="pets[${petIndex}].requirements.${sourceReqId}.vet_name"]`)?.value;
            const sourceVetLicense = document.querySelector(`[name="pets[${petIndex}].requirements.${sourceReqId}.vet_license"]`)?.value;
            const sourceClinicName = document.querySelector(`[name="pets[${petIndex}].requirements.${sourceReqId}.clinic_name"]`)?.value;
            const sourceClinicAddress = document.querySelector(`[name="pets[${petIndex}].requirements.${sourceReqId}.clinic_address"]`)?.value;

            if (!sourceVetName || !sourceVetLicense || !sourceClinicName) {
                showAlert('Complete los campos obligatorios del veterinario primero.', 'warning');
                return;
            }

            // Encontrar todos los formularios de requerimientos de esta mascota
            const allRequirementInputs = document.querySelectorAll(`[name^="pets[${petIndex}].requirements."]`);

            allRequirementInputs.forEach(input => {
                if (input.name.includes('.vet_name') && !input.name.includes(sourceReqId)) {
                    input.value = sourceVetName;
                }
                if (input.name.includes('.vet_license') && !input.name.includes(sourceReqId)) {
                    input.value = sourceVetLicense;
                }
                if (input.name.includes('.clinic_name') && !input.name.includes(sourceReqId)) {
                    input.value = sourceClinicName;
                }
                if (input.name.includes('.clinic_address') && !input.name.includes(sourceReqId)) {
                    input.value = sourceClinicAddress;
                }
            });

            showAlert('Información del veterinario copiada a todos los requerimientos.', 'success');
        }
        // Función para actualizar el estado general de requerimientos de una mascota
        function updatePetRequirementsStatus(petIndex) {
            const checkboxes = document.querySelectorAll(`.requirement-checkbox[data-pet-index="${petIndex}"]`);
            const requiredCheckboxes = document.querySelectorAll(`.requirement-checkbox[data-pet-index="${petIndex}"][data-req-type]`);

            let completedCount = 0;
            let requiredCount = 0;
            let completedRequiredCount = 0;

            checkboxes.forEach(cb => {
                if (cb.checked) completedCount++;
            });

            requiredCheckboxes.forEach(cb => {
                requiredCount++;
                if (cb.checked) completedRequiredCount++;
            });

            // Actualizar algún indicador visual si es necesario
            const petSection = document.querySelector(`#requirements_${petIndex}`).closest('.pet-section');
            const badge = petSection.querySelector('.pet-badge');

            if (badge) {
                if (completedRequiredCount < requiredCount) {
                    badge.classList.remove('bg-primary');
                    badge.classList.add('bg-danger');
                    badge.title = 'Faltan requerimientos obligatorios';
                } else {
                    badge.classList.remove('bg-danger');
                    badge.classList.add('bg-primary');
                    badge.title = 'Todos los requerimientos obligatorios completados';
                }
            }
        }
        // Listener para cuando cambia el país (actualizar todas las mascotas)
        document.getElementById('destinationCountry')?.addEventListener('change', function() {
            for (let i = 0; i < petCount; i++) {
                updatePetRequirements(i);
            }
            if (countryData && countryData.isBlacklisted === true) {
                const rabiesHistory = document.getElementById('rabiesHistory');
                const returnToUSDate = document.getElementById('returnToUSDate');

                if (rabiesHistory && !rabiesHistory.value.trim()) {
                    isValid = false;
                    rabiesHistory.classList.add('is-invalid');
                    showAlert('Debe proporcionar el historial de vacunas antirrábicas para países en lista negra', 'warning');
                }

                if (returnToUSDate && !returnToUSDate.value) {
                    isValid = false;
                    returnToUSDate.classList.add('is-invalid');
                    showAlert('Debe especificar la fecha estimada de retorno a EE.UU.', 'warning');
                }
            }

            if (countryData && countryData.transitCountries === true) {
                const transitCountriesList = document.getElementById('transitCountriesList');
                if (transitCountriesList && !transitCountriesList.value.trim()) {
                    isValid = false;
                    transitCountriesList.classList.add('is-invalid');
                    showAlert('Debe listar los países de tránsito', 'warning');
                }
            }
        });              
        function activateRequirementsOnNameInput(petIndex) {
            const petNameInput = document.querySelector(`[name="pets[${petIndex}].petName"]`);
            if (petNameInput) {
                petNameInput.addEventListener('input', function() {
                    if (this.value.trim() && document.getElementById('destinationCountry').value) {
                        updatePetRequirements(petIndex);
                    }
                });
            }
        }
        function generateInternationalPDF() {
            // Obtener datos del viaje internacional
            const destinationCountry = document.getElementById('destinationCountry');
            const travelDate = document.getElementById('travelDate');
            const regresoDate = document.getElementById('regresoDate');
            const travelType = document.getElementById('travelType');
            const arrivalPlace = document.getElementById('arrivalPlace');

            // Obtener datos del dueño
            const ownerName = document.getElementById('ownerName');
            const ownerEmail = document.getElementById('ownerEmail');
            const ownerPhone = document.getElementById('ownerPhone');
            const ownerState = document.getElementById('ownerState');
            const ownerCity = document.getElementById('ownerCity');
            const ownerZipCode = document.getElementById('ownerZipCode');
            const ownerAddress = document.getElementById('ownerAddress');

            // Obtener datos del encargado (si aplica)
            const useCarrier = document.getElementById('useCarrier');
            const carrierName = document.getElementById('carrierName');
            const carrierEmail = document.getElementById('carrierEmail');
            const carrierPhone = document.getElementById('carrierPhone');
            const carrierCountry = document.getElementById('carrierCountry');
            const carrierAddress = document.getElementById('carrierAddress');

            // Obtener datos del país destino
            const countryCode = destinationCountry ? destinationCountry.value : null;
            let countryData = null;

            if (countryCode) {
                const variableName = getCountryVariableName(countryCode);
                countryData = window[variableName];

                if (!countryData && window.petTravelDB) {
                    countryData = window.petTravelDB.getCountry(countryCode);
                }
            }

            // Obtener todas las mascotas
            const petsData = [];
            const allReqsByPet = {}; // TODOS los requisitos (completados y pendientes)
            const vaccineDetailsByPet = {}; // Detalles de vacunas/tratamientos

            for (let i = 0; i < petCount; i++) {
                const petName = document.querySelector('[name="pets[' + i + '].petName"]');
                const petType = document.querySelector('[name="pets[' + i + '].petType"]');
                const petBreed = document.getElementById('petBreed_' + i);
                const petColor = document.querySelector('[name="pets[' + i + '].petColor"]');
                const petGender = document.querySelector('[name="pets[' + i + '].petGender"]');
                const petBirthDate = document.querySelector('[name="pets[' + i + '].petBirthDate"]');
                const microchipNumber = document.querySelector('[name="pets[' + i + '].microchipNumber"]');

                if (petName && petName.value) {
                    const petData = {
                        index: i + 1,
                        name: petName.value,
                        type: petType ? petType.options[petType.selectedIndex].text : '',
                        breed: petBreed ? petBreed.options[petBreed.selectedIndex].text : '',
                        color: petColor ? petColor.value : '',
                        gender: petGender ? petGender.options[petGender.selectedIndex].text : '',
                        birthDate: petBirthDate ? petBirthDate.value : '',
                        microchip: microchipNumber ? microchipNumber.value : ''
                    };

                    petsData.push(petData);

                    // Obtener TODOS los requisitos para esta mascota (completados y pendientes)
                    if (countryData && countryData.requirements) {
                        const petReqs = {
                            completed: [],
                            pending: [],
                            optional: []
                        };

                        countryData.requirements.forEach(req => {
                            const checkbox = document.getElementById('req_' + i + '_' + req.id);
                            const isRequired = req.required === true;

                            const reqInfo = {
                                id: req.id,
                                name: req.name,
                                description: req.description,
                                type: req.type || 'general',
                                required: isRequired,
                                category: req.category || 'general'
                            };

                            if (checkbox) {
                                if (checkbox.checked) {
                                    reqInfo.status = 'completed';
                                    petReqs.completed.push(reqInfo);
                                } else {
                                    reqInfo.status = 'pending';
                                    if (isRequired) {
                                        petReqs.pending.push(reqInfo);
                                    } else {
                                        petReqs.optional.push(reqInfo);
                                    }
                                }
                            } else {
                                // Si no hay checkbox, asumir pendiente
                                reqInfo.status = 'pending';
                                if (isRequired) {
                                    petReqs.pending.push(reqInfo);
                                } else {
                                    petReqs.optional.push(reqInfo);
                                }
                            }
                        });

                        allReqsByPet[petName.value] = petReqs;
                    }

                    // Recolectar detalles de vacunas/tratamientos completados
                    const vaccineDetails = [];

                    // Buscar todos los campos de requisitos completados
                    const requirementInputs = document.querySelectorAll('[name^="pets[' + i + '].requirements."]');
                    const detailsMap = {};

                    requirementInputs.forEach(input => {
                        if (input.value && input.value.trim() !== '') {
                            const nameParts = input.name.split('.');
                            const reqId = nameParts[2];
                            const fieldName = nameParts[3];
                            const value = input.value;

                            if (!detailsMap[reqId]) {
                                detailsMap[reqId] = {
                                    fields: {},
                                    name: '',
                                    type: '',
                                    completed: false
                                };
                            }

                            detailsMap[reqId].fields[fieldName] = value;

                            // Verificar si el checkbox está marcado
                            const reqCheckbox = document.querySelector('#req_' + i + '_' + reqId);
                            if (reqCheckbox) {
                                detailsMap[reqId].name = reqCheckbox.getAttribute('data-req-name');
                                detailsMap[reqId].type = reqCheckbox.getAttribute('data-req-type');
                                detailsMap[reqId].completed = reqCheckbox.checked;
                            }
                        }
                    });

                    // Solo agregar detalles de requisitos COMPLETADOS
                    for (const [reqId, details] of Object.entries(detailsMap)) {
                        if (details.completed && Object.keys(details.fields).length > 0) {
                            vaccineDetails.push({
                                requirementId: reqId,
                                requirementName: details.name,
                                requirementType: details.type,
                                fields: details.fields
                            });
                        }
                    }

                    if (vaccineDetails.length > 0) {
                        vaccineDetailsByPet[petName.value] = vaccineDetails;
                    }
                }
            }

            // Crear ventana de impresión
            const printWindow = window.open('', '_blank', 'width=800,height=600');

            // Construir HTML del PDF
            let html = '<!DOCTYPE html>';
            html += '<html>';
            html += '<head>';
            html += '<title>Formulario Internacional - Pet Travel Docs</title>';
            html += '<meta charset="UTF-8">';
            html += '<style>';
            html += '@media print {';
            html += '  body { font-family: "Arial", sans-serif; margin: 15mm; font-size: 12pt; }';
            html += '  .page-break { page-break-after: always; }';
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
            html += '.header { background: linear-gradient(135deg, #17a2b8 0%, #138496 100%); color: white; padding: 25px; border-radius: 10px; margin-bottom: 30px; }';
            html += '.footer { margin-top: 40px; padding-top: 20px; border-top: 2px solid #ddd; font-size: 11pt; color: #7f8c8d; text-align: center; }';
            html += '.status-badge { display: inline-block; padding: 4px 12px; border-radius: 20px; font-size: 11pt; font-weight: bold; margin-left: 10px; }';
            html += '.status-completed { background: #27ae60; color: white; }';
            html += '.status-pending { background: #e74c3c; color: white; }';
            html += '.status-optional { background: #f39c12; color: white; }';
            html += '.summary-box { background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0; border: 2px solid #3498db; }';
            html += '.summary-item { display: flex; justify-content: space-between; margin-bottom: 10px; padding-bottom: 10px; border-bottom: 1px solid #eee; }';
            html += '.warning-box { background: #fff3cd; border: 1px solid #ffeaa7; padding: 15px; border-radius: 6px; margin: 15px 0; }';
            html += '.success-box { background: #d4edda; border: 1px solid #c3e6cb; padding: 15px; border-radius: 6px; margin: 15px 0; }';
            html += '.signature-line { margin-top: 50px; padding-top: 20px; border-top: 1px solid #333; }';
            html += '.flag-icon { font-size: 20px; margin-right: 10px; }';
            html += '.requirement-list { margin-left: 20px; }';
            html += '.requirement-item { margin-bottom: 8px; padding: 8px; border-left: 4px solid #ddd; }';
            html += '.requirement-item.completed { border-left-color: #27ae60; background-color: #f8fff8; }';
            html += '.requirement-item.pending { border-left-color: #e74c3c; background-color: #fff8f8; }';
            html += '.requirement-item.optional { border-left-color: #f39c12; background-color: #fff9f3; }';
            html += '.vaccine-details-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 10px; margin-top: 10px; }';
            html += '.vaccine-detail-item { padding: 10px; border: 1px solid #d1ecf1; border-radius: 5px; background-color: #d1ecf1; }';
            html += '.vaccine-detail-label { font-weight: bold; color: #0c5460; font-size: 11pt; }';
            html += '.vaccine-detail-value { color: #155724; font-size: 11pt; }';
            html += '.details-section { background: #e8f4f8; padding: 20px; border-radius: 8px; margin: 20px 0; border: 2px solid #17a2b8; }';
            html += '</style>';
            html += '</head>';
            html += '<body>';

            // HEADER (igual que antes)
            html += '<div class="header">';
            html += '<h1 style="color: white; margin-bottom: 10px;">📋 FORMULARIO COMPLETO DE VIAJE INTERNACIONAL</h1>';
            html += '<p style="font-size: 14pt; opacity: 0.9;">Pet Travel Docs - Documento Internacional</p>';

            const now = new Date();
            const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            const formattedDate = now.toLocaleDateString('es-ES', options);
            const formattedTime = now.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit' });

            html += '<p style="font-size: 12pt; opacity: 0.8;">Generado: ' + formattedDate + ' ' + formattedTime + '</p>';
            html += '</div>';

            // RESUMEN EJECUTIVO (igual que antes)
            html += '<div class="summary-box">';
            html += '<h2 style="color: #2c3e50; margin-top: 0;">📊 RESUMEN EJECUTIVO</h2>';

            html += '<div class="summary-item">';
            html += '<span class="label">Cliente:</span>';
            html += '<span class="value">' + (ownerName ? ownerName.value : 'No especificado') + '</span>';
            html += '</div>';

            html += '<div class="summary-item">';
            html += '<span class="label">Destino:</span>';
            html += '<span class="value"><span class="flag-icon">' + (destinationCountry ? destinationCountry.options[destinationCountry.selectedIndex].text.substring(0, 4) : '') + '</span> ' + (destinationCountry ? destinationCountry.options[destinationCountry.selectedIndex].text : 'No seleccionado') + '</span>';
            html += '</div>';

            html += '<div class="summary-item">';
            html += '<span class="label">Fecha Viaje:</span>';
            html += '<span class="value">' + (travelDate ? travelDate.value : 'No especificada') + (regresoDate && regresoDate.value ? ' al ' + regresoDate.value : ' (Solo ida)') + '</span>';
            html += '</div>';

            html += '<div class="summary-item">';
            html += '<span class="label">Total Mascotas:</span>';
            html += '<span class="value">' + petsData.length + ' mascota(s)</span>';
            html += '</div>';

            // Calcular estadísticas
            let totalCompleted = 0;
            let totalPending = 0;
            let totalOptional = 0;
            let totalVaccineDetails = 0;

            for (const petName in allReqsByPet) {
                totalCompleted += allReqsByPet[petName].completed.length;
                totalPending += allReqsByPet[petName].pending.length;
                totalOptional += allReqsByPet[petName].optional.length;
            }

            for (const petName in vaccineDetailsByPet) {
                totalVaccineDetails += vaccineDetailsByPet[petName].length;
            }

            html += '<div class="summary-item">';
            html += '<span class="label">Requisitos Completados:</span>';
            html += '<span class="value"><span class="status-badge status-completed">' + totalCompleted + ' completado(s)</span></span>';
            html += '</div>';

            html += '<div class="summary-item">';
            html += '<span class="label">Requisitos Pendientes:</span>';
            html += '<span class="value"><span class="status-badge status-pending">' + totalPending + ' pendiente(s)</span></span>';
            html += '</div>';

            html += '<div class="summary-item">';
            html += '<span class="label">Recomendaciones:</span>';
            html += '<span class="value"><span class="status-badge status-optional">' + totalOptional + ' opcional(es)</span></span>';
            html += '</div>';

            html += '<div class="summary-item">';
            html += '<span class="label">Detalles Registrados:</span>';
            html += '<span class="value">' + totalVaccineDetails + ' detalle(s) de vacunas/tratamientos</span>';
            html += '</div>';

            if (useCarrier && useCarrier.checked && carrierName && carrierName.value) {
                html += '<div class="summary-item">';
                html += '<span class="label">Encargado de Traslado:</span>';
                html += '<span class="value">' + carrierName.value + '</span>';
                html += '</div>';
            }

            html += '</div>';

             // SECCIÓN 1: INFORMACIÓN DEL VIAJE INTERNACIONAL
                    html += '<div class="section">';
                    html += '<h2>✈️ INFORMACIÓN DEL VIAJE INTERNACIONAL</h2>';
                    html += '<div class="info-grid">';

                    html += '<div class="info-item">';
                    html += '<span class="label">País Destino:</span>';
                    html += '<span class="value"><span class="flag-icon">' + (destinationCountry ? destinationCountry.options[destinationCountry.selectedIndex].text.substring(0, 4) : '') + '</span> ' + (destinationCountry ? destinationCountry.options[destinationCountry.selectedIndex].text : 'No seleccionado') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item">';
                    html += '<span class="label">Fecha Ida:</span>';
                    html += '<span class="value">' + (travelDate ? travelDate.value : 'No especificada') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item">';
                    html += '<span class="label">Fecha Regreso:</span>';
                    html += '<span class="value">' + (regresoDate && regresoDate.value ? regresoDate.value : 'No especificada (Solo ida)') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item">';
                    html += '<span class="label">Tipo de Transporte:</span>';
                    html += '<span class="value">' + (travelType ? travelType.options[travelType.selectedIndex].text : 'No seleccionado') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item">';
                    html += '<span class="label">Lugar de Arribo:</span>';
                    html += '<span class="value">' + (arrivalPlace ? arrivalPlace.value : 'No especificado') + '</span>';
                    html += '</div>';

                    // Calcular duración del viaje si hay fecha de regreso
                    if (travelDate && travelDate.value && regresoDate && regresoDate.value) {
                        const startDate = new Date(travelDate.value);
                        const endDate = new Date(regresoDate.value);
                        const timeDiff = endDate.getTime() - startDate.getTime();
                        const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

                        html += '<div class="info-item">';
                        html += '<span class="label">Duración del Viaje:</span>';
                        html += '<span class="value">' + daysDiff + ' días</span>';
                        html += '</div>';
                    }

                    html += '</div>';
                    html += '</div>';

                    // SECCIÓN 2: INFORMACIÓN DEL DUEÑO
                    html += '<div class="section">';
                    html += '<h2>👤 INFORMACIÓN DEL DUEÑO</h2>';
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
                    html += '<span class="label">Estado:</span>';
                    html += '<span class="value">' + (ownerState ? ownerState.options[ownerState.selectedIndex].text : 'No seleccionado') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item">';
                    html += '<span class="label">Ciudad:</span>';
                    html += '<span class="value">' + (ownerCity ? ownerCity.options[ownerCity.selectedIndex].text : 'No seleccionada') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item">';
                    html += '<span class="label">Código Postal:</span>';
                    html += '<span class="value">' + (ownerZipCode ? ownerZipCode.value : 'No especificado') + '</span>';
                    html += '</div>';

                    html += '<div class="info-item" style="grid-column: span 2;">';
                    html += '<span class="label">Dirección en EE.UU.:</span>';
                    html += '<span class="value">' + (ownerAddress ? ownerAddress.value : 'No especificada') + '</span>';
                    html += '</div>';

                    html += '</div>';
                    html += '</div>';

                    // SECCIÓN 3: INFORMACIÓN DEL ENCARGADO DE TRASLADO (si aplica)
                    if (useCarrier && useCarrier.checked) {
                        html += '<div class="section">';
                        html += '<h2>🚚 INFORMACIÓN DEL ENCARGADO DE TRASLADO</h2>';
                        html += '<div class="info-grid">';

                        html += '<div class="info-item">';
                        html += '<span class="label">Nombre del Encargado:</span>';
                        html += '<span class="value">' + (carrierName ? carrierName.value : 'No especificado') + '</span>';
                        html += '</div>';

                        html += '<div class="info-item">';
                        html += '<span class="label">Email del Encargado:</span>';
                        html += '<span class="value">' + (carrierEmail ? carrierEmail.value : 'No especificado') + '</span>';
                        html += '</div>';

                        html += '<div class="info-item">';
                        html += '<span class="label">Teléfono del Encargado:</span>';
                        html += '<span class="value">' + (carrierPhone ? carrierPhone.value : 'No especificado') + '</span>';
                        html += '</div>';

                        html += '<div class="info-item">';
                        html += '<span class="label">País del Encargado:</span>';
                        html += '<span class="value">' + (carrierCountry ? carrierCountry.options[carrierCountry.selectedIndex].text : 'No seleccionado') + '</span>';
                        html += '</div>';

                        html += '<div class="info-item" style="grid-column: span 2;">';
                        html += '<span class="label">Dirección del Encargado:</span>';
                        html += '<span class="value">' + (carrierAddress ? carrierAddress.value : 'No especificada') + '</span>';
                        html += '</div>';

                        html += '</div>';
                        html += '</div>';
                    }

                    // SECCIÓN 4: INFORMACIÓN DE LAS MASCOTAS
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
                        html += '<th>Color</th>';
                        html += '<th>Género</th>';
                        html += '<th>Nacimiento</th>';
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
                            html += '<td>' + pet.color + '</td>';
                            html += '<td>' + pet.gender + '</td>';
                            html += '<td>' + (pet.birthDate ? pet.birthDate : 'No especificada') + '</td>';
                            html += '<td>' + (pet.microchip ? pet.microchip : 'No tiene') + '</td>';
                            html += '</tr>';
                        }

                        html += '</tbody>';
                        html += '</table>';

                        // Detalles adicionales por mascota
                        html += '<h3 style="margin-top: 30px;">📋 Estado de Requisitos por Mascota</h3>';

                        for (let i = 0; i < petsData.length; i++) {
                            const pet = petsData[i];
                            html += '<div style="margin-bottom: 20px; padding: 15px; border: 1px solid #eee; border-radius: 5px;">';
                            html += '<h4 style="color: #3498db; margin-top: 0;">' + pet.index + '. ' + pet.name + '</h4>';
                            html += '<div class="info-grid">';

                            // Verificar si hay requisitos faltantes para esta mascota
                            if (allReqsByPet[pet.name]) {
                                const missingCount = allReqsByPet[pet.name].length;
                                html += '<div class="info-item">';
                                html += '<span class="label">Requisitos Pendientes:</span>';
                                html += '<span class="value"><span class="status-badge status-pending">' + missingCount + ' pendiente(s)</span></span>';
                                html += '</div>';

                                // Mostrar lista de requisitos faltantes
                                html += '<div class="info-item" style="grid-column: span 2;">';
                                html += '<span class="label">Detalles Pendientes:</span>';
                                html += '<span class="value"><ul style="margin: 5px 0 0 0; padding-left: 20px;">';

                                for (let j = 0; j < allReqsByPet[pet.name].length; j++) {
                                    const req = allReqsByPet[pet.name][j];
                                    html += '<li><strong>' + req.name + '</strong>: ' + req.description + ' <span style="color: #e74c3c;">(' + (req.required ? 'Obligatorio' : 'Recomendado') + ')</span></li>';
                                }

                                html += '</ul></span>';
                                html += '</div>';
                            } else {
                                html += '<div class="info-item">';
                                html += '<span class="label">Estado de Requisitos:</span>';
                                html += '<span class="value"><span class="status-badge status-completed">Completado</span></span>';
                                html += '</div>';
                            }

                            html += '</div>';
                            html += '</div>';
                        }
                    } else {
                        html += '<p class="warning-box">⚠️ No hay mascotas registradas en el formulario.</p>';
                    }

                    html += '</div>';

                    // SECCIÓN 5: INFORMACIÓN DEL PAÍS DESTINO
                    if (destinationCountry && destinationCountry.value) {
                        html += '<div class="section">';
                        html += '<h2>🏛️ INFORMACIÓN DEL PAÍS DESTINO</h2>';

                        const countryText = destinationCountry.options[destinationCountry.selectedIndex].text;
                        html += '<div class="info-grid">';

                        html += '<div class="info-item">';
                        html += '<span class="label">País:</span>';
                        html += '<span class="value"><span class="flag-icon">' + countryText.substring(0, 4) + '</span> ' + countryText + '</span>';
                        html += '</div>';

                        // Usar datos reales del país si están disponibles
                        if (countryData) {
                            html += '<div class="info-item">';
                            html += '<span class="label">Firma Digital Aceptada:</span>';
                            html += '<span class="value">' + (countryData.acceptsDigitalSignature ? '✅ Sí' : '❌ No') + '</span>';
                            html += '</div>';

                            html += '<div class="info-item">';
                            html += '<span class="label">En Lista Negra:</span>';
                            html += '<span class="value">' + (countryData.isBlacklisted ? '⚠️ Sí (Requiere cuarentena)' : '✅ No') + '</span>';
                            html += '</div>';

                            html += '<div class="info-item">';
                            html += '<span class="label">Tiempo de Trámite:</span>';
                            html += '<span class="value">' + (countryData.daysBeforeTravelForForm || '10') + ' días antes del viaje</span>';
                            html += '</div>';

                            // Mostrar requisitos principales
                            if (countryData.requirements && countryData.requirements.length > 0) {
                                const requiredCount = countryData.requirements.filter(req => req.required === true).length;
                                const optionalCount = countryData.requirements.length - requiredCount;

                                html += '<div class="info-item">';
                                html += '<span class="label">Requisitos Totales:</span>';
                                html += '<span class="value">' + countryData.requirements.length + ' (Obligatorios: ' + requiredCount + ', Recomendados: ' + optionalCount + ')</span>';
                                html += '</div>';
                            }
                        } else {
                            // Datos por defecto si no hay información específica
                            html += '<div class="info-item">';
                            html += '<span class="label">Nota:</span>';
                            html += '<span class="value">ℹ️ Consulte con la embajada para requisitos específicos</span>';
                            html += '</div>';
                        }

                        html += '</div>';

                        // Mostrar requisitos principales si existen
                        if (countryData && countryData.requirements && countryData.requirements.length > 0) {
                            const requiredReqs = countryData.requirements.filter(req => req.required === true);
                            if (requiredReqs.length > 0) {
                                html += '<h3 style="margin-top: 25px;">📋 Requisitos Obligatorios Principales</h3>';
                                html += '<div class="requirements-grid">';

                                for (let i = 0; i < Math.min(requiredReqs.length, 4); i++) {
                                    const req = requiredReqs[i];
                                    html += '<div class="requirement-card required">';
                                    html += '<strong>' + req.name + '</strong>';
                                    html += '<p style="margin: 8px 0; font-size: 11pt;">' + req.description + '</p>';
                                    html += '<small><strong>Tipo:</strong> ' + (req.type || 'General') + '</small>';
                                    html += '</div>';
                                }

                                html += '</div>';

                                if (requiredReqs.length > 4) {
                                    html += '<p style="margin-top: 10px;"><em>... y ' + (requiredReqs.length - 4) + ' requisitos obligatorios más</em></p>';
                                }
                            }
                        }

                        html += '</div>';
                    }


            // NUEVA SECCIÓN 6: ESTADO COMPLETO DE REQUISITOS POR MASCOTA
            html += '<div class="section page-break">';
            html += '<h2>📋 ESTADO COMPLETO DE REQUISITOS POR MASCOTA</h2>';

            for (let i = 0; i < petsData.length; i++) {
                const pet = petsData[i];
                const petReqs = allReqsByPet[pet.name];

                if (petReqs) {
                    html += '<div style="margin-bottom: 30px; padding: 20px; border: 2px solid #3498db; border-radius: 8px; background: #f8f9fa;">';
                    html += '<h3 style="color: #2c3e50; margin-top: 0; border-bottom: 2px solid #3498db; padding-bottom: 10px;">';
                    html += '🐾 ' + pet.name + ' - ' + 
                           (petReqs.completed.length + petReqs.pending.length + petReqs.optional.length) + ' requisito(s)';
                    html += '</h3>';

                    // Resumen de estado
                    html += '<div style="display: flex; gap: 15px; margin-bottom: 20px;">';
                    html += '<span class="status-badge status-completed">✓ ' + petReqs.completed.length + ' Completado(s)</span>';
                    html += '<span class="status-badge status-pending">⚠ ' + petReqs.pending.length + ' Pendiente(s)</span>';
                    html += '<span class="status-badge status-optional">💡 ' + petReqs.optional.length + ' Recomendado(s)</span>';
                    html += '</div>';

                    // REQUISITOS COMPLETADOS
                    if (petReqs.completed.length > 0) {
                        html += '<h4 style="color: #27ae60; margin-top: 20px;">✅ REQUISITOS COMPLETADOS</h4>';
                        html += '<div class="requirement-list">';

                        for (let j = 0; j < petReqs.completed.length; j++) {
                            const req = petReqs.completed[j];
                            html += '<div class="requirement-item completed">';
                            html += '<strong>' + req.name + '</strong>';
                            html += ' <span class="status-badge status-completed">COMPLETADO ✓</span>';
                            html += '<div class="small">' + req.description + '</div>';
                            html += '</div>';
                        }

                        html += '</div>';
                    }

                    // REQUISITOS PENDIENTES
                    if (petReqs.pending.length > 0) {
                        html += '<h4 style="color: #e74c3c; margin-top: 20px;">⚠️ REQUISITOS PENDIENTES (OBLIGATORIOS)</h4>';
                        html += '<div class="requirement-list">';

                        for (let j = 0; j < petReqs.pending.length; j++) {
                            const req = petReqs.pending[j];
                            html += '<div class="requirement-item pending">';
                            html += '<strong>' + req.name + '</strong>';
                            html += ' <span class="status-badge status-pending">PENDIENTE ✗</span>';
                            html += '<div class="small">' + req.description + '</div>';
                            html += '</div>';
                        }

                        html += '</div>';
                    }

                    // RECOMENDACIONES (OPCIONALES)
                    if (petReqs.optional.length > 0) {
                        html += '<h4 style="color: #f39c12; margin-top: 20px;">💡 RECOMENDACIONES (OPCIONALES)</h4>';
                        html += '<div class="requirement-list">';

                        for (let j = 0; j < petReqs.optional.length; j++) {
                            const req = petReqs.optional[j];
                            html += '<div class="requirement-item optional">';
                            html += '<strong>' + req.name + '</strong>';
                            html += ' <span class="status-badge status-optional">RECOMENDADO</span>';
                            html += '<div class="small">' + req.description + '</div>';
                            html += '</div>';
                        }

                        html += '</div>';
                    }

                    html += '</div>';
                }
            }

            html += '</div>';

            // NUEVA SECCIÓN 7: DETALLES DE VACUNAS Y TRATAMIENTOS REGISTRADOS
            if (Object.keys(vaccineDetailsByPet).length > 0) {
                html += '<div class="details-section page-break">';
                html += '<h2>💉 DETALLES DE VACUNAS Y TRATAMIENTOS REGISTRADOS</h2>';
                html += '<p><i>Información detallada de vacunas, desparasitantes y tratamientos marcados como completados</i></p>';

                for (let i = 0; i < petsData.length; i++) {
                    const pet = petsData[i];

                    if (vaccineDetailsByPet[pet.name]) {
                        const details = vaccineDetailsByPet[pet.name];

                        html += '<div style="margin-bottom: 25px; padding: 15px; border: 2px solid #17a2b8; border-radius: 8px; background: white;">';
                        html += '<h4 style="color: #17a2b8; margin-top: 0; border-bottom: 2px solid #17a2b8; padding-bottom: 10px;">';
                        html += '🐾 ' + pet.name + ' - ' + details.length + ' registro(s) detallado(s)';
                        html += '</h4>';

                        for (let j = 0; j < details.length; j++) {
                            const detail = details[j];

                            html += '<div style="margin-bottom: 20px; padding: 15px; border: 1px solid #d1ecf1; border-radius: 6px; background: #f8f9fa;">';
                            html += '<h5 style="color: #0c5460; margin-top: 0;">';

                            // Icono según tipo
                            if (detail.requirementType === 'vaccine' || detail.requirementName.toLowerCase().includes('vacun')) {
                                html += '💉 ';
                            } else if (detail.requirementType === 'parasite_treatment' || detail.requirementName.toLowerCase().includes('desparasit') || detail.requirementName.toLowerCase().includes('tratamiento')) {
                                html += '🐛 ';
                            } else if (detail.requirementType === 'test' || detail.requirementType === 'titer_test' || detail.requirementName.toLowerCase().includes('prueba')) {
                                html += '🧪 ';
                            } else {
                                html += '📄 ';
                            }

                            html += detail.requirementName;
                            html += '</h5>';

                            html += '<div class="vaccine-details-grid">';

                            // Mapear nombres de campos amigables
                            const fieldLabels = {
                                'date': '📅 Fecha',
                                'vaccine_date': '📅 Fecha de aplicación',
                                'vaccine_name': '💉 Nombre de la vacuna',
                                'batch': '🏷️ Número de lote',
                                'vaccine_batch': '🏷️ Número de lote',
                                'vet_name': '👨‍⚕️ Veterinario',
                                'vet_license': '📜 Licencia del veterinario',
                                'clinic_name': '🏥 Clínica veterinaria',
                                'clinic_address': '📍 Dirección de la clínica',
                                'medication': '💊 Medicamento utilizado',
                                'next_treatment': '⏭️ Próximo tratamiento',
                                'laboratory': '🔬 Laboratorio fabricante',
                                'result': '📊 Resultado',
                                'test_date': '📅 Fecha de la prueba',
                                'expiration_date': '⏳ Fecha de expiración',
                                'manufacturer': '🏭 Fabricante',
                                'dose': '💊 Dosis aplicada',
                                'route': '🔄 Vía de administración'
                            };

                            for (const [fieldName, fieldValue] of Object.entries(detail.fields)) {
                                if (fieldValue && fieldValue.trim() !== '') {
                                    const label = fieldLabels[fieldName] || 
                                                fieldName.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase());

                                    html += '<div class="vaccine-detail-item">';
                                    html += '<div class="vaccine-detail-label">' + label + '</div>';
                                    html += '<div class="vaccine-detail-value">' + fieldValue + '</div>';
                                    html += '</div>';
                                }
                            }

                            html += '</div>';
                            html += '</div>';
                        }

                        html += '</div>';
                    }
                }

                html += '</div>';
            }

            // SECCIÓN 8: FIRMAS Y AUTORIZACIONES (mantener igual)
            html += '<div class="section">';
            html += '<h2>🖋️ FIRMAS Y AUTORIZACIONES</h2>';
            html += '<div style="margin-top: 30px;">';

            // Firma del dueño
            html += '<div class="signature-line">';
            html += '<p><strong>Firma del Dueño/Remitente:</strong></p>';
            html += '<p style="height: 50px; margin-top: 30px;">_________________________________________</p>';
            html += '<p>Nombre: ' + (ownerName ? ownerName.value : '') + '</p>';
            html += '<p>Fecha: ___________________________</p>';
            html += '</div>';

            // Firma del encargado (si aplica)
            if (useCarrier && useCarrier.checked && carrierName && carrierName.value) {
                html += '<div class="signature-line" style="margin-top: 50px;">';
                html += '<p><strong>Firma del Encargado de Traslado:</strong></p>';
                html += '<p style="height: 50px; margin-top: 30px;">_________________________________________</p>';
                html += '<p>Nombre: ' + carrierName.value + '</p>';
                html += '<p>Fecha: ___________________________</p>';
                html += '</div>';
            }

            // Firma del veterinario (espacio para)
            html += '<div class="signature-line" style="margin-top: 50px;">';
            html += '<p><strong>Firma y Sello del Veterinario Autorizado:</strong></p>';
            html += '<p style="height: 50px; margin-top: 30px;">_________________________________________</p>';
            html += '<p>Nombre: ___________________________</p>';
            html += '<p>Licencia: _________________________</p>';
            html += '<p>Fecha: ___________________________</p>';
            html += '</div>';

            html += '</div>';
            html += '</div>';

            // PIE DE PÁGINA
            html += '<div class="footer">';
            html += '<p><strong>PET TRAVEL DOCS - FORMULARIO INTERNACIONAL</strong></p>';
            html += '<p>Este documento incluye el estado completo de todos los requisitos y detalles registrados.</p>';
            html += '<p>Para documentos oficiales, contacte con las autoridades del país destino y su veterinario.</p>';
            html += '<p>Documento ID: ' + Date.now() + ' | ' + petsData.length + ' mascota(s) | ';
            html += totalCompleted + ' completado(s) | ' + totalPending + ' pendiente(s) | ';
            html += totalVaccineDetails + ' detalle(s) registrado(s)</p>';
            html += '<p><small>Impreso el ' + now.toLocaleDateString() + ' a las ' + now.toLocaleTimeString() + '</small></p>';
            html += '</div>';

            html += '</body>';
            html += '</html>';

            // Escribir HTML en la ventana
            printWindow.document.write(html);
            printWindow.document.close();

            // Auto-imprimir después de cargar
            setTimeout(function() {
                printWindow.print();
            }, 500);
        }
        function toggleOptionalRequirement(checkbox) {
            // Similar a toggleRequiredRequirement pero para opcionales
            const petIndex = checkbox.dataset.petIndex;
            const reqId = checkbox.dataset.reqId;
            const reqType = checkbox.dataset.reqType;
            const isChecked = checkbox.checked;

            const fieldsContainer = document.getElementById('req_fields_' + petIndex + '_' + reqId);

            if (isChecked && (reqType === 'vaccine' || reqType === 'parasite_treatment' || reqType === 'test')) {
                // Mostrar campos
                fieldsContainer.style.display = 'block';
                generateDynamicFields(petIndex, reqId, reqType);
            } else {
                // Ocultar campos
                fieldsContainer.style.display = 'none';
                fieldsContainer.innerHTML = '';
            }
        }    
        function generateDynamicFields(petIndex, reqId, reqType) {
        const container = document.getElementById('req_fields_' + petIndex + '_' + reqId);
        if (!container) return;

        let html = '<div class="p-3 border rounded bg-light">';
        html += '<h6 class="mb-3"><i class="fas fa-file-medical me-2"></i> Detalles del ' + 
               (reqType === 'vaccine' ? 'vacunación' : 
                reqType === 'parasite_treatment' ? 'desparasitante' : 'prueba') + '</h6>';

        html += '<div class="row g-3">';

        if (reqType === 'vaccine') {
            html += '<div class="col-md-6">';
            html += '<label class="form-label small required-field">Fecha de aplicación *</label>';
            html += '<input type="date" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vaccine_date" required>';
            html += '</div>';

            html += '<div class="col-md-6">';
            html += '<label class="form-label small required-field">Nombre de la vacuna *</label>';
            html += '<input type="text" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vaccine_name" required ';
            html += 'placeholder="Ej: Defensor 3, Rabisin, etc.">';
            html += '</div>';

            html += '<div class="col-md-6">';
            html += '<label class="form-label small">Número de lote</label>';
            html += '<input type="text" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vaccine_batch" ';
            html += 'placeholder="Ej: VAC-2024-001">';
            html += '</div>';

            html += '<div class="col-md-6">';
            html += '<label class="form-label small">Laboratorio fabricante</label>';
            html += '<input type="text" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.laboratory" ';
            html += 'placeholder="Nombre del laboratorio">';
            html += '</div>';

        } else if (reqType === 'parasite_treatment') {
            html += '<div class="col-md-6">';
            html += '<label class="form-label small required-field">Fecha de tratamiento *</label>';
            html += '<input type="date" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.date" required>';
            html += '</div>';

            html += '<div class="col-md-6">';
            html += '<label class="form-label small required-field">Medicamento utilizado *</label>';
            html += '<input type="text" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.medication" required ';
            html += 'placeholder="Nombre del medicamento">';
            html += '</div>';

            html += '<div class="col-md-6">';
            html += '<label class="form-label small">Próximo tratamiento</label>';
            html += '<input type="date" class="form-control form-control-sm" ';
            html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.next_treatment">';
            html += '</div>';
        }

        // Campos comunes para todos los tipos
        html += '<div class="col-md-6">';
        html += '<label class="form-label small required-field">Nombre del veterinario *</label>';
        html += '<input type="text" class="form-control form-control-sm" ';
        html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vet_name" required ';
        html += 'placeholder="Dr. Nombre Apellido">';
        html += '</div>';

        html += '<div class="col-md-6">';
        html += '<label class="form-label small required-field">Licencia del veterinario *</label>';
        html += '<input type="text" class="form-control form-control-sm" ';
        html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.vet_license" required ';
        html += 'placeholder="Ej: VET-12345">';
        html += '</div>';

        html += '<div class="col-md-8">';
        html += '<label class="form-label small required-field">Nombre de la clínica *</label>';
        html += '<input type="text" class="form-control form-control-sm" ';
        html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.clinic_name" required ';
        html += 'placeholder="Clínica Veterinaria">';
        html += '</div>';

        html += '<div class="col-md-4">';
        html += '<button type="button" class="btn btn-sm btn-outline-info mt-4" ';
        html += 'onclick="copyVetInfoToAll(' + petIndex + ', \'' + reqId + '\')">';
        html += '<i class="fas fa-copy me-1"></i> Copiar</button>';
        html += '</div>';

        html += '<div class="col-12">';
        html += '<label class="form-label small">Dirección de la clínica</label>';
        html += '<input type="text" class="form-control form-control-sm" ';
        html += 'name="pets[' + petIndex + '].requirements.' + reqId + '.clinic_address" ';
        html += 'placeholder="Calle 123, Ciudad, Estado">';
        html += '</div>';

        html += '</div>';
        html += '</div>';

        container.innerHTML = html;
    }    
        //hasta aqui
        document.addEventListener('DOMContentLoaded', function () {
        const formContainer = document.querySelector('.form-container');
        if (formContainer) {
            formContainer.style.width = '95%';
            formContainer.style.maxWidth = 'none';
        }

        const firstPetBreedSelect = document.querySelector('[name="pets[0].petBreed"]');
        if (firstPetBreedSelect) {
            firstPetBreedSelect.id = 'petBreed_0';
            const firstPetType = document.querySelector('[name="pets[0].petType"]');
            if (firstPetType && firstPetType.value) {
                setTimeout(function() {
                    updatePetBreeds(firstPetType, 0);
                }, 100);
            }
        }
        const firstPetSpecies = document.querySelector('[name="pets[0].petType"]');
        if (firstPetSpecies) {
            firstPetSpecies.addEventListener('change', function() {
                updatePetRequirements(0);
            });
        }
        const today = new Date().toISOString().split('T')[0];
        if (document.getElementById('travelDate')) {
            document.getElementById('travelDate').min = today;
            document.getElementById('travelDate').addEventListener('change', function() {
                if (document.getElementById('regresoDate')) {
                    document.getElementById('regresoDate').min = document.getElementById('travelDate').value;
                }
                validateReturnDate();
            });
        }

        const stateSelect = document.getElementById('ownerState');
        if (stateSelect) stateSelect.addEventListener('change', updateCities);

        const countrySelect = document.getElementById('destinationCountry');
        if (countrySelect) {
            // Usar debouncing para evitar múltiples cargas
            let debounceTimer;
            countrySelect.addEventListener('change', function() {
                clearTimeout(debounceTimer);
                debounceTimer = setTimeout(() => {                
                    validateReturnDate();
                    updateCountryInfo();

                    const countryFieldsContainer = document.getElementById('countryFieldsContainer');
                    if (countryFieldsContainer) {
                        countryFieldsContainer.style.display = 'none';
                    }

                    for (let i = 0; i < petCount; i++) {
                        updatePetRequirements(i);
                    }
                }, 300); // 300ms debounce
            });

            const initialCountryCode = countrySelect.value;
            if (initialCountryCode) {
                setTimeout(function() {
                    updatePetRequirements(0);
                    updateCountryInfo();
                }, 500);
            }
        }

        const firstPetNameInput = document.querySelector('[name="pets[0].petName"]');
        if (firstPetNameInput) {
            firstPetNameInput.addEventListener('input', function() {
                const countryCode = document.getElementById('destinationCountry').value;
                if (this.value.trim() && countryCode) {
                    updatePetRequirements(0);
                }
            });
        }

        const petTravelForm = document.getElementById('petTravelForm');
        if (petTravelForm) {
            petTravelForm.addEventListener('submit', function (e) {
                e.preventDefault();
                const requiredFields = [
                    'ownerName', 'ownerEmail', 'ownerPhone', 
                    'ownerAddress', 'ownerState', 'ownerCity', 
                    'ownerZipCode', 'destinationCountry', 'travelDate'
                ];

                let isValid = true;
                let firstInvalidField = null;

                requiredFields.forEach(function(fieldId) {
                    const field = document.getElementById(fieldId);
                    if (field && !field.value.trim()) {
                        isValid = false;
                        if (!firstInvalidField) firstInvalidField = field;
                        field.classList.add('is-invalid');
                        let hasErrorMsg = false;
                        const nextSibling = field.nextElementSibling;
                        if (nextSibling && nextSibling.classList.contains('invalid-feedback')) {
                            hasErrorMsg = true;
                        }
                        if (!hasErrorMsg) {
                            const errorDiv = document.createElement('div');
                            errorDiv.className = 'invalid-feedback';
                            errorDiv.textContent = 'Este campo es requerido';
                            field.parentNode.appendChild(errorDiv);
                        }
                    } else if (field) {
                        field.classList.remove('is-invalid');
                        const errorDiv = field.nextElementSibling;
                        if (errorDiv && errorDiv.classList.contains('invalid-feedback')) {
                            errorDiv.remove();
                        }
                    }
                });

            const emailField = document.getElementById('ownerEmail');
            if (emailField) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailField.value && !emailRegex.test(emailField.value)) {
                    isValid = false;
                    emailField.classList.add('is-invalid');
                    let hasEmailError = false;
                    const emailNextSibling = emailField.nextElementSibling;
                    if (emailNextSibling && emailNextSibling.classList.contains('invalid-feedback')) {
                        hasEmailError = true;
                    }
                    if (!hasEmailError) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'invalid-feedback';
                        errorDiv.textContent = 'Ingrese un email válido';
                        emailField.parentNode.appendChild(errorDiv);
                    }
                }
            }
            
            const travelDateField = document.getElementById('travelDate');
            if (travelDateField && travelDateField.value) {
                const travelDate = new Date(travelDateField.value);
                const currentDate = new Date();
                currentDate.setHours(0, 0, 0, 0);

                if (travelDate < currentDate) {
                    isValid = false;
                    travelDateField.classList.add('is-invalid');

                    let hasDateError = false;
                    const dateNextSibling = travelDateField.nextElementSibling;
                    if (dateNextSibling && dateNextSibling.classList.contains('invalid-feedback')) {
                        hasDateError = true;
                    }

                    if (!hasDateError) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'invalid-feedback';
                        errorDiv.textContent = 'La fecha de viaje no puede ser en el pasado';
                        travelDateField.parentNode.appendChild(errorDiv);
                    }
                }
            }
            
            const regresoDateField = document.getElementById('regresoDate');
            if (regresoDateField && regresoDateField.value) {
                validateReturnDate();
                const submitBtn = document.getElementById('submitBtn');
                if (submitBtn && submitBtn.disabled) {
                    isValid = false;
                    showAlert('Por favor corrija la fecha de regreso para continuar', 'warning');
                    return;
                }
            }
            
            let hasValidPet = false;
            for (let i = 0; i < petCount; i++) {
                const petNameInput = document.querySelector('[name="pets[' + i + '].petName"]');
                const petTypeSelect = document.querySelector('[name="pets[' + i + '].petType"]');

                const petName = petNameInput ? petNameInput.value.trim() : '';
                const petType = petTypeSelect ? petTypeSelect.value.trim() : '';

                if (petName && petType) {
                    hasValidPet = true;
                    break;
                }
            }

            if (!hasValidPet) {
                isValid = false;
                showAlert('Debe completar al menos 1 mascota con nombre y tipo.', 'warning');
                return;
            }
            
            const useCarrierCheckbox = document.getElementById('useCarrier');
            if (useCarrierCheckbox && useCarrierCheckbox.checked) {
                const requiredCarrierFields = ['carrierName', 'carrierEmail', 'carrierPhone'];
                let missing = [];

                requiredCarrierFields.forEach(function(id) {
                    const el = document.getElementById(id);
                    if (!el || !el.value.trim()) {
                        let fieldLabel = id;
                        if (el && el.previousElementSibling) {
                            const labelText = el.previousElementSibling.textContent;
                            if (labelText) {
                                fieldLabel = labelText.trim();
                            }
                        }
                        missing.push(fieldLabel);
                    }
                });

                if (missing.length > 0) {
                    isValid = false;
                    showAlert('Complete los datos del encargado del traslado: ' + missing.join(', '), 'warning');
                    return;
                }
            }
            
            if (isValid) {
                const submitBtn = document.getElementById('submitBtn');
                if (submitBtn) {
                    const originalText = submitBtn.innerHTML;
                    const originalDisabled = submitBtn.disabled;

                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i> Procesando...';
                    submitBtn.disabled = true;
                    setTimeout(function() {
                        showAlert('Formulario enviado exitosamente', 'success');
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = originalDisabled;
                    }, 2000);
                }
            } else {
                if (firstInvalidField) {
                    firstInvalidField.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    firstInvalidField.focus();
                }
            }
        });
    }
    
    window.addEventListener('scroll', function() {
        const sections = document.querySelectorAll('.form-section');
        const steps = document.querySelectorAll('.step');
        sections.forEach(function(section, index) {
            const rect = section.getBoundingClientRect();
            if (rect.top <= 100 && rect.bottom >= 100) {
                steps.forEach(function(step) {
                    step.classList.remove('active');
                });
                if (steps[index]) {
                    steps[index].classList.add('active');
                }
            }
        });
    });
    
    function adjustContainerWidth() {
        const formContainer = document.querySelector('.form-container');
        if (formContainer) {
            if (window.innerWidth > 1600) {
                formContainer.style.width = '95%';
            } else if (window.innerWidth > 1400) {
                formContainer.style.width = '98%';
            } else if (window.innerWidth > 1200) {
                formContainer.style.width = '97%';
            } else {
                formContainer.style.width = '100%';
            }
        }
    }
    
    window.addEventListener('resize', adjustContainerWidth);
    adjustContainerWidth();

    if (!window.missingReqsTemp) {
        window.missingReqsTemp = [];
    }
    
    function addBudgetButtonToForm() {
        const petSection = document.querySelector('.form-section');
        if (!petSection) return;
        const budgetContainer = document.createElement('div');
        budgetContainer.className = 'mt-4 pt-3 border-top';
        budgetContainer.id = 'budgetButtonContainer';
        const budgetButton = document.createElement('button');
        budgetButton.type = 'button';
        budgetButton.className = 'btn btn-warning';
        budgetButton.id = 'budgetSummaryBtn';
        
        function updateBudgetButton() {
            const count = window.missingReqsTemp ? window.missingReqsTemp.length : 0;
            budgetButton.innerHTML = '<i class="fas fa-shopping-cart me-1"></i> Ver Presupuesto (' + count + ')';

            if (count > 0) {
                budgetButton.style.display = 'inline-block';
            } else {
                budgetButton.style.display = 'none';
            }
        }
        
        budgetButton.onclick = function() {
            redirectToBudgetWithAllMissing();
        };
        
        const clearButton = document.createElement('button');
        clearButton.type = 'button';
        clearButton.className = 'btn btn-outline-danger btn-sm ms-2';
        clearButton.innerHTML = '<i class="fas fa-trash me-1"></i> Limpiar';
        clearButton.onclick = function() {
            if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
                if (confirm('¿Está seguro de limpiar todos los requisitos del presupuesto temporal?')) {
                    window.missingReqsTemp = [];
                    updateBudgetButton();
                    showAlert('Presupuesto temporal limpiado', 'info');
                }
            } else {
                showAlert('No hay requisitos en el presupuesto temporal', 'info');
            }
        };

        budgetContainer.appendChild(budgetButton);
        budgetContainer.appendChild(clearButton);
        const petSectionParent = petSection.parentNode;
        if (petSectionParent) {
            petSectionParent.insertBefore(budgetContainer, petSection.nextSibling);
            updateBudgetButton();
            setInterval(updateBudgetButton, 2000);
        }
    }
    
    window.addToBudgetIfMissing = function(requirement, petIndex, isCompleted) {
        const petNameInput = document.querySelector('[name="pets[' + petIndex + '].petName"]');
        let petName = '';
        if (petNameInput) {
            petName = petNameInput.value;
        } else {
            petName = 'Mascota ' + (parseInt(petIndex) + 1);
        }
        
        const countrySelect = document.getElementById('destinationCountry');
        const countryCode = countrySelect ? countrySelect.value : '';
        const ownerName = document.getElementById('ownerName') ? document.getElementById('ownerName').value : '';
        const ownerEmail = document.getElementById('ownerEmail') ? document.getElementById('ownerEmail').value : '';
        const travelDate = document.getElementById('travelDate') ? document.getElementById('travelDate').value : '';
        const petTypeSelect = document.querySelector('[name="pets[' + petIndex + '].petType"]');
        let petType = '';
        if (petTypeSelect) {
            petType = petTypeSelect.options[petTypeSelect.selectedIndex].text;
        }
        
        if (!isCompleted && requirement.required === true) {
            const missingReq = {
                name: requirement.name || '',
                description: requirement.description || '',
                type: requirement.type || 'other',
                estimatedCost: window.estimateCost ? window.estimateCost(requirement.type) : 50,
                petName: petName,
                petIndex: petIndex,
                requirementId: requirement.id || '',
                addedAt: new Date().toISOString()
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

        } else if (isCompleted && requirement.required === true) {
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
        
        const budgetBtn = document.getElementById('budgetSummaryBtn');
            if (budgetBtn) {
                const count = window.missingReqsTemp ? window.missingReqsTemp.length : 0;
                budgetBtn.innerHTML = '<i class="fas fa-shopping-cart me-1"></i> Ver Presupuesto (' + count + ')';

                if (count > 0) {
                    budgetBtn.style.display = 'inline-block';
                } else {
                    budgetBtn.style.display = 'none';
                }
            }
        };
    
        window.redirectToBudgetWithAllMissing = function() {
            if (!window.missingReqsTemp || window.missingReqsTemp.length === 0) {
                showAlert('No hay requisitos faltantes para agregar al presupuesto', 'warning');
                return;
            }

            const clientName = document.getElementById('ownerName') ? document.getElementById('ownerName').value : '';
            const clientEmail = document.getElementById('ownerEmail') ? document.getElementById('ownerEmail').value : '';
            const travelDate = document.getElementById('travelDate') ? document.getElementById('travelDate').value : '';
            const countrySelect = document.getElementById('destinationCountry');
            const destination = countrySelect ? countrySelect.options[countrySelect.selectedIndex].text : '';

            const petsMap = {};
            for (let i = 0; i < window.missingReqsTemp.length; i++) {
                const req = window.missingReqsTemp[i];
                if (!petsMap[req.petName]) {
                    petsMap[req.petName] = true;
                }
            }

            const petsList = Object.keys(petsMap).join(', ');
            const formData = {
                client: clientName,
                pets: petsList,
                petType: 'Varias especies',
                destination: destination,
                petCount: Object.keys(petsMap).length.toString(),
                clientEmail: clientEmail,
                travelDate: travelDate,
                missingRequirements: JSON.stringify(window.missingReqsTemp)
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

            window.location.href = url;
        };
    
        if (!window.estimateCost) {
            window.estimateCost = function(type) {
                const costs = {
                    'vaccine': 50,
                    'parasite_treatment': 30,
                    'test': 80,
                    'certificate': 100,
                    'health_certificate': 120,
                    'microchip': 40,
                    'quarantine': 200,
                    'other': 40
                };
                return costs[type] || 50;
            };
        }
    
        if (window.toggleRequiredRequirement) {
            const originalToggleRequiredRequirement = window.toggleRequiredRequirement;
            window.toggleRequiredRequirement = function(checkbox) {
                if (originalToggleRequiredRequirement) {
                    originalToggleRequiredRequirement(checkbox);
                }

                const petIndex = checkbox.dataset.petIndex;
                const reqId = checkbox.dataset.reqId;
                const reqName = checkbox.dataset.reqName;
                const reqType = checkbox.dataset.reqType;
                const reqDesc = checkbox.dataset.reqDesc;
                const isChecked = checkbox.checked;
                const requirement = {
                    id: reqId,
                    name: reqName,
                    type: reqType,
                    description: reqDesc,
                    required: true
                };

                if (window.addToBudgetIfMissing) {
                    window.addToBudgetIfMissing(requirement, petIndex, isChecked);
                }

                if (isChecked) {
                    checkbox.parentElement.classList.add('text-success');
                } else {
                    checkbox.parentElement.classList.remove('text-success');
                }
            };
        }

        setTimeout(function() {
            addBudgetButtonToForm();
        }, 1000);
    
        function addBudgetButtonToNavbar() {
            const navbar = document.querySelector('.navbar .container');
            if (navbar) {
                const existingBudgetBtn = document.getElementById('navbarBudgetBtn');
                if (!existingBudgetBtn) {
                    const budgetBtn = document.createElement('button');
                    budgetBtn.type = 'button';
                    budgetBtn.className = 'btn btn-warning btn-sm ms-2';
                    budgetBtn.id = 'navbarBudgetBtn';
                    budgetBtn.innerHTML = '<i class="fas fa-calculator me-1"></i> <span id="navbarBudgetCount">0</span>';
                    budgetBtn.title = 'Ver presupuesto de requisitos faltantes';
                    budgetBtn.onclick = function() {
                        if (window.missingReqsTemp && window.missingReqsTemp.length > 0) {
                            window.redirectToBudgetWithAllMissing();
                        } else {
                            showAlert('No hay requisitos en el presupuesto. Primero seleccione requisitos faltantes.', 'info');
                        }
                    };

                    navbar.appendChild(budgetBtn);
                    setInterval(function() {
                        const count = window.missingReqsTemp ? window.missingReqsTemp.length : 0;
                        const countSpan = document.getElementById('navbarBudgetCount');
                        if (countSpan) {
                            countSpan.textContent = count;
                            if (count > 0) {
                                budgetBtn.classList.remove('btn-outline-warning');
                                budgetBtn.classList.add('btn-warning');
                            } else {
                                budgetBtn.classList.remove('btn-warning');
                                budgetBtn.classList.add('btn-outline-warning');
                            }
                        }
                    }, 1000);
                }
            }
        }

        setTimeout(addBudgetButtonToNavbar, 1500);

    });
        function adjustContainerWidth() {
            const formContainer = document.querySelector('.form-container');
            if (formContainer) {
                if (window.innerWidth > 1600) {
                    formContainer.style.width = '95%';
                } else if (window.innerWidth > 1400) {
                    formContainer.style.width = '98%';
                } else if (window.innerWidth > 1200) {
                    formContainer.style.width = '97%';
                } else {
                    formContainer.style.width = '100%';
                }
            }
        }
        window.addEventListener('resize', adjustContainerWidth);
        window.addEventListener('load', adjustContainerWidth);
    </script>
</body>
</html>