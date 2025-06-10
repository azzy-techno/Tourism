package com.tourism.dao.interfaces;

import com.tourism.dto.DiscountCodeDTO;

public interface IDiscountCodeDAO {
	DiscountCodeDTO getDiscountById(int discountId);
    boolean addDiscountCode(DiscountCodeDTO discountCode);
}
