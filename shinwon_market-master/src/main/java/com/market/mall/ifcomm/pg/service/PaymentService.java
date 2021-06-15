package com.market.mall.ifcomm.pg.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.ifcomm.pg
 * @FileName : PaymentService.java
 * @Date : 2015. 10. 20.
 * @프로그램 설명 : PAY_MASTER 처리하는 Interface
 * @author DEV_KANGHYUNKYU
 */
public interface PaymentService {
	
	/**
	* <pre>
	* 1. MethodName : insertPayMaster
	* 2. ClassName  : PaymentService.java
	* 3. Comment    : PayMaster 등록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertPayMaster (Map<String, Object> commandMap) throws Exception;
	
	/**
	    * <pre>
	    * 1. MethodName : insertPayMaster
	    * 2. ClassName  : PaymentService.java
	    * 3. Comment    : PayMasterLG 등록
	    * 4. 작성자       : DEV_KANGHYUNKYU
	    * 5. 작성일       : 2015. 10. 20.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	    */
	    public int insertLgPayMaster (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deletePayMaster
	* 2. ClassName  : PaymentService.java
	* 3. Comment    : PayMaster 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deletePayMaster(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updatePayDepositState
	* 2. ClassName  : PaymentService.java
	* 3. Comment    : 무통장 입금/취소 처리
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updatePayDepositState(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateEscrowState
	* 2. ClassName  : PaymentService.java
	* 3. Comment    : 에스크로 상태변경
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 1.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateEscrowState(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
    * <pre>
    * 1. MethodName : selectOrderCashbagInfo
    * 2. ClassName  : PaymentService.java
    * 3. Comment    : 주문 캐쉬백 조회/사용/적립 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrderCashbagInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : getPgInfo
     * 2. ClassName  : PaymentService.java
     * 3. Comment    : PG 신규승인 정보 value 생성   
     * 4. 작성자       : epasscni
     * 5. 작성일       : 2015. 4. 24.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public Map<String, Object> getPgApprovalValue(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : approval
     * 2. ClassName  : paymentService.java
     * 3. Comment    : PG 신규승인 요청 
     * 4. 작성자       : epasscni
     * 5. 작성일       : 2015. 4. 24.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public Map<String,Object> pgApproval(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : pgPartCancel
     * 2. ClassName  : PaymentService.java
     * 3. Comment    : PG 연동 부분취소 처리 
     * 4. 작성자       : epasscni
     * 5. 작성일       : 2015. 4. 26.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public Map<String, Object> pgPartCancel(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : pgPartCancel
     * 2. ClassName  : PaymentService.java
     * 3. Comment    : PG 연동 전체취소 처리 
     * 4. 작성자       : epasscni
     * 5. 작성일       : 2015. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public Map<String, Object> pgCancel(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : payNoteRes
     * 2. ClassName  : PaymentService.java
     * 3. Comment    : PG 연동 계좌이체(무통장입금) 결과 수신 
     * 4. 작성자       : epasscni
     * 5. 작성일       : 2015. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public Map<String, Object> payNoteRes(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;

}
