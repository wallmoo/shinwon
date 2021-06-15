package com.market.mall.am.createboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.createboard.service
 * @FileName : CreateBoardService.java
 * @Date : 2015. 3. 16.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 게시판 생성기를 처리하는 Service Interface
 * @author kimsy
 */
public interface CreateBoardService {

	/**
	    * <pre>
	    * 1. MethodName : insertCreateBoard
	    * 2. ClassName  : CreateBoardService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 등록
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int insertCreateBoard(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardListCount
	    * 2. ClassName  : CreateBoardService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardList
	    * 2. ClassName  : CreateBoardService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 목록
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectCreateBoardList(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardInfo
	    * 2. ClassName  : CreateBoardService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 상세정보
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public Map<String,Object> selectCreateBoardInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : updateCreateBoard
	    * 2. ClassName  : CreateBoardService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 게시판 생성 수정
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 16.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int updateCreateBoard(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
}
