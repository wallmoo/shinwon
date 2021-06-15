package com.market.mall.am.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.member.service.LmsHistoryService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.member.service.impl
 * @FileName : LmsHistoryServiceImpl.java
 * @Date : 2015. 11. 3.
 * @프로그램 설명 : 관리자 > 회원관리 > LMS이력을 처리하는 Service Interface Class
 * @author DEV_KIMSOYOUNG
 */
@Service("lmsHistoryService")
public class LmsHistoryServiceImpl implements LmsHistoryService {
	
	@Resource(name="defaultDAO")	private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectLmsHistoryListCount
	* 2. ClassName  : LmsHistoryServiceImpl.java
	* 3. Comment    : 관리자 > 회원관리 > LMS이력 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectLmsHistoryListCount (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("LmsHistory.selectLmsHistoryListCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectLmsHistoryList
	* 2. ClassName  : LmsHistoryServiceImpl.java
	* 3. Comment    : 관리자 > 회원관리 > LMS이력 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectLmsHistoryList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("LmsHistory.selectLmsHistoryList", commandMap);
	}
}
