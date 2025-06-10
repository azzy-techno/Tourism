package com.tourism.servlet;

import com.tourism.dto.BookingDTO;
import com.tourism.service.BookingService;
import com.tourism.dao.BookingDAO;
import com.tourism.dao.interfaces.IBookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BookingServlet extends HttpServlet {
    private BookingService bookingService;

    @Override
    public void init() {
        IBookingDAO bookingDAO = new BookingDAO();
        bookingService = new BookingService(bookingDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        // Validate that start date is before end date using strings as a quick check
        // You can remove this if you validate using Date objects
        if (startDateStr.compareTo(endDateStr) >= 0) {
            response.getWriter().write("Error: Start date must be before end date.");
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust format as needed
        Date startDateObj = null;
        Date endDateObj = null;
        try {
            startDateObj = sdf.parse(startDateStr);
            endDateObj = sdf.parse(endDateStr);
        } catch (ParseException e) {
            response.getWriter().write("Invalid date format.");
            return;
        }

        BookingDTO booking = new BookingDTO();
        booking.setUserId(userId);
        booking.setPackageId(packageId);
        booking.setStartDate(startDateObj);
        booking.setEndDate(endDateObj);

        boolean success = bookingService.addBooking(booking);
        response.getWriter().write(success ? "Booking Confirmed Successfully" : "Error Booking Travel Package");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        BookingDTO booking = bookingService.getBookingById(bookingId);

        if (booking != null) {
            response.getWriter().write("Booking Found: Package ID: " + booking.getPackageId() +
                    ", Start Date: " + booking.getStartDate() + ", End Date: " + booking.getEndDate());
        } else {
            response.getWriter().write("Booking Not Found");
        }
    }
}
