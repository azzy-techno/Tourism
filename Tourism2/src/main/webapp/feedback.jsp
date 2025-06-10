<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Feedback message.
    public class Feedback {
        private int id;
        private String userName;
        private String comment;
        private String feedbackDate;
        private int rating; // Assume rating out of 5

        public Feedback(int id, String userName, String comment, String feedbackDate, int rating) {
            this.id = id;
            this.userName = userName;
            this.comment = comment;
            this.feedbackDate = feedbackDate;
            this.rating = rating;
        }
        public int getId() { return id; }
        public String getUserName() { return userName; }
        public String getComment() { return comment; }
        public String getFeedbackDate() { return feedbackDate; }
        public int getRating() { return rating; }
    }
%>

<%
    // Simulate retrieval of feedback data.
    Feedback[] feedbacks = new Feedback[3];
    feedbacks[0] = new Feedback(1, "Alice Johnson", "The tour experience was absolutely amazing! Highly recommended.", "2025-06-12", 5);
    feedbacks[1] = new Feedback(2, "Mark Miller", "Overall, a good experience but could improve in organization.", "2025-06-15", 4);
    feedbacks[2] = new Feedback(3, "Samantha Lee", "I found the itinerary a bit rushed. Some extra free time would be appreciated.", "2025-06-18", 3);
%>

<!-- Additional CSS Styles for the Feedback Page -->
<style>
  .feedback-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Overlap with header for visual integration */
    position: relative;
    z-index: 2;
    min-height: calc(100vh - 80px);
  }
  .feedback-header {
    text-align: center;
    margin-bottom: 30px;
  }
  .feedback-header h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .feedback-header p {
    color: #555;
    font-size: 1.1rem;
  }
  .feedback-list {
    list-style: none;
    padding: 0;
    margin-bottom: 40px;
  }
  .feedback-item {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    background-color: #fff;
    transition: transform 0.3s ease;
  }
  .feedback-item:hover {
    transform: translateY(-3px);
  }
  .feedback-title {
    font-weight: bold;
    color: #27ae60;
    margin-bottom: 10px;
  }
  .feedback-date {
    color: #999;
    font-size: 0.9rem;
    margin-bottom: 15px;
  }
  .rating span {
    color: #f1c40f;
    font-size: 1.1rem;
    margin-right: 2px;
  }
  /* Feedback Form Styles */
  .feedback-form {
    max-width: 600px;
    margin: 0 auto 30px;
  }
  .feedback-form h4 {
    text-align: center;
    color: #27ae60;
    margin-bottom: 15px;
  }
  .feedback-form .form-group {
    margin-bottom: 15px;
  }
  .feedback-form label {
    font-weight: bold;
    color: #444;
  }
  .feedback-form .form-control {
    border-radius: 0;
    border: 1px solid #ccc;
    box-shadow: none;
  }
  .feedback-form .btn-custom {
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 10px 20px;
    transition: background 0.3s ease;
    display: block;
    margin: 0 auto;
  }
  .feedback-form .btn-custom:hover {
    background-color: #1e8449;
  }
  .back-button {
    text-align: center;
    margin-top: 20px;
  }
  .back-button a {
    background-color: #27ae60;
    padding: 10px 20px;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    transition: background 0.3s ease;
  }
  .back-button a:hover {
    background-color: #1e8449;
  }
</style>

<div class="feedback-container container">
  <!-- Page Header -->
  <div class="feedback-header">
    <h2>User Feedback</h2>
    <p>See what our travelers have to say, and share your own experience.</p>
  </div>
  
  <!-- Feedback List -->
  <ul class="feedback-list">
    <%
      for (int i = 0; i < feedbacks.length; i++) {
          Feedback fb = feedbacks[i];
    %>
      <li class="feedback-item">
        <div class="feedback-title">
          <%= fb.getUserName() %> says...
        </div>
        <div class="rating">
          Rating:
          <%
            int stars = fb.getRating();
            for (int j = 1; j <= 5; j++) {
              if (j <= stars) {
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
        <div class="feedback-date">Date: <%= fb.getFeedbackDate() %></div>
        <div class="feedback-comment">
          <p><%= fb.getComment() %></p>
        </div>
      </li>
    <%
      }
    %>
  </ul>
  
  <!-- Feedback Submission Form -->
  <div class="feedback-form">
    <h4>Submit Your Feedback</h4>
    <form action="<%= request.getContextPath() %>/SubmitFeedbackServlet" method="post">
      <div class="form-group">
        <label for="userName">Your Name:</label>
        <input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your name" required>
      </div>
      <div class="form-group">
        <label for="rating">Rating (1-5):</label>
        <select class="form-control" id="rating" name="rating" required>
          <option value="">Select Your Rating</option>
          <option value="1">1 - Poor</option>
          <option value="2">2 - Fair</option>
          <option value="3">3 - Good</option>
          <option value="4">4 - Very Good</option>
          <option value="5">5 - Excellent</option>
        </select>
      </div>
      <div class="form-group">
        <label for="comment">Feedback:</label>
        <textarea class="form-control" id="comment" name="comment" rows="5" placeholder="Share your experience..." required></textarea>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-custom">Submit Feedback</button>
      </div>
    </form>
  </div>
  
  <!-- Back Button -->
  <div class="back-button">
    <a href="user-dashboard.jsp">← Back to Dashboard</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
