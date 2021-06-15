package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.MenuManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;


/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : MenuManagerServiceImpl.java
 * @Date : 2014. 3. 26.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 메뉴관리를 처리하는 Service Implement Class
 * @author jangsin
 */
@Service("menuManagerService")
public class MenuManagerServiceImpl implements MenuManagerService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    /**
    * <pre>
    * 1. MethodName : selectMenuManagerListCount
    * 2. ClassName  : MenuManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 목록 갯수
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMenuManagerListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("MenuManager.selectMenuManagerListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectmenuManagerList
    * 2. ClassName  : MenuManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectmenuManagerList (Map<String, Object> commandMap) throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("MenuManager.selectMenuManagerList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMenuManagerInfo
    * 2. ClassName  : MenuManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMenuManagerInfo (Map<String, Object> commandMap) throws Exception
    {
        return (Map<String, Object>)defaultDAO.select("MenuManager.selectMenuManagerInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertMenuManager
    * 2. ClassName  : MenuManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertMenuManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ADM_MNU_REG_IP", request.getRemoteAddr());
        commandMap.put("ADM_MNU_REG_ID", admin.getADM_MST_ID());
        return defaultDAO.insert("MenuManager.insertMenuManager", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateMenuManager
    * 2. ClassName  : MenuManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMenuManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ADM_MNU_UPD_IP", request.getRemoteAddr());
        commandMap.put("ADM_MNU_UPD_ID", admin.getADM_MST_ID());
        return defaultDAO.update("MenuManager.updateMenuManager", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateMenuManagerSortArray
    * 2. ClassName  : MenuManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴 순서 변경 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMenuManagerSortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ADM_MNU_UPD_IP", request.getRemoteAddr());
        commandMap.put("ADM_MNU_UPD_ID", admin.getADM_MST_ID());
        String[] ADM_MNU_IDX = (String[])commandMap.get("ADM_MNU_IDX[]");
        String[] ADM_MNU_SORT = (String[])commandMap.get("ADM_MNU_SORT[]");
        int result = 0;
        
        for(int i = 0 ; i < ADM_MNU_IDX.length ; i++)
        {
            commandMap.put("ADM_MNU_IDX", ADM_MNU_IDX[i]);
            commandMap.put("ADM_MNU_SORT", ADM_MNU_SORT[i]);
            result = defaultDAO.update("MenuManager.updateMenuManagerSortArray", commandMap);
        }
        
        return result; 
    }
}
