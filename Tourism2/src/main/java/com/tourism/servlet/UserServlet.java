package com.tourism.servlet;

import com.tourism.dto.UserDTO;
import com.tourism.service.UserService;
import com.tourism.dao.UserDAO;
import com.tourism.dao.interfaces.IUserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        IUserDAO userDAO = new UserDAO();
        userService = new UserService(userDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDTO user = userService.authenticateUser(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            response.getWriter().write("Login Successful!");
        } else {
            response.getWriter().write("Invalid Credentials");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().write("User Dashboard");
        }
     // Check session timeout manually
        long currentTime = System.currentTimeMillis();
        long lastAccessedTime = session.getLastAccessedTime();
        int maxInactiveInterval = session.getMaxInactiveInterval() * 1000; // Convert seconds to milliseconds

        if (currentTime - lastAccessedTime > maxInactiveInterval) {
            session.invalidate();
            response.getWriter().write("Session Expired! Please log in again.");
            return;
        }

        response.getWriter().write("User Dashboard - Session Active");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    }
    
}
