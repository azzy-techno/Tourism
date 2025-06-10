package com.tourism.service;

import com.tourism.dao.interfaces.IReviewDAO;
import com.tourism.dto.ReviewDTO;

public class ReviewService {
    private IReviewDAO reviewDAO;

    public ReviewService(IReviewDAO reviewDAO) {
        this.reviewDAO = reviewDAO;
    }

    public ReviewDTO getReviewById(int reviewId) {
        return reviewDAO.getReviewById(reviewId);
    }

    public boolean addReview(ReviewDTO review) {
        ReviewDTO existingReview = reviewDAO.getReviewById(review.getReviewId());
        if (existingReview != null) {
            throw new IllegalArgumentException("User has already reviewed this package.");
        }

        if (review.getRating() < 1 || review.getRating() > 5) {
            throw new IllegalArgumentException("Rating must be between 1 and 5.");
        }

        return reviewDAO.addReview(review);
    }

}
