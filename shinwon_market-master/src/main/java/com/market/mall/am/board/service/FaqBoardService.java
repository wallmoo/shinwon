package com.market.mall.am.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.board.service
 * @FileName : FaqBoardService.java
 * @Date : 2014. 4. 8.
 * @프로그램 설명 : 관리자 >  게시판 관리 > FAQ 관리를 처리하는 Service Interface
 * @author kanghk
 */
public interface FaqBoardService {

    /**
    * <pre>
    * 1. MethodName : selectFaqBoardListCount
    * 2. ClassName  : FaqBoardService.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 목록 갯수  
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectFaqBoardListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardList
    * 2. ClassName  : FaqBoardService.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 목록  
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectFaqBoardList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardInfo
    * 2. ClassName  : FaqBoardService.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 상세정보  
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectFaqBoardInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectFaqBoardOftenTopCount
    * 2. ClassName  : FaqBoardService.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 자주사용하는 FAQ 갯수  
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectFaqBoardOftenTopCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertFaqBoard
    * 2. ClassName  : FaqBoardService.java
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
    public int insertFaqBoard (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateFaqBoard
    * 2. ClassName  : FaqBoardService.java
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
    public int updateFaqBoard (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectFaqCategoryList
    * 2. ClassName  : FaqBoardService.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 카테고리 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 3. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectFaqCategoryList (Map<String, Object> commandMap) throws Exception;
    
}
