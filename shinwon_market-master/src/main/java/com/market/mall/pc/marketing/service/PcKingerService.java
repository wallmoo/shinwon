package com.market.mall.pc.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PcKingerService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : getPcKingerIngInfo
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 메인  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map getPcKingerIngInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerListCount
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 탑 제외한 게시글 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectKingerListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerList
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 탑 제외한 게시글 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List selectKingerList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerViewInfo
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 상세
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectKingerViewInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertKigerReq
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 > 신청하기 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 14.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String insertKigerReq(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerReqInfo
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 > 신청글  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectKingerReqInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerReviewInfo
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객 체험단 > 킹저 > 리뷰 글 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectKingerReviewInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : deleteKigerReq
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 신청하기 삭제
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String deleteKigerReq(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerRevView
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 리뷰 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectKingerRevView(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerWinListCount
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자발표 총 수 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectKingerWinListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerWinList
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자발표 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectKingerWinList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerWinView
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 상세 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectKingerWinView(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerWinerList
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment :고객체험단 > 킹저 > 당첨자 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 */
	public List selectKingerWinerList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerWinerSearchList
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 검색
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectKingerWinerSearchList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerMissionInfo
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 응모자 정보 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectKingerMissionInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerMissionInfoCnt
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨글 여부
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectKingerMissionInfoCnt(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateKingerConsntSedn
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 동의서 제출
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateKingerConsntSend(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertKingerReview
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 리뷰 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertKingerReview(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerMyReqCnt
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment :  고객체험단 > 킹저 > 나의 신청 글 수
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectKingerMyReqCnt(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectKingerMyRevCnt
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 나의 댓글 수  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectKingerMyRevCnt(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateKingerWinVist
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 조회수 증가  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateKingerWinVist(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateKingerReview
	 * 2. ClassName : PcKingerService.java
	 * 3. Comment : 고객체험단 > 킹저 > 리뷰 수정 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 31.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateKingerReview(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

}
