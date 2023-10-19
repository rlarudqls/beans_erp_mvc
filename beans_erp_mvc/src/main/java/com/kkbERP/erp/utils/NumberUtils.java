package com.kkbERP.erp.utils;

import java.text.DecimalFormat;

public class NumberUtils {

	private static DecimalFormat numberWithComma = new DecimalFormat("#,###");

	public static String numberWithComma(Integer number) {
		if (number == null) {
			return null;
		}
		return numberWithComma.format(number);
	}

	public static int ceil(double num1, double num2) {
		return (int) Math.ceil(num1 / num2);
	}

}
