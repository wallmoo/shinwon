package com.market.mall.pc.mypage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.FileUpload;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.mypage.service.MyShoppingService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyShoppingServiceImpl.java
 * @Date : 2014. 7. 8.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 쇼핑내역을 처리하는 Service Implement Class
 * @author LJH
 */
@Service("pcMyShoppingService")
public class MyShoppingServiceImpl implements MyShoppingService{

	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    @Resource(name="cartService") private CartService cartService;
    @Resource(name="orderService") private OrderService orderService;
    @Resource private Sms sms;
    
    @Autowired
	private FileUpload fileUpload;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : setOrderState
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 주문 상태값 셋팅
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    */
    public void setOrderState(Map<String, Object> commandMap){
    	
    	commandMap.put("OST_ORDER", Code.OST_ORDER);
		commandMap.put("OST_PAY_READY", Code.OST_PAY_READY);
		commandMap.put("OST_PAY", Code.OST_PAY);
		commandMap.put("OST_CANCEL_BEFORE_DEPOSIT", Code.OST_CANCEL_BEFORE_DEPOSIT);
		commandMap.put("OST_CANCEL", Code.OST_CANCEL);
		commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
		commandMap.put("OST_SEND_READY", Code.OST_SEND_READY);
		commandMap.put("OST_SEND", Code.OST_SEND);
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);
		commandMap.put("OST_BACK", Code.OST_BACK);
		commandMap.put("OST_BACK_END", Code.OST_BACK_END);
		commandMap.put("OST_SWAP", Code.OST_SWAP);
		commandMap.put("OST_SWAP_READY", Code.OST_SWAP_READY);
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
		commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
		commandMap.put("OST_FIX", Code.OST_FIX);
		commandMap.put("OST_REFUND", Code.OST_REFUND);
		commandMap.put("OST_REFUND_END", Code.OST_REFUND_END);
	    commandMap.put("OST_SWAP_COLLECT_CALL", Code.OST_SWAP_COLLECT_CALL);
	    commandMap.put("OST_SWAP_COLLECT_END", Code.OST_SWAP_COLLECT_END);
	    commandMap.put("OST_BACK_COLLECT_CALL", Code.OST_BACK_COLLECT_CALL);
	    commandMap.put("OST_BACK_COLLECT_END", Code.OST_BACK_COLLECT_END);
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);
		commandMap.put("OST_SWAP_TARGET_COLLECT_END", Code.OST_SWAP_TARGET_COLLECT_END);
		commandMap.put("OST_BACK_APPROVED", Code.OST_BACK_APPROVED);
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//개별 반품처리 위한 반품관련 주문상태값 리스트
		commandMap.put("OST_SWAP_IGNORE_ARR", Code.OST_SWAP_IGNORE_ARR);//계산시에는 없는 상품으로 쳐야할 주문상태값 리스트
		
		//commandMap.put("OST_SHOPPING_EXCLUDE_ARR", Code.OST_SHOPPING_EXCLUDE_ARR);//마이페이지 주문/배송 조회시 제외할 주문상태값 리스트
		commandMap.put("OST_CANCEL_ARR", Code.OST_CANCEL_ARR);//마이페이지 취소 조회시 주문상태값 리스트
		commandMap.put("OST_SWAP_ARR", Code.OST_SWAP_ARR);//마이페이지 교환 조회시 주문상태값 리스트
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//마이페이지 반품 조회시 주문상태값 리스트
		commandMap.put("OST_REFUND_ARR", Code.OST_REFUND_ARR);//마이페이지 반품 조회시 주문상태값 리스트
    }
    
    /**
     * <pre>
     * 1. MethodName : selectMyShoppingListCount
     * 2. ClassName  : MyShoppingServiceImpl.java
     * 3. Comment    : 프론트 > 마이페이지 > 나의 쇼핑내역 목록 갯수 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMyShoppingListCount(Map<String, Object> commandMap) throws Exception
    {
    	//주문상태 
    	this.setOrderState(commandMap);
        return defaultDAO.selectCount("PcMyShopping.selectMyShoppingListCount",commandMap);
    }

    /**
     * <pre>
     * 1. MethodName	: selectMyShoppingList
     * 2. ClassName		: MyShoppingServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 8. 오전 11:55:04
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyShoppingList(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
        return defaultDAO.selectList("PcMyShopping.selectMyShoppingList",commandMap);
    }

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyShoppingPrwList(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
        return defaultDAO.selectList("PcMyShopping.selectMyShoppingPrwList",commandMap);
    }    
 
    @SuppressWarnings("unchecked")
    public int insertLike(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.insert("PcMyShopping.insertLike",commandMap);
    }    

    @SuppressWarnings("unchecked")
    public int insertReInputAjax(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.insert("PcMyShopping.insertReInputAjax",commandMap);
    }    
    
    @SuppressWarnings("unchecked")
    public int myPageReInputDelAjax(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.insert("PcMyShopping.myPageReInputDelAjax",commandMap);
    }    
    
    /**
    * <pre>
    * 1. MethodName : selectMyReceiptIssueListCount
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 증빙서류발급 목록 갯수 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMyReceiptIssueListCount(Map<String, Object> commandMap) throws Exception
    {
    	//주문상태 
    	this.setOrderState(commandMap);
        return defaultDAO.selectCount("PcMyShopping.selectMyReceiptIssueListCount",commandMap);
    }

    /**
    * <pre>
    * 1. MethodName : selectMyReceiptIssueList
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 증빙서류발급 목록
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMyReceiptIssueList(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
        return defaultDAO.selectList("PcMyShopping.selectMyReceiptIssueList",commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderProductList
     * 2. ClassName		: MyShoppingServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 > 주문/배송 상세 > 주문상품 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 2:07:58
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderProductList(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
		return defaultDAO.selectList("PcMyShopping.selectOrderProductList",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderDeliveryInfo
     * 2. ClassName		: MyShoppingServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 > 주문/배송 상세 > 배송정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 2:54:37
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderDeliveryInfo(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.select("PcMyShopping.selectOrderDeliveryInfo",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderPayInfo
     * 2. ClassName		: MyShoppingServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 > 주문/배송 상세 > 할인/결제정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 5:18:49
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderPayInfo(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
		return defaultDAO.select("PcMyShopping.selectOrderPayInfo",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStateCnt
     * 2. ClassName		: MyShoppingServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 목록 > 주문/배송 상세 > 주문상태정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 5:18:49
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderStateCnt(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
		return defaultDAO.select("PcMyShopping.selectOrderStateCnt",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: updateOrderBack
     * 2. ClassName		: MyShoppingServiceImpl.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 상세 > 주문취소/반품요청 > 주문반품요청
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 15. 오후 1:41:57
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> updateOrderBack (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		String resultMsg = "고객센터에 문의해 주십시오.";
        
        logger.info("=====================================================================================");
        logger.info("Message : 주문반품요청처리 Start.");
        logger.info("주문번호 : "+StringUtil.getString(commandMap.get("ORD_MST_CD")));
        logger.info("=====================================================================================");

		// 상태코드값 지정
		commandMap.put("OST_ORDER", Code.OST_ORDER);
		commandMap.put("OST_PAY_READY", Code.OST_PAY_READY);
		commandMap.put("OST_PAY", Code.OST_PAY);
		commandMap.put("OST_CANCEL", Code.OST_CANCEL);
		commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
		commandMap.put("OST_SEND_READY", Code.OST_SEND_READY);
		commandMap.put("OST_SEND", Code.OST_SEND);
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);
		commandMap.put("OST_BACK", Code.OST_BACK);
		commandMap.put("OST_BACK_END", Code.OST_BACK_END);
		commandMap.put("OST_SWAP", Code.OST_SWAP);
		commandMap.put("OST_SWAP_READY", Code.OST_SWAP_READY);
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
		commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
		
		/*신규 주문상태 추가(2015.07.01)*/
	    commandMap.put("OST_SWAP_COLLECT_CALL", Code.OST_SWAP_COLLECT_CALL);
	    commandMap.put("OST_SWAP_COLLECT_END", Code.OST_SWAP_COLLECT_END);
	    //commandMap.put("OST_SWAP_COLLECT_DENY", Code.OST_SWAP_COLLECT_DENY);
	    commandMap.put("OST_BACK_COLLECT_CALL", Code.OST_BACK_COLLECT_CALL);
	    commandMap.put("OST_BACK_COLLECT_END", Code.OST_BACK_COLLECT_END);
	    //commandMap.put("OST_BACK_COLLECT_DENY", Code.OST_BACK_COLLECT_DENY);
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);
		commandMap.put("OST_SWAP_TARGET_COLLECT_END", Code.OST_SWAP_TARGET_COLLECT_END);
		//commandMap.put("OST_SWAP_ORDER", Code.OST_SWAP_ORDER);

		// 주문 정보
        Map<String,Object> orderInfo = defaultDAO.select("PcMyShopping.selectOrderInfo",commandMap);
        //현재 주문상태 확인
        Map<String, Object> cState = defaultDAO.select("PcMyShopping.selectOrderStateCnt",commandMap);
        
		if (orderInfo != null && cState != null)
		{
    		// 상태값 정보
        	int totCnt       = StringUtil.getInt(cState.get("TOTAL_CNT"));
        	int payReadyCnt  = StringUtil.getInt(cState.get("PAY_READY_CNT"));
        	int payCnt       = StringUtil.getInt(cState.get("PAY_CNT"));
        	int cancelCnt     = StringUtil.getInt(cState.get("CANCEL_CNT"));
        	int cancelEndCnt  = StringUtil.getInt(cState.get("CANCEL_END_CNT"));
        	int sendReadyCnt = StringUtil.getInt(cState.get("SEND_READY_CNT"));
        	int sendCnt      = StringUtil.getInt(cState.get("SEND_CNT"));
        	int sendEndCnt   = StringUtil.getInt(cState.get("SEND_END_CNT"));  // 배송완료갯수
        	int backCnt      = StringUtil.getInt(cState.get("BACK_CNT"));
        	int backEndCnt   = StringUtil.getInt(cState.get("BACK_END_CNT"));
        	int swapCnt      = StringUtil.getInt(cState.get("SWAP_CNT"));
        	int swapReadyCnt = StringUtil.getInt(cState.get("SWAP_READY_CNT"));
        	int swapEndCnt   = StringUtil.getInt(cState.get("SWAP_END_CNT"));	//교환완료 갯수
        	int swapCancelCnt= StringUtil.getInt(cState.get("SWAP_CANCEL_CNT")); // 교환취소갯수
        	
        	logger.info("=====================================================================================");
            logger.info("Message : 주문 상태변경(배송완료,구매확정 -> 반품접수)");
            logger.info("=====================================================================================");

            //부분 반품 해당 상품 리스트. 없는 경우 전체 반품.
            String[] ordPrdIdxs = (String[]) commandMap.get("ordPrdIdxs");
            if(ordPrdIdxs != null && ordPrdIdxs.length > 0){
            	commandMap.put("ORD_PRD_WHOLE_BACK_YN", "N");//전체 반품 여부 N
            }else{
            	commandMap.put("ORD_PRD_WHOLE_BACK_YN", "Y");//전체 반품 여부 Y
            }
            
            List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
        	for(Map<String, Object> pMap:pList)
        	{
        		// 배송완료, 구매확정 건만 반품접수
        		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_END))
        		{
            		//상태변경
            		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
            		result += defaultDAO.update("Order.updateOrderState", commandMap);
            		
            		//변경이력 등록
                	defaultDAO.insert("PcMyShopping.insertOrderHistory",commandMap);
        		}
        	}
        	
        	if(result > 0){
        		// 반품 접수 메일 발송 
        		//메일 발송용 맵
        		HashMap<String,Object> mailMap = new HashMap<String,Object>();
        		
	    		mailMap.put("MAIL_CODE", "MAIL-ORDER-BACK");
    			mailMap.put("MEMBER_NAME", FormatUtil.markingName(StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"))));//이름
    			mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderInfo.get("ORD_MST_MAIL")));//메일주소
    			
        		//this.sendMail.send(mailMap);
        	}
		}
		else
		{
			resultMsg = "해당 주문정보가 존재하지 않습니다.";
            logger.info("=====================================================================================");
            logger.info("Message : 원거래 주문정보 검색시 오류.");
            logger.info("=====================================================================================");
		}

        logger.info("=====================================================================================");
        logger.info("Message : 주문반품요청처리 End.");
        logger.info("=====================================================================================");

        resultMap.put("result", result);
        resultMap.put("resultMsg", resultMsg);
        
        return resultMap;
    }

    /**
    * <pre>
    * 1. MethodName : selectOrderCount
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문/배송 현황 > 자기 주문인지 체크
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOrderCount (Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectCount("PcMyShopping.selectOrderCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectPickupBcncInfo
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 픽업주문인 경우 픽업매장 정보 가져오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectPickupBcncInfo(Map<String,Object> commandMap) throws Exception {
		Map<String, Object> shopInfo = new HashMap<String, Object>();
		
		//매장 정보 가져오기
		shopInfo = this.defaultDAO.select("PcCart.selectBcncInfo", commandMap);
		
		return shopInfo;
	}
	
    /**
    * <pre>
    * 1. MethodName : selectRequestedGiftList
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 사은품 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRequestedGiftList(Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcMyShopping.selectRequestedGiftList", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : selectOrderSubPrdList
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 주문상품 서브옵션 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderSubPrdList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("PcMyShopping.selectOrderSubPrdList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateDeliveryInfo
    * 2. ClassName  : MyShoppingServiceImpl.java
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
    public int updateDeliveryInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	User user = SessionsUser.getSessionUser(request);
        commandMap.put("ORD_DLV_UPD_ID",	user.getMEM_MST_MEM_ID());
		commandMap.put("ORD_DLV_UPD_IP", request.getRemoteAddr());        
    	return defaultDAO.update("PcMyShopping.updateDeliveryInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateProductOptionCnt
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 옵션 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> updateProductOptionCnt(Map<String, Object> commandMap) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		// 겟잇나우 여부 체크. 겟잇나우 상품은 옵션/수량 변경 불가능
		Map<String,Object> orderInfo = defaultDAO.select("Order.selectOrderInfo", commandMap);
		
		if(orderInfo != null){
			int ORD_MST_DLV_GBN = StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));
			if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
				result = -1;
				resultMsg = "겟잇나우 주문상품 및 구매수량 변경은\n매장별 재고확인을 위해 상품상세에서만 가능합니다.";
			}else{
				//주문 상품 정보
		    	Map<String, Object> ordPrdInfo = defaultDAO.select("Order.selectOrderProductInfo", commandMap);
		    	
		    	// 주문상태 체크(입금대기/결제완료 상태만 변경 가능)
		    	int ORD_PRD_ORD_STATE = StringUtil.getInt(ordPrdInfo.get("ORD_PRD_ORD_STATE"));//주문상태값
		    	if(ORD_PRD_ORD_STATE == Code.OST_PAY_READY || ORD_PRD_ORD_STATE == Code.OST_PAY){
		    		// 필수/선택 옵션 여부
			    	String ORD_PRD_SLT_YN = StringUtil.getString(ordPrdInfo.get("ORD_PRD_SLT_YN"));
			    	// 기존 상품 옵션 idx
			    	int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(ordPrdInfo.get("ORD_PRD_OPT_DTL_IDX"));
			    	if(ORD_PRD_OPT_DTL_IDX > 0){//마스터 상품이 아닌 경우(필수/선택 옵션 아닌 상품)에만 옵션 추가금 체크한다.
			    		// 0. 금액(추가금) 체크
				    	int OPT_DTL_ADD_PRC = StringUtil.getInt(ordPrdInfo.get("OPT_DTL_ADD_PRC"));//기존 상품 추가금
				    	int TO_CHANGE_OPT_DTL_ADD_PRC = defaultDAO.selectCount("Order.selectChangeOptionAddPrc", commandMap);//변경할 상품 추가금
				    	
				    	if(OPT_DTL_ADD_PRC != TO_CHANGE_OPT_DTL_ADD_PRC){
				    		result = -3;
				    		resultMsg = "추가금이 일치하지 않아 변경이 불가능합니다.";
				    	}
			    	}
			    	
			    	if(result == 0){
			    		// 1. 동일 옵션 체크
				    	commandMap.put("ORD_MST_CD", ordPrdInfo.get("ORD_ORD_MST_CD"));
				    	commandMap.put("ORD_PRD_IDX", ordPrdInfo.get("ORD_PRD_IDX"));
				    	
				    	//선택 옵션인 경우 해당 마스터상품의 서브옵션들하고 겹치지 않아야 한다. 다른 마스터 상품 서브 옵션은 상관 없음
				    	commandMap.put("ORD_PRD_SLT_YN", ORD_PRD_SLT_YN);
				    	commandMap.put("ORD_PRD_UP_IDX", StringUtil.getString(ordPrdInfo.get("ORD_PRD_UP_IDX"),""));
				    	int dupCnt = defaultDAO.selectCount("Order.selectOptionDupCnt", commandMap);
				    	
				    	if(dupCnt > 0){
				    		//동일 옵션 있는 경우
				    		result = -1;
				    		resultMsg = "동일 옵션이 있으므로 변경이 불가능합니다.";
				    	}
			    	}
			    	
			    	if(result == 0){
			    		// 2. 재고 체크
				    	commandMap.put("ORD_PRD_ORD_CNT", ordPrdInfo.get("ORD_PRD_ORD_CNT"));
				    	int ordAvailableCnt = this.defaultDAO.selectCount("Order.selectOptionAvailableCnt", commandMap);
				    	
				    	if(ordAvailableCnt < 0){
				    		//재고 부족한 경우
				    		result = -2;
				    		resultMsg = "재고가 부족합니다.";
				    	}
			    	}
			    	
			    	if(result == 0){
			    		//기존 옵션 재고 원복
				    	defaultDAO.update("Order.updatePrdOptStock", ordPrdInfo);
				    	
				    	//변경 옵션 재고 차감
				    	commandMap.put("ORD_PRD_ORD_CNT", StringUtil.getInt(ordPrdInfo.get("ORD_PRD_ORD_CNT"))*-1);
				    	defaultDAO.update("Order.updatePrdOptStock", commandMap);
				    	
				    	//옵션 변경
				    	result = defaultDAO.update("Order.updateProductOption", commandMap);
				    	if(result > 0){
				    		resultMsg = "변경되었습니다.";
				    	}
			    	}
		    	}else{
		    		result = -4;
		    		resultMsg = "입금대기/결제완료 상태에서만 변경 가능합니다.";
		    	}
			}
		}
		
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}
    
    /**
    * <pre>
    * 1. MethodName : selectOrderCancelInfo
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 주문 취소 팝업에서 필요한 주문 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderCancelInfo(Map<String,Object> commandMap) throws Exception {
    	this.setOrderState(commandMap);
		return this.defaultDAO.select("PcMyShopping.selectOrderCancelInfo", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : selectOrdPrdInfo
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 주문상품 주문상태 변경시 검증에 필요한 주문상품정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrdPrdInfo(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.select("PcMyShopping.selectOrdPrdInfo",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertTaxIvc
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 세금계산서 신청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertTaxIvc (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.insert("PcMyShopping.insertTaxIvc",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrdPrdAllOptionList
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 교환/반품 접수시 필요한 필수/선택 옵션 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrdPrdAllOptionList(Map<String, Object> commandMap) throws Exception{
    	this.setOrderState(commandMap);
    	return this.defaultDAO.selectList("PcMyShopping.selectOrdPrdAllOptionList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertChangeOrderProduct
    * 2. ClassName  : MyShoppingServiceImpl.java
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
    @SuppressWarnings("unchecked")
	public Map<String, Object> insertChangeOrderProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	int result = 0;
    	String resultMsg = "에러가 발생했습니다.";
    	
    	commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_USER);
        commandMap.put("REG_ID", "".equals(StringUtil.getString(SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID(),"")) ? "_GUEST_" : SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        commandMap.put("REG_IP", request.getRemoteAddr());
    	
        List<Map<String,Object>> prdList = (List<Map<String, Object>>) commandMap.get("prdList");
        
        for(Map<String,Object> prd : prdList){
        	int PRD_ORD_PRD_ORD_STATE =  StringUtil.getInt(prd.get("ORD_PRD_ORD_STATE"));
        	String ORD_MST_PRE_CD =  StringUtil.getString(prd.get("ORD_MST_PRE_CD"));
        	
        	if("".equals(ORD_MST_PRE_CD)){
        		if(Code.OST_SEND_END == PRD_ORD_PRD_ORD_STATE){//배송완료 상품만 교환접수
            		// 1. 기존 상품 주문상태 변경 (교환접수)
                	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP);	//주문상태 (교환접수)    	
                	commandMap.put("ORD_PRD_IDX", prd.get("ORD_PRD_IDX")); //기존상품 idx
                	this.defaultDAO.insert("Order.updateOrderState", commandMap);
                	
                	//변경이력 등록
                	this.defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	
                	// 2. ORD_PRD 등록(교환 상품)
                	commandMap.put("ORD_PRD_ORG_IDX", prd.get("ORD_PRD_IDX"));
                	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_READY);	//주문상태 (교환대기)    	
                	this.defaultDAO.insert("Order.insertChangeOrderProduct", commandMap);
                	
                	// 교환 상품 ORD_PRD 인덱스
                	String NEW_ORD_PRD_IDX = StringUtil.getString(commandMap.get("NEW_ORD_PRD_IDX"),"");
                	logger.info("================교환상품 ORD_PRD_IDX========================="+NEW_ORD_PRD_IDX);
                	
                	if(!("").equals(NEW_ORD_PRD_IDX)){
                		commandMap.put("ORD_PRD_IDX", NEW_ORD_PRD_IDX);//새로운 주문 상품 INDEX를 ORD_PRD_IDX로 담는다.
                		
                		//2. ORD_PRD_HISTORY 등록
                    	result += this.defaultDAO.insert("Order.insertOrderHistory", commandMap);
                	}else{
                		logger.info("========================================================================================================");
                		logger.info("Message : T_ORD_PRD INSERT 실패)");
                		logger.info("========================================================================================================");
                	}
            	}
        	}
        	
        }
        
        if(result > 0){
    		resultMsg = "등록되었습니다.";
    		//메일 발송용 맵
    		/*HashMap<String,Object> mailMap = new HashMap<String,Object>();
    		
    		mailMap.put("MAIL_CODE", "MAIL-ORDER-SWAP");
			mailMap.put("MEMBER_NAME", FormatUtil.markingName(StringUtil.getString(commandMap.get("ORD_MST_ORD_NM"))));//이름
			mailMap.put("MEMBER_EMAIL", StringUtil.getString(commandMap.get("ORD_MST_MAIL")));//메일주소
			mailMap.put("ORDER_ID", StringUtil.getString(commandMap.get("ORD_MST_ORD_ID")));//아이디
			
    		this.sendMail.send(mailMap);*/
    	}else{
    		logger.info("========================================================================================================");
			logger.info("Message : ORD_PRD_HISTORY INSERT 실패");
			logger.info("========================================================================================================");
    	}
        
        resultMap.put("result", result);
        resultMap.put("resultMsg", resultMsg);

        return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrdCancelSwapBackInfo
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 주문상세 취소/교환/반품 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrdCancelSwapBackInfo(Map<String, Object> commandMap) throws Exception{
    	//주문상태 
    	this.setOrderState(commandMap);
    	return this.defaultDAO.selectList("PcMyShopping.selectOrdCancelSwapBackInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectRepayYn
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 재주문 가능여부 0이상이면 가능
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectRepayYn (Map<String, Object> commandMap) throws Exception{
    	//주문상태 
    	this.setOrderState(commandMap);
    	return this.defaultDAO.selectCount("PcMyShopping.selectRepayYn", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMemberInfo
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 회원정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.select("PcMyShopping.selectMemberInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectGetItNowOrderList
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 겟잇나우 주문 리스트(앱)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGetItNowOrderList (Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.selectList("PcMyShopping.selectGetItNowOrderList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateOrderCancelRequest
    * 2. ClassName  : MyShoppingServiceImpl.java
    * 3. Comment    : 주문 취소 요청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateOrderCancelRequest (Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.update("PcMyShopping.updateOrderCancelRequest", commandMap);
    }
    
    public List<Map<String, Object>> selectMyOOTDShoppingList (Map<String, Object> commandMap){
        return this.defaultDAO.selectList("PcOOTD.selectMyOOTDShoppingList", commandMap);
    }
}
