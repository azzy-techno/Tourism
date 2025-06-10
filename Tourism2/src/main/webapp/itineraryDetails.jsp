<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing an Itinerary with heavy content details.
    public class ItineraryDetail {
        private int id;
        private String userName;
        private String startDate;
        private String endDate;
        private String overview;
        private String[] activities;
        private String schedule;  // Detailed schedule information.
        
        public ItineraryDetail(int id, String userName, String startDate, String endDate, 
                               String overview, String[] activities, String schedule) {
            this.id = id;
            this.userName = userName;
            this.startDate = startDate;
            this.endDate = endDate;
            this.overview = overview;
            this.activities = activities;
            this.schedule = schedule;
        }
        public int getId() { return id; }
        public String getUserName() { return userName; }
        public String getStartDate() { return startDate; }
        public String getEndDate() { return endDate; }
        public String getOverview() { return overview; }
        public String[] getActivities() { return activities; }
        public String getSchedule() { return schedule; }
    }
%>

<%
    // Retrieve the itinerary id parameter from the request
    String idStr = request.getParameter("id");
    int itineraryId = 0;
    try {
        itineraryId = Integer.parseInt(idStr);
    } catch (Exception e) {
        itineraryId = 1;
    }
    
    // Simulating heavy content data for an itinerary.
    ItineraryDetail itinerary;
    if(itineraryId == 1){
        itinerary = new ItineraryDetail(
            1,
            "John Doe",
            "2025-07-10",
            "2025-07-20",
            "This itinerary offers a perfect blend of adventure and relaxation. John Doe will explore scenic landscapes, immerse in local cultures, and enjoy a balanced schedule between guided tours and free time.",
            new String[] {
                "Day 1: Arrival and Welcome Dinner",
                "Day 2: City Tour and Museum Visit",
                "Day 3: Local Market Exploration",
                "Day 4: Adventure Sports – Hiking",
                "Day 5: Leisure and Spa",
                "Day 6: Cultural Show",
                "Day 7: Beach Day",
                "Day 8: Nature Walks",
                "Day 9: Shopping & Farewell",
                "Day 10: Departure"
            },
            "Detailed Schedule: \nDay 1: Arrive at the destination & check in to the hotel, followed by an evening welcome dinner at the rooftop restaurant with panoramic views. \nDay 2: Start with a guided city tour highlighting historic landmarks, continue with a visit to a renowned museum, and end with a leisurely lunch at a local café. \n... (more details can be added here)"
        );
    } else {
        itinerary = new ItineraryDetail(
            0,
            "Unknown",
            "",
            "",
            "No itinerary details available. Please check your link or go back to the itineraries list.",
            new String[]{},
            ""
        );
    }
%>

<!-- CSS for a heavy content itinerary details page -->
<style>
  .itinerary-details-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Slight overlap with header for visual integration */
    position: relative;
    z-index: 2;
  }
  .itinerary-title {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
  }
  .itinerary-header {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 30px;
  }
  .itinerary-info {
    flex: 1 1 300px;
    padding: 10px 20px;
    font-size: 1.1rem;
    color: #444;
  }
  .itinerary-overview {
    margin-bottom: 30px;
  }
  .itinerary-overview h4 {
    color: #27ae60;
    margin-bottom: 10px;
  }
  .itinerary-overview p {
    text-align: justify;
    line-height: 1.6;
    color: #555;
  }
  .activities-list {
    list-style-type: decimal;
    margin-left: 20px;
    color: #555;
  }
  .schedule-section {
    margin-top: 30px;
  }
  .section-divider {
    border-top: 1px solid #ddd;
    margin: 30px 0;
  }
  .back-button {
    margin-top: 20px;
  }
</style>

<div class="itinerary-details-container container">
  <!-- Title Section -->
  <h2 class="itinerary-title">Itinerary for <%= itinerary.getUserName() %></h2>
  
  <!-- Basic Information Section -->
  <div class="itinerary-header row">
    <div class="col-md-6 itinerary-info">
      <p><strong>Start Date:</strong> <%= itinerary.getStartDate() %></p>
      <p><strong>End Date:</strong> <%= itinerary.getEndDate() %></p>
    </div>
    <div class="col-md-6 itinerary-info">
      <p><strong>Duration:</strong> 
         <%
            // Basic calculation (assumes valid date format and ignores time zones)
            // In production this would be calculated in the backend.
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            try {
                java.util.Date start = sdf.parse(itinerary.getStartDate());
                java.util.Date end = sdf.parse(itinerary.getEndDate());
                long diff = end.getTime() - start.getTime();
                long days = diff / (1000 * 60 * 60 * 24);
                out.print(days + " days");
            } catch(Exception e) {
                out.print("N/A");
            }
         %>
      </p>
    </div>
  </div>
  
  <!-- Overview Section -->
  <div class="itinerary-overview">
    <h4>Overview</h4>
    <p><%= itinerary.getOverview() %></p>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Activities Section -->
  <div class="itinerary-activities">
    <h4>Activities</h4>
    <ol class="activities-list">
      <%
        String[] activities = itinerary.getActivities();
        if(activities != null && activities.length > 0) {
          for (int i = 0; i < activities.length; i++) {
      %>
          <li><%= activities[i] %></li>
      <%
          }
        } else {
      %>
          <li>No specific activities listed.</li>
      <%
        }
      %>
    </ol>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Schedule Section -->
  <div class="schedule-section">
    <h4>Detailed Schedule</h4>
    <p style="white-space: pre-line; text-align: justify; line-height: 1.6; color:#555;">
      <%= itinerary.getSchedule() %>
    </p>
  </div>
  
  <!-- Back Button -->
  <div class="text-center">
    <a href="itinerary.jsp" class="btn btn-custom back-button">← Back to Itineraries</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
