package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchOrderDepositAlarmService.java
 * @Date : 2016. 3. 14.
 * @프로그램 설명 : 입금대기 주문 입금요청 Class
 * @author DEV_KANGHYUNKYU
 */
public interface BatchOrderDepositAlarmService {

	/**
	* <pre>
	* 1. MethodName : updateOrderDepositAlarm
	* 2. ClassName  : BatchOrderDepositAlarmService.java
	* 3. Comment    : 입금대기 주문 입금요청
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateOrderDepositAlarm(Map<String, Object> commandMap) throws Exception ;	
	
}
