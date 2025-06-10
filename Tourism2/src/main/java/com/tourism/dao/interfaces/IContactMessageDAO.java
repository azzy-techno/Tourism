package com.tourism.dao.interfaces;

import com.tourism.dto.ContactMessageDTO;

public interface IContactMessageDAO {
	ContactMessageDTO getMessageById(int messageId);
    boolean addMessage(ContactMessageDTO message);
}
