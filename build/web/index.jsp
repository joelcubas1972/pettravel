<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Travel Docs - Documentos de Viaje para Mascotas</title>
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            --warning-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            --info-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #4a6491 100%);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
            color: #333;
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

        .hero-section {
            padding: 80px 0;
            background: linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.7)), 
                        url('https://images.unsplash.com/photo-1514888286974-6d03bde4ba1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            border-radius: 30px;
            margin-top: 30px;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--primary-gradient);
            opacity: 0.05;
            z-index: -1;
        }

        .hero-title {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 3.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }

        .hero-subtitle {
            font-size: 1.3rem;
            color: #666;
            margin-bottom: 2rem;
            max-width: 600px;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
        }

        .feature-icon {
            width: 70px;
            height: 70px;
            background: var(--primary-gradient);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 30px;
            color: white;
        }

        .feature-card h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .feature-card p {
            color: #666;
            line-height: 1.6;
        }

        .cta-section {
            background: var(--dark-gradient);
            border-radius: 30px;
            padding: 50px;
            margin: 50px 0;
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .cta-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none"><path d="M0,0V100H1000V0C1000,0 500,100 0,0Z" fill="rgba(255,255,255,0.1)"/></svg>');
            background-size: 100% 100px;
            background-position: bottom;
        }

        .cta-title {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .cta-text {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-primary-custom {
            background: var(--primary-gradient);
            border: none;
            border-radius: 15px;
            padding: 15px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            color: white;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-primary-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
            color: white;
        }

        .btn-secondary-custom {
            background: var(--warning-gradient);
            border: none;
            border-radius: 15px;
            padding: 12px 30px;
            font-size: 1rem;
            font-weight: 600;
            color: #333;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(250, 112, 154, 0.3);
        }

        .btn-secondary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(250, 112, 154, 0.4);
            color: #333;
        }

        .btn-info-custom {
            background: var(--info-gradient);
            border: none;
            border-radius: 15px;
            padding: 12px 30px;
            font-size: 1rem;
            font-weight: 600;
            color: white;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.3);
        }

        .btn-info-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(79, 172, 254, 0.4);
            color: white;
        }

        .requirements-list {
            list-style: none;
            padding: 0;
        }

        .requirements-list li {
            background: white;
            padding: 15px 25px;
            margin-bottom: 15px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            gap: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .requirements-list li:hover {
            transform: translateX(10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .requirements-list li i {
            width: 40px;
            height: 40px;
            background: var(--success-gradient);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
        }

        .note-box {
            background: linear-gradient(135deg, #fff9c4 0%, #fffde7 100%);
            border-left: 5px solid #ffc107;
            padding: 25px;
            border-radius: 15px;
            margin-top: 30px;
        }

        .note-box h4 {
            color: #ff9800;
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
        }

        .country-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .country-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .country-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .country-flag {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: var(--primary-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            color: white;
            font-size: 24px;
        }

        .step-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            text-align: center;
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .step-number {
            width: 60px;
            height: 60px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
            font-weight: 700;
            margin: 0 auto 20px;
        }

        .species-list {
            list-style: none;
            padding: 0;
        }

        .species-list li {
            padding: 10px 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .species-list li:last-child {
            border-bottom: none;
        }

        .species-list li i {
            color: #ff9800;
            font-size: 1.2rem;
        }

        .modal-header-custom {
            background: var(--warning-gradient);
            color: #333;
            border-radius: 20px 20px 0 0;
        }

        .modal-content-custom {
            border-radius: 20px;
            border: none;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        footer {
            background: var(--dark-gradient);
            color: white;
            padding: 40px 0;
            margin-top: 80px;
            border-radius: 30px 30px 0 0;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: white;
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .cta-section {
                padding: 30px 20px;
            }
            
            .feature-card {
                padding: 20px;
            }

            .hero-buttons {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }
        }

        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }

        .animate-on-scroll.visible {
            opacity: 1;
            transform: translateY(0);
        }
        .custom-container {
            max-width: 90%;
            margin: 0 auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        /* Para pantallas pequeñas, usa el ancho completo */
        @media (max-width: 768px) {
            .custom-container {
                max-width: 100%;
                padding-left: 20px;
                padding-right: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-paw me-2"></i>Pet Travel Docs
            </a>
            <div class="navbar-text">
                <span class="badge bg-primary rounded-pill">
                    <i class="fas fa-globe-americas me-1"></i> Desde EE.UU.
                </span>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="custom-container">
        <div class="hero-section">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="hero-title">Viaja Seguro con tu Mascota 🐾</h1>
                    <p class="hero-subtitle">
                        Genera todos los documentos necesarios para viajar con tu compañero peludo desde Estados Unidos 
                        a cualquier destino del mundo. Simple, rápido y confiable.
                    </p>
                    <div class="hero-buttons d-flex flex-wrap gap-3">
                        <!-- Botón Información del Viaje (USDA Worksheet) -->
                        <form action="MainServlet" method="post">
                            <input type="hidden" name="action" value="petInfo">
                            <button type="submit" class="btn-secondary-custom">
                                <i class="fas fa-file-alt me-2"></i> Pet Travel Information
                            </button>
                        </form>
                        
                        <form action="MainServlet?action=start" method="post">
                            <input type="hidden" name="action" value="start">
                            <button type="submit" class="btn-primary-custom">
                                <i class="fas fa-rocket me-2"></i> Export to another Country
                            </button>
                        </form>
                        
                        <!-- Botón para viajes interestatales -->
                        <form action="MainServlet?action=interstate" method="post">
                            <input type="hidden" name="action" value="interstate">
                            <button type="submit" class="btn-info-custom">
                                <i class="fas fa-map-marked-alt me-2"></i> Travel Interstate
                            </button>
                        </form>
                        
                        <!-- Botón para mostrar especies no consideradas mascotas -->
                        <button type="button" class="btn-secondary-custom" data-bs-toggle="modal" data-bs-target="#speciesModal">
                            <i class="fas fa-info-circle me-2"></i> ¿Qué aves NO son mascotas?
                        </button>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <div class="position-relative">
                        <img src="https://cdn-icons-png.flaticon.com/512/1998/1998678.png" 
                             alt="Mascota viajera" 
                             class="img-fluid" 
                             style="max-width: 400px; filter: drop-shadow(0 20px 30px rgba(0,0,0,0.1));">
                        <div class="position-absolute top-0 start-0 translate-middle">
                            <div class="bg-primary text-white rounded-circle p-3" style="width: 60px; height: 60px;">
                                <i class="fas fa-passport"></i>
                            </div>
                        </div>
                        <div class="position-absolute top-0 end-0 translate-middle">
                            <div class="bg-success text-white rounded-circle p-3" style="width: 60px; height: 60px;">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal para mostrar especies que no son mascotas -->
        <div class="modal fade" id="speciesModal" tabindex="-1" aria-labelledby="speciesModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content modal-content-custom">
                    <div class="modal-header modal-header-custom">
                        <h3 class="modal-title" id="speciesModalLabel">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            Aves que NO se consideran mascotas para viaje
                        </h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <div class="alert alert-warning">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            <strong>Importante:</strong> Las siguientes aves NO están consideradas como mascotas para efectos de documentación de viaje, según regulaciones internacionales.
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <h5 class="mb-3 text-primary">
                                    <i class="fas fa-dove me-2"></i>Especificaciones:
                                </h5>
                                <p>Estas aves son consideradas como <strong>aves de corral o de caza</strong> y requieren permisos especiales, certificados sanitarios específicos y cumplimiento con normativas de importación/exportación diferentes a las mascotas domésticas.</p>
                                
                                <div class="alert alert-info mt-3">
                                    <i class="fas fa-clipboard-check me-2"></i>
                                    <strong>Nota:</strong> Para transportar estas aves, contacta con las autoridades veterinarias y aduaneras del país de destino.
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <h5 class="mb-3 text-primary">
                                    <i class="fas fa-list me-2"></i>Lista de Aves:
                                </h5>
                                <div class="species-container">
                                    <ul class="species-list">
                                        <li><i class="fas fa-kiwi-bird"></i> Chickens (Gallinas)</li>
                                        <li><i class="fas fa-dove"></i> Doves (Palomas)</li>
                                        <li><i class="fas fa-duck"></i> Ducks (Patos)</li>
                                        <li><i class="fas fa-feather-alt"></i> Geese (Gansos)</li>
                                        <li><i class="fas fa-feather"></i> Grouse (Urogallos)</li>
                                        <li><i class="fas fa-egg"></i> Guinea fowl (Gallinas de Guinea)</li>
                                        <li><i class="fas fa-search"></i> Partridges (Perdices)</li>
                                        <li><i class="fas fa-crow"></i> Pea fowl (Pavos reales)</li>
                                        <li><i class="fas fa-feather"></i> Pheasants (Faisanes)</li>
                                        <li><i class="fas fa-dove"></i> Pigeons (Palomas mensajeras)</li>
                                        <li><i class="fas fa-egg"></i> Quail (Codornices)</li>
                                        <li><i class="fas fa-feather-alt"></i> Swans (Cisnes)</li>
                                        <li><i class="fas fa-turkey"></i> Turkeys (Pavos)</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="note-box">
                                    <h4><i class="fas fa-info-circle me-2"></i> Información adicional:</h4>
                                    <div class="mb-0">
                                        Para transportar estas aves, generalmente se requieren:
                                        <ul class="mt-2 mb-0">
                                            <li>Certificados sanitarios específicos para aves de corral</li>
                                            <li>Permisos de importación/exportación del USDA</li>
                                            <li>Cumplimiento con regulaciones de cuarentena</li>
                                            <li>Documentación CITES si aplica (especies protegidas)</li>
                                            <li>Aprobación previa de las autoridades del país de destino</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <a href="https://www.aphis.usda.gov/live-animal-export" 
                           target="_blank" 
                           class="btn btn-warning">
                            <i class="fas fa-external-link-alt me-2"></i> Ver regulaciones USDA
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="row mt-5">
            <div class="col-md-4">
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-globe-americas"></i>
                    </div>
                    <h3>🌍 Documentos Internacionales</h3>
                    <p>Prepara requisitos específicos para más de 50 países. Actualizado con las regulaciones más recientes.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-file-medical"></i>
                    </div>
                    <h3>📋 Certificado de Salud</h3>
                    <p>Genera el formulario oficial USDA APHIS 7001 listo para imprimir y firmar por tu veterinario.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h3>📱 Mobile Friendly</h3>
                    <p>Accede desde cualquier dispositivo. Interfaz optimizada para móviles y tabletas.</p>
                </div>
            </div>
        </div>

        <!-- CTA Section -->
        <div class="cta-section animate-on-scroll">
            <h2 class="cta-title">¿Listo para tu próxima aventura?</h2>
            <p class="cta-text">
                Miles de dueños han viajado exitosamente con sus mascotas usando nuestro sistema. 
                ¡Únete a ellos y haz que el viaje sea una experiencia sin preocupaciones!
            </p>
            <div class="d-flex justify-content-center gap-3 flex-wrap">
                <form action="${pageContext.request.contextPath}/" method="post">
                    <input type="hidden" name="action" value="start">
                    <button type="submit" class="btn-primary-custom btn-lg">
                        <i class="fas fa-play-circle me-2"></i> Viaje Internacional
                    </button>
                </form>
                
                <form action="MainServlet?action=interstate" method="post" class="d-inline">
                    <input type="hidden" name="action" value="interstate">
                    <button type="submit" class="btn-info-custom btn-lg">
                        <i class="fas fa-map-marked-alt me-2"></i> Viaje Interestatal
                    </button>
                </form>
                
                <button type="button" class="btn-secondary-custom btn-lg" data-bs-toggle="modal" data-bs-target="#speciesModal">
                    <i class="fas fa-question-circle me-2"></i> Ver restricciones
                </button>
            </div>
        </div>

        <!-- Requirements Section -->
        <div class="row mt-5">
            <div class="col-lg-8">
                <h2 class="mb-4" style="font-family: 'Montserrat', sans-serif; font-weight: 600;">
                    <i class="fas fa-clipboard-list me-2"></i> ¿Qué necesitas para comenzar?
                </h2>
                <ul class="requirements-list">
                    <li class="animate-on-scroll">
                        <i class="fas fa-dog"></i>
                        <div>
                            <strong>Información básica de tu mascota</strong>
                            <p class="mb-0">Nombre, especie, raza, edad y características físicas</p>
                        </div>
                    </li>
                    <li class="animate-on-scroll">
                        <i class="fas fa-syringe"></i>
                        <div>
                            <strong>Datos de vacunación antirrábica</strong>
                            <p class="mb-0">Fecha de vacunación, tipo de vacuna y certificado vigente</p>
                        </div>
                    </li>
                    <li class="animate-on-scroll">
                        <i class="fas fa-microchip"></i>
                        <div>
                            <strong>Número de microchip (ISO 11784/11785)</strong>
                            <p class="mb-0">Opcional pero altamente recomendado para la mayoría de países</p>
                        </div>
                    </li>
                    <li class="animate-on-scroll">
                        <i class="fas fa-plane-departure"></i>
                        <div>
                            <strong>Información del viaje</strong>
                            <p class="mb-0">País de destino, fecha estimada y tipo de transporte</p>
                        </div>
                    </li>
                    <li class="animate-on-scroll">
                        <i class="fas fa-user"></i>
                        <div>
                            <strong>Tus datos de contacto</strong>
                            <p class="mb-0">Nombre, dirección en EE.UU., email y teléfono</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-lg-4">
                <div class="note-box animate-on-scroll">
                    <h4><i class="fas fa-info-circle me-2"></i> Importante saber</h4>
                    <p class="mb-0">
                        Este sistema genera formularios basados en requisitos generales internacionales. 
                        Siempre verifica los requerimientos específicos con:
                    </p>
                    <ul class="mt-3 mb-0">
                        <li>La embajada del país de destino</li>
                        <li>Tu aerolínea (políticas de mascotas)</li>
                        <li>Un veterinario certificado por USDA</li>
                        <li>Autoridades estatales (para viajes interestatales)</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Steps Section -->
        <div class="row mt-5">
            <div class="col-12 text-center mb-5">
                <h2 style="font-family: 'Montserrat', sans-serif; font-weight: 600;">
                    <i class="fas fa-road me-2"></i> Proceso en 3 Pasos Simples
                </h2>
                <p class="lead">Desde el formulario hasta los documentos listos</p>
            </div>
            
            <div class="col-md-4">
                <div class="step-card animate-on-scroll">
                    <div class="step-number">1</div>
                    <h4>Completa el Formulario</h4>
                    <p>Proporciona la información de tu mascota y del viaje en nuestro formulario intuitivo.</p>
                    <div class="mt-3">
                        <i class="fas fa-edit fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="step-card animate-on-scroll">
                    <div class="step-number">2</div>
                    <h4>Revisa y Personaliza</h4>
                    <p>Verifica todos los datos y ajusta según los requisitos específicos de tu destino.</p>
                    <div class="mt-3">
                        <i class="fas fa-search fa-2x text-success"></i>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="step-card animate-on-scroll">
                    <div class="step-number">3</div>
                    <h4>Genera y Descarga</h4>
                    <p>Obtén tus documentos en formato PDF, listos para imprimir y presentar.</p>
                    <div class="mt-3">
                        <i class="fas fa-file-download fa-2x text-warning"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Popular Destinations -->
        <div class="row mt-5">
            <div class="col-12 text-center mb-4">
                <h2 style="font-family: 'Montserrat', sans-serif; font-weight: 600;">
                    <i class="fas fa-map-marked-alt me-2"></i> Destinos Populares
                </h2>
                <p class="lead">Requisitos preconfigurados para los destinos más comunes</p>
            </div>
            
            <div class="country-grid">
                <div class="country-card animate-on-scroll">
                    <div class="country-flag">
                        <i class="fas fa-euro-sign"></i>
                    </div>
                    <h5>Unión Europea</h5>
                    <p class="small text-muted">Microchip ISO, vacuna antirrábica, 21 días de espera</p>
                </div>
                
                <div class="country-card animate-on-scroll">
                    <div class="country-flag">
                        <i class="fas fa-flag-uk"></i>
                    </div>
                    <h5>Reino Unido</h5>
                    <p class="small text-muted">Tratamiento contra tenia, certificado oficial</p>
                </div>
                
                <div class="country-card animate-on-scroll">
                    <div class="country-flag">
                        <i class="fas fa-flag-usa"></i>
                    </div>
                    <h5>Canadá</h5>
                    <p class="small text-muted">Certificado de salud, vacuna antirrábica actual</p>
                </div>
                
                <div class="country-card animate-on-scroll">
                    <div class="country-flag">
                        <i class="fas fa-sun"></i>
                    </div>
                    <h5>Australia</h5>
                    <p class="small text-muted">Test de titulación, cuarentena, permiso de importación</p>
                </div>
                
                <div class="country-card animate-on-scroll">
                    <div class="country-flag">
                        <i class="fas fa-cherry-blossom"></i>
                    </div>
                    <h5>Japón</h5>
                    <p class="small text-muted">Prueba de anticuerpos, notificación previa</p>
                </div>
                
                <div class="country-card animate-on-scroll">
                    <div class="country-flag">
                        <i class="fas fa-pepper-hot"></i>
                    </div>
                    <h5>México</h5>
                    <p class="small text-muted">Certificado de salud, cartilla de vacunación</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h3 class="mb-3">
                        <i class="fas fa-paw me-2"></i>Pet Travel Docs
                    </h3>
                    <p>Sistema especializado en la generación de documentos para viajes internacionales e interestatales con mascotas desde Estados Unidos.</p>
                    <div class="mt-4">
                        <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white me-3"><i class="fab fa-facebook"></i></a>
                        <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h5 class="mb-3">Enlaces Rápidos</h5>
                    <div class="footer-links">
                        <a href="#" class="d-block mb-2"><i class="fas fa-chevron-right me-2"></i> Inicio</a>
                        <a href="#" class="d-block mb-2"><i class="fas fa-chevron-right me-2"></i> Sobre Nosotros</a>
                        <a href="#" class="d-block mb-2"><i class="fas fa-chevron-right me-2"></i> FAQ</a>
                        <a href="#" class="d-block"><i class="fas fa-chevron-right me-2"></i> Contacto</a>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h5 class="mb-3">Servicios</h5>
                    <div class="footer-links">
                        <a href="MainServlet?action=start" class="d-block mb-2">
                            <i class="fas fa-chevron-right me-2"></i> Viaje Internacional
                        </a>
                        <a href="MainServlet?action=interstate" class="d-block mb-2">
                            <i class="fas fa-chevron-right me-2"></i> Viaje Interestatal
                        </a>
                        <a href="#" class="d-block" data-bs-toggle="modal" data-bs-target="#speciesModal">
                            <i class="fas fa-chevron-right me-2"></i> Restricciones de Especies
                        </a>
                    </div>
                </div>
            </div>
            <hr class="my-4 opacity-25">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-0">
                        <i class="fas fa-copyright me-2"></i> 2025 Pet Travel Docs. Todos los derechos reservados.
                    </p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="mb-0">
                        <i class="fas fa-heart text-danger me-1"></i> Hecho con amor para las mascotas viajeras
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Animation on Scroll -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const animateElements = document.querySelectorAll('.animate-on-scroll');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            });
            
            animateElements.forEach(element => {
                observer.observe(element);
            });
            
            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();
                    const targetId = this.getAttribute('href');
                    if(targetId === '#') return;
                    
                    const targetElement = document.querySelector(targetId);
                    if(targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - 80,
                            behavior: 'smooth'
                        });
                    }
                });
            });
            
            // Update year in footer
            const yearElement = document.getElementById('current-year');
            if (yearElement) {
                yearElement.textContent = new Date().getFullYear();
            }
        });
    </script>
</body>
</html>