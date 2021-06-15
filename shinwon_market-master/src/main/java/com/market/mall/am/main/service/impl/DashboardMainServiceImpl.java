package com.market.mall.am.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.main.service.DashboardMainService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("dashboardMainService")
public class DashboardMainServiceImpl implements DashboardMainService {
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderSummary
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : 관리자 > 메인 > 주문 현황 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 7. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderSummary (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.select("DashboardMain.selectOrderSummary",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderClaim
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : 관리자 > 메인 > 클레임 현황
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderClaim (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.select("DashboardMain.selectOrderClaim",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectProductSelSummaryList
     * 2. ClassName		: BasicProductService.java
     * 3. Comment    : 판매상태별  상품현황
     * 4. 작성자       : DEV_SONGJEONGEUN
     * 5. 작성일       : 2015. 7. 27.
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductSelSummaryList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectProductSelSummaryList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductApvSummaryList
    * 2. ClassName : DashboardMainServiceImpl.java
    * 3. Comment : 입점업체 승인/대기 현황
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductApvSummaryList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectProductApvSummaryList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectEstimateManagementSummaryList
    * 2. ClassName : DashboardMainServiceImpl.java
    * 3. Comment : 견적문의 현황
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEstimateManagementSummaryList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectEstimateManagementSummaryList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMemberSummary
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : 회원 현황
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectMemberSummary (Map<String,Object> commandMap) throws Exception
    {
    	return defaultDAO.select("DashboardMain.selectMemberSummary", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectTaxIvcState
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : 세금계산서 신청 현황
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String,Object> selectTaxIvcState (Map<String,Object> commandMap) throws Exception{
    	return defaultDAO.select("DashboardMain.selectTaxIvcState", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectScmNoticeList
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : 설명추가부분 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectScmNoticeList (Map<String,Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectScmNoticeList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectScmProductInquiryList
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : SCM > 최근 등록한 상품Q&A
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectScmProductInquiryList (Map<String,Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectScmProductInquiryList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectScmProductCommentList
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : SCM > 최근 등록한 상품평
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectScmProductCommentList (Map<String,Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectScmProductCommentList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectScmInquiryList
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : SCM > MarketPlant 문의현황
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectScmInquiryList (Map<String,Object> commandMap) throws Exception{
    	return defaultDAO.selectList("DashboardMain.selectScmInquiryList", commandMap);
    }
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
     @SuppressWarnings("unchecked")
 	 public List<Map<String,Object>> selectMemAdvList (Map<String,Object> commandMap) throws Exception{
     	return defaultDAO.selectList("DashboardMain.selectMemAdvList", commandMap);
     }
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
     @SuppressWarnings("unchecked")
  	 public List<Map<String,Object>> selectEventList (Map<String,Object> commandMap) throws Exception{
      	return defaultDAO.selectList("DashboardMain.selectEventList", commandMap);
     }
    
     /**
    * <pre>
    * 1. MethodName : selectVendorCounselState
    * 2. ClassName  : DashboardMainServiceImpl.java
    * 3. Comment    : 관리자 > 메인 > CS상담/게시물 현황 > 입점상담문의
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorCounselState (Map<String,Object> commandMap) throws Exception
    {
    	 return defaultDAO.select("DashboardMain.selectVendorCounselState", commandMap);
    }
}
