package com.market.mall.am.site.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.site.service.BrandManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.brand.BRAND_MODEL;

/**
 * @PackageName: com.market.mall.am.site.service.impl
 * @FileName : BrandManagerServiceImpl.java
 * @Date : 2015. 3. 23.
 * @프로그램 설명 : 관리자 > 시스템 관리 > 브랜드 관리를 처리하는 Service Implements Class
 * @author DEV_KANGHYUNKYU
 */
@Service("brandManagerService")
public class BrandManagerServiceImpl implements BrandManagerService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
    private FileUpload fileUpload;
	
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerListCount
	* 2. ClassName  : BrandManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBrandManagerListCount(Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("BrandManager.selectBrandManagerListCount", commandMap);
	}
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerList
	* 2. ClassName  : BrandManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBrandManagerList(Map<String, Object> commandMap) throws Exception {
		return (List<Map<String, Object>>)defaultDAO.selectList("BrandManager.selectBrandManagerList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertBrandManager
	* 2. ClassName  : BrandManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템관리 > 브랜드관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBrandManager (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BND_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("BND_MST_REG_ID", admin.getADM_MST_ID());
        
        //브랜드 관리 등록
        int result = defaultDAO.insert("BrandManager.insertBrandManager", commandMap);
        
        if(result > 0)
        {
            //브랜드 이미지
            List<MultipartFile> fileList = request.getFiles("file");
            
            if(fileList != null && fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_BND_MST"); //    브랜드 이미지는 브랜드(T_BND_MST)테이블 이름을 가진다.
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BND_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = (CommonsMultipartFile)fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        
                        // 브랜드 이미지 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "site", "image", "Y"));
                    }
                }
            }
            
            //셀러 이미지
            Map<String, Object> param = new HashMap<String, Object>();
            List<MultipartFile> sellerFileList = request.getFiles("sellerFile");
            if(sellerFileList != null && sellerFileList.size() > 0)
            {
                int fileSort = 0;
                
                param.put("CMM_FLE_TB_NM", "T_VDR_MST"); //  샐러 이미지는 입점업체(T_VDR_MST)테이블이름을 가진다.
                param.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_MST_IDX"), ""));
                param.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < sellerFileList.size();i++)
                {
                    CommonsMultipartFile file = (CommonsMultipartFile)sellerFileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        param.put("CMM_FLE_SORT", ++fileSort);
                        
                        // 셀러 이미지 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(param, file, "site", "image", "Y"));
                    }
                }
            }
            
        }
        return result;
	}

	/**
	* <pre>
	* 1. MethodName : selectBrandManagerInfo
	* 2. ClassName  : BrandManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 상세정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectBrandManagerInfo(Map<String, Object> commandMap) throws Exception 
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    
		commandMap.put("CMM_FLE_TB_NM", "T_BND_MST");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BND_MST_IDX"), ""));
	    
	    //브랜드 이미지
	    returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
	    
	    Map<String, Object> paramMap = new HashMap<String, Object>();
	    
	    paramMap.put("CMM_FLE_TB_NM", "T_VDR_MST");
	    paramMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_MST_IDX"), ""));
	    
	    //셀러이미지
	    returnMap.put("sellerFile", defaultDAO.selectList("Common.selectCommonFileList", paramMap));
	    
	    returnMap.put("row", defaultDAO.select("BrandManager.selectBrandManagerInfo", commandMap));
	    
	    return returnMap;
	}

	/**
	* <pre>
	* 1. MethodName : updateBrandManager
	* 2. ClassName  : BrandManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 수정
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 3. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateBrandManager(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BND_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("BND_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;
        
        // 브랜드 관리 수정
        result = defaultDAO.update("BrandManager.updateBrandManager", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
            	
        if(result > 0)
        {
        	//기존 파일 삭제
        	String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX");
        	
            if(arrCMM_FLE_IDX != null)
            {
            	for(int i=0;i<arrCMM_FLE_IDX.length;i++)
            	{
            		//파일 상세 정보
            		commandMap.put("CMM_FLE_IDX", arrCMM_FLE_IDX[i]);
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
        	
            //브랜드 이미지 파일 insert
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_BND_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BND_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        
                        // 파일 DB 등록 및 파일 업로드
                        defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "site", "image", "Y"));
                    }
                }
            }
            
            //셀러 이미지 insert
            CommonsMultipartFile sellerFile = (CommonsMultipartFile) request.getFile("sellerFile");
            if(sellerFile != null && !sellerFile.isEmpty())
            {
                commandMap.put("CMM_FLE_TB_NM", "T_VDR_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("VDR_MST_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                commandMap.put("CMM_FLE_SORT", "1");
                
                // 파일 DB 등록 및 파일 업로드
                defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, sellerFile, "site", "image", "Y"));
            }
            
            //파일 삭제한 경우에만..
            if(tempRemoveList != null){
            	for(int i=0;i<tempRemoveList.size();i++){
            		fileUpload.delete(tempRemoveList.get(i));
            	}
            }
        }
        
        return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerNmCheckCount
	* 2. ClassName  : BrandManagerServiceImpl.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드관리 > 브랜드명 중복체크 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBrandManagerNmCheckCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("BrandManager.selectBrandManagerNmCheckCount", commandMap);
	}
	
	public int selectSellerNmCheckCount (Map<String,Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("BrandManager.selectSellerNmCheckCount", commandMap);
    }
	
	public int updateBrandStatus (HttpServletRequest request, Map<String,Object> commandMap) throws Exception {
	    
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put(BRAND_MODEL.BND_MST_UPD_IP, request.getRemoteAddr());
        commandMap.put(BRAND_MODEL.BND_MST_UPD_ID, admin.getADM_MST_ID());
        
        String jsonData = commandMap.get(PARAM_CONST.BRAND_ID_LIST).toString();
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        List<Map<String, Object>> brandDataList = mapper.readValue(jsonData, typeRef);
        
        int result = 0;
        
        for(int index = 0; index < brandDataList.size(); index++){
            String brandCD = StringUtil.getString(brandDataList.get(index).get(BRAND_MODEL.BND_MST_IDX));
            String useState = StringUtil.getString(brandDataList.get(index).get(BRAND_MODEL.BND_MST_USE_YN));
            String dplState = StringUtil.getString(brandDataList.get(index).get(BRAND_MODEL.BND_MST_DPL_STATE)); 
            
            commandMap.put(BRAND_MODEL.BND_MST_IDX, brandCD);
            commandMap.put(BRAND_MODEL.BND_MST_USE_YN, useState);
            commandMap.put(BRAND_MODEL.BND_MST_DPL_STATE, dplState);
            
            result = defaultDAO.update("BrandManager.updateBrandStatus", commandMap);
        }
        
	    return result;
	}
	
	public Map<String, Object> selectBrandInfoByVendor(Map<String,Object> commandMap) throws Exception {
	    return defaultDAO.select("BrandManager.selectBrandInfoByVendor", commandMap);
	}
	
	public int updateBrandList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.update("BrandManager.updateBrandList", commandMap);
	}
	
	public int deleteBrandrManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
        return defaultDAO.update("BrandManager.deleteBrandList", commandMap);
	}   	
	
}
