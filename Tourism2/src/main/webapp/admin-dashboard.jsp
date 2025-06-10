<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<%!
    // Simple inner classes to represent modules.
    public class Destination {
        private int id;
        private String name;
        private String description;
        public Destination(int id, String name, String desc) {
            this.id = id;
            this.name = name;
            this.description = desc;
        }
        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }
    }
    
    public class Itinerary {
        private int id;
        private String userName;
        private String startDate;
        private String endDate;
        private String activities;
        public Itinerary(int id, String userName, String startDate, String endDate, String activities) {
            this.id = id;
            this.userName = userName;
            this.startDate = startDate;
            this.endDate = endDate;
            this.activities = activities;
        }
        public int getId() { return id; }
        public String getUserName() { return userName; }
        public String getStartDate() { return startDate; }
        public String getEndDate() { return endDate; }
        public String getActivities() { return activities; }
    }
    
    public class Guide {
        private int id;
        private String name;
        private String expertise;
        public Guide(int id, String name, String expertise) {
            this.id = id;
            this.name = name;
            this.expertise = expertise;
        }
        public int getId() { return id; }
        public String getName() { return name; }
        public String getExpertise() { return expertise; }
    }
%>

<%
    // Simulated data for each module.
    Destination[] destinations = new Destination[2];
    destinations[0] = new Destination(1, "Tropical Paradise", "Enjoy beautiful beaches and crystal clear waters.");
    destinations[1] = new Destination(2, "Mountain Retreat", "Experience serene landscapes and fresh air.");

    Itinerary[] itineraries = new Itinerary[2];
    itineraries[0] = new Itinerary(101, "John Doe", "2025-07-10", "2025-07-20", "Hiking, Snorkeling");
    itineraries[1] = new Itinerary(102, "Jane Smith", "2025-08-01", "2025-08-15", "City Tour, Museum Visit");

    Guide[] guides = new Guide[2];
    guides[0] = new Guide(201, "Alice Wonderland", "Historical Tours");
    guides[1] = new Guide(202, "Bob Traveler", "Adventure & Trekking");
%>

<!-- Additional Admin Dashboard Styles -->
<style>
  .admin-dashboard-container {
    padding: 100px 20px 50px;
    background-color: rgba(255,255,255,0.95);
    min-height: 100vh;
  }
  .admin-header {
    text-align: center;
    margin-bottom: 30px;
    animation: fadeInDown 1s;
  }
  .admin-header h1 {
    font-size: 3em;
    color: #2c3e50;
  }
  .admin-header p {
    font-size: 1.2rem;
    color: #555;
  }
  /* Nav tabs styling */
  .nav-tabs .nav-link {
    color: #27ae60;
    font-weight: bold;
  }
  .nav-tabs .nav-link.active {
    background-color: #27ae60;
    color: #fff;
  }
  .tab-content {
    background: #fff;
    padding: 20px;
    margin-top: 20px;
    border-radius: 5px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
  }
  .table-actions a {
    margin-right: 5px;
  }
  
  @keyframes fadeInDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
  }
</style>

<div class="admin-dashboard-container container-fluid">
  <!-- Admin header -->
  <div class="admin-header">
    <h1>Admin Dashboard</h1>
    <p>Full control over Destinations, Itineraries, Guides and more.</p>
  </div>
  
  <!-- Navigation Tabs -->
  <ul class="nav nav-tabs" id="adminTab" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" id="dest-tab" data-toggle="tab" href="#destinations" role="tab">Destinations</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="itin-tab" data-toggle="tab" href="#itineraries" role="tab">Itineraries</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="guide-tab" data-toggle="tab" href="#guides" role="tab">Guides</a>
    </li>
  </ul>
  
  <!-- Tab Content -->
  <div class="tab-content" id="adminTabContent">
    <!-- Destinations Tab -->
    <div class="tab-pane fade show active" id="destinations" role="tabpanel">
      <h3>Manage Destinations</h3>
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>ID</th>
            <th>Destination Name</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            for (int i = 0; i < destinations.length; i++) {
              Destination dest = destinations[i];
          %>
          <tr>
            <td><%= dest.getId() %></td>
            <td><%= dest.getName() %></td>
            <td><%= dest.getDescription() %></td>
            <td class="table-actions">
              <a href="EditDestinationServlet?id=<%= dest.getId() %>" class="btn btn-sm btn-custom">Edit</a>
              <a href="DeleteDestinationServlet?id=<%= dest.getId() %>" class="btn btn-sm btn-danger">Delete</a>
            </td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
      <button class="btn btn-custom" data-toggle="modal" data-target="#addDestinationModal">Add New Destination</button>
    </div>
    
    <!-- Itineraries Tab -->
    <div class="tab-pane fade" id="itineraries" role="tabpanel">
      <h3>Manage Itineraries</h3>
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>ID</th>
            <th>User</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Activities</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            for (int j = 0; j < itineraries.length; j++) {
              Itinerary itin = itineraries[j];
          %>
          <tr>
            <td><%= itin.getId() %></td>
            <td><%= itin.getUserName() %></td>
            <td><%= itin.getStartDate() %></td>
            <td><%= itin.getEndDate() %></td>
            <td><%= itin.getActivities() %></td>
            <td class="table-actions">
              <a href="EditItineraryServlet?id=<%= itin.getId() %>" class="btn btn-sm btn-custom">Edit</a>
              <a href="DeleteItineraryServlet?id=<%= itin.getId() %>" class="btn btn-sm btn-danger">Delete</a>
            </td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
      <button class="btn btn-custom" data-toggle="modal" data-target="#addItineraryModal">Add New Itinerary</button>
    </div>
    
    <!-- Guides Tab -->
    <div class="tab-pane fade" id="guides" role="tabpanel">
      <h3>Manage Guides</h3>
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>ID</th>
            <th>Guide Name</th>
            <th>Expertise</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            for (int k = 0; k < guides.length; k++) {
              Guide guide = guides[k];
          %>
          <tr>
            <td><%= guide.getId() %></td>
            <td><%= guide.getName() %></td>
            <td><%= guide.getExpertise() %></td>
            <td class="table-actions">
              <a href="EditGuideServlet?id=<%= guide.getId() %>" class="btn btn-sm btn-custom">Edit</a>
              <a href="DeleteGuideServlet?id=<%= guide.getId() %>" class="btn btn-sm btn-danger">Delete</a>
            </td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
      <button class="btn btn-custom" data-toggle="modal" data-target="#addGuideModal">Add New Guide</button>
    </div>
    
  </div> <!-- End Tab Content -->
</div>

<!-- Sample Modal for Adding New Destination -->
<div class="modal fade" id="addDestinationModal" tabindex="-1" role="dialog" aria-labelledby="addDestinationModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <form action="DestinationServlet" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="addDestinationModalLabel">Add New Destination</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <!-- Form Fields for Destination -->
          <div class="form-group">
            <label for="destinationName">Destination Name</label>
            <input type="text" class="form-control" id="destinationName" name="destinationName" required>
          </div>
          <div class="form-group">
            <label for="destinationDescription">Description</label>
            <textarea class="form-control" id="destinationDescription" name="destinationDescription" rows="3" required></textarea>
          </div>
          <!-- Additional fields can be added here -->
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-custom">Add Destination</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Similar modal blocks can be created for adding itineraries or guides. -->

<!-- Optional JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp" %>
