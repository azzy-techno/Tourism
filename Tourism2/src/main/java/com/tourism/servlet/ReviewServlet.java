package com.tourism.servlet;

import com.tourism.dto.ReviewDTO;
import com.tourism.service.ReviewService;
import com.tourism.dao.ReviewDAO;
import com.tourism.dao.interfaces.IReviewDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReviewServlet extends HttpServlet {
    private ReviewService reviewService;

    @Override
    public void init() {
        IReviewDAO reviewDAO = new ReviewDAO();
        reviewService = new ReviewService(reviewDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        if (rating < 1 || rating > 5) {
            response.getWriter().write("Error: Rating must be between 1 and 5.");
            return;
        }

        ReviewDTO review = new ReviewDTO();
        review.setUserId(userId);
        review.setPackageId(packageId);
        review.setRating(rating);
        review.setReviewText(comment);

        boolean success = reviewService.addReview(review);
        response.getWriter().write(success ? "Review Added Successfully" : "Error Adding Review");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reviewId = Integer.parseInt(request.getParameter("reviewId"));
        ReviewDTO review = reviewService.getReviewById(reviewId);

        if (review != null) {
            response.getWriter().write("Review Found: Rating - " + review.getRating() + ", Comment - " + review.getReviewText());
        } else {
            response.getWriter().write("Review Not Found");
        }
    }
}
