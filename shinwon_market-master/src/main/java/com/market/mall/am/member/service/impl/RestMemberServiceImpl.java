package com.market.mall.am.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.member.service.RestMemberService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.member.service.impl
 * @FileName : RestMemberServiceImpl.java
 * @Date : 2015. 11. 3.
 * @프로그램 설명 : 관리자 > 회원관리 > 휴면회원관리를 처리하는 Service Interface Class
 * @author DEV_KIMSOYOUNG
 */
@Service("restMemberService")
public class RestMemberServiceImpl implements RestMemberService {
	
	@Resource(name="defaultDAO")	private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectRestMemberListCount
	* 2. ClassName  : RestMemberServiceImpl.java
	* 3. Comment    : 관리자 > 회원관리 > 휴면회원관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectRestMemberListCount (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("RestMember.selectRestMemberListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectRestMemberList
	* 2. ClassName  : RestMemberServiceImpl.java
	* 3. Comment    : 관리자 > 회원관리 > 휴면회원관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectRestMemberList (Map<String,Object> commandMap) throws Exception
	{
		List<Map<String,Object>> list = defaultDAO.selectList("RestMember.selectRestMemberList", commandMap);
		/*
    	for(int i=0;i<list.size();i++) {
    		Map<String,Object> member = list.get(i);
    		String eShopId = StringUtil.getString(member.get("MEM_MST_ERP_ID"));
    		int point = 0;
    		if(!eShopId.isEmpty()) { 
    			member.put("ESHOP_ID", eShopId);
        		Map<String,Object> erpPoint =  ErpRequest.requestMemberPointCheck(member);
        		point = StringUtil.getInt(erpPoint.get("MemberPointCheckResult"));
    		}
    		member.put("ERP_PIT", point);
    	} 
    	*/    	
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectRestMemberListExcel (Map<String,Object> commandMap) throws Exception
	{
		List<Map<String,Object>> list = defaultDAO.selectList("RestMember.selectRestMemberListExcel", commandMap);
		/*
    	for(int i=0;i<list.size();i++) {
    		Map<String,Object> member = list.get(i);
    		String eShopId = StringUtil.getString(member.get("MEM_MST_ERP_ID"));
    		int point = 0;
    		if(!eShopId.isEmpty()) { 
    			member.put("ESHOP_ID", eShopId);
        		Map<String,Object> erpPoint =  ErpRequest.requestMemberPointCheck(member);
        		point = StringUtil.getInt(erpPoint.get("MemberPointCheckResult"));
    		}
    		member.put("ERP_PIT", point);
    	}
    	*/
		return list;
	}	

	@Override
	public int insertRestMember(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insertNoException("RestMember.insertRestMember", commandMap);
	}
	@Override
	public int deleteMasterMember(Map<String,Object> commandMap) throws Exception{
		return defaultDAO.delete("RestMember.deleteMasterMember", commandMap);
	}
	public int deleteRestMemberList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.delete("RestMember.deleteRestMember", commandMap);
	}
	@Override
	public int deleteRestMember(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.delete("RestMember.deleteRestMember", commandMap);
	}
	@Override
	public int insertMasterMember(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insertNoException("RestMember.insertMasterMember", commandMap);
	}

}
