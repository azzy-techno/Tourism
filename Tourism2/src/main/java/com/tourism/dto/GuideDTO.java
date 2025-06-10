package com.tourism.dto;

public class GuideDTO {
	private int guideId;
	private String name;
	private String language;
	private String email;
	private String phone;
	private String imageUrl;
	private int experienceYears;

	public GuideDTO(int guideId, String name, String email, String phone, String imageUrl, int experienceYears) {
		this.guideId = guideId;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.imageUrl = imageUrl;
		this.experienceYears = experienceYears;
	}

	public GuideDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public int getGuideId() {
		return guideId;
	}

	public void setGuideId(int guideId) {
		this.guideId = guideId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getExperienceYears() {
		return experienceYears;
	}

	public void setExperienceYears(int experienceYears) {
		this.experienceYears = experienceYears;
	}
	
	 public void setExperience(String expStr) {
	        try {
	            this.experienceYears = Integer.parseInt(expStr);
	        } catch(NumberFormatException e) {
	            this.experienceYears = 0; // or handle the error as needed
	        }
	    }

}
