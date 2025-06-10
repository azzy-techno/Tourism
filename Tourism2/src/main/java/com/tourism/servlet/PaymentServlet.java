package com.tourism.servlet;

import com.tourism.dto.PaymentDTO;
import com.tourism.service.PaymentService;
import com.tourism.dao.PaymentDAO;
import com.tourism.dao.interfaces.IPaymentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PaymentServlet extends HttpServlet {
    private PaymentService paymentService;

    @Override
    public void init() {
        IPaymentDAO paymentDAO = new PaymentDAO();
        paymentService = new PaymentService(paymentDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        double amount = Double.parseDouble(request.getParameter("amount"));

        if (amount <= 0) {
            response.getWriter().write("Error: Payment amount must be greater than zero.");
            return;
        }

        PaymentDTO payment = new PaymentDTO();
        payment.setBookingId(bookingId);
        payment.setAmount(amount);

        boolean success = paymentService.processPayment(payment);
        response.getWriter().write(success ? "Payment Processed Successfully" : "Error Processing Payment");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        PaymentDTO payment = paymentService.getPaymentById(paymentId);

        if (payment != null) {
            response.getWriter().write("Payment Found: Amount - " + payment.getAmount());
        } else {
            response.getWriter().write("Payment Not Found");
        }
    }
}
