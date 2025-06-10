package com.tourism.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tourism.dao.interfaces.IReviewDAO;
import com.tourism.dto.ReviewDTO;
import com.tourism.util.DatabaseConnection;
import java.util.Date;

public class ReviewDAO implements IReviewDAO{

    // Method to retrieve a review by ID
    public ReviewDTO getReviewById(int reviewId) {
        ReviewDTO review = null;
        String query = "SELECT * FROM reviews WHERE review_id = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, reviewId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                review = new ReviewDTO(
                    rs.getInt("review_id"),
                    rs.getInt("user_id"),
                    rs.getInt("package_id"),
                    rs.getInt("rating"),
                    rs.getString("review_text"),
                    rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return review;
    }

    // Method to add a new review
    public boolean addReview(ReviewDTO review) {
        String query = "INSERT INTO reviews (user_id, package_id, rating, review_text, created_at) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, review.getUserId());
            stmt.setInt(2, review.getPackageId());
            stmt.setInt(3, review.getRating());
            stmt.setString(4, review.getReviewText());
            stmt.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
