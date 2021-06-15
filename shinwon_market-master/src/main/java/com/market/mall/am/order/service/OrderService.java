package com.market.mall.am.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.order.service
 * @FileName : OrderService.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 : 관리자 > 주문관리 > 전체주문을 처리하는 Service Class
 * @author LJH
 */
public interface OrderService {

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderCount
	 * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 목록 갯수
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 21. 오전 11:13:54
	 * </pre>
	 *
	 * @return int
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectOrderCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderList
     * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:14:29
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderList(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderView
     * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문 상세 정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:15:35
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderView(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderSimpleView
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 주문 상세 간략 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrderSimpleView(Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectDeliveryInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 주문 배송지 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectDeliveryInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderHistoryView
     * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문 상세 > 주문 수정 이력 리스트
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:17:30
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderHistoryView(Map<String, Object> commandMap) throws Exception;
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderStateInfo
	 * 2. ClassName		: OrderService.java
	 * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 > 주문상태 변경 팝업 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 28. 오전 9:25:14
	 * </pre>
	 *
	 * @return Map<String,Object>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectOrderStateInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderTotalCnt
     * 2. ClassName		: OrderService.java
     * 3. Commnet		: 관리자 > 회원관리 > 회원현황 > 주문내역 > 주문합계
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 29. 오후 5:29:20
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> selectOrderTotalCnt(Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: updateOrderState
     * 2. ClassName		: OrderService.java
	 * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 > 주문상태 변경 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 28. 오전 11:53:39
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
	public Map<String,Object> updateOrderState(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;

	/**
	* <pre>
	* 1. MethodName : selectChangeOrderProductView
	* 2. ClassName  : OrderService.java
	* 3. Comment    : 교환접수 팝업 상품 상세 정보
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 10. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectChangeOrderProductView(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertChangeOrderProduct
	* 2. ClassName  : OrderService.java
	* 3. Comment    : 교환상품 접수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 10. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public String insertChangeOrderProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	public String insertChangeOrderProduct2(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderCstCount
	 * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문상세 > 상담내용
	 * 4. 작성자			: 이미정
	 * 5. 작성일			: 2014. 11. 06.
	 * </pre>
	 *
	 * @return int
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectOrderCstCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOtherOrderCstCount
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 해당 주문자의 다른 주문 상담 내역 리스트 개수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOtherOrderCstCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderCstList
     * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문상세 > 상담내용
	 * 4. 작성자			: 이미정
	 * 5. 작성일			: 2014. 11. 06.
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderCstList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOtherOrderCstList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 해당 주문자의 다른 주문 상담 내역 리스트 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOtherOrderCstList(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * 
	 * <pre>
	 * 1. MethodName	: insertOrderCst
	 * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문상세 > 상담내용저장
	 * 4. 작성자			: 이미정
	 * 5. 작성일			: 2014. 11. 06.
	 * </pre>
	 *
	 * @return int
	 * @param commandMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public int insertOrderCst(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateRefBankAccount
	* 2. ClassName  : OrderService.java
	* 3. Comment    : 환불계좌 수정 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 11. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateRefBankAccount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
    /**
    * <pre>
    * 1. MethodName : insertInvoiceNo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 송장번호 입력
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 5. 12.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> insertInvoiceNo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMemberPointInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : [부분취소팝업]회원 잔여 포인트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMemberPointInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBcncCdCheck
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 매장관리자 본인 매장인지 체크
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBcncCdCheck(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStateCodeList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 주문상태값 코드 리스트
    * 4. 작성자       : epass_n_11
    * 5. 작성일       : 2015. 10. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderStateCodeList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateDeliveryInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 배송지수정
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 10. 29.
    * </pre>
    *
    * @param commandMap
    * @param request
    * @return
    * @throws Exception
    */
    public int updateDeliveryInfo(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderPaySimpleInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 주문 결제 간략 정보 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 11. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrderPaySimpleInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCodeList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 공통코드 하위코드 조회
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 11. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCodeList(Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductAndOptionInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 상품 & 상품 옵션 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductAndOptionInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateProductOption
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 옵션 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateProductOption(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateOrdGetAfterSend
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 교환권 발송
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> updateOrdGetAfterSend(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateOrdGetInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 겟잇나우 수령정보 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateOrdGetInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateScmCancel
    * 2. ClassName  : OrderService.java
    * 3. Comment    : SCM 취소요청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateScmCancel(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectReleaseDeliveryList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 출고처/배송처 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectReleaseDeliveryList(Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderCouponList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 주문 쿠폰 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderCouponList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 주문 정보 가져오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrderInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderChannelList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 채널 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderChannelList(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSizeList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectErpOrderInfoList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : ERP 주문 상세 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectErpOrderInfoList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectErpOrderAccountingList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : ERP 주문 회계 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectErpOrderAccountingList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectErpCancelCallOrderList
    * 2. ClassName  : OrderService.java
    * 3. Comment    : ERP 취소요청중인 주문 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectErpCancelCallOrderList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateOrdCnlYnReset
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 취소요청 초기화
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 4. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateOrdCnlYnReset(Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectOrderErpInfo(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectOrderErpInfoApi(Map<String, Object> commandMap) throws Exception;
	public Map<String,Object> selectOrdPrdIdx(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
     * 
     * <pre>
     * 1. MethodName	: selectOrderBackList
     * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 반품관리 주문 목록 
     * 4. 작성자			: 이원중
     * 5. 작성일			: 2020. 6. 16. 
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
	public List<Map<String, Object>> selectOrderBackList(Map<String, Object> commandMap);

	public int selectOrderBackListCount(Map<String, Object> commandMap);

	/**
     * 
     * <pre>
     * 1. MethodName	: updateDeliveryTypeAjax
     * 2. ClassName		: OrderService.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문 목록 - 매장발송 버튼 클릭시 배송타입을 '입점업체'로 변경 
     * 4. 작성자			: 이원중
     * 5. 작성일			: 2020. 6. 22. 
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
	public int updateDeliveryTypeAjax(Map<String, Object> commandMap);
	
	
	
	/**
    * <pre>
    * 1. MethodName : selectOrderBackInfo
    * 2. ClassName  : OrderService.java
    * 3. Comment    : 취소 및 반품 사유 조회
    * 4. 작성자       : 이원중
    * 5. 작성일       : 2020. 6. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrderBackInfo(Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : selectChangeCouponList
     * 2. ClassName  : OrderService.java
     * 3. Comment    : 사용 가능한 무료배송/교환/반품 쿠폰 리스트 조회
     * 4. 작성자       : 이원중
     * 5. 작성일       : 2020. 7. 1.
     * </pre>
     *
     * @param commandMap, changeCouponType(A:무료배송, B:무료교환, C:무료반품)
     * @return
     */
    public List<Map<String, Object>> selectChangeCouponList(Map<String, Object> commandMap, String changeCouponType);
	
}
