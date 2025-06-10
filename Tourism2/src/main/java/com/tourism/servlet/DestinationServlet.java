package com.tourism.servlet;

import com.tourism.dto.DestinationDTO;
import com.tourism.service.DestinationService;
import com.tourism.dao.DestinationDAO;
import com.tourism.dao.interfaces.IDestinationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DestinationServlet extends HttpServlet {
    private DestinationService destinationService;

    @Override
    public void init() {
        IDestinationDAO destinationDAO = new DestinationDAO();
        destinationService = new DestinationService(destinationDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        DestinationDTO destination = new DestinationDTO();
        destination.setName(name);
        destination.setDescription(description);

        boolean success = destinationService.addDestination(destination);
        response.getWriter().write(success ? "Destination Added Successfully" : "Error Adding Destination");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));
        DestinationDTO destination = destinationService.getDestinationById(destinationId);

        if (destination != null) {
            response.getWriter().write("Destination Found: " + destination.getName() + ", Description: " + destination.getDescription());
        } else {
            response.getWriter().write("Destination Not Found");
        }
    }
}
