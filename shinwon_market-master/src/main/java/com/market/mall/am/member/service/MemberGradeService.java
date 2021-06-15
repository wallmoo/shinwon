package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

public interface MemberGradeService {
	
	public int insertMemberGrade (Map<String, Object> commandMap) throws Exception;
	
	public int updateMemberGrade (Map<String, Object> commandMap) throws Exception;
	
	public int selectMemberGradeListCount (Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectMemberGradeList (Map<String, Object> commandMap) throws Exception;
	
	public Map<String, Object> selectMemberGradeInfo (Map<String, Object> commandMap) throws Exception;

}
