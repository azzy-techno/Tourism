<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing booking information.
    public class Booking {
        private int id;
        private String userName;
        private String destination;
        private String bookingDate;
        private String travelStartDate;
        private String travelEndDate;
        private double totalAmount;
        private String paymentStatus;
        private String additionalNotes;
        
        public Booking(int id, String userName, String destination, String bookingDate,
                       String travelStartDate, String travelEndDate, double totalAmount,
                       String paymentStatus, String additionalNotes) {
            this.id = id;
            this.userName = userName;
            this.destination = destination;
            this.bookingDate = bookingDate;
            this.travelStartDate = travelStartDate;
            this.travelEndDate = travelEndDate;
            this.totalAmount = totalAmount;
            this.paymentStatus = paymentStatus;
            this.additionalNotes = additionalNotes;
        }
        public int getId() { return id; }
        public String getUserName() { return userName; }
        public String getDestination() { return destination; }
        public String getBookingDate() { return bookingDate; }
        public String getTravelStartDate() { return travelStartDate; }
        public String getTravelEndDate() { return travelEndDate; }
        public double getTotalAmount() { return totalAmount; }
        public String getPaymentStatus() { return paymentStatus; }
        public String getAdditionalNotes() { return additionalNotes; }
    }
%>

<%
    // Retrieve the booking id from the request, if available.
    String idStr = request.getParameter("id");
    int bookingId = 0;
    try {
        bookingId = Integer.parseInt(idStr);
    } catch(Exception e) {
        bookingId = 1;
    }
    
    // Simulate a booking record. In production, your backend would set this.
    Booking booking;
    if(bookingId == 1){
        booking = new Booking(
            1,
            "John Doe",
            "Tropical Paradise",
            "2025-06-05",
            "2025-07-10",
            "2025-07-20",
            1299.99,
            "Paid",
            "Includes airport pickup, guided tours, and breakfast."
        );
    } else {
        booking = new Booking(
            0,
            "Unknown",
            "N/A",
            "N/A",
            "N/A",
            "N/A",
            0.0,
            "Not Available",
            "No booking details found. Please check your link or view your bookings list."
        );
    }
%>

<!-- Additional CSS Styles for Booking Details Page -->
<style>
  .booking-details-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Overlap slightly with header */
    position: relative;
    z-index: 2;
  }
  .booking-title {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
  }
  .booking-summary {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 30px;
  }
  .booking-summary .info-block {
    flex: 1 1 300px;
    padding: 15px;
    color: #444;
    font-size: 1.1rem;
    border-right: 1px solid #ddd;
  }
  .booking-summary .info-block:last-child {
    border-right: none;
  }
  .booking-details {
    margin-top: 20px;
  }
  .booking-details h4 {
    color: #27ae60;
    margin-bottom: 10px;
  }
  .booking-details p {
    text-align: justify;
    line-height: 1.6;
    color: #555;
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
  @media (max-width: 768px) {
    .booking-summary .info-block {
      border-right: none;
      border-bottom: 1px solid #ddd;
      margin-bottom: 15px;
    }
  }
</style>

<div class="booking-details-container container">
  <!-- Title -->
  <h2 class="booking-title">Booking Details for <%= booking.getUserName() %></h2>
  
  <!-- Summary Section -->
  <div class="booking-summary row">
    <div class="info-block col-md-4">
      <p><strong>Destination:</strong><br> <%= booking.getDestination() %></p>
    </div>
    <div class="info-block col-md-4">
      <p><strong>Travel Dates:</strong><br> <%= booking.getTravelStartDate() %> to <%= booking.getTravelEndDate() %></p>
    </div>
    <div class="info-block col-md-4">
      <p><strong>Total Amount:</strong><br> $<%= booking.getTotalAmount() %></p>
    </div>
  </div>
  <div class="booking-summary row">
    <div class="info-block col-md-6">
      <p><strong>Booking Date:</strong><br> <%= booking.getBookingDate() %></p>
    </div>
    <div class="info-block col-md-6">
      <p><strong>Payment Status:</strong><br> <%= booking.getPaymentStatus() %></p>
    </div>
  </div>
  
  <!-- Further Details Section -->
  <div class="booking-details">
    <h4>Additional Information</h4>
    <p><%= booking.getAdditionalNotes() %></p>
  </div>
  
  <!-- Back Button -->
  <div class="back-button">
    <a href="booking.jsp">← Back to Bookings</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
