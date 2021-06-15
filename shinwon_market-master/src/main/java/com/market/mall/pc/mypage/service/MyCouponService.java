package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyCouponService.java
 * @Date : 2014. 7. 10.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 쿠폰함을 처리하는 Service Interface
 * @author LJH
 */
public interface MyCouponService {

    /**
    * <pre>
    * 1. MethodName : selectProductCouponList
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 상품에 1:1 걸려있는 쿠폰
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductCouponList(HttpServletRequest request,Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectCouponListCount
     * 2. ClassName		: MyCouponService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 마이쇼핑 > 쿠폰사용내역 갯수
	 * 4. 작성자			: 이원중
	 * 5. 작성일			: 2020. 6. 19. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCouponListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectCouponUsedList
     * 2. ClassName		: MyCouponService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 마이쇼핑 > 쿠폰사용내역 목록 
	 * 4. 작성자			: 이원중
	 * 5. 작성일			: 2020. 6. 19. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCouponList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponUsableTotalCount
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 등급쿠폰 , 특별쿠폰 갯수
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCouponUsableTotalCount(HttpServletRequest request,Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectShpCouponCount
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 제휴카드 등록여부
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectShpCouponInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertShpCoupon
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 제휴쿠폰 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertShpCoupon(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertDwnCoupon
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 다운로드 쿠폰 발급
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 21.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> insertDwnCoupon(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponProductCount
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 적용상품 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCouponProductCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponProductList
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 쿠폰 적용상품 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCouponProductList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponBrandCount
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 쿠폰 적용 브랜드 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCouponBrandCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponBrandList
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 쿠폰 적용 브랜드 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCouponBrandList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponPlanCount
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 쿠폰 적용 기획전 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCouponPlanCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCouponPlanList
    * 2. ClassName : MyCouponService.java
    * 3. Comment : 쿠폰 적용 기획전 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCouponPlanList(Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectProductDetailCoupon(Map<String, Object> commandMap) throws Exception;
    
    /** 페이퍼 쿠폰 등록 */
	public Map<String, String> registPaperCoupon(HttpServletRequest request, Map<String, Object> commandMap);
	
	/**
	 * <pre>
     * 1. MethodName : selectCouponPlanList
     * 2. ClassName : MyCouponService.java
     * 3. Comment : 프론트 > 주문 > 주문서 > 쿠폰사용 초기화 
     * 4. 작성일 : 2020. 6. 27.
     * </pre>
	 * 
	 * @param commandMap
	 * @throws Exception
	 */
	public void updateCpnReset(Map<String, Object> commandMap)throws Exception;
			
	/**
	 * 
	 * <pre>
     * 1. MethodName : selectCouponPlanList
     * 2. ClassName : MyCouponService.java
     * 3. Comment : 프론트 > 주문 > 상품쿠폰 팝업 > 쿠폰리스트 조회 
     * 4. 작성일 : 2020. 6. 26.
     * </pre> 
	 * 
	 * @param selectCpnMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String ,Object>> selectProdCpnProcAjax(Map<String ,Object> selectCpnMap) throws Exception;		
		
	
	/**
	 *  <pre>
     * 1. MethodName : selectCouponPlanList
     * 2. ClassName : MyCouponService.java
     * 3. Comment : 프론트 > 주문 > 상품쿠폰 팝업 > 주문서에서 쿠폰사용 UPDATE 
     * 4. 작성일 : 2020. 6. 27.
     * </pre>
     * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public boolean cpnUseUpdateProc(Map<String, Object> commandMap) throws Exception;  
}
