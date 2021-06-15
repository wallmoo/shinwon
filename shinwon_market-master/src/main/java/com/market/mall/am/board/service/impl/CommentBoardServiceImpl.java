package com.market.mall.am.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.board.service.CommentBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.board.service.impl
 * @FileName : CommentBoardServiceImpl.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 게시판관리 > 상품리뷰관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("commentBoardService")
public class CommentBoardServiceImpl implements CommentBoardService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    /**
    * <pre>
    * 1. MethodName : selectCommentBoardListCount
    * 2. ClassName  : CommentBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCommentBoardListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("CommentBoard.selectCommentBoardListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCommentBoardList
    * 2. ClassName  : CommentBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommentBoardList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("CommentBoard.selectCommentBoardList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCommentBoardInfo
    * 2. ClassName  : CommentBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCommentBoardInfo (Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // 상세 정보
        Map<String, Object> row = defaultDAO.select("CommentBoard.selectCommentBoardInfo", commandMap);
        
        //if("Y".equals(StringUtil.getString(row.get("PRD_REV_TYPE"), "N")))
        //{
            // 첨부파일 정보
            commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV"); 
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""));
            List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap);
            returnMap.put("fileList", fileList);
        //}
        returnMap.put("row", row);
        
        return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateCommentBoard
    * 2. ClassName  : CommentBoardServiceImpl.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 수정
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCommentBoard (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        Admin admin = SessionsAdmin.getSessionAdmin(request);        
        commandMap.put("PRD_REV_ADM_REG_ID", admin.getADM_MST_ID());
        return defaultDAO.update("CommentBoard.updateCommentBoard", commandMap);
    }
    
}
