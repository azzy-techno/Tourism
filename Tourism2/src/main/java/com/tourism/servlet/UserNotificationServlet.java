package com.tourism.servlet;

import com.tourism.dto.UserNotificationDTO;
import com.tourism.service.UserNotificationService;
import com.tourism.dao.UserNotificationDAO;
import com.tourism.dao.interfaces.IUserNotificationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserNotificationServlet extends HttpServlet {
    private UserNotificationService userNotificationService;

    @Override
    public void init() {
        IUserNotificationDAO userNotificationDAO = new UserNotificationDAO();
        userNotificationService = new UserNotificationService(userNotificationDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String message = request.getParameter("message");

        if (message == null || message.isEmpty()) {
            response.getWriter().write("Error: Notification message cannot be empty.");
            return;
        }

        UserNotificationDTO notification = new UserNotificationDTO();
        notification.setUserId(userId);
        notification.setMessage(message);

        boolean success = userNotificationService.addNotification(notification);
        response.getWriter().write(success ? "Notification Sent Successfully" : "Error Sending Notification");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserNotificationDTO notification = userNotificationService.getNotificationByUserId(userId);

        if (notification != null) {
            response.getWriter().write("Notification Found: " + notification.getMessage());
        } else {
            response.getWriter().write("No Notifications Found");
        }
    }
}
