package com.tourism.dao.interfaces;

import com.tourism.dto.BookingDTO;

public interface IBookingDAO {
	BookingDTO getBookingById(int bookingId);
    boolean addBooking(BookingDTO booking);
}
