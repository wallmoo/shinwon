package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyBuyShoppingService.java
 * @Date : 2016. 1. 19.
 * @프로그램 설명 : 내가 구매한 상품 처리하는 service
 * @author DEV_KIMMINHO    
 */
public interface MyBuyShoppingService {
	
	/**
	* <pre>
	* 1. MethodName : selectProductListCount
	* 2. ClassName : MyBuyShoppingService.java
	* 3. Comment : 주문상품 갯수
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectProductListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectProductList
	* 2. ClassName : MyBuyShoppingService.java
	* 3. Comment : 주문한 상품 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectProductList(Map<String, Object> commandMap) throws Exception;
}
