<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a User's settings.
    public class UserSettings {
        private int id;
        private String fullName;
        private String email;
        private String phone;
        private boolean emailNotifications;
        private boolean smsNotifications;

        public UserSettings(int id, String fullName, String email, String phone,
                            boolean emailNotifications, boolean smsNotifications) {
            this.id = id;
            this.fullName = fullName;
            this.email = email;
            this.phone = phone;
            this.emailNotifications = emailNotifications;
            this.smsNotifications = smsNotifications;
        }
        public int getId() { return id; }
        public String getFullName() { return fullName; }
        public String getEmail() { return email; }
        public String getPhone() { return phone; }
        public boolean isEmailNotifications() { return emailNotifications; }
        public boolean isSmsNotifications() { return smsNotifications; }
    }
%>

<%
    // Simulate retrieval of user settings.
    // In a production system, the Servlet would retrieve this information from the database.
    UserSettings userSettings = new UserSettings(
          101,
          "John Doe",
          "john.doe@example.com",
          "+1 (555) 987-6543",
          true,   // email notifications enabled
          false   // sms notifications disabled
    );
%>

<!-- Additional CSS for the User Settings Page -->
<style>
  .settings-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Overlap slightly with header */
    position: relative;
    z-index: 2;
  }
  .settings-header {
    text-align: center;
    margin-bottom: 30px;
    color: #2c3e50;
  }
  .settings-header h2 {
    margin-bottom: 10px;
  }
  .section-divider {
    border-top: 1px solid #ddd;
    margin: 30px 0;
  }
  .form-section {
    max-width: 700px;
    margin: 0 auto;
  }
  .form-section h3 {
    color: #27ae60;
    margin-bottom: 15px;
  }
  .form-group {
    margin-bottom: 20px;
  }
  label {
    font-weight: bold;
    color: #444;
  }
  .form-control {
    border-radius: 0;
    box-shadow: none;
    border: 1px solid #ccc;
  }
  .btn-custom {
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 10px 25px;
    transition: background 0.3s ease;
    margin-top: 15px;
  }
  .btn-custom:hover {
    background-color: #1e8449;
  }
</style>

<div class="settings-container container">
  <!-- Header Section -->
  <div class="settings-header">
    <h2>User Settings</h2>
    <p>Manage your personal details, security, and notification preferences.</p>
  </div>
  
  <!-- Personal Information Section -->
  <div class="form-section">
    <h3>Personal Information</h3>
    <form action="<%= request.getContextPath() %>/UpdatePersonalInfoServlet" method="post">
      <input type="hidden" name="userId" value="<%= userSettings.getId() %>">
      <div class="form-group">
        <label for="fullName">Full Name:</label>
        <input type="text" class="form-control" id="fullName" name="fullName" value="<%= userSettings.getFullName() %>" required>
      </div>
      <div class="form-group">
        <label for="email">Email Address:</label>
        <input type="email" class="form-control" id="email" name="email" value="<%= userSettings.getEmail() %>" required>
      </div>
      <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="text" class="form-control" id="phone" name="phone" value="<%= userSettings.getPhone() %>" required>
      </div>
      <button type="submit" class="btn btn-custom">Update Information</button>
    </form>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Change Password Section -->
  <div class="form-section">
    <h3>Change Password</h3>
    <form action="<%= request.getContextPath() %>/ChangePasswordServlet" method="post">
      <input type="hidden" name="userId" value="<%= userSettings.getId() %>">
      <div class="form-group">
        <label for="currentPassword">Current Password:</label>
        <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Enter current password" required>
      </div>
      <div class="form-group">
        <label for="newPassword">New Password:</label>
        <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password" required>
      </div>
      <div class="form-group">
        <label for="confirmPassword">Confirm New Password:</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Re-enter new password" required>
      </div>
      <button type="submit" class="btn btn-custom">Change Password</button>
    </form>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Notification Preferences Section -->
  <div class="form-section">
    <h3>Notification Preferences</h3>
    <form action="<%= request.getContextPath() %>/UpdateNotificationsServlet" method="post">
      <input type="hidden" name="userId" value="<%= userSettings.getId() %>">
      <div class="form-group">
        <label>Email Notifications:</label>
        <select class="form-control" name="emailNotifications" required>
          <option value="true" <%= userSettings.isEmailNotifications() ? "selected" : "" %>>Enabled</option>
          <option value="false" <%= !userSettings.isEmailNotifications() ? "selected" : "" %>>Disabled</option>
        </select>
      </div>
      <div class="form-group">
        <label>SMS Notifications:</label>
        <select class="form-control" name="smsNotifications" required>
          <option value="true" <%= userSettings.isSmsNotifications() ? "selected" : "" %>>Enabled</option>
          <option value="false" <%= !userSettings.isSmsNotifications() ? "selected" : "" %>>Disabled</option>
        </select>
      </div>
      <button type="submit" class="btn btn-custom">Update Preferences</button>
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>
