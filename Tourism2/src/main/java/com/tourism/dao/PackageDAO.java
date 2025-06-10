package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IPackageDAO;
import com.tourism.dto.PackageDTO;
import com.tourism.util.DatabaseConnection;

public class PackageDAO implements IPackageDAO {

    // Method to retrieve package by ID
    public PackageDTO getPackageById(int packageId) {
        PackageDTO travelPackage = null;
        String query = "SELECT * FROM packages WHERE package_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setInt(1, packageId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                travelPackage = new PackageDTO(
                    rs.getInt("package_id"),
                    rs.getString("name"),
                    rs.getInt("destination_id"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("duration_days"),
                    rs.getString("image_url")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return travelPackage;
    }

    // Method to add a new package
    public boolean addPackage(PackageDTO travelPackage) {
        String query = "INSERT INTO packages (name, destination_id, description, price, duration_days, image_url) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setString(1, travelPackage.getName());
            stmt.setInt(2, travelPackage.getDestinationId());
            stmt.setString(3, travelPackage.getDescription());
            stmt.setDouble(4, travelPackage.getPrice());
            stmt.setInt(5, travelPackage.getDurationDays());
            stmt.setString(6, travelPackage.getImageUrl());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
