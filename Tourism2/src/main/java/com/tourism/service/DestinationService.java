package com.tourism.service;

import com.tourism.dao.interfaces.IDestinationDAO;
import com.tourism.dto.DestinationDTO;

public class DestinationService {
    private IDestinationDAO destinationDAO;

    public DestinationService(IDestinationDAO destinationDAO) {
        this.destinationDAO = destinationDAO;
    }

    public DestinationDTO getDestinationById(int destinationId) {
        return destinationDAO.getDestinationById(destinationId);
    }

    public boolean addDestination(DestinationDTO destination) {
        // Business logic validation before inserting into DB
        return destinationDAO.addDestination(destination);
    }
}
