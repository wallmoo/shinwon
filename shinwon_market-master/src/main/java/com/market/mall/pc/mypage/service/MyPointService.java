package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyPointService.java
 * @Date : 2014. 6. 16.
 * @프로그램 설명 : 프론트 > 마이페이지 > 쇼핑해택 > 포인트를 처리하는 Service Interface
 * @author DEV_SONGJEONGEUN
 */
public interface MyPointService {

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointListCount
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 포인트 목록 갯수  
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 6. 16. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMyPointListCount(HttpServletRequest request,Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointList
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 포인트 목록 (통합포인트)
     * 4. 작성일			: 2015. 6. 18. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyTotPointList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMyPointList
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 포인트 목록
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 6. 16. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyPointList(HttpServletRequest request,Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
     * 1. MethodName	: selectMyEpoint
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 사용가능한 E포인트 조회
     * 4. 작성일			: 2015. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMyEpoint(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
     * 1. MethodName	: selectMyEpoint
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 주문서 > 사용가능한 통합포인트 조회
     * 4. 작성일			: 2015. 6. 16. 
     * </pre>
     * @param userId
     * @return
     * @throws Exception
     */
    public int selectMyTotPoint(String userId) throws Exception;
    
    /**
	 * <pre>
     * 1. MethodName	: selectAjaxEpoint
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 주문서 > 사용가능한 E포인트 조회
     * 4. 작성일			: 2015. 6. 24. 
     * </pre>
     * @param userId
     * @return
     * @throws Exception
     */
    public int selectAjaxEpoint(Map<String, Object> commandMap) throws Exception;
       
    
    /**
	 * <pre>
     * 1. MethodName	: selectMyInfo
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 회원정보조회
     * 4. 작성일			: 2015. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMyInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName	: selectMyPointSwOne
     * 2. ClassName		: MyPointService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 임직원 포인트조회
     * 4. 작성일			: 2015. 6. 16. 
     * </pre>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyPointSwOne(Map<String, Object> commandMap) throws Exception;
    
    // 임직원 포인트 추가포인트 조회
    public List<Map<String, Object>> selectUserAddEmpPointLimit(Map<String, Object> commandMap) throws Exception;
    	
    // 통합포인트의 잔여(가용) 포인트 조회  from ERP
	public Map<String, Object> selectMyTpoint(Map<String, Object> innerMap) throws Exception;

}
