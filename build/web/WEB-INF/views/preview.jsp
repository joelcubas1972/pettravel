<%@ page import="Modelo.CarrierInfo"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Modelo.PetInfo" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%
    List<PetInfo> pets = (List<PetInfo>) session.getAttribute("pets");
    CarrierInfo carrier = (CarrierInfo) session.getAttribute("carrier");
    PetInfo petInfo = (PetInfo) session.getAttribute("petInfo");
    if (petInfo == null) {
        response.sendRedirect(request.getContextPath() + "MainServlet");
        return;
    }
    
    Map<String, String> requirements = (Map<String, String>) request.getAttribute("requirements");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
Dueño: <%= pets.get(0).getOwnerName() %>
<% for (int i = 0; i < pets.size(); i++) { %>
    <h3>Mascota #<%= i+1 %>: <%= pets.get(i).getPetName() %></h3>
    Tipo: <%= pets.get(i).getPetType() %>
    Raza: <%= pets.get(i).getPetBreed() %>
<% } %>

<!-- Mostrar carrier si existe -->
<% if (carrier != null) { %>
    <div class="alert alert-info">
        <strong>📦 Encargado del traslado:</strong><br>
        <%= carrier.getName() %> | 📞 <%= carrier.getPhone() %> | 📧 <%= carrier.getEmail() %>
    </div>
<% } %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vista Previa - Documentos de Viaje</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .preview-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 30px;
        }
        
        .section-title {
            color: #667eea;
            border-bottom: 2px solid #667eea;
            padding-bottom: 10px;
            margin: 30px 0 20px 0;
            font-size: 1.8rem;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }
        
        .info-item {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        
        .info-label {
            font-weight: bold;
            color: #555;
            font-size: 0.9rem;
            margin-bottom: 5px;
            text-transform: uppercase;
        }
        
        .info-value {
            font-size: 1.1rem;
            color: #333;
        }
        
        .requirements-list {
            background: #e8f4fd;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }
        
        .requirements-list li {
            margin-bottom: 10px;
            padding-left: 25px;
            position: relative;
        }
        
        .requirements-list li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
        }
        
        .document-preview {
            background: #f5f5f5;
            border: 2px dashed #ddd;
            padding: 30px;
            margin: 30px 0;
            border-radius: 10px;
            font-family: 'Courier New', monospace;
        }
        
        .document-header {
            text-align: center;
            border-bottom: 3px double #333;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        
        .document-title {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .document-subtitle {
            color: #666;
            font-size: 1.1rem;
        }
        
        .document-section {
            margin-bottom: 25px;
            page-break-inside: avoid;
        }
        
        .document-section h4 {
            background: #e9ecef;
            padding: 10px;
            border-left: 4px solid #333;
            margin-bottom: 15px;
        }
        
        .signature-area {
            margin-top: 50px;
            border-top: 1px solid #333;
            padding-top: 20px;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        
        @media print {
            .no-print {
                display: none;
            }
            
            .preview-container {
                box-shadow: none;
                padding: 0;
            }
            
            .document-preview {
                border: none;
                padding: 0;
            }
        }
        
        .status-indicator {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
            margin-left: 10px;
        }
        
        .status-complete {
            background: #d4edda;
            color: #155724;
        }
        
        .status-pending {
            background: #fff3cd;
            color: #856404;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="no-print">
            <h1>📋 Vista Previa de Documentos</h1>
            <p class="subtitle">Revisa la información antes de generar los documentos oficiales</p>
        </header>
        
        <main class="main-content">
            <div class="preview-container">
                <!-- Información Resumida -->
                <div class="no-print">
                    <h2 class="section-title">Resumen de la Solicitud</h2>
                    
                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-label">Dueño</div>
                            <div class="info-value"><%= petInfo.getOwnerName() %></div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-label">Mascota</div>
                            <div class="info-value"><%= petInfo.getPetName() %> (<%= petInfo.getPetType() %>)</div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-label">Destino</div>
                            <div class="info-value"><%= petInfo.getDestinationCountry() %></div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-label">Fecha de Viaje</div>
                            <div class="info-value"><%= petInfo.getTravelDate() != null ? sdf.format(petInfo.getTravelDate()) : "No especificada" %></div>
                        </div>
                    </div>
                </div>
                
                <!-- Estado de Requisitos -->
                <div class="no-print">
                    <h2 class="section-title">Estado de Requisitos</h2>
                    
                    <div class="requirements-list">
                        <h4>Requisitos para <%= petInfo.getDestinationCountry() %>:</h4>
                        <ul>
                            <li>
                                Información del dueño completa
                                <span class="status-indicator status-complete">COMPLETO</span>
                            </li>
                            <li>
                                Información de la mascota
                                <span class="status-indicator status-complete">COMPLETO</span>
                            </li>
                            <li>
                                Microchip ISO 11784/11785
                                <span class="status-indicator <%= petInfo.getMicrochipNumber() != null && !petInfo.getMicrochipNumber().isEmpty() ? "status-complete" : "status-pending" %>">
                                    <%= petInfo.getMicrochipNumber() != null && !petInfo.getMicrochipNumber().isEmpty() ? "COMPLETO" : "PENDIENTE" %>
                                </span>
                            </li>
                            <li>
                                Vacuna antirrábica
                                <span class="status-indicator <%= petInfo.isRabiesVaccinated() ? "status-complete" : "status-pending" %>">
                                    <%= petInfo.isRabiesVaccinated() ? "COMPLETO" : "PENDIENTE" %>
                                </span>
                            </li>
                            <li>
                                Certificado de salud veterinario
                                <span class="status-indicator status-pending">PENDIENTE</span>
                            </li>
                            <% if (requirements != null) { 
                                for (Map.Entry<String, String> req : requirements.entrySet()) { %>
                            <li><%= req.getValue() %></li>
                            <%   }
                            } %>
                        </ul>
                    </div>
                </div>
                
                <!-- Vista Previa del Documento -->
                <h2 class="section-title">Vista Previa del Documento</h2>
                
                <div class="document-preview" id="documentContent">
                    <div class="document-header">
                        <div class="document-title">CERTIFICADO DE SALUD PARA VIAJE INTERNACIONAL</div>
                        <div class="document-subtitle">Para Animales de Compañía - USDA APHIS Form 7001</div>
                        <div class="document-subtitle">Estados Unidos de América</div>
                    </div>
                    
                    <div class="document-section">
                        <h4>I. INFORMACIÓN DEL PROPIETARIO / EXPORTADOR</h4>
                        <p><strong>Nombre:</strong> <%= petInfo.getOwnerName() %></p>
                        <p><strong>Dirección:</strong> <%= petInfo.getOwnerAddress() %></p>
                        <p><strong>Teléfono:</strong> <%= petInfo.getOwnerPhone() %></p>
                        <p><strong>Email:</strong> <%= petInfo.getOwnerEmail() %></p>
                    </div>
                    
                    <div class="document-section">
                        <h4>II. INFORMACIÓN DEL ANIMAL</h4>
                        <p><strong>Nombre del Animal:</strong> <%= petInfo.getPetName() %></p>
                        <p><strong>Especie:</strong> <%= petInfo.getPetType() %></p>
                        <p><strong>Raza:</strong> <%= petInfo.getPetBreed() != null ? petInfo.getPetBreed() : "No especificada" %></p>
                        <p><strong>Sexo:</strong> <%= petInfo.getPetGender() != null ? 
                            (petInfo.getPetGender().equals("male") ? "Macho" : "Hembra") : "No especificado" %></p>
                        <p><strong>Fecha de Nacimiento:</strong> <%= petInfo.getPetBirthDate() != null ? 
                            sdf.format(petInfo.getPetBirthDate()) : "No especificada" %></p>
                        <p><strong>Color/Marcas:</strong> <%= petInfo.getPetColor() != null ? petInfo.getPetColor() : "No especificado" %></p>
                        <p><strong>Número de Microchip:</strong> <%= petInfo.getMicrochipNumber() != null ? 
                            petInfo.getMicrochipNumber() : "No aplica" %></p>
                    </div>
                    
                    <div class="document-section">
                        <h4>III. INFORMACIÓN DEL VIAJE</h4>
                        <p><strong>País de Destino:</strong> <%= petInfo.getDestinationCountry() %></p>
                        <p><strong>Fecha de Salida Estimada:</strong> <%= petInfo.getTravelDate() != null ? 
                            sdf.format(petInfo.getTravelDate()) : "No especificada" %></p>
                        <p><strong>Medio de Transporte:</strong> <%= petInfo.getTravelType() != null ? 
                            petInfo.getTravelType() : "No especificado" %></p>
                    </div>
                    
                    <div class="document-section">
                        <h4>IV. DECLARACIÓN DE SALUD</h4>
                        <p>Yo, el veterinario abajo firmante, certifico que he examinado al animal descrito anteriormente 
                        en la fecha de este certificado y que, según mi mejor conocimiento, el animal:</p>
                        
                        <p>✓ Está clínicamente sano y libre de signos de enfermedades infecciosas o contagiosas</p>
                        <p>✓ Está apto para viajar</p>
                        <p>✓ Ha sido vacunado contra la rabia el día: 
                           <%= petInfo.getRabiesVaccinationDate() != null ? 
                               sdf.format(petInfo.getRabiesVaccinationDate()) : "No especificado" %></p>
                        <p>✓ Vacunas generales administradas: 
                           <%= petInfo.getLastVaccinationDate() != null ? 
                               sdf.format(petInfo.getLastVaccinationDate()) : "No especificado" %></p>
                    </div>
                    
                    <div class="document-section">
                        <h4>V. REQUISITOS ESPECÍFICOS DEL PAÍS DE DESTINO</h4>
                        <p><strong>País:</strong> <%= petInfo.getDestinationCountry() %></p>
                        <p><strong>Requisitos aplicables:</strong></p>
                        <ul>
                            <% if (requirements != null) { 
                                for (Map.Entry<String, String> req : requirements.entrySet()) { %>
                            <li><%= req.getValue() %></li>
                            <%   }
                            } else { %>
                            <li>Verificar requisitos específicos con la embajada correspondiente</li>
                            <li>Microchip ISO 11784/11785 generalmente requerido</li>
                            <li>Vacuna antirrábica al día obligatoria</li>
                            <% } %>
                        </ul>
                    </div>
                    
                    <div class="signature-area">
                        <div style="float: left; width: 45%;">
                            <p>___________________________________</p>
                            <p>Firma del Propietario</p>
                            <p>Fecha: <%= sdf.format(new java.util.Date()) %></p>
                        </div>
                        
                        <div style="float: right; width: 45%;">
                            <p>___________________________________</p>
                            <p>Firma del Veterinario Autorizado</p>
                            <p>Número de Licencia: ________________</p>
                            <p>Fecha: ___________________________</p>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    
                    <div style="margin-top: 50px; font-size: 0.8rem; color: #666; text-align: center;">
                        <p>** NOTA: Este documento debe ser completado y firmado por un veterinario acreditado por USDA **</p>
                        <p>** Válido por 30 días a partir de la fecha de firma del veterinario **</p>
                    </div>
                </div>
                
                <!-- Lista de Verificación -->
                <div class="no-print">
                    <h2 class="section-title">Lista de Verificación para el Viaje</h2>
                    
                    <div class="requirements-list">
                        <h4>Antes de Viajar:</h4>
                        <ul>
                            <li>Imprimir 3 copias de este documento</li>
                            <li>Llevar registro original de vacunación antirrábica</li>
                            <li>Verificar requisitos específicos de la aerolínea</li>
                            <li>Confirmar reserva de la mascota con la aerolínea</li>
                            <li>Transportador aprobado por IATA (si viaja en cabina)</li>
                            <li>Comida y agua para el viaje</li>
                            <li>Documento de identificación con foto del dueño</li>
                        </ul>
                    </div>
                </div>
                
                <!-- Botones de Acción -->
                <div class="action-buttons no-print">
                    <button type="button" class="btn-secondary" 
                            onclick="window.location.href='${pageContext.request.contextPath}/?action=start'">
                        ← Editar Información
                    </button>
                    
                    <div style="display: flex; gap: 10px;">
                        <button type="button" class="btn-secondary" onclick="window.print()">
                            🖨️ Imprimir Vista Previa
                        </button>
                        
                        <button type="button" class="btn-primary" 
                                onclick="window.location.href='${pageContext.request.contextPath}/document'">
                            📄 Generar Documento Final →
                        </button>
                    </div>
                </div>
            </div>
        </main>
        
        <footer class="no-print">
            <p>© 2024 Pet Travel Docs - Este documento es una plantilla. Consulte con las autoridades correspondientes.</p>
        </footer>
    </div>
    
    <script>
        function generateFinalDocument() {
            // Mostrar mensaje de generación
            alert('Generando documento oficial...');
            
            // Redirigir a la página del documento final
            window.location.href = '${pageContext.request.contextPath}/views/document.jsp';
        }
        
        // Configurar para impresión
        window.addEventListener('beforeprint', function() {
            // Añadir encabezado y pie de página para impresión
            const style = document.createElement('style');
            style.innerHTML = `
                @media print {
                    @page {
                        margin: 2cm;
                        size: A4;
                    }
                    
                    body {
                        font-family: 'Times New Roman', serif;
                        font-size: 12pt;
                        line-height: 1.5;
                    }
                    
                    .document-preview {
                        border: none !important;
                        padding: 0 !important;
                        background: none !important;
                    }
                    
                    .document-title {
                        font-size: 16pt !important;
                    }
                    
                    .document-subtitle {
                        font-size: 12pt !important;
                    }
                    
                    .signature-area {
                        margin-top: 3cm !important;
                    }
                }
            `;
            document.head.appendChild(style);
        });
        
        // Cargar información adicional
        window.onload = function() {
            // Añadir fecha actual al documento
            const today = new Date();
            const formattedDate = today.toLocaleDateString('es-ES', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });
            
            const dateElement = document.createElement('div');
            dateElement.style.textAlign = 'center';
            dateElement.style.marginBottom = '20px';
            dateElement.style.fontStyle = 'italic';
            dateElement.innerHTML = `Documento generado el: ${formattedDate}`;
            
            const header = document.querySelector('.document-header');
            header.appendChild(dateElement);
            
            // Resaltar campos importantes
            const importantFields = document.querySelectorAll('.document-section h4');
            importantFields.forEach(field => {
                field.style.color = '#2c3e50';
                field.style.fontWeight = 'bold';
            });
        };
    </script>
</body>
</html>