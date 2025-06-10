package com.tourism.service;

import com.tourism.dao.interfaces.IUserNotificationDAO;
import com.tourism.dto.UserNotificationDTO;

public class UserNotificationService {
    private IUserNotificationDAO userNotificationDAO;

    public UserNotificationService(IUserNotificationDAO userNotificationDAO) {
        this.userNotificationDAO = userNotificationDAO;
    }

    public UserNotificationDTO getNotificationByUserId(int userId) {
        return userNotificationDAO.getNotificationByUserId(userId);
    }

    public boolean addNotification(UserNotificationDTO notification) {
        // Business logic validation before inserting into DB
        return userNotificationDAO.addNotification(notification);
    }
}
