package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : EventService.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 이벤트 관리를 처리하는 Service Interface
 * @author kanghk
 */
public interface EventService {
    
    /**
    * <pre>
    * 1. MethodName : selectEventListCount
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
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
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
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
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectEventInfo (Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : selectEventLotList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 응모자목록 조회
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectEventLotList (Map<String, Object> commandMap) throws Exception;
    
    
    
    /**
     * <pre>
     * 1. MethodName : selectEventDetailList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 경품 / 사은품 정보 목록 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectEventDetailList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventDetailImageList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 설문 이미지 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2016. 1. 12.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectEventDetailImageList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertEvent
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertEvent (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertEventWin
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 당첨자발표 등록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int insertEventWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateEventWin
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 당첨자 발표 수정 
    * 4. 작성자       : khcho	
    * 5. 작성일       : 2015. 12. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateEventWin (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateEvent
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 수정 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateEvent (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectEventEntryListCount
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 갯수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectEventEntryListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectEventEntryList
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectEventEntryList (Map<String, Object> commandMap) throws Exception;
    
    
    
    
    /**
     * <pre>
     * 1. MethodName : selectEventEntryListCount
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 갯수 
     * 4. 작성자       : kanghk
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectEventWinListCount (Map<String, Object> commandMap) throws Exception;
     
     /**
     * <pre>
     * 1. MethodName : selectEventWinList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 / 당첨자 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectEventWinList (Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName : selectEventWinInfo
      * 2. ClassName  : EventService.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자발표 상세 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 16.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public Map<String, Object> selectEventWinInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventWinnerInfo
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 응모자 정보
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectEventWinnerInfo (Map<String, Object> commandMap) throws Exception;
     
    
    /**
    * <pre>
    * 1. MethodName : updateEventEntryWinner
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateEventEntryWinner (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
	    * <pre>
	    * 1. MethodName : selectEventReplyListCount
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 덧글 목록 갯수
	    * 4. 작성자       : DEV_KIMSOYOUNG
	    * 5. 작성일       : 2015. 4. 06.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventReplyListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventReplyList
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 덧글 목록
	    * 4. 작성자       : DEV_KIMSOYOUNG
	    * 5. 작성일       : 2015. 4. 06.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectEventReplyList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteEventReply
	* 2. ClassName : EventService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 선택된 덧글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 06.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteEventReply(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventImageListCount
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 이미지 목록 갯수
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventImageListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventImageList
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 이미지 목록
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectEventImageList(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventImageListCount
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 설문 목록 갯수
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventSurveyListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventImageList
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 설문 목록
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectEventSurveyList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteEventImage
	* 2. ClassName : EventService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 선택된 이미지 삭제
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deleteEventImage(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectEventBoardInfo
	* 2. ClassName : EventService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 게시판형 상세 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectEventBoardInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateEventBoard
	* 2. ClassName : EventService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 게시판형 응모 상태 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateEventBoard(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectEventEntrySurveyList
	* 2. ClassName : EventService.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 설문형 응모자 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 18.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectEventEntrySurveyList(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventReplyListCount
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자제외회원 카운트
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public int selectEventExceptMemberCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : selectEventReplyList
	    * 2. ClassName  : EventService.java
	    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 상세정보 > 당첨자제외회원 리스트
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2015. 12. 18.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	*/
	public List<Map<String,Object>> selectEventExceptMemberList(Map<String,Object> commandMap) throws Exception;
	
	
	/**
    * <pre>
    * 1. MethodName : selectEventImagePopupInfo
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 이미지형 팝업 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectEventImagePopupInfo (Map<String, Object> commandMap) throws Exception;
	
    /**
    * <pre>
    * 1. MethodName : selectMemberEventListCount
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 회원 이벤트 관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMemberEventListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMemberEventList
    * 2. ClassName  : EventService.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 회원 이벤트 관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectMemberEventList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectMemberEventEtrPopup
     * 2. ClassName  : EventService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 회원 이벤트 관리 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2016. 2. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectMemberEventEtrPopup (Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName : selectMemberEventWinPopup
      * 2. ClassName  : EventService.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 회원 이벤트 관리 목록 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public List<Map<String, Object>> selectMemberEventWinPopup (Map<String, Object> commandMap) throws Exception;

      /**
       * 
       * <pre>
       * 1. MethodName : selectEventWinfInfCnt
       * 2. ClassName : EventService.java
       * 3. Comment : 관리자 > 마케팅 관리 > 당첨자 명단 엑셀 업로드 사용자 확인 
       * 4. 작성자 : Lee
       * 5. 작성일 : 2016. 3. 24.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
      public int selectEventWinfInfCnt(Map<String, Object> commandMap) throws Exception;

      /**
       * 
       * <pre>
       * 1. MethodName : selectEventWinInfList
       * 2. ClassName : EventService.java
       * 3. Comment : 
       * 4. 작성자 : Lee
       * 5. 작성일 : 2016. 3. 24.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
      public List selectEventWinInfList(Map<String, Object> commandMap) throws Exception;
      
      public List<Map<String, Object>> selectMemberEventListExcel (Map<String, Object> commandMap) throws Exception;
      

}
