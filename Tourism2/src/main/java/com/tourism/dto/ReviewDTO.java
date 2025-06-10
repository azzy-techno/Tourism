package com.tourism.dto;

import java.sql.Timestamp;

public class ReviewDTO {
    private int reviewId;
    private int userId;
    private int packageId;
    private int rating;
    private String reviewText;
    private Timestamp createdAt;

    // Default constructor
    public ReviewDTO() {
    }

    // Parameterized constructor matching the DAO usage
    public ReviewDTO(int reviewId, int userId, int packageId, int rating, String reviewText, Timestamp createdAt) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.packageId = packageId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.createdAt = createdAt;
    }

    // Getters and Setters

    public int getReviewId() {
        return reviewId;
    }
    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPackageId() {
        return packageId;
    }
    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }
    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
