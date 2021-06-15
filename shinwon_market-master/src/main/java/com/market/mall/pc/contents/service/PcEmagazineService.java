package com.market.mall.pc.contents.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PcEmagazineService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName : getPcEmagazineIngInfo
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 킹저 메인  
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEmagazineManyRead(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineMainCount
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 메인 게시글 수 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEmagazineMainCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectPcEmagazineQnaList
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > qna목록
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 20
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectPcEmagazineQnaList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectPcEmagazineQnaCount
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 qna 게시글 수 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 20.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectPcEmagazineQnaCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineList
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 킹저 탑 제외한 게시글 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEmagazineMain(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineProductList
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 이매거진 상품리스트 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 20.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEmagazineProductList(Map<String, Object> commandMap) throws Exception;
	
	
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineViewInfo
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 킹저 상세
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 13.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEmagazineViewInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : insertEmagazineQna
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 살세 질문등록 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 20.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String insertEmagazineQna(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : updateEmagazineReadCount
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 조회수 올리기
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateEmagazineReadCount(Map<String, Object> commandMap) throws Exception;
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineReqInfo
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 킹저 > 신청글  
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEmagazineReqInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineReviewInfo
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 이매거진 > 킹저 > 리뷰 글 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEmagazineReviewInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : deleteKigerReq
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 신청하기 삭제
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String deleteEmagazineQna(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineRevView
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 리뷰 상세 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEmagazineRevView(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineWinListCount
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자발표 총 수 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEmagazineWinListCount(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineWinList
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자발표 리스트
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEmagazineWinList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineWinView
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 상세 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEmagazineWinView(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineWinerList
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment :고객체험단 > 킹저 > 당첨자 리스트 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 */
	public List selectEmagazineWinerList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineWinerSearchList
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨자 검색
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEmagazineWinerSearchList(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineMissionInfo
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 응모자 정보 
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map selectEmagazineMissionInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectEmagazineMissionInfoCnt
	 * 2. ClassName : PcEmagazineService.java
	 * 3. Comment : 고객체험단 > 킹저 > 당첨글 여부
	 * 4. 작성자 : KhCho
	 * 5. 작성일 : 2016. 1. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectEmagazineMissionInfoCnt(Map<String, Object> commandMap) throws Exception;
	
	public int selectInterestContentsCheckCount (HttpServletRequest request , Map<String,Object> commandMap) throws Exception;
	
	public int insertInterestContents (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

	public int selectEmagazineMyReqCnt(Map<String, Object> commandMap) throws Exception;
	

}
