package com.market.util;

public class CodeToWordConverter {
	public static String productStatusToWord(String productStatus) {
		if("I".equals(productStatus)) {
			return "판매 중";
		}
		else if("O".equals(productStatus)) {
			return "임시품절";
		}
		else if("T".equals(productStatus)) {
			return "품절상품";
		}
		return "미판매";
	}
}
