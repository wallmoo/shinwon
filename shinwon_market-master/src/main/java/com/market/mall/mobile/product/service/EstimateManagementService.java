package com.market.mall.mobile.product.service;

import java.util.List;
import java.util.Map;

public interface EstimateManagementService {
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEsmCartCnt
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적 장바구니 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEsmCartCnt(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateList
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적 장바구니 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
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
	 * 1. MethodName : selectEsmCartOptDetailList
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적 옵션 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectEsmCartOptDetailList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateKeepingList
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 키핑 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyEstimateKeepingList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateCartList
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 장바구니 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyEstimateCartList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateKeepingListCount
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 키핑 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectMyEstimateKeepingListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateCartListCount
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 장바구니 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectMyEstimateCartListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateCateListCount
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 카테고리 리스트 수  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectMyEstimateCateListCount(Map<String, Object> commandMap) throws Exception;;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectMyEstimateCateList
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 카테고리 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectMyEstimateCateList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : deleteMyEstimateDelAjax
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적 장바구니 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int deleteMyEstimateDelAjax(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertMyEstimateProcess
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적요청 처리
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertMyEstimateProcess(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEsmCart
	 * 2. ClassName : EstimateManagementService.java
	 * 3. Comment : 모바일 > 나만의 견적 > 견적 장바구니 등록  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 5. 29.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertEsmCart(Map<String, Object> commandMap) throws Exception;
}
