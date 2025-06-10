package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IDestinationDAO;
import com.tourism.dto.DestinationDTO;
import com.tourism.util.DatabaseConnection;

public class DestinationDAO implements IDestinationDAO {

    // Method to retrieve destination by ID
    public DestinationDTO getDestinationById(int destinationId) {
        DestinationDTO destination = null;
        String query = "SELECT * FROM destinations WHERE destination_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setInt(1, destinationId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                destination = new DestinationDTO(
                    rs.getInt("destination_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("image_url"),
                    rs.getString("location")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destination;
    }

    // Method to add a new destination
    public boolean addDestination(DestinationDTO destination) {
        String query = "INSERT INTO destinations (name, description, image_url, location) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setString(1, destination.getName());
            stmt.setString(2, destination.getDescription());
            stmt.setString(3, destination.getImageUrl());
            stmt.setString(4, destination.getLocation());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
