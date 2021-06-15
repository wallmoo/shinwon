package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.pc.mypage.service
 * @FileName : MyShoppingService.java
 * @Date : 2014. 7. 8.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 쇼핑내역을 처리하는 Service Interface
 * @author LJH
 */
public interface MyShoppingService {

	/**
	* <pre>
	* 1. MethodName : setOrderState
	* 2. ClassName  : MyShoppingService.java
	* 3. Comment    : 주문 상태값 셋팅
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 8.
	* </pre>
	*
	* @param commandMap
	*/
	public int insertLike(Map<String, Object> commandMap) throws Exception;	
	public int insertReInputAjax(Map<String, Object> commandMap) throws Exception;	
	public void setOrderState(Map<String, Object> commandMap);
	public List<Map<String, Object>> selectMyShoppingPrwList(Map<String, Object> commandMap) throws Exception;
	public int myPageReInputDelAjax(Map<String, Object> commandMap) throws Exception ;
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectMyShoppingListCount
	 * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 갯수 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 8. 오전 11:47:46
	 * </pre>
	 *
	 * @return int
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectMyShoppingListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName	: selectMyShoppingList
     * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 8. 오전 11:48:22
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMyShoppingList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyReceiptIssueListCount
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 프론트 > 마이페이지 > 증빙서류발급 목록 갯수 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyReceiptIssueListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMyReceiptIssueList
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 프론트 > 마이페이지 > 증빙서류발급 목록
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectMyReceiptIssueList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderProductList
     * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 상세 > 주문상품 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 2:05:40
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOrderProductList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderDeliveryInfo
     * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 상세 > 배송정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 2:52:48
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderDeliveryInfo (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderPayInfo
     * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 상세 > 할인/결제정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 5:18:01
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderPayInfo (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStateCnt
     * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 상세 > 주문상태정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 5:18:01
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOrderStateCnt (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: updateOrderBack
     * 2. ClassName		: MyShoppingService.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 상세 > 주문취소/반품요청 > 주문반품요청
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 15. 오후 1:38:29
     * </pre>
     *
     * @return Map<String, Object>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> updateOrderBack (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectOrderCount
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 현황 > 자기 주문인지 체크
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOrderCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPickupBcncInfo
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 픽업주문인 경우 픽업매장 정보 가져오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectPickupBcncInfo(Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectRequestedGiftList
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 사은품 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectRequestedGiftList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderSubPrdList
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 주문상품 서브 옵션 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrderSubPrdList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateDeliveryInfo
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 주문 배송지 정보 수정
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 30.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateDeliveryInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateProductOptionCnt
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 옵션 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> updateProductOptionCnt(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrderCancelInfo
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 주문 취소 팝업에서 필요한 주문 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrderCancelInfo(Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrdPrdInfo
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 주문상품 주문상태 변경시 검증에 필요한 주문상품정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectOrdPrdInfo(Map<String, Object> commandMap) throws Exception; 
    
    /**
    * <pre>
    * 1. MethodName : insertTaxIvc
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 세금계산서 신청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertTaxIvc (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrdPrdAllOptionList
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 교환/반품 접수시 필요한 필수/선택 옵션 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrdPrdAllOptionList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertChangeOrderProduct
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 교환 접수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> insertChangeOrderProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOrdCancelSwapBackInfo
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 주문상세 취소/교환/반품 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOrdCancelSwapBackInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectRepayYn
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 재주문 가능여부 0이상이면 가능
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectRepayYn (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMemberInfo
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 회원 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMemberInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectGetItNowOrderList
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 겟잇나우 주문 리스트(앱)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectGetItNowOrderList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateOrderCancelRequest
    * 2. ClassName  : MyShoppingService.java
    * 3. Comment    : 주문 취소 요청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateOrderCancelRequest (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectMyOOTDShoppingList (Map<String, Object> commandMap);
}
