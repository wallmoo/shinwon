package com.market.mall.pc.event.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BenefitService {
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMemberCouponList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 로그인 회원 사용 가능한 쿠폰 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMemberCouponList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCouponListCount
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 진행중 쿠폰 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
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
	 * 1. MethodName : selectCouponList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 진행중인 쿠폰 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCouponList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardEventList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 코드 리스트 가져오기  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 27.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCommonCodeList(String code) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardDivList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 카드 할부 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 27.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCardDivList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardEventList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 카드행사 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 27.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCardEventList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardCodeList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 카드 코드 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 27.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCardCodeList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardOptList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 카드 옵션 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 8.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCardOptList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardBannerInfo
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 카드혜택 상단 배너  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectCardBannerInfo(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardBannerList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectCardBannerList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectProductCouponList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 다운로드 쿠폰 팝업 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectProductCouponList(HttpServletRequest request,
			Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyCouponList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 > 사용가능한 쿠폰 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyCouponList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyCouponListCount
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 > 사용가능한 쿠폰  카운트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectMyCouponListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCouponInfo
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 이벤트 > 쿠폰 상세 정보  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectCouponInfo(Map<String, Object> commandMap) throws Exception;

}
