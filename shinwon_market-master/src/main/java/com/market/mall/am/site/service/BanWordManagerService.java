package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : BanWordManagerService.java
 * @Date : 2015. 10. 13.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 차단단어 관리를 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface BanWordManagerService {

	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerListCount
	* 2. ClassName  : BanWordManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBanWordManagerListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerList
	* 2. ClassName  : BanWordManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectBanWordManagerList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertBanWordManager
	* 2. ClassName  : BanWordManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBanWordManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerInfo
	* 2. ClassName  : BanWordManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectBanWordManagerInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateBanWordManager
	* 2. ClassName  : BanWordManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateBanWordManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerTxtCheckCount
	* 2. ClassName  : BanWordManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 > 차단단어(금지어) 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBanWordManagerTxtCheckCount (Map<String,Object> commandMap) throws Exception;
}
 