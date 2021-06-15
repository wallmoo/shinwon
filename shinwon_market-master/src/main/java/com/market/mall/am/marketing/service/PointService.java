package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : PointService.java
 * @Date : 2015. 10. 22.
 * @프로그램 설명 : 관리자 > 프로모션 관리 > 포인트 관리를 처리하는 Service Interface
 * @author khcho
 */
public interface PointService {
    
    /**
    * <pre>
    * 1. MethodName : selectPointListCount
    * 2. ClassName  : PointService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 10. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectPointListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPointDetailCount
     * 2. ClassName  : PointService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectPointDetailCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPointList
    * 2. ClassName  : PointService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트리스트 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 10. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectPointList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPointDetail
     * 2. ClassName  : PointService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 포인트내역 > 포인트내역 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPointDetail (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPointPopup
     * 2. ClassName  : PointService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 포인트내역정보 > 포인트팝업 정보 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPointPopup (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertPoint
    * 2. ClassName  : PointService.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 포인트적립 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertPoint (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPointMember
     * 2. ClassName  : PointService.java
     * 3. Comment    : 관리자 > 프로모션 관리 > 포인트 적립 아이디조회
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPointMember (List<Map<String, Object>> memberList) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectMemberPointCount
     * 2. ClassName  : PointService.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 회원포인트 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2016. 2. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectMemberEpointCount (Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName : selectMemberPoint
      * 2. ClassName  : PointService.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 회원포인트 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2016. 2. 3.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public List<Map<String, Object>> selectMemberPoint (Map<String, Object> commandMap) throws Exception;
      
      /**
       * <pre>
       * 1. MethodName : selectMemberPointSum
       * 2. ClassName  : PointService.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 회원포인트 합
       * 4. 작성자       : khcho
       * 5. 작성일       : 2016. 2. 3.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       public Map<String, Object> selectMemberPointSum (Map<String, Object> commandMap) throws Exception;
       
	/*
	 *  관리자 > 회원관리 > 회원 아이디 클릭 > 포인트탭 > 통합포인트탭
	 */   
       public Map<String, Object> getTpointAmount(Map<String, Object> commandMap) throws Exception; //통합포인트 잔액조회
       public List<Map<String, Object>> selectMyTonghapPointList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    /*
   	 *  관리자 > 회원관리 > 회원 아이디 클릭 > 포인트탭 > 임직원포인트탭
   	 */
       //연간 임직원포인트 ERP 조회
       public List<Map<String, Object>> selectEmployeePointList(Map<String, Object> commandMap) throws Exception;
       //임직원 추가 포인트 ERP 조회 
       List<Map<String, Object>> selectUserAddEmpPointLimit(Map<String, Object> commandMap) throws Exception;
	/**
	  * <pre>
	  * 1. MethodName : selectMemberPointCount
	  * 2. ClassName  : PointServiceImpl.java
	  * 3. Comment    : 관리자 > 마케팅 관리 > 회원 통합포인트 목록객수
	  * 4. 작성자       : khcho
	  * 5. 작성일       : 2016. 2. 3.
	  * </pre>
	  *
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	int selectMemberTpointCount(Map<String, Object> commandMap) throws Exception;

	/**
	   * <pre>
	   * 1. MethodName : selectMemberPointCount
	   * 2. ClassName  : PointServiceImpl.java
	   * 3. Comment    : 관리자 > 마케팅 관리 > 회원 임직원포인트 목록객수
	   * 4. 작성자       : khcho
	   * 5. 작성일       : 2016. 2. 3.
	   * </pre>
	   *
	   * @param commandMap
	   * @return
	   * @throws Exception
	   */
	int selectMemberSwPointCount(Map<String, Object> commandMap) throws Exception;
	
	
	

       
}
