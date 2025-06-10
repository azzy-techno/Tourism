package com.tourism.service;

import com.tourism.dao.interfaces.IContactMessageDAO;
import com.tourism.dto.ContactMessageDTO;

public class ContactMessageService {
    private IContactMessageDAO contactMessageDAO;

    public ContactMessageService(IContactMessageDAO contactMessageDAO) {
        this.contactMessageDAO = contactMessageDAO;
    }

    public ContactMessageDTO getMessageById(int messageId) {
        return contactMessageDAO.getMessageById(messageId);
    }

    public boolean addMessage(ContactMessageDTO message) {
        // Business logic validation before saving message
        return contactMessageDAO.addMessage(message);
    }
}
