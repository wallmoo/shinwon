package com.market.mall.am.board.service.impl;

import java.util.ArrayList;
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
import com.market.mall.am.board.service.NoticeBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.board.service.impl
 * @FileName : NoticeBoardServiceImpl.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 공지사항을 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    
    /**
    * <pre>
    * 1. MethodName : selectNoticeBoardListCount
    * 2. ClassName  : NoticeBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectNoticeBoardListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("NoticeBoard.selectNoticeBoardListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectNoticeBoardList
    * 2. ClassName  : NoticeBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectNoticeBoardList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("NoticeBoard.selectNoticeBoardList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectNoticeBoardInfo
    * 2. ClassName  : NoticeBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 상세 정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectNoticeBoardInfo (Map<String, Object> commandMap) throws Exception
    {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    commandMap.put("CMM_FLE_TB_NM", "T_BRD_NTS");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("Common.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("NoticeBoard.selectNoticeBoardInfo", commandMap));
        return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertNoticeBoard
    * 2. ClassName  : NoticeBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertNoticeBoard (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_NTS_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_NTS_REG_ID", admin.getADM_MST_ID());
        
        int result = defaultDAO.insert("NoticeBoard.insertNoticeBoard", commandMap);
        
        if(result > 0)
        {
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_BRD_NTS");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
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
    * 1. MethodName : updateNoticeBoard
    * 2. ClassName  : NoticeBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public int updateNoticeBoard (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_NTS_UPD_IP", request.getRemoteAddr());
        commandMap.put("BRD_NTS_UPD_ID", admin.getADM_MST_ID());
        
        int result = defaultDAO.update("NoticeBoard.updateNoticeBoard", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        		
        if(result > 0)
        {
            //기존 파일 삭제
        	//String removeFile = StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "");        	
        	
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
                
                commandMap.put("CMM_FLE_TB_NM", "T_BRD_NTS");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_NTS_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
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
     * 1. MethodName : selectNoticeBoardTopCount
     * 2. ClassName  : NoticeBoardServiceImpl.java
     * 3. Comment    : 관리자 > 게시판 관리 > 상단공지 사용 가능 유무
     * 4. 작성자       : kimsy
     * 5. 작성일       : 2015. 3. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public int selectNoticeBoardTopCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("NoticeBoard.selectNoticeBoardTopCount", commandMap);
	}
}
