package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : ProductNotificationInfoService.java
 * @Date : 2015. 10. 21.
 * @프로그램 설명 : 상품고시관리를 처리하는 Service Inerface
 * @author DEV_KIMMINHO    
 */
public interface ProductNotificationInfoService {
	
	/**
	* <pre>
	* 1. MethodName : selectCommonCodeManagerListCount
	* 2. ClassName : ProductNotificationInfoService.java
	* 3. Comment : 상품고시관리 목록 갯수
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectProductNotificationInfoListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCommonCodeManagerList
	* 2. ClassName : ProductNotificationInfoService.java
	* 3. Comment : 설명추가부분 
	* 4. 작성자 : 상품고시관리 목록
	* 5. 작성일 : 2015. 10. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectProductNotificationInfoList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertProductNotificationInfo
	* 2. ClassName : ProductNotificationInfoService.java
	* 3. Comment : 상품고시정보 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertProductNotificationInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectproductNotificationInfo
	* 2. ClassName : ProductNotificationInfoService.java
	* 3. Comment : 품목 상세
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectproductNotificationInfoTop (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectproductNotificationInfo
	* 2. ClassName : ProductNotificationInfoService.java
	* 3. Comment : 품목에 대한 항목 상세
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectproductNotificationInfo (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateCommonCodeManager
	* 2. ClassName : ProductNotificationInfoService.java
	* 3. Comment : 상품고시 수정
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateproductNotificationInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	

}
