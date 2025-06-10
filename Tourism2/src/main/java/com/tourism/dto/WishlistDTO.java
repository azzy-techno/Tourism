package com.tourism.dto;

import java.sql.Timestamp;

public class WishlistDTO {
    private int wishlistId;
    private int userId;
    private int packageId;
    private Timestamp addedDate;

    // Default constructor
    public WishlistDTO() {
    }

    // Parameterized constructor
    public WishlistDTO(int wishlistId, int userId, int packageId, Timestamp addedDate) {
        this.wishlistId = wishlistId;
        this.userId = userId;
        this.packageId = packageId;
        this.addedDate = addedDate;
    }

    // Getters and setters
    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
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

    public Timestamp getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Timestamp addedDate) {
        this.addedDate = addedDate;
    }
}
