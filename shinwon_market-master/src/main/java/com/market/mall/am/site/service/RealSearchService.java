package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : RealSearchService.java
 * @Date : 2015. 5. 6.
 * @프로그램 설명 : 관리자 > 사이트관리 > 실시간 검색어 관리를 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface RealSearchService 
{
	/**
	* <pre>
	* 1. MethodName : selectRealSearchListCount
	* 2. ClassName : RealSearchService.java
	* 3. Comment : 관리자 > 사이트관리 > 실시간 검색어 관리 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectRealSearchListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectRealSearchList
	* 2. ClassName : RealSearchService.java
	* 3. Comment : 관리자 > 사이트관리 > 실시간 검색어 관리 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectRealSearchList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertRealSearch
	* 2. ClassName : RealSearchService.java
	* 3. Comment : 관리자 > 사이트관리 > 실시간 검색어 관리 등록/수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertRealSearch(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
}
