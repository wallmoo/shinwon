package com.market.mall.mobile.event.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface EventService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventListCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 총 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventList
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectEventList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventInfo
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 정보 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEventInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventEntryCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 응모 참여 수 (일반형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventEntryCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventSurveyCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 응모 참여자 수 (설문형) 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventSurveyCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventCommentCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 응모 참여자 수 (댓글 형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventCommentCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventImageListCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 응모 참여자 수 (이미지형) 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventImageListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEventEntry
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 응모 (일반형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int insertEventEntry(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEventSurvey
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 응모 (설문형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int insertEventSurvey(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEventComment
	 * 2. ClassName : EventService.java
	 * 3. Comment : 이벤트 > 이벤트 응모 (댓글 형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int insertEventComment(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventCommentList
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 댓글 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectEventCommentList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventyDtlList
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 설문 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectEventyDtlList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventImageList
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectEventImageList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : deleteEventComment
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 댓글 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int deleteEventComment(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : deleteEventImage
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int deleteEventImage(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventImageRcmCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지 추천 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventImageRcmCount(Map<String, Object> commandMap)throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEventImageRcm
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지 추천 처리
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertEventImageRcm(Map<String, Object> commandMap)throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateEventImageRemCnt
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일> 이벤트 > 이벤트 이미지 추천 후 부모 테이블 cnt 정리
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int updateEventImageRemCnt(Map<String, Object> commandMap)throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventImageInfo
	 * 2. ClassName : EventService.java
	 * 3. Comment : 모바일 > 이벤트 > 이벤트 이미지형 > 이미지 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEventImageInfo(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEvnetPointCount
	 * 2. ClassName : EventService.java
	 * 3. Comment : 이벤트 > 이벤트 포인트 카운트   
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEvnetPointCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertPoint
	 * 2. ClassName : EventService.java
	 * 3. Comment : 이벤트 > 이벤트 포인트 적립
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertPoint(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEvtPointUseYN
	 * 2. ClassName : EventService.java
	 * 3. Comment : 이벤트 > 이벤트 포인트 적립 유무  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 28.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEvtPointUseYN(Map<String, Object> commandMap) throws Exception;

}
