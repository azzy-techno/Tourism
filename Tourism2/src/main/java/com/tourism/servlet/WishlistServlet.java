package com.tourism.servlet;

import com.tourism.dto.WishlistDTO;
import com.tourism.service.WishlistService;
import com.tourism.dao.WishlistDAO;
import com.tourism.dao.interfaces.IWishlistDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WishlistServlet extends HttpServlet {
    private WishlistService wishlistService;

    @Override
    public void init() {
        IWishlistDAO wishlistDAO = new WishlistDAO();
        wishlistService = new WishlistService(wishlistDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int packageId = Integer.parseInt(request.getParameter("packageId"));

        WishlistDTO wishlist = new WishlistDTO();
        wishlist.setUserId(userId);
        wishlist.setPackageId(packageId);

        boolean success = wishlistService.addToWishlist(wishlist);
        response.getWriter().write(success ? "Wishlist Updated Successfully" : "Error Adding to Wishlist");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        WishlistDTO wishlist = wishlistService.getWishlistByUserId(userId);

        if (wishlist != null) {
            response.getWriter().write("Wishlist Found for User ID: " + userId);
        } else {
            response.getWriter().write("Wishlist Not Found");
        }
    }
}
