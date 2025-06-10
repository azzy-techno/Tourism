<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Inner class representing a Guide with extended details.
    public class Guide {
        private int id;
        private String name;
        private String expertise;
        private String bio;
        private String profilePicUrl;
        private String[] languages;
        private String[] certifications;
        
        public Guide(int id, String name, String expertise, String bio, String profilePicUrl, String[] languages, String[] certifications) {
            this.id = id;
            this.name = name;
            this.expertise = expertise;
            this.bio = bio;
            this.profilePicUrl = profilePicUrl;
            this.languages = languages;
            this.certifications = certifications;
        }
        public int getId() { return id; }
        public String getName() { return name; }
        public String getExpertise() { return expertise; }
        public String getBio() { return bio; }
        public String getProfilePicUrl() { return profilePicUrl; }
        public String[] getLanguages() { return languages; }
        public String[] getCertifications() { return certifications; }
    }
%>

<%
    // Retrieve the guide id from the request.
    String idStr = request.getParameter("id");
    int guideId = 0;
    try {
        guideId = Integer.parseInt(idStr);
    } catch(Exception e) {
        guideId = 1;
    }
    
    // Simulate guide detail lookup.
    Guide guide;
    if(guideId == 1) {
        guide = new Guide(
            1,
            "Alice Wonderland",
            "Historical and Cultural Tours",
            "Alice has over 10 years of experience leading tours across ancient cities and cultural landmarks. Her storytelling ability and deep local knowledge ensure that every tour is memorable. In her free time, Alice enjoys exploring off-the-beaten-path historical sites and sharing her passion for heritage with fellow travelers.",
            "media/guide-alice.jpg",
            new String[] {"English", "French", "Spanish"},
            new String[] {"Certified Tour Guide", "First Aid Certified", "Local History Expert"}
        );
    } else if(guideId == 2) {
        guide = new Guide(
            2,
            "Bob Traveler",
            "Adventure and Nature Tours",
            "Bob is an enthusiastic guide whose expertise spans adventure sports and nature hikes. He has conducted numerous treks through rugged terrains and is especially knowledgeable about local flora and fauna. Bob’s energetic style and commitment to safety make him a favorite among thrill-seeking travelers.",
            "media/guide-bob.jpg",
            new String[] {"English", "German"},
            new String[] {"Certified Adventure Guide", "Outdoor Survival Expert"}
        );
    } else {
        guide = new Guide(
            0,
            "Guide Not Found",
            "",
            "We could not locate the details of the requested guide. Please verify the link or return to the guides list.",
            "media/default-guide.jpg",
            new String[] {},
            new String[] {}
        );
    }
%>

<!-- Additional CSS Styles for Guide Details Page -->
<style>
  .guide-details-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px; /* Slight overlap with the header */
    position: relative;
    z-index: 2;
  }
  .guide-title {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
  }
  .guide-header {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 30px;
  }
  .guide-header img {
    flex: 1 1 200px;
    max-width: 300px;
    width: 100%;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    margin-bottom: 20px;
  }
  .guide-info {
    flex: 2 1 300px;
    padding: 0 20px;
    font-size: 1.1rem;
    color: #444;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .guide-info h3 {
    color: #27ae60;
  }
  .guide-bio, .guide-languages, .guide-certifications {
    margin-bottom: 30px;
  }
  .guide-bio p {
    text-align: justify;
    line-height: 1.6;
    color: #555;
  }
  .list-style {
    list-style: disc;
    margin-left: 20px;
    color: #555;
  }
  .back-button {
    margin-top: 30px;
    text-align: center;
  }
</style>

<div class="guide-details-container container">
  <!-- Title Section -->
  <h2 class="guide-title"><%= guide.getName() %> – Expert in <%= guide.getExpertise() %></h2>
  
  <!-- Header Section: Profile Picture and Basic Info -->
  <div class="guide-header row">
    <div class="col-md-4">
      <img src="<%= guide.getProfilePicUrl() %>" alt="<%= guide.getName() %>">
    </div>
    <div class="col-md-8 guide-info">
      <h3>About <%= guide.getName() %></h3>
      <p><%= guide.getBio() %></p>
    </div>
  </div>
  
  <div class="section-divider" style="border-top:1px solid #ddd; margin:30px 0;"></div>
  
  <!-- Languages Section -->
  <div class="guide-languages">
    <h4>Languages Spoken</h4>
    <ul class="list-style">
      <% 
          String[] languages = guide.getLanguages();
          if(languages != null && languages.length > 0){
              for(int i = 0; i < languages.length; i++){
      %>
          <li><%= languages[i] %></li>
      <%
              }
          } else {
      %>
          <li>No language details available.</li>
      <%
          }
      %>
    </ul>
  </div>
  
  <div class="section-divider" style="border-top:1px solid #ddd; margin:30px 0;"></div>
  
  <!-- Certifications Section -->
  <div class="guide-certifications">
    <h4>Certifications & Credentials</h4>
    <ul class="list-style">
      <% 
          String[] certifications = guide.getCertifications();
          if(certifications != null && certifications.length > 0){
              for(int j = 0; j < certifications.length; j++){
      %>
          <li><%= certifications[j] %></li>
      <%
              }
          } else {
      %>
          <li>No certifications listed.</li>
      <%
          }
      %>
    </ul>
  </div>
  
  <!-- Back Button -->
  <div class="back-button">
    <a href="guides.jsp" class="btn btn-custom">← Back to Guides</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
