package com.market.mall.am.display.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.AdService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : AdServiceImpl.java
 * @Date : 2015. 11. 26.
 * @프로그램 설명 : 관리자 > 전시관리 > 광고관리를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("adService")
public class AdServiceImpl implements AdService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	
    @Autowired 
    private FileUpload fileUpload;

    /**
     * <pre>
     * 1. MethodName : selectAdCount
     * 2. ClassName  : AdServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 목록 갯수
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectAdCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Ad.selectAdCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectAdList
     * 2. ClassName  : AdServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 목록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectAdList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("CODE_COMMON_POPUP_VIEW_LOCATION", Code.COMMON_POPUP_VIEW_LOCATION);
        return defaultDAO.selectList("Ad.selectAdList",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectAdView
     * 2. ClassName  : AdServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 상세보기
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectAdView(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	returnMap.put("row", defaultDAO.select("Ad.selectAdInfo", commandMap));
    	
    	commandMap.put("CMM_FLE_TB_NM", "T_AD_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("AD_MST_IDX"), ""));
        
        // 첨부파일 정보
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        
        return returnMap;
    }

    /**
     * <pre>
     * 1. MethodName : insertAd
     * 2. ClassName  : AdServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 등록 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertAd(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String startDate = StringUtil.getString(commandMap.get("AD_MST_ST_DT"), "");
        String endDate = StringUtil.getString(commandMap.get("AD_MST_ED_DT"), "");
        commandMap.put("AD_MST_ST_DT", startDate.replaceAll("-", ""));
        commandMap.put("AD_MST_ED_DT", endDate.replaceAll("-", ""));

		result = defaultDAO.insert("Ad.insertAd", commandMap);

		if(result > 0)
        {
	           commandMap.put("CMM_FLE_TB_NM", "T_AD_MST");
	           commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("AD_MST_IDX"), ""));
	           commandMap.put("CMM_FLE_TB_TYPE", "P");
	           commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());

	           CommonsMultipartFile file = (CommonsMultipartFile) request.getFile("file");
	           if(file != null)
	           {
	               if(!file.isEmpty())
	               {
	            	   commandMap.put("CMM_FLE_SORT", 1);
	                   commandMap.put("CMN_FLE_ALT_TXT", "");
	                   // 파일 등록 및 파일 업로드
	                   result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
	               }
	           }
        }
		
		return result;
	}

    /**
     * <pre>
     * 1. MethodName : updateAd
     * 2. ClassName  : AdServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 수정 처리  
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int updateAd(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String startDate = StringUtil.getString(commandMap.get("AD_MST_ST_DT"), "");
        String endDate = StringUtil.getString(commandMap.get("AD_MST_ED_DT"), "");
		commandMap.put("AD_MST_ST_DT", startDate.replaceAll("-", ""));
		commandMap.put("AD_MST_ED_DT", endDate.replaceAll("-", ""));

		result = defaultDAO.update("Ad.updateAd", commandMap);

		 if(result > 0)
         {
         	
            String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX");
         	String CMM_FLE_SAVE_PATH = "";
         	List<String> tempRemoveList = new ArrayList<String>();
         	
             if(arrCMM_FLE_IDX != null){
             	for(int i=0;i<arrCMM_FLE_IDX.length;i++){
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
         	
	           commandMap.put("CMM_FLE_TB_NM", "T_AD_MST");
	           commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("AD_MST_IDX"), ""));
	           commandMap.put("CMM_FLE_TB_TYPE", "P");
	           commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());

	           CommonsMultipartFile file = (CommonsMultipartFile) request.getFile("file");
	           if(file != null)
	           {
	               if(!file.isEmpty())
	               {
	            	   commandMap.put("CMM_FLE_SORT", 1);
	                   commandMap.put("CMN_FLE_ALT_TXT", "");
	                   // 파일 등록 및 파일 업로드
	                   result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "display", "image", "Y"));
	               }
	           }
	           
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
     * 1. MethodName : adFormMobile
     * 2. ClassName  : AdServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 모바일광고 등록 화면  
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> adFormMobile(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("CODE_COMMON_POPUP_VIEW_LOCATION", Code.COMMON_POPUP_VIEW_LOCATION);
    	commandMap.put("POP_MST_VIEW_ENV", Code.CATEGORY_TYPE_MOBILE);    	
        return defaultDAO.selectList("Ad.selectAdNotUsedViewLocation",commandMap);
    }    
    
    /**
    * <pre>
    * 1. MethodName : selectViewPageCnt
    * 2. ClassName : AdServiceImpl.java
    * 3. Comment : 노출페이지 중복체크
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectViewPageCnt(Map<String, Object> commandMap) throws Exception {
		int cnt = defaultDAO.selectCount("Ad.selectViewPageCnt", commandMap);
		commandMap.put("cnt", cnt);
		return commandMap;
	}
}
