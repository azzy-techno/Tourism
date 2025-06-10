package com.tourism.service;

import com.tourism.dao.interfaces.IBookingDAO;
import com.tourism.dao.interfaces.IPaymentDAO;
import com.tourism.dto.BookingDTO;
import com.tourism.dto.PaymentDTO;

public class PaymentService {
    private IPaymentDAO paymentDAO;
    private IBookingDAO bookingDAO;

    public PaymentService(IPaymentDAO paymentDAO) {
        this.paymentDAO = paymentDAO;
    }

    public PaymentDTO getPaymentById(int paymentId) {
        return paymentDAO.getPaymentById(paymentId);
    }

    public boolean processPayment(PaymentDTO payment) {
        if (payment.getAmount() <= 0) {
            throw new IllegalArgumentException("Payment amount must be greater than zero.");
        }

        BookingDTO booking = bookingDAO.getBookingById(payment.getBookingId());
        if (booking == null) {
            throw new IllegalArgumentException("Invalid booking reference.");
        }

        return paymentDAO.addPayment(payment);
    }

}
