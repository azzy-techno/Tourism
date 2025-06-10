<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Contact Message from a user.
    public class ContactMessage {
        private int id;
        private String userName;
        private String userEmail;
        private String subject;
        private String message;
        private String receivedDate;

        public ContactMessage(int id, String userName, String userEmail, String subject, String message, String receivedDate) {
            this.id = id;
            this.userName = userName;
            this.userEmail = userEmail;
            this.subject = subject;
            this.message = message;
            this.receivedDate = receivedDate;
        }
        public int getId() { return id; }
        public String getUserName() { return userName; }
        public String getUserEmail() { return userEmail; }
        public String getSubject() { return subject; }
        public String getMessage() { return message; }
        public String getReceivedDate() { return receivedDate; }
    }
%>

<%
    // Simulate retrieval of admin messages.
    ContactMessage[] messages = new ContactMessage[3];
    messages[0] = new ContactMessage(1, "Alice Johnson", "alice.j@example.com", "Inquiry About Tour Packages", 
                      "Hi, I would like more details on your adventure tour packages. Please send me the itinerary and pricing.", "2025-06-12");
    messages[1] = new ContactMessage(2, "Robert Smith", "robert.smith@example.com", "Feedback on Recent Trip", 
                      "I recently booked a tour and wanted to say it exceeded my expectations. Keep up the great work!", "2025-06-15");
    messages[2] = new ContactMessage(3, "Emily Davis", "emily.d@example.com", "Issue With Payment", 
                      "I experienced an issue while processing my payment. Kindly look into this matter at the earliest convenience.", "2025-06-18");
%>

<!-- Additional CSS Styles for the Admin Messages Page -->
<style>
  .admin-messages-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Slight overlap with header */
    position: relative;
    z-index: 2;
  }
  .admin-messages-header {
    text-align: center;
    margin-bottom: 30px;
  }
  .admin-messages-header h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .admin-messages-header p {
    color: #555;
    font-size: 1.1rem;
  }
  .messages-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
  }
  .messages-table th, .messages-table td {
    border: 1px solid #ddd;
    padding: 12px 10px;
    text-align: center;
  }
  .messages-table th {
    background-color: #27ae60;
    color: #fff;
  }
  .action-buttons a {
    display: inline-block;
    margin: 0 3px;
    padding: 6px 12px;
    font-size: 0.9rem;
    text-decoration: none;
    color: #fff;
    border-radius: 4px;
    transition: background 0.3s ease;
  }
  .action-buttons .reply {
    background-color: #3498db;
  }
  .action-buttons .reply:hover {
    background-color: #2980b9;
  }
  .action-buttons .delete {
    background-color: #e74c3c;
  }
  .action-buttons .delete:hover {
    background-color: #c0392b;
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
    .messages-table, .admin-messages-container {
      font-size: 0.9rem;
    }
  }
</style>

<div class="admin-messages-container container">
  <!-- Header Section -->
  <div class="admin-messages-header">
    <h2>Contact Messages</h2>
    <p>View and respond to the latest messages from our users.</p>
  </div>
  
  <!-- Messages Table -->
  <div class="table-responsive">
    <table class="messages-table table table-striped">
      <tr>
        <th>ID</th>
        <th>User Name</th>
        <th>Email</th>
        <th>Subject</th>
        <th>Message</th>
        <th>Received Date</th>
        <th>Actions</th>
      </tr>
      <%
         for (int i = 0; i < messages.length; i++) {
             ContactMessage msg = messages[i];
      %>
      <tr>
        <td><%= msg.getId() %></td>
        <td><%= msg.getUserName() %></td>
        <td><%= msg.getUserEmail() %></td>
        <td><%= msg.getSubject() %></td>
        <td><%= msg.getMessage() %></td>
        <td><%= msg.getReceivedDate() %></td>
        <td class="action-buttons">
          <a href="replyMessage.jsp?id=<%= msg.getId() %>" class="reply">Reply</a>
          <a href="DeleteMessageServlet?id=<%= msg.getId() %>" class="delete">Delete</a>
        </td>
      </tr>
      <%
         }
      %>
    </table>
  </div>
  
  <!-- Back Button -->
  <div class="back-button">
    <a href="admin-dashboard.jsp">← Back to Dashboard</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
