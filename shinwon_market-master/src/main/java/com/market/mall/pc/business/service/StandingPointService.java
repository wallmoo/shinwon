package com.market.mall.pc.business.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.market.mall.model.Business;

/**
 * @PackageName: com.market.mall.pc.business.service
 * @FileName : StandingPointService.java
 * @Date : 2016. 2. 12.
 * @프로그램 설명 : 프론트 > 입점신청 관련 처리하는 Service Interface
 * @author : DEV_LEEKWANGWOON
 */
public interface StandingPointService {

	
	/**
	 * <pre>
	 * 1. MethodName : insertStandingPointCounsel
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 등록처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 12.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertStandingPointCounsel (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselListCount
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 리스트 카운트
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 15.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectStandingPointCounselListCount (Map<String, Object> commandMap) throws Exception;	
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselList
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 리스트
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 15.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectStandingPointCounselList (Map<String, Object> commandMap) throws Exception;	
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointCounselView
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 상세페이지
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 15.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectStandingPointCounselView (Map<String, Object> commandMap) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. MethodName : deleteStandingPointCounsel
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 삭제처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int deleteStandingPointCounsel (Map<String, Object> commandMap) throws Exception;	
	
	/**
	 * <pre>
	 * 1. MethodName : updateStandingPointCounsel
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 수정처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateStandingPointCounsel (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointApplicationCount
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 카운트
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectStandingPointApplicationCount (Map<String, Object> commandMap) throws Exception;	
	
	/**
	 * <pre>
	 * 1. MethodName : insertStandingPointApplication
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 등록
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertStandingPointApplication (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointApplication
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 상세페이지
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectStandingPointApplication (Map<String, Object> commandMap) throws Exception;	
	
	/**
	 * <pre>
	 * 1. MethodName : updateStandingPointApplication
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 수정처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 17.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateStandingPointApplication (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;	
	
	/**
	 * <pre>
	 * 1. MethodName : selectStandingPointApplicationCount
	 * 2. ClassName  : StandingPointService.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 카운트
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	public int selectStandingPointCounselStateCount (Map<String, Object> commandMap) throws Exception;		
	
	/**
	* <pre>
	* 1. MethodName : selectBussinessCommonInfo
	* 2. ClassName  : StandingPointService.java
	* 3. Comment    : 입점센터에서 공통으로 필요한 정보들
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectBussinessCommonInfo (Map<String,Object> commandMap) throws Exception;
	
}
