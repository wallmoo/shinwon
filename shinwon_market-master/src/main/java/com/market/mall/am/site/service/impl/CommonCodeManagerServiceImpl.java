package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.CommonCodeManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : CommonCodeManagerServiceImpl.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 공통코드 관리를 처리하는 Service Implement Class
 * @author jangsin
 */
@Service("commonCodeManagerService")
public class CommonCodeManagerServiceImpl implements CommonCodeManagerService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : commonCodeManagerListCount
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 갯수 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectCommonCodeManagerListCount (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectCount("CommonCodeManager.selectCommonCodeManagerListCount", commandMap);
     }
     
     /**
     * <pre>
     * 1. MethodName : commonCodeManagerList
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonCodeManagerList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("CommonCodeManager.selectCommonCodeManagerList", commandMap);
     }
     
     /**
     * <pre>
     * 1. MethodName : selectCommonCodeManagerInfo
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 상세정보 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
    public Map<String, Object> selectCommonCodeManagerInfo (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.select("CommonCodeManager.selectCommonCodeManagerInfo", commandMap);
     }
     
     /**
     * <pre>
     * 1. MethodName : insertCommonCodeManager
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 등록 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int insertCommonCodeManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("CMN_COM_REG_IP", request.getRemoteAddr());
         commandMap.put("CMN_COM_REG_ID", admin.getADM_MST_ID());
         return defaultDAO.insert("CommonCodeManager.insertCommonCodeManager", commandMap);
     }
     
     /**
     * <pre>
     * 1. MethodName : updateCommonCodeManager
     * 2. ClassName  : CommonCodeManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 수정 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateCommonCodeManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("CMN_COM_UPD_IP", request.getRemoteAddr());
         commandMap.put("CMN_COM_UPD_ID", admin.getADM_MST_ID());
         return defaultDAO.update("CommonCodeManager.updateCommonCodeManager", commandMap);
     }
     
     /**
    * <pre>
    * 1. MethodName : updateCommonCodeSortArray
    * 2. ClassName  : CommonCodeManagerServiceImpl.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 순서 정렬 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCommonCodeManagerSortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("CMN_COM_UPD_IP", request.getRemoteAddr());
         commandMap.put("CMN_COM_UPD_ID", admin.getADM_MST_ID());
         String[] CMN_COM_IDX = (String[])commandMap.get("CMN_COM_IDX[]");
         String[] CMN_COM_SORT = (String[])commandMap.get("CMN_COM_SORT[]");
         int result = 0;
         
         for(int i = 0 ; i < CMN_COM_IDX.length ; i++)
         {
             commandMap.put("CMN_COM_IDX", CMN_COM_IDX[i]);
             commandMap.put("CMN_COM_SORT", CMN_COM_SORT[i]);
             result = defaultDAO.update("CommonCodeManager.updateCommonCodeManagerSortArray", commandMap);
         }
         
         return result; 
     }
}
