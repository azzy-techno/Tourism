package com.tourism.dao.interfaces;

import com.tourism.dto.TravelItineraryDTO;

public interface ITravelItineraryDAO {
	 TravelItineraryDTO getItineraryById(int itineraryId);
	 boolean addItinerary(TravelItineraryDTO itinerary);
}
