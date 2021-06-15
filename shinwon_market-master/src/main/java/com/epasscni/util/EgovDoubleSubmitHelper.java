package com.epasscni.util;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class EgovDoubleSubmitHelper {
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovDoubleSubmitHelper.class);
		
	public final static String SESSION_TOKEN_KEY = "double_submit_token";
	
	public final static String PARAMETER_NAME = "double_submit";
	
	public final static String DEFAULT_TOKEN_KEY = "DEFAULT";
	
	public static String getNewUUID() {
		return UUID.randomUUID().toString().toUpperCase();
	}
	
	public static boolean checkAndSaveToken() {
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String requestUri = request.getRequestURI().toString();
		return true;
		/**
		 * 중복등록 예외처리할 url은 아래에 등록한다.
		if(requestUri.indexOf("/am/board/faqBoardRegist.do") != -1)
		{
		    return true;
		}
		*/
		/*
		// check session...
		if (session.getAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY) == null) {
	            //throw new RuntimeException("Double Submit Preventer TagLig isn't set. Check JSP.");
	            return false;		        
		}

		String parameter = request.getParameter(EgovDoubleSubmitHelper.PARAMETER_NAME);
		String tokenKey = StringUtil.getString(request.getParameter("tokenKey"),DEFAULT_TOKEN_KEY);
		
		// check parameter
		if (parameter == null) {
	            //throw new RuntimeException("Double Submit Preventer parameter isn't set. Check JSP.");
	            return false;	              
		}
		
		@SuppressWarnings("unchecked")
		Map<String, String> map = (Map<String, String>) session.getAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY);
		
	        if (parameter.equals(map.get(tokenKey))) {
	            
	            LOGGER.debug("[Double Submit] session token ({}) equals to parameter token.", tokenKey);
	            
	            map.put(tokenKey, getNewUUID());
	            
	            return true;
	        }		    

		LOGGER.debug("[Double Submit] session token ({}) isn't equal to parameter token.", tokenKey);
		
		return false;
		*/
	}
}
