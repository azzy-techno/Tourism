package com.tourism.service;

import com.tourism.dao.interfaces.IGuideDAO;
import com.tourism.dto.GuideDTO;

public class GuideService {
    private IGuideDAO guideDAO;

    public GuideService(IGuideDAO guideDAO) {
        this.guideDAO = guideDAO;
    }

    public GuideDTO getGuideById(int guideId) {
        return guideDAO.getGuideById(guideId);
    }

    public boolean addGuide(GuideDTO guide) {
        // Business logic validation before inserting into DB
        return guideDAO.addGuide(guide);
    }
}
