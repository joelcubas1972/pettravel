<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
<%@ page import="java.lang.reflect.Type" %>
<%@ page import="java.util.*" %>
<%
    String client = (String) request.getAttribute("client");
    String pets = (String) request.getAttribute("pets");
    String petType = (String) request.getAttribute("petType");
    String destination = (String) request.getAttribute("destination");
    String petCount = (String) request.getAttribute("petCount");
    String clientEmail = (String) request.getAttribute("clientEmail");
    String travelDate = (String) request.getAttribute("travelDate");
    String missingRequirementsJson = (String) request.getAttribute("missingRequirements");
    List<Map<String, Object>> missingRequirements = (List<Map<String, Object>>) request.getAttribute("missingRequirementsList");

    // Si la lista viene null, intentar parsear del JSON
    if (missingRequirements == null && missingRequirementsJson != null && 
        !missingRequirementsJson.trim().isEmpty()) {
        try {
            Gson gson = new Gson();
            Type listType = new TypeToken<List<Map<String, Object>>>(){}.getType();
            missingRequirements = gson.fromJson(missingRequirementsJson, listType);
        } catch (Exception e) {
            e.printStackTrace();
            missingRequirements = new ArrayList<>();
        }
    }
    
    // Si sigue siendo null, crear lista vacía
    if (missingRequirements == null) {
        missingRequirements = new ArrayList<>();
    }

    // Valores por defecto
    if (client == null || client.trim().isEmpty()) client = "Cliente";
    if (pets == null || pets.trim().isEmpty()) pets = "Mascota(s)";
    if (petType == null || petType.trim().isEmpty()) petType = "Especie";
    if (destination == null || destination.trim().isEmpty()) destination = "País Destino";
    if (clientEmail == null) clientEmail = "";
    if (travelDate == null) travelDate = "";
    if (petCount == null || petCount.trim().isEmpty()) petCount = "1";

    // Sanitizar
    client = client.replaceAll("[<>\"'&]", "");
    pets = pets.replaceAll("[<>\"'&]", "");
    petType = petType.replaceAll("[<>\"'&]", "");
    destination = destination.replaceAll("[<>\"'&]", "");
    clientEmail = clientEmail.replaceAll("[<>\"'&]", "");
    travelDate = travelDate.replaceAll("[<>\"'&]", "");

    // Fecha actual
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
    String currentDate = sdf.format(new java.util.Date());
    
    // Calcular total inicial
    double initialTotal = 0.0;
    for (Map<String, Object> req : missingRequirements) {
        Object costObj = req.get("estimatedCost");
        if (costObj != null) {
            try {
                if (costObj instanceof Number) {
                    initialTotal += ((Number) costObj).doubleValue();
                } else if (costObj instanceof String) {
                    initialTotal += Double.parseDouble((String) costObj);
                } else if (costObj instanceof Double) {
                    initialTotal += (Double) costObj;
                } else if (costObj instanceof Integer) {
                    initialTotal += ((Integer) costObj).doubleValue();
                }
            } catch (Exception e) {
                // Ignorar
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Presupuesto - Pet Travel Docs</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            :root {
                --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                --success-gradient: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #f8f9fa;
                padding-top: 20px;
                padding-bottom: 50px;
                min-height: 100vh;
            }

            .budget-container {
                max-width: 90vw; /* En lugar de 1200px */
                width: 90%; /* Ocupa 90% del ancho */
                margin: 0 auto;
                background: white;
                border-radius: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
                padding: 30px;
                margin-top: 20px;
            }

            .header-section {
                background: var(--success-gradient);
                color: white;
                padding: 25px;
                border-radius: 15px;
                margin-bottom: 30px;
            }

            .table-responsive {
                width: 100%;
                overflow-x: auto;
            }

            .budget-table {
                width: 100%; /* Tabla ocupa el 100% del contenedor */
            }

            .budget-table th,
            .budget-table td {
                white-space: nowrap;
                padding: 12px 15px; /* Más espacio en celdas */
            }

            .total-section {
                background-color: #f8fff9;
                border: 2px solid #28a745;
                border-radius: 10px;
                padding: 20px;
                margin-top: 30px;
            }

            .missing-requirements {
                background-color: #fff8e1;
                border-left: 5px solid #ffc107;
                padding: 15px;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .btn-add-line {
                background: var(--primary-gradient);
                color: white;
                border: none;
                border-radius: 8px;
                padding: 8px 15px;
                font-weight: 500;
            }

            .btn-add-line:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            }

            .btn-generate {
                background: var(--success-gradient);
                color: white;
                border: none;
                padding: 12px 30px;
                border-radius: 10px;
                font-weight: 600;
                font-size: 16px;
            }

            .btn-generate:hover {
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3);
            }

            .client-info-card {
                background: #f8f9fa;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                border-left: 4px solid #007bff;
            }

            .info-label {
                font-weight: 600;
                color: #495057;
                margin-bottom: 5px;
            }

            .info-value {
                font-size: 16px;
                color: #212529;
            }

            .page-title {
                color: #2c3e50;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .page-subtitle {
                color: #6c757d;
                margin-bottom: 30px;
            }

            .email-modal {
                z-index: 10000 !important;
            }

            @media print {
                .no-print {
                    display: none !important;
                }

                .budget-container {
                    box-shadow: none;
                    padding: 0;
                }

                body {
                    background: white;
                    padding: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="budget-container">
                <!-- Header -->
                <div class="header-section">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <h1 class="mb-2">
                                <i class="fas fa-calculator me-2"></i>Presupuesto para Exportación
                            </h1>
                            <p class="mb-0">Documento detallado de costos y servicios</p>
                        </div>
                        <div class="col-md-4 text-end">
                            <div class="btn-group no-print" role="group">
                                <button type="button" class="btn btn-light me-2" onclick="window.print()">
                                    <i class="fas fa-print me-1"></i> Imprimir
                                </button>
                                <button type="button" class="btn btn-light" onclick="downloadPDF()">
                                    <i class="fas fa-file-pdf me-1"></i> PDF
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Información del Cliente -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <div class="client-info-card">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="info-label">Cliente</div>
                                    <div class="info-value" id="clientName"><%= client%></div>
                                </div>
                                <div class="col-md-2">
                                    <div class="info-label">Email</div>
                                    <div class="info-value text-primary fw-bold" id="clientEmailDisplay">
                                        <% if (clientEmail != null && !clientEmail.trim().isEmpty()) { %>
                                            <div class="d-flex align-items-center">
                                                <span class="text-primary fw-bold" id="clientEmailDisplay">
                                                    <%= clientEmail%>
                                                </span>
                                                <button type="button" class="btn btn-sm btn-outline-secondary ms-2" 
                                                        onclick="copyEmailToClipboard()" title="Copiar email">
                                                    <i class="fas fa-copy"></i>
                                                </button>
                                            </div>
                                        <% } else { %>
                                            <span class="text-warning">No especificado</span>
                                        <% } %>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="info-label">Mascota(s)</div>
                                    <div class="info-value" id="petInfo"><%= pets%> </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="info-label">Destino</div>
                                    <div class="info-value" id="destination"><%= destination%></div>
                                </div>
                                <div class="col-md-2">
                                    <div class="info-label">Cantidad</div>
                                    <div class="info-value" id="petCount">
                                        <% if (petCount != null) { %>
                                            <%= petCount%>
                                        <% } else { %>
                                            1
                                        <% } %>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="info-label">Fecha</div>
                                    <div class="info-value" id="budgetDate"><%= currentDate%></div>
                                </div>
                            </div>
                            <input type="hidden" id="clientEmail" value="<%= clientEmail%>">
                        </div>
                    </div>
                </div>
                <!-- Observaciones -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <label for="budgetNotes" class="form-label">
                            <i class="fas fa-sticky-note me-1"></i> Notas y Observaciones
                        </label>
                        <textarea class="form-control" id="budgetNotes" rows="3" 
                                  placeholder="Detalles adicionales, condiciones especiales, información importante..."></textarea>
                    </div>
                </div>

                <!-- Requisitos Faltantes -->
                <div class="missing-requirements no-print" id="missingRequirementsSection" 
                     style="<%= missingRequirements.isEmpty() ? "display: none;" : "display: block;" %>">
                    <h5><i class="fas fa-exclamation-triangle me-2 text-warning"></i>Requisitos Pendientes Detectados</h5>
                    <div id="missingRequirementsList">
                        <%
                            if (!missingRequirements.isEmpty()) {
                                for (Map<String, Object> req : missingRequirements) {
                                    String name = (String) req.get("name");
                                    String description = (String) req.get("description");
                                    String petName = (String) req.get("petName");
                                    Object costObj = req.get("estimatedCost");
                                    double estimatedCost = 0.0;

                                    if (costObj != null) {
                                        try {
                                            if (costObj instanceof Number) {
                                                estimatedCost = ((Number) costObj).doubleValue();
                                            } else if (costObj instanceof String) {
                                                estimatedCost = Double.parseDouble((String) costObj);
                                            }
                                        } catch (Exception e) {
                                            estimatedCost = 0.0;
                                        }
                                    }

                                    // Escapar para JavaScript
                                    String escapedName = "";
                                    String escapedDesc = "";
                                    if (name != null) {
                                        escapedName = name.replace("'", "\\'").replace("\"", "\\\"");
                                    }
                                    if (description != null) {
                                        escapedDesc = description.replace("'", "\\'").replace("\"", "\\\"");
                                    }
                        %>
                        <div class="d-flex justify-content-between align-items-center mb-2 p-2 bg-white rounded">
                            <div>
                                <strong><%= name != null ? name : "Requisito" %></strong>
                                <div class="small text-muted"><%= description != null ? description : "" %></div>
                                <small class="text-info">
                                    <i class="fas fa-paw me-1"></i>Para: <%= petName != null ? petName : "Mascota" %>
                                    | <i class="fas fa-dollar-sign me-1"></i>Estimado: $<%= String.format("%.2f", estimatedCost) %>
                                </small>
                            </div>
                            <button type="button" class="btn btn-sm btn-outline-success" 
                                    onclick='addSpecificRequirement("<%= escapedName %>", <%= estimatedCost %>)'>
                                <i class="fas fa-plus me-1"></i> Agregar
                            </button>
                        </div>
                        <%
                                }
                            } else {
                        %>
                        <div class="text-center py-3">
                            <i class="fas fa-check-circle fa-2x text-success mb-2"></i>
                            <p class="text-muted mb-0">No hay requisitos pendientes</p>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <!-- Tabla de Servicios -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="page-title mb-0">
                                <i class="fas fa-list me-2"></i>Servicios y Costos
                            </h4>
                            <button type="button" class="btn btn-add-line" onclick="addServiceLine()">
                                <i class="fas fa-plus me-1"></i> Agregar Servicio
                            </button>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-bordered budget-table" id="servicesTable">
                                <thead>
                                    <tr>
                                        <th width="25%">Descripción del Servicio</th> <!-- Más ancho -->
                                        <th width="10%">Cantidad</th>
                                        <th width="20%">Precio Unitario (USD)</th>
                                        <th width="15%">Subtotal (USD)</th>
                                        <th width="10%" class="no-print">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="servicesTableBody">
                                    <!-- Línea inicial -->
                                    <tr id="row_1">
                                        <td>
                                            <input type="text" class="form-control service-description" 
                                                   value="Consulta veterinaria para exportación">
                                        </td>
                                        <td>
                                            <input type="number" class="form-control service-quantity" 
                                                   value="1" min="1" step="1">
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control service-price" 
                                                       value="50.00" min="0" step="0.01">
                                            </div>
                                        </td>
                                        <td>
                                            <span class="service-subtotal fw-bold">$50.00</span>
                                        </td>
                                        <td class="no-print">
                                            <button type="button" class="btn btn-sm btn-danger" onclick="removeService(1)">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Totales -->
                <div class="total-section">
                    <div class="row">
                        <div class="col-md-8">
                            <h5 class="mb-3"><i class="fas fa-file-invoice-dollar me-2"></i>Resumen de Costos</h5>

                            <div class="row mb-2">
                                <div class="col-6 text-end">
                                    <strong>Subtotal:</strong>
                                </div>
                                <div class="col-6">
                                    <span id="subtotalAmount">$50.00</span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 text-end">
                                    <h5 class="mb-0">TOTAL:</h5>
                                </div>
                                <div class="col-6">
                                    <h4 class="text-success mb-0" id="totalAmount">$50.00</h4>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 text-end no-print">
                            <div class="d-grid gap-2">
                                <button type="button" class="btn btn-generate" onclick="generateBudget()">
                                    <i class="fas fa-file-export me-2"></i> Generar Presupuesto Final
                                </button>
                                <button type="button" class="btn btn-outline-secondary" onclick="showEmailModal()">
                                    <i class="fas fa-envelope me-2"></i> Enviar por Email
                                </button>
                                <button type="button" class="btn btn-outline-primary" onclick="goBack()">
                                    <i class="fas fa-arrow-left me-2"></i> Volver al Formulario
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Términos y Condiciones -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="alert alert-light">
                            <h6><i class="fas fa-gavel me-2"></i>Términos y Condiciones</h6>
                            <small class="text-muted">
                                1. Este presupuesto tiene una validez de 30 días.<br>
                                2. Los precios no incluyen impuestos adicionales que puedan aplicar.<br>
                                3. Los requisitos pueden cambiar según regulaciones del país de destino.<br>
                                4. Se requiere pago del 50% para iniciar los trámites.<br>
                                5. Los tiempos de procesamiento pueden variar según la complejidad.
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para enviar email -->
        <div class="modal fade email-modal" id="emailModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="emailModalLabel">
                            <i class="fas fa-envelope me-2"></i>Enviar Presupuesto por Email
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="recipientEmail" class="form-label">
                                <i class="fas fa-at me-1"></i>Email del destinatario
                            </label>
                            <input type="email" class="form-control" id="recipientEmail" 
                                   placeholder="ejemplo@email.com" required>
                            <div class="form-text">
                                El presupuesto será enviado a esta dirección de email
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="emailSubject" class="form-label">
                                <i class="fas fa-tag me-1"></i>Asunto del email
                            </label>
                            <input type="text" class="form-control" id="emailSubject" 
                                   value="Presupuesto para exportación de mascotas" required>
                        </div>
                        <div class="mb-3">
                            <label for="emailMessage" class="form-label">
                                <i class="fas fa-comment-alt me-1"></i>Mensaje personalizado
                            </label>
                            <textarea class="form-control" id="emailMessage" rows="4">
Estimado cliente,

Adjunto encontrará el presupuesto detallado para los servicios de exportación de su(s) mascota(s).

Los términos y condiciones se encuentran detallados en el documento adjunto.

Quedamos a su disposición para cualquier consulta.

Atentamente,
Pet Travel Docs
                            </textarea>
                        </div>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle me-2"></i>
                            Se enviará el presupuesto en formato PDF como archivo adjunto.
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="sendEmail()" id="sendEmailBtn">
                            <i class="fas fa-paper-plane me-1"></i> Enviar Email
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jsPDF -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

        <script>
            let currentRowId = 1;
            let missingRequirements = [];
            let emailModal = null;
            let initialTotal = <%= initialTotal %>;

            // NUEVO: Cargar requisitos usando Gson desde JSP (con concatenación manual)
            function loadFormData() {
                try {
                    // Cargar requisitos desde JSP usando Gson
                    <%
                        if (!missingRequirements.isEmpty()) {
                            com.google.gson.Gson gson = new com.google.gson.Gson();
                            String jsonArray = gson.toJson(missingRequirements);
                            out.print("missingRequirements = " + jsonArray + ";");
                            out.println("addMissingRequirementsToTable();");
                        }
                    %>

                    // También mantener compatibilidad con parámetros URL
                    const urlParams = new URLSearchParams(window.location.search);
                    const missingReqParam = urlParams.get('missingRequirements');

                    if (missingReqParam && missingReqParam.trim() !== '' && 
                        (missingRequirements.length === 0 || missingRequirements[0] === undefined)) {
                        try {
                            const decodedParam = decodeURIComponent(missingReqParam);
                            missingRequirements = JSON.parse(decodedParam);
                            if (missingRequirements && missingRequirements.length > 0) {
                                addMissingRequirementsToTable();
                            }
                        } catch (e) {
                            console.error('Error parsing missing requirements from URL:', e);
                        }
                    }

                    // Calcular totales
                    calculateTotals();

                } catch (error) {
                    console.error('Error loading form data:', error);
                }
            }

            // NUEVO: Función para agregar requisitos faltantes a la tabla (CON CONCATENACIÓN MANUAL)
            function addMissingRequirementsToTable() {
                const tableBody = document.getElementById('servicesTableBody');

                // Limpiar tabla existente
                tableBody.innerHTML = '';

                // Agrupar requisitos por nombre y tipo
                const groupedReqs = {};

                for (let i = 0; i < missingRequirements.length; i++) {
                    const req = missingRequirements[i];
                    const key = (req.name || '') + '_' + (req.type || '');

                    if (!groupedReqs[key]) {
                        groupedReqs[key] = {
                            name: req.name || 'Requisito',
                            description: req.description || '',
                            type: req.type || 'other',
                            quantity: 1,
                            estimatedCost: req.estimatedCost || 0,
                            pets: [req.petName || 'Mascota']
                        };
                    } else {
                        groupedReqs[key].quantity++;
                        groupedReqs[key].pets.push(req.petName || 'Mascota');
                        // Usar el mayor costo estimado
                        groupedReqs[key].estimatedCost = Math.max(
                            groupedReqs[key].estimatedCost, 
                            req.estimatedCost || 0
                        );
                    }
                }

                // Agregar cada grupo a la tabla CON CONCATENACIÓN MANUAL
                let rowId = 0;
                const keys = Object.keys(groupedReqs);
                for (let j = 0; j < keys.length; j++) {
                    const key = keys[j];
                    const req = groupedReqs[key];
                    rowId++;

                    const newRow = document.createElement('tr');
                    newRow.id = 'row_' + rowId;

                    // Descripción con detalles de mascotas
                    let description = req.name;
                    if (req.pets.length > 0) {
                        const uniquePets = [];
                        for (let k = 0; k < req.pets.length; k++) {
                            if (uniquePets.indexOf(req.pets[k]) === -1) {
                                uniquePets.push(req.pets[k]);
                            }
                        }
                        description += ' (para: ' + uniquePets.join(', ') + ')';
                    }

                    // CONCATENACIÓN MANUAL de todo el HTML
                    let rowHtml = '';
                    rowHtml += '<td>';
                    rowHtml += '<input type="text" class="form-control service-description" ';
                    rowHtml += 'value="' + description.replace(/"/g, '&quot;') + '" readonly>';
                    if (req.description) {
                        rowHtml += '<small class="text-muted">' + req.description.replace(/"/g, '&quot;') + '</small>';
                    }
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<input type="number" class="form-control service-quantity" ';
                    rowHtml += 'value="' + req.quantity + '" min="1" step="1">';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<div class="input-group">';
                    rowHtml += '<span class="input-group-text">$</span>';
                    rowHtml += '<input type="number" class="form-control service-price" ';
                    rowHtml += 'value="' + req.estimatedCost.toFixed(2) + '" min="0" step="0.01">';
                    rowHtml += '</div>';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<span class="service-subtotal fw-bold">$' + (req.quantity * req.estimatedCost).toFixed(2) + '</span>';
                    rowHtml += '</td>';

                    rowHtml += '<td class="no-print">';
                    rowHtml += '<button type="button" class="btn btn-sm btn-danger" onclick="removeService(' + rowId + ')">';
                    rowHtml += '<i class="fas fa-trash"></i>';
                    rowHtml += '</button>';
                    rowHtml += '</td>';

                    newRow.innerHTML = rowHtml;
                    tableBody.appendChild(newRow);
                    setupRowEvents(newRow);
                }

                currentRowId = rowId;

                // Si no hay requisitos, agregar línea vacía
                if (rowId === 0) {
                    currentRowId = 1;
                    const newRow = document.createElement('tr');
                    newRow.id = 'row_1';

                    let rowHtml = '';
                    rowHtml += '<td>';
                    rowHtml += '<input type="text" class="form-control service-description" placeholder="Descripción del servicio">';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<input type="number" class="form-control service-quantity" value="1" min="1" step="1">';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<div class="input-group">';
                    rowHtml += '<span class="input-group-text">$</span>';
                    rowHtml += '<input type="number" class="form-control service-price" value="0.00" min="0" step="0.01">';
                    rowHtml += '</div>';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<span class="service-subtotal fw-bold">$0.00</span>';
                    rowHtml += '</td>';

                    rowHtml += '<td class="no-print">';
                    rowHtml += '<button type="button" class="btn btn-sm btn-danger" onclick="removeService(1)">';
                    rowHtml += '<i class="fas fa-trash"></i>';
                    rowHtml += '</button>';
                    rowHtml += '</td>';

                    newRow.innerHTML = rowHtml;
                    tableBody.appendChild(newRow);
                    setupRowEvents(newRow);
                }

                // Agregar servicios adicionales por defecto
                addDefaultServices();
            }

            // NUEVO: Agregar servicios por defecto CON CONCATENACIÓN MANUAL
            function addDefaultServices() {
                const defaultServices = [
                    {
                        description: "Consulta veterinaria para exportación",
                        quantity: 1,
                        price: 50.00
                    },
                    {
                        description: "Procesamiento de documentación",
                        quantity: 1,
                        price: 75.00
                    },
                    {
                        description: "Asesoría en requisitos del país destino",
                        quantity: 1,
                        price: 40.00
                    }
                ];

                for (let i = 0; i < defaultServices.length; i++) {
                    const service = defaultServices[i];
                    currentRowId++;

                    const newRow = document.createElement('tr');
                    newRow.id = 'row_' + currentRowId;

                    let rowHtml = '';
                    rowHtml += '<td>';
                    rowHtml += '<input type="text" class="form-control service-description" ';
                    rowHtml += 'value="' + service.description.replace(/"/g, '&quot;') + '">';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<input type="number" class="form-control service-quantity" ';
                    rowHtml += 'value="' + service.quantity + '" min="1" step="1">';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<div class="input-group">';
                    rowHtml += '<span class="input-group-text">$</span>';
                    rowHtml += '<input type="number" class="form-control service-price" ';
                    rowHtml += 'value="' + service.price.toFixed(2) + '" min="0" step="0.01">';
                    rowHtml += '</div>';
                    rowHtml += '</td>';

                    rowHtml += '<td>';
                    rowHtml += '<span class="service-subtotal fw-bold">$' + service.price.toFixed(2) + '</span>';
                    rowHtml += '</td>';

                    rowHtml += '<td class="no-print">';
                    rowHtml += '<button type="button" class="btn btn-sm btn-danger" onclick="removeService(' + currentRowId + ')">';
                    rowHtml += '<i class="fas fa-trash"></i>';
                    rowHtml += '</button>';
                    rowHtml += '</td>';

                    newRow.innerHTML = rowHtml;
                    document.getElementById('servicesTableBody').appendChild(newRow);
                    setupRowEvents(newRow);
                }
            }

            // NUEVO: Función para agregar un requisito específico desde el botón CON CONCATENACIÓN MANUAL
            function addSpecificRequirement(description, estimatedCost) {
                currentRowId++;

                const newRow = document.createElement('tr');
                newRow.id = 'row_' + currentRowId;

                let rowHtml = '';
                rowHtml += '<td>';
                rowHtml += '<input type="text" class="form-control service-description" ';
                rowHtml += 'value="' + description.replace(/"/g, '&quot;') + '">';
                rowHtml += '</td>';

                rowHtml += '<td>';
                rowHtml += '<input type="number" class="form-control service-quantity" ';
                rowHtml += 'value="1" min="1" step="1">';
                rowHtml += '</td>';

                rowHtml += '<td>';
                rowHtml += '<div class="input-group">';
                rowHtml += '<span class="input-group-text">$</span>';
                rowHtml += '<input type="number" class="form-control service-price" ';
                rowHtml += 'value="' + estimatedCost.toFixed(2) + '" min="0" step="0.01">';
                rowHtml += '</div>';
                rowHtml += '</td>';

                rowHtml += '<td>';
                rowHtml += '<span class="service-subtotal fw-bold">$' + estimatedCost.toFixed(2) + '</span>';
                rowHtml += '</td>';

                rowHtml += '<td class="no-print">';
                rowHtml += '<button type="button" class="btn btn-sm btn-danger" onclick="removeService(' + currentRowId + ')">';
                rowHtml += '<i class="fas fa-trash"></i>';
                rowHtml += '</button>';
                rowHtml += '</td>';

                newRow.innerHTML = rowHtml;
                document.getElementById('servicesTableBody').appendChild(newRow);
                setupRowEvents(newRow);
                calculateTotals();
            }

            // MODIFICADA: Mostrar requisitos faltantes CON CONCATENACIÓN MANUAL
            function showMissingRequirements() {
                if (missingRequirements && missingRequirements.length > 0) {
                    const section = document.getElementById('missingRequirementsSection');
                    const list = document.getElementById('missingRequirementsList');

                    if (section && list) {
                        section.style.display = 'block';
                        list.innerHTML = '';

                        for (let i = 0; i < missingRequirements.length; i++) {
                            const req = missingRequirements[i];
                            if (req && typeof req === 'object') {
                                const name = req.name || 'Requisito';
                                const description = req.description || '';
                                const petName = req.petName || 'Mascota';
                                const estimatedCost = req.estimatedCost || 0;

                                const div = document.createElement('div');
                                div.className = 'd-flex justify-content-between align-items-center mb-2 p-2 bg-white rounded';

                                const contentDiv = document.createElement('div');

                                let contentHtml = '';
                                contentHtml += '<strong>' + name + '</strong>';
                                contentHtml += '<div class="small text-muted">' + description + '</div>';
                                contentHtml += '<small class="text-info">';
                                contentHtml += '<i class="fas fa-paw me-1"></i>Para: ' + petName;
                                contentHtml += ' | <i class="fas fa-dollar-sign me-1"></i>Estimado: $' + estimatedCost.toFixed(2);
                                contentHtml += '</small>';

                                contentDiv.innerHTML = contentHtml;

                                const button = document.createElement('button');
                                button.type = 'button';
                                button.className = 'btn btn-sm btn-outline-success';

                                // CONCATENACIÓN MANUAL para el onclick
                                const escapedName = name.replace(/'/g, "\\'").replace(/"/g, '&quot;');
                                button.setAttribute('onclick', 'addSpecificRequirement("' + escapedName + '", ' + estimatedCost + ')');

                                button.innerHTML = '<i class="fas fa-plus me-1"></i> Agregar';

                                div.appendChild(contentDiv);
                                div.appendChild(button);
                                list.appendChild(div);
                            }
                        }
                    }
                }
            }

            // Mantener función original para compatibilidad (CON CONCATENACIÓN MANUAL)
            function addMissingAsService(description) {
                currentRowId++;

                const newRow = document.createElement('tr');
                newRow.id = 'row_' + currentRowId;

                const td1 = document.createElement('td');
                const input1 = document.createElement('input');
                input1.type = 'text';
                input1.className = 'form-control service-description';
                input1.value = description;
                td1.appendChild(input1);

                const td2 = document.createElement('td');
                const input2 = document.createElement('input');
                input2.type = 'number';
                input2.className = 'form-control service-quantity';
                input2.value = '1';
                input2.min = '1';
                input2.step = '1';
                td2.appendChild(input2);

                const td3 = document.createElement('td');
                const div3 = document.createElement('div');
                div3.className = 'input-group';

                const span3 = document.createElement('span');
                span3.className = 'input-group-text';
                span3.textContent = '$';

                const input3 = document.createElement('input');
                input3.type = 'number';
                input3.className = 'form-control service-price';
                input3.value = '0.00';
                input3.min = '0';
                input3.step = '0.01';

                div3.appendChild(span3);
                div3.appendChild(input3);
                td3.appendChild(div3);

                const td4 = document.createElement('td');
                const span4 = document.createElement('span');
                span4.className = 'service-subtotal fw-bold';
                span4.textContent = '$0.00';
                td4.appendChild(span4);

                const td5 = document.createElement('td');
                td5.className = 'no-print';
                const button5 = document.createElement('button');
                button5.type = 'button';
                button5.className = 'btn btn-sm btn-danger';

                // CONCATENACIÓN MANUAL para el onclick
                button5.setAttribute('onclick', 'removeService(' + currentRowId + ')');

                const icon5 = document.createElement('i');
                icon5.className = 'fas fa-trash';
                button5.appendChild(icon5);
                td5.appendChild(button5);

                newRow.appendChild(td1);
                newRow.appendChild(td2);
                newRow.appendChild(td3);
                newRow.appendChild(td4);
                newRow.appendChild(td5);

                document.getElementById('servicesTableBody').appendChild(newRow);

                setupRowEvents(newRow);
                calculateTotals();

                // Filtrar requisitos (mantener compatibilidad con arrays de strings)
                missingRequirements = missingRequirements.filter(function (req) {
                    if (typeof req === 'string') {
                        return req !== description;
                    }
                    return true;
                });
                showMissingRequirements();
            }

            function addServiceLine() {
                currentRowId++;

                const newRow = document.createElement('tr');
                newRow.id = 'row_' + currentRowId;

                const td1 = document.createElement('td');
                const input1 = document.createElement('input');
                input1.type = 'text';
                input1.className = 'form-control service-description';
                input1.placeholder = 'Descripción del servicio';
                td1.appendChild(input1);

                const td2 = document.createElement('td');
                const input2 = document.createElement('input');
                input2.type = 'number';
                input2.className = 'form-control service-quantity';
                input2.value = '1';
                input2.min = '1';
                input2.step = '1';
                td2.appendChild(input2);

                const td3 = document.createElement('td');
                const div3 = document.createElement('div');
                div3.className = 'input-group';

                const span3 = document.createElement('span');
                span3.className = 'input-group-text';
                span3.textContent = '$';

                const input3 = document.createElement('input');
                input3.type = 'number';
                input3.className = 'form-control service-price';
                input3.value = '0.00';
                input3.min = '0';
                input3.step = '0.01';

                div3.appendChild(span3);
                div3.appendChild(input3);
                td3.appendChild(div3);

                const td4 = document.createElement('td');
                const span4 = document.createElement('span');
                span4.className = 'service-subtotal fw-bold';
                span4.textContent = '$0.00';
                td4.appendChild(span4);

                const td5 = document.createElement('td');
                td5.className = 'no-print';
                const button5 = document.createElement('button');
                button5.type = 'button';
                button5.className = 'btn btn-sm btn-danger';

                // CONCATENACIÓN MANUAL para el onclick
                button5.setAttribute('onclick', 'removeService(' + currentRowId + ')');

                const icon5 = document.createElement('i');
                icon5.className = 'fas fa-trash';
                button5.appendChild(icon5);
                td5.appendChild(button5);

                newRow.appendChild(td1);
                newRow.appendChild(td2);
                newRow.appendChild(td3);
                newRow.appendChild(td4);
                newRow.appendChild(td5);

                document.getElementById('servicesTableBody').appendChild(newRow);
                setupRowEvents(newRow);
            }

            function setupRowEvents(row) {
                const quantityInput = row.querySelector('.service-quantity');
                const priceInput = row.querySelector('.service-price');
                const descriptionInput = row.querySelector('.service-description');

                const updateSubtotal = function () {
                    const quantity = parseFloat(quantityInput.value) || 0;
                    const price = parseFloat(priceInput.value) || 0;
                    const subtotal = quantity * price;

                    const subtotalSpan = row.querySelector('.service-subtotal');
                    if (subtotalSpan) {
                        subtotalSpan.textContent = '$' + subtotal.toFixed(2);
                    }

                    calculateTotals();
                };

                if (quantityInput) {
                    quantityInput.addEventListener('change', updateSubtotal);
                    quantityInput.addEventListener('input', updateSubtotal);
                }
                if (priceInput) {
                    priceInput.addEventListener('change', updateSubtotal);
                    priceInput.addEventListener('input', updateSubtotal);
                }
                if (descriptionInput) {
                    descriptionInput.addEventListener('change', calculateTotals);
                }
            }

            function setupAllRowEvents() {
                const rows = document.querySelectorAll('#servicesTableBody tr');
                for (let i = 0; i < rows.length; i++) {
                    setupRowEvents(rows[i]);
                }
            }

            function removeService(rowId) {
                const row = document.getElementById('row_' + rowId);
                if (row && confirm('¿Está seguro de eliminar este servicio?')) {
                    row.remove();
                    calculateTotals();
                }
            }

            function calculateTotals() {
                let subtotal = 0;

                const rows = document.querySelectorAll('#servicesTableBody tr');
                for (let i = 0; i < rows.length; i++) {
                    const row = rows[i];
                    const quantityInput = row.querySelector('.service-quantity');
                    const priceInput = row.querySelector('.service-price');

                    const quantity = parseFloat(quantityInput ? quantityInput.value : 0) || 0;
                    const price = parseFloat(priceInput ? priceInput.value : 0) || 0;
                    subtotal += quantity * price;
                }

                const totalAmount = subtotal;

                const subtotalEl = document.getElementById('subtotalAmount');
                const totalEl = document.getElementById('totalAmount');

                if (subtotalEl)
                    subtotalEl.textContent = '$' + subtotal.toFixed(2);
                if (totalEl)
                    totalEl.textContent = '$' + totalAmount.toFixed(2);
            }

            function generateBudget() {
                const rows = document.querySelectorAll('#servicesTableBody tr');
                if (rows.length === 0) {
                    alert('Agregue al menos un servicio al presupuesto');
                    return;
                }

                try {
                    if (typeof window.jspdf === 'undefined') {
                        alert('Error: La librería jsPDF no está disponible');
                        return;
                    }

                    const jsPDF = window.jspdf.jsPDF;
                    const doc = new jsPDF();

                    doc.setFontSize(20);
                    doc.setTextColor(0, 100, 0);
                    doc.text('PRESUPUESTO DE EXPORTACIÓN', 105, 20, {align: 'center'});

                    doc.setFontSize(11);
                    doc.setTextColor(0, 0, 0);

                    const clientName = document.getElementById('clientName') ? document.getElementById('clientName').textContent : 'Cliente';
                    const petInfo = document.getElementById('petInfo') ? document.getElementById('petInfo').textContent : 'Mascota(s)';
                    const destination = document.getElementById('destination') ? document.getElementById('destination').textContent : 'Destino';
                    const budgetDate = document.getElementById('budgetDate') ? document.getElementById('budgetDate').textContent : '';

                    doc.text('Cliente: ' + clientName, 20, 40);
                    doc.text('Mascota(s): ' + petInfo.replace(/[🐕🐈]/g, ''), 20, 50);
                    doc.text('Destino: ' + destination, 20, 60);
                    doc.text('Fecha: ' + budgetDate, 20, 70);

                    let yPos = 90;
                    doc.setFontSize(12);
                    doc.text('SERVICIOS', 20, yPos);
                    yPos += 10;

                    doc.setFontSize(10);
                    doc.text('Descripción', 20, yPos);
                    doc.text('Cant.', 130, yPos);
                    doc.text('P. Unit.', 150, yPos);
                    doc.text('Subtotal', 170, yPos);

                    yPos += 5;
                    doc.line(20, yPos, 190, yPos);
                    yPos += 10;

                    for (let i = 0; i < rows.length; i++) {
                        const row = rows[i];
                        if (yPos > 250) {
                            doc.addPage();
                            yPos = 20;
                        }

                        const descInput = row.querySelector('.service-description');
                        const qtyInput = row.querySelector('.service-quantity');
                        const priceInput = row.querySelector('.service-price');
                        const subtotalSpan = row.querySelector('.service-subtotal');

                        const desc = descInput ? descInput.value : '';
                        const qty = qtyInput ? qtyInput.value : '';
                        const price = priceInput ? parseFloat(priceInput.value).toFixed(2) : '0.00';
                        const subtotal = subtotalSpan ? subtotalSpan.textContent : '$0.00';

                        const shortDesc = desc.length > 50 ? desc.substring(0, 47) + '...' : desc;
                        doc.text(shortDesc, 20, yPos);
                        doc.text(qty, 130, yPos);
                        doc.text('$' + price, 150, yPos);
                        doc.text(subtotal, 170, yPos);

                        yPos += 10;
                    }

                    yPos += 10;
                    doc.line(20, yPos, 190, yPos);
                    yPos += 15;

                    doc.text('Subtotal:', 130, yPos);
                    const subtotalAmount = document.getElementById('subtotalAmount') ? document.getElementById('subtotalAmount').textContent : '$0.00';
                    doc.text(subtotalAmount, 170, yPos);
                    yPos += 10;

                    doc.setFontSize(12);
                    doc.setFont(undefined, 'bold');
                    doc.text('TOTAL:', 130, yPos);
                    const totalAmount = document.getElementById('totalAmount') ? document.getElementById('totalAmount').textContent : '$0.00';
                    doc.text(totalAmount, 170, yPos);

                    const destText = document.getElementById('destination') ? document.getElementById('destination').textContent : 'Presupuesto';
                    const safeDest = destText.replace(/\s+/g, '_').replace(/[^\w]/g, '');
                    const fileName = 'Presupuesto_' + safeDest + '_' + new Date().getTime() + '.pdf';

                    const pdfBlob = doc.output('blob');
                    const pdfUrl = URL.createObjectURL(pdfBlob);
                    window.open(pdfUrl, '_blank');

                    alert('Presupuesto generado exitosamente.\n\nSe ha abierto el PDF en una nueva ventana.\n\nTambién puede imprimirlo o enviarlo por email.');

                } catch (e) {
                    alert('Error al generar el presupuesto: ' + e.message);
                }
            }

            function downloadPDF() {
                if (typeof window.jspdf === 'undefined') {
                    alert('Error: La librería jsPDF no está disponible');
                    return;
                }

                try {
                    const jsPDF = window.jspdf.jsPDF;
                    const doc = new jsPDF();

                    doc.setFontSize(20);
                    doc.setTextColor(0, 100, 0);
                    doc.text('PRESUPUESTO DE EXPORTACIÓN', 105, 20, {align: 'center'});

                    doc.setFontSize(11);
                    doc.setTextColor(0, 0, 0);

                    const clientName = document.getElementById('clientName') ? document.getElementById('clientName').textContent : 'Cliente';
                    const petInfo = document.getElementById('petInfo') ? document.getElementById('petInfo').textContent : 'Mascota(s)';
                    const destination = document.getElementById('destination') ? document.getElementById('destination').textContent : 'Destino';
                    const budgetDate = document.getElementById('budgetDate') ? document.getElementById('budgetDate').textContent : '';

                    doc.text('Cliente: ' + clientName, 20, 40);
                    doc.text('Mascota(s): ' + petInfo.replace(/[🐕🐈]/g, ''), 20, 50);
                    doc.text('Destino: ' + destination, 20, 60);
                    doc.text('Fecha: ' + budgetDate, 20, 70);

                    let yPos = 90;
                    doc.setFontSize(12);
                    doc.text('SERVICIOS', 20, yPos);
                    yPos += 10;

                    doc.setFontSize(10);
                    doc.text('Descripción', 20, yPos);
                    doc.text('Cant.', 130, yPos);
                    doc.text('P. Unit.', 150, yPos);
                    doc.text('Subtotal', 170, yPos);

                    yPos += 5;
                    doc.line(20, yPos, 190, yPos);
                    yPos += 10;

                    const rows = document.querySelectorAll('#servicesTableBody tr');
                    for (let i = 0; i < rows.length; i++) {
                        const row = rows[i];
                        if (yPos > 250) {
                            doc.addPage();
                            yPos = 20;
                        }

                        const descInput = row.querySelector('.service-description');
                        const qtyInput = row.querySelector('.service-quantity');
                        const priceInput = row.querySelector('.service-price');
                        const subtotalSpan = row.querySelector('.service-subtotal');

                        const desc = descInput ? descInput.value : '';
                        const qty = qtyInput ? qtyInput.value : '';
                        const price = priceInput ? parseFloat(priceInput.value).toFixed(2) : '0.00';
                        const subtotal = subtotalSpan ? subtotalSpan.textContent : '$0.00';

                        const shortDesc = desc.length > 50 ? desc.substring(0, 47) + '...' : desc;
                        doc.text(shortDesc, 20, yPos);
                        doc.text(qty, 130, yPos);
                        doc.text('$' + price, 150, yPos);
                        doc.text(subtotal, 170, yPos);

                        yPos += 10;
                    }

                    yPos += 10;
                    doc.line(20, yPos, 190, yPos);
                    yPos += 15;

                    doc.text('Subtotal:', 130, yPos);
                    const subtotalAmount = document.getElementById('subtotalAmount') ? document.getElementById('subtotalAmount').textContent : '$0.00';
                    doc.text(subtotalAmount, 170, yPos);
                    yPos += 10;

                    doc.setFontSize(12);
                    doc.setFont(undefined, 'bold');
                    doc.text('TOTAL:', 130, yPos);
                    const totalAmount = document.getElementById('totalAmount') ? document.getElementById('totalAmount').textContent : '$0.00';
                    doc.text(totalAmount, 170, yPos);

                    const destText = document.getElementById('destination') ? document.getElementById('destination').textContent : 'Presupuesto';
                    const safeDest = destText.replace(/\s+/g, '_').replace(/[^\w]/g, '');
                    const fileName = 'Presupuesto_' + safeDest + '_' + new Date().getTime() + '.pdf';
                    doc.save(fileName);
                } catch (error) {
                    alert('Error al generar el PDF.');
                }
            }

            function showEmailModal() {
                // Obtener el email del campo oculto O del campo visible
                let storedEmail = document.getElementById('clientEmail').value;

                // Si está vacío en el campo oculto, intentar del campo visible
                if (!storedEmail || storedEmail.trim() === '') {
                    const emailDisplay = document.getElementById('clientEmailDisplay');
                    if (emailDisplay) {
                        storedEmail = emailDisplay.textContent.trim();
                    }
                }

                const recipientEmail = document.getElementById('recipientEmail');

                // Solo poner el email si no es el texto de advertencia
                if (storedEmail && storedEmail.trim() !== '' && !storedEmail.includes('No especificado')) {
                    recipientEmail.value = storedEmail;
                } else {
                    recipientEmail.value = '';
                }

                // Crear asunto personalizado
                const clientName = document.getElementById('clientName') ? 
                    document.getElementById('clientName').textContent.trim() : 'Cliente';
                const destination = document.getElementById('destination') ? 
                    document.getElementById('destination').textContent.trim() : 'Destino';

                const emailSubject = document.getElementById('emailSubject');
                emailSubject.value = 'Presupuesto Pet Travel Docs - ' + clientName + ' - ' + destination;

                // Crear mensaje personalizado
                const petInfo = document.getElementById('petInfo') ? 
                    document.getElementById('petInfo').textContent.trim() : 'Mascota(s)';
                const totalAmount = document.getElementById('totalAmount') ? 
                    document.getElementById('totalAmount').textContent.trim() : '$0.00';

                const emailMessage = document.getElementById('emailMessage');
                emailMessage.value = 'Estimado/a ' + clientName + ',\n\nAdjunto encontrar\u00e1 el presupuesto detallado para los servicios de exportaci\u00f3n de su(s) mascota(s) (' + petInfo + ') con destino a ' + destination + '.\n\nEl monto total del presupuesto es: ' + totalAmount + '\n\nLos t\u00e9rminos y condiciones se encuentran detallados en el documento adjunto.\n\nQuedamos a su disposici\u00f3n para cualquier consulta o ajuste que desee realizar.\n\nAtentamente,\nPet Travel Docs\n📧 joelcubas1972@gmail.com\n📞 +51 987 654 321';

                // Mostrar modal
                const modalElement = document.getElementById('emailModal');
                if (!emailModal) {
                    emailModal = new bootstrap.Modal(modalElement);
                }
                emailModal.show();

                // Enfocar el campo de email
                setTimeout(function() {
                    recipientEmail.focus();
                    recipientEmail.select();
                }, 500);
            }

            function sendEmail() {
                const recipientEmail = document.getElementById('recipientEmail').value;
                const emailSubject = document.getElementById('emailSubject').value;
                const emailMessage = document.getElementById('emailMessage').value;

                if (!recipientEmail || recipientEmail.trim() === '') {
                    alert('Por favor ingrese un email válido');
                    return;
                }

                // Validar formato de email
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(recipientEmail)) {
                    alert('Por favor ingrese un email válido (ejemplo@dominio.com)');
                    return;
                }

                // Generar PDF para adjuntar
                if (typeof window.jspdf === 'undefined') {
                    alert('Error: La librería jsPDF no está disponible');
                    return;
                }

                try {
                    const jsPDF = window.jspdf.jsPDF;
                    const doc = new jsPDF();

                    doc.setFontSize(20);
                    doc.setTextColor(0, 100, 0);
                    doc.text('PRESUPUESTO DE EXPORTACIÓN', 105, 20, {align: 'center'});

                    doc.setFontSize(11);
                    doc.setTextColor(0, 0, 0);

                    const clientName = document.getElementById('clientName') ? document.getElementById('clientName').textContent : 'Cliente';
                    const petInfo = document.getElementById('petInfo') ? document.getElementById('petInfo').textContent : 'Mascota(s)';
                    const destination = document.getElementById('destination') ? document.getElementById('destination').textContent : 'Destino';
                    const budgetDate = document.getElementById('budgetDate') ? document.getElementById('budgetDate').textContent : '';

                    doc.text('Cliente: ' + clientName, 20, 40);
                    doc.text('Mascota(s): ' + petInfo.replace(/[🐕🐈]/g, ''), 20, 50);
                    doc.text('Destino: ' + destination, 20, 60);
                    doc.text('Fecha: ' + budgetDate, 20, 70);

                    let yPos = 90;
                    doc.setFontSize(12);
                    doc.text('SERVICIOS', 20, yPos);
                    yPos += 10;

                    doc.setFontSize(10);
                    doc.text('Descripción', 20, yPos);
                    doc.text('Cant.', 130, yPos);
                    doc.text('P. Unit.', 150, yPos);
                    doc.text('Subtotal', 170, yPos);

                    yPos += 5;
                    doc.line(20, yPos, 190, yPos);
                    yPos += 10;

                    const rows = document.querySelectorAll('#servicesTableBody tr');
                    for (let i = 0; i < rows.length; i++) {
                        const row = rows[i];
                        if (yPos > 250) {
                            doc.addPage();
                            yPos = 20;
                        }

                        const descInput = row.querySelector('.service-description');
                        const qtyInput = row.querySelector('.service-quantity');
                        const priceInput = row.querySelector('.service-price');
                        const subtotalSpan = row.querySelector('.service-subtotal');

                        const desc = descInput ? descInput.value : '';
                        const qty = qtyInput ? qtyInput.value : '';
                        const price = priceInput ? parseFloat(priceInput.value).toFixed(2) : '0.00';
                        const subtotal = subtotalSpan ? subtotalSpan.textContent : '$0.00';

                        const shortDesc = desc.length > 50 ? desc.substring(0, 47) + '...' : desc;
                        doc.text(shortDesc, 20, yPos);
                        doc.text(qty, 130, yPos);
                        doc.text('$' + price, 150, yPos);
                        doc.text(subtotal, 170, yPos);

                        yPos += 10;
                    }

                    yPos += 10;
                    doc.line(20, yPos, 190, yPos);
                    yPos += 15;

                    doc.text('Subtotal:', 130, yPos);
                    const subtotalAmount = document.getElementById('subtotalAmount') ? document.getElementById('subtotalAmount').textContent : '$0.00';
                    doc.text(subtotalAmount, 170, yPos);
                    yPos += 10;

                    doc.setFontSize(12);
                    doc.setFont(undefined, 'bold');
                    doc.text('TOTAL:', 130, yPos);
                    const totalAmount = document.getElementById('totalAmount') ? document.getElementById('totalAmount').textContent : '$0.00';
                    doc.text(totalAmount, 170, yPos);

                    // Convertir PDF a Base64
                    const pdfOutput = doc.output('datauristring');
                    const base64PDF = pdfOutput.split(',')[1];

                    // Deshabilitar botón durante el envío
                    const sendBtn = document.getElementById('sendEmailBtn');
                    const originalText = sendBtn.innerHTML;
                    sendBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-1"></i> Enviando...';
                    sendBtn.disabled = true;

                    // Crear FormData para enviar
                    const formData = new FormData();
                    formData.append('action', 'sendEmail');
                    formData.append('recipientEmail', recipientEmail);
                    formData.append('subject', emailSubject);
                    formData.append('message', emailMessage);
                    formData.append('clientName', clientName);
                    formData.append('pets', petInfo);
                    formData.append('destination', destination);
                    formData.append('totalAmount', totalAmount);
                    formData.append('pdfBase64', base64PDF);
                    formData.append('budgetDate', budgetDate);

                    // Enviar datos al servlet
                    fetch('${pageContext.request.contextPath}/EmailServlet', {
                        method: 'POST',
                        body: formData
                    })
                    .then(function(response) {
                        return response.text();
                    })
                    .then(function(data) {
                        try {
                            if (data.includes('success')) {
                                alert('✅ Email enviado exitosamente a: ' + recipientEmail);
                                if (emailModal) {
                                    emailModal.hide();
                                }
                            } else {
                                alert('❌ Error al enviar email. Verifique la configuración del servidor.');
                            }
                        } catch (e) {
                            alert('❌ Error al procesar respuesta del servidor');
                        }
                    })
                    .catch(function(error) {
                        alert('❌ Error de conexión: ' + error.message);
                        console.error('Fetch error:', error);
                    })
                    .finally(function() {
                        sendBtn.innerHTML = originalText;
                        sendBtn.disabled = false;
                    });

                } catch (error) {
                    alert('❌ Error al generar el PDF para el email: ' + error.message);
                    console.error('PDF generation error:', error);
                }
            }

            function goBack() {
                window.history.back();
            }

            function copyEmailToClipboard() {
                const email = document.getElementById('clientEmail').value;
                if (email && email.trim() !== '') {
                    navigator.clipboard.writeText(email.trim()).then(function() {
                        alert('✅ Email copiado al portapapeles: ' + email);
                    }).catch(function(err) {
                        console.error('Error al copiar:', err);
                        alert('⚠️ No se pudo copiar el email. Por favor cópielo manualmente.');
                    });
                } else {
                    alert('No hay email para copiar');
                }
            }

            // NUEVO: Event listener actualizado
            document.addEventListener('DOMContentLoaded', function () {
                loadFormData();
                setupAllRowEvents();
                calculateTotals();

                // Mostrar requisitos faltantes si existen
                if (missingRequirements && missingRequirements.length > 0) {
                    showMissingRequirements();
                }

                const firstRow = document.getElementById('row_1');
                if (firstRow) {
                    setupRowEvents(firstRow);
                }
            });
        </script>
    </body>
</html>