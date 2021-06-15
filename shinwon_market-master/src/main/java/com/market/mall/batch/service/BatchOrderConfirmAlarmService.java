package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchOrderConfirmAlarmService.java
 * @Date : 2016. 3. 15.
 * @프로그램 설명 : 배송완료+1 구매확정 요청 메일 발송 Class
 * @author DEV_KANGHYUNKYU
 */
public interface BatchOrderConfirmAlarmService {

	/**
	* <pre>
	* 1. MethodName : updateOrderConfirmAlarm
	* 2. ClassName  : BatchOrderConfirmAlarmService.java
	* 3. Comment    : 배송완료+1 구매확정 요청 메일 발송
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateOrderConfirmAlarm(Map<String, Object> commandMap) throws Exception ;	
	
}
