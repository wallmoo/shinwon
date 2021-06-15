package com.market.mall.am.site.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.MyFitManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

@Service("myFitManagerService")
public class MyFitManagerServiceImpl implements MyFitManagerService {
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    @Autowired private FileUpload fileUpload;
	
    public int selectMyFitManagerListCount (Map<String,Object> commandMap) throws Exception 
    {
        return defaultDAO.selectCount("MyFitManager.selectMyFitManagerListCount", commandMap);
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String,Object>> selectMyFitManagerList (Map<String,Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("MyFitManager.selectMyFitManagerList", commandMap);
    }
    
    public List<Map<String,Object>> selectMyFitInputList (Map<String,Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("MyFitManager.selectMyFitInputList", commandMap);
    }
    
    public Map<String,Object> selectMyFitInfo (Map<String,Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        //기본 정보
        Map<String, Object> row = defaultDAO.select("MyFitManager.selectMyFitManagerInfo", commandMap);
        returnMap.put("row", row);
        
        commandMap.put("CMM_FLE_TB_NM", "T_FIT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("FIT_MST_IDX"), ""));
        
        //첨부파일 리스트 - 썸네일 : sort가 1, 예시이미지 : sort가 2
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        //마이핏 등록 카테고리
        commandMap.put("FIT_MST_CTG", row.get("FIT_MST_CTG"));
        returnMap.put("myFitCategoryList", defaultDAO.selectList("MyFitManager.selectMyFitCategory", commandMap));
        
        //마이핏 입력정보 리스트
        returnMap.put("myFitInputList", defaultDAO.selectList("MyFitManager.selectMyFitInputCheckList", commandMap));
        
        return returnMap;
    }
    
	public int insertMyFitManager (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception {
	    
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("FIT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("FIT_MST_REG_ID", admin.getADM_MST_ID());
        
        commandMap.put("FIT_MST_CTG", commandMap.get("CATEGORY")); // 3depth 카테고리 IDX
        commandMap.put("CMN_COM_IDX", commandMap.get("FIT_MST_CTG2")); //중분류 공통코드값
        
        //마이핏 관리 기본정보 등록
        int result = defaultDAO.insert("MyFitManager.insertMyFitManager", commandMap);
        
        commandMap.put("FIT_MST_IDX", StringUtil.getString(commandMap.get("FIT_MST_IDX")));
        
        if(result > 0){
            /**
             * 마이핏관리 썸네일 이미지는 CMM_FLE_SORT가 1
             * 마이핏관리 예시 이미지는 CMM_FLE_SORT가 2
             */ 
            //썸네일
            CommonsMultipartFile thumbnailFile = (CommonsMultipartFile) request.getFile("thumbnailFile");
            if(thumbnailFile != null && !thumbnailFile.isEmpty())
            {
                commandMap.put("CMM_FLE_TB_NM", "T_FIT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("FIT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_1"), ""));
                commandMap.put("CMM_FLE_SORT", "1");
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, thumbnailFile, "site", "image", "Y"));
            }
            //예시이미지
            CommonsMultipartFile guideFile = (CommonsMultipartFile) request.getFile("guideFile");
            if(guideFile != null && !guideFile.isEmpty())
            {
                commandMap.put("CMM_FLE_TB_NM", "T_FIT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("FIT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_2"), ""));
                commandMap.put("CMM_FLE_SORT", "2");
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, guideFile, "site", "image", "Y"));
            }
        }
        
        //입력정보 등록
        String jsonList = StringUtil.getString(commandMap.get("jsonData"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String,Object>> inputList = mapper.readValue(jsonList,typeRef);
        
        for(int index=0; index < inputList.size(); index++){
            Map<String, Object> paramMap = new HashMap<String, Object>();
            
            paramMap.put("FIT_MST_IDX", commandMap.get("FIT_MST_IDX"));
            paramMap.put("CMN_COM_IDX", inputList.get(index).get("CMN_COM_IDX"));
            
            defaultDAO.insert("MyFitManager.insertMyFitInfoManager", paramMap);
        }
        
        return result;
	}
	
	public int updateMyFit (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
	     int result = 0;
	     
	     commandMap.put("FIT_MST_CTG", commandMap.get("CATEGORY")); // 3depth 카테고리 IDX
	     commandMap.put("CMN_COM_IDX", commandMap.get("FIT_MST_CTG2")); //중분류 공통코드값
	     
	     result = defaultDAO.update("MyFitManager.updateMyFitInfoManager", commandMap);
	     
	     String CMM_FLE_SAVE_PATH = "";
	        
	     //물리적 파일 삭제를 위한 tempList
	     List<String> tempRemoveList = new ArrayList<String>();
	     
	     if(result > 0)
	     {
	         //기존 파일 삭제
	         String [] removeFileIdx = request.getParameterValues("CMM_FLE_IDX");
	            
	         if(removeFileIdx != null){
	             for(int i=0;i<removeFileIdx.length;i++){
	                 //파일 상세 정보
	                 commandMap.put("CMM_FLE_IDX", removeFileIdx[i]);
	                 Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
	                 CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
                    
	                 if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
	                 {
                         commandMap.put("CMM_FLE_USE_YN", "N");
                         
                         // 파일 DB 수정
                         defaultDAO.update("Common.deleteCommonFile", commandMap);
                         
                         // 물리적 삭제할 파일 경로에 추가
                         tempRemoveList.add(CMM_FLE_SAVE_PATH);
                     }
	             }
	         }

	         //썸네일
            CommonsMultipartFile thumbnailFile = (CommonsMultipartFile) request.getFile("thumbnailFile");
            if(thumbnailFile != null && !thumbnailFile.isEmpty())
            {
                commandMap.put("CMM_FLE_TB_NM", "T_FIT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("FIT_MST_IDX"), ""));
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_1"), ""));
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("FIT_MST_UPD_ID"));
                commandMap.put("CMM_FLE_SORT", "1");
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, thumbnailFile, "site", "image", "Y"));
            }
            else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_1_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_1"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_1_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //예시이미지
            CommonsMultipartFile guideFile = (CommonsMultipartFile) request.getFile("guideFile");
            if(guideFile != null && !guideFile.isEmpty())
            {
                commandMap.put("CMM_FLE_TB_NM", "T_FIT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("FIT_MST_IDX"), ""));
                commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_2"), ""));
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("FIT_MST_UPD_ID"));
                commandMap.put("CMM_FLE_SORT", "2");
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, guideFile, "site", "image", "Y"));
            }
            else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_2_IDX"), "")))
            {
                //대체 텍스트만 변경된 경우...
                commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_2"), ""));
                commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_2_IDX"), ""));
                defaultDAO.update("Common.updateCommonFileAltText", commandMap);
            }
            
            //파일 삭제한 경우에만..
            if(tempRemoveList != null){
                for(int i=0;i<tempRemoveList.size();i++){
                    fileUpload.delete(tempRemoveList.get(i));
                }
            }
            
            defaultDAO.delete("MyFitManager.deleteMyFitInputList", commandMap);
            //입력정보 등록
            String jsonList = StringUtil.getString(commandMap.get("jsonData"),"");
            
            ObjectMapper mapper = new ObjectMapper();
            TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
            
            List<Map<String,Object>> inputList = mapper.readValue(jsonList,typeRef);
            
            for(int index=0; index < inputList.size(); index++){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                
                paramMap.put("FIT_MST_IDX", commandMap.get("FIT_MST_IDX"));
                paramMap.put("CMN_COM_IDX", inputList.get(index).get("CMN_COM_IDX"));
                
                defaultDAO.insert("MyFitManager.insertMyFitInfoManager", paramMap);
            }
            
	     }
	     
	     return result;
	}

    public List<Map<String, Object>> selectMyFitSubCategoryList(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("MyFitManager.selectMyFitSubCategoryList",commandMap);
    }
	
}
