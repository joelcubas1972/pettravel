<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>500 - Error del servidor</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: #d32f2f; }
        pre { text-align: left; background: #f5f5f5; padding: 20px; }
    </style>
</head>
<body>
    <h1>500 - Error interno del servidor</h1>
    <p>Ha ocurrido un error procesando tu solicitud.</p>
    <a href="${pageContext.request.contextPath}/">Volver al inicio</a>
</body>
</html>