package com.market.mall.am.stats.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.stats.service
 * @FileName : StatsMemberService.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 회원통계를 처리하는 Controller Class
 * @author LJH
 */
public interface StatsMemberService {

	/**
	 * <pre>
	 * 1. MethodName	: selectMemberJoinDate
	 * 2. ClassName		: StatsMemberService.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 성별/연령별 가입 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectMemberJoinDate(Map<String, Object> commandMap) throws Exception;
    
	/**
	 * <pre>
	 * 1. MethodName	: selectErpJoinPath
	 * 2. ClassName		: StatsMemberService.java
     * 3. Comment    	:  ERP 가입경로
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectErpJoinPath(Map<String, Object> commandMap) throws Exception;
    
    
	/**
	 * <pre>
	 * 1. MethodName	: selectMemberOrderArea
	 * 2. ClassName		: StatsMemberService.java
     * 3. Comment    	:  관리자 > 통계 > 회원통계 > 지역별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 18.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectMemberOrderArea(Map<String, Object> commandMap) throws Exception;
    
    
	/**
	 * <pre>
	 * 1. MethodName	: selectMemberOrderPrice
	 * 2. ClassName		: StatsMemberService.java
     * 3. Comment    	:  관리자 > 통계 > 회원통계 > 주문금액별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 18.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectMemberOrderPrice(Map<String, Object> commandMap) throws Exception;
    
	/**
	 * <pre>
	 * 1. MethodName	: selectMemberOrderRate
	 * 2. ClassName		: StatsMemberService.java
     * 3. Comment    	:  관리자 > 통계 > 회원통계 > 구매율별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 18.
	 * </pre>
	 *
	 * @return List<Map<String,Object>>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectMemberOrderRate(Map<String, Object> commandMap) throws Exception;
    
    
}
