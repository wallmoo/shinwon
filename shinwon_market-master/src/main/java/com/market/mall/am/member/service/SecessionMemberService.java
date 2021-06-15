package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.member.service
 * @FileName : SecessionMemberService.java
 * @Date : 2016. 9. 5.
 * @프로그램 설명 : 관리자 > 회원관리 > 탈퇴회원관리를 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface SecessionMemberService 
{
    /**
     * <pre>
     * 1. MethodName : selectSecessionMemberListCount
     * 2. ClassName  : SecessionMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록 갯수
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 9. 5.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public int selectSecessionMemberListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : secessionMemberExcelDownload
	* 2. ClassName  : SecessionMemberController.java
	* 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록 엑셀다운로드
	* 4. 작성자       : Lee Han YOung
	* 5. 작성일       : 2020. 06. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectSecessionMemberList (Map<String,Object> commandMap) throws Exception;
	
	
	public List<Map<String,Object>> selectSecessionMemberListExcel (Map<String,Object> commandMap) throws Exception;
	
	
	public int deleteRestMember(Map<String, Object> commandMap)throws Exception;	
	
}

