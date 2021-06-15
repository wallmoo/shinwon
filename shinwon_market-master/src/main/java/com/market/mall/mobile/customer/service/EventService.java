package com.market.mall.mobile.customer.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.mobile.customer.service
 * @FileName : EventService.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 고객센터 이벤트공지를 처리하는 Service Interface
 * @author khcho
 */
public interface EventService {
	/**
	* <pre>
	* 1. MethodName : selectEventListCount
	* 2. ClassName  : EventService.java
	* 3. Comment    : 이벤트 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectEventListCount (Map<String, Object> commandMap) throws Exception;
	    
    /**
    * <pre>
    * 1. MethodName : selectEventList
    * 2. ClassName  : EventService.java
    * 3. Comment    : 이벤트 목록
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectEventList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectEventInfo
    * 2. ClassName  : EventService.java
    * 3. Comment    : 이벤트 상세
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectEventInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertEvent
    * 2. ClassName  : EventService.java
    * 3. Comment    : 이벤트 응모
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> insertEvent (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectIngEventList
    * 2. ClassName : EventService.java
    * 3. Comment : 진행중인 이벤트 목록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectIngEventList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectReplyEventListCount
    * 2. ClassName : EventService.java
    * 3. Comment : 덧글형 이벤트 목록 갯수
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectReplyEventListCount (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectReplyEventList
    * 2. ClassName : EventService.java
    * 3. Comment : 덧글형 이벤트 목록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectReplyEventList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertReplyEvent
    * 2. ClassName : EventService.java
    * 3. Comment : 덧글형 이벤트 등록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertReplyEvent (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBoardEventListCount
    * 2. ClassName : EventService.java
    * 3. Comment : 게시판형 이벤트 목록 갯수
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBoardEventListCount (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBoardEventList
    * 2. ClassName : EventService.java
    * 3. Comment : 게시판형 이벤트 목록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectBoardEventList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertBoardEvent
    * 2. ClassName : EventService.java
    * 3. Comment : 게시판형 이벤트 게시글 등록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertBoardEvent (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBoardEventInfo
    * 2. ClassName : EventService.java
    * 3. Comment : 게시판형 이벤트 상세정보 
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectBoardEventInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : deleteBoardEvent
    * 2. ClassName : EventService.java
    * 3. Comment : 게시판형 이벤트 게시글 삭제
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteBoardEvent (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateBoardEvent
    * 2. ClassName : EventService.java
    * 3. Comment : 게시판형 이벤트 수정
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBoardEvent (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectAuctionEventListCount
    * 2. ClassName : EventService.java
    * 3. Comment : 경매형 이벤트 참여 인원 수
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectAuctionEventListCount (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectAuctionEventTopInfo
    * 2. ClassName : EventService.java
    * 3. Comment : 경매형 이벤트 top1 상세정보
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectAuctionEventTopInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertAuctionEvent
    * 2. ClassName : EventService.java
    * 3. Comment : 경매형 이벤트 입찰
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertAuctionEvent (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSurveyEventListCount
    * 2. ClassName : EventService.java
    * 3. Comment : 설문형 이벤트 목록 갯수
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectSurveyEventListCount (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSurveyEventList
    * 2. ClassName : EventService.java
    * 3. Comment : 설문형 이벤트 목록 
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectSurveyEventList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertSurveyEvent
    * 2. ClassName : EventService.java
    * 3. Comment : 설문형 이벤트 등록
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 6. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertSurveyEvent (Map<String,Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName : selectEventWinListCount
     * 2. ClassName : EventService.java
     * 3. Comment : 당첨자 발표 총 게시글 수  
     * 4. 작성자 : Lee
     * 5. 작성일 : 2016. 1. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     */
	public int selectEventWinListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventWinList
	 * 2. ClassName : EventService.java
	 * 3. Comment : 당첨자 발표 게시글 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEventWinList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventWinBoardInfo
	 * 2. ClassName : EventService.java
	 * 3. Comment : 당첨자 발표 상세보기
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectEventWinInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventWinSearchAjax
	 * 2. ClassName : EventService.java
	 * 3. Comment : 당첨자 검색
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 */
	public List<Map<String, Object>> selectEventWinSearchList(Map<String, Object> commandMap) throws Exception;
    
    
}
