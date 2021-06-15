package com.market.mall.pc.cart.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @PackageName: com.market.mall.pc.cart.service
 * @FileName : CartService.java
 * @Date : 2014. 7. 3.
 * @프로그램 설명 : 장바구니 / 주문.결제 관련 업무를 처리하는 Service Interface
 * @author 이상준
 */
public interface CartService {
	
	
	/**
	* <pre>
	* 1. MethodName : checkGetItNowCart
	* 2. ClassName  : CartService.java
	* 3. Comment    : 겟잇나우 중복상품 장바구니 체크
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> checkGetItNowCart(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : insertCart
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 특정 상품의 대표상품코드 / 옵션코드를 기준으로하여 장바구니에 상품을 신규 등록한다.
	 * 단, 동일 상품코드/옵션이 존재하는 경우 수량을 추가
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return 
	 * 0 : 장바구니 등록 성공
	 * -1 : 판매불가 상품 (등록대기/미판매 등)
	 * -2 : 재고수량 부족
	 * -3 : 품절상품(재고:0)
	 * 
	 * @throws Exception
	 */
	public int insertCart(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : insertCart
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 상품상세 -> 바로구매시 장바구니에 상품 등록 후 임시 주문 테이블 생성
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 *
	 * @param commandMap, request
	 * @return 
	 * 0 : 장바구니 등록 성공
	 * -1 : 판매불가 상품 (등록대기/미판매 등)
	 * 
	 * @throws Exception
	 */
	public int insertDirectPurchase(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertRepayTempOrder
	* 2. ClassName  : CartService.java
	* 3. Comment    : 재결제 임시 주문 생성
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 2.
	* </pre>
	*
	* @param commandMap
	* @param request
	* @return
	* @throws Exception
	*/
	public String insertRepayTempOrder(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
		
	/**
	 * <pre>
	 * 1. MethodName : selectPrdStock
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 상품상세 -> 장바구니 담기 or 바로구매시 재고확인
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 9. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return 구매가능수량
	 * @throws Exception
	 */
    public Map<String, Object> selectPrdStock(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
    public void selectPrdStockAll(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
    
	/**
	 * <pre>
	 * 1. MethodName : updateCartOwner
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 로그인직후 호출되며, 미인증 상태에서 등록 했던 장바구니 상품 정보를 해당 회원에게 귀속. 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public void updateCartOwner(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempOrderOwner
	* 2. ClassName  : CartService.java
	* 3. Comment    : 로그인직후 호출되며, 미인증 상태에서 등록 했던 임시 주문 정보를 해당 회원에게 귀속. 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 25.
	* </pre>
	*
	* @param commandMap
	* @throws Exception
	*/
	public void updateTempOrderOwner(Map<String, Object> commandMap) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectCartlist
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 장바구니 목록 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectCartlist(Map<String, Object> commandMap) throws Exception; 
	
	/**
	* <pre>
	* 1. MethodName : selectTempOrderProductList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 상품 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectTempOrderProductList(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : deleteCart
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 장바구니 상품 개별/전체 삭제 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public void deleteCart(Map<String, Object> commandMap) throws Exception; 
	
	/**
	 * <pre>
	 * 1. MethodName : selectOrderMstCd
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 신규주문번호 생성 요청
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String selectOrderMstCd(Map<String, Object> commandMap) throws Exception; 
	
	/**
	 * 
	  * <pre>
	 * 1. MethodName : selectOrderTmpMstCd
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 0원결제 시 TMP 테이블에서 주문번호 획득
	 * 4. 작성일       	 : 2020. 6. 20.
	 * </pre>
	 *  
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String selectOrderTmpMstCd(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : insertOrder
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 신규주문생성
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertOrder(HttpServletRequest request, Map<String, Object> commandMap, HttpServletResponse response) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateProductOptionCnt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 옵션/수량 변경
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateProductOptionCnt(Map<String, Object> commandMap) throws Exception;
	
	/**
     * <pre>
     * 1. MethodName : selectCartCnt
     * 2. ClassName  : CartService.java
     * 3. Comment    : 화면 상단 장바구니 상품 수량
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCartCnt(Map<String, Object> commandMap) throws Exception;

	/**
	* <pre>
	* 1. MethodName : selectBannerDisplayList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 배너 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectBannerDisplayList(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCrtStock
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장바구니 -> 주문서 재고 확인
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectCrtStock(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteSoldOutCart
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장바구니 품절상품 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 21.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public void deleteSoldOutCart(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectTempOrderStock
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 -> 결제 재고 확인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectTempOrderStock(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCartMemberInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장바구니에서 필요한 회원 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 5. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectCartMemberInfo(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCartPrdInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장바구니 상품 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 6. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectCartPrdInfo(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectGiftList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 사은품 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 6. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectGiftList(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCartForCouponList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 쿠폰 할인금액 계산용 주문상품 리스트 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 6. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCartForCouponList(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempCartAmtReset
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 임시 주문금액 초기화
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTempCartAmtReset(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempCartPrdAmtReset
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 임시 주문금액 초기화
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 26.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTempCartPrdAmtReset(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempCartAmt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 임시 주문금액 변경
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTempCartAmt(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempCartPrdCpnAmt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 임시 주문금액 변경(상품쿠폰 금액)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTempCartPrdCpnAmt(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempCartDlvCpnAmt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 임시 주문금액 변경(배송비쿠폰 금액)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTempCartDlvCpnAmt(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateTempCartPrdAmt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 임시 주문금액 변경(상품별 추가배송비)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 26.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateTempCartPrdAmt(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPaymentAmt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문금액 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 3.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectPaymentAmt(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;	
	
	/**
	* <pre>
	* 1. MethodName : insertCartTempInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 모바일 주문 임시 정보 등록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertCartTempInfo(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : deleteCartTempInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 모바일 주문 임시 정보 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 8.
	* </pre>
	*
	* @param commandMap
	* @throws Exception
	*/
	public void deleteCartTempInfo(Map<String, Object> commandMap) throws Exception; 
	
	/**
	* <pre>
	* 1. MethodName : selectCartTempInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 모바일 주문 임시 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectCartTempInfo(Map<String, Object> commandMap) throws Exception;
	
	
	/**
	* <pre>
	* 1. MethodName : selectCodeList
	* 2. ClassName  : CartService.java
	* 3. Comment    :  공통코드 하위 리스트 조회
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 19.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCodeList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectKiccCardList
	* 2. ClassName  : CartService.java
	* 3. Comment    : kicc 카드 리스트 조회
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectKiccCardList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectUserInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 유저 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectUserInfo(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectProductInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 상품정보 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectProductInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCartOptionDetailList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장바구니 상품 옵션 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCartOptionDetailList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectGetItNowShopTimeInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 겟잇나우 매장 방문 가능 시간 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectGetItNowShopTimeInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCartSubPrdList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장바구니 서브 상품 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCartSubPrdList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectTempOrderSubPrdList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 서브 상품 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectTempOrderSubPrdList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertTempOrder
	* 2. ClassName  : CartService.java
	* 3. Comment    : 임시주문 생성
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public String insertTempOrder(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectRecentDlvList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문서 최근 배송지 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectRecentDlvList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCardInstallmentList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 카드 할부 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCardInstallmentList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCardLongInstallmentList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장기할부인 경우 사용가능 카드사 코드 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCardLongInstallmentList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCardLongInstallmentMinimumPrc
	* 2. ClassName  : CartService.java
	* 3. Comment    : 장기할부인 경우 최소구매가능금액
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectCardLongInstallmentMinimumPrc(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCardEventFreeList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 무이자 할부 행사 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCardEventFreeList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCardPromotionList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 카드 행사 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCardPromotionList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectInterestProductCheckCount
	* 2. ClassName  : CartService.java
	* 3. Comment    : 프론트 > 장바구니 > 관심상품 중복 체크 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectInterestProductCheckCount (HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertInterestProduct
	* 2. ClassName  : CartService.java
	* 3. Comment    : 프론트 > 장바구니 > 관심상품 등록 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertInterestProduct (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

	/**
	* <pre>
	* 1. MethodName : selectMemberCashbagInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 회원 캐쉬백 카드번호
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectMemberCashbagInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPreOrderCashbagInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 이전 주문 캐쉬백 사용 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectPreOrderCashbagInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectCartCouponList
	* 2. ClassName  : CartService.java
	* 3. Comment    : 쿠폰 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectCartCouponList(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectTotCouponDcAmt
	* 2. ClassName  : CartService.java
	* 3. Comment    : 총 쿠폰 할인 금액 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectTotCouponDcAmt(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectGetItNowShopInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 겟잇나우 지점정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectGetItNowShopInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectOrderGetItNowShopInfo
	* 2. ClassName  : CartService.java
	* 3. Comment    : 주문후 겟잇나우 지점정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectOrderGetItNowShopInfo(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateGetItNowTicketSend
	* 2. ClassName  : CartService.java
	* 3. Comment    : 겟잇나우 교환권 발송
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateGetItNowTicketSend(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertEstimateTempOrder
	* 2. ClassName  : CartService.java
	* 3. Comment    : 견적 임시 주문 생성
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 29.
	* </pre>
	*
	* @param commandMap
	* @param request
	* @return
	* @throws Exception
	*/
	public Map<String,Object> insertEstimateTempOrder(Map<String, Object> commandMap, HttpServletRequest request) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectReservePrice
	* 2. ClassName  : CartService.java
	* 3. Comment    : 적립금 계산
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 4. 18.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectReservePrice(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 2020.06.25 테스트 카드리스트 PG 매핑데이터
	 * 
	 */
	public List<Map<String, Object>> selectTempCardList() throws Exception;
	
	/**
	 * 2020.06.29
	 * 
	 * 프론트 -> 주문서 -> 쿠폰사용 시 금액검증 및 계산
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> calcIniPayment(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * 2020.06.30
	 * 
	 * 프론트 -> 주문서 -> 결제 시 쿠폰사용조회 후 금액계산
	 * 
	 * @param selectMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> selectUseCpn(Map<String, Object> selectMap) throws Exception;
}