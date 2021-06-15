package com.market.mall.mobile.customer.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.mobile.customer.service
 * @FileName : NoticeBoardService.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 고객센터 > 공지사항을 처리하는 Service Interface
 * @author khcho
 */
public interface NoticeBoardService {
	
	/**
	* <pre>
	* 1. MethodName : selectNoticeBoardListCount
	* 2. ClassName  : NoticeBoardService.java
	* 3. Comment    : 공지사항 개수
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
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
	* 3. Comment    : 공지사항 목록
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectNoticeBoardList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectTopNoticeBoardList
	* 2. ClassName  : NoticeBoardService.java
	* 3. Comment    : 상단 공지 목록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectTopNoticeBoardList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectNoticeBoardInfo
	* 2. ClassName  : NoticeBoardService.java
	* 3. Comment    : 공지 사항 상세
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectNoticeBoardInfo (Map<String, Object> commandMap) throws Exception;
	

	/**
	* <pre>
	* 1. MethodName : selectMainNoticeBoardList
	* 2. ClassName  : NoticeBoardService.java
	* 3. Comment    : 공지사항 목록
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 12. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectMainNoticeBoardList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPreBoardListCount
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 일반게시판 미리보기 목록 갯수 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPreBoardListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPreBoardList
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 일반게시판 미리보기 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectPreBoardList (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPreBoardInfo
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectPreBoardInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectReplyListCount
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectReplyListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectReplyList
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectReplyList (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertReply
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 게시판 미리보기 상세 > 댓글 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertReply (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPreImageBoardListCount
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 이미지게시판 미리보기 목록 갯수 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPreImageBoardListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPreImageBoardList
	* 2. ClassName : NoticeBoardService.java
	* 3. Comment : 관리자에서 게시판생성을 통해 만들어진 이미지게시판 미리보기 목록  
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 8. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectPreImageBoardList (Map<String,Object> commandMap) throws Exception;
	
}
