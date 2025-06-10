<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a loyalty transaction record.
    public class LoyaltyTransaction {
        private int id;
        private String transactionDate;
        private String description;
        private int pointsChanged; // positive for earned, negative for redeemed

        public LoyaltyTransaction(int id, String transactionDate, String description, int pointsChanged) {
            this.id = id;
            this.transactionDate = transactionDate;
            this.description = description;
            this.pointsChanged = pointsChanged;
        }
        public int getId() { return id; }
        public String getTransactionDate() { return transactionDate; }
        public String getDescription() { return description; }
        public int getPointsChanged() { return pointsChanged; }
    }
%>

<%
    // Simulate a user's current loyalty details.
    int currentPoints = 850;
    String membershipRank = "Silver Member";
    
    // Sample loyalty transaction history.
    LoyaltyTransaction[] transactions = new LoyaltyTransaction[3];
    transactions[0] = new LoyaltyTransaction(1, "2025-05-01", "Earned from booking #123", 200);
    transactions[1] = new LoyaltyTransaction(2, "2025-05-15", "Redeemed on discount coupon", -100);
    transactions[2] = new LoyaltyTransaction(3, "2025-06-05", "Earned from referral bonus", 150);
%>

<!-- Additional CSS Styles for Loyalty Program Page -->
<style>
  .loyalty-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px;
    position: relative;
    z-index: 2;
  }
  .loyalty-header {
    text-align: center;
    margin-bottom: 30px;
    color: #2c3e50;
  }
  .loyalty-summary {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 30px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  }
  .loyalty-summary h3 {
    margin-bottom: 10px;
    color: #27ae60;
  }
  .loyalty-summary p {
    font-size: 1.2rem;
    color: #555;
  }
  .transactions-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
  }
  .transactions-table th, .transactions-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
  }
  .transactions-table th {
    background-color: #27ae60;
    color: #fff;
  }
  .redeem-section {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #eafaf1;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    text-align: center;
  }
  .redeem-section h4 {
    color: #27ae60;
    margin-bottom: 15px;
  }
  .redeem-section .form-group {
    margin-bottom: 15px;
  }
  .redeem-section .form-control {
    border-radius: 0;
    border: 1px solid #ccc;
    box-shadow: none;
  }
  .redeem-section .btn-custom {
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 10px 20px;
    transition: background 0.3s ease;
    margin-top: 10px;
  }
  .redeem-section .btn-custom:hover {
    background-color: #1e8449;
  }
  .back-button {
    text-align: center;
    margin-top: 20px;
  }
  .back-button a {
    padding: 10px 20px;
    background-color: #27ae60;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    transition: background 0.3s ease;
  }
  .back-button a:hover {
    background-color: #1e8449;
  }
</style>

<div class="loyalty-container container">
  <!-- Loyalty Program Header -->
  <div class="loyalty-header">
    <h2>Loyalty Program & Rewards</h2>
    <p>Earn points, redeem rewards, and enjoy exclusive benefits!</p>
  </div>
  
  <!-- Summary Section -->
  <div class="loyalty-summary">
    <h3>Current Points: <%= currentPoints %></h3>
    <p>Status: <%= membershipRank %></p>
  </div>
  
  <!-- Loyalty Transaction History -->
  <h4 class="text-center" style="color:#27ae60; margin-bottom:20px;">Transaction History</h4>
  <div class="table-responsive">
    <table class="transactions-table table table-striped">
      <tr>
        <th>ID</th>
        <th>Date</th>
        <th>Description</th>
        <th>Points Change</th>
      </tr>
      <%
         for(int i = 0; i < transactions.length; i++){
             LoyaltyTransaction trans = transactions[i];
      %>
      <tr>
        <td><%= trans.getId() %></td>
        <td><%= trans.getTransactionDate() %></td>
        <td><%= trans.getDescription() %></td>
        <td>
          <% if(trans.getPointsChanged() >= 0) { %>
            +<%= trans.getPointsChanged() %>
          <% } else { %>
            <%= trans.getPointsChanged() %>
          <% } %>
        </td>
      </tr>
      <%
         }
      %>
    </table>
  </div>
  
  <!-- Redeem Points Section -->
  <div class="redeem-section">
    <h4>Redeem Your Points</h4>
    <form action="<%= request.getContextPath() %>/LoyaltyServlet" method="post">
      <div class="form-group">
        <label for="redeemPoints">Points to Redeem:</label>
        <input type="number" class="form-control" id="redeemPoints" name="redeemPoints" placeholder="Enter points" required>
      </div>
      <div class="form-group">
        <label for="rewardOption">Reward Option:</label>
        <select class="form-control" id="rewardOption" name="rewardOption" required>
          <option value="">Select a Reward</option>
          <option value="discount">Discount Coupon</option>
          <option value="freeTour">Free Tour Upgrade</option>
          <option value="gift">Gift Voucher</option>
        </select>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-custom">Redeem Now</button>
      </div>
    </form>
  </div>
  
  <!-- Back to Dashboard Button -->
  <div class="back-button">
    <a href="user-dashboard.jsp">← Back to Dashboard</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
