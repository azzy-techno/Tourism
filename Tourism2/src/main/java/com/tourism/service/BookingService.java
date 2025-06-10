package com.tourism.service;

import com.tourism.dao.interfaces.IBookingDAO;
import com.tourism.dao.interfaces.IPackageDAO;
import com.tourism.dto.BookingDTO;
import com.tourism.dto.PackageDTO;

public class BookingService {
    private IBookingDAO bookingDAO;
    private IPackageDAO packageDAO;

    public BookingService(IBookingDAO bookingDAO) {
        this.bookingDAO = bookingDAO;
    }

    public BookingDTO getBookingById(int bookingId) {
        return bookingDAO.getBookingById(bookingId);
    }

    public boolean addBooking(BookingDTO booking) {
        if (booking.getStartDate().after(booking.getEndDate())) {
            throw new IllegalArgumentException("Start date must be before end date.");
        }

        PackageDTO travelPackage = packageDAO.getPackageById(booking.getPackageId());
        if (travelPackage == null) {
            throw new IllegalArgumentException("Selected package does not exist.");
        }

        return bookingDAO.addBooking(booking);
    }

}
