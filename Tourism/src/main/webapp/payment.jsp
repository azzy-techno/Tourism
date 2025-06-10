<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Payment record.
    public class Payment {
        private int id;
        private String cardHolderName;
        private String cardType;
        private String lastFourDigits;
        private String expirationDate;
        private double amount;
        private String paymentDate;
        
        public Payment(int id, String cardHolderName, String cardType, String lastFourDigits, String expirationDate, double amount, String paymentDate) {
            this.id = id;
            this.cardHolderName = cardHolderName;
            this.cardType = cardType;
            this.lastFourDigits = lastFourDigits;
            this.expirationDate = expirationDate;
            this.amount = amount;
            this.paymentDate = paymentDate;
        }
        public int getId() { return id; }
        public String getCardHolderName() { return cardHolderName; }
        public String getCardType() { return cardType; }
        public String getLastFourDigits() { return lastFourDigits; }
        public String getExpirationDate() { return expirationDate; }
        public double getAmount() { return amount; }
        public String getPaymentDate() { return paymentDate; }
    }
%>

<%
    // Simulate retrieval of payment history.
    Payment[] payments = new Payment[2];
    payments[0] = new Payment(1, "John Doe", "Visa", "1234", "12/25", 299.99, "2025-06-10");
    payments[1] = new Payment(2, "John Doe", "MasterCard", "5678", "11/24", 149.99, "2025-05-28");
%>

<!-- CSS Styles for the Payment Page -->
<style>
  .payment-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Overlaps slightly with the header for visual integration */
    position: relative;
    z-index: 2;
  }
  .payment-title {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
  }
  .payment-history {
    margin-bottom: 30px;
    overflow-x: auto;
  }
  .payment-history table {
    width: 100%;
    border-collapse: collapse;
  }
  .payment-history th,
  .payment-history td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
  }
  .payment-history th {
    background-color: #27ae60;
    color: #fff;
  }
  .add-payment {
    max-width: 600px;
    margin: 0 auto 30px;
  }
  .add-payment h4 {
    text-align: center;
    color: #27ae60;
    margin-bottom: 15px;
  }
  .add-payment .form-group {
    margin-bottom: 15px;
  }
  .add-payment .form-control {
    border-radius: 0;
    box-shadow: none;
    border: 1px solid #ccc;
  }
  .add-payment .btn-custom {
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 10px 20px;
    transition: background 0.3s ease;
    display: block;
    margin: 0 auto;
  }
  .add-payment .btn-custom:hover {
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
  /* Guarantee responsiveness for heavy content */
  @media (max-width: 768px) {
    .payment-history table, 
    .add-payment {
      width: 100%;
    }
  }
</style>

<div class="payment-container container">
  <!-- Payment History Section -->
  <h2 class="payment-title">Payment History</h2>
  <div class="payment-history">
    <table class="table table-striped">
      <tr>
        <th>ID</th>
        <th>Card Holder</th>
        <th>Card Type</th>
        <th>Last 4 Digits</th>
        <th>Expiration</th>
        <th>Amount ($)</th>
        <th>Payment Date</th>
      </tr>
      <%
         for (int i = 0; i < payments.length; i++) {
             Payment p = payments[i];
      %>
      <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getCardHolderName() %></td>
        <td><%= p.getCardType() %></td>
        <td><%= p.getLastFourDigits() %></td>
        <td><%= p.getExpirationDate() %></td>
        <td><%= p.getAmount() %></td>
        <td><%= p.getPaymentDate() %></td>
      </tr>
      <%
         }
      %>
    </table>
  </div>
  
  <div class="section-divider" style="border-top:1px solid #ddd; margin:30px 0;"></div>
  
  <!-- Add Payment Form Section -->
  <div class="add-payment">
    <h4>Add New Payment</h4>
    <form action="<%= request.getContextPath() %>/PaymentServlet" method="post">
      <div class="form-group">
        <label for="cardHolderName">Card Holder Name:</label>
        <input type="text" class="form-control" id="cardHolderName" name="cardHolderName" placeholder="Enter card holder name" required>
      </div>
      <div class="form-group">
        <label for="cardType">Card Type:</label>
        <select class="form-control" id="cardType" name="cardType" required>
          <option value="">Select Card Type</option>
          <option value="Visa">Visa</option>
          <option value="MasterCard">MasterCard</option>
          <option value="American Express">American Express</option>
        </select>
      </div>
      <div class="form-group">
        <label for="cardNumber">Card Number (Last 4 Digits):</label>
        <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="e.g. 1234" maxlength="4" required>
      </div>
      <div class="form-group">
        <label for="expirationDate">Expiration Date (MM/YY):</label>
        <input type="text" class="form-control" id="expirationDate" name="expirationDate" placeholder="e.g. 12/25" required>
      </div>
      <div class="form-group">
        <label for="amount">Amount ($):</label>
        <input type="number" step="0.01" class="form-control" id="amount" name="amount" placeholder="Enter payment amount" required>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-custom">Submit Payment</button>
      </div>
    </form>
  </div>
  
  <!-- Navigation Back Button -->
  <div class="back-button">
    <a href="user-dashboard.jsp">← Back to Dashboard</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
