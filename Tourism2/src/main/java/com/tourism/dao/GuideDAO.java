package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IGuideDAO;
import com.tourism.dto.GuideDTO;
import com.tourism.util.DatabaseConnection;

public class GuideDAO implements IGuideDAO{

    // Method to retrieve guide by ID
    public GuideDTO getGuideById(int guideId) {
        GuideDTO guide = null;
        String query = "SELECT * FROM guides WHERE guide_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, guideId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                guide = new GuideDTO(
                    rs.getInt("guide_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("image_url"),
                    rs.getInt("experience_years")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guide;
    }

    // Method to add a new guide
    public boolean addGuide(GuideDTO guide) {
        String query = "INSERT INTO guides (name, email, phone, image_url, experience_years) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setString(1, guide.getName());
            stmt.setString(2, guide.getEmail());
            stmt.setString(3, guide.getPhone());
            stmt.setString(4, guide.getImageUrl());
            stmt.setInt(5, guide.getExperienceYears());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
