package com.market.mall.am.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.board.service
 * @FileName : NoticeBoardService.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 공지사항을 처리하는 Service Interface
 * @author kanghk
 */
public interface NoticeBoardService {

    
    /**
    * <pre>
    * 1. MethodName : selectNoticeBoardListCount
    * 2. ClassName  : NoticeBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectNoticeBoardListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectNoticeBoardList
    * 2. ClassName  : NoticeBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectNoticeBoardList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectNoticeBoardInfo
    * 2. ClassName  : NoticeBoardService.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectNoticeBoardInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertNoticeBoard
    * 2. ClassName  : NoticeBoardService.java
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
    public int insertNoticeBoard (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateNoticeBoard
    * 2. ClassName  : NoticeBoardService.java
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
    public int updateNoticeBoard (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardTopCount
     * 2. ClassName  : NoticeBoardService.java
     * 3. Comment    : 관리자 > 게시판 관리 > 상단공지 사용 가능 유무
     * 4. 작성자       : kimsy
     * 5. 작성일       : 2015. 3. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectNoticeBoardTopCount (Map<String, Object> commandMap) throws Exception;
}
