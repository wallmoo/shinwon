package com.market.mall.pc.theme.category.service;

import java.util.Map;

public interface CleanKingService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectCleanKingMain
	 * 2. ClassName : CleanKingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 클린킹 > 메인 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCleanKingMain(Map<String, Object> commandMap)throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertDirectPurchase
	 * 2. ClassName : CleanKingService.java
	 * 3. Comment : 프론트 > 테마카테고리 > 클린킹 > 바로구매 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertDirectPurchase(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : deleteDirectCart
	 * 2. ClassName : CleanKingService.java
	 * 3. Comment : 프론트 > 테마 카테고리 > 클린킹 > 바로 구매
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int deleteDirectCart(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertTempOrder
	 * 2. ClassName : CleanKingService.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String insertTempOrder(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertCart
	 * 2. ClassName : CleanKingService.java
	 * 3. Comment : 프론트 > 테마 카테고리 > 클린킹 > 장바구니
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertCart(Map<String, Object> commandMap) throws Exception;

}
