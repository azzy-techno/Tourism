package com.tourism.dao.interfaces;

import com.tourism.dto.LoyaltyProgramDTO;

public interface ILoyaltyProgramDAO {
	LoyaltyProgramDTO getLoyaltyByUserId(int userId);
    boolean updateLoyaltyPoints(int userId, int points);
}
