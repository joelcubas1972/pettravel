package Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BudgetServlet", urlPatterns = {"/budget"})
public class BudgetServlet extends HttpServlet {
    
    private Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Obtener parámetros (funciona tanto para GET como POST)
        String client = request.getParameter("client");
        String clientEmail = request.getParameter("clientEmail");
        String pets = request.getParameter("pets");
        String petType = request.getParameter("petType");
        String destination = request.getParameter("destination");
        String petCount = request.getParameter("petCount");
        String travelDate = request.getParameter("travelDate");
        String missingRequirements = request.getParameter("missingRequirements");
        String formType = request.getParameter("formType");
        String budgetType = request.getParameter("budgetType");
        String allPetsData = request.getParameter("allPetsData");
        String totalGeneral = request.getParameter("totalGeneral");
        String hasAllRequirements = request.getParameter("hasAllRequirements");
        String petIndex = request.getParameter("petIndex");
        
        // Procesar missingRequirements
        List<Map<String, Object>> missingReqsList = new ArrayList<>();
        
        if (missingRequirements != null && !missingRequirements.trim().isEmpty() && 
            !missingRequirements.equals("[]")) {
            try {
                Type listType = new TypeToken<List<Map<String, Object>>>(){}.getType();
                missingReqsList = gson.fromJson(missingRequirements, listType);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // Procesar allPetsData para presupuesto total
        List<Map<String, Object>> allPetsList = new ArrayList<>();
        double calculatedTotal = 0.0;
        
        if ("total".equals(budgetType) && allPetsData != null && 
            !allPetsData.trim().isEmpty() && !allPetsData.equals("[]")) {
            try {
                Type listType = new TypeToken<List<Map<String, Object>>>(){}.getType();
                allPetsList = gson.fromJson(allPetsData, listType);
                
                // Calcular total sumando subtotales de cada mascota
                for (Map<String, Object> pet : allPetsList) {
                    if (pet.containsKey("subtotal")) {
                        Object subtotalObj = pet.get("subtotal");
                        if (subtotalObj instanceof Number) {
                            calculatedTotal += ((Number) subtotalObj).doubleValue();
                        } else if (subtotalObj instanceof String) {
                            try {
                                calculatedTotal += Double.parseDouble((String) subtotalObj);
                            } catch (NumberFormatException e) {
                                // Si no se puede parsear, usar 0
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Para presupuesto individual, calcular de missingRequirements
            for (Map<String, Object> req : missingReqsList) {
                Object cost = req.get("estimatedCost");
                if (cost instanceof Number) {
                    calculatedTotal += ((Number) cost).doubleValue();
                } else if (cost instanceof String) {
                    try {
                        calculatedTotal += Double.parseDouble((String) cost);
                    } catch (NumberFormatException e) {
                        calculatedTotal += 50.0;
                    }
                }
            }
            
            // Agregar costo base por mascota
            int petCountInt = 1;
            try {
                petCountInt = Integer.parseInt(petCount != null ? petCount : "1");
            } catch (NumberFormatException e) {
                petCountInt = 1;
            }
            calculatedTotal += (75 * petCountInt);
        }
        
        // Determinar total final
        double finalTotal = calculatedTotal;
        if ("total".equals(budgetType) && totalGeneral != null) {
            try {
                finalTotal = Double.parseDouble(totalGeneral);
            } catch (NumberFormatException e) {
                // Usar calculatedTotal si falla
            }
        }
        
        // Pasar atributos al JSP
        request.setAttribute("client", client != null ? client : "Cliente");
        request.setAttribute("clientEmail", clientEmail != null ? clientEmail : "");
        request.setAttribute("pets", pets != null ? pets : "Mascota(s)");
        request.setAttribute("petType", petType != null ? petType : "");
        request.setAttribute("destination", destination != null ? destination : "Destino");
        request.setAttribute("petCount", petCount != null ? petCount : "1");
        request.setAttribute("travelDate", travelDate != null ? travelDate : "");
        request.setAttribute("formType", formType != null ? formType : "");
        request.setAttribute("hasAllRequirements", hasAllRequirements != null ? hasAllRequirements : "false");
        request.setAttribute("petIndex", petIndex);
        
        // Listas
        request.setAttribute("missingRequirements", gson.toJson(missingReqsList));
        request.setAttribute("missingRequirementsList", missingReqsList);
        request.setAttribute("allPetsData", allPetsData != null ? allPetsData : "[]");
        request.setAttribute("allPetsList", allPetsList); // Lista ya parseada
        
        // Totales
        request.setAttribute("calculatedTotal", String.format("%.2f", calculatedTotal));
        request.setAttribute("finalTotal", String.format("%.2f", finalTotal));
        request.setAttribute("totalGeneral", String.format("%.2f", finalTotal));
        
        // Tipo de presupuesto
        request.setAttribute("budgetType", budgetType != null ? budgetType : "individual");
        
        // Redirigir
        request.getRequestDispatcher("/WEB-INF/views/budget.jsp").forward(request, response);
    }
}