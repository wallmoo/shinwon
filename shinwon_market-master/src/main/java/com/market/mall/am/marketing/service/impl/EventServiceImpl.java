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
import com.market.mall.am.marketing.service.EventService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : EventServiceImpl.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 이벤트 관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("eventService")
public class EventServiceImpl implements EventService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    /**
    * <pre>
    * 1. MethodName : selectEventListCount
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectEventListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Event.selectEventListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectEventList
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEventList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Event.selectEventList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectEventInfo
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectEventInfo (Map<String, Object> commandMap) throws Exception
    {
       Map<String, Object> returnMap = new HashMap<String, Object>();
       commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
       commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
       returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
       returnMap.put("row", defaultDAO.select("Event.selectEventInfo", commandMap));
       returnMap.put("dtlList", defaultDAO.selectList("Event.selectEventDetail", commandMap));
       returnMap.put("dtlImgList", defaultDAO.selectList("Event.selectEventDetailImageList", commandMap));
       
       return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertEvent
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertEvent (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EVT_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("EVT_MST_REG_ID", admin.getADM_MST_ID());
        
        String eventType = StringUtil.getString(commandMap.get("EVT_MST_TYPE"),"");
        String EVT_MST_SVY_TYPE = StringUtil.getString(commandMap.get("EVT_MST_SVY_TYPE"),"T");
        
        // 이벤트 기본정보 등록
        result = defaultDAO.insert("Event.insertEvent", commandMap);
        
        if(result > 0)
        {
        	if("713".equals(eventType))
        	{
        		if("T".equals(EVT_MST_SVY_TYPE))
        		{
		        	String [] EVT_DTL_NM = StringUtil.getArray(commandMap, "EVT_DTL_NM");
		        	String [] EVT_DTL_NO = StringUtil.getArray(commandMap, "EVT_DTL_NO");
		        	
		            for(int y = 0;y < EVT_DTL_NM.length;y++)
		            {
		            	commandMap.put("EVT_DTL_NM", EVT_DTL_NM[y]);
		            	commandMap.put("EVT_DTL_NO", EVT_DTL_NO[y]);
		            	
		                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
		                // 상품 구성 등록
		                defaultDAO.insert("Event.insertEventDetail", commandMap);
		            }
        		}
		        else
		        {
		        	String [] EVT_DTL_NO = StringUtil.getArray(commandMap, "EVT_DTL_NO_F");
		        	
		        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_DTL");
		        	commandMap.put("CMM_FLE_TB_TYPE", "P");
		        	commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
		        	
		            for(int y = 0;y < EVT_DTL_NO.length;y++)
		            {
		            	commandMap.put("EVT_DTL_NM", EVT_DTL_NO[y]);
		            	commandMap.put("EVT_DTL_NO", EVT_DTL_NO[y]);
		            	
		                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
		                // 상품 구성 등록
		                defaultDAO.insert("Event.insertEventDetail", commandMap);
		                
		                CommonsMultipartFile fileSvy = (CommonsMultipartFile)request.getFile("fileSvy"+EVT_DTL_NO[y]);
		                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_DTL_IDX"), ""));
		                   
		                if(!fileSvy.isEmpty())
		                {
		                 	commandMap.put("CMM_FLE_SORT", EVT_DTL_NO[y]);
		                    //commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+EVT_DTL_NO[y]), ""));
		                    // 파일 등록 및 파일 업로드
		                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, fileSvy, "marketing", "image", "Y"));
		                }
		                
		            }
		        }
        	}
        	
        	
        	/**
             * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
             * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
             * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
             * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
             * 설문항목 이미지는 CMM_FLE_TB_TYPE이 S
             */	
        	//PC용 이미지
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
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
            
            //모바일용 이미지
            List<CommonsMultipartFile> fileList2 = (List) request.getFiles("file2");
            if(fileList2.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "M");
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList2.size();i++)
                {
                    CommonsMultipartFile file = fileList2.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M"+fileSort), ""));
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
     * 1. MethodName : insertEventWin
     * 2. ClassName  : EventServiceImpl.java
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
     public int insertEventWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
         int result = 0;
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         commandMap.put("EVT_WIN_REG_IP", request.getRemoteAddr());
         commandMap.put("EVT_WIN_REG_ID", admin.getADM_MST_ID());
         
         
         // 이벤트 기본정보 등록
         result = defaultDAO.insert("Event.insertEventWin", commandMap);
         
         if(result > 0)
         {
        	 /**
              * PC 목록 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 1
              * PC 상세 이미지는 CMM_FLE_TB_TYPE이 P,  CMM_FLE_SORT가 2
              * 모바일 목록 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 1
              * 모바일 상세 이미지는 CMM_FLE_TB_TYPE이 M,  CMM_FLE_SORT가 2
              * 설문항목 이미지는 CMM_FLE_TB_TYPE이 S
              */	
         	//PC용 이미지
             List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
             if(fileList.size() > 0)
             {
                 int fileSort = 0;
                 
                 commandMap.put("CMM_FLE_TB_NM", "T_EVT_WIN");
                 commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_WIN_IDX"), ""));
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
      * 1. MethodName : updateEventWin
      * 2. ClassName  : EventServiceImpl.java
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
      public int updateEventWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
      {
          int result = 0;
          
          Admin admin = SessionsAdmin.getSessionAdmin(request);
          commandMap.put("EVT_WIN_UPD_IP", request.getRemoteAddr());
          commandMap.put("EVT_WIN_UPD_ID", admin.getADM_MST_ID());
          
          
          // 이벤트 기본정보 등록
          result = defaultDAO.update("Event.updateEventWin", commandMap);
          
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
                  
                  commandMap.put("CMM_FLE_TB_NM", "T_EVT_WIN");
                  commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_WIN_IDX"), ""));
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
          return result;
      }
    
    /**
    * <pre>
    * 1. MethodName : updateEvent
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int updateEvent (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EVT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("EVT_MST_UPD_ID", admin.getADM_MST_ID());
        
        String eventType = StringUtil.getString(commandMap.get("EVT_MST_TYPE"),"");
        String EVT_MST_SVY_TYPE = StringUtil.getString(commandMap.get("EVT_MST_SVY_TYPE"),"");
        int result = 0;
        
        // 이벤트 기본정보 수정
        result = defaultDAO.update("Event.updateEvent", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
            	
        if(result > 0)
        {
        	if("713".equals(eventType))
        	{
        		if("T".equals(EVT_MST_SVY_TYPE))
        		{
	        		defaultDAO.delete("Event.deleteEventDetail", commandMap);
	        		
		        	String [] EVT_DTL_NM = StringUtil.getArray(commandMap, "EVT_DTL_NM");
		        	String [] EVT_DTL_NO = StringUtil.getArray(commandMap, "EVT_DTL_NO");
		        	
		            for(int y = 0;y < EVT_DTL_NM.length;y++)
		            {
		            	commandMap.put("EVT_DTL_NM", EVT_DTL_NM[y]);
		            	commandMap.put("EVT_DTL_NO", EVT_DTL_NO[y]);
		            	
		                //commandMap.put("PLN_DTL_ORDER", StringUtil.getString(commandMap.get("PLN_DTL_ORDER" + "_" + groupNum[i] + "_" + PLN_PRD_MST_CD[y]), ""));
		                // 상품 구성 등록
		                defaultDAO.insert("Event.insertEventDetail", commandMap);
		            }
        		}
        		else
        		{
        			//기존 파일 삭제
                	String[] arrCMM_FLE_IDX = request.getParameterValues("CMM_FLE_IDX_SVY");
                	
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
                    
                    //defaultDAO.delete("Event.deleteEventDetail", commandMap);
        			
        			String [] EVT_DTL_NO = StringUtil.getArray(commandMap, "EVT_DTL_NO_F");
		        	
		        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_DTL");
		        	commandMap.put("CMM_FLE_TB_TYPE", "P");
		        	commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
		        	
		            for(int y = 0;y < EVT_DTL_NO.length;y++)
		            {
		            	String EVT_DTL_IDX_F = StringUtil.getString(commandMap.get("EVT_DTL_IDX_F"+EVT_DTL_NO[y]),"");
		            	commandMap.put("EVT_DTL_NM", EVT_DTL_NO[y]);
		            	commandMap.put("EVT_DTL_NO", EVT_DTL_NO[y]);
		            	
		            	if("".equals(EVT_DTL_IDX_F))//추가
		            	{
			                defaultDAO.insert("Event.insertEventDetail", commandMap);
			                
			                CommonsMultipartFile fileSvy = (CommonsMultipartFile)request.getFile("fileSvy"+EVT_DTL_NO[y]);
			                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_DTL_IDX"), ""));
			                if(fileSvy != null)
			                {
				                if(!fileSvy.isEmpty())
				                {
				                 	commandMap.put("CMM_FLE_SORT", EVT_DTL_NO[y]);
				                    //commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P"+EVT_DTL_NO[y]), ""));
				                    // 파일 등록 및 파일 업로드
				                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, fileSvy, "marketing", "image", "Y"));
				                }
			                }
		            	}
		            	else//변경
		            	{
		            		CommonsMultipartFile fileSvy = (CommonsMultipartFile)request.getFile("fileSvy"+EVT_DTL_NO[y]);
		            		if(fileSvy !=null&&!fileSvy.isEmpty())//파일이 변경된 경우에만 처리함
			                {
		            			commandMap.put("EVT_DTL_IDX_DEL", EVT_DTL_IDX_F);
		            			defaultDAO.delete("Event.deleteEventDetailOne", commandMap);
		            			
		            			defaultDAO.insert("Event.insertEventDetail", commandMap);
				                
		            			commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_DTL_IDX"), ""));
				                commandMap.put("CMM_FLE_SORT", EVT_DTL_NO[y]);
				                
				                result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, fileSvy, "marketing", "image", "Y"));
		            			
			                }
		            	}
		                
		            }
        		}
        	}
        	
        	
        	
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
        	
            // 설문항목
            String removeFileIdx = StringUtil.getString(commandMap.get("cmmFleIdx5"), "");
        	
        	String[] removeFiles = removeFileIdx.split(",");
                	
        	for(int i=0; i< removeFiles.length; i++)
        	{        		
        		removeFileIdx = removeFiles[i];
        		commandMap.put("CMM_FLE_IDX", removeFileIdx);
        		
	        	if(!("").equals(removeFileIdx)){	        		
	        		//파일 상세 정보
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
      
        	commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
             
          //PC 목록 이미지
            CommonsMultipartFile file1 =  (CommonsMultipartFile) request.getFile("file1");
            
            if(file1 != null){
            	if(!file1.isEmpty())
            	{
            		commandMap.put("CMM_FLE_TB_TYPE", "P");
            		commandMap.put("CMM_FLE_SORT", "1");
            		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
            		// 파일 등록 및 파일 업로드
            		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file1, "marketing", "image", "Y"));
            	}
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), "")))
        	{
        		//대체 텍스트만 변경된 경우...
        		commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1"), ""));
        		commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P1_IDX"), ""));
        		defaultDAO.update("Common.updateCommonFileAltText", commandMap);
        	}
            
            //PC 상세 이미지
            CommonsMultipartFile file2 =  (CommonsMultipartFile) request.getFile("file2");
            if(file2 != null){
            	if(!file2.isEmpty())
            	{
            		commandMap.put("CMM_FLE_TB_TYPE", "P");
            		commandMap.put("CMM_FLE_SORT", "2");
            		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
            		// 파일 등록 및 파일 업로드
            		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file2, "marketing", "image", "Y"));
            	}
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), "")))
        	{            
        		//대체 텍스트만 변경된 경우...
        		commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2"), ""));
        		commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_P2_IDX"), ""));
        		defaultDAO.update("Common.updateCommonFileAltText", commandMap);
        	}
        	
            //모바일 목록 이미지
            CommonsMultipartFile file3 =  (CommonsMultipartFile) request.getFile("file3");
            
            if(file3 != null){
            	if(!file3.isEmpty())
            	{
            		commandMap.put("CMM_FLE_TB_TYPE", "M");
            		commandMap.put("CMM_FLE_SORT", "1");
            		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
            		// 파일 등록 및 파일 업로드
            		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file3, "marketing", "image", "Y"));
            	}
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), "")))
        	{
        		//대체 텍스트만 변경된 경우...
        		commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1"), ""));
        		commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M1_IDX"), ""));
        		defaultDAO.update("Common.updateCommonFileAltText", commandMap);
        	}
            
            //모바일 상세 이미지
            CommonsMultipartFile file4 =  (CommonsMultipartFile) request.getFile("file4");
            if(file4 != null){
            	if(!file4.isEmpty())
            	{
            		commandMap.put("CMM_FLE_TB_TYPE", "M");
            		commandMap.put("CMM_FLE_SORT", "2");
            		commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), ""));
            		// 파일 등록 및 파일 업로드
            		result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file4, "marketing", "image", "Y"));
            	}
            }else if(!"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), "")) && !"".equals(StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2_IDX"), "")))
        	{
        		//대체 텍스트만 변경된 경우...
        		commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2"), ""));
        		commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_M2_IDX"), ""));
        		defaultDAO.update("Common.updateCommonFileAltText", commandMap);
        	}
            
            //설문 항목
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file5");
            
            String updateFileIdx = StringUtil.getString(commandMap.get("cmnFleAltTxtSurveyIdx"), "");
            String updateFile = StringUtil.getString(commandMap.get("cmnFleAltTxtSurvey"), "");
            
        	String[] updateFileIdxs = updateFileIdx.split(",");
        	String[] updateFiles = updateFile.split(",");
        	
        	for(int i=0; i< updateFileIdxs.length; i++)
        	{        		
        		updateFileIdx = updateFileIdxs[i];
        		updateFile = updateFiles[i];
        		
        		if(!"".equals(StringUtil.getString(updateFile, "")) && !"".equals(StringUtil.getString(updateFileIdx, "")))
             	{        			
             		//대체 텍스트만 변경된 경우...
             		commandMap.put("CMN_FLE_ALT_TXT_OLD", StringUtil.getString(updateFile, ""));
             		commandMap.put("CMN_FLE_ALT_TXT_IDX", StringUtil.getString(updateFileIdx, ""));
             		defaultDAO.update("Common.updateCommonFileAltText", commandMap);
             	}
        	}

        	if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_TYPE", "S");        		
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        commandMap.put("CMN_FLE_ALT_TXT", StringUtil.getString(commandMap.get("CMN_FLE_ALT_TXT_S"+fileSort), ""));
                        // 파일 DB 등록 및 파일 업로드
                        defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "marketing", "image", "Y"));
                    }
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
    
    /**
    * <pre>
    * 1. MethodName : selectEventDetailImageList
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 설문 이미지 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 1. 12.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEventDetailImageList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Event.selectEventDetailImageList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectEventDetailList
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 경품 / 사은품 정보 목록 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectEventDetailList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("Event.selectEventDetailList", commandMap);
     }
    
    /**
    * <pre>
    * 1. MethodName : selectEventEntryListCount
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectEventEntryListCount (Map<String, Object> commandMap) throws Exception
    {
    	int result = 0;
    	int evtMstType = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
    	
    	// 이벤트 유형 - 응모형
    	if(evtMstType == Code.EVENT_MASTER_TYPE_NORMAL)
    	{
    		result = defaultDAO.selectCount("Event.selectEventEntryListCount", commandMap);
    	}
    	// 이벤트 유형 - 덧글형
    	else if(evtMstType == Code.EVENT_MASTER_TYPE_REPLY)
    	{
    		result = defaultDAO.selectCount("Event.selectEventReplyListCount", commandMap);
    	}
    	//이미지형
    	else if(evtMstType == Code.EVENT_MASTER_TYPE_IMAGE)
    	{
    		result = defaultDAO.selectCount("Event.selectEventReplyListCount", commandMap);
    	}
    	else if(evtMstType == Code.EVENT_MASTER_TYPE_SURVEY)
    	{
    		result = 1;
    	}
    	 
        return result;
    }
     
    /**
    * <pre>
    * 1. MethodName : selectEventEntryList
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
     public Map<String, Object> selectEventEntryList (Map<String, Object> commandMap) throws Exception
     {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		 
		returnMap.put("basicRow", defaultDAO.select("Event.selectEventInfo", commandMap));
		
		int evtMstType = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
		// 이벤트 유형 - 응모형
		if(evtMstType == Code.EVENT_MASTER_TYPE_NORMAL)
		{
			returnMap.put("list", defaultDAO.selectList("Event.selectEventEntryList", commandMap));
		}
		// 이벤트 유형 - 덧글형
		else if(evtMstType == Code.EVENT_MASTER_TYPE_REPLY)
		{
			List<Map<String,Object>> list = defaultDAO.selectList("Event.selectEventReplyList", commandMap);
			
			for(int i=0; i< list.size(); i++)
			{
				Map<String, Object> rowMap = list.get(i);
				String contents = StringUtil.getString(rowMap.get("EVT_REPLY_CONTENTS"),"").replace("\r\n","<br/>");
				rowMap.put("EVT_REPLY_CONTENTS", contents);
			}
			
			returnMap.put("list", list);
		}
		// 이벤트 유형 - 설문형
    	else if(evtMstType == Code.EVENT_MASTER_TYPE_SURVEY)
    	{
    		
    		returnMap.put("info",defaultDAO.select("Event.selectEventSurveyInfo", commandMap));
    		returnMap.put("list",defaultDAO.selectList("Event.selectEventDetailList", commandMap));
    		
    	}
		// 이벤트 유형 - 이미지형
    	else if(evtMstType == Code.EVENT_MASTER_TYPE_IMAGE)
    	{
    		commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
            commandMap.put("CMM_FLE_TB_TYPE", "S");
    		returnMap.put("list",defaultDAO.selectList("Event.selectEventSurveyList", commandMap));
    	}
		
         return returnMap;
     }
     
     /**
      * <pre>
      * 1. MethodName : selectEventWinListCount
      * 2. ClassName  : EventServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 목록 갯수 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 17.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public int selectEventWinListCount (Map<String, Object> commandMap) throws Exception
      {
    	  int result = 0;
       
    	  result = defaultDAO.selectCount("Event.selectEventWinListCount", commandMap);
      	 
          return result;
      }
       
      /**
      * <pre>
      * 1. MethodName : selectEventWinList
      * 2. ClassName  : EventServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 목록 
      * 4. 작성자       : khcho	
      * 5. 작성일       : 2015. 12. 17.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public Map<String, Object> selectEventWinList (Map<String, Object> commandMap) throws Exception
      {
    	  Map<String, Object> returnMap = new HashMap<String, Object>();
  		  
    	  returnMap.put("list", defaultDAO.selectList("Event.selectEventWinList", commandMap));
  		
          return returnMap;
      }
      /**
       * <pre>
       * 1. MethodName : selectEventWinInfo
       * 2. ClassName  : EventServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 목록 상세 
       * 4. 작성자       : khcho	
       * 5. 작성일       : 2015. 12. 17.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       public Map<String, Object> selectEventWinInfo (Map<String, Object> commandMap) throws Exception
       {
     	  Map<String, Object> returnMap = new HashMap<String, Object>();
     	  
     	  commandMap.put("CMM_FLE_TB_NM", "T_EVT_WIN");
          commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_WIN_IDX"), ""));
          
          returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
     	  returnMap.put("rowWin", defaultDAO.select("Event.selectEventWinInfo", commandMap));
   		
           return returnMap;
       }
     
     /**
      * <pre>
      * 1. MethodName : selectEventEntryLotList
      * 2. ClassName  : EventServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 자동추첨 목록 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 16.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
     @SuppressWarnings("unchecked")
     public Map<String, Object> selectEventLotList (Map<String, Object> commandMap) throws Exception
     {
    	 Map<String, Object> returnMap = new HashMap<String, Object>();
    	   
    	 String lotGb = StringUtil.getString(commandMap.get("lotGb"),"M");
    	 if("M".equals(lotGb))
    	 {
    		 List<Map<String,Object>> list = defaultDAO.selectList("Event.selectEventLotList", commandMap);
    		 returnMap.put("list", list);
    	 }
    	 else
    	 {
    		   
    		 List<Map<String,Object>> list = defaultDAO.selectList("Event.selectEventAutoLotList", commandMap);
    		 returnMap.put("list", list);
    	 }
  	 
         return returnMap;
     }
     
     /**
      * <pre>
      * 1. MethodName : selectEventWinnerInfo
      * 2. ClassName  : EventServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 정보 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 16.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
    public Map<String, Object> selectEventWinnerInfo (Map<String, Object> commandMap) throws Exception
    {
  		Map<String, Object> returnMap = new HashMap<String, Object>();
  		
  		int evtMstType = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
  		// 이벤트 유형 - 응모형
  		if(evtMstType == Code.EVENT_MASTER_TYPE_NORMAL)
  		{
  			returnMap.put("info", defaultDAO.select("Event.selectEventNormalInfo", commandMap));
  		}
  		// 이벤트 유형 - 덧글형
  		else if(evtMstType == Code.EVENT_MASTER_TYPE_REPLY)
  		{
  			returnMap.put("info",defaultDAO.select("Event.selectEventReplyInfo", commandMap));
  		}
  		// 이벤트 유형 - 설문형
      	else if(evtMstType == Code.EVENT_MASTER_TYPE_SURVEY)
      	{
      		returnMap.put("info",defaultDAO.select("Event.selectEventSurveyInfo", commandMap));
      	}
  		// 이벤트 유형 - 이미지형`
      	else if(evtMstType == Code.EVENT_MASTER_TYPE_IMAGE)
      	{
      		returnMap.put("info",defaultDAO.select("Event.selectEventImageInfo", commandMap));
      	}
  		
        return returnMap;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : updateEventEntryWinnerDel
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자 수정 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public int updateEventEntryWinnerDel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
     {
    	 int result = 0;
    	 defaultDAO.update("Event.updateEventEntryWinnerDel", commandMap);
    	 defaultDAO.update("Event.updateEventReplyWinnerDel", commandMap);
    	 defaultDAO.update("Event.updateEventSurveyWinnerDel", commandMap);
    	 defaultDAO.update("Event.updateEventImageWinnerDel", commandMap);
    	 
    	 return result;
     }
    /**
    * <pre>
    * 1. MethodName : updateEventEntryWinner
    * 2. ClassName  : EventServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int updateEventEntryWinner (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EVT_MST_UPLOAD_ID", admin.getADM_MST_ID());
        commandMap.put("EVT_MST_UPLOAD_IP", request.getRemoteAddr());
        
        List<Map<String, Object>> list = (List<Map<String, Object>>)commandMap.get("eventEntryWinnerList");
        
        for(int i = 0;i < list.size();i++)
        {
        	if(i==0)
        	{
        		updateEventEntryWinnerDel(request,commandMap);
        		defaultDAO.delete("Event.deleteEventWinInf", commandMap);
        	}
            Map<String, Object> dataMap = (Map<String, Object>) list.get(i);
                
            int evtMstType = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
            // 이벤트 유형 - 응모형
        	if(evtMstType == Code.EVENT_MASTER_TYPE_NORMAL)
        	{
        		commandMap.put("EVT_ETR_REG_ID", StringUtil.getString(dataMap.get("MEM_MST_MEM_ID"), ""));
        		
        		result = defaultDAO.update("Event.updateEventEntryWinner", commandMap);
        	}
        	// 이벤트 유형 - 덧글형
        	else if(evtMstType == Code.EVENT_MASTER_TYPE_REPLY)
        	{
        		commandMap.put("EVT_RPL_REG_ID", StringUtil.getString(dataMap.get("MEM_MST_MEM_ID"), ""));
        		
        		result = defaultDAO.update("Event.updateEventReplyWinner", commandMap);
        	}
        	// 이벤트 유형 - 설문형
            else if(evtMstType == Code.EVENT_MASTER_TYPE_SURVEY)
            {
            	commandMap.put("EVT_SVY_REG_ID", StringUtil.getString(dataMap.get("MEM_MST_MEM_ID"), ""));
            	
        		result = defaultDAO.update("Event.updateEventSurveyWinner", commandMap);
            }
            else if(evtMstType == Code.EVENT_MASTER_TYPE_IMAGE)
            {
            	commandMap.put("EVT_IMG_REG_ID", StringUtil.getString(dataMap.get("MEM_MST_MEM_ID"), ""));
            	
        		result = defaultDAO.update("Event.updateEventImageWinner", commandMap);
            }
        	
       
        	commandMap.put("WIN_INF_NM", StringUtil.getString(dataMap.get("WIN_INF_NM"), ""));
        	commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(dataMap.get("MEM_MST_MEM_ID"), ""));
        	
        	
        	defaultDAO.insert("Event.insertEventWinInf", commandMap);
        	}
	     
        
        return result;
    }
    
    /**
	    * <pre>
	    * 1. MethodName : selectEventReplyListCount
	    * 2. ClassName  : EventServiceImpl.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 덧글 목록 갯수
	    * 4. 작성자       : DEV_KIMSOYOUNG
	    * 5. 작성일       : 2015. 4. 06.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventReplyListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("Event.selectEventReplyListCount", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventReplyList
	    * 2. ClassName  : EventServiceImpl.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 덧글 목록 
	    * 4. 작성자       : DEV_KIMSOYOUNG
	    * 5. 작성일       : 2015. 4. 06.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectEventReplyList(Map<String, Object> commandMap) throws Exception 
	{
		List<Map<String,Object>> list = defaultDAO.selectList("Event.selectEventReplyList", commandMap);
		
		for(int i=0; i< list.size(); i++)
		{
			Map<String, Object> rowMap = list.get(i);
			String contents = StringUtil.getString(rowMap.get("EVT_REPLY_CONTENTS"),"").replace("\r\n","<br/>");
			rowMap.put("EVT_REPLY_CONTENTS", contents);
		}
		
		return list;
	}

	/**
	* <pre>
	* 1. MethodName : deleteEventReply
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 선택된 덧글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 06.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteEventReply(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		String[] removeReplyIdxs = request.getParameterValues("evtReplyIdxs[]");
		String[] removeReplyDisplays = request.getParameterValues("evtReplyDisplayYns[]");
		
		int result = 0;
		
		for(int i=0; i< removeReplyIdxs.length; i++)
		{
			String removeReplyIdx = removeReplyIdxs[i];
			String removeReplyDisplay = removeReplyDisplays[i];
			
			commandMap.put("EVT_RPL_IDX", removeReplyIdx);
			
			if(removeReplyDisplay.equals("Y"))
			{
				commandMap.put("EVT_RPL_DPL_YN", "N");
			}
			else
			{
				commandMap.put("EVT_RPL_DPL_YN", "Y");
			}
			
			result = defaultDAO.update("Event.deleteEventReply", commandMap);
		}
		
		return result;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventImageListCount
	    * 2. ClassName  : EventServiceImpl.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 이미지 목록 갯수
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventImageListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("Event.selectEventImageListCount", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventImageList
	    * 2. ClassName  : EventServiceImpl.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 이미지 목록 
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectEventImageList(Map<String, Object> commandMap) throws Exception 
	{
		List<Map<String,Object>> list = defaultDAO.selectList("Event.selectEventImageList", commandMap);
		
		for(int i=0; i< list.size(); i++)
		{
			Map<String, Object> rowMap = list.get(i);
			String contents = StringUtil.getString(rowMap.get("EVT_REPLY_CONTENTS"),"").replace("\r\n","<br/>");
			rowMap.put("EVT_REPLY_CONTENTS", contents);
		}
		
		return list;
	}

	/**
	* <pre>
	* 1. MethodName : deleteEventImage
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 선택된 이미지 삭제
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteEventImage(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		String[] removeImageIdxs = request.getParameterValues("evtImageIdxs[]");
		String[] removeImageDisplays = request.getParameterValues("evtImageDisplayYns[]");
		
		int result = 0;
		
		for(int i=0; i< removeImageIdxs.length; i++)
		{
			String removeImageIdx = removeImageIdxs[i];
			String removeImageDisplay = removeImageDisplays[i];
			
			commandMap.put("EVT_IMG_IDX", removeImageIdx);
			
			if(removeImageDisplay.equals("Y"))
			{
				commandMap.put("EVT_IMG_DPL_YN", "N");
			}
			else
			{
				commandMap.put("EVT_IMG_DPL_YN", "Y");
			}
			
			result = defaultDAO.update("Event.deleteEventImage", commandMap);
		}
		
		return result;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventSurveyListCount
	    * 2. ClassName  : EventServiceImpl.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 설문 목록 갯수
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventSurveyListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("Event.selectEventSurveyListCount", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventSurveyList
	    * 2. ClassName  : EventServiceImpl.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 설문 목록 
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectEventSurveyList(Map<String, Object> commandMap) throws Exception 
	{
		List<Map<String,Object>> list = defaultDAO.selectList("Event.selectEventSurveyList", commandMap);
		
		return list;
	}
	
	
	/**
	* <pre>
	* 1. MethodName : selectEventBoardInfo
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 게시판형 상세
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectEventBoardInfo(Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		   
		commandMap.put("CMM_FLE_TB_NM", "T_EVT_BOARD");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_BOARD_IDX"), ""));
	    
	    returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("Event.selectEventBoardInfo", commandMap));
	    
        return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateEventBoard
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 게시판형 응모 상태 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateEventBoard(HttpServletRequest request,Map<String,Object> commandMap) throws Exception
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
	    commandMap.put("EVT_BOARD_UPD_IP", request.getRemoteAddr());
	    commandMap.put("EVT_BOARD_UPD_ID", admin.getADM_MST_ID());
	    
        int result = defaultDAO.update("Event.updateEventBoard", commandMap);
        
        return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectEventEntrySurveyList
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 설문형 응모자 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 18.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectEventEntrySurveyList (Map<String, Object> commandMap) throws Exception
    {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		 
		returnMap.put("basicRow", defaultDAO.select("Event.selectEventInfo", commandMap));
		returnMap.put("list",defaultDAO.selectList("Event.selectEventEntrySurveyList", commandMap));
    	
         return returnMap;
    }
	
	/**
     * <pre>
     * 1. MethodName : selectEventExceptMemberCount
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 제외회원 카운트
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectEventExceptMemberCount (Map<String, Object> commandMap) throws Exception
     {
    	 int result = 0;
      
   	  	 result = defaultDAO.selectCount("Event.selectEventExceptMemberCount", commandMap);
     	 
         return result;
     }
      
     /**
     * <pre>
     * 1. MethodName : selectEventExceptMemberList
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 제외회원 리스트
     * 4. 작성자       : khcho	
     * 5. 작성일       : 2015. 12. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectEventExceptMemberList (Map<String, Object> commandMap) throws Exception
    {
   	  
        return defaultDAO.selectList("Event.selectEventExceptMemberList", commandMap);
         
    }
    /**
     * <pre>
     * 1. MethodName : selectEventInfo
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectEventImagePopupInfo (Map<String, Object> commandMap) throws Exception
     {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_IMG");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_IMG_IDX"), ""));
        returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
        returnMap.put("row", defaultDAO.select("Event.selectEventImagePopupInfo", commandMap));
        
        return returnMap;
     }
     /**
      * <pre>
      * 1. MethodName : selectMemberEventListCount
      * 2. ClassName  : EventServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 갯수 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 11.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public int selectMemberEventListCount (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectCount("Event.selectMemberEventListCount", commandMap);
      }
      
      /**
      * <pre>
      * 1. MethodName : selectMemberEventList
      * 2. ClassName  : EventServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2014. 4. 14.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      @SuppressWarnings("unchecked")
      public List<Map<String, Object>> selectMemberEventList (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectList("Event.selectMemberEventList", commandMap);
      }
      
      /**
       * <pre>
       * 1. MethodName : selectMemberEventEtrPopup
       * 2. ClassName  : EventServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2014. 4. 14.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       @SuppressWarnings("unchecked")
       public List<Map<String, Object>> selectMemberEventEtrPopup (Map<String, Object> commandMap) throws Exception
       {
           return defaultDAO.selectList("Event.selectMemberEventEtrPopup", commandMap);
       }
       
       /**
        * <pre>
        * 1. MethodName : selectMemberEventWinPopup
        * 2. ClassName  : EventServiceImpl.java
        * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 
        * 4. 작성자       : khcho
        * 5. 작성일       : 2014. 4. 14.
        * </pre>
        *
        * @param commandMap
        * @return
        * @throws Exception
        */
        @SuppressWarnings("unchecked")
        public List<Map<String, Object>> selectMemberEventWinPopup (Map<String, Object> commandMap) throws Exception
        {
            return defaultDAO.selectList("Event.selectMemberEventWinPopupList", commandMap);
            //return defaultDAO.selectList("Event.selectMemberEventWinPopup", commandMap);
        }

        /**
         * 
         * <pre>
         * 1. MethodName : selectEventWinfInfCnt
         * 2. ClassName : EventServiceImpl.java
         * 3. Comment : 관리자 > 마케팅 관리 > 당첨자 명단 엑셀 업로드 사용자 확인 
         * 4. 작성자 : Lee
         * 5. 작성일 : 2016. 3. 24.
         * </pre>
         *
         * @param commandMap
         * @return
         * @throws Exception
         */
        public int selectEventWinfInfCnt(Map<String, Object> commandMap) throws Exception {
			// TODO Auto-generated method stub
			return defaultDAO.selectCount("Event.selectEventWinfInfCnt", commandMap);
		}

		public List selectEventWinInfList(Map<String, Object> commandMap) throws Exception {
			// TODO Auto-generated method stub
			return defaultDAO.selectList("Event.selectEventWinInfList", commandMap);
		}
		
		

	    @SuppressWarnings("unchecked")
	    public List<Map<String, Object>> selectMemberEventListExcel (Map<String, Object> commandMap) throws Exception 
	    {
	    	List<Map<String,Object>> list = defaultDAO.selectList("Event.selectMemberEventListExcel",commandMap);
	        return list; 
	    }	    
     
}