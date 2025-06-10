package com.tourism.dto;

import java.sql.Timestamp;

public class ContactMessageDTO {
    private int messageId;
    private int userId;
    private String name;      // New field for sender's name
    private String email;
    private String subject;
    private String message;
    private String status;
    private Timestamp createdAt;

    // Default constructor
    public ContactMessageDTO() {
    }

    // Parameterized constructor matching the DAO usage
    public ContactMessageDTO(int messageId, int userId, String subject, String message, String status, Timestamp createdAt) {
        this.messageId = messageId;
        this.userId = userId;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters and Setters

    public int getMessageId() {
        return messageId;
    }
    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
