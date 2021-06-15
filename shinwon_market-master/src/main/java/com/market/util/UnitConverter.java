/**
 * @PackageName: com.market.util
 * @FileName : UnitConverter.java
 * @Date : 2015. 12. 4.
 * @프로그램 설명 : 단위 변환 Util Class
 * @author freelsj
 */

package com.market.util;


public class UnitConverter {

	public static float fahrenheit2Celsius(float fahrenheit) {
		return Float.parseFloat(String.format("%.2f", ((fahrenheit - 32) / 1.8), 1));
	}
	
	public static float milesPerHour2MetersPerSecond(float milesPerHour) {
		return Float.parseFloat(String.format("%.2f", (milesPerHour * 0.44704), 1));
	}
}
