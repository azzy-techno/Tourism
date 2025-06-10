package com.tourism.dto;

public class PackageDTO {
    private int packageId;
    private String name;
    private int destinationId;
    private String description;
    private double price;
    private int durationDays;
    private String imageUrl;

    public PackageDTO(int packageId, String name, int destinationId, String description, double price, int durationDays, String imageUrl) {
        this.packageId = packageId;
        this.name = name;
        this.destinationId = destinationId;
        this.description = description;
        this.price = price;
        this.durationDays = durationDays;
        this.imageUrl = imageUrl;
    }

    public PackageDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getPackageId() { return packageId; }
    public void setPackageId(int packageId) { this.packageId = packageId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getDestinationId() { return destinationId; }
    public void setDestinationId(int destinationId) { this.destinationId = destinationId; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getDurationDays() { return durationDays; }
    public void setDurationDays(int durationDays) { this.durationDays = durationDays; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}
