package com.tourism.dao.interfaces;

import com.tourism.dto.WishlistDTO;

public interface IWishlistDAO {
	WishlistDTO getWishlistByUserId(int userId);
    boolean addToWishlist(WishlistDTO wishlist);
}
