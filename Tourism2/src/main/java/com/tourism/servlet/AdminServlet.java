package com.tourism.servlet;

import com.tourism.dto.AdminDTO;
import com.tourism.service.AdminService;
import com.tourism.dao.AdminDAO;
import com.tourism.dao.interfaces.IAdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminServlet extends HttpServlet {
    private AdminService adminService;

    @Override
    public void init() {
        IAdminDAO adminDAO = new AdminDAO();
        adminService = new AdminService(adminDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDTO admin = adminService.authenticateAdmin(email, password);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("adminId", admin.getAdminId());
            response.getWriter().write("Admin Login Successful!");
        } else {
            response.getWriter().write("Invalid Credentials");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("admin-login.jsp"); 
        } else {
            response.getWriter().write("Admin Dashboard");
        }
        // Check session timeout manually
        long currentTime = System.currentTimeMillis();
        long lastAccessedTime = session.getLastAccessedTime();
        int maxInactiveInterval = session.getMaxInactiveInterval() * 1000;

        if (currentTime - lastAccessedTime > maxInactiveInterval) {
            session.invalidate();
            response.getWriter().write("Session Expired! Please log in again.");
            return;
        }

        response.getWriter().write("Admin Dashboard - Session Active");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.getWriter().write("Admin Logout Successful!");
    }
}
