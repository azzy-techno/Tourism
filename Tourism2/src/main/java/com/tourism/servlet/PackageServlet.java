package com.tourism.servlet;

import com.tourism.dto.PackageDTO;
import com.tourism.service.PackageService;
import com.tourism.dao.PackageDAO;
import com.tourism.dao.interfaces.IPackageDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PackageServlet extends HttpServlet {
    private PackageService packageService;

    @Override
    public void init() {
        IPackageDAO packageDAO = new PackageDAO();
        packageService = new PackageService(packageDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        if (price < 100) {
            response.getWriter().write("Error: Package price must be at least 100.");
            return;
        }

        PackageDTO travelPackage = new PackageDTO();
        travelPackage.setName(name);
        travelPackage.setDescription(description);
        travelPackage.setPrice(price);

        boolean success = packageService.addPackage(travelPackage);
        response.getWriter().write(success ? "Package Added Successfully" : "Error Adding Package");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        PackageDTO travelPackage = packageService.getPackageById(packageId);

        if (travelPackage != null) {
            response.getWriter().write("Package Found: " + travelPackage.getName() + ", Price: " + travelPackage.getPrice());
        } else {
            response.getWriter().write("Package Not Found");
        }
    }
}
