package com.tourism.servlet;

import com.tourism.dto.ContactMessageDTO;
import com.tourism.service.ContactMessageService;
import com.tourism.dao.ContactMessageDAO;
import com.tourism.dao.interfaces.IContactMessageDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ContactMessageServlet extends HttpServlet {
    private ContactMessageService contactMessageService;

    @Override
    public void init() {
        IContactMessageDAO contactMessageDAO = new ContactMessageDAO();
        contactMessageService = new ContactMessageService(contactMessageDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (message == null || message.isEmpty()) {
            response.getWriter().write("Error: Message cannot be empty.");
            return;
        }

        ContactMessageDTO contactMessage = new ContactMessageDTO();
        contactMessage.setName(name);
        contactMessage.setEmail(email);
        contactMessage.setMessage(message);

        boolean success = contactMessageService.addMessage(contactMessage);
        response.getWriter().write(success ? "Message Sent Successfully" : "Error Sending Message");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int messageId = Integer.parseInt(request.getParameter("messageId"));
        ContactMessageDTO contactMessage = contactMessageService.getMessageById(messageId);

        if (contactMessage != null) {
            response.getWriter().write("Message Found: " + contactMessage.getMessage());
        } else {
            response.getWriter().write("Message Not Found");
        }
    }
}
