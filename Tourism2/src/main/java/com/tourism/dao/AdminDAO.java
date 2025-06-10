package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IAdminDAO;
import com.tourism.dto.AdminDTO;
import com.tourism.util.DatabaseConnection;

public class AdminDAO implements IAdminDAO{

    // Method to retrieve admin by ID
    public AdminDTO getAdminById(int adminId) {
        AdminDTO admin = null;
        String query = "SELECT * FROM admins WHERE admin_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setInt(1, adminId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                admin = new AdminDTO(
                    rs.getInt("admin_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    // Method to add a new admin
    public boolean addAdmin(AdminDTO admin) {
        String query = "INSERT INTO admins (name, email, role) VALUES (?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setString(1, admin.getName());
            stmt.setString(2, admin.getEmail());
            stmt.setString(3, admin.getRole());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public AdminDTO authenticateAdmin(String email, String password) {
        AdminDTO admin = null;
        String query = "SELECT * FROM admins WHERE email = ? AND password = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
             
            stmt.setString(1, email);
            stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                admin = new AdminDTO(
                    rs.getInt("admin_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
