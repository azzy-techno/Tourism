package com.tourism.service;

import com.tourism.dao.interfaces.ITravelItineraryDAO;
import com.tourism.dto.TravelItineraryDTO;

public class TravelItineraryService {
    private ITravelItineraryDAO travelItineraryDAO;

    public TravelItineraryService(ITravelItineraryDAO travelItineraryDAO) {
        this.travelItineraryDAO = travelItineraryDAO;
    }

    public TravelItineraryDTO getItineraryById(int itineraryId) {
        return travelItineraryDAO.getItineraryById(itineraryId);
    }

    public boolean addItinerary(TravelItineraryDTO itinerary) {
        if (itinerary.getStartDate().after(itinerary.getEndDate())) {
            throw new IllegalArgumentException("Start date must be before end date.");
        }

        if (itinerary.getActivities() == null || itinerary.getActivities().size() == 0) {
            throw new IllegalArgumentException("Itinerary must include at least one activity.");
        }

        return travelItineraryDAO.addItinerary(itinerary);
    }

}
	