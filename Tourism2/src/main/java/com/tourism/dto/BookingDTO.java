package com.tourism.dto;

import java.util.Date;

public class BookingDTO {
    private int bookingId;
    private int userId;
    private int packageId;
    private Date bookingDate;
    private String status;
    private String paymentStatus;
    private Date startDate;
    private Date endDate;

    public BookingDTO(int bookingId, int userId, int packageId, Date bookingDate, String status, String paymentStatus) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.packageId = packageId;
        this.bookingDate = bookingDate;
        this.status = status;
        this.paymentStatus = paymentStatus;
    }
    
    public BookingDTO() {
    }
    
    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getPackageId() { return packageId; }
    public void setPackageId(int packageId) { this.packageId = packageId; }

    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
}
