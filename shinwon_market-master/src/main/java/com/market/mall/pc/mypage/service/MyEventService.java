package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MyEventService {
	
	/**
	* <pre>
	* 1. MethodName : selectMyEventListCount
	* 2. ClassName : MyEventService.java
	* 3. Comment : 내가 참여한 이벤트 카운트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyEventListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMyEventList
	* 2. ClassName : MyEventService.java
	* 3. Comment : 내가 참여한 이벤트 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectMyEventList(Map<String, Object> commandMap) throws Exception;
}
