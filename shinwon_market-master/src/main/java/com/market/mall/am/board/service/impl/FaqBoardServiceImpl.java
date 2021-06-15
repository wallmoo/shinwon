package com.market.mall.am.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.am.board.service.FaqBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.board.service.impl
 * @FileName : FaqBoardServiceImpl.java
 * @Date : 2014. 4. 8.
 * @프로그램 설명 : 관리자 >  게시판 관리 > FAQ 관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("faqBoardService")
public class FaqBoardServiceImpl implements FaqBoardService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardListCount
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectFaqBoardListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("FaqBoard.selectFaqBoardListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardList
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFaqBoardList (Map<String, Object> commandMap) throws Exception
    {
    	commandMap.put("FAQ_INQUIRY_TYPE_CODE", Code.FAQ_INQUIRY_TYPE_CODE);
        return defaultDAO.selectList("FaqBoard.selectFaqBoardList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardInfo
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectFaqBoardInfo (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("FaqBoard.selectFaqBoardInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardOftenTopCount
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 자주사용하는 FAQ 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectFaqBoardOftenTopCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("FaqBoard.selectFaqBoardOftenTopCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertFaqBoard
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertFaqBoard (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_FAQ_REG_IP", request.getRemoteAddr());
        commandMap.put("BRD_FAQ_REG_ID", admin.getADM_MST_ID());
        return defaultDAO.insert("FaqBoard.insertFaqBoard", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateFaqBoard
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateFaqBoard (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("BRD_FAQ_UPD_IP", request.getRemoteAddr());
        commandMap.put("BRD_FAQ_UPD_ID", admin.getADM_MST_ID());
        return defaultDAO.update("FaqBoard.updateFaqBoard", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectFaqCategoryList
    * 2. ClassName  : FaqBoardServiceImpl.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 카테고리 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 3. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFaqCategoryList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("FaqBoard.selectFaqCategoryList", commandMap);
    }
}
