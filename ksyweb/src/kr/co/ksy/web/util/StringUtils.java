package kr.co.ksy.web.util;

public class StringUtils {
	
	public static int stringToInt(String value, int defaultValue) {
		if (value == null) {
			return defaultValue;
		}
		
		try {
			return Integer.parseInt(value);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}
	
	public static int stringToInt(String value) {
		return stringToInt(value, 0);
	}
	
	public static long stringToLong(String value, long defaultValue) {
		if (value == null) {
			return defaultValue;
		}
		
		try {
			return Long.parseLong(value);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}
	
	public static long stringToLong(String value) {
		return stringToLong(value, 0L);
	}
	
	public static double stringToDouble(String value, double defaultValue) {
		if (value == null) {
			return defaultValue;
		}
		
		try {
			return Double.parseDouble(value);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}
	
	public static double stringToDouble(String value) {
		return stringToDouble(value, 0.0);
	}
}
