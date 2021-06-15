package com.market.mall.am.sns.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.StringUtil;
import com.market.mall.am.sns.service.SnsManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.sns.service.impl
 * @FileName : SnsManagerServiceImpl.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 관리자 > SNS관리 처리하는 Controller Class
 * @author DEV_KIMYEONGJUN
 */
@Service("snsManagerService")  
public class SnsManagerServiceImpl implements SnsManagerService {
    
    @Resource(name="defaultDAO")   
    private CommonDefaultDAO defaultDAO;  

    /**
     * <pre>
     * 1. MethodName : selectSnsManagerListCount
     * 2. ClassName  : SnsManagerServiceImpl.java
     * 3. Comment    : 설명추가부분 
     * 4. 작성자       : 관리자 > SNS관리 > SNS목록 갯수
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectSnsManagerListCount(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectCount("SnsManager.selectSnsManagerListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectSnsManagerList
     * 2. ClassName  : SnsManagerServiceImpl.java
     * 3. Comment    : 관리자 > SNS관리 > SNS목록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked") 
    public List<Map<String, Object>> selectSnsManagerList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("SnsManager.selectSnsManagerList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertSnsManager
     * 2. ClassName  : SnsManagerServiceImpl.java
     * 3. Comment    : 관리자 > SNS관리 > SNS등록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertSnsManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request); 
        commandMap.put("SNS_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("SNS_MST_REG_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        try
        {
            result = defaultDAO.insert("SnsManager.insertSnsManager", commandMap);
        }
        catch(Exception e)
        { 
            result = -1; 
        }
     
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : selectSnsManagerInfo
     * 2. ClassName  : SnsManagerServiceImpl.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 상세정보
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return 
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectSnsManagerInfo(Map<String, Object> commandMap) throws Exception {

        return defaultDAO.select("SnsManager.selectSnsManagerInfo", commandMap);
    } 

    /**
     * <pre>
     * 1. MethodName : updateSnsManager
     * 2. ClassName  : SnsManagerServiceImpl.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 수정
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateSnsManager(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        
        Admin admin = SessionsAdmin.getSessionAdmin(request); 
        commandMap.put("SNS_MST_UPD_IP", request.getRemoteAddr()); 
        commandMap.put("SNS_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        try
        {
            result = defaultDAO.insert("SnsManager.updateSnsManager", commandMap);
        }
        catch(Exception e)  
        { 
            result = -1;   
        }
     
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectSnsUseList
     * 2. ClassName  : SnsManagerServiceImpl.java
     * 3. Comment    : 관리자 > SNS관리 > SNS 사용목록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked") 
    public List<Map<String, Object>> selectSnsUseList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("SnsManager.selectSnsUseList", commandMap);
    }


}
