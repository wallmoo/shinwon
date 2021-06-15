package com.epasscni.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MobileUrlConvertor {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 *  URL 맵. 
	 */
	private static final Map<String, String> toConvertUrls;
	    static {
	    	
	    	Map<String, String> urlMap = new HashMap<String, String> ();
	    	urlMap.put("/pc/manager/login.do", "/mobile/manager/login.do");
	    	urlMap.put("/pc/mypage/myOrderCancelBackList.do", "/mobile/mypage/myOrderCancelBackList.do");
	    	urlMap.put("/pc/mypage/myShoppingList.do", "/mobile/mypage/myShoppingList.do");
	    	urlMap.put("/pc/customer/customerMain.do", "/mobile/customer/customerMain.do");
	    	urlMap.put("/pc/product/product.do", "/mobile/product/product.do");
	    	urlMap.put("/pc/brand/brand.do?idx=24", "/mobile/brand/index.do");
	    	urlMap.put("/pc/product/productList.do?idx=1", "/mobile/category/productList.do?idx=275");
	    	urlMap.put("/pc/product/productList.do?idx=2", "/mobile/category/productList.do?idx=169");
	    	urlMap.put("/pc/product/productList.do?idx=3", "/mobile/category/productList.do?idx=170");
	    	urlMap.put("/pc/product/productList.do?idx=4", "/mobile/category/productList.do?idx=171");
	    	urlMap.put("/pc/product/productList.do?idx=5", "/mobile/category/productList.do?idx=269");
	    	urlMap.put("/pc/event/planList.do", "/mobile/event/planList.do");
	    	urlMap.put("/pc/outlet/outlet.do", "/mobile/outlet/outlet.do");
	    	
	    	toConvertUrls = Collections.unmodifiableMap(urlMap);
	    }

	    public static boolean isMobile(HttpServletRequest request){
	    	boolean isMobile = false;
	    	String requestUri = request.getRequestURI().toString();
	    	
	    	//System.out.println("requestUri=============================="+requestUri);
	    	
	    	if(requestUri.indexOf("/am/") >= 0){
	    		String userAgent = request.getHeader("User-Agent");
	    		
	    		//System.out.println("userAgent=============================="+userAgent);
	            
	            String[] mobileos = {"iPhone","iPod","Android","BlackBerry","Windows CE","Nokia","Webos","Opera Mini","SonyEricsson","Opera Mobi","IEMobile"};
	            int j = -1;
	            if(userAgent != null && !userAgent.equals("")){
	            	for(int i=0; i<mobileos.length; i++){
	            		j = userAgent.indexOf(mobileos[i]);
	            		if(j > -1){
	            			isMobile = true;
	            			break;
	            		}
	            	}
	            }
	    	}
            
            return isMobile;
	    }
	    
	    public static String getConvertedUrl(HttpServletRequest request){
	    	String requestUri = request.getRequestURI().toString();
	    	String requestQuery = StringUtil.getString(request.getQueryString(),"");
	    	
	    	String pcUrl = !("").equals(requestQuery) ? requestUri + "?" + requestQuery : requestUri;
	    	
	    	 String mUrl = StringUtil.getString(toConvertUrls.get(pcUrl),"");
	    	 
	    	 //해당 url이 모바일에 없는 경우
	    	 if(("").equals(mUrl)){
	    		 mUrl = pcUrl.replace("/pc/", "/mobile/"); //상품 상세인 경우때문에 수정...
	    	 }
	         
	         String convertedUrl = "http://m.lsnmall.com" + mUrl;
	         
	         //System.out.println("convertedUrl=============================="+convertedUrl);
	     	
	     	return convertedUrl;
	    }

}
