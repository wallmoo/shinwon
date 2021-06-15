package com.market.mall.am.createboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.createboard.service
 * @FileName : CreateBoardCommonService.java
 * @Date : 2015. 3. 17.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 생성된 게시판을 공통으로 처리하는 Service Interface
 * @author kimsy
 */
public interface CreateBoardCommonService {
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonMstInfo
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 생성된 게시판의 상위 속성 가져오기
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public Map<String,Object> selectCreateBoardCommonMstInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonListCount
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardCommonListCount(Map<String,Object> commandMap) throws Exception;

	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonList
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 목록
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectCreateBoardCommonList(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : insertCreateBoardCommon
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 등록
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int insertCreateBoardCommon(MultipartHttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonTopCount
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 상단 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardCommonTopCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonInfo
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 상세보기
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public Map<String,Object> selectCreateBoardCommonInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : updateCreateBoardCommon
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판 수정
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 17.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int updateCreateBoardCommon(MultipartHttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonReplyListCount
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 덧글 목록 갯수
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectCreateBoardCommonReplyListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectCreateBoardCommonReplyList
	    * 2. ClassName  : CreateBoardCommonService.java
	    * 3. Comment    : 관리자 > 게시판 관리 > 공통 게시판의 덧글 목록 
	    * 4. 작성자       : kimsy
	    * 5. 작성일       : 2015. 3. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectCreateBoardCommonReplyList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteCreateBoardCommonReply
	* 2. ClassName : CreateBoardCommonService.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 선택된 덧글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteCreateBoardCommonReply(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertCreateBoardCommonReply
	* 2. ClassName : CreateBoardCommonService.java
	* 3. Comment : 관리자 > 게시판 관리 > 게시판 수정 폼 > 관리자 덧글 등록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 3. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertCreateBoardCommonReply(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
}
