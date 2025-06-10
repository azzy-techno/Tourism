package com.tourism.dao.interfaces;

import com.tourism.dto.UserDTO;

public interface IUserDAO {
    UserDTO getUserById(int userId);
    boolean addUser(UserDTO user);
    UserDTO authenticateUser(String email, String password);
}
