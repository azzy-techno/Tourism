package com.tourism.servlet;

import com.tourism.dto.DiscountCodeDTO;
import com.tourism.service.DiscountCodeService;
import com.tourism.dao.DiscountCodeDAO;
import com.tourism.dao.interfaces.IDiscountCodeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DiscountCodeServlet extends HttpServlet {
    private DiscountCodeService discountCodeService;

    @Override
    public void init() {
        IDiscountCodeDAO discountCodeDAO = new DiscountCodeDAO();
        discountCodeService = new DiscountCodeService(discountCodeDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
        String validFromStr = request.getParameter("validFrom");
        String validUntilStr = request.getParameter("validUntil");

        if (discountPercentage <= 0) {
            response.getWriter().write("Error: Discount percentage must be greater than zero.");
            return;
        }

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date validFrom = dateFormat.parse(validFromStr);
            Date validUntil = dateFormat.parse(validUntilStr);

            if (validFrom.after(validUntil)) {
                response.getWriter().write("Error: Valid From date must be before Valid Until date.");
                return;
            }

            DiscountCodeDTO discountCode = new DiscountCodeDTO();
            discountCode.setCode(code);
            discountCode.setDiscountPercentage(discountPercentage);
            discountCode.setValidFrom(validFrom);
            discountCode.setValidUntil(validUntil);

            boolean success = discountCodeService.addDiscountCode(discountCode);
            response.getWriter().write(success ? "Discount Code Added Successfully" : "Error Adding Discount Code");

        } catch (Exception e) {
            response.getWriter().write("Error: Invalid date format. Use YYYY-MM-DD.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int discountId = Integer.parseInt(request.getParameter("discountId"));
        DiscountCodeDTO discountCode = discountCodeService.getDiscountById(discountId);

        if (discountCode != null) {
            response.getWriter().write("Discount Code Found: " + discountCode.getCode() + ", Percentage: " + discountCode.getDiscountPercentage());
        } else {
            response.getWriter().write("Discount Code Not Found");
        }
    }
}
