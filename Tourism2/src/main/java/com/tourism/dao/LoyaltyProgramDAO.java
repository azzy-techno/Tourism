package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.ILoyaltyProgramDAO;
import com.tourism.dto.LoyaltyProgramDTO;
import com.tourism.util.DatabaseConnection;

public class LoyaltyProgramDAO implements ILoyaltyProgramDAO{

    // Method to retrieve loyalty program details by user ID
    public LoyaltyProgramDTO getLoyaltyByUserId(int userId) {
        LoyaltyProgramDTO loyalty = null;
        String query = "SELECT * FROM loyalty_program WHERE user_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                loyalty = new LoyaltyProgramDTO(
                    rs.getInt("loyalty_id"),
                    rs.getInt("user_id"),
                    rs.getInt("points"),
                    rs.getString("membership_tier")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loyalty;
    }

    // Method to update user loyalty points
    public boolean updateLoyaltyPoints(int userId, int points) {
        String query = "UPDATE loyalty_program SET points = points + ? WHERE user_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, points);
            stmt.setInt(2, userId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
