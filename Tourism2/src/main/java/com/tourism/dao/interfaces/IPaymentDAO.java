package com.tourism.dao.interfaces;

import com.tourism.dto.PaymentDTO;

public interface IPaymentDAO {
	PaymentDTO getPaymentById(int paymentId);
    boolean addPayment(PaymentDTO payment);
}
