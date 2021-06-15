package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : EstimateManagementService.java
 * @Date : 2015. 10. 20.
 * @프로그램 설명 : 견적관리를 처리하는 Service Class
 * @author DEV_KIMMINHO    
 */
public interface EstimateManagementService {
	
	
	/**
	* <pre>
	* 1. MethodName : selectEstimateManagementListCount
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적관리 목록 갯수
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectEstimateManagementListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectEstimateManagementList
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적관리 목록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectEstimateManagementList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertEstimateManagement
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : MD직접 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertEstimateManagement (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectestimateManagementInfo
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적 상세 및 상품리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectestimateManagementInfo (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertEstimatePurchase
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 상품에 대한 구매여부 및 상품견적 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertEstimatePurchase (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateEstimatePurchase
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적승인수정 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateEstimatePurchase (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateEstimatePurchase
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적에 대한 사용유무 수정
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateEstimateManagement (Map<String, Object> commandMap) throws Exception;
	
	
	/**
	* <pre>
	* 1. MethodName : insertEstimateManagementRepAjax
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적관리 댓글등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertEstimateManagementRepAjax (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : estimateManagementRepListAjax
	* 2. ClassName : EstimateManagementService.java
	* 3. Comment : 견적관리 댓글 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 11. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> estimateManagementRepListAjax (Map<String, Object> commandMap) throws Exception;

}
