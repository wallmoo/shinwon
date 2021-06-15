package com.market.mall.am.main.service;

import java.util.List;
import java.util.Map;

public interface DashboardMainService {

	/**
	* <pre>
	* 1. MethodName : selectOrderSummary
	* 2. ClassName  : DashboardMainService.java
	* 3. Comment    : 관리자 > 메인 > 주문 현황 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 7. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectOrderSummary (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectOrderClaim
	* 2. ClassName  : DashboardMainService.java
	* 3. Comment    : 관리자 > 메인 > 클레임 현황
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectOrderClaim (Map<String, Object> commandMap) throws Exception;
	
    /**
    * <pre>
    * 1. MethodName : selectProductSelSummaryList
    * 2. ClassName : DashboardMainService.java
    * 3. Comment : 판매상태별  상품현황
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductSelSummaryList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductApvSummaryList
    * 2. ClassName : DashboardMainService.java
    * 3. Comment : 입점업체 승인/대기 현황
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductApvSummaryList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectEstimateManagementSummaryList
    * 2. ClassName : DashboardMainService.java
    * 3. Comment : 견적문의 현황
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectEstimateManagementSummaryList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMemberSummary
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : 회원 현황
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectMemberSummary (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectTaxIvcState
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : 세금계산서 신청 현황
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectTaxIvcState (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectScmNoticeList
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : SCM > MarketPlant 공지사항
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectScmNoticeList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectScmProductInquiryList
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : SCM > 최근 등록한 상품Q&A
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectScmProductInquiryList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectScmProductCommentList
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : SCM > 최근 등록한 상품평
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectScmProductCommentList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectScmInquiryList
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : SCM > MarketPlant 문의현황
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectScmInquiryList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMemAdvList
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : Dashboard > CS상담/게시물현황
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 2. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
 	public List<Map<String,Object>> selectMemAdvList (Map<String,Object> commandMap) throws Exception;
 	
 	/**
    * <pre>
    * 1. MethodName : selectEventList
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : Dashboard > 이벤트현황
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 2. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectEventList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectVendorCounselState
    * 2. ClassName  : DashboardMainService.java
    * 3. Comment    : 관리자 > 메인 > CS상담/게시물현황 > 입점상담문의
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectVendorCounselState (Map<String,Object> commandMap) throws Exception;
    
}
