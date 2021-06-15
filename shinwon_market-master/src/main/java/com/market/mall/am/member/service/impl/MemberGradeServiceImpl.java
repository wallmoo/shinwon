package com.market.mall.am.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.member.service.MemberGradeService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("memberGradeService")
public class MemberGradeServiceImpl implements MemberGradeService {
	
	@Resource(name="defaultDAO") 
	private CommonDefaultDAO defaultDAO;
	
	public int insertMemberGrade (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.insert("MemberGrade.insertMemberGrade", commandMap);
	}
	
	public int updateMemberGrade (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.update("MemberGrade.updateMemberGrade", commandMap);
	}
	
	public int selectMemberGradeListCount (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("MemberGrade.selectMemberGradeListCount", commandMap);
	}

	public List<Map<String, Object>> selectMemberGradeList (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("MemberGrade.selectMemberGradeList", commandMap);
	}
	
	public Map<String, Object> selectMemberGradeInfo (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.select("MemberGrade.selectMemberGradeInfo", commandMap);
	}
	
}
