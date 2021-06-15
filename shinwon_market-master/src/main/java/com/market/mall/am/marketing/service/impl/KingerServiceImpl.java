package com.market.mall.am.marketing.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.KingerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : KingerServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 이벤트 관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("kingerService")
public class KingerServiceImpl implements KingerService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;

    /**
    * <pre>
    * 1. MethodName : selectKingerListCount
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 상단노출 갯수
    * 4. 작성자       : hjkim
    * 5. 작성일       : 2020. 06. 08.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerTopDspCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Kinger.selectKingerTopDspCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKingerListCount
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 11.
    * 6. 수정일       : 2020. 06. 08.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Kinger.selectKingerListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKingerList
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * 6. 수정일       : 2020. 06. 08.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectKingerList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Kinger.selectKingerList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectKingerInfo
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * 6. 수정일       : 2020. 06. 08.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectKingerInfo (Map<String, Object> commandMap) throws Exception
    {
       Map<String, Object> returnMap = new HashMap<String, Object>();
       commandMap.put("CMM_FLE_TB_NM", "T_EXP_MST");
       commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
       returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
       returnMap.put("row", defaultDAO.select("Kinger.selectKingerInfo", commandMap));
       
       return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectKingerMailInfo
     * 2. ClassName  : KingerServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectKingerMailInfo (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("Kinger.selectKingerWinMailInfo", commandMap);
     }
     /**
      * <pre>
      * 1. MethodName : selectKingerInfo
      * 2. ClassName  : KingerServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
      * 4. 작성자       : kanghk
      * 5. 작성일       : 2014. 4. 14.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public List<Map<String, Object>> selectKingerReviewMailInfo (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectList("Kinger.selectKingerReviewMailInfo", commandMap);
      }
    
    /**
    * <pre>
    * 1. MethodName : insertKinger
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertKinger (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EXP_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("EXP_MST_REG_ID", admin.getADM_MST_ID());

        String EXP_MST_TOP_DSP_YN = commandMap.get("EXP_MST_TOP_DSP_YN").toString();
        if("Y".equals(EXP_MST_TOP_DSP_YN)) {
            defaultDAO.update("Kinger.updateTopDspKingerN", commandMap);
        }
        
        // 이벤트 기본정보 등록
        result = defaultDAO.insert("Kinger.insertKinger", commandMap);
        
        if(result > 0)
        {
        	//상단노출이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_EXP_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "P");
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
                }
            }
            
        }
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertKingerWin
     * 2. ClassName  : KingerServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 당첨자발표등록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings({ "unchecked", "rawtypes" })
     public int insertKingerWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         int result = 0;
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("EXP_WIN_REG_IP", request.getRemoteAddr());
         commandMap.put("EXP_WIN_REG_ID", admin.getADM_MST_ID());
         
         
         // 이벤트 기본정보 등록
         result = defaultDAO.insert("Kinger.insertKingerWin", commandMap);
         
         if(result > 0)
         { 
         	//
             List<CommonsMultipartFile> fileList = (List) request.getFiles("file"); //	리뷰어모집 상단 노출 이미지
             if(fileList.size() > 0)
             {
                 int fileSort = 0;
                 
                 commandMap.put("CMM_FLE_TB_NM", "T_EXP_MST");
                 commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
                 commandMap.put("CMM_FLE_TB_TYPE", "P");
                 commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                 for(int i = 0;i < fileList.size();i++)
                 {
                     CommonsMultipartFile file = fileList.get(i);
                     
                     if(!file.isEmpty())
                     {
                         commandMap.put("CMM_FLE_SORT", ++fileSort);
                         commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                         // 파일 등록 및 파일 업로드
                         result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "excel", "Y"));
                     }
                 }
             }
            
         }
         return result;
     }
     
     /**
      * <pre>
      * 1. MethodName : updateKingerWin
      * 2. ClassName  : KingerServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 당첨자발표 수정 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 17.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @SuppressWarnings({ "unchecked", "rawtypes" })
      public int updateKingerWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
      {
          int result = 0;
          
          Admin admin = SessionsAdmin.getSessionAdmin(request);
          commandMap.put("EXP_WIN_UPD_IP", request.getRemoteAddr());
          commandMap.put("EXP_WIN_UPD_ID", admin.getADM_MST_ID());
          
          
          // 이벤트 기본정보 등록
          result = defaultDAO.update("Kinger.updateKingerWin", commandMap);
          /*
          if(result > 0)
          {
        	  //기존 파일 삭제
        	  String CMM_FLE_SAVE_PATH = "";
            
        	  //물리적 파일 삭제를 위한 tempList
        	  List<String> tempRemoveList = new ArrayList<String>();
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
         	 
              List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
              if(fileList.size() > 0)
              {
                  int fileSort = 0;
                  
                  
                  commandMap.put("CMM_FLE_TB_NM", "T_EXP_WIN");
                  commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
                  commandMap.put("CMM_FLE_TB_TYPE", "P");
                  commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                  for(int i = 0;i < fileList.size();i++)
                  {
                      CommonsMultipartFile file = fileList.get(i);
                      
                      if(!file.isEmpty())
                      {
                          commandMap.put("CMM_FLE_SORT", ++fileSort);
                          commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+fileSort), ""));
                          // 파일 등록 및 파일 업로드
                          result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "excel", "Y"));
                      }
                  }
              }
              
              //파일 삭제한 경우에만..
              if(tempRemoveList != null){
            	  for(int i=0;i<tempRemoveList.size();i++){
              		fileUpload.delete(tempRemoveList.get(i));
            	  }
              }
              
             
          }
          */
          return result;
      }
    
    /**
    * <pre>
    * 1. MethodName : updateKinger
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int updateKinger (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EXP_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("EXP_MST_UPD_ID", admin.getADM_MST_ID());
        
        int result = 0;

        // 상단 노출 여부 체크
        String EXP_MST_TOP_DSP_YN = commandMap.get("EXP_MST_TOP_DSP_YN").toString();
        if("Y".equals(EXP_MST_TOP_DSP_YN)) {
            defaultDAO.update("Kinger.updateTopDspKingerN", commandMap);
        }

        // 이벤트 기본정보 수정
        result = defaultDAO.update("Kinger.updateKinger", commandMap);
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
        	
        	commandMap.put("CMM_FLE_TB_NM", "T_EXP_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
             
          //PC 목록 이미지
            CommonsMultipartFile file1 =  (CommonsMultipartFile) request.getFile("file");
            
            if(file1 != null){
            	if(!file1.isEmpty())
            	{
            		commandMap.put("CMM_FLE_TB_TYPE", "P");
            		commandMap.put("CMM_FLE_SORT", "1");
            		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
            		// 파일 등록 및 파일 업로드
            		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file1, "marketing", "image", "Y"));
            	}
            }
            /*
            CommonsMultipartFile file2 =  (CommonsMultipartFile) request.getFile("file2");//상품특징파일
            
            if(file2 != null){
            	if(!file2.isEmpty())
            	{
            		commandMap.put("CMM_FLE_TB_TYPE", "S");
            		commandMap.put("CMM_FLE_SORT", "1");
            		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
            		// 파일 등록 및 파일 업로드
            		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file2, "marketing", "fileType", "Y"));
            	}
            }*/
            
        }
        
        //파일 삭제한 경우에만..
        if(tempRemoveList != null){
        	for(int i=0;i<tempRemoveList.size();i++){
        		fileUpload.delete(tempRemoveList.get(i));
        	}
        }
        
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateKingerList
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateKingerList(Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.update("Kinger.updateKingerList", commandMap);
    }

    /**
    * <pre>
    * 1. MethodName : selectKingerEntryListCount
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectKingerEntryListCount (Map<String, Object> commandMap) throws Exception
    {
    	int result = 0;
    	
    	result = defaultDAO.selectCount("Kinger.selectKingerEntryListCount", commandMap);
    	 
        return result;
    }
     
    /**
    * <pre>
    * 1. MethodName : selectKingerEntryList
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
     public Map<String, Object> selectKingerEntryList (Map<String, Object> commandMap) throws Exception
     {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		 
		returnMap.put("info", defaultDAO.select("Kinger.selectKingerInfo", commandMap));
		returnMap.put("list", defaultDAO.selectList("Kinger.selectKingerEntryList", commandMap));
		
		return returnMap;
     }
     
     /**
      * <pre>
      * 1. MethodName : selectKingerWinListCount
      * 2. ClassName  : KingerServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 목록 갯수 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 17.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public int selectKingerWinListCount (Map<String, Object> commandMap) throws Exception
      {
    	  int result = 0;
       
    	  result = defaultDAO.selectCount("Kinger.selectKingerWinListCount", commandMap);
      	 
          return result;
      }
       
      /**
      * <pre>
      * 1. MethodName : selectKingerWinList
      * 2. ClassName  : KingerServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 목록 
      * 4. 작성자       : khcho	
      * 5. 작성일       : 2015. 12. 17.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public Map<String, Object> selectKingerWinList (Map<String, Object> commandMap) throws Exception
      {
    	  Map<String, Object> returnMap = new HashMap<String, Object>();
  		  
    	  returnMap.put("list", defaultDAO.selectList("Kinger.selectKingerWinList", commandMap));
  		
          return returnMap;
      }
      
      /**
       * <pre>
       * 1. MethodName : selectKingerReviewListCount
       * 2. ClassName  : KingerServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 > 리뷰 목록 갯수 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 23.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       public int selectKingerReviewListCount (Map<String, Object> commandMap) throws Exception
       {
       	int result = 0;
       	
       	result = defaultDAO.selectCount("Kinger.selectKingerReviewListCount", commandMap);
       	 
           return result;
       }
        
       /**
       * <pre>
       * 1. MethodName : selectKingerReviewList
       * 2. ClassName  : KingerServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 > 리뷰 목록 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 23.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
        public Map<String, Object> selectKingerReviewList (Map<String, Object> commandMap) throws Exception
        {
        	Map<String, Object> returnMap = new HashMap<String, Object>();
   		 
        	returnMap.put("info", defaultDAO.select("Kinger.selectKingerInfo", commandMap));
   		
        	returnMap.put("list", defaultDAO.selectList("Kinger.selectKingerReviewList", commandMap));
   			
            return returnMap;
        }
      
      /**
       * <pre>
       * 1. MethodName : selectKingerWinInfo
       * 2. ClassName  : KingerServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 목록 상세 
       * 4. 작성자       : khcho	
       * 5. 작성일       : 2015. 12. 17.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       public Map<String, Object> selectKingerWinInfo (Map<String, Object> commandMap) throws Exception
       {
     	  Map<String, Object> returnMap = new HashMap<String, Object>();
     	  
     	  commandMap.put("CMM_FLE_TB_NM", "T_EXP_WIN");
          commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
          
          returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
     	  returnMap.put("rowWin", defaultDAO.select("Kinger.selectKingerWinInfo", commandMap));
   		
           return returnMap;
       }
     
 
      
    /**
     * <pre>
     * 1. MethodName : updateKingerEntryWinnerDel
     * 2. ClassName  : KingerServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 당첨자 수정 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public int updateKingerEntryWinnerDel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
    	 int result = 0;
    	 result = defaultDAO.update("Kinger.updateKingerEntryWinnerDel", commandMap);
    	 
    	 return result;
     }
    /**
    * <pre>
    * 1. MethodName : updateKingerEntryWinner
    * 2. ClassName  : KingerServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 당첨자 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int updateKingerEntryWinner (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EXP_ETR_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("EXP_ETR_UPD_IP", request.getRemoteAddr());
        
        this.updateKingerEntryWinnerDel(request,  commandMap);
        
        List<Map<String, Object>> list = (List<Map<String, Object>>)commandMap.get("kingerEntryWinnerList");
        for(int i = 0;i < list.size();i++)
        {
            Map<String, Object> dataMap = (Map<String, Object>) list.get(i);
                
            commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(dataMap.get("KINGER_ID"), ""));
        		
        	result = defaultDAO.update("Kinger.updateKingerEntryWinner", commandMap);
        	
        }
        
        return result;
    }
   
  
	/**
	* <pre>
	* 1. MethodName : updateKingerWin
	* 2. ClassName : KingerServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 당첨여부 업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateKingerWin(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		String[] expEtrIdxs = request.getParameterValues("expEtrIdxs[]");
		String[] expEtrWinYns = request.getParameterValues("expEtrWinYns[]");
		
		int result = 0;
		
		for(int i=0; i< expEtrIdxs.length; i++)
		{
			String expEtrIdx = expEtrIdxs[i];
			String expEtrWinYn = expEtrWinYns[i];
			
			commandMap.put("EXP_ETR_IDX", expEtrIdx);
			commandMap.put("EXP_ETR_WIN_YN", expEtrWinYn);
			
			result = defaultDAO.update("Kinger.updateKingerWin", commandMap);
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateKingerReviewBest
	* 2. ClassName : KingerServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 고객체험단 상세정보 > 리뷰 베스트여부 업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateKingerReviewBest(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		String[] expRevIdxs = request.getParameterValues("expRevIdxs[]");
		String[] expRevBstYns = request.getParameterValues("expRevBstYns[]");
		String[] expRevUseYns = request.getParameterValues("expRevUseYns[]");
		
		int result = 0;
		
		for(int i=0; i< expRevIdxs.length; i++)
		{
			String expRevIdx = expRevIdxs[i];
			String expRevBstYn = expRevBstYns[i];
			String expRevUseYn = expRevUseYns[i];
			
			commandMap.put("EXP_REV_IDX", expRevIdx);
			commandMap.put("EXP_REV_BST_YN", expRevBstYn);
			commandMap.put("EXP_REV_USE_YN", expRevUseYn);
			
			result = defaultDAO.update("Kinger.updateKingerReviewBest", commandMap);
		}
		
		return result;
	}
	 
	
	 
    /**
     * <pre>
     * 1. MethodName : selectKingerActivePopupListCount
     * 2. ClassName  : KingerServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectKingerActivePopupListCount (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectCount("Kinger.selectKingerActivePopupListCount", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectKingerActivePopupList
     * 2. ClassName  : KingerServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String,Object>>selectKingerActivePopupList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("Kinger.selectKingerActivePopupList", commandMap);
     }
     
     
     /**
      * <pre>
      * 1. MethodName : updateKingerWinMst
      * 2. ClassName  : KingerServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자발표수정
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 23.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @SuppressWarnings("unchecked")
      public int updateKingerWinMst (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
      {
          Admin admin = SessionsAdmin.getSessionAdmin(request);
          commandMap.put("EXP_WIN_UPD_IP", request.getRemoteAddr());
          commandMap.put("EXP_WIN_UPD_ID", admin.getADM_MST_ID());
          
          int result = 0;
          
          // 이벤트 기본정보 수정
          result = defaultDAO.update("Kinger.updateKingerWinMst", commandMap);
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
          	
          	  commandMap.put("CMM_FLE_TB_NM", "T_EXP_WIN");
              commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EXP_MST_CD"), ""));
              commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
               
            //PC 목록 이미지
              CommonsMultipartFile file1 =  (CommonsMultipartFile) request.getFile("file");
              
              if(file1 != null){
              	if(!file1.isEmpty())
              	{
              		commandMap.put("CMM_FLE_TB_TYPE", "P");
              		commandMap.put("CMM_FLE_SORT", "1");
              		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
              		// 파일 등록 및 파일 업로드
              		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file1, "marketing", "excel", "Y"));
              	}
              }
              
          }
          
          //파일 삭제한 경우에만..
          if(tempRemoveList != null){
          	for(int i=0;i<tempRemoveList.size();i++){
          		fileUpload.delete(tempRemoveList.get(i));
          	}
          }
          
          return result;
      }
      
      public List<Map<String, Object>> selectKingerEntryUrlList (Map<String, Object> commandMap) throws Exception
      {
    	  return defaultDAO.selectList("Kinger.selectKingerEntryUrlList", commandMap);
      }
     
}