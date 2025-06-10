package com.tourism.service;

import com.tourism.dao.interfaces.IDiscountCodeDAO;
import com.tourism.dto.DiscountCodeDTO;

public class DiscountCodeService {
    private IDiscountCodeDAO discountCodeDAO;

    public DiscountCodeService(IDiscountCodeDAO discountCodeDAO) {
        this.discountCodeDAO = discountCodeDAO;
    }

    public DiscountCodeDTO getDiscountById(int discountId) {
        return discountCodeDAO.getDiscountById(discountId);
    }

    public boolean addDiscountCode(DiscountCodeDTO discountCode) {
        if (discountCode.getValidFrom().after(discountCode.getValidUntil())) {
            throw new IllegalArgumentException("Valid From date must be before Valid Until date.");
        }

        if (discountCode.getDiscountPercentage() <= 0) {
            throw new IllegalArgumentException("Discount percentage must be greater than zero.");
        }

        return discountCodeDAO.addDiscountCode(discountCode);
    }

}
