<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Guide with heavy profile content.
    public class GuideProfile {
        private int id;
        private String name;
        private String bio;
        private String expertise;
        private String experience;
        private String imageURL;
        private String[] certificates;
        private String[] reviews;
        
        public GuideProfile(int id, String name, String bio, String expertise, String experience, String imageURL, String[] certificates, String[] reviews) {
            this.id = id;
            this.name = name;
            this.bio = bio;
            this.expertise = expertise;
            this.experience = experience;
            this.imageURL = imageURL;
            this.certificates = certificates;
            this.reviews = reviews;
        }
        public int getId() { return id; }
        public String getName() { return name; }
        public String getBio() { return bio; }
        public String getExpertise() { return expertise; }
        public String getExperience() { return experience; }
        public String getImageURL() { return imageURL; }
        public String[] getCertificates() { return certificates; }
        public String[] getReviews() { return reviews; }
    }
%>

<%
    // Retrieve the guide ID from the request
    String guideIdStr = request.getParameter("id");
    int guideId = 0;
    try {
        guideId = Integer.parseInt(guideIdStr);
    } catch(Exception e) {
        guideId = 1; // Default to guide id 1 if parsing fails
    }
    
    // Simulate heavy-content guide profile data.
    GuideProfile guide;
    if (guideId == 1) {
        guide = new GuideProfile(
            1,
            "Alice Wonderland",
            "Alice has been leading historical and adventure tours for over 10 years. With a deep passion for storytelling and a knack for uncovering hidden gems, she brings destinations to life with her detailed knowledge and warm personality.",
            "Historical Tours, Adventure, Cultural Immersion",
            "10+ Years of Experience, Numerous Awards for Tour Excellence",
            "media/guide-alice.jpg",
            new String[] {"Certified Tour Guide", "Local Culture Specialist", "First-Aid Certified"},
            new String[] {"Alice made our tour unforgettable!", "Her insights into history were eye-opening.", "Highly recommend her for adventurous trips."}
        );
    } else {
        // Fallback data if guide is not found.
        guide = new GuideProfile(
            0,
            "Guide Not Found",
            "No detailed information available for this guide.",
            "",
            "",
            "media/default-guide.jpg",
            new String[] {},
            new String[] {}
        );
    }
%>

<!-- Additional CSS for Guide Profile Page -->
<style>
  .guide-profile-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Slight overlap with header for visual continuity */
    position: relative;
    z-index: 2;
  }
  .guide-header {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    margin-bottom: 30px;
  }
  .guide-header img {
    flex: 1 1 250px;
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    margin-bottom: 20px;
  }
  .guide-info {
    flex: 2 1 300px;
    padding: 0 20px;
  }
  .guide-info h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .guide-info h4 {
    color: #27ae60;
    margin-bottom: 15px;
  }
  .guide-info p {
    font-size: 1.1rem;
    line-height: 1.6;
    color: #555;
    text-align: justify;
  }
  .profile-section {
    margin-top: 30px;
  }
  .profile-section h4 {
    color: #27ae60;
    margin-bottom: 15px;
  }
  .profile-section ul {
    list-style-type: disc;
    padding-left: 20px;
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

<div class="guide-profile-container container">
  <!-- Header Section: Image and Basic Info -->
  <div class="guide-header row">
    <div class="col-md-4">
      <img src="<%= guide.getImageURL() %>" alt="<%= guide.getName() %>">
    </div>
    <div class="col-md-8 guide-info">
      <h2><%= guide.getName() %></h2>
      <h4>Expertise: <%= guide.getExpertise() %></h4>
      <p><%= guide.getBio() %></p>
      <p><strong>Experience:</strong> <%= guide.getExperience() %></p>
    </div>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Certificates Section -->
  <div class="profile-section">
    <h4>Certificates & Qualifications</h4>
    <ul>
      <%
         String[] certificates = guide.getCertificates();
         if(certificates != null && certificates.length > 0) {
           for (int i = 0; i < certificates.length; i++) {
      %>
              <li><%= certificates[i] %></li>
      <%
           }
         } else {
      %>
              <li>No certificates available.</li>
      <%
         }
      %>
    </ul>
  </div>
  
  <div class="section-divider"></div>
  
  <!-- Reviews Section -->
  <div class="profile-section">
    <h4>User Reviews</h4>
    <ul>
      <%
         String[] reviews = guide.getReviews();
         if(reviews != null && reviews.length > 0) {
           for (int j = 0; j < reviews.length; j++) {
      %>
              <li><%= reviews[j] %></li>
      <%
           }
         } else {
      %>
              <li>No reviews available yet.</li>
      <%
         }
      %>
    </ul>
  </div>
  
  <!-- Navigation Button -->
  <div class="text-center">
    <a href="guides.jsp" class="btn btn-custom back-button">← Back to Guides</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
