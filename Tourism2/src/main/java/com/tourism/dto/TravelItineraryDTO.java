package com.tourism.dto;

import java.util.Date;
import java.util.List;

public class TravelItineraryDTO {
    private int itineraryId;
    private int userId;
    private int packageId;
    private List<String> activities;
    private Date startDate;
    private Date endDate;

    public TravelItineraryDTO(int itineraryId, int packageId, List<String> activities, Date startDate, Date endDate) {
        this.itineraryId = itineraryId;
        this.packageId = packageId;
        this.activities = activities;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public TravelItineraryDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getItineraryId() { return itineraryId; }
    public void setItineraryId(int itineraryId) { this.itineraryId = itineraryId; }

    public int getPackageId() { return packageId; }
    public void setPackageId(int packageId) { this.packageId = packageId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public List<String> getActivities() { return activities; }
    public void setActivities(List<String> activities) { this.activities = activities; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
}
