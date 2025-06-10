package com.tourism.servlet;

import com.tourism.dto.TravelItineraryDTO;
import com.tourism.service.TravelItineraryService;
import com.tourism.dao.TravelItineraryDAO;
import com.tourism.dao.interfaces.ITravelItineraryDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

public class TravelItineraryServlet extends HttpServlet {
    private TravelItineraryService travelItineraryService;

    @Override
    public void init() {
        ITravelItineraryDAO travelItineraryDAO = new TravelItineraryDAO();
        travelItineraryService = new TravelItineraryService(travelItineraryDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String activities = request.getParameter("activities");

        if (startDate.compareTo(endDate) >= 0) {
            response.getWriter().write("Error: Start date must be before end date.");
            return;
        }

        if (activities == null || activities.isEmpty()) {
            response.getWriter().write("Error: At least one activity must be included.");
            return;
        }
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust format according to your date string pattern
        Date startDateObj = null;
        Date endDateObj = null;
        try {
            startDateObj = sdf.parse(startDate);
            endDateObj = sdf.parse(endDate);
        } catch (ParseException e) {
            response.getWriter().write("Invalid date format.");
            return;
        }

        TravelItineraryDTO itinerary = new TravelItineraryDTO();
        itinerary.setUserId(userId);
        itinerary.setStartDate(startDateObj);
        itinerary.setEndDate(endDateObj);
        itinerary.setActivities(Arrays.asList(activities.split(",")));
        boolean success = travelItineraryService.addItinerary(itinerary);
        response.getWriter().write(success ? "Itinerary Added Successfully" : "Error Adding Itinerary");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itineraryId = Integer.parseInt(request.getParameter("itineraryId"));
        TravelItineraryDTO itinerary = travelItineraryService.getItineraryById(itineraryId);

        if (itinerary != null) {
            response.getWriter().write("Itinerary Found: Start Date - " + itinerary.getStartDate() + ", End Date - " + itinerary.getEndDate());
        } else {
            response.getWriter().write("Itinerary Not Found");
        }
    }
}
