package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.AuthManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : AuthManagerServiceImpl.java
 * @Date : 2014. 3. 25.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 권한관리를 처리하는 Service Implement
 * @author jangsin
 */
@Service("authManagerService")
public class AuthManagerServiceImpl implements AuthManagerService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    
    /**
    * <pre>
    * 1. MethodName : selectAuthManagerListCount
    * 2. ClassName  : AuthManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectAuthManagerListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("AuthManager.selectAuthManagerListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectAuthManagerList
    * 2. ClassName  : AuthManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectAuthManagerList (Map<String, Object> commandMap) throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("AuthManager.selectAuthManagerList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertAuthManager
    * 2. ClassName  : AuthManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertAuthManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("AUT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("AUT_MST_REG_ID", admin.getADM_MST_ID());
        // 권한 마스터 등록
        int result = defaultDAO.insert("AuthManager.insertAuthMaster", commandMap);
        String[] ADM_MNU_IDXs = request.getParameterValues("ADM_ADM_MNU_IDX");

        if(result > 0)
        {       
        	if(ADM_MNU_IDXs != null)
        	{
        		// 권한 등록
                result = defaultDAO.insert("AuthManager.insertAuthManager", commandMap);
        	}
        }
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectAuthManagerInfo
    * 2. ClassName  : AuthManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 상세보기 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectAuthManagerInfo (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("AuthManager.selectAuthManagerInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateAuthManager
    * 2. ClassName  : AuthManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 수정
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateAuthManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        // 권한 삭제
        result = defaultDAO.delete("AuthManager.deleteAuthManager", commandMap);
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("AUT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("AUT_MST_UPD_ID", admin.getADM_MST_ID());
        String[] ADM_MNU_IDXs = request.getParameterValues("ADM_ADM_MNU_IDX");
        // 마스터 정보 수정
        result += defaultDAO.update("AuthManager.updateAuthMaster", commandMap);
        
        if(ADM_MNU_IDXs != null)
        {
        	// 권한 등록
            result += defaultDAO.insert("AuthManager.insertAuthManager", commandMap);
        }
        
        return result;
    }
}
