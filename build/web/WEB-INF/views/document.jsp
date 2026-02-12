<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Modelo.PetInfo" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%
    PetInfo petInfo = (PetInfo) session.getAttribute("petInfo");
    if (petInfo == null) {
        response.sendRedirect(request.getContextPath() + "/");
        return;
    }
    
    Map<String, String> requirements = (Map<String, String>) request.getAttribute("requirements");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat sdfFull = new SimpleDateFormat("EEEE, dd 'de' MMMM 'de' yyyy", new java.util.Locale("es", "ES"));
    String currentDate = sdfFull.format(new java.util.Date());
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Documento Oficial - Viaje con Mascota</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Estilos específicos para el documento oficial */
        body {
            font-family: 'Times New Roman', serif;
            background: white;
            color: black;
            line-height: 1.6;
        }
        
        .document-container {
            max-width: 210mm;
            margin: 0 auto;
            padding: 20mm;
            background: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            position: relative;
        }
        
        /* Encabezado oficial */
        .official-header {
            text-align: center;
            border-bottom: 3px double #000;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        
        .government-seal {
            float: left;
            width: 100px;
            height: 100px;
            border: 2px solid #000;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            margin-right: 20px;
        }
        
        .document-title {
            font-size: 22pt;
            font-weight: bold;
            text-transform: uppercase;
            margin: 10px 0;
        }
        
        .document-subtitle {
            font-size: 14pt;
            color: #444;
            margin-bottom: 5px;
        }
        
        .document-number {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 11pt;
            color: #666;
        }
        
        /* Contenido del documento */
        .document-section {
            margin-bottom: 25px;
            page-break-inside: avoid;
        }
        
        .section-title {
            font-size: 13pt;
            font-weight: bold;
            background: #f0f0f0;
            padding: 8px 12px;
            border-left: 4px solid #000;
            margin: 20px 0 15px 0;
            text-transform: uppercase;
        }
        
        .info-table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        
        .info-table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            vertical-align: top;
        }
        
        .info-table .label {
            font-weight: bold;
            width: 35%;
            color: #333;
        }
        
        .info-table .value {
            width: 65%;
        }
        
        /* Declaraciones y certificaciones */
        .declaration {
            border: 2px solid #000;
            padding: 20px;
            margin: 30px 0;
            background: #f9f9f9;
        }
        
        .declaration-title {
            font-size: 12pt;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
            text-decoration: underline;
        }
        
        .declaration-text {
            text-align: justify;
            line-height: 1.8;
        }
        
        /* Firmas */
        .signature-block {
            margin-top: 50px;
            padding-top: 20px;
            border-top: 1px solid #000;
        }
        
        .signature-line {
            width: 70%;
            margin: 40px auto 10px auto;
            border-bottom: 1px solid #000;
            text-align: center;
            padding-bottom: 5px;
        }
        
        .signature-label {
            text-align: center;
            font-size: 11pt;
            margin-top: 5px;
        }
        
        /* Sellos y estampillas */
        .stamp-area {
            position: relative;
            height: 150px;
            margin: 30px 0;
        }
        
        .official-stamp {
            position: absolute;
            right: 0;
            top: 0;
            width: 120px;
            height: 120px;
            border: 2px dashed #900;
            border-radius: 10px;
            text-align: center;
            padding: 10px;
            font-size: 10pt;
            color: #900;
            font-weight: bold;
        }
        
        /* Requisitos específicos */
        .requirements-box {
            border: 2px solid #0066cc;
            padding: 15px;
            margin: 20px 0;
            background: #f0f8ff;
        }
        
        .requirements-title {
            color: #0066cc;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        /* Instrucciones */
        .instructions {
            font-size: 10pt;
            color: #666;
            border-top: 1px dashed #999;
            padding-top: 15px;
            margin-top: 30px;
        }
        
        /* Botones de acción (solo en pantalla) */
        .action-buttons {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            display: flex;
            gap: 10px;
        }
        
        @media print {
            .no-print, .action-buttons {
                display: none;
            }
            
            .document-container {
                padding: 15mm;
                box-shadow: none;
            }
            
            body {
                font-size: 11pt;
            }
            
            .page-break {
                page-break-before: always;
            }
        }
        
        /* Código QR (simulado) */
        .qr-code {
            width: 80px;
            height: 80px;
            border: 1px solid #ccc;
            float: right;
            margin-left: 20px;
            text-align: center;
            padding: 5px;
            font-size: 8pt;
        }
        
        /* Marcas de agua */
        .watermark {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg);
            font-size: 60pt;
            color: rgba(0,0,0,0.1);
            z-index: -1;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <!-- Marca de agua -->
    <div class="watermark no-print">VÁLIDO</div>
    
    <!-- Botones de acción flotantes -->
    <div class="action-buttons no-print">
        <button onclick="window.print()" class="btn-primary" style="padding: 10px 20px;">
            🖨️ Imprimir
        </button>
        <button onclick="window.location.href='${pageContext.request.contextPath}/'" class="btn-secondary" style="padding: 10px 20px;">
            🏠 Inicio
        </button>
        <button onclick="downloadAsPDF()" class="btn-primary" style="padding: 10px 20px;">
            📥 Descargar PDF
        </button>
    </div>
    
    <div class="document-container">
        <!-- Número de documento -->
        <div class="document-number">
            Ref: PTD-<%= String.format("%06d", (int)(Math.random() * 1000000)) %>
        </div>
        
        <!-- Encabezado oficial -->
        <div class="official-header">
            <div class="government-seal">
                USDA<br>APHIS
            </div>
            
            <div>
                <div class="document-title">Certificado Veterinario Internacional</div>
                <div class="document-subtitle">Para la Exportación de Animales de Compañía</div>
                <div class="document-subtitle">Departamento de Agricultura de los Estados Unidos</div>
                <div class="document-subtitle">Servicio de Inspección de Sanidad Animal y Vegetal</div>
                <div style="margin-top: 15px; font-size: 11pt;">
                    <strong>Fecha de Generación:</strong> <%= currentDate %>
                </div>
            </div>
            
            <div style="clear: both;"></div>
        </div>
        
        <!-- Código QR -->
        <div class="qr-code no-print">
            [QR Code]<br>
            Verificación<br>en línea
        </div>
        
        <!-- SECCIÓN 1: Información del Propietario -->
        <div class="document-section">
            <div class="section-title">1. Información del Propietario / Exportador</div>
            
            <table class="info-table">
                <tr>
                    <td class="label">Nombre Completo:</td>
                    <td class="value"><%= petInfo.getOwnerName() %></td>
                </tr>
                <tr>
                    <td class="label">Dirección:</td>
                    <td class="value"><%= petInfo.getOwnerAddress() %></td>
                </tr>
                <tr>
                    <td class="label">Teléfono de Contacto:</td>
                    <td class="value"><%= petInfo.getOwnerPhone() %></td>
                </tr>
                <tr>
                    <td class="label">Correo Electrónico:</td>
                    <td class="value"><%= petInfo.getOwnerEmail() %></td>
                </tr>
                <tr>
                    <td class="label">Pasaporte / ID:</td>
                    <td class="value">[NÚMERO DE PASAPORTE DEL PROPIETARIO]</td>
                </tr>
            </table>
        </div>
        
        <!-- SECCIÓN 2: Información del Animal -->
        <div class="document-section">
            <div class="section-title">2. Identificación del Animal</div>
            
            <table class="info-table">
                <tr>
                    <td class="label">Nombre del Animal:</td>
                    <td class="value"><%= petInfo.getPetName() %></td>
                </tr>
                <tr>
                    <td class="label">Especie:</td>
                    <td class="value"><%= petInfo.getPetType().equals("dog") ? "Canino (Perro)" : 
                                      petInfo.getPetType().equals("cat") ? "Felino (Gato)" : 
                                      petInfo.getPetType() %></td>
                </tr>
                <tr>
                    <td class="label">Raza:</td>
                    <td class="value"><%= petInfo.getPetBreed() != null ? petInfo.getPetBreed() : "No especificada" %></td>
                </tr>
                <tr>
                    <td class="label">Sexo:</td>
                    <td class="value">
                        <%= petInfo.getPetGender() != null ? 
                            (petInfo.getPetGender().equals("male") ? "Macho" : "Hembra") : "No especificado" %>
                    </td>
                </tr>
                <tr>
                    <td class="label">Fecha de Nacimiento / Edad:</td>
                    <td class="value">
                        <%= petInfo.getPetBirthDate() != null ? 
                            sdf.format(petInfo.getPetBirthDate()) : "No especificada" %>
                    </td>
                </tr>
                <tr>
                    <td class="label">Color y Marcas:</td>
                    <td class="value"><%= petInfo.getPetColor() != null ? petInfo.getPetColor() : "No especificado" %></td>
                </tr>
            </table>
            
            <!-- Identificación permanente -->
            <div style="margin-top: 20px; padding: 15px; border: 1px solid #000; background: #f9f9f9;">
                <strong>IDENTIFICACIÓN PERMANENTE (MICROCHIP):</strong><br>
                <table style="width: 100%; margin-top: 10px;">
                    <tr>
                        <td style="width: 30%;"><strong>Número:</strong></td>
                        <td><%= petInfo.getMicrochipNumber() != null && !petInfo.getMicrochipNumber().isEmpty() ? 
                                petInfo.getMicrochipNumber() : "NO APLICA / NO DISPONIBLE" %></td>
                    </tr>
                    <tr>
                        <td><strong>Lugar de Implantación:</strong></td>
                        <td>[LATERAL IZQUIERDO DEL CUELLO]</td>
                    </tr>
                    <tr>
                        <td><strong>Fecha de Implantación:</strong></td>
                        <td>[FECHA DE IMPLANTACIÓN]</td>
                    </tr>
                    <tr>
                        <td><strong>Estándar ISO:</strong></td>
                        <td>11784 / 11785 (Requerido para UE)</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- SECCIÓN 3: Información del Viaje -->
        <div class="document-section">
            <div class="section-title">3. Detalles del Viaje</div>
            
            <table class="info-table">
                <tr>
                    <td class="label">País de Destino:</td>
                    <td class="value"><%= petInfo.getDestinationCountry() %></td>
                </tr>
                <tr>
                    <td class="label">Fecha Estimada de Salida:</td>
                    <td class="value">
                        <%= petInfo.getTravelDate() != null ? sdf.format(petInfo.getTravelDate()) : "No especificada" %>
                    </td>
                </tr>
                <tr>
                    <td class="label">Puerto de Salida:</td>
                    <td class="value">Estados Unidos</td>
                </tr>
                <tr>
                    <td class="label">Puerto de Llegada:</td>
                    <td class="value">[AEROPUERTO/PUERTO DE DESTINO]</td>
                </tr>
                <tr>
                    <td class="label">Transporte:</td>
                    <td class="value">
                        <%= petInfo.getTravelType() != null ? 
                            (petInfo.getTravelType().equals("airplane") ? "Aéreo (en cabina)" :
                             petInfo.getTravelType().equals("airplane_cargo") ? "Aéreo (como carga)" :
                             petInfo.getTravelType().equals("car") ? "Terrestre (automóvil)" :
                             petInfo.getTravelType().equals("ship") ? "Marítimo" : petInfo.getTravelType()) 
                            : "No especificado" %>
                    </td>
                </tr>
                <tr>
                    <td class="label">Aerolínea / Transportista:</td>
                    <td class="value">[NOMBRE DE LA AEROLÍNEA]</td>
                </tr>
                <tr>
                    <td class="label">Número de Vuelo / Reserva:</td>
                    <td class="value">[NÚMERO DE RESERVA]</td>
                </tr>
            </table>
        </div>
        
        <!-- SECCIÓN 4: Vacunación -->
        <div class="document-section">
            <div class="section-title">4. Registro de Vacunación</div>
            
            <div class="declaration">
                <div class="declaration-title">Vacunación Antirrábica</div>
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 40%;"><strong>Vacuna Administrada:</strong></td>
                        <td>[NOMBRE DE LA VACUNA ANTIRRÁBICA]</td>
                    </tr>
                    <tr>
                        <td><strong>Número de Lote:</strong></td>
                        <td>[NÚMERO DE LOTE]</td>
                    </tr>
                    <tr>
                        <td><strong>Fecha de Vacunación:</strong></td>
                        <td><%= petInfo.getRabiesVaccinationDate() != null ? 
                                sdf.format(petInfo.getRabiesVaccinationDate()) : "[FECHA DE VACUNACIÓN]" %></td>
                    </tr>
                    <tr>
                        <td><strong>Fecha de Vencimiento:</strong></td>
                        <td>[FECHA DE VENCIMIENTO - 1 o 3 años según tipo]</td>
                    </tr>
                    <tr>
                        <td><strong>Veterinario que Administró:</strong></td>
                        <td>[NOMBRE DEL VETERINARIO]</td>
                    </tr>
                    <tr>
                        <td><strong>Clínica Veterinaria:</strong></td>
                        <td>[NOMBRE Y DIRECCIÓN DE LA CLÍNICA]</td>
                    </tr>
                </table>
                
                <div style="margin-top: 20px; padding: 10px; background: #fff3cd; border: 1px dashed #856404;">
                    <strong>IMPORTANTE:</strong> La vacunación debe administrarse al menos 21 días antes del viaje para países de la UE.
                    Para Australia, Japón y otros países, se requiere prueba de titulación de anticuerpos.
                </div>
            </div>
            
            <div style="margin-top: 20px;">
                <strong>Otras Vacunas Administradas:</strong><br>
                <table style="width: 100%; margin-top: 10px;">
                    <tr>
                        <td style="width: 30%;">Moquillo/Parvovirus:</td>
                        <td><%= petInfo.getLastVaccinationDate() != null ? 
                                sdf.format(petInfo.getLastVaccinationDate()) : "[FECHA]" %></td>
                    </tr>
                    <tr>
                        <td>Hepatitis/Leptospirosis:</td>
                        <td>[FECHA]</td>
                    </tr>
                    <tr>
                        <td>Parainfluenza/Bordetella:</td>
                        <td>[FECHA]</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- SECCIÓN 5: Certificación de Salud -->
        <div class="document-section">
            <div class="section-title">5. Certificación de Salud</div>
            
            <div class="declaration">
                <div class="declaration-title">Declaración del Veterinario</div>
                <div class="declaration-text">
                    Yo, el abajo firmante, certifico que soy un veterinario debidamente autorizado y acreditado 
                    por el Departamento de Agricultura de los Estados Unidos (USDA) y que he examinado al animal 
                    descrito anteriormente en la fecha de ____________________.
                    
                    Declaro que, según mi mejor conocimiento y juicio profesional:
                    
                    1. El animal está clínicamente sano y libre de signos de enfermedades infecciosas o contagiosas.
                    2. El animal ha sido tratado adecuadamente contra parásitos internos y externos.
                    3. El animal está apto para viajar y no presenta condiciones que puedan comprometer su bienestar durante el transporte.
                    4. Todas las vacunaciones registradas han sido administradas de acuerdo con los protocolos veterinarios estándar.
                    5. El animal no ha estado en contacto con animales enfermos en los últimos 30 días.
                    6. El microchip ha sido verificado y es funcional (si aplica).
                    
                    Esta certificación es válida por 30 días a partir de la fecha de la firma del veterinario.
                </div>
            </div>
            
            <!-- Área para tratamiento antiparasitario -->
            <div style="margin-top: 20px; padding: 15px; border: 1px solid #28a745; background: #d4edda;">
                <strong>TRATAMIENTO CONTRA PARÁSITOS (Echinococcus/tenia):</strong><br>
                <em>Requerido para viajar al Reino Unido, Irlanda, Finlandia, Noruega y Malta</em><br><br>
                
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 40%;"><strong>Medicamento Administrado:</strong></td>
                        <td>[NOMBRE DEL MEDICAMENTO]</td>
                    </tr>
                    <tr>
                        <td><strong>Fecha de Administración:</strong></td>
                        <td>[FECHA - Entre 1 y 5 días antes del viaje]</td>
                    </tr>
                    <tr>
                        <td><strong>Dosis:</strong></td>
                        <td>[DOSIS]</td>
                    </tr>
                    <tr>
                        <td><strong>Veterinario:</strong></td>
                        <td>[NOMBRE Y FIRMA]</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- SECCIÓN 6: Requisitos del País de Destino -->
        <div class="document-section">
            <div class="section-title">6. Requisitos Específicos del País de Destino: <%= petInfo.getDestinationCountry() %></div>
            
            <div class="requirements-box">
                <div class="requirements-title">Información para el Propietario</div>
                
                <% if (requirements != null && !requirements.isEmpty()) { %>
                    <ul style="margin: 10px 0 10px 20px;">
                        <% for (Map.Entry<String, String> req : requirements.entrySet()) { %>
                        <li><%= req.getValue() %></li>
                        <% } %>
                    </ul>
                <% } else { %>
                    <p>Verifique los requisitos específicos con la embajada o consulado de 
                    <strong><%= petInfo.getDestinationCountry() %></strong> en Estados Unidos.</p>
                <% } %>
                
                <p><strong>Pasos Adicionales que pueden ser Requeridos:</strong></p>
                <ol>
                    <li>Permiso de importación del país de destino</li>
                    <li>Prueba de titulación de anticuerpos antirrábicos (FAVN/OIE)</li>
                    <li>Cuarentena a la llegada (países como Australia, Nueva Zelanda)</li>
                    <li>Endoso oficial por parte de la oficina de USDA APHIS</li>
                    <li>Traducción oficial del certificado al idioma del país de destino</li>
                    <li>Apostilla o legalización de documentos</li>
                </ol>
            </div>
            
            <!-- Información de contacto de autoridades -->
            <div style="margin-top: 20px; padding: 10px; background: #f8f9fa; border: 1px solid #dee2e6;">
                <strong>Autoridades de Contacto:</strong><br>
                • USDA APHIS: (301) 851-3300 | aphis.usda.gov<br>
                • CDC Importación de Animales: cdc.gov/importation<br>
                • Embajada de <%= petInfo.getDestinationCountry() %>: [TELÉFONO Y DIRECCIÓN]
            </div>
        </div>
        
        <!-- Salto de página para impresión -->
        <div class="page-break"></div>
        
        <!-- SECCIÓN 7: Firmas y Sellos -->
        <div class="document-section">
            <div class="section-title">7. Autorizaciones y Firmas</div>
            
            <!-- Firma del Veterinario -->
            <div class="signature-block">
                <div class="signature-line"></div>
                <div class="signature-label">
                    <strong>Firma del Veterinario Autorizado USDA</strong><br>
                    [NOMBRE COMPLETO EN LETRA DE MOLDE]<br>
                    Número de Licencia: [NÚMERO DE LICENCIA VETERINARIA]<br>
                    Fecha: _________________________
                </div>
                
                <div class="official-stamp">
                    SELLO OFICIAL<br>
                    USDA APHIS<br>
                    VETERINARIO<br>
                    AUTORIZADO<br>
                    ______________
                </div>
            </div>
            
            <!-- Firma del Propietario -->
            <div style="margin-top: 60px;">
                <div class="signature-line"></div>
                <div class="signature-label">
                    <strong>Firma del Propietario / Exportador</strong><br>
                    Yo, <%= petInfo.getOwnerName() %>, declaro que toda la información proporcionada es veraz y completa.<br>
                    Fecha: _________________________<br>
                    Lugar: _________________________
                </div>
            </div>
            
            <!-- Endoso de USDA APHIS -->
            <div style="margin-top: 80px; padding: 20px; border: 2px solid #000; background: #fff;">
                <div style="text-align: center; font-weight: bold; margin-bottom: 15px;">
                    PARA USO OFICIAL ÚNICAMENTE - ENDOSO USDA APHIS
                </div>
                <div style="border: 1px dashed #000; padding: 15px; min-height: 100px;">
                    <p><strong>Endoso del Inspector Oficial USDA APHIS:</strong></p>
                    <p>Certifico que he revisado este documento y que cumple con los requisitos establecidos.</p><br><br>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 50%;">Firma: _______________________</td>
                            <td>Fecha: ___________________</td>
                        </tr>
                        <tr>
                            <td>Nombre: [INSPECTOR USDA]</td>
                            <td>Sello Oficial USDA APHIS:</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        
        <!-- SECCIÓN 8: Instrucciones y Notas -->
        <div class="document-section instructions">
            <strong>INSTRUCCIONES IMPORTANTES:</strong><br><br>
            
            1. Este documento debe acompañar al animal durante todo el viaje.<br>
            2. Presente este documento a las autoridades sanitarias en el punto de entrada.<br>
            3. Mantenga una copia para sus registros.<br>
            4. La validez de este certificado es de 30 días a partir de la fecha de firma del veterinario.<br>
            5. Para animales que viajan a la UE: El certificado debe ser endosado por USDA APHIS dentro de 10 días antes del viaje.<br>
            6. Verifique los horarios de oficina de USDA APHIS para endoso: https://www.aphis.usda.gov/aphis/ourfocus/animalhealth/export<br>
            7. Para emergencias durante el viaje: Contacte a la aerolínea y a las autoridades sanitarias del país de destino.<br><br>
            
            <strong>Este documento fue generado electrónamente el <%= currentDate %> por Pet Travel Docs System.</strong><br>
            Referencia: PTD-<%= String.format("%06d", (int)(Math.random() * 1000000)) %> | 
            ID de Mascota: <%= petInfo.getPetName().hashCode() %>
        </div>
    </div>
    
    <script>
        // Función para simular descarga de PDF
        function downloadAsPDF() {
            alert('En una implementación real, aquí se generaría el PDF del documento.\n\nPara este demo, puedes usar la función de impresión del navegador y seleccionar "Guardar como PDF".\n\nEn producción, se implementaría con una librería como iTextPDF o Apache PDFBox.');
            
            // Opción: Redirigir a una versión para imprimir
            window.print();
        }
        
        // Configuración para impresión
        window.addEventListener('beforeprint', function() {
            // Añadir información adicional para impresión
            const printInfo = document.createElement('div');
            printInfo.style.textAlign = 'center';
            printInfo.style.fontSize = '9pt';
            printInfo.style.color = '#666';
            printInfo.style.marginTop = '20px';
            printInfo.innerHTML = 'Documento generado por Pet Travel Docs System | Página 1 de 2';
            
            const container = document.querySelector('.document-container');
            container.appendChild(printInfo);
        });
        
        // Inicializar
        window.onload = function() {
            // Añadir fecha actualizada
            const now = new Date();
            const generatedTime = now.toLocaleTimeString('es-ES', { 
                hour: '2-digit', 
                minute: '2-digit',
                second: '2-digit'
            });
            
            const timestamp = document.createElement('div');
            timestamp.style.position = 'fixed';
            timestamp.style.bottom = '10px';
            timestamp.style.left = '10px';
            timestamp.style.fontSize = '8pt';
            timestamp.style.color = '#999';
            timestamp.className = 'no-print';
            timestamp.innerHTML = `Generado: ${now.toLocaleDateString()} ${generatedTime}`;
            
            document.body.appendChild(timestamp);
            
            // Resaltar campos importantes
            const importantLabels = document.querySelectorAll('.label');
            importantLabels.forEach(label => {
                label.style.fontWeight = 'bold';
            });
        };
        
        // Validar que todos los campos críticos estén presentes
        function validateDocument() {
            const criticalFields = [
                'ownerName', 'petName', 'destinationCountry', 
                'travelDate', 'rabiesVaccinationDate'
            ];
            
            let isValid = true;
            let missingFields = [];
            
            criticalFields.forEach(field => {
                if (!<%= petInfo.getOwnerName() != null %> && field === 'ownerName') {
                    missingFields.push('Nombre del dueño');
                }
                // Agregar más validaciones según sea necesario
            });
            
            if (missingFields.length > 0) {
                alert('Advertencia: Los siguientes campos son críticos y deben completarse:\n\n' + 
                      missingFields.join('\n') + '\n\nComplete esta información manualmente en el documento.');
            }
            
            return isValid;
        }
        
        // Ejecutar validación al cargar
        validateDocument();
    </script>
</body>
</html>