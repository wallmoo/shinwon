package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.member.service
 * @FileName : LmsHistoryService.java
 * @Date : 2015. 11. 3.
 * @프로그램 설명 : 관리자 > 회원관리 > LMS이력을 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface LmsHistoryService {
	
	/**
	* <pre>
	* 1. MethodName : selectLmsHistoryListCount
	* 2. ClassName  : LmsHistoryService.java
	* 3. Comment    : 관리자 > 회원관리 > LMS이력 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectLmsHistoryListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectLmsHistoryList
	* 2. ClassName  : LmsHistoryService.java
	* 3. Comment    : 관리자 > 회원관리 > LMS이력 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectLmsHistoryList (Map<String,Object> commandMap) throws Exception;

}
