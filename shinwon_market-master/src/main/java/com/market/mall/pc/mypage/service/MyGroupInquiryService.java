package com.market.mall.pc.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MyGroupInquiryService 
{
	
    /**
    * <pre>
    * 1. MethodName : selectMyGroupInquiryListCount
    * 2. ClassName : MyGroupInquiryService.java
    * 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 목록 갯수
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 7. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyGroupInquiryListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyGroupInquiryList
    * 2. ClassName : MyGroupInquiryService.java
    * 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 목록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 7. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMyGroupInquiryList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyGroupInquiryInfo
    * 2. ClassName : MyGroupInquiryService.java
    * 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 상세보기
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 7. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectMyGroupInquiryInfo (HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
    
}
