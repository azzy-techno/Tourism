package com.tourism.dao.interfaces;

import com.tourism.dto.DestinationDTO;

public interface IDestinationDAO {
	 DestinationDTO getDestinationById(int destinationId);
	 boolean addDestination(DestinationDTO destination);
}
