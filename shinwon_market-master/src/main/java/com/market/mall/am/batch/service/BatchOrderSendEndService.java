package com.market.mall.am.batch.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchOrderSendEndService.java
 * @Date : 2015. 7. 8.
 * @프로그램 설명 : 관리자 > 자동배송완료를 처리하는 Service Class
 * @author DEV_KANGHYUNKYU
 */
public interface BatchOrderSendEndService {
	
	/**
	* <pre>
	* 1. MethodName : selectSendingOrder
	* 2. ClassName  : BatchOrderDeliveryEndService.java
	* 3. Comment    : 관리자 > 배치작업 - 배송중 주문 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 7. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectSendingOrder(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateSendingOrder
	* 2. ClassName  : BatchOrderDeliveryEndService.java
	* 3. Comment    : 관리자 > 배치작업 - 배송중 주문 배송완료 처리
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 7. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateSendingOrder(Map<String, Object> commandMap) throws Exception ;

}
