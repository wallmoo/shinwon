package com.epasscni.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class UrlTypeUtil {
    
     public static String getBaseWildCardUrl() {
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
         return getBaseWildCardUrl(request);
      }
     public static String getBaseWildCardUrl(HttpServletRequest request) {
        String host = request.getServerName();
        return host+getServerPort(request)+request.getContextPath();
     }
      public static String getRedirectPage(HttpServletRequest request) {
         String beforeUrl = getBaseWildCardUrl(request)+request.getServletPath();
        return beforeUrl;
      }
      public static String getServerPort(HttpServletRequest request) {
         String port = null;
         if(request.getServerPort()==80||request.getServerPort()==443) {
           port="";
        }
        else {
           port=":"+request.getServerPort();
        }
         return port;
      }

}
