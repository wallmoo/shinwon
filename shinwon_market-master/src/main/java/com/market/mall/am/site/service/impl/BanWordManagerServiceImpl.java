package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.BanWordManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : BanWordManagerServiceImpl.java
 * @Date : 2015. 10. 13.
 * @프로그램 설명 : 관리자 > 시스템관리 > 차단단어 관리를 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("banWordManagerService")
public class BanWordManagerServiceImpl implements BanWordManagerService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerListCount
	* 2. ClassName  : BanWordManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBanWordManagerListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("BanWordManager.selectBanWordManagerListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerList
	* 2. ClassName  : BanWordManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBanWordManagerList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("BanWordManager.selectBanWordManagerList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertBanWordManager
	* 2. ClassName  : BanWordManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBanWordManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BAN_WRD_REG_IP", request.getRemoteAddr());
        commandMap.put("BAN_WRD_REG_ID", admin.getADM_MST_ID());
        
        // 금지어 관리 등록 
        int result = defaultDAO.insert("BanWordManager.insertBanWordManager", commandMap);
        
        String banWordTxt = "";	// 금지어
        String tempBanWordTxt = ""; // 가공 금지어
        
        if(result > 0)
        {
        	commandMap.put("banWrdUserYn","Y");
        	
        	// 현재 사용되고 있는 금지어 관리 목록
        	List<Map<String,Object>> banWordList = defaultDAO.selectList("BanWordManager.selectBanWordManagerList", commandMap);

        	for(int i=0;i < banWordList.size();i++)
        	{
        		banWordTxt = (String)banWordList.get(i).get("BAN_WRD_TXT");
        		tempBanWordTxt = banWordTxt + "|" + tempBanWordTxt;
        	}

        	commandMap.put("BAN_TXT_LONG_TXT", tempBanWordTxt);
        	
        	// 가공 금지어 삭제
        	defaultDAO.delete("BanWordManager.deleteBanWordTxt", commandMap);
        	// 가공 금지어 삽입
        	defaultDAO.insert("BanWordManager.insertBanWordTxt", commandMap);
        }
        
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerInfo
	* 2. ClassName  : BanWordManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectBanWordManagerInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("BanWordManager.selectBanWordManagerInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateBanWordManager
	* 2. ClassName  : BanWordManagerServiceImpl.java
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
	public int updateBanWordManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BAN_WRD_UPD_IP", request.getRemoteAddr());
        commandMap.put("BAN_WRD_UPD_ID", admin.getADM_MST_ID());
        
		return defaultDAO.update("BanWordManager.updateBanWordManager", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBanWordManagerTxtCheckCount
	* 2. ClassName  : BanWordManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 차단단어 관리 > 차단단어(금지어) 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBanWordManagerTxtCheckCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("BanWordManager.selectBanWordManagerTxtCheckCount", commandMap);
	}
} 
