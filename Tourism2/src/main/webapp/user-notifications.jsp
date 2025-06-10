<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Notification.
    public class Notification {
        private int id;
        private String title;
        private String message;
        private String notificationDate;
        
        public Notification(int id, String title, String message, String notificationDate) {
            this.id = id;
            this.title = title;
            this.message = message;
            this.notificationDate = notificationDate;
        }
        public int getId() { return id; }
        public String getTitle() { return title; }
        public String getMessage() { return message; }
        public String getNotificationDate() { return notificationDate; }
    }
%>

<%
    // Simulate a list of notifications.
    Notification[] notifications = new Notification[3];
    notifications[0] = new Notification(1, "Welcome Bonus", "You have earned 100 bonus points upon signing up!", "2025-06-01");
    notifications[1] = new Notification(2, "New Destination Added", "Check out our newly added destination: Mountain Retreat.", "2025-06-10");
    notifications[2] = new Notification(3, "Upcoming Tour", "Your scheduled tour for Tropical Paradise is coming up soon.", "2025-06-15");
%>

<!-- Additional CSS for User Notifications Page -->
<style>
  .notifications-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Overlap with header for visual integration */
    position: relative;
    z-index: 2;
    min-height: calc(100vh - 80px);
  }
  .notifications-header {
    text-align: center;
    margin-bottom: 30px;
  }
  .notifications-header h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .notifications-header p {
    color: #555;
    font-size: 1.1rem;
  }
  .notification-list {
    list-style: none;
    padding: 0;
  }
  .notification-item {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    background-color: #fff;
    transition: transform 0.3s ease;
  }
  .notification-item:hover {
    transform: translateY(-3px);
  }
  .notification-title {
    color: #27ae60;
    font-weight: bold;
    margin-bottom: 10px;
  }
  .notification-date {
    color: #999;
    font-size: 0.9rem;
    margin-bottom: 15px;
  }
  .notification-message {
    color: #555;
    line-height: 1.6;
  }
  .back-button {
    text-align: center;
    margin-top: 30px;
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

<div class="notifications-container container">
  <!-- Header Section -->
  <div class="notifications-header">
    <h2>Your Notifications</h2>
    <p>Stay updated on recent events and promotions.</p>
  </div>
  
  <!-- Notification List -->
  <ul class="notification-list">
    <%
      for (int i = 0; i < notifications.length; i++) {
          Notification note = notifications[i];
    %>
      <li class="notification-item">
        <div class="notification-title"><%= note.getTitle() %></div>
        <div class="notification-date">Date: <%= note.getNotificationDate() %></div>
        <div class="notification-message"><%= note.getMessage() %></div>
      </li>
    <%
      }
    %>
  </ul>
  
  <!-- Back Button -->
  <div class="back-button">
    <a href="user-dashboard.jsp">← Back to Dashboard</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
