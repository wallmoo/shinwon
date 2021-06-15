package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.BasicManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : BasicManagerServiceImpl.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 사이트관리를 처리하는 Service Implement Class
 * @author DEV_KIMYEONGJUN
 */
@Service("basicManagerService")
public class BasicManagerServiceImpl implements BasicManagerService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectBasicManagerListCount
     * 2. ClassName  : BasicManagerServiceImpl.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 목록 갯수 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBasicManagerListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("BasicManager.selectBasicManagerListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : basicManagerList
    * 2. ClassName  : BasicManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBasicManagerList (Map<String, Object> commandMap) throws Exception
    {
        return (List<Map<String, Object>>)defaultDAO.selectList("BasicManager.selectBasicManagerList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBasicManagerIdCheckCount
    * 2. ClassName  : BasicManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 아이디 중복 체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBasicManagerIdCheckCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("BasicManager.selectBasicManagerIdCheckCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : sleectBasicManagerInfo
    * 2. ClassName  : BasicManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 상세정보
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBasicManagerInfo (Map<String, Object> commandMap) throws Exception
    {
        return (Map<String, Object>) defaultDAO.select("BasicManager.selectBasicManagerInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertBasicManager
    * 2. ClassName  : BasicManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 등록 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertBasicManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
//        // 비밀번호 복호화
//        BASE64Decoder decoder = new BASE64Decoder();
//        String pwd = new String(decoder.decodeBuffer(StringUtil.getString(commandMap.get("ADM_MST_PWD"), "")));
//        
//        pwd = DbCryptoUtil.dbencrypt("table", "hash64", pwd);
//       // commandMap.put("ADM_MST_PWD", pwd); /*암호화 상태로 저장하도록 수정(2015.03.03)*/
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ADM_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("ADM_MST_REG_ID", admin.getADM_MST_ID());
        return defaultDAO.insert("BasicManager.insertBasicManager", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateBasicManager
    * 2. ClassName  : BasicManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 수정 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
//        // 비밀번호 복호화
//        String pwd = StringUtil.getString(commandMap.get("ADM_MST_PWD"), "");
//        if(!"".equals(pwd))
//        {
//            BASE64Decoder decoder = new BASE64Decoder();
//            pwd = new String(decoder.decodeBuffer(pwd));
//            
//            pwd = DbCryptoUtil.dbencrypt("table", "hash64", pwd);
//        }
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ADM_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("ADM_MST_UPD_ID", admin.getADM_MST_ID());
        return defaultDAO.update("BasicManager.updateBasicManager", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectBasicManagerTypeList
     * 2. ClassName  : BasicManagerServiceImpl.java
     * 3. Comment    : 관리자 타입별로 리스트를 반환한다.  
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>  
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBasicManagerTypeList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("BasicManager.selectBasicManagerTypeList", commandMap);
    }
     
     
     public int deleteBasicManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.update("BasicManager.deleteBasicManager", commandMap);
     }     
     
}
