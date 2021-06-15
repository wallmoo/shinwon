package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.MakerManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : MakerManagerServiceImpl.java
 * @Date : 2015. 10. 14.
 * @프로그램 설명 : 관리자 > 시스템 관리 > 제조사 관리를 처리하는 Service Implements Class
 * @author DEV_KIMSOYOUNG
 */
@Service("makerManagerService")
public class MakerManagerServiceImpl implements MakerManagerService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	/**
	* <pre>
	* 1. MethodName : selectMakerManagerListCount
	* 2. ClassName  : MakerManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMakerManagerListCount(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("MakerManager.selectMakerManagerListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMakerManagerList
	* 2. ClassName  : MakerManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMakerManagerList(Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("MakerManager.selectMakerManagerList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertMakerManager
	* 2. ClassName  : MakerManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertMakerManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("MRK_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("MRK_MST_REG_ID", admin.getADM_MST_ID());
        
		return defaultDAO.insert("MakerManager.insertMakerManager", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMakerManagerInfo
	* 2. ClassName  : MakerManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 상세정보 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectMakerManagerInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("MakerManager.selectMakerManagerInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateMakerManager
	* 2. ClassName  : MakerManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateMakerManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("MRK_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("MRK_MST_UPD_ID", admin.getADM_MST_ID());
        
        return defaultDAO.update("MakerManager.updateMakerManager",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMakerManagerNmCheckCount
	* 2. ClassName  : MakerManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 제조사관리 > 제조사명 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMakerManagerNmCheckCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("MakerManager.selectMakerManagerNmCheckCount", commandMap);
	}
	
    public int updateMakerList(Map<String, Object> commandMap) throws Exception
    {
  	  int result = defaultDAO.update("MakerManager.updateMakerList", commandMap);
  	  return result;
    }
	
}
