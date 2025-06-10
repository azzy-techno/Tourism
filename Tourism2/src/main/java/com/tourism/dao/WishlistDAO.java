package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IWishlistDAO;
import com.tourism.dto.WishlistDTO;
import com.tourism.util.DatabaseConnection;

public class WishlistDAO implements IWishlistDAO{

    // Method to retrieve wishlist items by user ID
    public WishlistDTO getWishlistByUserId(int userId) {
        WishlistDTO wishlist = null;
        String query = "SELECT * FROM wishlist WHERE user_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                wishlist = new WishlistDTO(
                    rs.getInt("wishlist_id"),
                    rs.getInt("user_id"),
                    rs.getInt("package_id"),
                    rs.getTimestamp("added_date")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wishlist;
    }

    // Method to add a package to the user's wishlist
    public boolean addToWishlist(WishlistDTO wishlist) {
        String query = "INSERT INTO wishlist (user_id, package_id) VALUES (?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setInt(1, wishlist.getUserId());
            stmt.setInt(2, wishlist.getPackageId());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
