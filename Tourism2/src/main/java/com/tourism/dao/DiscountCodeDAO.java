package com.tourism.dao;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IDiscountCodeDAO;
import com.tourism.dto.DiscountCodeDTO;
import com.tourism.util.DatabaseConnection;

public class DiscountCodeDAO implements IDiscountCodeDAO{

    // Method to retrieve discount code by ID
    public DiscountCodeDTO getDiscountById(int discountId) {
        DiscountCodeDTO discountCode = null;
        String query = "SELECT * FROM discount_codes WHERE discount_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, discountId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                discountCode = new DiscountCodeDTO(
                    rs.getInt("discount_id"),
                    rs.getString("code"),
                    rs.getDouble("discount_percentage"),
                    rs.getDate("valid_from"),
                    rs.getDate("valid_until"),
                    rs.getBoolean("is_active")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return discountCode;
    }

    // Method to add a new discount code
    public boolean addDiscountCode(DiscountCodeDTO discountCode) {
        String query = "INSERT INTO discount_codes (code, discount_percentage, valid_from, valid_until, is_active) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setString(1, discountCode.getCode());
            stmt.setDouble(2, discountCode.getDiscountPercentage());
            stmt.setDate(3, new java.sql.Date(discountCode.getValidFrom().getTime()));
            stmt.setDate(4, new java.sql.Date(discountCode.getValidUntil().getTime()));
            stmt.setBoolean(5, discountCode.isActive());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
