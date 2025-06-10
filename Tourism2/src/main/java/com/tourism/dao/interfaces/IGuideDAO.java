package com.tourism.dao.interfaces;

import com.tourism.dto.GuideDTO;

public interface IGuideDAO {
	GuideDTO getGuideById(int guideId);
    boolean addGuide(GuideDTO guide);
}
