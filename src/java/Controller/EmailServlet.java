package Controller;

import Util.ByteArrayDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.activation.*;
import java.text.SimpleDateFormat;

@WebServlet("/EmailServlet")
@MultipartConfig
public class EmailServlet extends HttpServlet {

    // CONFIGURACIÓN DE EMAIL - MODIFICA ESTOS VALORES
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "465"; // Cambiado a 465 (SSL)
    private static final String EMAIL_USERNAME = "joelcubas1972@gmail.com";
    private static final String EMAIL_PASSWORD = "xeck kekj kzba oymz";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String action = request.getParameter("action");

            if ("sendEmail".equals(action)) {
                sendBudgetEmail(request, out);
            } else {
                out.print("error: Acción no válida");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.print("error: " + getErrorMessage(e));
        } finally {
            out.flush();
            out.close();
        }
    }

    private void sendBudgetEmail(HttpServletRequest request, PrintWriter out)
            throws Exception {

        // Obtener parámetros
        String recipientEmail = request.getParameter("recipientEmail");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        String clientName = request.getParameter("clientName");
        String pets = request.getParameter("pets");
        String destination = request.getParameter("destination");
        String totalAmount = request.getParameter("totalAmount");
        String budgetDate = request.getParameter("budgetDate");
        String pdfBase64 = request.getParameter("pdfBase64");

        // Validaciones básicas
        if (recipientEmail == null || recipientEmail.trim().isEmpty()) {
            out.print("error: Email del destinatario requerido");
            return;
        }

        // Configurar propiedades
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Configuración SSL para puerto 465
        if ("465".equals(SMTP_PORT)) {
            props.put("mail.smtp.socketFactory.port", SMTP_PORT);
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");
        }

        // Deshabilitar verificación SSL si hay problemas
        props.put("mail.smtp.ssl.trust", SMTP_HOST);
        props.put("mail.smtp.ssl.enable", "true");

        // Timeouts
        props.put("mail.smtp.connectiontimeout", "30000");
        props.put("mail.smtp.timeout", "30000");
        props.put("mail.smtp.writetimeout", "30000");

        // Debug
        props.put("mail.debug", "true");

        // Crear sesión
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD.trim());
            }
        });

        // Crear mensaje
        MimeMessage emailMessage = new MimeMessage(session);
        emailMessage.setFrom(new InternetAddress(EMAIL_USERNAME, "Pet Travel Docs"));
        emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        emailMessage.setSubject(subject != null ? subject : "Presupuesto Pet Travel Docs");
        emailMessage.setSentDate(new Date());

        // Crear contenido multipart
        Multipart multipart = new MimeMultipart();

        // Parte HTML
        MimeBodyPart htmlPart = new MimeBodyPart();
        String htmlContent = createBudgetEmailHTML(clientName, message, pets, destination, budgetDate, totalAmount);
        htmlPart.setContent(htmlContent, "text/html; charset=utf-8");
        multipart.addBodyPart(htmlPart);

        // Adjuntar PDF si existe
        if (pdfBase64 != null && !pdfBase64.trim().isEmpty()) {
            try {
                addPDFAttachment(multipart, pdfBase64);
            } catch (Exception e) {
                System.err.println("⚠️ Error adjuntando PDF: " + e.getMessage());
                // Continuar sin adjunto
            }
        }

        // Asignar contenido
        emailMessage.setContent(multipart);

        // Enviar email
        Transport.send(emailMessage);

        out.print("success: Presupuesto enviado exitosamente a " + recipientEmail);
    }

    private String createBudgetEmailHTML(String clientName, String message, String pets,
            String destination, String budgetDate, String totalAmount) {

        clientName = clientName != null ? clientName : "Cliente";
        message = message != null ? message : "Adjunto encontrará el presupuesto detallado.";
        pets = pets != null ? pets : "Mascota(s)";
        destination = destination != null ? destination : "Destino";
        budgetDate = budgetDate != null ? budgetDate : new Date().toString();
        totalAmount = totalAmount != null ? totalAmount : "$0.00";

        return "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<meta charset='UTF-8'>"
                + "<style>"
                + "body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }"
                + ".container { max-width: 600px; margin: 0 auto; }"
                + ".header { background: #28a745; color: white; padding: 20px; text-align: center; }"
                + ".content { padding: 20px; background: #f8f9fa; }"
                + ".summary { background: white; border-left: 4px solid #28a745; padding: 15px; margin: 15px 0; }"
                + ".footer { background: #343a40; color: white; padding: 15px; text-align: center; font-size: 12px; }"
                + "</style>"
                + "</head>"
                + "<body>"
                + "<div class='container'>"
                + "<div class='header'>"
                + "<h2>Pet Travel Docs</h2>"
                + "<h3>Presupuesto de Exportación</h3>"
                + "</div>"
                + "<div class='content'>"
                + "<p>Estimado/a <strong>" + escapeHTML(clientName) + "</strong>,</p>"
                + "<p>" + escapeHTML(message).replace("\n", "<br>") + "</p>"
                + "<div class='summary'>"
                + "<h4>Resumen del Presupuesto</h4>"
                + "<p><strong>Cliente:</strong> " + escapeHTML(clientName) + "</p>"
                + "<p><strong>Mascota(s):</strong> " + escapeHTML(pets) + "</p>"
                + "<p><strong>Destino:</strong> " + escapeHTML(destination) + "</p>"
                + "<p><strong>Fecha:</strong> " + escapeHTML(budgetDate) + "</p>"
                + "<p><strong>Total:</strong> <span style='font-weight: bold; color: #28a745;'>" + escapeHTML(totalAmount) + "</span></p>"
                + "</div>"
                + "<p>El presupuesto detallado se encuentra adjunto en formato PDF.</p>"
                + "</div>"
                + "<div class='footer'>"
                + "<p>Atentamente,<br><strong>Pet Travel Docs</strong></p>"
                + "<p>📧 joelcubas1972@gmail.com</p>"
                + "</div>"
                + "</div>"
                + "</body>"
                + "</html>";
    }

    private void addPDFAttachment(Multipart multipart, String pdfBase64) throws Exception {
        try {
            // Limpiar Base64
            String base64Data = pdfBase64.trim();
            if (base64Data.contains(",")) {
                base64Data = base64Data.split(",")[1];
            }

            // Decodificar
            byte[] pdfBytes = Base64.getDecoder().decode(base64Data);

            // Crear DataSource CORRECTAMENTE
            DataSource dataSource = new ByteArrayDataSource(pdfBytes, "application/pdf");

            // Crear parte adjunta
            MimeBodyPart attachmentPart = new MimeBodyPart();
            attachmentPart.setDataHandler(new DataHandler(dataSource));

            // Nombre del archivo
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
            String fileName = "Presupuesto_" + sdf.format(new Date()) + ".pdf";
            attachmentPart.setFileName(fileName);

            multipart.addBodyPart(attachmentPart);

        } catch (Exception e) {
            throw new Exception("Error adjuntando PDF: " + e.getMessage());
        }
    }

    private String escapeHTML(String text) {
        if (text == null) {
            return "";
        }
        return text.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }

    private String getErrorMessage(Exception e) {
        String msg = e.getMessage();

        if (msg.contains("Permission denied")) {
            return "Error de conexión. Verifique su firewall/antivirus o use VPN.";
        } else if (msg.contains("Authentication Failed")) {
            return "Error de autenticación. Use 'App Password' de Gmail.";
        } else if (msg.contains("Could not connect")) {
            return "No se puede conectar al servidor SMTP. Verifique internet.";
        } else if (msg.contains("535")) {
            return "Usuario/contraseña incorrectos o necesita 'App Password'.";
        } else {
            return "Error interno: " + msg;
        }
    }
}
