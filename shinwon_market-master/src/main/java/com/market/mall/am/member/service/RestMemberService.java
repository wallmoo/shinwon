package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.member.service
 * @FileName : RestMemberService.java
 * @Date : 2015. 11. 3.
 * @프로그램 설명 : 관리자 > 회원관리 > 휴면회원관리를 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface RestMemberService {
	
	/**
	* <pre>
	* 1. MethodName : selectRestMemberListCount
	* 2. ClassName  : RestMemberService.java
	* 3. Comment    : 관리자 > 회원관리 > 휴면회원관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectRestMemberListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectRestMemberList
	* 2. ClassName  : RestMemberService.java
	* 3. Comment    : 관리자 > 회원관리 > 휴면회원관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3. 
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectRestMemberList (Map<String,Object> commandMap) throws Exception;

	public int insertRestMember(Map<String, Object> commandMap) throws Exception;
	public int deleteMasterMember(Map<String,Object> commandMap) throws Exception;
	public int insertMasterMember(Map<String, Object> commandMap) throws Exception;
	public int deleteRestMember(Map<String, Object> commandMap) throws Exception;
	public int deleteRestMemberList(Map<String, Object> commandMap) throws Exception;
	
	
	public List<Map<String,Object>> selectRestMemberListExcel (Map<String,Object> commandMap) throws Exception;	
}
