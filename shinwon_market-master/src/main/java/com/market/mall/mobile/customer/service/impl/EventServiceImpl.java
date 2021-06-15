package com.market.mall.mobile.customer.service.impl;

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
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.customer.service.EventService;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.mobile.customer.service.impl
 * @FileName : EventServiceImpl.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 고객센터 > 이벤트공지를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("mobileEventService")
public class EventServiceImpl implements EventService {
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	@Autowired
	private FileUpload fileUpload;
	/**
	* <pre>
	* 1. MethodName : selectEventListCount
	* 2. ClassName  : EventServiceImpl.java
	* 3. Comment    : 이벤트 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectEventListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcEvent.selectEventListCount", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectEventList
	* 2. ClassName  : EventServiceImpl.java
	* 3. Comment    : 이벤트 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcEvent.selectEventList", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectEventInfo
	* 2. ClassName  : EventServiceImpl.java
	* 3. Comment    : 이벤트 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) 	throws Exception {
		return defaultDAO.select("PcEvent.selectEventInfo", commandMap);
	}
	
	
	/**
	* <pre>
	* 1. MethodName : insertEvent
	* 2. ClassName  : EventServiceImpl.java
	* 3. Comment    : 이벤트 응모
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> insertEvent (HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		int result = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		commandMap.put("EVT_ETR_REG_IP", request.getRemoteAddr());
		commandMap.put("EVT_ETR_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		
		//응모여부 체크
		result = defaultDAO.selectCount("PcEvent.selectEventEnterCheck", commandMap);
		
		//응모 안 한 경우
		if(result == 0)
		{
			// 이벤트 타입(응모형 , 덧글형 , 경매형 , 게시판형 , 설문형)
			int EVT_MST_TYPE = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
			
			if(EVT_MST_TYPE != 0)
			{
				if(EVT_MST_TYPE == Code.EVENT_MASTER_TYPE_NORMAL)	// 응모형
				{
					result = defaultDAO.insert("PcEvent.insertEventEtr", commandMap);
				}
			}
			
			if(result > 0)
			{
				returnMap.put("status", "success");
			}
			else
			{
				returnMap.put("status", "error");
			}
		}
		else
		{
			returnMap.put("status", "entered");
		}
		
		return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectIngEventList
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 진행중인 이벤트 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectIngEventList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcEvent.selectIngEventList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectReplyEventListCount
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 덧글형 이벤트 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectReplyEventListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcEvent.selectReplyEventListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectReplyEventList
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 덧글형 이벤트 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectReplyEventList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcEvent.selectReplyEventList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertReplyEvent
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 덧글형 이벤트 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertReplyEvent (Map<String,Object> commandMap) throws Exception
	{
		int result = 0;
		//덧글형 이벤트 응모여부 체크
		result = defaultDAO.selectCount("PcEvent.selectReplyEventCheck", commandMap);
		
		if(result == 0)
		{
			result = defaultDAO.insert("PcEvent.insertReplyEvent", commandMap);
		}
		else
		{
			result = -1;
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBoardEventListCount
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 게시판형 이벤트 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBoardEventListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcEvent.selectBoardEventListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBoardEventList
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 게시판형 이벤트 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 2.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBoardEventList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("PcEvent.selectBoardEventList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertBoardEvent
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 게시판형 이벤트 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBoardEvent (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		
		int result = 0;
		//게시판형 이벤트 응모여부 체크
		result= defaultDAO.selectCount("PcEvent.selectBoardEventCheck", commandMap);
		
		if(result == 0)
		{
			result = defaultDAO.insert("PcEvent.insertBoardEvent", commandMap);	
			
			if(result > 0)
			{
	            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
	            if(fileList.size() > 0)
	            {
	                int fileSort = 0;
	                
	                commandMap.put("CMM_FLE_TB_NM", "T_EVT_BOARD");
	                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_BOARD_IDX"), ""));
	                commandMap.put("CMM_FLE_REG_ID", commandMap.get("EVT_BOARD_REG_ID"));
	                commandMap.put("fileSizeYn","Y");
	                
	                for(int i = 0;i < fileList.size();i++)
	                {
	                    CommonsMultipartFile file = fileList.get(i);
	                    
	                    if(!file.isEmpty())
	                    {
	                        commandMap.put("CMM_FLE_SORT", ++fileSort);
	                        
	                        // 파일 등록 및 파일 업로드
	                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "event", "fileType", "Y"));
	                    }
	                }
	            }
	        }
		}
		else
		{
			result = -1;
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBoardEventInfo
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 게시판형 이벤트 상세정보
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectBoardEventInfo (Map<String,Object> commandMap) throws Exception
	{
		//조회수 증가
		defaultDAO.update("PcEvent.updateBoardEventReadCount", commandMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		commandMap.put("CMM_FLE_TB_NM", "T_EVT_BOARD");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_BOARD_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("PcCommon.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("PcEvent.selectBoardEventInfo", commandMap));
		return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteBoardEvent
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 게시판형 이벤트 게시글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteBoardEvent (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.delete("PcEvent.deleteBoardEvent", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateBoardEvent
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 게시판형 이벤트 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateBoardEvent (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		int result = defaultDAO.update("PcEvent.updateBoardEvent", commandMap);
		
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
            
            commandMap.put("CMM_FLE_TB_NM", "T_EVT_BOARD");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_BOARD_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", commandMap.get("EVT_BOARD_UPD_ID"));
            commandMap.put("fileSizeYn","Y");
            for(int i = 0;i < fileList.size();i++)
            {
                CommonsMultipartFile file = fileList.get(i);
                
                if(!file.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", ++fileSort);
                    
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "event", "image", "Y"));
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
	* 1. MethodName : selectAuctionEventListCount
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 경매형 이벤트 참여 인원 수 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectAuctionEventListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcEvent.selectAuctionEventListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectAuctionEventTopInfo
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 경매형 이벤트 top1 상세정보
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectAuctionEventTopInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("PcEvent.selectAuctionEventTopInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertAuctionEvent
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 경매형 이벤트 입찰
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertAuctionEvent (Map<String,Object> commandMap) throws Exception
	{
		int result = 0;
		//경매형 이벤트 응모여부 체크
		result = defaultDAO.selectCount("PcEvent.selectAuctionEventCheck", commandMap);
		
		if(result == 0)
		{
			result = defaultDAO.insert("PcEvent.insertAuctionEvent", commandMap);
		}
		else
		{
			result = -1;
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectSurveyEventListCount
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 설문형 이벤트 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectSurveyEventListCount (Map<String,Object> commandMap) throws Exception
	{
		commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
        commandMap.put("CMM_FLE_TB_TYPE", "S");
		
		return defaultDAO.selectCount("PcEvent.selectSurveyEventListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectSurveyEventList
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 설문형 이벤트 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSurveyEventList(Map<String,Object> commandMap) throws Exception
	{
		commandMap.put("CMM_FLE_TB_NM", "T_EVT_MST");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_MST_IDX"), ""));
        commandMap.put("CMM_FLE_TB_TYPE", "S");
        
		return defaultDAO.selectList("PcEvent.selectSurveyEventList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertSurveyEvent
	* 2. ClassName : EventServiceImpl.java
	* 3. Comment : 설문형 이벤트 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertSurveyEvent (Map<String,Object> commandMap) throws Exception
	{
		int result = 0;
		//설문형 이벤트 응모여부 체크
		result = defaultDAO.selectCount("PcEvent.selectSurveyEventCheck", commandMap);
		
		if(result == 0)
		{
			result = defaultDAO.insert("PcEvent.insertSurveyEvent", commandMap);
		}
		else
		{
			result = -1;
		}
		
		return result;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectEventWinListCount
	 * 2. ClassName : EventServiceImpl.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * ${tags}
	 */
	public int selectEventWinListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("PcEvent.selectMobileEventWinListCount", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectEventWinList
	 * 2. ClassName : EventServiceImpl.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * ${tags}
	 */
	public List<Map<String, Object>> selectEventWinList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcEvent.selectMobileEventWinList", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectEventWinBoardInfo
	 * 2. ClassName : EventServiceImpl.java
	 * 3. Comment : 당첨자 발표 상세보기
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 */
	public Map<String, Object> selectEventWinInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		// 조회수 증가
		defaultDAO.update("PcEvent.updateEventWinReadCount", commandMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
//		commandMap.put("CMM_FLE_TB_NM", "T_EVT_WIN");
//	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_WIN_IDX"), ""));
//	    returnMap.put("fileList", defaultDAO.selectList("PcCommon.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("PcEvent.selectEventWinInfo", commandMap));
	    returnMap.put("winList", defaultDAO.selectList("PcEvent.selectMobileEventWinerList", commandMap));
	    returnMap.put("infList", defaultDAO.selectList("PcEvent.selectMobileWinInfList", commandMap));
	    
		return returnMap;
	}

	public List<Map<String, Object>> selectEventWinSearchList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcEvent.selectMobileEventWinSearchList", commandMap);
	}
	
}
