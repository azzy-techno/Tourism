<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Destination with heavy content details.
    public class Destination {
        private int id;
        private String name;
        private String shortDesc;
        private String longDesc;
        private String imageURL;
        private String[] amenities;
        private String[] reviews;
        
        public Destination(int id, String name, String shortDesc, String longDesc, String imageURL, String[] amenities, String[] reviews) {
            this.id = id;
            this.name = name;
            this.shortDesc = shortDesc;
            this.longDesc = longDesc;
            this.imageURL = imageURL;
            this.amenities = amenities;
            this.reviews = reviews;
        }
        // Getters
        public int getId() { return id; }
        public String getName() { return name; }
        public String getShortDesc() { return shortDesc; }
        public String getLongDesc() { return longDesc; }
        public String getImageURL() { return imageURL; }
        public String[] getAmenities() { return amenities; }
        public String[] getReviews() { return reviews; }
    }
%>

<%
    // Retrieve the destination ID from the request
    String idStr = request.getParameter("id");
    int destinationId = 0;
    try {
        destinationId = Integer.parseInt(idStr);
    } catch (Exception e) {
        destinationId = 1;
    }
    
    // For demonstration, we simulate heavy content for destination details.
    Destination destination;
    if (destinationId == 1) {
        destination = new Destination(
            1, 
            "Tropical Paradise",
            "A haven of sun, sea, and relaxation.",
            "Welcome to Tropical Paradise, where the pristine beaches meet crystal clear waters. Enjoy an immersive experience with sumptuous resorts, engaging water sports, colonial architecture, and an array of culinary delicacies. Our destination offers a mix of adventure and leisure—try snorkeling among vivid coral reefs, embark on a sunset cruise, or simply relax in a hammock as the gentle breeze soothes you.",
            "media/default-destination.jpg",
            new String[] {"Beachfront Resort", "Water Sports", "Spa & Wellness", "Fine Dining", "Cultural Tours"},
            new String[] {"Amazing location and unforgettable experience!", "A perfect blend of adventure and relaxation.", "The service was top-notch and the views were stunning."}
        );
    }
    else if (destinationId == 2) {
        destination = new Destination(
            2, 
            "Mountain Retreat",
            "Escape to nature’s serenity in the mountains.",
            "Mountain Retreat offers breathtaking views over rolling valleys and rugged peaks. Savor a retreat from the hustle of city life with ample opportunities for hiking, rock climbing, and forest walks. Enjoy cozy lodges, warm fires, and local culinary delights that are as hearty as they are delicious. Discover a haven of tranquility and adventure.",
            "media/mountain.jpg",
            new String[] {"Scenic Trails", "Guided Hikes", "Local Cuisine", "Campsites", "Nature Workshops"},
            new String[] {"A refreshing escape into nature.", "Challenging hikes and rewarding views!", "The retreat services made our vacation truly special."}
        );
    } 
    else {
        destination = new Destination(
            0,
            "Destination Not Found",
            "No destination details available.",
            "Please check your URL or return to the destinations list.",
            "media/default-destination.jpg",
            new String[] {},
            new String[] {}
        );
    }
%>

<!-- Additional CSS for heavy content and flexible layout -->
<style>
  .destination-details-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px;  /* Overlap slightly with header */
    position: relative;
    z-index: 2;
  }
  .destination-title {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
  }
  .destination-header {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 30px;
  }
  .destination-header img {
    flex: 1 1 300px;
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    margin-bottom: 20px;
  }
  .destination-short-desc {
    flex: 2 1 300px;
    padding: 0 20px;
    font-size: 1.2rem;
    color: #444;
    display: flex;
    align-items: center;
  }
  .destination-content {
    margin-bottom: 30px;
  }
  .destination-content h4 {
    color: #27ae60;
    margin-bottom: 10px;
  }
  .destination-content p {
    text-align: justify;
    line-height: 1.6;
    color: #555;
  }
  .amenities-list, .reviews-list {
    list-style-type: disc;
    margin-left: 20px;
    color: #555;
  }
  .section-divider {
    border-top: 1px solid #ddd;
    margin: 30px 0;
  }
  .back-button {
    margin-top: 20px;
  }
</style>

<div class="destination-details-container container">
  <!-- Title Section -->
  <h2 class="destination-title"><%= destination.getName() %></h2>
  
  <!-- Header Section: Image and Short Description -->
  <div class="destination-header row">
    <div class="col-md-6">
      <img src="<%= destination.getImageURL() %>" alt="<%= destination.getName() %>">
    </div>
    <div class="col-md-6 destination-short-desc">
      <p><%= destination.getShortDesc() %></p>
    </div>
  </div>
  
  <!-- Detailed Description Section -->
  <div class="destination-content">
    <h4>Overview</h4>
    <p><%= destination.getLongDesc() %></p>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Amenities Section -->
  <div class="destination-content">
    <h4>Amenities</h4>
    <ul class="amenities-list">
      <% 
         String[] amenities = destination.getAmenities();
         if (amenities != null && amenities.length > 0) {
             for (int i = 0; i < amenities.length; i++) { 
      %>
                <li><%= amenities[i] %></li>
      <%
             }
         } else {
      %>
            <li>No amenities available.</li>
      <%
         }
      %>
    </ul>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Reviews Section -->
  <div class="destination-content">
    <h4>User Reviews</h4>
    <% 
       String[] reviews = destination.getReviews();
       if (reviews != null && reviews.length > 0) {
         for (int j = 0; j < reviews.length; j++) {
    %>
         <p><strong>Review <%= j+1 %>:</strong> <%= reviews[j] %></p>
    <%
         }
       } else {
    %>
         <p>No reviews available yet.</p>
    <%
       }
    %>
  </div>
  
  <!-- Navigation Buttons -->
  <div class="text-center">
    <a href="destinations.jsp" class="btn btn-custom back-button">← Back to Destinations</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
