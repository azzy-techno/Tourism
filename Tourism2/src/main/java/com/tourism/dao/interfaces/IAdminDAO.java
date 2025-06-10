package com.tourism.dao.interfaces;

import com.tourism.dto.AdminDTO;

public interface IAdminDAO {
	AdminDTO getAdminById(int adminId);
    boolean addAdmin(AdminDTO admin);
    AdminDTO authenticateAdmin(String email, String password);
}
