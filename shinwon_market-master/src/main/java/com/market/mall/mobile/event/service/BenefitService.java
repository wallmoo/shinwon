package com.market.mall.mobile.event.service;

import java.util.List;
import java.util.Map;

public interface BenefitService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMemberCouponList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 모바일 > 이벤트 > 쿠폰혜택 로그인 회원 사용 가능한 쿠폰 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 3. Comment : 모바일 > 이벤트 > 쿠폰혜택 진행중 쿠폰 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 3. Comment : 모바일 > 이벤트 > 쿠폰혜택 진행중인 쿠폰 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 3. Comment : 모바일 > 이벤트 > 코드 리스트 가져오기  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 3. Comment : 모바일 > 이벤트 > 카드 할부 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 3. Comment : 모바일 > 이벤트 > 카드행사 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 3. Comment : 모바일 > 이벤트 > 카드 코드 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
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
	 * 1. MethodName : selectDivInf
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 모바일 > 이벤트 > 카드혜택 > 카드할부 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 19.
	 * </pre>
	 *
	 * @param strCrdDivIdx
	 * @return
	 * @throws Exception
	 */
	public List	selectDivInfList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCardBannerList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 21.
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
	 * 1. MethodName : selectMyCouponListCount
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 모바일 > 이벤트 > 쿠폰혜택 > 사용가능한 쿠폰  카운트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 22.
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
	 * 1. MethodName : selectMyCouponList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 모바일 > 이벤트 > 쿠폰혜택 > 사용가능한 쿠폰 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 22.
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
	 * 1. MethodName : selectCardOptList
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 모바일 > 이벤트 > 카드 옵션 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 25.
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
	 * 1. MethodName : selectCardBannerTotalCount
	 * 2. ClassName : BenefitService.java
	 * 3. Comment : 모바일 > 배너 카운트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 5. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCardBannerTotalCount(Map<String, Object> commandMap) throws Exception;
}
