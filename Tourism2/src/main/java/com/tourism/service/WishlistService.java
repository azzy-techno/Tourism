package com.tourism.service;

import com.tourism.dao.interfaces.IWishlistDAO;
import com.tourism.dto.WishlistDTO;

public class WishlistService {
    private IWishlistDAO wishlistDAO;

    public WishlistService(IWishlistDAO wishlistDAO) {
        this.wishlistDAO = wishlistDAO;
    }

    public WishlistDTO getWishlistByUserId(int userId) {
        return wishlistDAO.getWishlistByUserId(userId);
    }

    public boolean addToWishlist(WishlistDTO wishlist) {
        // Business logic validation before inserting into DB
        return wishlistDAO.addToWishlist(wishlist);
    }
}
