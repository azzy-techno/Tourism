<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
    // Simulate dynamic contact details. In production these details would be fetched from the back end.
    String officeAddress = "123 Tourism Blvd, Dream City, Wonderland";
    String phone = "+1 (555) 123-4567";
    String officeEmail = "info@tourism.com";
    String workingHours = "Mon-Fri: 9 AM - 6 PM, Sat: 10 AM - 4 PM";
%>

<!-- Additional CSS Styles for Contact Page -->
<style>
  .contact-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Slight overlap with header */
    position: relative;
    z-index: 2;
  }
  .contact-header {
    text-align: center;
    margin-bottom: 30px;
  }
  .contact-header h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .contact-info {
    margin-bottom: 30px;
    text-align: center;
    color: #555;
  }
  .contact-info p {
    margin: 5px 0;
    line-height: 1.5;
  }
  .contact-form {
    max-width: 600px;
    margin: 0 auto;
  }
  .contact-form .form-group {
    margin-bottom: 15px;
  }
  .contact-form label {
    font-weight: bold;
    color: #444;
  }
  .contact-form .form-control {
    border-radius: 0;
    box-shadow: none;
    border-color: #ccc;
  }
  .contact-form .btn-custom {
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 10px 20px;
    transition: background 0.3s ease;
  }
  .contact-form .btn-custom:hover {
    background-color: #1e8449;
  }
  .map-container {
    margin-top: 30px;
    text-align: center;
  }
  .section-divider {
    border-top: 1px solid #ddd;
    margin: 30px 0;
  }
</style>

<div class="contact-container container">
  <!-- Header Section -->
  <div class="contact-header">
    <h2>Contact Us</h2>
    <p>We're here to help and answer any questions you may have.</p>
  </div>
  
  <!-- Dynamic Contact Information -->
  <div class="contact-info">
    <p><strong>Office Address:</strong> <%= officeAddress %></p>
    <p><strong>Phone:</strong> <%= phone %></p>
    <p><strong>Email:</strong> <%= officeEmail %></p>
    <p><strong>Working Hours:</strong> <%= workingHours %></p>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Contact Form Section -->
  <div class="contact-form">
    <form action="<%= request.getContextPath() %>/ContactServlet" method="post">
      <div class="form-group">
        <label for="contactName">Your Name:</label>
        <input type="text" class="form-control" id="contactName" name="contactName" placeholder="Enter your name" required>
      </div>
      <div class="form-group">
        <label for="contactEmail">Your Email:</label>
        <input type="email" class="form-control" id="contactEmail" name="contactEmail" placeholder="your.email@example.com" required>
      </div>
      <div class="form-group">
        <label for="contactSubject">Subject:</label>
        <input type="text" class="form-control" id="contactSubject" name="contactSubject" placeholder="Subject of your message" required>
      </div>
      <div class="form-group">
        <label for="contactMessage">Message:</label>
        <textarea class="form-control" id="contactMessage" name="contactMessage" rows="6" placeholder="Type your message here..." required></textarea>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-custom">Send Message</button>
      </div>
    </form>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Optional Map Section (Placeholder for Embedded Map) -->
  <div class="map-container">
    <h4>Find Us Here</h4>
    <img src="media/map-placeholder.jpg" alt="Map Location" style="max-width:100%; border-radius:8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
    <!-- You may replace the placeholder with an embedded Google Map or similar solution -->
  </div>
</div>

<%@ include file="footer.jsp" %>
