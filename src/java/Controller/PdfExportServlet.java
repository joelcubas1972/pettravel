package Controller;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.events.*;
import com.itextpdf.kernel.font.*;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.*;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.properties.*;

import jakarta.activation.DataHandler;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.mail.util.ByteArrayDataSource;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import jakarta.servlet.http.Part;

import java.io.*;
import java.util.*;
import java.util.Base64;
import java.util.function.BiConsumer;

@WebServlet(name = "PdfExportServlet", urlPatterns = {"/PdfExportServlet"})
@MultipartConfig
public class PdfExportServlet extends HttpServlet {

    private static final String SMTP_USER = System.getenv("SMTP_USER");
    private static final String SMTP_PASS = System.getenv("SMTP_PASS");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        boolean preview = "true".equals(request.getParameter("preview"));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            PdfWriter writer = new PdfWriter(baos);
            PdfDocument pdf = new PdfDocument(writer);
            Document doc = new Document(pdf, PageSize.A4);
            doc.setMargins(60, 50, 60, 50);

            PdfFont font = PdfFontFactory.createFont(StandardFonts.HELVETICA);
            PdfFont bold = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);

            // 🔹 Watermark diagonal y atenuado
            pdf.addEventHandler(PdfDocumentEvent.END_PAGE, event -> {
                PdfDocumentEvent docEvent = (PdfDocumentEvent) event;
                PdfCanvas canvas = new PdfCanvas(docEvent.getPage());
                canvas.saveState();

                Canvas c = new Canvas(canvas, docEvent.getPage().getPageSize());
                Paragraph watermark = new Paragraph("CONFIDENTIAL")
                        .setFont(font)
                        .setFontSize(80)
                        .setFontColor(ColorConstants.LIGHT_GRAY)
                        .setOpacity(0.2f)
                        .setRotationAngle(Math.toRadians(45));

                float x = docEvent.getPage().getPageSize().getWidth() / 2;
                float y = docEvent.getPage().getPageSize().getHeight() / 2;

                c.showTextAligned(watermark, x, y, TextAlignment.CENTER);
                canvas.restoreState();
            });

            // 🔹 Header con logo y datos de la clínica
            Table header = new Table(new float[]{1, 3});
            header.setWidth(UnitValue.createPercentValue(100));

            try {
                String logoPath = request.getServletContext().getRealPath("/assets/logo.jpeg");
                ImageData logoData = ImageDataFactory.create(logoPath);
                Image logo = new Image(logoData);
                logo.setAutoScale(false);
                float rowHeight = 16 + 12 + 12 + 6; // aproximación de altura de 3 filas
                logo.scaleToFit(100, rowHeight * 3);

                Cell logoCell = new Cell().add(logo).setBorder(Border.NO_BORDER)
                        .setVerticalAlignment(VerticalAlignment.MIDDLE)
                        .setPadding(0);

                Cell textCell = new Cell().setBorder(Border.NO_BORDER)
                        .setPaddingLeft(10)
                        .setVerticalAlignment(VerticalAlignment.MIDDLE);

                Paragraph pName = new Paragraph("ConsultVet.inc Pet Travel")
                        .setFont(bold).setFontSize(18);
                Paragraph pAddress = new Paragraph("1234 Example Ave, Miami, FL 33101")
                        .setFont(font).setFontSize(12);
                Paragraph pContact = new Paragraph("Email: consultvet.inc@gmail.com | Tel: +1 (786) 399-0229")
                        .setFont(font).setFontSize(12);

                textCell.add(pName).add(pAddress).add(pContact);

                header.addCell(logoCell);
                header.addCell(textCell);
                doc.add(header);
                doc.add(new Paragraph("\n")); // separación del header

            } catch (Exception e) {
                e.printStackTrace();
            }

            // 🔹 Helper para secciones
            int[] counter = {1};
            BiConsumer<String, String> section = (title, value) -> {
                if (value == null || value.isBlank()) {
                    return;
                }
                doc.add(new Paragraph(counter[0] + ". " + title).setFont(bold));
                for (String line : value.split("\n")) {
                    doc.add(new Paragraph("   • " + line.trim()).setMarginLeft(20));
                }
                doc.add(new Paragraph("\n"));
                counter[0]++;
            };

            // 🔹 Sections
            section.accept("Destination Country", request.getParameter("destinationCountry"));
            section.accept("Who is accompanying the pet?", mapAccompanying(request.getParameter("accompanyingPerson")));
            section.accept("Address in Destination Country", request.getParameter("destinationAddress"));
            section.accept("How is your pet leaving the United States?", mapTravel(request.getParameter("travelMethod")));
            if (request.getParameter("travelDetails") != null) {
                section.accept("Travel Details", request.getParameter("travelDetails"));
            }
            section.accept("Departure Date", request.getParameter("departureDate"));
            section.accept("Arrival Dates",
                    "Owner: " + Optional.ofNullable(request.getParameter("arrivalDateOwner")).orElse("")
                    + "\nPet: " + Optional.ofNullable(request.getParameter("arrivalDatePet")).orElse(""));
            section.accept("Number of pets traveling", request.getParameter("numberOfPets"));
            String[] petTypes = request.getParameterValues("petType");
            if (petTypes != null) {
                section.accept("Type of pet", String.join(", ", petTypes));
            }

            int pets = Integer.parseInt(Optional.ofNullable(request.getParameter("numberOfPets")).orElse("0"));
            for (int i = 1; i <= pets; i++) {
                section.accept("Pet " + i,
                        "Name: " + Optional.ofNullable(request.getParameter("petName" + i)).orElse("")
                        + "\nAge: " + Optional.ofNullable(request.getParameter("petAge" + i)).orElse("")
                        + "\nSize: " + mapSize(request.getParameter("petSize" + i))
                        + "\nMicrochip: " + Optional.ofNullable(request.getParameter("petChip" + i)).orElse("")
                        + "\nRabies Status: " + mapRabies(request.getParameter("rabiesStatus" + i))
                        + "\nRabies Date: " + Optional.ofNullable(request.getParameter("rabiesDate" + i)).orElse(""));
            }

            section.accept("Import Permit Required", mapYesNo(request.getParameter("importPermit")));
            section.accept("Airline / Cruise Additional Requirements", mapYesNo(request.getParameter("additionalRequirements")));

            // 🔹 Firma del cliente
            //doc.add(new Paragraph("\n\nClient Signature:").setFont(bold));
            try {
                // Firma como archivo
                Part signaturePart = request.getPart("clientSignatureFile");
                if (signaturePart != null && signaturePart.getSize() > 0) {
                    ImageData sigData = ImageDataFactory.create(signaturePart.getInputStream().readAllBytes());
                    Image sigImage = new Image(sigData).scaleToFit(200, 100);
                    doc.add(sigImage);
                }

                // Firma como Base64 (canvas)
                /*String signatureBase64 = request.getParameter("clientSignatureBase64");
                if (signatureBase64 != null && !signatureBase64.isBlank()) {
                    signatureBase64 = signatureBase64.replaceFirst("^data:image/[^;]+;base64,", "");
                    byte[] sigBytes = Base64.getDecoder().decode(signatureBase64);
                    ImageData sigData = ImageDataFactory.create(sigBytes);
                    Image sigImage = new Image(sigData).scaleToFit(200, 100);
                    doc.add(sigImage);
                }*/
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 🔹 Client Signature
            String signatureBase64 = request.getParameter("clientSignatureBase64");
            if (signatureBase64 != null && !signatureBase64.isBlank()) {
                try {
                    // Quitar el prefijo "data:image/png;base64,"
                    String base64Image = signatureBase64.split(",")[1];
                    byte[] imageBytes = Base64.getDecoder().decode(base64Image);

                    com.itextpdf.layout.element.Image signatureImg = new com.itextpdf.layout.element.Image(
                            com.itextpdf.io.image.ImageDataFactory.create(imageBytes)
                    );

                    signatureImg.setAutoScale(true);
                    // Opcional: agregar un título encima
                    doc.add(new Paragraph("Client Signature").setFont(bold).setFontSize(12));
                    doc.add(signatureImg);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            doc.close();

            byte[] pdfBytes = baos.toByteArray();
            if (preview) {
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=PetTravel.pdf");
                response.getOutputStream().write(pdfBytes);
                return;
            }

            sendEmail(pdfBytes, request);
            response.setContentType("application/json");
            response.getWriter().print("{\"ok\":true}");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{\"ok\":false}");
        }
    }

    // 🔹 Mappers
    private String mapAccompanying(String v) {
        return Map.of(
                "OWNER", "The owner",
                "AUTHORIZED", "A person authorized by the owner",
                "NO_ONE", "No one",
                "TRANSPORT_COMPANY", "Pet transport company"
        ).getOrDefault(v, "");
    }

    private String mapTravel(String v) {
        return Map.of(
                "AIR_DIRECT", "Air – Direct Flight",
                "AIR_LAYOVER", "Air – Layovers",
                "CAR", "Car",
                "TRAIN", "Train",
                "BOAT_DIRECT", "Boat – Direct",
                "CRUISE", "Cruise ship"
        ).getOrDefault(v, "");
    }

    private String mapRabies(String v) {
        return Map.of(
                "SAME_VET", "Administered by certifying veterinarian",
                "OTHER_VET", "Administered by another veterinarian",
                "UNKNOWN", "I don’t know",
                "NOT_VACCINATED", "Not vaccinated"
        ).getOrDefault(v, "");
    }

    private String mapSize(String v) {
        return Map.of("SMALL", "Small", "MEDIUM", "Medium", "LARGE", "Large").getOrDefault(v, "");
    }

    private String mapYesNo(String v) {
        return Map.of("YES", "Yes", "NO", "No", "UNKNOWN", "I don’t know").getOrDefault(v, "");
    }

    private void sendEmail(byte[] pdf, HttpServletRequest request) throws Exception {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USER, SMTP_PASS);
            }
        });

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(SMTP_USER));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(SMTP_USER));
        msg.setSubject("New Pet Travel Request");

        MimeBodyPart text = new MimeBodyPart();
        text.setText("New Pet Travel document attached.");

        MimeBodyPart pdfPart = new MimeBodyPart();
        pdfPart.setDataHandler(new DataHandler(new ByteArrayDataSource(pdf, "application/pdf")));
        pdfPart.setFileName("PetTravel.pdf");

        Multipart mp = new MimeMultipart();
        mp.addBodyPart(text);
        mp.addBodyPart(pdfPart);

        msg.setContent(mp);
        Transport.send(msg);
    }
}
