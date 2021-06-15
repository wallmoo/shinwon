package com.epasscni.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IeEmulateFilter implements Filter {

	 public void destroy() {}
	 
	    public void doFilter(ServletRequest servRequest, ServletResponse servResponse,
	            FilterChain chain) throws IOException, ServletException {
	        
	        HttpServletRequest req = (HttpServletRequest)servRequest;
	        HttpServletResponse res = (HttpServletResponse)servResponse;
	        
	        String userAgent = req.getHeader("User-Agent");
	        
	        if(userAgent.indexOf("MSIE")!=-1 || userAgent.indexOf("Trident")!=-1) //    IE일때
	                res.setHeader("X-UA-Compatible", "IE=8");
	        
	        chain.doFilter(req, res);
	    }
	 
	    public void init(FilterConfig config) throws ServletException {}
}
