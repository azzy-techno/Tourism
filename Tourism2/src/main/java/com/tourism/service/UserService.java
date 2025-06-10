package com.tourism.service;

import com.tourism.dao.interfaces.IUserDAO;
import com.tourism.dto.UserDTO;

public class UserService {
    private IUserDAO userDAO;

    public UserService(IUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public UserDTO getUserById(int userId) {
        return userDAO.getUserById(userId);
    }

    	public boolean registerUser(UserDTO user) {
    	    if (user.getEmail() == null || user.getEmail().isEmpty()) {
    	        throw new IllegalArgumentException("Email cannot be empty.");
    	    }

    	    UserDTO existingUser = userDAO.getUserById(user.getUserId());
    	    if (existingUser != null) {
    	        throw new IllegalArgumentException("User already exists.");
    	    }

    	    return userDAO.addUser(user);

    }
    	public UserDTO authenticateUser(String email, String password) {
            return userDAO.authenticateUser(email, password);
        }
}
