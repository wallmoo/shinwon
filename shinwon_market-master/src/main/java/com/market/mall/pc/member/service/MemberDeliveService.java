package com.market.mall.pc.member.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.member.service
 * @FileName : MemberDeliveService.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 : 프론트 > 나의 배송지를 처리하는 Service Interface
 * @author kanghk
 */
public interface MemberDeliveService {
	/**
	* <pre>
	* 1. MethodName : selectMemberDeliveListCount
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 나의 배송지 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMemberDeliveListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMemberDeliveList
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 나의 배송지 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectMemberDeliveList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMemberDeliveInfo
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 배송지 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectMemberDeliveInfo (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateMemberDelive
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 나의 배송지 수정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMemberDelive (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertMemberDelive
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 나의 배송지 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertMemberDelive (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateMemberDeliveBaseY
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 기본 배송지로 설정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMemberDeliveBaseY (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteMemberDelive
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 나의 배송지 삭제
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteMemberDelive (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectMemberBaseDeliveInfo
	* 2. ClassName  : MemberDeliveService.java
	* 3. Comment    : 기본배송지 가져오기
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 5. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectMemberBaseDeliveInfo(Map<String, Object> commandMap)	throws Exception;
}
