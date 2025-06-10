package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.tourism.dao.interfaces.IBookingDAO;
import com.tourism.dto.BookingDTO;
import com.tourism.util.DatabaseConnection;

public class BookingDAO implements IBookingDAO {

    // Method to retrieve booking by ID
    public BookingDTO getBookingById(int bookingId) {
        BookingDTO booking = null;
        String query = "SELECT * FROM bookings WHERE booking_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                booking = new BookingDTO(
                    rs.getInt("booking_id"),
                    rs.getInt("user_id"),
                    rs.getInt("package_id"),
                    rs.getTimestamp("booking_date"),
                    rs.getString("status"),
                    rs.getString("payment_status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }

    // Method to add a new booking
    public boolean addBooking(BookingDTO booking) {
        String query = "INSERT INTO bookings (user_id, package_id, booking_date, status, payment_status) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getPackageId());
            stmt.setTimestamp(3, new java.sql.Timestamp(new Date().getTime()));
            stmt.setString(4, booking.getStatus());
            stmt.setString(5, booking.getPaymentStatus());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
