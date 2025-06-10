package com.tourism.dao.interfaces;

import com.tourism.dto.UserNotificationDTO;

public interface IUserNotificationDAO {
	UserNotificationDTO getNotificationByUserId(int userId);
    boolean addNotification(UserNotificationDTO notification);
}
