package com.market.mall.am.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.AppPushService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : AppPushServiceImpl.java
 * @Date : 2015. 4. 21.
 * @프로그램 설명 : 관리자 > 전시관리 > APP 푸시알림관리를 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("appPushService")
public class AppPushServiceImpl implements AppPushService {

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
	@Autowired private FileUpload fileUpload;

    /**
     * <pre>
     * 1. MethodName : selectAppPushCount
     * 2. ClassName  : AppPushServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 목록 갯수
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectAppPushCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("AppPush.selectAppPushCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectAppPushList
     * 2. ClassName  : AppPushServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 목록  
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectAppPushList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("AppPush.selectAppPushList",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectAppPushView
     * 2. ClassName  : AppPushServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 상세보기   
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectAppPushView(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
	    
    	commandMap.put("CMM_FLE_TB_NM", "T_APP_PSH");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("APP_PSH_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("AppPush.selectAppPushInfo", commandMap));
        
	    return returnMap;
    }

    /**
     * <pre>
     * 1. MethodName : insertAppPush
     * 2. ClassName  : AppPushServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 등록 처리   
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertAppPush(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("APP_PSH_REG_ID", admin.getADM_MST_ID());
        commandMap.put("APP_PSH_REG_IP", request.getRemoteAddr());
        
        result = defaultDAO.insert("AppPush.insertAppPush", commandMap);
        
        if(result > 0)
        {
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_APP_PSH");
                commandMap.put("CMM_FLE_TB_TYPE", "I");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("APP_PSH_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
                    }
                }
            }
            
            // MEM_MST_TKN_ID가 NULL이 아닌 사람 PSH_YN 'Y'로 업데이트
            //defaultDAO.update("AppPush.updatePushYn", commandMap);
        }
        
        
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateAppPush
     * 2. ClassName  : AppPushServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 수정 처리  
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int updateAppPush(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        String CMM_FLE_IDX = StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "");
        
        if(!"".equals(CMM_FLE_IDX))
        {
            // 파일 상세 정보
            Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
            String CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
            
            if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
            {
                commandMap.put("CMM_FLE_IDX", CMM_FLE_IDX);
                commandMap.put("CMM_FLE_USE_YN", "N");
                
                // 파일 DB 수정
                if(defaultDAO.update("Common.deleteCommonFile", commandMap) > 0)
                {
                    // 물리적 파일 삭제
                    fileUpload.delete(CMM_FLE_SAVE_PATH);
                }
            }
    
        }

        List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
        if(fileList != null && fileList.size() > 0)
        {
            int fileSort = 0;
            
            commandMap.put("CMM_FLE_TB_NM", "T_APP_PSH");
            commandMap.put("CMM_FLE_TB_TYPE", "I");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("APP_PSH_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
            for(int i = 0;i < fileList.size();i++)
            {
                CommonsMultipartFile file = fileList.get(i);
                
                if(!file.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", ++fileSort);
                    // 파일 DB 등록 및 파일 업로드
                    defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
                }
            }
        }
        
        //기본값 설정
        commandMap.put("APP_PSH_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("APP_PSH_UPD_IP", request.getRemoteAddr());
        
        result = defaultDAO.update("AppPush.updateAppPush", commandMap);
        
        return result;
    }
}
