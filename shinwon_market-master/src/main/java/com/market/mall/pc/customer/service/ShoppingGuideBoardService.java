package com.market.mall.pc.customer.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.customer.service
 * @FileName : ShoppingGuideBoardService.java
 * @Date : 2014. 7. 23.
 * @프로그램 설명 : 프론트 > 고객센터 > 쇼핑가이드를 처리하는 Service Interface
 * @author kanghk
 */
public interface ShoppingGuideBoardService {
	
	/**
	* <pre>
	* 1. MethodName : selectShoppingGuideBoardList
	* 2. ClassName  : ShoppingGuideBoardService.java
	* 3. Comment    : 쇼핑가이드 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectShoppingGuideBoardList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectShoppingGuideBoardInfo
	* 2. ClassName  : ShoppingGuideBoardService.java
	* 3. Comment    : 쇼핑가이드 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectShoppingGuideBoardInfo (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectProductGuideBoardInfoList
	* 2. ClassName  : ShoppingGuideBoardService.java
	* 3. Comment    : 상품가이드 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectProductGuideBoardInfoList (Map<String, Object> commandMap) throws Exception;

}
