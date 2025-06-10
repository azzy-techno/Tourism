package com.tourism.dao.interfaces;

import com.tourism.dto.ReviewDTO;

public interface IReviewDAO {
	 ReviewDTO getReviewById(int reviewId);
	 boolean addReview(ReviewDTO review);
}
