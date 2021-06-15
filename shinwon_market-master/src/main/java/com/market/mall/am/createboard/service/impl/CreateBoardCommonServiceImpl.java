package com.market.mall.am.createboard.service.impl;

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

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.createboard.service.CreateBoardCommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.createboard.service.impl
 * @FileName : CreateBoardCommonServiceImpl.java
 * @Date : 2015. 3. 17.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 생성된 게시판을 공통으로 처리하는 Service Implement Class
 * @author kimsy
 */
@Service("createBoardCommonService")
public class CreateBoardCommonServiceImpl implements CreateBoardCommonService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired 
	private FileUpload fileUpload;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonMstInfo
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 생성된 게시판의 상위 속성 가져오기
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCreateBoardCommonMstInfo(Map<String, Object> commandMap) throws Exception 
	{		
		return defaultDAO.select("CreateBoardCommon.selectCreateBoardCommonMstInfo", commandMap);
	}

	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonListCount
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardCommonListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("CreateBoardCommon.selectCreateBoardCommonListCount", commandMap);
	}

	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonList
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 목록
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCreateBoardCommonList(Map<String, Object> commandMap) throws Exception 
	{	
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		
		if(commandMap.get("BRD_MST_TYPE").equals(Code.BOARD_TYPE_NORMAL))
		{
			resultList = defaultDAO.selectList("CreateBoardCommon.selectCreateBoardCommonNormalList", commandMap);
		}
		else if(commandMap.get("BRD_MST_TYPE").equals(Code.BOARD_TYPE_IMAGE))
		{
			resultList = defaultDAO.selectList("CreateBoardCommon.selectCreateBoardCommonImageList", commandMap);
		}
		
		return resultList;
	}

	/**
	    * <pre>
	    * 1. MethodName : insertCreateBoardCommon
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 등록
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int insertCreateBoardCommon (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_DTL_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_DTL_REG_ID", admin.getADM_MST_ID());
        
        int result = defaultDAO.insert("CreateBoardCommon.insertCreateBoardCommon", commandMap);
        
        if(result > 0)
        {
            if(commandMap.get("BRD_MST_TYPE").equals(Code.BOARD_TYPE_IMAGE))
            {
            	List<CommonsMultipartFile> fileList = (List) request.getFiles("thumb");
                if(fileList.size() > 0)
                {
                    CommonsMultipartFile file = fileList.get(0);
                    if(!file.isEmpty())
                    {
                        // 파일 등록 및 파일 업로드
                        commandMap.put("CMM_FLE_TB_NM", "T_BRD_DTL");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_DTL_IDX"), ""));
                        commandMap.put("CMM_FLE_SORT", 1);
                        commandMap.put("CMM_FLE_REG_ID",admin.getADM_MST_ID());
                        commandMap.put("CMN_FLE_ALT_TXT", "");
                        commandMap.put("CMM_FLE_TB_TYPE",Code.IMG_BOARD_TYPE_THUMB);	// 썸네일 이미지일 경우
                        
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));

                        if(result < 0)
                        {
                            throw new TransactionException("썸네일 등록 중 오류가 발생하였습니다.");
                        }
                    }
                }
            }
            
        	List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
        	
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_BRD_DTL");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_DTL_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                commandMap.put("CMM_FLE_TB_TYPE",Code.IMG_BOARD_TYPE_GENERAL);	// 첨부파일의 경우
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);                        
                        
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "fileType", "Y"));
                    }
                }
            }
        }
        return result;
    }

	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonTopCount
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 상단 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardCommonTopCount(Map<String, Object> commandMap) throws Exception 
	{		
		return defaultDAO.selectCount("CreateBoardCommon.selectCreateBoardCommonTopCount", commandMap);
	}

	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonInfo
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 상세보기
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public Map<String, Object> selectCreateBoardCommonInfo(Map<String, Object> commandMap) throws Exception 
	{		
		Map<String, Object> returnMap = new HashMap<String, Object>();
			   
		commandMap.put("CMM_FLE_TB_NM", "T_BRD_DTL");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_DTL_IDX"), ""));
	    
	    returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("CreateBoardCommon.selectCreateBoardCommonInfo", commandMap));
	    
        return returnMap;
	}

	/**
	    * <pre>
	    * 1. MethodName : updateCreateBoardCommon
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 수정
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int updateCreateBoardCommon(MultipartHttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_DTL_UPD_IP", request.getRemoteAddr());
        commandMap.put("BRD_DTL_UPD_ID", admin.getADM_MST_ID());
        
        // 공통 게시판 수정
        int result = defaultDAO.update("CreateBoardCommon.updateCreateBoardCommon", commandMap);
        
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        		
        if(result > 0)
        {                    	
        	if(commandMap.get("BRD_MST_TYPE").equals(Code.BOARD_TYPE_IMAGE))
        	{        		              		
        		String removeThumbIdx = StringUtil.getString(commandMap.get("CMM_FLE_THUMB_IDX"), "");
        		
        		if(!("").equals(removeThumbIdx)){	             	        			
        			
        			//파일 상세 정보를 가져오는데 필요한 파일 Idx
        			commandMap.put("CMM_FLE_IDX", removeThumbIdx);
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
        		
        		//썸네일 insert
        		List<CommonsMultipartFile> fileList = (List) request.getFiles("thumb");
                if(fileList.size() > 0)
                {
                    CommonsMultipartFile file = fileList.get(0);
                    if(!file.isEmpty())
                    {
                        // 파일 등록 및 파일 업로드
                        commandMap.put("CMM_FLE_TB_NM", "T_BRD_DTL");
                        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_DTL_IDX"), ""));
                        commandMap.put("CMM_FLE_SORT", 1);
                        commandMap.put("CMM_FLE_REG_ID",admin.getADM_MST_ID());
                        commandMap.put("CMN_FLE_ALT_TXT", "");
                        commandMap.put("CMM_FLE_TB_TYPE",Code.IMG_BOARD_TYPE_THUMB);	// 썸네일 이미지일 경우
                        
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));

                        if(result < 0)
                        {
                            throw new TransactionException("썸네일 등록 중 오류가 발생하였습니다.");
                        }
                    }
                }
        		
        	}
        	
        	String removeFileIdx = StringUtil.getString(commandMap.get("cmmFleIdx"), "");
        	
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
        	
            //파일 insert
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_BRD_DTL");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_DTL_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                commandMap.put("CMM_FLE_TB_TYPE",Code.IMG_BOARD_TYPE_GENERAL);	// 첨부파일의 경우
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        // 파일 DB 등록 및 파일 업로드
                        defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "fileType", "Y"));
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
	    * 1. MethodName : selectCreateBoardCommonReplyListCount
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 덧글 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardCommonReplyListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("CreateBoardCommon.selectCreateBoardCommonReplyListCount", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonReplyList
	    * 2. ClassName  : CreateBoardCommonServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 덧글 목록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectCreateBoardCommonReplyList(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectList("CreateBoardCommon.selectCreateBoardCommonReplyList", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : deleteCreateBoardCommonReply
	* 2. ClassName : CreateBoardCommonServiceImpl.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 선택된 덧글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteCreateBoardCommonReply(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		String[] removeReplyIdxs = request.getParameterValues("brdReplyIdxs[]");
		String[] removeReplyDisplays = request.getParameterValues("brdReplyDisplayYns[]");
		
		int result = 0;
		
		for(int i=0; i< removeReplyIdxs.length; i++)
		{
			String removeReplyIdx = removeReplyIdxs[i];
			String removeReplyDisplay = removeReplyDisplays[i];
			
			commandMap.put("BRD_REPLY_IDX", removeReplyIdx);
			
			if(removeReplyDisplay.equals("Y"))
			{
				commandMap.put("BRD_REPLY_DISPLAY_YN", "N");
			}
			else
			{
				commandMap.put("BRD_REPLY_DISPLAY_YN", "Y");
			}
			
			result = defaultDAO.update("CreateBoardCommon.deleteCreateBoardCommonReply", commandMap);
		}
		
		return result;
	}

	
	/**
	* <pre>
	* 1. MethodName : insertCreateBoardCommonReply
	* 2. ClassName : CreateBoardCommonServiceImpl.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 관리자 덧글 등록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertCreateBoardCommonReply(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_REPLY_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_REPLY_REG_ID", admin.getADM_MST_ID());
        
		return defaultDAO.insert("CreateBoardCommon.insertCreateBoardCommonReply", commandMap);
	}

}
