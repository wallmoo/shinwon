package com.market.mall.pc.event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.ExceptionDepthComparator;
import org.springframework.retry.policy.ExceptionClassifierRetryPolicy;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EventMainService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventListCount
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 총 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 20.
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
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 리스트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 20.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception;

	public List<Map<String, Object>> selectEventBannerList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventInfo
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 정보 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectImageAllList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectEventAllProductList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventEntryCount
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 응모 참여 수 (일반형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 22.
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
	 * 1. MethodName : insertEventEntry
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 응모 (일반형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int insertEventEntry(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventSurveyList
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 설문 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 22.
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
	 * 1. MethodName : selectEventSurveyCount
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 응모 참여자 수 (설문형) 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 22.
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
	 * 1. MethodName : insertEventSurvey
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 응모 처리 (설문형)
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int insertEventSurvey(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventComment
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 코멘트 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 25.
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
	 * 1. MethodName : selectEventCommentList
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 코멘트 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectEventCommentList(Map<String, Object> commandMap)throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEventComment
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 코멘트 등록 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertEventComment(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventImageList
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 25.
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
	 * 1. MethodName : selectEventImageListCount
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 리스트 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 25.
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
	 * 1. MethodName : insertEventImage
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 등록 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertEventImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventRcmCount
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 추천 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEventImageRcmCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEventImageRcm
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 추천 처리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public int insertEventImageRcm(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateEventImageRemCnt
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 이미지 추천 후 부모 테이블 cnt 정리 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateEventImageRemCnt(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEventDetailImg
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 팝업 이미지 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 9.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEventDetailImg(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateEventImgDpl
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 팝업 이미지 > 삭제  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 10.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateEventImgDpl(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertPoint
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 포인트 적립
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 19.
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
	 * 1. MethodName : insertTotPoint
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 통합 포인트 적립
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2020. 6. 25.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertTotPoint(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEvnetPointCount
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 포인트 카운트  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 19.
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
	 * 1. MethodName : delEventRpl
	 * 2. ClassName : EventMainController.java
	 * 3. Comment : 이벤트 > 이벤트  댓글 > 삭제 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateEventRplDpl(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEvtPointUseYN
	 * 2. ClassName : EventMainService.java
	 * 3. Comment : 이벤트 > 이벤트 크라운 적립 유무  
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
