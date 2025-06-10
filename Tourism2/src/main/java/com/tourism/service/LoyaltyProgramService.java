package com.tourism.service;

import com.tourism.dao.interfaces.ILoyaltyProgramDAO;
import com.tourism.dto.LoyaltyProgramDTO;

public class LoyaltyProgramService {
    private ILoyaltyProgramDAO loyaltyProgramDAO;

    public LoyaltyProgramService(ILoyaltyProgramDAO loyaltyProgramDAO) {
        this.loyaltyProgramDAO = loyaltyProgramDAO;
    }

    public LoyaltyProgramDTO getLoyaltyByUserId(int userId) {
        return loyaltyProgramDAO.getLoyaltyByUserId(userId);
    }

    public boolean updateLoyaltyPoints(int userId, int points) {
        if (points < 0) {
            throw new IllegalArgumentException("Points cannot be negative.");
        }

        LoyaltyProgramDTO existingLoyalty = loyaltyProgramDAO.getLoyaltyByUserId(userId);
        if (existingLoyalty == null) {
            throw new IllegalArgumentException("User not enrolled in loyalty program.");
        }

        return loyaltyProgramDAO.updateLoyaltyPoints(userId, points);
    }

}
