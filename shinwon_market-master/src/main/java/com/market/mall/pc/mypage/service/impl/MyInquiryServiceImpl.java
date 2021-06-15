package com.market.mall.pc.mypage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.pc.mypage.service.MyInquiryService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyInquiryServiceImpl.java
 * @Date : 2014. 7. 14.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 문의내역을 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcMyInquiryService")
public class MyInquiryServiceImpl implements MyInquiryService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	    
	/**
	* <pre>
	* 1. MethodName : selectMyInquiryListCount
	* 2. ClassName  : MyInquiryServiceImpl.java
	* 3. Comment    : 문의내역 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyInquiryListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcMyInquiry.selectMyInquiryListCount",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMyInquiryRplCount
	* 2. ClassName : MyInquiryServiceImpl.java
	* 3. Comment : 1:1문의 답변/미답변 카운트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectMyInquiryRplCount(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("PcMyInquiry.selectMyInquiryRplCount", commandMap);		
   	}
	/**
	* <pre>
	* 1. MethodName : selectMyInquiryRplCount
	* 2. ClassName : MyInquiryServiceImpl.java
	* 3. Comment : 1:1문의 답변/미답변 카운트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectMyPageCount(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("PcMyInquiry.selectMyPageCount", commandMap);		
   	}

	/**
	* <pre>
	* 1. MethodName : selectMyInquiryList
	* 2. ClassName  : MyInquiryServiceImpl.java
	* 3. Comment    : 문의내역 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyInquiryList(Map<String, Object> commandMap) throws Exception {
	    return this.defaultDAO.selectList("PcMyInquiry.selectMyInquiryList",commandMap);	    
	}
	
	/**
	* <pre>
	* 1. MethodName : insertInquiry
	* 2. ClassName : MyInquiryServiceImpl.java
	* 3. Comment : 1:1문의 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int insertInquiry (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
        commandMap.put("MEM_ADV_REG_IP", request.getRemoteAddr());
        
        // 답변 등록
        int result = defaultDAO.insert("PcMyInquiry.insertInquiry", commandMap); 
        
        //파일첨부
        if(result > 0){
        	List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
	        if(fileList.size() > 0)
	        {
	            int fileSort = 0;
	            
	            commandMap.put("CMM_FLE_TB_NM", "T_MEM_ADV");
	            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("MEM_ADV_IDX"), ""));
	            commandMap.put("CMM_FLE_TB_TYPE", "P");
	            commandMap.put("CMM_FLE_REG_ID", commandMap.get("MEM_MST_MEM_ID"));
	            for(int i = 0;i < fileList.size();i++)
	            {
	                CommonsMultipartFile file = fileList.get(i);
	                
	                if(!file.isEmpty())
	                {
	                    commandMap.put("CMM_FLE_SORT", ++fileSort);
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
	* 1. MethodName : selectMyInquiryInfo
	* 2. ClassName : MyInquiryServiceImpl.java
	* 3. Comment : 문의내역 상세보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectMyInquiryInfo (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		commandMap.put("CMM_FLE_TB_NM", "T_MEM_ADV");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("MEM_ADV_IDX"), ""));
	    
	    returnMap.put("fileList", defaultDAO.selectList("PcCommon.selectCommonFileList", commandMap));
	    
	    Map<String, Object> row = defaultDAO.select("PcMyInquiry.selectMyInquiryInfo", commandMap);
	    
		returnMap.put("row", row);
		
	    return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateInquiry
	* 2. ClassName : MyInquiryServiceImpl.java
	* 3. Comment : 문의사항 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public int updateInquiry (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
    	int result = defaultDAO.update("PcMyInquiry.updateInquiry", commandMap);
        
        String CMM_FLE_SAVE_PATH = "";
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        
        if(result > 0)
        {
        	String removeFileIdx = StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "");
        	
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
        	
        //파일 insert
        List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
        if(fileList.size() > 0)
        {
        	int fileSort = 0;
            
            commandMap.put("CMM_FLE_TB_NM", "T_MEM_ADV");
            commandMap.put("CMM_FLE_TB_TYPE", "P");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("MEM_ADV_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", commandMap.get("MEM_ADV_UPD_ID"));
            for(int i = 0;i < fileList.size();i++)
            {
                CommonsMultipartFile file = fileList.get(i);
                
                if(!file.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", ++fileSort);
                    
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "mypage", "image", "Y"));
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
	* 1. MethodName : deleteMyInquiry
	* 2. ClassName  : MyInquiryServiceImpl.java
	* 3. Comment    : 문의내역 삭제 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteMyInquiry (Map<String, Object> commandMap) throws Exception {
		int result = defaultDAO.delete("PcMyInquiry.deleteInquiry", commandMap);
		
		//첨부파일 삭제
		/*if(result > 0){
			Map<String, Object> removeMap = new HashMap<String, Object>();
			removeMap.put("CMM_FLE_TB_NM", "T_BRD_INQ"); 
			removeMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_INQ_IDX"),""));
			List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", removeMap); 
	        
	        for(int i=0; i < fileList.size(); i++){
	        	String CMM_FLE_SAVE_PATH = StringUtil.getString(fileList.get(i).get("CMM_FLE_SAVE_PATH"), "");
	        	String CMM_FLE_IDX = StringUtil.getString(fileList.get(i).get("CMM_FLE_IDX"), "");
	    		
		   		 if(!"".equals(CMM_FLE_IDX) && !"".equals(CMM_FLE_SAVE_PATH))
		            {
		   			 	removeMap.put("CMM_FLE_USE_YN", "N");
		   			 	removeMap.put("CMM_FLE_IDX", CMM_FLE_IDX);
		   			 
		                // 파일 DB 수정
		                defaultDAO.update("Common.deleteCommonFile", removeMap);
		                
		                // 파일 물리적 삭제
		                fileUpload.delete(CMM_FLE_SAVE_PATH);
		            }
	        }
		}*/
		
		return result; 
	}

}
