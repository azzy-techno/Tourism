package com.tourism.service;

import com.tourism.dao.interfaces.IPackageDAO;
import com.tourism.dto.PackageDTO;

public class PackageService {
    private IPackageDAO packageDAO;

    public PackageService(IPackageDAO packageDAO) {
        this.packageDAO = packageDAO;
    }

    public PackageDTO getPackageById(int packageId) {
        return packageDAO.getPackageById(packageId);
    }

    public boolean addPackage(PackageDTO travelPackage) {
        if (travelPackage.getPrice() < 100) {
            throw new IllegalArgumentException("Package price must be at least 100.");
        }
        
        if (travelPackage.getDescription() == null || travelPackage.getDescription().isEmpty()) {
            throw new IllegalArgumentException("Package description cannot be empty.");
        }

        return packageDAO.addPackage(travelPackage);
    }

}
