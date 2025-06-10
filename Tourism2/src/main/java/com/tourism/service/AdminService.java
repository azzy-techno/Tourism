package com.tourism.service;

import com.tourism.dao.interfaces.IAdminDAO;
import com.tourism.dto.AdminDTO;

public class AdminService {
    private IAdminDAO adminDAO;

    public AdminService(IAdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public AdminDTO getAdminById(int adminId) {
        return adminDAO.getAdminById(adminId);
    }

    public boolean registerAdmin(AdminDTO admin) {
        // Business logic validation can be added here before calling DAO
        return adminDAO.addAdmin(admin);
    }
    
    public AdminDTO authenticateAdmin(String email, String password) {
        return adminDAO.authenticateAdmin(email, password);
    }
}
