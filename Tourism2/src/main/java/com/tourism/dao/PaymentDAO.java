package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IPaymentDAO;
import com.tourism.dto.PaymentDTO;
import com.tourism.util.DatabaseConnection;
import java.util.Date;

public class PaymentDAO implements IPaymentDAO{

    // Method to retrieve payment by ID
    public PaymentDTO getPaymentById(int paymentId) {
        PaymentDTO payment = null;
        String query = "SELECT * FROM payments WHERE payment_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, paymentId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                payment = new PaymentDTO(
                    rs.getInt("payment_id"),
                    rs.getInt("booking_id"),
                    rs.getDouble("amount"),
                    rs.getString("payment_method"),
                    rs.getString("transaction_id"),
                    rs.getTimestamp("payment_date")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    // Method to add a new payment
    public boolean addPayment(PaymentDTO payment) {
        String query = "INSERT INTO payments (booking_id, amount, payment_method, transaction_id, payment_date) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, payment.getBookingId());
            stmt.setDouble(2, payment.getAmount());
            stmt.setString(3, payment.getPaymentMethod());
            stmt.setString(4, payment.getTransactionId());
            stmt.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
