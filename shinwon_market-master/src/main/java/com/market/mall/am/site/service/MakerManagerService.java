package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MakerManagerService {

	/**
	* <pre>
	* 1. MethodName : selectMakerManagerListCount
	* 2. ClassName  : MakerManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	*/
	public int selectMakerManagerListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMakerManagerList
	* 2. ClassName  : MakerManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	*/
	public List<Map<String,Object>> selectMakerManagerList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertMakerManager
	* 2. ClassName  : MakerManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertMakerManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMakerManagerInfo
	* 2. ClassName  : MakerManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectMakerManagerInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateMakerManager
	* 2. ClassName  : MakerManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMakerManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMakerManagerNmCheckCount
	* 2. ClassName  : MakerManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 > 제조사명 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMakerManagerNmCheckCount (Map<String,Object> commandMap) throws Exception;
	
	public int updateMakerList(Map<String, Object> commandMap) throws Exception;
}
