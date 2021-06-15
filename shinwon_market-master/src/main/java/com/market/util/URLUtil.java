package com.market.util;

import javax.servlet.ServletRequest;

public class URLUtil {

	public static String getUrl(ServletRequest request) {
		String uri = request.getScheme() + "://" +
	             request.getServerName() + 
	             ":" + request.getServerPort();
		return uri;
	}
}
