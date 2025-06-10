package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IContactMessageDAO;
import com.tourism.dto.ContactMessageDTO;
import com.tourism.util.DatabaseConnection;
import java.util.Date;

public class ContactMessageDAO implements IContactMessageDAO{

    // Method to retrieve contact message by ID
    public ContactMessageDTO getMessageById(int messageId) {
        ContactMessageDTO message = null;
        String query = "SELECT * FROM contact_messages WHERE message_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, messageId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                message = new ContactMessageDTO(
                    rs.getInt("message_id"),
                    rs.getInt("user_id"),
                    rs.getString("subject"),
                    rs.getString("message"),
                    rs.getString("status"),
                    rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return message;
    }

    // Method to add a new contact message
    public boolean addMessage(ContactMessageDTO message) {
        String query = "INSERT INTO contact_messages (user_id, subject, message, status, created_at) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, message.getUserId());
            stmt.setString(2, message.getSubject());
            stmt.setString(3, message.getMessage());
            stmt.setString(4, message.getStatus());
            stmt.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
