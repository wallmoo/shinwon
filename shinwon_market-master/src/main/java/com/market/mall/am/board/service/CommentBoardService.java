package com.market.mall.am.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.board.service
 * @FileName : CommentBoardService.java
 * @Date : 2014. 4. 8.
 * @프로그램 설명 : 관리자 > 게시판관리 > 상품리뷰관리를 처리하는 Service Interface
 * @author kanghk
 */
public interface CommentBoardService {

    /**
    * <pre>
    * 1. MethodName : selectCommentBoardListCount
    * 2. ClassName  : CommentBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCommentBoardListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCommentBoardList
    * 2. ClassName  : CommentBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCommentBoardList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCommentBoardInfo
    * 2. ClassName  : CommentBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCommentBoardInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateCommentBoard
    * 2. ClassName  : CommentBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCommentBoard (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
