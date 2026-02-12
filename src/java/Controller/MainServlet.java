package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("📤 POST request recibido. Acción: " + action);

        if ("start".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/views/form.jsp").forward(request, response);
        } else if ("interstate".equals(action)) {
            // Para viaje interestatal
            request.setAttribute("travelType", "interstate");
            request.getRequestDispatcher("/WEB-INF/views/interstate-form.jsp").forward(request, response);
        } else if ("petInfo".equals(action)) {         
            request.getRequestDispatcher("/WEB-INF/views/pet_travel_information.jsp")
                    .forward(request, response);

        } else if ("generate".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/views/form.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }

    }
}
