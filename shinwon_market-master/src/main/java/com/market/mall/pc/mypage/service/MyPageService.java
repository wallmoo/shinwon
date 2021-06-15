package com.market.mall.pc.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyPageService.java
 * @Date : 2014. 7. 8.
 * @프로그램 설명 : 프론트 > 마이페이지를 처리하는 Service Interface
 * @author LJH
 */
public interface MyPageService {

	/**
	 * <pre>
	 * 1. MethodName	: selectMyPageSummary
	 * 2. ClassName		: MyPageService.java
     * 3. Comment    	: 프론트 > 마이페이지 요약정보
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 9. 오후 4:57:22
	 * </pre>
	 *
	 * @return Map<String,Object>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectMyPageSummary (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    public Map<String, Object> selectMyPageTotCnt(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectMyPageLikList(Map<String, Object> commandMap) throws Exception;   
    public List<Map<String, Object>> restockNotificationList(Map<String, Object> commandMap) throws Exception;   
    public int restockNotificationListCount(Map<String, Object> commandMap) throws Exception ;
    public List<Map<String, Object>> selectMyPageOotdList(Map<String, Object> commandMap) throws Exception ;
    
    /**
    * <pre>
    * 1. MethodName : selectMyPageOrderListCount
    * 2. ClassName  : MyPageService.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인 (주문내역 개수)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyPageOrderListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageOrderList
     * 2. ClassName		: MyPageService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 메인 (주문내역)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 1:51:18
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyPageOrderList (Map<String, Object> commandMap) throws Exception;

    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageCancelBackCount
     * 2. ClassName		: MyPageService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 메인 (취소/반품 현황)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 4:59:19
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMyPageCancelBackCount (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageMyInfo
     * 2. ClassName		: MyPageService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 메인 (나의 정보)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 5:31:22
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMyPageMyInfo (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageInquiryList
     * 2. ClassName		: MyPageService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 메인 (나의 문의내역)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 3:13:18
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyPageInquiryList (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPageCartList
     * 2. ClassName		: MyPageService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 메인 (장바구니)
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 14. 오후 4:32:13
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyPageCartList (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductInquiryList
    * 2. ClassName : MyPageService.java
    * 3. Comment : 프론트 > 마이페이지 > 메인 (상품Q&A)
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 5. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductInquiryList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyPageOrderInfo
    * 2. ClassName  : MyPageService.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인 (배송현황)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMyPageOrderInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectKingerCount
    * 2. ClassName  : MyPageService.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인(킹저 여부)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerCount (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectkingerProductCommentList
    * 2. ClassName  : MyPageService.java
    * 3. Comment    : 프론트 > 마이페이지 > 메인(킹저의 상품후기 갯수 및 IDX)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectkingerProductCommentList (Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> selectMyFitAllCatList (Map<String,Object> commandMap) throws Exception;
    public List<Map<String,Object>> selectMyFitInfoList (Map<String,Object> commandMap) throws Exception;
    public void insertMyFitInfo (@SuppressWarnings("rawtypes") List<HashMap> commandMap) throws Exception;
    public Map<String,Object> selectMyRefundAccount(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    public int updateUserPhoneNumber(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectReplyList(Map<String, Object> commandMap) throws Exception;
	public int selectMyReplyListCount(Map<String, Object> commandMap);
}
