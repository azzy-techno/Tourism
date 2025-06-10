package com.tourism.dao.interfaces;

import com.tourism.dto.PackageDTO;

public interface IPackageDAO {
	PackageDTO getPackageById(int packageId);
    boolean addPackage(PackageDTO travelPackage);
}
