package com.market.mall.am.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.member.service.SecessionMemberService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.member.service.impl
 * @FileName : SecessionMemberServiceImpl.java
 * @Date : 2016. 9. 5.
 * @프로그램 설명 : 관리자 > 회원관리 > 탈퇴회원관리를 처리하는 Service Interface Class
 * @author DEV_KIMYEONGJUN
 */
@Service("secessionMemberService")
public class SecessionMemberServiceImpl implements SecessionMemberService {
	
	@Resource(name="defaultDAO")	private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectSecessionMemberListCount
	* 2. ClassName  : SecessionMemberServiceImpl.java
	* 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	/**
	 * <pre>
	 * 1. MethodName : selectSecessionMemberListCount
	 * 2. ClassName  : SecessionMemberServiceImpl.java
	 * 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록 갯수
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectSecessionMemberListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("SecessionMember.selectSecessionMemberListCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectSecessionMemberList
	 * 2. ClassName  : SecessionMemberServiceImpl.java
	 * 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSecessionMemberList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SecessionMember.selectSecessionMemberList", commandMap);
	}
	
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
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSecessionMemberListExcel (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("SecessionMember.selectSecessionMemberListExcel", commandMap);
	}
	
	
	@Override
	public int deleteRestMember(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.delete("SecessionMember.deleteRestMember", commandMap);
	}
	
	

}
