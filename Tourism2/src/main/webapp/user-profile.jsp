<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%!
    // Simple inner class to represent a User Profile.
    public class UserProfile {
        private int id;
        private String fullName;
        private String email;
        private String bio;
        private String profilePicUrl;
        private String membershipDate;
        private String[] hobbies;
        
        public UserProfile(int id, String fullName, String email, String bio, String profilePicUrl, String membershipDate, String[] hobbies) {
            this.id = id;
            this.fullName = fullName;
            this.email = email;
            this.bio = bio;
            this.profilePicUrl = profilePicUrl;
            this.membershipDate = membershipDate;
            this.hobbies = hobbies;
        }
        public int getId() { return id; }
        public String getFullName() { return fullName; }
        public String getEmail() { return email; }
        public String getBio() { return bio; }
        public String getProfilePicUrl() { return profilePicUrl; }
        public String getMembershipDate() { return membershipDate; }
        public String[] getHobbies() { return hobbies; }
    }
%>

<%
    // Simulate retrieval of a user profile.
    // In practice your servlet would do this and set a request attribute.
    UserProfile user = new UserProfile(
        101,
        "John Doe",
        "john.doe@example.com",
        "John is an avid traveler who loves exploring new cultures and trying exotic cuisines. With a passion for adventure and a keen eye for detail, he enjoys planning trips that are both relaxing and exhilarating.",
        "media/profile-john.jpg",
        "2023-03-15",
        new String[] {"Photography", "Hiking", "Cooking", "Blogging"}
    );
%>

<!-- Additional CSS for the User Profile page -->
<style>
  .profile-container {
    background-color: rgba(255,255,255,0.98);
    padding: 40px 20px;
    margin-top: -80px;
    position: relative;
    z-index: 2;
  }
  .profile-header {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    margin-bottom: 30px;
  }
  .profile-img {
    flex: 0 0 150px;
    max-width: 150px;
    margin-right: 30px;
    border-radius: 50%;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  }
  .profile-info {
    flex: 1;
  }
  .profile-info h2 {
    color: #2c3e50;
    margin-bottom: 10px;
  }
  .profile-info p {
    color: #555;
    line-height: 1.5;
  }
  .profile-details {
    margin-top: 30px;
  }
  .profile-details h4 {
    color: #27ae60;
    margin-bottom: 10px;
  }
  .profile-details .detail-item {
    margin-bottom: 10px;
    color: #444;
  }
  .hobbies-list {
    list-style-type: disc;
    padding-left: 20px;
    color: #555;
  }
  .update-profile {
    margin-top: 30px;
    text-align: center;
  }
  .update-profile a {
    color: #fff;
    background-color: #27ae60;
    padding: 10px 20px;
    border-radius: 4px;
    text-decoration: none;
    transition: background 0.3s ease;
  }
  .update-profile a:hover {
    background-color: #1e8449;
  }
</style>

<div class="profile-container container">
  <!-- Profile Header: Image and Basic Info -->
  <div class="profile-header row">
    <div class="col-md-3 text-center">
      <img class="profile-img img-fluid" src="<%= user.getProfilePicUrl() %>" alt="<%= user.getFullName() %>">
    </div>
    <div class="col-md-9 profile-info">
      <h2><%= user.getFullName() %></h2>
      <p><strong>Email:</strong> <%= user.getEmail() %></p>
      <p><strong>Member Since:</strong> <%= user.getMembershipDate() %></p>
    </div>
  </div>
  
  <!-- Bio Section -->
  <div class="profile-details">
    <h4>About Me</h4>
    <p><%= user.getBio() %></p>
  </div>
  
  <div class="section-divider" style="border-top:1px solid #ddd; margin:30px 0;"></div>
  
  <!-- Hobbies Section -->
  <div class="profile-details">
    <h4>Hobbies & Interests</h4>
    <ul class="hobbies-list">
      <%
         String[] hobbies = user.getHobbies();
         if(hobbies != null && hobbies.length > 0){
            for (int i = 0; i < hobbies.length; i++){
      %>
                <li><%= hobbies[i] %></li>
      <%
            }
         } else {
      %>
          <li>No hobbies listed.</li>
      <%
         }
      %>
    </ul>
  </div>
  
  <!-- Update Profile Section -->
  <div class="update-profile">
    <a href="updateUserProfile.jsp?id=<%= user.getId() %>">Update My Profile</a>
  </div>
</div>

<%@ include file="footer.jsp" %>
