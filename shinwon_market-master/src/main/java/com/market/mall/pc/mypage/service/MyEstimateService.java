package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyEstimateService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateCount
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > My 견적 수  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 2.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectMyEstimateCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateList
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 >  My 견적 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 2.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyEstimateList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateInfo
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 2.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectMyEstimateInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimatePrdList
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment :  MY LAND > 쇼핑활동 > MY 견적 > 상세 > 상품 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyEstimatePrdList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateReplyList
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 상세 > 상품 댓글 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyEstimateReplyList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertMyEstimateComment
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 상세 > 상품 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertMyEstimateComment(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateMyEstimateChoiceAjax
	 * 2. ClassName : MyEstimateService.java
	 * 3. Comment : MY LAND > 쇼핑활동 > MY 견적 > 구매 확정
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateMyEstimateChoiceAjax(Map<String, Object> commandMap) throws Exception;

}
