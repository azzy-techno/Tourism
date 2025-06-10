package com.tourism.dto;

public class LoyaltyProgramDTO {
    private int loyaltyId;
    private int userId;
    private int points;
    private String membershipTier;

    public LoyaltyProgramDTO(int loyaltyId, int userId, int points, String membershipTier) {
        this.loyaltyId = loyaltyId;
        this.userId = userId;
        this.points = points;
        this.membershipTier = membershipTier;
    }

    public int getLoyaltyId() { return loyaltyId; }
    public void setLoyaltyId(int loyaltyId) { this.loyaltyId = loyaltyId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getPoints() { return points; }
    public void setPoints(int points) { this.points = points; }

    public String getMembershipTier() { return membershipTier; }
    public void setMembershipTier(String membershipTier) { this.membershipTier = membershipTier; }
}
