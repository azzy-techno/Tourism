<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Review with heavy content
    public class Review {
        private int id;
        private String reviewerName;
        private int rating; // Assume rating out of 5
        private String comment;
        private String reviewDate;
        private String reviewTitle;

        public Review(int id, String reviewerName, int rating, String reviewTitle, String comment, String reviewDate) {
            this.id = id;
            this.reviewerName = reviewerName;
            this.rating = rating;
            this.reviewTitle = reviewTitle;
            this.comment = comment;
            this.reviewDate = reviewDate;
        }
        public int getId() { return id; }
        public String getReviewerName() { return reviewerName; }
        public int getRating() { return rating; }
        public String getReviewTitle() { return reviewTitle; }
        public String getComment() { return comment; }
        public String getReviewDate() { return reviewDate; }
    }
%>

<%
    // Get the review id from request parameters (simulate if missing)
    String idStr = request.getParameter("id");
    int reviewId = 0;
    try {
        reviewId = Integer.parseInt(idStr);
    } catch(Exception e) {
        reviewId = 1;
    }
    
    // Simulate review data (in production fetched from database)
    Review review;
    if(reviewId == 1) {
        review = new Review(
            1,
            "Mary Jane",
            4,
            "Memorable Experience!",
            "I had a wonderful time exploring this destination. Every moment was packed with exciting activities and the facilities were top-notch. The only downside was a slight delay at check-in, but overall, an unforgettable trip!",
            "2025-06-15"
        );
    } else if(reviewId == 2) {
        review = new Review(
            2,
            "Peter Parker",
            5,
            "Exceeded Expectations",
            "The tour was well-organized and the guide was exceptionally knowledgeable. I highly recommend this package to anyone looking for an adventure filled with both culture and fun!",
            "2025-07-01"
        );
    } else {
        review = new Review(
            0,
            "Unknown",
            0,
            "Review Not Found",
            "We could not retrieve the review details. Please check the link or return to the reviews list.",
            ""
        );
    }
%>

<!-- Additional CSS Styles for Review Details Page -->
<style>
  .review-details-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Slight overlap with header */
    position: relative;
    z-index: 2;
  }
  .review-title {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 20px;
  }
  .review-header {
    text-align: center;
    margin-bottom: 20px;
  }
  .review-header span {
    color: #27ae60;
    font-weight: bold;
  }
  .rating {
    margin: 10px 0;
  }
  .rating span {
    color: #f1c40f;
    font-size: 1.2rem;
  }
  .review-content {
    margin-top: 20px;
  }
  .review-content p {
    text-align: justify;
    line-height: 1.6;
    color: #555;
  }
  .review-footer {
    text-align: center;
    margin-top: 30px;
  }
  .back-button {
    background-color: #27ae60;
    color: #fff;
    padding: 10px 20px;
    border-radius: 4px;
    text-decoration: none;
    transition: background 0.3s ease;
  }
  .back-button:hover {
    background-color: #1e8449;
  }
</style>

<div class="review-details-container container">
  <!-- Title Section -->
  <h2 class="review-title"><%= review.getReviewTitle() %></h2>
  
  <!-- Review Basic Info -->
  <div class="review-header">
    <p>Reviewed by <span><%= review.getReviewerName() %></span> on <span><%= review.getReviewDate() %></span></p>
    <div class="rating">
      Rating: 
      <%
         int stars = review.getRating();
         for (int i = 1; i <= 5; i++) {
            if(i <= stars) {
      %>
                <span>&#9733;</span>
      <%
            } else {
      %>
                <span>&#9734;</span>
      <%
            }
         }
      %>
    </div>
  </div>
  
  <!-- Review Comment Section -->
  <div class="review-content">
    <p><%= review.getComment() %></p>
  </div>
  
  <!-- Back to Reviews List -->
  <div class="review-footer">
    <a href="reviews.jsp" class="back-button">← Back to Reviews</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
