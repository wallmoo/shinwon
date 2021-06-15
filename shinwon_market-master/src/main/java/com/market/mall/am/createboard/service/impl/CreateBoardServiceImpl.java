package com.market.mall.am.createboard.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.createboard.service.CreateBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.createboard.service.impl
 * @FileName : CreateBoardServiceImpl.java
 * @Date : 2015. 3. 16.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 게시판 생성기를 처리하는 Service Implement Class
 * @author kimsy
 */
@Service("createBoardService")
public class CreateBoardServiceImpl implements CreateBoardService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	    * <pre>
	    * 1. MethodName : insertCreateBoard
	    * 2. ClassName  : CreateBoardServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 등록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int insertCreateBoard(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{	
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_MST_REG_ID", admin.getADM_MST_ID());        
        commandMap.put("BRD_MST_BRAND_CD", "00");   
        int result = defaultDAO.insert("CreateBoard.insertCreateBoard", commandMap);
        
        if(result > 0)        	
        {
        	commandMap.put("ADM_MNU_REG_IP", request.getRemoteAddr());
            commandMap.put("ADM_MNU_REG_ID", admin.getADM_MST_ID());
            
            String BRD_MST_IDX = StringUtil.getString(commandMap.get("BRD_MST_IDX"),"");
            
        	// 공통 리스트 URL
     		commandMap.put("ADM_MNU_URL", "/am/createboard/create"+ BRD_MST_IDX +"BoardCommonList.do");
     	
     		// 공통 리스트 권한 URL
     		commandMap.put("ADM_MNU_AUTH_URL" , "/createboard/create"+ BRD_MST_IDX +"BoardCommon");
     		
     		// 게시판 관리의 IDX값 
     		commandMap.put("ADM_MNU_UP_IDX", Code.CREATE_BOARD_IDX);		
     		
     		// 메모 
     		commandMap.put("ADM_MNU_MEMEO", "");
     		
     		// 메뉴 사용 여부
     		commandMap.put("ADM_MNU_ON_YN", "Y");
     		
     		// 메뉴 등록
     		result = defaultDAO.insert("CreateBoard.insertMenuManager", commandMap);	
        }

		return result;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardListCount
	    * 2. ClassName  : CreateBoardServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardListCount(Map<String, Object> commandMap) throws Exception 
	{		
		return defaultDAO.selectCount("CreateBoard.selectCreateBoardListCount", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardList
	    * 2. ClassName  : CreateBoardServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 목록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCreateBoardList(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectList("CreateBoard.selectCreateBoardList", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardInfo
	    * 2. ClassName  : CreateBoardServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 상세보기
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public Map<String, Object> selectCreateBoardInfo(Map<String, Object> commandMap) throws Exception 
	{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("row",defaultDAO.select("CreateBoard.selectCreateBoardInfo", commandMap));
		
		return resultMap;
	}
	
	/**
	    * <pre>
	    * 1. MethodName : updateCreateBoard
	    * 2. ClassName  : CreateBoardServiceImpl.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 수정
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int updateCreateBoard(HttpServletRequest request,Map<String, Object> commandMap) throws Exception 
	{
		Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("BRD_MST_UPD_ID", admin.getADM_MST_ID());
        
		return defaultDAO.update("CreateBoard.updateCreateBoard", commandMap);
	}

}
