<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
  
<!-- Additional CSS specifically for the login overlay -->
<style>
  .login-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 350px;
    background: rgba(255, 255, 255, 0.9);
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
    animation: slideInUp 1s ease-out;
    z-index: 3;
  }
  @keyframes slideInUp {
    0% { opacity: 0; transform: translate(-50%, 100%); }
    100% { opacity: 1; transform: translate(-50%, -50%); }
  }
  .login-overlay h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
  }
  .login-overlay .form-control {
    border-radius: 0;
    box-shadow: none;
  }
  .login-overlay .btn-primary {
    background: #27ae60;
    border: none;
    transition: background 0.3s ease;
  }
  .login-overlay .btn-primary:hover {
    background: #1e8449;
  }
  .login-overlay a {
    color: #27ae60;
    text-decoration: none;
  }
  .login-overlay a:hover {
    text-decoration: underline;
  }
</style>

<div class="login-overlay">
  <h2>User Login</h2>
  <% 
    // Check whether an error message exists (set by the login servlet in case of failure)
    String errorMsg = (String) request.getAttribute("errorMsg"); 
    if (errorMsg != null && !errorMsg.isEmpty()) {
  %>
      <p style="color:red; text-align:center;"><%= errorMsg %></p>
  <% } %>
  
  <!-- The Login Form -->
  <form action="<%= request.getContextPath() %>/UserServlet" method="post">
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="your.email@example.com" required>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="********" required>
      </div>
      <button type="submit" class="btn btn-primary btn-block">Login</button>
  </form>
  
  <p class="mt-3" style="text-align:center;">
    Not registered? <a href="user-signup.jsp">Sign Up</a>
  </p>
</div>

<%@ include file="footer.jsp" %>
