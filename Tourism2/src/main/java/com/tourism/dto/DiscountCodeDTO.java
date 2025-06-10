package com.tourism.dto;

import java.util.Date;

public class DiscountCodeDTO {
    private int discountId;
    private String code;
    private double discountPercentage;
    private Date validFrom;
    private Date validUntil;
    private boolean isActive;

    public DiscountCodeDTO(int discountId, String code, double discountPercentage, Date validFrom, Date validUntil, boolean isActive) {
        this.discountId = discountId;
        this.code = code;
        this.discountPercentage = discountPercentage;
        this.validFrom = validFrom;
        this.validUntil = validUntil;
        this.isActive = isActive;
    }

    public DiscountCodeDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getDiscountId() { return discountId; }
    public void setDiscountId(int discountId) { this.discountId = discountId; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public double getDiscountPercentage() { return discountPercentage; }
    public void setDiscountPercentage(double discountPercentage) { this.discountPercentage = discountPercentage; }

    public Date getValidFrom() { return validFrom; }
    public void setValidFrom(Date validFrom) { this.validFrom = validFrom; }

    public Date getValidUntil() { return validUntil; }
    public void setValidUntil(Date validUntil) { this.validUntil = validUntil; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean isActive) { this.isActive = isActive; }
}
