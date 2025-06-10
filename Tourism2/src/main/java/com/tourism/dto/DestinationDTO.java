package com.tourism.dto;

public class DestinationDTO {
    private int destinationId;
    private String name;
    private String description;
    private String imageUrl;
    private String location;

    public DestinationDTO(int destinationId, String name, String description, String imageUrl, String location) {
        this.destinationId = destinationId;
        this.name = name;
        this.description = description;
        this.imageUrl = imageUrl;
        this.location = location;
    }

    public DestinationDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
}
