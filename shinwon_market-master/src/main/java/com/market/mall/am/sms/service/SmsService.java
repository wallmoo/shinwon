package com.market.mall.am.sms.service;

import java.util.List;
import java.util.Map;

public interface SmsService {
	
	/**
	* <pre>
	* 1. MethodName : selectSmsLogListCount
	* 2. ClassName  : SmsService.java
	* 3. Comment    : sms 발송 내역 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2015. 2. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectSmsLogListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectSmsLogList
	* 2. ClassName  : SmsService.java
	* 3. Comment    : sms 발송 내역 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2015. 2. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectSmsLogList(Map<String, Object> commandMap) throws Exception;
}
