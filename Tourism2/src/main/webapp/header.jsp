<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <!-- Dynamically set the page title using an application (context) parameter -->
    <title>
      <%
        String appTitle = application.getInitParameter("appTitle");
        if(appTitle == null) {
          appTitle = "Tourism Management System";
        }
      %>
      <%= appTitle %>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
      /* Global reset */
      body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: Arial, sans-serif;
      }
      /* Navbar styling */
      .navbar-custom {
        background: rgba(0, 0, 0, 0.7);
      }
      .navbar-custom .navbar-brand,
      .navbar-custom .nav-link {
        color: #fff;
        transition: color 0.3s ease;
      }
      .navbar-custom .nav-link:hover {
        color: #ffdd57;
      }
      /* Video background container */
      .video-container {
        position: relative;
        height: 100vh;
        width: 100%;
        overflow: hidden;
      }
      .video-container video {
        position: absolute;
        top: 50%;
        left: 50%;
        min-width: 100%;
        min-height: 100%;
        width: auto;
        height: auto;
        z-index: -1;
        transform: translate(-50%, -50%);
        filter: brightness(70%);
      }
      /* Overlay for video */
      .video-overlay {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        background: rgba(0, 0, 0, 0.3);
      }
      /* Animated heading */
      .video-heading {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #fff;
        font-size: 3em;
        text-align: center;
        animation: fadeInDown 2s;
      }
      @keyframes fadeInDown {
        0% { opacity: 0; transform: translate(-50%, -60%); }
        100% { opacity: 1; transform: translate(-50%, -50%); }
      }
    </style>
  </head>
  <body>
    <!-- COMMON NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp"><%= appTitle %></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
          <span class="navbar-toggler-icon" style="color: #fff;"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="destinations.jsp">Destinations</a></li>
            <li class="nav-item"><a class="nav-link" href="itinerary.jsp">Itinerary</a></li>
            <li class="nav-item"><a class="nav-link" href="guide.jsp">Guides</a></li>
            <li class="nav-item"><a class="nav-link" href="reviews.jsp">Reviews</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            <li class="nav-item"><a class="nav-link" href="user-login.jsp">Login</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- VIDEO BACKGROUND -->
    <div class="video-container">
      <video autoplay loop muted>
        <source src="media/nature.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
      <div class="video-overlay"></div>
      <div class="video-heading">
        Welcome to the Ultimate Tourism Experience
      </div>
    </div>
    <!-- Page content to follow after header -->
