package com.tourism.servlet;

import com.tourism.dto.LoyaltyProgramDTO;
import com.tourism.service.LoyaltyProgramService;
import com.tourism.dao.LoyaltyProgramDAO;
import com.tourism.dao.interfaces.ILoyaltyProgramDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoyaltyProgramServlet extends HttpServlet {
    private LoyaltyProgramService loyaltyProgramService;

    @Override
    public void init() {
        ILoyaltyProgramDAO loyaltyProgramDAO = new LoyaltyProgramDAO();
        loyaltyProgramService = new LoyaltyProgramService(loyaltyProgramDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int points = Integer.parseInt(request.getParameter("points"));

        // Validation: Ensure points are not negative
        if (points < 0) {
            response.getWriter().write("Error: Points cannot be negative.");
            return;
        }

        boolean success = loyaltyProgramService.updateLoyaltyPoints(userId, points);
        response.getWriter().write(success ? "Loyalty Points Updated Successfully" : "Error Updating Loyalty Points");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        LoyaltyProgramDTO loyaltyProgram = loyaltyProgramService.getLoyaltyByUserId(userId);

        if (loyaltyProgram != null) {
            response.getWriter().write("Loyalty Program Found: Points - " + loyaltyProgram.getPoints());
        } else {
            response.getWriter().write("Loyalty Program Not Found");
        }
    }
}
