package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IUserNotificationDAO;
import com.tourism.dto.UserNotificationDTO;
import com.tourism.util.DatabaseConnection;
import java.util.Date;

public class UserNotificationDAO implements IUserNotificationDAO{

    // Method to retrieve notifications for a user
    public UserNotificationDTO getNotificationByUserId(int userId) {
        UserNotificationDTO notification = null;
        String query = "SELECT * FROM user_notifications WHERE user_id = ? ORDER BY sent_date DESC";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                notification = new UserNotificationDTO(
                    rs.getInt("notification_id"),
                    rs.getInt("user_id"),
                    rs.getString("message"),
                    rs.getTimestamp("sent_date"),
                    rs.getBoolean("is_read")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notification;
    }

    // Method to add a new notification
    public boolean addNotification(UserNotificationDTO notification) {
        String query = "INSERT INTO user_notifications (user_id, message, sent_date, is_read) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, notification.getUserId());
            stmt.setString(2, notification.getMessage());
            stmt.setTimestamp(3, new java.sql.Timestamp(new Date().getTime()));
            stmt.setBoolean(4, notification.isRead());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
