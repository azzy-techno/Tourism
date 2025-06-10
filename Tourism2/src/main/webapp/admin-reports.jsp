<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a summary metric.
    public class ReportMetric {
        private String title;
        private double value;
        public ReportMetric(String title, double value) {
            this.title = title;
            this.value = value;
        }
        public String getTitle() { return title; }
        public double getValue() { return value; }
    }
    
    // Inner class representing a Transaction detail for reports.
    public class TransactionDetail {
        private int id;
        private String date;
        private String userName;
        private double amount;
        private String status;
        
        public TransactionDetail(int id, String date, String userName, double amount, String status) {
            this.id = id;
            this.date = date;
            this.userName = userName;
            this.amount = amount;
            this.status = status;
        }
        public int getId() { return id; }
        public String getDate() { return date; }
        public String getUserName() { return userName; }
        public double getAmount() { return amount; }
        public String getStatus() { return status; }
    }
%>

<%
    // Simulated summary metrics.
    ReportMetric[] metrics = new ReportMetric[3];
    metrics[0] = new ReportMetric("Total Revenue ($)", 15230.75);
    metrics[1] = new ReportMetric("Total Bookings", 124);
    metrics[2] = new ReportMetric("New Users This Month", 58);

    // Simulated recent transactions list.
    TransactionDetail[] transactions = new TransactionDetail[3];
    transactions[0] = new TransactionDetail(1001, "2025-06-10", "John Doe", 299.99, "Paid");
    transactions[1] = new TransactionDetail(1002, "2025-06-12", "Alice Johnson", 149.99, "Pending");
    transactions[2] = new TransactionDetail(1003, "2025-06-15", "Bob Smith", 499.00, "Paid");
%>

<!-- Additional CSS Styles for the Admin Reports Page -->
<style>
  .reports-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px;  /* Overlap with header */
    position: relative;
    z-index: 2;
  }
  .reports-header {
    text-align: center;
    margin-bottom: 30px;
    color: #2c3e50;
  }
  .reports-header h2 {
    font-size: 2.5rem;
    margin-bottom: 10px;
  }
  .metrics-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 40px;
  }
  .metric-box {
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    margin: 10px;
    padding: 20px;
    flex: 1 1 250px;
    text-align: center;
  }
  .metric-box h4 {
    color: #27ae60;
    margin-bottom: 5px;
  }
  .metric-box p {
    font-size: 1.5rem;
    font-weight: bold;
    color: #444;
  }
  .transactions-section {
    margin-bottom: 40px;
  }
  .transactions-section h3 {
    color: #27ae60;
    margin-bottom: 15px;
    text-align: center;
  }
  .transactions-table {
    width: 100%;
    border-collapse: collapse;
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
  .download-reports {
    text-align: center;
    margin-bottom: 40px;
  }
  .download-reports a {
    display: inline-block;
    padding: 10px 25px;
    background-color: #27ae60;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    transition: background 0.3s ease;
  }
  .download-reports a:hover {
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
  @media (max-width: 768px) {
    .metrics-container {
      flex-direction: column;
      align-items: center;
    }
  }
</style>

<div class="reports-container container">
  <!-- Header Section -->
  <div class="reports-header">
    <h2>Admin Reports Dashboard</h2>
    <p>Overview of key performance metrics and recent transactions.</p>
  </div>
  
  <!-- Metrics Summary Section -->
  <div class="metrics-container">
    <%
       for(int i = 0; i < metrics.length; i++) {
           ReportMetric metric = metrics[i];
    %>
      <div class="metric-box">
        <h4><%= metric.getTitle() %></h4>
        <p><%= metric.getValue() %></p>
      </div>
    <%
       }
    %>
  </div>
  
  <!-- Recent Transactions Section -->
  <div class="transactions-section">
    <h3>Recent Transactions</h3>
    <div class="table-responsive">
      <table class="transactions-table table table-striped">
        <tr>
          <th>ID</th>
          <th>Date</th>
          <th>User Name</th>
          <th>Amount ($)</th>
          <th>Status</th>
        </tr>
        <%
            for(int j = 0; j < transactions.length; j++) {
                TransactionDetail trans = transactions[j];
        %>
        <tr>
          <td><%= trans.getId() %></td>
          <td><%= trans.getDate() %></td>
          <td><%= trans.getUserName() %></td>
          <td><%= trans.getAmount() %></td>
          <td><%= trans.getStatus() %></td>
        </tr>
        <%
            }
        %>
      </table>
    </div>
  </div>
  
  <!-- Download Reports Section -->
  <div class="download-reports">
    <a href="<%= request.getContextPath() %>/DownloadReportServlet?type=monthly">Download Monthly Report</a>
    &nbsp;&nbsp;
    <a href="<%= request.getContextPath() %>/DownloadReportServlet?type=annual">Download Annual Report</a>
  </div>
  
  <!-- Back Button -->
  <div class="back-button">
    <a href="admin-dashboard.jsp">← Back to Admin Dashboard</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
