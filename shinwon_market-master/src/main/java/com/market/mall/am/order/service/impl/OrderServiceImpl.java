package com.market.mall.am.order.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.BooleanUtils;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.ifcomm.pg.Payment;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Code;
import com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service.OrderErpApiService;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.event.service.EventMainService;
import com.market.mall.pc.mypage.service.MyShoppingService;

import egovframework.rte.fdl.property.EgovPropertyService;
import org.json.JSONObject;
import org.json.XML;
/**
 * 
 * @PackageName: com.market.mall.am.order.service.impl
 * @FileName : OrderServiceImpl.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 : 관리자 > 주문관리 > 주문관리를 처리하는 Service Implement Class
 * @author LJH
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="cartService") private CartService cartService;
	@Resource(name = "pcCommonService")	private CommonService pcCommonService;
    @Resource private Sms sms;
    
    @Resource Payment payment;
	
	@Resource (name="paymentService") 
	PaymentService paymentService;
	
	@Resource (name="orderErrorService")
	OrderErrorService orderErrorService;
	
	@Resource(name="pcEventMainService")
    private EventMainService pcEventMainService;
	
	//메일 발송시 필요한 서비스 시작
	@Resource
	protected Mail mail;	
	
	@Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
	
	@Resource(name = "velocityEngine") 
	protected VelocityEngine velocityEngine;
	//메일 발송시 필요한 서비스 끝
	
	@Resource(name="orderErpApiService")
    private OrderErpApiService orderErpApiService;
	
    //주문 상태값 셋팅
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
//	    commandMap.put("OST_BACK_COLLECT_CALL", Code.OST_BACK_COLLECT_CALL);
	    commandMap.put("OST_BACK_COLLECT_END", Code.OST_BACK_COLLECT_END);
	    commandMap.put("OST_BACK_CANCEL", Code.OST_BACK_CANCEL);
	    commandMap.put("OST_BACK_CLIENT_CANCEL", Code.OST_BACK_CANCEL);
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);
		commandMap.put("OST_SWAP_TARGET_COLLECT_END", Code.OST_SWAP_TARGET_COLLECT_END);
		commandMap.put("OST_BACK_APPROVED", Code.OST_BACK_APPROVED);
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//개별 반품처리 위한 반품관련 주문상태값 리스트
		commandMap.put("OST_SWAP_IGNORE_ARR", Code.OST_SWAP_IGNORE_ARR);//계산시에는 없는 상품으로 쳐야할 주문상태값 리스트
		
    }
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderCount
	 * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 목록 갯수
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 21. 오전 11:21:20
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectOrderCount(Map<String, Object> commandMap) throws Exception
    {
    	//주문상태 
    	this.setOrderState(commandMap);
    	
    	String searchCashbagUsed = StringUtil.getString(commandMap.get("searchCashbagUsed"));//캐쉬백 사용 여부
    	String searchMileageUsed = StringUtil.getString(commandMap.get("searchMileageUsed"));//마일리지 사용 여부
    	
    	if("Y".equals(searchCashbagUsed) && "Y".equals(searchMileageUsed)){
    		commandMap.put("searchCashBagMileageUsed", "1");//캐쉬백/마일리지 사용
    	}else if("Y".equals(searchCashbagUsed)){
    		commandMap.put("searchCashBagMileageUsed", "2");//캐쉬백 사용
    	}else if("Y".equals(searchMileageUsed)){
    		commandMap.put("searchCashBagMileageUsed", "3");//마일리지 사용
    	}
    	
    	String searchLngDiv24 = StringUtil.getString(commandMap.get("searchLngDiv24"));//장기할부 24개월
    	String searchLngDiv36 = StringUtil.getString(commandMap.get("searchLngDiv36"));//장기할부 36개월
    	
    	if("Y".equals(searchLngDiv24) && "Y".equals(searchLngDiv36)){
    		commandMap.put("searchLngDiv", "1");//24/36개월 
    	}else if("Y".equals(searchLngDiv24)){
    		commandMap.put("searchLngDiv", "2");//24개월
    	}else if("Y".equals(searchLngDiv36)){
    		commandMap.put("searchLngDiv", "3");//36개월
    	}
    	
    	return defaultDAO.selectCount("Order.selectOrderCount",commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderList
     * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:22:00
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderList(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);
    	
    	String searchCashbagUsed = StringUtil.getString(commandMap.get("searchCashbagUsed"));//캐쉬백 사용 여부
    	String searchMileageUsed = StringUtil.getString(commandMap.get("searchMileageUsed"));//마일리지 사용 여부
    	
    	if("Y".equals(searchCashbagUsed) && "Y".equals(searchMileageUsed)){
    		commandMap.put("searchCashBagMileageUsed", "1");//캐쉬백/마일리지 사용
    	}else if("Y".equals(searchCashbagUsed)){
    		commandMap.put("searchCashBagMileageUsed", "2");//캐쉬백 사용
    	}else if("Y".equals(searchMileageUsed)){
    		commandMap.put("searchCashBagMileageUsed", "3");//마일리지 사용
    	}
    	
    	String searchLngDiv24 = StringUtil.getString(commandMap.get("searchLngDiv24"));//장기할부 24개월
    	String searchLngDiv36 = StringUtil.getString(commandMap.get("searchLngDiv36"));//장기할부 36개월
    	
    	if("Y".equals(searchLngDiv24) && "Y".equals(searchLngDiv36)){
    		commandMap.put("searchLngDiv", "1");//24/36개월 
    	}else if("Y".equals(searchLngDiv24)){
    		commandMap.put("searchLngDiv", "2");//24개월
    	}else if("Y".equals(searchLngDiv36)){
    		commandMap.put("searchLngDiv", "3");//36개월
    	}
    	
    	List<Map<String, Object>> list = defaultDAO.selectList("Order.selectOrderList",commandMap);
    	// 전체 주문 관리 메뉴의 경우 재고 조회 로직 추가 (2020.06.19)
    	if(BooleanUtils.isTrue((Boolean) commandMap.get("GET_ERP_STOCK"))) {
    		getErpStockInfo(list, BooleanUtils.isTrue((Boolean) commandMap.get("GET_ERP_STOCK_ALL_SIZE")));
    	}
    	
    	// 동일 주문 내용을 합쳐서 보여줄지 여부 (2020.06.26)
    	if(BooleanUtils.isTrue((Boolean) commandMap.get("SAME_IDX_SUM"))) {
    		logger.info("===================== 동일 주문 상품 병합 =====================");
    		String[] sum_key = {"ORD_PRD_ORD_CNT", "ORD_PRD_ORD_PRC", "ORD_PRD_DC_PIT", "ORD_PRD_DC_TOT_PIT" 
    				,"ORD_PRD_DC_SW_PIT", "ORD_PRD_DC_PRM", "ORD_PRD_SAV_OCB", "ORD_PRD_OPT_ADD_PRC" 
    				,"ORD_PRD_DLV_CAG", "ORD_PRD_DLV_ADD_CAG", "ORD_PRD_OPT_ADD_PRC"};
    		
    		List<Map<String, Object>> new_list = new ArrayList<Map<String,Object>>();
    		Map<String, Object> ordPrdCountMap = new HashMap<String, Object>();
    		
    		for(Map<String, Object> data : list) {
    			String ORD_MST_CD = StringUtil.getString(data.get("ORD_MST_CD"));
    			String tmpIdx = ORD_MST_CD + data.get("ORD_PRD_OPT_DTL_IDX") + data.get("ORD_PRD_COLOR") + data.get("ORD_PRD_SIZE") + data.get("ORD_PRD_ORD_STATE");
    			if(StringUtil.isEmpty(StringUtil.getString(ordPrdCountMap.get(ORD_MST_CD)))) {
    				ordPrdCountMap.put(ORD_MST_CD, data.get("ORD_PRD_CNT"));
    				data.put("ADM_MST_SUB_IDX", commandMap.get("ADM_MST_SUB_IDX"));
    				data.putAll(defaultDAO.select("Order.selectOrderUsedPoints", data));
    			}
    			
    			boolean duplicated = false;
    			
    			for(Map<String, Object> new_data : new_list) {
    				if(StringUtil.getString(new_data.get("tmpIdx"), "").equals(tmpIdx)) {
    					for(String key : sum_key) {
    						int sum_value = StringUtil.getInt(data.get(key));
    						new_data.put(key, StringUtil.getInt(new_data.get(key)) + sum_value);
    					}
    					ordPrdCountMap.put(ORD_MST_CD, StringUtil.getInt(ordPrdCountMap.get(ORD_MST_CD)) - 1);
    					duplicated = true;
    					break;
    				}
    			}
    			
    			if(!duplicated) {
    				data.put("tmpIdx", tmpIdx);
    				new_list.add(data);
    			}
    		}
    		
    		for(Map<String, Object> data : new_list) {
    			data.put("ORD_PRD_CNT", ordPrdCountMap.get(StringUtil.getString(data.get("ORD_MST_CD"))));
    		}
    		
    		return new_list;
    	}
    	
    	return list;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderView
     * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문 상세 정보
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:22:46
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderView(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	//주문상태 
    	this.setOrderState(commandMap);
    	
    	// 주문 정보
    	Map<String, Object> orderInfo = defaultDAO.select("Order.selectOrderInfo",commandMap);
    	
    	if(orderInfo != null){
    		// 주문상품 리스트
    		List<Map<String, Object>> orderProductList = defaultDAO.selectList("Order.selectOrderProductList",commandMap);
    		
    		// === 주문상태에 따른 관리자의 메뉴 버튼 생성을 위해 추가  / Start 2020.06.15 ===
    		List<String> order_back_y_list = new ArrayList<String>();
    		List<String> order_cancel_y_list = new ArrayList<String>();
    		List<String> order_swap_y_list = new ArrayList<String>();
    		
    		for(Map<String, Object> map : orderProductList) {
    			String idx = StringUtil.getString(map.get("ORD_PRD_IDX"));
    			int status = StringUtil.getInt(map.get("ORD_PRD_ORD_STATE"));
    			
    			for(int code : Code.OST_BACK_POSSIBLE_ARR) {
    				if(status == code) {
    					order_back_y_list.add(idx);
    					break;
    				}
    			}
    			for(int code : Code.OST_CANCEL_POSSIBLE_ARR) {
    				if(status == code) {
    					order_cancel_y_list.add(idx);
    					break;
    				}
    			}
    			for(int code : Code.OST_SWAP_POSSIBLE_ARR) {
    				if(status == code) {
    					order_swap_y_list.add(idx);
    					break;
    				}
    			}
    		}
    		
    		resultMap.put("order_back_y_list", order_back_y_list.stream().collect(Collectors.joining(",")));
    		resultMap.put("order_cancel_y_list", order_cancel_y_list.stream().collect(Collectors.joining(",")));
    		resultMap.put("order_swap_y_list", order_swap_y_list.stream().collect(Collectors.joining(",")));
    		// === End 2020.06.15 ===
    		
    		// === 교환 신청시 재고 확인을 위해 추가 START 2020.06.29 === 
    		if(BooleanUtils.isTrue((Boolean) commandMap.get("GET_ERP_STOCK"))) {
    			getErpStockInfo(orderProductList, BooleanUtils.isTrue((Boolean) commandMap.get("GET_ERP_STOCK_ALL_SIZE")));
        	}
    		// === END 2020.06.29 === 
    		
    		// 주문결제 정보
    		Map<String, Object> orderPayInfo = defaultDAO.select("Order.selectOrderPayInfo",commandMap);
    		// 주문배송 정보
    		Map<String, Object> orderDeliveryInfo = defaultDAO.select("Order.selectDeliveryInfo",commandMap);
    		// 주문상태 정보
    		Map<String, Object> orderState = defaultDAO.select("Order.selectOrderStateCnt",commandMap);
    		// 추가배송비 정보
    		int ORD_DLV_ADD_CHARGE = defaultDAO.selectCount("Order.selectOrderAddDlvCharge",commandMap);
    		// 사은품정보
    		List<Map<String, Object>> orderGiftList = defaultDAO.selectList("Order.selectOrderGiftList",commandMap);
    		// 캐쉬백 이력
    		orderInfo.put("trStatus", "U");//사용 이력
    		Map<String, Object> cashbagUseInfo = this.paymentService.selectOrderCashbagInfo(orderInfo);
    		
    		// 사용 쿠폰 리스트
    		if(StringUtil.getInt(orderInfo.get("ORD_MST_DC_CPN")) > 0){
    			resultMap.put("orderCouponList", defaultDAO.selectList("Order.selectOrderCouponList",commandMap));
    		}
    		
    		// 프로모션 쿠폰 정보 (2020.06.25)
        	resultMap.put("promotionCouponInfo", defaultDAO.select("Order.selectOrderPromotionCoupon", commandMap));
    		
    		// 무료교환 쿠폰 리스트 (2020.07.01)
        	if(BooleanUtils.isTrue((Boolean) commandMap.get("GET_CHANGE_CPN"))) {
        		resultMap.put("changeCouponList", selectChangeCouponList(commandMap, "B")); // 무료반품 쿠폰 코드
        	}
        	// 무료반품 쿠폰 리스트 (2020.07.01)
        	if(BooleanUtils.isTrue((Boolean) commandMap.get("GET_BACK_CPN"))) {
        		resultMap.put("changeCouponList", selectChangeCouponList(commandMap, "C")); // 무료반품 쿠폰 코드
        	}
    		
    		// 사용 포인트 정보
    		resultMap.put("pointInfo", defaultDAO.select("Order.selectOrderUsedPoints",commandMap));
    		
       	 	// 주문정보
        	//Map<String, Object> postInfo = defaultDAO.select("Order.selectDeliveryInfo", commandMap);
        	//resultMap.put("postInfo", postInfo);
        	
        	// 택배사목록
        	List<Map<String, Object>> dlvCpnList = defaultDAO.selectList("Order.selectDlvCpnList", commandMap);
        	resultMap.put("dlvCpnList", dlvCpnList);
    		
    		// ERP 취소요청 여부 체크.. 배송전 취소요청 한 경우, 배송준비중 상태에서 주문취소 버튼 감춘다.
    		int orderCancelRCnt = 0;
    		//배송전 취소요청했는지 여부 0보다 큰경우 Y
    		resultMap.put("orderCancelRCnt", orderCancelRCnt);
    		
    		// ERP 전표 생성 여부 체크.. 전표 생성된 경우 상품에 교환 접수 버튼 만들어준다.
    		int orderConfirmCancelableCnt = 0;
    		// ERP 전표 생성됐는지 체크(0 이상이면 전표 없음 0 은 전표 있음)
    		resultMap.put("orderConfirmCancelableCnt", orderConfirmCancelableCnt);
    		
    		resultMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
    		resultMap.put("orderInfo", orderInfo);
        	resultMap.put("orderProductList", orderProductList);
        	resultMap.put("orderPayInfo", orderPayInfo);
        	resultMap.put("orderDeliveryInfo", orderDeliveryInfo);
        	resultMap.put("orderState", orderState);
        	resultMap.put("orderGiftList", orderGiftList);
        	resultMap.put("cashbagUseInfo", cashbagUseInfo);
        	resultMap.put("ORD_DLV_ADD_CHARGE", ORD_DLV_ADD_CHARGE);
    	}

    	return resultMap;
    }
    
    @SuppressWarnings("unchecked")
	public void getErpStockInfo(List<Map<String, Object>> orderProductList, boolean check_all_size) {
    	
    	// ERP 중복 요청을 피하기 위해 임시로 사용
    	Map<String, Object> tmpMap = new HashMap<String, Object>();
    	
		for(Map<String, Object> data : orderProductList) {
			Map<String, Object> erpMap = new HashMap<String, Object>();
			List<Map<String, Object>> otherSizeErpMap = new ArrayList<Map<String, Object>>();
			erpMap.put("ORD_PRD_IDX", StringUtil.getString(data.get("ORD_PRD_IDX"), ""));
			try {
				erpMap = defaultDAO.select("Order.selectOrderErpStockInfo", erpMap);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 동일 상품에 대해서는 재고를 한 번만 조회하도록 수정 (2020.06.26)
			String idx = "" + erpMap.get("STYLE_NO") + erpMap.get("SEASON_YEAR") + erpMap.get("COLOR_CODE") + erpMap.get("SIZE_CODE");
			if(!tmpMap.containsKey(idx)) {
				int result = getErpStock(erpMap);
				if(result != -1) {
					data.put("PRD_STOCK", result);
					tmpMap.put(idx, result);
				}
			}else {
				data.put("PRD_STOCK", tmpMap.get(idx));
			}
			
			// check_all_size가 true 인 경우 다른 사이즈의 재고도 함께 조회함 (2020.06.29)
			if(check_all_size) {
				otherSizeErpMap = defaultDAO.selectList("Order.selectOrderOtherSizeErpStockInfo", data);
				List<Map<String, Object>> allSizeList = new ArrayList<Map<String,Object>>();
				for(Map<String, Object> data2 : otherSizeErpMap) {
					Map<String, Object> allSizeMap = new HashMap<String, Object>();
					String idx2 = "" + data2.get("STYLE_NO") + data2.get("SEASON_YEAR") + data2.get("COLOR_CODE") + data2.get("SIZE_CODE");
					int stock = 0;
					if(!tmpMap.containsKey(idx2)) {
						stock = getErpStock(data2);
						if(stock != -1) {
							allSizeMap.put("PRD_STOCK", stock);
							tmpMap.put(idx2, stock);
						}
					}else {
						stock = StringUtil.getInt(tmpMap.get(idx2));
						allSizeMap.put("PRD_STOCK", stock);
					}
					if(stock > 0) {
						allSizeMap.put("SIZE_NM", StringUtil.getString(data2.get("SIZE_CODE")));
					}else {
						allSizeMap.put("SIZE_NM", StringUtil.getString(data2.get("SIZE_CODE")) + " (품절)");
						allSizeMap.put("DISABLED", "disabled");
					}
					allSizeMap.put("CODE", StringUtil.getString(data2.get("CMN_COM_IDX")));
					
					if(StringUtil.getString(data2.get("SIZE_CODE")).equals(erpMap.get("SIZE_CODE"))) {
						allSizeMap.put("SELECTED", "selected");
					}
					allSizeList.add(allSizeMap);
				}
				data.put("ALL_STOCK", allSizeList);
			}
		}
    }
    
    public int getErpStock(Map<String, Object> erpMap) {
    	if(StringUtil.nullCheck(erpMap.get("STYLE_NO"))
				|| StringUtil.nullCheck(erpMap.get("SEASON_YEAR"))
				|| StringUtil.nullCheck(erpMap.get("COLOR_CODE"))
				|| StringUtil.nullCheck(erpMap.get("SIZE_CODE"))) {
			logger.debug("ERP요청을 위한 데이터 중 Null 값이 있습니다.");
			logger.debug("STYLE_NO : " + erpMap.get("STYLE_NO"));
			logger.debug("SEASON_YEAR : " + erpMap.get("SEASON_YEAR"));
			logger.debug("COLOR_CODE : " + erpMap.get("COLOR_CODE"));
			logger.debug("SIZE_CODE : " + erpMap.get("SIZE_CODE"));
			return -1;
		}
    	List<Map<String, Object>> resultList = ErpRequest.requestStockInfo(erpMap);
    	if(resultList.size() == 0) {
    		return -1;
    	}
    	return StringUtil.getInt(resultList.get(0).get("STOCK_QTY"), -1);
    }
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectChangeCouponList(Map<String, Object> commandMap, String changeCouponType){
    	commandMap.put("CPN_MST_DLV_GBN", changeCouponType);
    	return defaultDAO.selectList("Order.selectChangeCouponList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderSimpleView
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 주문 간략 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderSimpleView(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	//주문상태 
    	this.setOrderState(commandMap);
    	
    	// 주문 정보
    	Map<String, Object> orderInfo = defaultDAO.select("Order.selectOrderInfo",commandMap);
    	
		// 주문상품 리스트
		List<Map<String, Object>> orderProductList = defaultDAO.selectList("Order.selectOrderProductList",commandMap);
		// 주문결제 정보
		Map<String, Object> map = defaultDAO.select("Order.selectOrderPaySimpleInfo",commandMap);
		
		resultMap.put("orderInfo", orderInfo);
    	resultMap.put("orderProductList", orderProductList);
    	resultMap.put("orderPayInfo", map.get("orderPayInfo"));
    	resultMap.put("orderPointInfo", map.get("orderPointInfo"));

    	return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectDeliveryInfo
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 주문 배송지 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectDeliveryInfo(Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.select("Order.selectDeliveryInfo", commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderHistoryView
     * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문 상세 정보 > 주문상태 변경이력 리스트
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 24. 오후 5:10:19
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderHistoryView(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	// 주문상품 정보
    	Map<String, Object> orderProductInfo = defaultDAO.select("Order.selectOrderProductInfo",commandMap);
    	// 주문상태 변경 리스트
    	List<Map<String, Object>> orderHistoryList = defaultDAO.selectList("Order.selectOrderHistoryList",commandMap);
    	
    	resultMap.put("orderProductInfo", orderProductInfo);
    	resultMap.put("orderHistoryList", orderHistoryList);
    	
        return resultMap;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderStateInfo
     * 2. ClassName		: OrderServiceImpl.java
	 * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 > 주문상태 변경 팝업 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 28. 오전 9:29:41
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderStateInfo(Map<String, Object> commandMap) throws Exception
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//주문상태 
    	this.setOrderState(commandMap);
		
		// 주문정보
    	Map<String, Object> orderInfo = defaultDAO.select("Order.selectOrderInfo", commandMap);
    	 // 할인/결제정보
        Map<String, Object> orderPayInfo = defaultDAO.select("Order.selectOrderPayInfo",commandMap);
		// 주문상태 정보
    	Map<String, Object> orderState = defaultDAO.select("Order.selectOrderStateCnt",commandMap);
    	// 주문상품 정보
    	List<Map<String, Object>> orderList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);

    	resultMap.put("orderInfo", orderInfo);
    	resultMap.put("orderPayInfo", orderPayInfo);
    	resultMap.put("orderState", orderState);
    	resultMap.put("orderList", orderList);
    
    	return resultMap;
	}

    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderTotalCnt
     * 2. ClassName		: OrderServiceImpl.java
     * 3. Commnet		: 관리자 > 회원관리 > 회원현황 > 주문내역 > 주문총건수 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 29. 오후 5:33:55
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderTotalCnt(Map<String, Object> commandMap) throws Exception 
    {
    	//주문상태 
    	this.setOrderState(commandMap);

		return defaultDAO.select("Order.selectOrderTotalCnt",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: updateOrderState
     * 2. ClassName		: OrderServiceImpl.java
	 * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 > 주문상태 변경
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 28. 오전 11:55:54
     * </pre>
     *
     * @param commandMap
     * ORD_MST_CD 주문번호
     * ORD_PRD_ORD_STATE 변경할 상태값
     * @param request
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked" })
	public Map<String,Object> updateOrderState(Map<String, Object> commandMap, HttpServletRequest request) throws Exception
    {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		String resultCode = "";
		String resultMsg = "에러가 발생했습니다.";

		//주문상태 
    	this.setOrderState(commandMap);

        logger.info("=====================================================================================");
        logger.info("Message : 주문 상태변경 Start.");
        logger.info("=====================================================================================");

        // 주문정보
    	Map<String, Object> orderInfo = defaultDAO.select("Order.selectOrderInfo", commandMap);        
        // 배송정보
        Map<String, Object> orderDeliveryInfo = defaultDAO.select("Order.selectDeliveryInfo",commandMap);
        // 할인/결제정보
        Map<String, Object> orderPayInfo = defaultDAO.select("Order.selectOrderPayInfo",commandMap);
        // 현재 주문상태 확인
        Map<String, Object> cState = defaultDAO.select("Order.selectOrderStateCnt",commandMap);
        
        // 부분 반품 진행중 여부
//        String PARTIAL_BACK_ING_YN = StringUtil.getString(cState.get("PARTIAL_BACK_ING_YN"), "Y");
        String PARTIAL_BACK_ING_YN = "N";
        int count = defaultDAO.selectCount("Order.selectOrdPrdCount",commandMap);
        if(count != StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR")).split(",").length) {
        	PARTIAL_BACK_ING_YN = "Y";
        }
        logger.info("PARTIAL_BACK_ING_YN==========================="+PARTIAL_BACK_ING_YN);
        
        if(orderInfo!=null && cState!=null)
        {
        	String ORD_MST_CD = StringUtil.getString(orderInfo.get("ORD_MST_CD"));
        	
        	int ORD_MST_DLV_GBN = StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));//배송유형
        	
    		// 상태값 정보
        	int totCnt       = StringUtil.getInt(cState.get("TOTAL_CNT"));
        	String COUPON_RESTORE_POSSIBLE_YN       = StringUtil.getString(cState.get("COUPON_RESTORE_POSSIBLE_YN"));
        	COUPON_RESTORE_POSSIBLE_YN = "N"; // 사용한 쿠폰은 반품/취소시에 돌려주지 않음(2020.06.24 추가)
        	int toChangeOrderState = StringUtil.getInt(commandMap.get("ORD_PRD_ORD_STATE"));
        	
        	logger.info("toChangeOrderState==========================="+toChangeOrderState);
        	String pgPayYn = StringUtil.getString(cState.get("PG_PAY_YN"), "");
        	
        	// 재결제 주문인 경우 원주문번호
        	String ORD_MST_PRE_CD = StringUtil.getString(orderInfo.get("ORD_MST_PRE_CD"), "");
        	
        	if(totCnt > 0)
        	{
        		// 결제수단
        		int ORD_MST_PAY_TYPE = StringUtil.getInt(orderPayInfo.get("ORD_MST_PAY_TYPE"));
        		// 결제일시
        		String ORD_MST_PAY_DT = StringUtil.getString(orderPayInfo.get("ORD_MST_PAY_DT"));
        		
        		//  환불계좌 UPDATE
        		// 관리자인 경우 주문취소/반품접수/반품완료 팝업에서만 수정 가능
        		// 프론트에서는 주문취소/반품접수 팝업에서만 수정 가능
        		if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
        			String ORD_MST_RFD_CD = StringUtil.getString(commandMap.get("ORD_MST_RFD_CD"));//환불은행 코드
        			if(!"".equals(ORD_MST_RFD_CD)){//환불은행 코드 있는 경우 정보 수정한다.
        				commandMap.put("KICC_BANK_CD", Code.KICC_BANK_CD);
        				this.defaultDAO.update("Order.updateRefBankAccount", commandMap);
        			}
        		}
        		
        		// 배송준비중 -> 확정취소(결제완료)
                if (toChangeOrderState == Code.OST_PAY)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송준비중 -> 확정취소(결제완료))");
                    logger.info("=====================================================================================");

                    // TODO EDI 있는 경우 확정취소 불가
                    /*Map<String, Object> ediCntMap = new HashMap<String,Object>();
                    ediCntMap.put("ORD_MST_CD", ORD_MST_CD);
                    int ediCnt = this.defaultDAO.selectCount("Order.selectOrdEdiCnt", ediCntMap);
                    
                    if(ediCnt == 0){*/
                		List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                    	for(Map<String, Object> pMap:pList)
                    	{
                    		//상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		
                    		// 배송구분이 겟잇나우, 클린킹, 입점상품인 경우 초기화할 값이 달라진다.
            				int ORD_PRD_DLV_TYPE = StringUtil.getInt(pMap.get("ORD_PRD_DLV_TYPE"));
            				
            				if(ORD_PRD_DLV_TYPE == Code.DLV_TYPE_PARTNER 
            					|| ORD_PRD_DLV_TYPE == Code.DLV_TYPE_GET_IT_NOW 
            					|| ORD_PRD_DLV_TYPE == Code.DLV_TYPE_SERVICE)
            				{//입점배송(겟잇나우/클린킹)이었던 경우
            					commandMap.put("ORD_PRD_DLV_TYPE", ORD_PRD_DLV_TYPE);//기존 배송구분값으로 리셋
            				}else{
            					commandMap.put("ORD_PRD_DLV_TYPE", "-1");//배송구분 리셋
            				}
                    		commandMap.put("ORD_PRD_ERP_RLS_CD", "-1");//출고처 리셋
                    		commandMap.put("ORD_PRD_ERP_DLV_CD", "-1");//배송처 리셋
                    		commandMap.put("ORD_PRD_SYS_SGS", "-1");//SYS MarketPlant 택배구분 리셋
                    		
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		commandMap.put("ORD_PRD_DSC", "결제완료");
                    		
                    		// 테스트용 삭제 요망
                    		// 입금대기중인 상품들은 결제일시도 UPDATE 해줘야한다.
                    		// 입금대기중인 상품은 주문확정취소를 할 수가 없기 때문에 주석 처리
                    		/*if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY_READY))
                    		{
                    			//PAY MASTER 결제일시 변경
                    			this.defaultDAO.update("Payment.updatePayMst", commandMap);
                    			
                    			//ORDER MASTER 결제일시 변경
                    			this.defaultDAO.update("Payment.updateOrdMstPayDate", commandMap);
                    			
                    			commandMap.put("ORD_PRD_DSC", "입금대기->결제완료 수동처리(테스트)");
                    		}*/
                    		
                    		//변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                        	
                        	//ERP 전송
                        	logger.info("=====================================================================================");
                        	logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, commandMap).get("RESULT_CODE"));
                        	logger.info("=====================================================================================");
                    	}
                    /*}else{
                    	result = -1;
                		resultMsg = "EDI 연동 주문은 확정취소가 불가능합니다.";
                    }*/
                }
                
                // 배송준비중 -> 확정취소(교환상품준비중) 교환상품인 경우 결제완료 상태가 아닌 교환상품준비중 상태로 돌려놓는다.
                if (toChangeOrderState == Code.OST_SWAP_TARGET_COLLECT_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송준비중 -> 확정취소(교환상품준비중))");
                    logger.info("=====================================================================================");

                    //상품 정보 가져오기
                    Map<String, Object> ordPrdInfo = defaultDAO.select("Order.selectOrdPrdInfo",commandMap);
                    
                    // TODO EDI 있는 경우 확정취소 불가
                   /* Map<String, Object> ediCntMap = new HashMap<String,Object>();
                    ediCntMap.put("ORD_MST_CD", ORD_MST_CD);
                    ediCntMap.put("ORD_PRD_IDX", StringUtil.getString(ordPrdInfo.get("ORD_PRD_IDX")));
                    int ediCnt = this.defaultDAO.selectCount("Order.selectOrdEdiCnt", ediCntMap);
                    
                    if(ediCnt == 0){*/
                    	//확정취소 가능 여부 체크(0이상인 경우 가능)
                    	Map<String, Object> erpMap = new HashMap<String,Object>();
                    	erpMap.put("ORD_MST_CD", ORD_MST_CD);
                    	erpMap.put("ORD_PRD_SEQ", StringUtil.getString(ordPrdInfo.get("ORD_PRD_SEQ")));
                    	int erpOrderCnt = 0;
                    	
                    	if(erpOrderCnt > 0){
                    		List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                         	for(Map<String, Object> pMap:pList)
                         	{
                         		//상태변경
                         		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                         		commandMap.put("ORD_PRD_DLV_TYPE", "-1");//배송구분 리셋
                         		commandMap.put("ORD_PRD_ERP_RLS_CD", "-1");//출고처 리셋
                         		commandMap.put("ORD_PRD_ERP_DLV_CD", "-1");//배송처 리셋
                         		
                         		result += defaultDAO.update("Order.updateOrderState", commandMap);
                         		
                         		//변경이력 등록
                         		commandMap.put("ORD_PRD_DSC", "교환상품 준비중");
                             	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                         	}
                         	
                         	// ERP 임시 테이블 삭제
                        	if(result > 0){
                        		erpOrderCnt = 0;
                        		if(erpOrderCnt > 0){
                        			//erp 헤더의 교환 상품 추가 여부(R)를 null로 update

                            		result = 1;
                            	}else{
                            		result = -1;
                        			resultMsg = "ERP 디테일 삭제 실패";
                        			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                            	}
                        	}
                    	}else{
                    		result = -1;
                    		resultMsg = "ERP 전표 생성되어 확정취소가 불가능합니다.";
                    	}
                    /*}else{
                    	result = -1;
                		resultMsg = "EDI 연동 주문은 확정취소가 불가능합니다.";
                    }*/
                }
                
                // 결제완료 -> 배송준비중(기존 주문확정)
                else if (toChangeOrderState == Code.OST_SEND_READY)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(결제완료 -> 배송준비중(기존 주문확정))");
                    logger.info("=====================================================================================");
					
                    String PARTIAL_ORDER_CONFIRM_YN = StringUtil.getString(commandMap.get("PARTIAL_ORDER_CONFIRM_YN"),"N");//교환상품은 개별 주문확정이기 때문에 Y
                    logger.debug("PARTIAL_ORDER_CONFIRM_YN===================="+PARTIAL_ORDER_CONFIRM_YN);
                    String UP_ORD_PRD_SEQ = ""; //교환 상품 주문확정시 원 상품 라인번호
                    
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		String ORD_PRD_IDX =  StringUtil.getString(pMap.get("ORD_PRD_IDX"));
                		String ORD_PRD_DLV_DUE_DT = StringUtil.getString(commandMap.get("ORD_PRD_DLV_DUE_DT_"+ORD_PRD_IDX));
                		
                		// 상품교체인 경우 ORD_PRD_MST_CD, ORD_PRD_OPT_DTL_IDX, PRD_MST_ERP_CD 변경해준다.
                		String REPLACE_PRD_MST_CD = StringUtil.getString(commandMap.get("REPLACE_PRD_MST_CD_"+ORD_PRD_IDX));
                		if(!"".equals(REPLACE_PRD_MST_CD)){//교체하려는 상품이 있는 경우
                			String REPLACE_OPT_DTL_IDX = StringUtil.getString(commandMap.get("REPLACE_OPT_DTL_IDX_"+ORD_PRD_IDX),"0");
                			String REPLACE_PRD_MST_ERP_CD = StringUtil.getString(commandMap.get("REPLACE_PRD_MST_ERP_CD_"+ORD_PRD_IDX));
                			String REPLACE_PRD_MST_VDR_YN = StringUtil.getString(commandMap.get("REPLACE_PRD_MST_VDR_YN_"+ORD_PRD_IDX));//입점상품 여부
                			
                			Map<String,Object> replaceMap = new HashMap<String,Object>();
                			replaceMap.put("ORD_MST_CD", ORD_MST_CD);
                			replaceMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
                			replaceMap.put("REPLACE_PRD_MST_CD", REPLACE_PRD_MST_CD);
                			replaceMap.put("REPLACE_OPT_DTL_IDX", REPLACE_OPT_DTL_IDX);
                			replaceMap.put("REPLACE_PRD_MST_ERP_CD", REPLACE_PRD_MST_ERP_CD);
                			
                			// ERP_CD / 매입원가 가져오기
                			String ORD_PRD_BUY_PRC = "0"; //매입원가
                			// 옵션인 경우 옵션 테이블의 ERP_CD , 마스터인 경우 상품 테이블의 ERP_CD
                			if(!"0".equals(REPLACE_OPT_DTL_IDX)){//옵션인 경우
                				Map<String,Object> optionInfo = defaultDAO.select("Order.selectOptionInfo", replaceMap);
                				String optionErpCd = StringUtil.getString(optionInfo.get("OPT_DTL_ERP_CD"));
                				replaceMap.put("REPLACE_PRD_MST_ERP_CD", optionErpCd);
                				
                				if("Y".equals(REPLACE_PRD_MST_VDR_YN)){//입점상품인 경우
                					ORD_PRD_BUY_PRC = StringUtil.getString(optionInfo.get("OPT_DTL_BUY_PRC"),"0");// 매입원가
                				}else{//기간계상품인 경우
                					ORD_PRD_BUY_PRC = StringUtil.getString(optionInfo.get("ERP_BUY_PRC"),"0");//ERP 매입원가
                				}
                			}else{//옵션이 아닌 경우
                				Map<String,Object> masterPrdInfo = defaultDAO.select("Order.selectMasterPrdInfo", replaceMap);
                				
                				if("Y".equals(REPLACE_PRD_MST_VDR_YN)){//입점상품인 경우
                					ORD_PRD_BUY_PRC = StringUtil.getString(masterPrdInfo.get("PRD_MST_BUY_PRC"),"0");//T_PRD_MST 매입원가
                				}else{//기간계상품인 경우
                					ORD_PRD_BUY_PRC = StringUtil.getString(masterPrdInfo.get("ERP_BUY_PRC"),"0");//ERP 매입원가
                				}
                			}
                			replaceMap.put("REPLACE_PRD_BUY_PRC", ORD_PRD_BUY_PRC);//매입원가
                			
                			// 상품교체
                			defaultDAO.update("Order.updateOrderPrdReplace", replaceMap);
                		}
                		
                		int ORD_PRD_DLV_TYPE = StringUtil.getInt(commandMap.get("ORD_PRD_DLV_TYPE_"+ORD_PRD_IDX)); //배송구분
                		
                		if(Code.DLV_TYPE_PARCEL_SGS == ORD_PRD_DLV_TYPE){// MarketPlant 택배인 경우 MarketPlant/SYS 배송구분 추가로 들어간다.
                			commandMap.put("ORD_PRD_SYS_SGS", StringUtil.getString(commandMap.get("ORD_PRD_SYS_SGS_"+ORD_PRD_IDX)));//MarketPlant/SYS 구분
                		}else{
                			commandMap.put("ORD_PRD_SYS_SGS", "");
                		}
                		
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
                		commandMap.put("ORD_PRD_DLV_TYPE", ORD_PRD_DLV_TYPE);//배송구분
                		commandMap.put("ORD_PRD_ERP_RLS_CD", StringUtil.getString(commandMap.get("ORD_PRD_ERP_RLS_CD_"+ORD_PRD_IDX)));//출고처
                		commandMap.put("ORD_PRD_ERP_DLV_CD", StringUtil.getString(commandMap.get("ORD_PRD_ERP_DLV_CD_"+ORD_PRD_IDX)));//배송처
                		commandMap.put("ORD_PRD_DLV_DUE_DT", ORD_PRD_DLV_DUE_DT.replaceAll("-", ""));//배송예정일
                		commandMap.put("OST_EACH_CANCEL", Code.OST_CANCEL_END);
                		
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		if(ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD) {
                			commandMap.put("ORD_PRD_DSC", "배송준비중");
                		}else {
                			commandMap.put("ORD_PRD_DSC", "상품준비중");
                		}
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	//교환상품 주문확정인 경우 원상품 라인번호 필요
                    	if("Y".equals(PARTIAL_ORDER_CONFIRM_YN)){
                    		UP_ORD_PRD_SEQ = StringUtil.getString(pMap.get("UP_ORD_PRD_SEQ"));
                    	}
                	}
                	
                	if(result > 0){
                		/* ========== 이부분은 사용하지 않는 기존 솔루션 소스입니다.(2020.06.27) ==========
                		// 택배(MarketPlant)배송인 경우 EDI 전송....
                		Map<String,Object> dataMap = new HashMap<String,Object>();
                		dataMap.put("ORD_MST_CD", ORD_MST_CD);
                		if(!"N".equals(PARTIAL_ORDER_CONFIRM_YN)){
                			dataMap.put("ORD_PRD_IDX", StringUtil.getString(commandMap.get("ORD_PRD_IDX")));
                		}
                		List<Map<String, Object>> ediPrdList = defaultDAO.selectList("Order.selectOrderStateList",dataMap);
                    	for(Map<String, Object> pMap:ediPrdList)
                    	{
                    		int ORD_PRD_DLV_TYPE = StringUtil.getInt(pMap.get("ORD_PRD_DLV_TYPE")); //배송구분
                    		if(Code.DLV_TYPE_PARCEL_SGS == ORD_PRD_DLV_TYPE){
                    			Map<String,Object> ediMap = new HashMap<String,Object>();
                    			String ORD_PRD_IDX =  StringUtil.getString(pMap.get("ORD_PRD_IDX"));
                    			String ORD_PRD_SYS_SGS =  StringUtil.getString(pMap.get("ORD_PRD_SYS_SGS"));
                        		//String ORD_PRD_DLV_DUE_DT = StringUtil.getString(pMap.get("ORD_PRD_DLV_DUE_DT"));
                    			
                    			ediMap.put("ORD_MST_CD", ORD_MST_CD);
                    			ediMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
                    			ediMap.put("ORD_PRD_SYS_SGS", ORD_PRD_SYS_SGS);
                    			
                    			// EDI에 이미 데이터가 있는 경우 INSERT 하지 않는다. (2016.05.20 추가)
                    			int ediOrdPrdCnt = 0;
                    			
                    			if(ediOrdPrdCnt == 0){
                    				ediMap = null;
                        			
                        			if(!"0".equals(StringUtil.getString(ediMap.get("resultCode")))){
                        				result = -999;
                            			resultMsg = StringUtil.getString(ediMap.get("resultMsg"));
                            			logger.error(resultMsg);
                            			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                            			break;
                        			}else{
                        				result = 1;
                        			}
                    			}
                    			
                    		}
                    	}
                    	========== 2020.06.27 ========== */
                    	
                    	for(Map<String, Object> pMap:pList) {
                    		//ERP 전송(배송준비중 - 주문상태코드: R)
                    		pMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND_READY);
                    		logger.info("=====================================================================================");
                    		logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, pMap).get("RESULT_CODE"));
                    		logger.info("=====================================================================================");
                    	}
                    	
                	}else{
                		logger.error("============================= 배송준비중(상품준비중) 처리 실패 ==================================");
                		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                	}
                }
                // 취소접수 -> 취소완료
                // 취소접수 건만 취소완료 가능!
                else if (toChangeOrderState == Code.OST_CANCEL_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(취소접수 -> 취소완료)");
                    logger.info("=====================================================================================");
					
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//취소접수 건만 취소완료
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_CANCEL))
                		{
                			//주문상품 상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);

                    		// 재고 원복(겟잇나우는 안한다)
                        	// 재결제 주문인 경우 미갱신
                        	if("".equals(ORD_MST_PRE_CD) && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD){
                        		Map<String, Object> map_prd = new HashMap<String, Object>();
                    			map_prd.put("ORD_PRD_MST_CD", StringUtil.getString(pMap.get("ORD_PRD_MST_CD"),"")); //ORD_PRD_MST_CD
                    			map_prd.put("ORD_PRD_ORD_CNT", StringUtil.getString(pMap.get("ORD_PRD_ORD_CNT"),"")); //주문수량
                    			
                    			int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(pMap.get("ORD_PRD_OPT_DTL_IDX"));
            					if(ORD_PRD_OPT_DTL_IDX == 0){//옵션 없는 상품 - 마스터 재고 원복
            						this.defaultDAO.update("Order.updatePrdMstStock", pMap);
            					}else{// 옵션 있는 상품 - 옵션 재고 원복
            						this.defaultDAO.update("Order.updatePrdOptStock", pMap);
            					}
                        	}
                        	;
                        	//ERP 전송
                        	pMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                        	logger.info("=====================================================================================");
                        	logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, pMap).get("RESULT_CODE"));
                        	logger.info("=====================================================================================");
                		}
                	}
                }
                // 입금대기,결제완료,배송준비중 -> 주문취소접수
                // 입금전인 주문은 주문취소로, 입금후 주문은 취소접수로, 기타 결제는 모두 취소완료 처리한다.
                else if (toChangeOrderState == Code.OST_CANCEL && PARTIAL_BACK_ING_YN.equals("N"))
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(입금대기,결제완료,배송준비중 -> 주문취소접수)");
                    logger.info("=====================================================================================");

                    // 주문확정 전/후 여부를 체크한다. 주문확정 전이라면 그냥 취소하면 되고, 주문확정 후라면
                    // ERP 출고일 유무 체크한다. 상품 중 하나라도 출고일 있는 경우, 주문취소가 불가능하다.
                    // 출고일이 없고, 주문확정 후라면, ERP에 취소요청을 해야 한다. 이때 E1FLG8을 R로 보낸다.
                    
                    // 취소가능여부
                    boolean isCancelable = true;
                    
                    /* ========== 이부분은 사용하지 않는 기존 솔루션 소스입니다(2020.06.27). ==========
                    if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//겟잇나우인 경우
                    	//주문추소 가능 여부 체크(0이상인 경우 가능)
                    	Map<String, Object> erpMap = new HashMap<String,Object>();
                    	erpMap.put("P1E1SDOCO", ORD_MST_CD);
                    	int erpOrderCnt = 1;
                    	
                    	//0이상이면 취소 가능
                    	if(erpOrderCnt > 0){
                    		// ERP UPDATE 후 프로시져 호출까지 완료되면 PG 취소한다.
                    		Map<String, Object> map_erp = new HashMap<String,Object>();
                    		map_erp.put("P1E1SDOCO", ORD_MST_CD);
                    		int erp_result = 0;
                    		
                    		if(erp_result > 0){
                    			map_erp.put("SBE1SDOCO", ORD_MST_CD);
                    			erp_result = 0;
                    			
                    			if(erp_result > 0){
                    				
                    				// 겟잇나우 프로시져 호출(상품단위)
            						//insertPROC_F41021
                    				map_erp.put("ORD_MST_CD", ORD_MST_CD);
                    				List<Map<String, Object>> orderProductList = defaultDAO.selectList("Order.selectErpOrderProductList",map_erp);
                    				if(orderProductList != null){
                    					for(Map<String,Object> orderProduct : orderProductList){
                							String VAR_ITM = this.defaultDAO.selectStr("Order.selectErpItm",orderProduct);//ITEM 코드
                							int VAR_MCU = StringUtil.getInt(orderProduct.get("GET_SHP_ERP_CD"));//ERP 지점 코드
                							int VAR_PQOH = StringUtil.getInt(orderProduct.get("ORD_PRD_ORD_CNT"));//수량
                							
                							Map<String,Object> map_proc = new HashMap<String,Object>();
                							logger.debug("VAR_ITM = "+Integer.valueOf(VAR_ITM));
                							logger.debug("VAR_MCU = "+VAR_MCU);
                							logger.debug("VAR_PQOH = "+VAR_PQOH);
                							
                							map_proc.put("VAR_ITM", Integer.valueOf(VAR_ITM));
                							map_proc.put("VAR_MCU", VAR_MCU);
                							map_proc.put("VAR_LOCN", 37);
                							map_proc.put("VAR_PQOH", VAR_PQOH);
                							
                							logger.debug("############# insertPROC_F41021 #############");
                							
                							logger.debug("RESULT_RETURN========="+map_proc.get("RESULT_RETURN"));
                							logger.debug("SQLERRM_RETURN========="+map_proc.get("SQLERRM_RETURN"));
                							
                							if(Integer.valueOf(String.valueOf(map_proc.get("RESULT_RETURN"))) < 0){
                								resultMsg = "################# insertPROC_F41021 실패 RESULT_RETURN : "+ map_proc.get("RESULT_RETURN") +" / SQLERRM_RETURN : "+ map_proc.get("SQLERRM_RETURN") +" ######################";
                								logger.error(resultMsg);
                								throw new Exception();
                							}
                						}
                    					
                    					isCancelable = true;
                    					
                    				}else{
                    					logger.error("=====================================================================================");
                    					logger.error("Message : 겟잇나우 주문상품리스트 불러오기 실패 ");
                    					logger.error("=====================================================================================");
                    					
                    					resultMap.put("result", "F");
                    					isCancelable = false;
                    				}
            						
                    			}else{
                    				logger.error("=====================================================================================");
                					logger.error("Message : 겟잇나우 updateErpF58T1402 실패 ");
                					logger.error("=====================================================================================");
                					
                					resultMap.put("result", "F");
                					isCancelable = false;
                    			}
                    		}else{
                    			logger.error("=====================================================================================");
            					logger.error("Message : 겟잇나우 updateErpF58T2004 실패 ");
            					logger.error("=====================================================================================");
            					
            					resultMap.put("result", "F");
            					isCancelable = false;
                    		}
                    	}else{
                    		isCancelable = false;
                    		result = 0;
        					resultMsg = "현재 주문상태에서는 주문취소가 불가능합니다.";
                    	}
                    }else{//그외
                    	//주문확정 여부 체크
                    	Map<String, Object> erpMap = new HashMap<String,Object>();
                    	erpMap.put("ORD_MST_CD", ORD_MST_CD);
                    	int erpOrderCnt = 0;
                    	
                    	//주문확정한 경우... 
                    	if(erpOrderCnt > 0){
                    		isCancelable = false;
                    		
                    		//출고일 유무 체크
                    		int erpOrderDeliveryStartCnt = 0;
                    		
                    		if(erpOrderDeliveryStartCnt > 0){
                    			//출고일 있는 경우 주문 취소 불가능!
                    			result = 0;
            					resultMsg = "ERP 출고일이 있는 경우 취소가 불가능합니다.";
                    		}else{
                    			//출고일 없는 경우 ERP 취소요청한다.
                    			
                    			if(result == 0){
                    				logger.error("=====================================================================================");
                					logger.error("Message : ERP 취소요청 중 에러 발생... Rollback.");
                					logger.error("=====================================================================================");
                    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    			}
                    		}
                    	}
                    }
                    ========== 2020.06.27 ========== */
                    
                    if(isCancelable){
                    	boolean isCancelBeforeDeposit = false; //입금전 취소여부
                        
                    	// 취소완료시에는 ERP로 정보를 보내고 포인트를 원복해야하기 때문에 취소완료 여부를 확인함 (2020.06.27)
                    	boolean cancelEnd = false;
                    	
                        List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                        //String[] ordPrdIdxs = commandMap.get("ORD_PRD_IDX_ARR").toString().split(",");
                    	//int j= ordPrdIdxs.length;
                        for(Map<String, Object> pMap:pList)
                    	{
                        	//결제대기,결제완료,배송준비중 건만 취소완료
                    		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY_READY)
                    				|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY)
                            		|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_READY))
                    		{
                    			boolean isStockReset = true; //재고 원복 여부
                    			if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
    	            				if(ORD_MST_PAY_DT.equals("00000000000000")){//입금 전이면 주문취소로 변경
    	            					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_BEFORE_DEPOSIT);
    	            					cancelEnd = true;
    	            				}else{//입금 후면 취소접수로 변경
    	            					isStockReset = false; //입금후 주문인 경우 취소완료로 변경시 재고 원복한다.
    	            					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL);
    	            				}
    	            			}else{//나머지는 취소완료로 변경
    	            				commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
    	            				cancelEnd = true;
    	            			}
                    			
                    			//for(int i=0; i<j; i++) { // 상품개수만큼 중복취소되는 오류 수정 (2020.06.27)
                            		//주문상품 상태변경
                            		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                            		result += defaultDAO.update("Order.updateOrderState", commandMap);
                            		
                            		//변경이력 등록
                                	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                                	if(isStockReset){
                                		//  재고 원복(겟잇나우는 안한다)
                                    	// 재결제 주문인 경우 미갱신
                                    	if("".equals(ORD_MST_PRE_CD) && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD){
                                    		Map<String, Object> map_prd = new HashMap<String, Object>();
                                			map_prd.put("ORD_PRD_MST_CD", StringUtil.getString(pMap.get("ORD_PRD_MST_CD"),"")); //ORD_PRD_MST_CD
                                			map_prd.put("ORD_PRD_ORD_CNT", StringUtil.getString(pMap.get("ORD_PRD_ORD_CNT"),"")); //주문수량
                                			
                                			int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(pMap.get("ORD_PRD_OPT_DTL_IDX"));
                        					if(ORD_PRD_OPT_DTL_IDX == 0){//옵션 없는 상품 - 마스터 재고 원복
                        						this.defaultDAO.update("Order.updatePrdMstStock", pMap);
                        					}else{// 옵션 있는 상품 - 옵션 재고 원복
                        						this.defaultDAO.update("Order.updatePrdOptStock", pMap);
                        					}
                                    	}
                                	}
                                	
                    			//}

                    		}
                    	}	
                    	
                        /* ========== 이 부분은 사용하지 않는 기존 솔루션 소스입니다. 쿠폰은 복원하지 않습니다. (2020.06.27) ==========
                    	if(result > 0){
                    		//  쿠폰 사용 여부 체크 후 쿠폰 복원 여부 결정
                    		// 복원할 쿠폰은 상품쿠폰 하나이기 때문에 한번만 update 하면 된다. 
                            int ORD_MST_DC_CPN = StringUtil.getInt(orderInfo.get("ORD_MST_DC_CPN"));
                            if(ORD_MST_DC_CPN > 0 && "Y".equals(COUPON_RESTORE_POSSIBLE_YN)){
                            	boolean isUpdated = false;
                            	List<Map<String, Object>> orderCouponList = defaultDAO.selectList("Order.selectOrderCouponList",commandMap);
                            	for(Map<String, Object> orderCoupon : orderCouponList){
                            		if(!isUpdated){
                            			String CPN_MST_GBN = StringUtil.getString(orderCoupon.get("CPN_MST_GBN"));
                                		if(!"F".equals(CPN_MST_GBN)){//배송비 쿠폰이 아닌 경우에만 복원 가능
                            				orderCoupon.put("CPN_MEM_USE_YN", "N");
                                			orderCoupon.put("CPN_MEM_ID", StringUtil.getString(orderInfo.get("ORD_MST_ORD_ID")));
                                			defaultDAO.update("Order.updateCpnUseYn", orderCoupon);
                                			isUpdated = true;
                                		}
                            		}else{
                        				break;
                        			}
                            	}
                            }
                    	}
                    	========== 2020.06.27 ========== */
                    	
                        /* ========== 이 부분도 사용하지 않는 기존 솔루션 소스입니다.(2020.06.27) ==========
                    	// TODO 마일리지 사용 있는 경우 적립 처리(사용 마일리지 원복) 필요
                    	if(result > 0){
                    		// 사용 마일리지
                    		int ORD_MST_DC_MLG = StringUtil.getInt(orderPayInfo.get("ORD_MST_DC_MLG"));
                    		
                    		if(ORD_MST_DC_MLG > 0){
                    			// 1. ERP 헤더 체크. 헤더 있는 경우 ERP에서 처리한다.
                    			// 헤더가 없다 = 주문확정 전이다.
                        		Map<String,Object> erpMap = new HashMap<String,Object>();
                     			erpMap.put("ORD_MST_CD", ORD_MST_CD);//주문번호
                     			int erpResult = 1;
                     			
                     			if(erpResult == 0){
                     				// 2. 마일리지 적립 여부 체크(중복 적립 방지)
                     				erpMap.put("P9ET1FLG0", "C");
                     				int mlgCnt = 0;
                     				
                     				if(mlgCnt == 0){
                     					Map<String,Object> erp_mlg = new HashMap<String,Object>();
                         				String MEM_MST_ERP_ID = StringUtil.getString(orderInfo.get("MEM_MST_ERP_ID"));
                         				
                         				erp_mlg.put("P9AN8", MEM_MST_ERP_ID);
                         				erp_mlg.put("P9AA", ORD_MST_DC_MLG*-100);
                         				erp_mlg.put("P9E1SMON", ORD_MST_CD);
                         				erp_mlg.put("P9URAT", StringUtil.getInt(orderPayInfo.get("ORD_MST_PAY_PRC"))*100);
                         				erp_mlg.put("P9ET1FLG0", "C");
                         				
                         				erpResult = 1;
                         				
                         				if(erpResult == 0){
                         					logger.error("##################### ERP 사용 마일리지 적립처리(사용 마일리지 원복) 실패 ###########################");
                         					
                         					commandMap.put("resultCode", "-999");
                        					commandMap.put("resultMsg", "##################### ERP 사용 마일리지 적립처리(사용 마일리지 원복) 실패 ###########################");
                        					
                        					throw new Exception("ERR_DB");
                         				}
                     				}
                     			}
                    		}
                    	}
                    	========== 2020.06.27 ========== */
                    	
                    	if(result > 0)
                    	{
                    		// 캐쉬백 사용한 경우 캐쉬백 처리
                    		// 캐쉬백 포인트 사용 이력 
                    		Map<String,Object> cashbagCancelResult = null;
                			commandMap.put("trStatus", "U");//사용 이력
                			Map<String, Object> cashbagUseInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
                			if(cashbagUseInfo != null){//캐쉬백 사용 이력 있는 경우 취소
                				cashbagUseInfo.put("cashbagTrStatus", "N"); // 적립 취소인 경우 X / 사용 취소인 경우 N
                				cashbagUseInfo.put("mgr_txtype", 40);
                				cashbagCancelResult = this.payment.kiccManagePayment(request, cashbagUseInfo);
                				
                				//2. PAY_MST INSERT
    	            			if(cashbagCancelResult != null){
    	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
    	            				this.paymentService.insertPayMaster(cashbagCancelResult);
    	            			}
    	            			
    	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 결제취소 성공");
                					logger.info("=====================================================================================");
                				}
                				else
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 결제취소시 오류발생-주문상태변경 Rollback.");
                					logger.info("=====================================================================================");
                					
                					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
                					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
                					
                					throw new Exception("ERR_PG");
                				}
                			}
                			
                			// 캐쉬백 포인트 적립 이력 
                			commandMap.put("trStatus", "S");//적립 이력
                			Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
                			if(cashbagSavedInfo != null){//캐쉬백 적립 이력 있는 경우 취소
                				cashbagSavedInfo.put("cashbagTrStatus", "X"); // 적립 취소인 경우 X / 사용 취소인 경우 N
                				cashbagSavedInfo.put("mgr_txtype", 40);
                				cashbagCancelResult = this.payment.kiccManagePayment(request, cashbagSavedInfo);
                				
                				//2. PAY_MST INSERT
    	            			if(cashbagCancelResult != null){
    	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
    	            				this.paymentService.insertPayMaster(cashbagCancelResult);
    	            			}
    	            			
    	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 적립취소 성공");
                					logger.info("=====================================================================================");
                				}
                				else
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 적립취소시 오류발생-주문상태변경 Rollback.");
                					logger.info("=====================================================================================");
                					
                					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
                					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
                					
                					throw new Exception("ERR_PG");
                				}
                			}
                			
                    		// 결제취소
                    		// point 결제 아니고
                    		// 가상계좌인 경우 입금대기 상태에서만 pg사 취소 가능
                    		// 그외에는 현금 환불 수기 처리.
                    		if("Y".equals(pgPayYn)) 
                    		{
                    			logger.info("=====================================================================================");
                    			logger.info("Message : PG 결제 전체 취소 시작");
                    			logger.info("=====================================================================================");
       					     
                    			// PG 연동 취소/환불처리
                    			orderPayInfo.put("LGD_RFPHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"))+StringUtil.getString(orderInfo.get("ORD_MST_HP2"))+StringUtil.getString(orderInfo.get("ORD_MST_HP3")));	// 환불요청자 휴대폰번호
    	            			
    	            			Map<String,Object> cancelResult = null;
    	            			
    	            			boolean isCashReturn = false; //현금환불여부
    	            			if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
    	            				if(ORD_MST_PAY_DT.equals("00000000000000")){
    	            					if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT){
    	            						orderPayInfo.put("mgr_txtype", 40);
    	            					}else if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
    	            						orderPayInfo.put("mgr_txtype", 61);
    	            						orderPayInfo.put("mgr_subtype", "ES02");
    	            					}
    	            					if(commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){//LG결제취소
    	            					    //입금완료 일때만 취소를 태운다
                                            if(orderInfo.get("ORD_MST_PAY_TYPE").equals(Code.OST_PAY)){
                                                //환불이 생기면 해당 부분에 환불 부분을 추가 하면 된다.
                                            }else{
                                                logger.info("=====================================================================================");
                                                logger.info("Message : 가상계좌 미입금 주문 - 부분취소 처리");
                                                logger.info("=====================================================================================");
                                                
                                                result = 3;
                                                resultMsg = "완료되었습니다.";
                                                isCashReturn = true;
                                            }
                                        }else{
                                            cancelResult = this.payment.kiccManagePayment(request, orderPayInfo);
                                        }
    	            					isCancelBeforeDeposit = true;
    	            				}else{
    	            					/** PG 결제취소 처리(2020.06.27) */
                                        cancelResult = paymentService.pgCancel(orderPayInfo, request);
                                        System.out.println("resultCode===============>"+cancelResult.get("resultCode"));
                                        cancelResult.put("PAY_MST_RESPCODE", cancelResult.get("resultCode") == "AR0000" ? "0000" : cancelResult.get("resultCode"));
                                        cancelResult.put("PAY_MST_RESPMSG", cancelResult.get("resultMsg"));
                                        System.out.println("PAY_MST_RESPCODE===============>"+StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
    	            					
                                        if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")))){
                                        	logger.info("=====================================================================================");
                                        	logger.info("Message : 가상계좌 PG취소 처리");
                                        	logger.info("=====================================================================================");
                                        	cancelEnd = true;
                                        	
                                        }else {
                                        	logger.info("=====================================================================================");
                                        	logger.info("Message : 가상계좌 입금완료 주문 - 현금환불 처리");
                                        	logger.info("=====================================================================================");
                                        	cancelEnd = false;
                                        	isCashReturn = true;
                                        }
    	                    			
    	                    			result = 3;
    	                    			resultMsg = "완료되었습니다.";
    	            				}
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_CARD || ORD_MST_PAY_TYPE == Code.PAY_FOREIGN_CARD || ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//신용카드 (or 계좌이체 2020.06.27)
    	            			    if(commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){//LG결제취소
    	            			        /** PG 처리 */
                                        cancelResult = paymentService.pgCancel(orderPayInfo, request);
                                        System.out.println("resultCode===============>"+cancelResult.get("resultCode"));
                                        cancelResult.put("PAY_MST_RESPCODE", cancelResult.get("resultCode") == "AR0000" ? "0000" : cancelResult.get("resultCode"));
                                        cancelResult.put("PAY_MST_RESPMSG", cancelResult.get("resultMsg"));
                                        System.out.println("PAY_MST_RESPCODE===============>"+StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
    	            			    }else{//kicc 결제 취소
    	            			        orderPayInfo.put("mgr_txtype", 40);
                                        cancelResult = this.payment.kiccCardManagePayment(request, orderPayInfo);
    	            			    }
    	            			    /*
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//계좌이체
    	            				orderPayInfo.put("mgr_txtype", 40);
    	            				cancelResult = this.payment.kiccManagePayment(request, orderPayInfo);
    	            			/*}else if(ORD_MST_PAY_TYPE == Code.PAY_PAYNOW){//페이나우
    	            				cancelResult = this.payment.lgCancelPayment(request, orderPayInfo);*/
    	            			}else if(ORD_MST_PAY_TYPE == Code.PAY_KAKAOPAY){//카카오페이
    	            				cancelResult = this.payment.kakaoCancelPayment(request, orderPayInfo);
    	            			}
    	            			
    	            			// 2. PAY_MST INSERT
    	            			if(cancelResult != null && !commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){
    	            				this.paymentService.insertPayMaster(cancelResult);
    	            			}
    	            			System.out.println("isCashReturn===============>"+isCashReturn);
    	            			if(!isCashReturn){
    	            				if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE"))))
    	            				{
    	            					result = 1;
    	            					resultMsg = "완료되었습니다.";
    	            					
    	            					logger.info("=====================================================================================");
    	            					logger.info("Message : PG 결제취소 성공");
    	            					logger.info("=====================================================================================");
    	            				}
    	            				else
    	            				{
    	            					logger.info("=====================================================================================");
    	            					logger.info("Message : PG 결제취소시 오류발생-주문상태변경 Rollback.");
    	            					logger.info("=====================================================================================");
    	            					
    	            					commandMap.put("resultCode", StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
    	            					commandMap.put("resultMsg", StringUtil.getString(cancelResult.get("PAY_MST_RESPMSG")));
    	            					
    	            					throw new Exception("ERR_PG");
    	            				}	
    	            			}
                    		}
                    		else
                    		{
                    			result = 2;
                    			logger.info("=====================================================================================");
        					    logger.info("Message : 마일리지 only 결제");
        					    logger.info("=====================================================================================");
                    		}
                    	}
                    	
                    	// TODO 취소완료시에 포인트 사용 있는 경우 적립 처리(사용 포인트 원복) / ERP 전송 (2020.06.27 수정)
                        if(result > 0 && cancelEnd){
                        	pointBack(orderPayInfo, request);
                        	
                        	for(Map<String, Object> pMap : pList) {
                        		//ERP 전송(취소완료 - 주문상태코드: C)
                        		pMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                        		logger.info("=====================================================================================");
                        		logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, pMap).get("RESULT_CODE"));
                        		logger.info("=====================================================================================");
                        	}
                        }
                        
                    	// 취소완료 메일 발송
                    	if (result > 0)
    	            	{
                    		String mailTemplate = "";
    	            		if(isCancelBeforeDeposit){//입금 전 취소인 경우
    	            			mailTemplate = "MAIL-ORDER-CANCEL-BEFORE-DEPOSIT";
    	            		}else{
    	            			mailTemplate = "MAIL-ORDER-CANCEL";
    	            		}
    	            		
    	            		try{
                				// 메일 발송시 필요한 정보 가져오기 시작...
                				
                				// 주문상품 목록
                				commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
                				commandMap.put("ORD_PRD_IDX", "");
                				commandMap.put("ordPrdIdxs", "");
                		        List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);//공통 사용 가능
                		        
                		        //  상품 옵션 가져오기
                		 		for(Map<String, Object> ordPrd : orderProductList){
                		 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
                		 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
                		 				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
                		 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
                		 			}
                		 			
                		 			//서브 옵션 리스트
                		 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
                		 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
                		 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
                						subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
                						ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
                		 			}
                		 		}
                		 		
                		 		// 취소/교환/반품 정보
                         		commandMap.put("targetState", "cancel");
                         		List<Map<String,Object>> cancelInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                         		commandMap.put("targetState", "back");
                         		List<Map<String,Object>> backInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                		 		
                		        // 사은품 정보
                		        List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);//공통 사용 가능
                		        
                		        // 배송정보
                		        Map<String, Object> orderDeliveryInfo2 = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
                		        
                		        // 할인/결제정보
                		        Map<String, Object> orderPayInfo2 = this.pcMyShoppingService.selectOrderPayInfo(commandMap);//공통 사용 가능
                		        
                		  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
                		  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
                		        String DEFAULT_CASHBAG_CARD_NO = "";
                        		Map<String,Object> getItNowShopInfo = null;
                        		Map<String, Object> userInfo = null;
                        		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
                				if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
                					commandMap.put("trStatus", "U");//사용 이력
                					Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
                					
                					if(cashbagSavedInfo != null){
                						DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
                					}
                					
                					// 겟잇나우 주문인 경우 지점 정보 가져오기
                			 		int ORD_MST_DLV_GBN2 = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
                			 		if(ORD_MST_DLV_GBN2 == Code.CART_DLV_GBN_GET_IT_NOW_CD){
                			 			getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
                			 		}
                			 		
                			 		// 회원정보
                			 		Map<String,Object> userMap = new HashMap<String,Object>();
                			 		userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
                        			userInfo = this.cartService.selectUserInfo(userMap);
                				}
                				
                				// 메일 contents 맵
                	    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
                	    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
                	    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
                	    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
                	    		mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
                	    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
                	    		mailContentsMap.put("cancelInfoList", cancelInfoList);//취소사유정보
                	    		mailContentsMap.put("backInfoList", backInfoList);//반품사유정보
                	    		mailContentsMap.put("userInfo", userInfo);//회원정보
                	    		
                	    		mailContentsMap.put("autoCancelYn", "N"); //입금기한 만료 자동 취소 여부
                	    		
                	    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
                    				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
                	    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
                	    		}
                	    		
                	    		// 주문일 
                	    		Calendar calendar = Calendar.getInstance();
                	    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
                	    		String today = dateformat_text.format(calendar.getTime());
                	    		mailContentsMap.put("today", today);
                	    		
                	    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
                	    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
                	    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
                				
                	    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
                	    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
                	    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
                				
                	    		int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
                	    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
                	    		int dlvCag = dlvCagTmp - addCag;
                	    		
                	    		mailContentsMap.put("dlvCag", dlvCag);
                				mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
                				mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
                				mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
                				mailContentsMap.put("number", new NumberTool());
                				
                	    		//-- 메일본문 정리
                				String body = VelocityEngineUtils.mergeTemplateIntoString(
                						velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
                				body += VelocityEngineUtils.mergeTemplateIntoString(
                						velocityEngine, "/"+ mailTemplate +".vm", "utf-8", mailContentsMap);
                				body += VelocityEngineUtils.mergeTemplateIntoString(
                						velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
                				
                				//메일 발송용 맵
                				Map<String, Object> mailMap = new HashMap<String, Object>();
                				
                				mailMap.put("MAIL_CODE", "13");	// 이메일 코드
                	    		mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );		// 수신자 이메일
                	    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
                	    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님의 주문이 취소되었습니다. ");	// 메일 제목
                	    		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
                				
                				this.mail.mailSend(mailMap);
                				
                				// SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
                				
                				smsMap.put("TR_PHONE", StringUtil.getString(orderPayInfo2.get("ORD_MST_HP1"), "")+StringUtil.getString(orderPayInfo2.get("ORD_MST_HP2"), "")+StringUtil.getString(orderPayInfo2.get("ORD_MST_HP3"), ""));  
                				smsMap.put("TR_NAME", StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"), ""));  		
                				
                				smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"), "") +"님, 주문이 취소되었습니다. 더 좋은 상품으로 찾아뵙겠습니다. "+StringUtil.getString(propertiesService.getString("app.name"),"")+"을 이용해 주셔서 감사드립니다."); 		
                				
                				smsMap = this.sms.sendLongMessage(smsMap);
                			}catch(Exception e){
                				e.printStackTrace();
                				logger.error("SMS, EMAIL 발송 중 예외 발생");
                			}
    	            	}
                    }
                }
                //부분 취소
                else if(toChangeOrderState == Code.OST_CANCEL && PARTIAL_BACK_ING_YN.equals("Y")){
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(입금대기,결제완료,배송준비중 -> 부분취소)");
                    logger.info("=====================================================================================");
                    
                    // 취소가능여부
                    boolean isCancelable = true;
                    
                    // 취소완료시에는 ERP로 정보를 보내고 포인트를 원복해야하기 때문에 취소완료 여부를 확인함 (2020.06.27)
                	boolean cancelEnd = false;
                    
                    if(isCancelable){
                        boolean isCancelBeforeDeposit = false; //입금전 취소여부
                        
                        List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                        
                        int LGD_CANCELAMOUNT = 0; //부분취소 금액
                        int ORD_PRD_DC_PIT = 0; // 사용한 E포인트
                        int ORD_PRD_DC_TOT_PIT = 0; // 사용한 통합 포인트
                        int ORD_PRD_DC_SW_PIT = 0; // 사용한 임직원포인트
                        
                        for(Map<String, Object> pMap:pList)
                        {
                            //결제대기,결제완료,배송준비중 건만 취소완료
                            if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY_READY)
                                    || StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_PAY)
                                    || StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_READY))
                            {
                                boolean isStockReset = true; //재고 원복 여부
                                if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
                                    if(ORD_MST_PAY_DT.equals("00000000000000")){//입금 전이면 주문취소로 변경
                                        commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_BEFORE_DEPOSIT);
                                        cancelEnd = true;
                                    }else{//입금 후면 취소접수로 변경
                                        isStockReset = false; //입금후 주문인 경우 취소완료로 변경시 재고 원복한다.
                                        commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL);
                                    }
                                }else{//나머지는 취소완료로 변경
                                    commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                                    cancelEnd = true;
                                }
                                
                                //주문상품 상태변경
                                commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                                result += defaultDAO.update("Order.updateOrderState", commandMap);
                                
                                //변경이력 등록
                                defaultDAO.insert("Order.insertOrderHistory",commandMap);

                                if(isStockReset){
                                    //  재고 원복(겟잇나우는 안한다)
                                    // 재결제 주문인 경우 미갱신
                                    if("".equals(ORD_MST_PRE_CD) && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD){
                                        Map<String, Object> map_prd = new HashMap<String, Object>();
                                        map_prd.put("ORD_PRD_MST_CD", StringUtil.getString(pMap.get("ORD_PRD_MST_CD"),"")); //ORD_PRD_MST_CD
                                        map_prd.put("ORD_PRD_ORD_CNT", StringUtil.getString(pMap.get("ORD_PRD_ORD_CNT"),"")); //주문수량
                                        
                                        int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(pMap.get("ORD_PRD_OPT_DTL_IDX"));
                                        if(ORD_PRD_OPT_DTL_IDX == 0){//옵션 없는 상품 - 마스터 재고 원복
                                            this.defaultDAO.update("Order.updatePrdMstStock", pMap);
                                        }else{// 옵션 있는 상품 - 옵션 재고 원복
                                            this.defaultDAO.update("Order.updatePrdOptStock", pMap);
                                        }
                                    }
                                }
                                
                                // 포인트 계산
                                ORD_PRD_DC_PIT += StringUtil.getInt(pMap.get("ORD_PRD_DC_PIT"),0); // 사용한 E포인트
                                ORD_PRD_DC_TOT_PIT += StringUtil.getInt(pMap.get("ORD_PRD_DC_TOT_PIT"),0); // 사용한 통합포인트
                                ORD_PRD_DC_SW_PIT += StringUtil.getInt(pMap.get("ORD_PRD_DC_SW_PIT"),0); // 사용한 임직원포인트
                                
                                //부분 취소금액 계산((판매가 X 수량) + 배송비 - 사용포인트,사용 쿠폰금액)
                                LGD_CANCELAMOUNT += ( 
                                		(StringUtil.getInt(pMap.get("ORD_PRD_SAL_PRC"),0) * StringUtil.getInt(pMap.get("ORD_PRD_ORD_CNT")))
                                			+ StringUtil.getInt(pMap.get("ORD_PRD_DLV_CAG"),0)) 		// 배송비
                                			- (ORD_PRD_DC_PIT + ORD_PRD_DC_TOT_PIT + ORD_PRD_DC_SW_PIT 	// 사용포인트
                                				+ StringUtil.getInt(pMap.get("ORD_PRD_DC_CPN"),0));		// 사용 쿠폰금액
                                
                            }
                        }
                        
                        if(LGD_CANCELAMOUNT > 0){
                            orderPayInfo.put("LGD_CANCELAMOUNT", LGD_CANCELAMOUNT);
                        }else{
                            result = -1;
                            resultMsg = "부분취소금액 오류";
                            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        }
                        
                        if(result > 0)
                        {
                            // 결제취소
                            // point 결제 아니고
                            // 가상계좌인 경우 입금대기 상태에서만 pg사 취소 가능
                            // 그외에는 현금 환불 수기 처리.
                            if("Y".equals(pgPayYn)) 
                            {
                                logger.info("=====================================================================================");
                                logger.info("Message : PG 결제 부분 취소 시작");
                                logger.info("=====================================================================================");
                             
                                // PG 연동 취소/환불처리
                                orderPayInfo.put("LGD_RFPHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"))+StringUtil.getString(orderInfo.get("ORD_MST_HP2"))+StringUtil.getString(orderInfo.get("ORD_MST_HP3")));  // 환불요청자 휴대폰번호
                                
                                Map<String,Object> cancelResult = null;
                                
                                boolean isCashReturn = false; //현금환불여부
                                if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
                                    if(ORD_MST_PAY_DT.equals("00000000000000")){
                                        if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT){
                                            orderPayInfo.put("mgr_txtype", 40);
                                        }else if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
                                            orderPayInfo.put("mgr_txtype", 61);
                                            orderPayInfo.put("mgr_subtype", "ES02");
                                        }
                                        if(commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){//LG결제취소
                                            /** PG 처리 */
                                            //입금완료 일때만 취소를 태운다
                                            if(orderInfo.get("ORD_MST_PAY_TYPE").equals(Code.OST_PAY)){
                                              //환불이 생기면 해당 부분에 환불 부분을 추가 하면 된다.
                                            }else{
                                                logger.info("=====================================================================================");
                                                logger.info("Message : 가상계좌 미입금 주문 - 부분취소 처리");
                                                logger.info("=====================================================================================");
                                                
                                                result = 3;
                                                resultMsg = "완료되었습니다.";
                                                isCashReturn = true;
                                            }
                                        }else{
                                            cancelResult = this.payment.kiccManagePayment(request, orderPayInfo);
                                        }
                                        isCancelBeforeDeposit = true;
                                    }else{
                                    	if(commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){//LG결제취소
                                            /** PG 처리 */
                                            cancelResult = paymentService.pgPartCancel(orderPayInfo, request);
                                            System.out.println("resultCode===============>"+cancelResult.get("resultCode"));
                                            cancelResult.put("PAY_MST_RESPCODE", cancelResult.get("resultCode") == "CR0000" ? "0000" : cancelResult.get("resultCode"));
                                            cancelResult.put("PAY_MST_RESPMSG", cancelResult.get("resultMsg"));
                                            System.out.println("PAY_MST_RESPCODE===============>"+StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
                                        }else{//kicc 결제 취소
                                            orderPayInfo.put("mgr_txtype", 40);
                                            cancelResult = this.payment.kiccCardManagePayment(request, orderPayInfo);
                                        }
                                    	
                                    	if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")))) {
                                    		logger.info("=====================================================================================");
                                        	logger.info("Message : 가상계좌 PG취소 처리");
                                        	logger.info("=====================================================================================");
                                        	cancelEnd = true;
                                    		
                                    	}else {
                                    		logger.info("=====================================================================================");
                                    		logger.info("Message : 가상계좌 입금완료 주문 - 현금환불 처리");
                                    		logger.info("=====================================================================================");
                                    		
                                    		isCashReturn = true;
                                    		result = 3;
                                    	}
                                		resultMsg = "완료되었습니다.";
                                    }
                                }else if(ORD_MST_PAY_TYPE == Code.PAY_CARD || ORD_MST_PAY_TYPE == Code.PAY_FOREIGN_CARD || ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//신용카드 (or 계좌이체 2020.06.27)
                                    if(commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){//LG결제취소
                                        /** PG 처리 */
                                        cancelResult = paymentService.pgPartCancel(orderPayInfo, request);
                                        System.out.println("resultCode===============>"+cancelResult.get("resultCode"));
                                        cancelResult.put("PAY_MST_RESPCODE", cancelResult.get("resultCode") == "CR0000" ? "0000" : cancelResult.get("resultCode"));
                                        cancelResult.put("PAY_MST_RESPMSG", cancelResult.get("resultMsg"));
                                        System.out.println("PAY_MST_RESPCODE===============>"+StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
                                    }else{//kicc 결제 취소
                                        orderPayInfo.put("mgr_txtype", 40);
                                        cancelResult = this.payment.kiccCardManagePayment(request, orderPayInfo);
                                    }
                                    /*
                                }else if(ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//계좌이체
                                    orderPayInfo.put("mgr_txtype", 40);
                                    cancelResult = this.payment.kiccManagePayment(request, orderPayInfo);
                                    
                                /*}else if(ORD_MST_PAY_TYPE == Code.PAY_PAYNOW){//페이나우
                                    cancelResult = this.payment.lgCancelPayment(request, orderPayInfo);*/
                                }else if(ORD_MST_PAY_TYPE == Code.PAY_KAKAOPAY){//카카오페이
                                    cancelResult = this.payment.kakaoCancelPayment(request, orderPayInfo);
                                }
                                
                                // 2. PAY_MST INSERT
                                if(cancelResult != null && !commandMap.get("ORD_PG_TYPE").equals(Code.PG_TYPE_LG)){
                                    this.paymentService.insertPayMaster(cancelResult);
                                }
                                System.out.println("isCashReturn===============>"+isCashReturn);
                                if(!isCashReturn){
                                    if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE"))))
                                    {
                                        result = 1;
                                        resultMsg = "완료되었습니다.";
                                        
                                        logger.info("=====================================================================================");
                                        logger.info("Message : PG 결제취소 성공");
                                        logger.info("=====================================================================================");
                                    }
                                    else
                                    {
                                        logger.info("=====================================================================================");
                                        logger.info("Message : PG 결제취소시 오류발생-주문상태변경 Rollback.");
                                        logger.info("=====================================================================================");
                                        
                                        commandMap.put("resultCode", StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
                                        commandMap.put("resultMsg", StringUtil.getString(cancelResult.get("PAY_MST_RESPMSG")));
                                        
                                        throw new Exception("ERR_PG");
                                    }   
                                }
                            }
                            else
                            {
                                result = 2;
                                logger.info("=====================================================================================");
                                logger.info("Message : 포인트 only 결제");
                                logger.info("=====================================================================================");
                                
                                if(cancelEnd) {
                                	for(Map<String, Object> pMap : pList) {
                                		//ERP 전송(취소완료 - 주문상태코드: C)
                                		pMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                                		logger.info("=====================================================================================");
                                		logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, pMap).get("RESULT_CODE"));
                                		logger.info("=====================================================================================");
                                	}
                                }
                            }
                        }
                        
                        // 취소완료 메일 발송
                        if (result > 0)
                        {
                            String mailTemplate = "";
                            if(isCancelBeforeDeposit){//입금 전 취소인 경우
                                mailTemplate = "MAIL-ORDER-CANCEL-BEFORE-DEPOSIT";
                            }else{
                                mailTemplate = "MAIL-ORDER-CANCEL";
                            }
                            
                            try{
                                // 메일 발송시 필요한 정보 가져오기 시작...
                                
                                // 주문상품 목록
                                commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
                                commandMap.put("ORD_PRD_IDX", "");
                                commandMap.put("ordPrdIdxs", "");
                                List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);//공통 사용 가능
                                
                                //  상품 옵션 가져오기
                                for(Map<String, Object> ordPrd : orderProductList){
                                    int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
                                    if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
                                        List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
                                        ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
                                    }
                                    
                                    //서브 옵션 리스트
                                    List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
                                    int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
                                    if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
                                        subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
                                        ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
                                    }
                                }
                                
                                // 취소/교환/반품 정보
                                commandMap.put("targetState", "cancel");
                                List<Map<String,Object>> cancelInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                                commandMap.put("targetState", "back");
                                List<Map<String,Object>> backInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                                
                                // 사은품 정보
                                List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);//공통 사용 가능
                                
                                // 배송정보
                                Map<String, Object> orderDeliveryInfo2 = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
                                
                                // 할인/결제정보
                                Map<String, Object> orderPayInfo2 = this.pcMyShoppingService.selectOrderPayInfo(commandMap);//공통 사용 가능
                                
                                //  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
                                // 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
                                String DEFAULT_CASHBAG_CARD_NO = "";
                                Map<String,Object> getItNowShopInfo = null;
                                Map<String, Object> userInfo = null;
                                String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
                                if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
                                    commandMap.put("trStatus", "U");//사용 이력
                                    Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
                                    
                                    if(cashbagSavedInfo != null){
                                        DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
                                    }
                                    
                                    // 겟잇나우 주문인 경우 지점 정보 가져오기
                                    int ORD_MST_DLV_GBN2 = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
                                    if(ORD_MST_DLV_GBN2 == Code.CART_DLV_GBN_GET_IT_NOW_CD){
                                        getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
                                    }
                                    
                                    // 회원정보
                                    Map<String,Object> userMap = new HashMap<String,Object>();
                                    userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
                                    userInfo = this.cartService.selectUserInfo(userMap);
                                }
                                
                                // 메일 contents 맵
                                Map<String,Object> mailContentsMap = new HashMap<String,Object>();
                                mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
                                mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
                                mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
                                mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
                                mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
                                mailContentsMap.put("cancelInfoList", cancelInfoList);//취소사유정보
                                mailContentsMap.put("backInfoList", backInfoList);//반품사유정보
                                mailContentsMap.put("userInfo", userInfo);//회원정보
                                
                                mailContentsMap.put("autoCancelYn", "N"); //입금기한 만료 자동 취소 여부
                                
                                if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
                                    mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
                                    mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
                                }
                                
                                // 주문일 
                                Calendar calendar = Calendar.getInstance();
                                SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
                                String today = dateformat_text.format(calendar.getTime());
                                mailContentsMap.put("today", today);
                                
                                mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));         // 수신자 이름
                                mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
                                mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
                                
                                mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
                                mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
                                mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
                                
                                int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
                                int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
                                int dlvCag = dlvCagTmp - addCag;
                                
                                mailContentsMap.put("dlvCag", dlvCag);
                                mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
                                mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
                                mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
                                mailContentsMap.put("number", new NumberTool());
                                
                                //-- 메일본문 정리
                                String body = VelocityEngineUtils.mergeTemplateIntoString(
                                        velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
                                body += VelocityEngineUtils.mergeTemplateIntoString(
                                        velocityEngine, "/"+ mailTemplate +".vm", "utf-8", mailContentsMap);
                                body += VelocityEngineUtils.mergeTemplateIntoString(
                                        velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
                                
                                //메일 발송용 맵
                                Map<String, Object> mailMap = new HashMap<String, Object>();
                                
                                mailMap.put("MAIL_CODE", "13"); // 이메일 코드
                                mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );      // 수신자 이메일
                                mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));         // 수신자 이름
                                mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님의 주문이 취소되었습니다. ");    // 메일 제목
                                mailMap.put("EMAIL_CONTENTS", body);    // 메일 내용
                                
                                this.mail.mailSend(mailMap);
                                
                                // SMS 발송
                                Map<String, Object> smsMap = new HashMap<String, Object>();
                                
                                smsMap.put("TR_PHONE", StringUtil.getString(orderPayInfo2.get("ORD_MST_HP1"), "")+StringUtil.getString(orderPayInfo2.get("ORD_MST_HP2"), "")+StringUtil.getString(orderPayInfo2.get("ORD_MST_HP3"), ""));  
                                smsMap.put("TR_NAME", StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"), ""));       
                                
                                smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"), "") +"님, 주문이 취소되었습니다. 더 좋은 상품으로 찾아뵙겠습니다. "+StringUtil.getString(propertiesService.getString("app.name"),"")+"을 이용해 주셔서 감사드립니다.");        
                                
                                smsMap = this.sms.sendLongMessage(smsMap);
                            }catch(Exception e){
                                e.printStackTrace();
                                logger.error("SMS, EMAIL 발송 중 예외 발생");
                            }
                        }
                    }
                }
                
                // 결제완료 -> 배송보류(2020.06.26 추가)
                else if (toChangeOrderState == Code.OST_SEND_HOLD)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송준비중 -> 배송보류)");
                    logger.info("=====================================================================================");
                	
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "배송보류 처리");
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                }
                
                // 배송준비중 -> 배송중(배치에서만 사용, 송장입력(insertInvoiceNo) 에서 배송중 처리한다.)
                else if (toChangeOrderState == Code.OST_SEND)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송준비중 -> 배송중) - 미사용");
                    logger.info("=====================================================================================");
                	
                    /** 배송중 처리는 송장번호 입력에서 처리..
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "배송중 처리");
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                	*/
                }
                // 배송중 -> 배송완료
                else if (toChangeOrderState == Code.OST_SEND_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송중 -> 배송완료)");
                    logger.info("=====================================================================================");

                    //임의 배송완료 여부
                    String sendEndSmYn = StringUtil.getString(commandMap.get("sendEndSmYn"));
                    logger.debug("sendEndSmYn================="+sendEndSmYn);
                    
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "배송완료 처리");
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	// 배송구분 체크 후 입점업체 배송인 경우 ERP 인수일 UPDATE 쳐 준다.
                        int dlvType = StringUtil.getInt(pMap.get("ORD_PRD_DLV_TYPE"));
                    	if(dlvType == Code.DLV_TYPE_PARTNER){
                    		 // ERP 인수일 UPDATE
                 			Map<String,Object> erpMap = new HashMap<String,Object>();
                 			erpMap.put("ORD_ORD_MST_CD", StringUtil.getString(commandMap.get("ORD_MST_CD"),""));//주문번호
                 			erpMap.put("ORD_PRD_SEQ", StringUtil.getString(pMap.get("ORD_PRD_SEQ"),""));//라인번호
                 			int erpResult = 1;
                 			
                 			if(erpResult == 0){
                     			logger.error("############### ERP 인수일 업데이트 에러 #################");
                     			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                     			result = -999;
                 			}else{
                 				result = erpResult;
                 			}
                    	}
                        
                    	//임의 배송완료가 아닌 경우에만 발송
                    	if(!"Y".equals(sendEndSmYn)){
                    		// 배송완료 SMS 발송
                        	Map<String, Object> smsMap = new HashMap<String, Object>();
        					
        					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
        					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
        					
        					String ORD_MST_ORD_ID = StringUtil.getString(orderInfo.get("ORD_MST_ORD_ID"), "");
        					
        					String linkUrl = this.propertiesService.getString("mobile.ssl.domain") + "/mobile/mypage/myShoppingList.do";
        					if("_GUEST_".equals(ORD_MST_ORD_ID)){
        						//비회원 주문인 경우 링크 없음
        						linkUrl = "";
        					}
        					
        					smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 상품은 잘 받으셨나요? 상품을 만족하셨나요? 상품평을 작성해 주시면, 포인트를 적립해 드립니다. 지금 "+StringUtil.getString(propertiesService.getString("app.name")+" ","")+" 쇼핑몰에 방문하세요."); 		
        					
        					smsMap = this.sms.sendLongMessage(smsMap);
                    	}
                	}
                	
                	if(result > 0){
                		// 에스크로 주문인 경우 마지막 상품이 배송완료인 경우 kicc에 보내줘야한다.
                    	// 완료시 배치쪽에도 추가 필요.
                    	// 배송완료 이력 확인
                		if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
                			if(!"Y".equals(sendEndSmYn)){//임의 배송완료가 아닌 경우에만 발송
                				Map<String,Object> kiccEscrowInfo = defaultDAO.select("Order.selectKiccSendEndInfo",commandMap);
                                
                                if(kiccEscrowInfo != null){
                                	try{
                                		 int SEND_END_HIS_CNT = StringUtil.getInt(kiccEscrowInfo.get("SEND_END_HIS_CNT")); /* 배송완료 이력이 있는 상품 개수 */
                                         int TOT_CNT = StringUtil.getInt(kiccEscrowInfo.get("TOT_CNT")); /* 전체 상품 개수 */
                                         String IVC_NO = StringUtil.getString(kiccEscrowInfo.get("IVC_NO")); /* 송장번호 */
                                         String DLV_CPN_ESC_CD = StringUtil.getString(kiccEscrowInfo.get("DLV_CPN_ESC_CD")); /* 택배사 코드 */
                                         
                                         if(SEND_END_HIS_CNT == TOT_CNT && !"".equals(IVC_NO)){//마지막 배송완료 상품이고, 송장번호 있는 경우 kicc 호출
                                    		Map<String,Object> escrowMap = new HashMap<String,Object>();
                                         	escrowMap.put("PAY_MST_MID", StringUtil.getString(orderPayInfo.get("PAY_MST_MID"))); //에스크로 상태변경	
                                         	escrowMap.put("mgr_txtype", 61); //에스크로 상태변경	
                                         	escrowMap.put("mgr_subtype", "ES07"); //배송중 
                                         	escrowMap.put("PAY_MST_TID", StringUtil.getString(orderPayInfo.get("PAY_MST_TID"))); //고유거래번호
                                         	
                                         	escrowMap.put("deli_cd", "DE02"); //DE01 : 자가, DE02 : 택배
                                         	escrowMap.put("deli_corp_cd", DLV_CPN_ESC_CD); //택배사 코드
                                         	escrowMap.put("deli_invoice", IVC_NO); //운송장 번호
                                         	escrowMap.put("deli_rcv_nm", StringUtil.getString(orderDeliveryInfo.get("ORD_DLV_NM"))); //수령인 이름
                                         	escrowMap.put("deli_rcv_tel", StringUtil.getString(orderDeliveryInfo.get("ORD_DLV_HP")) ); //수령인 연락처
                                         	
                                         	logger.debug("########### 마지막 배송상품!!!! kicc 배송중 상태변경 필요!!!!! ##############");
                                         	logger.debug("########### escrowMap["+ escrowMap +"] ##############");
                                         	Map<String,Object> escrowSendEndResult = this.payment.kiccManagePayment(request, escrowMap);
                                         	
                                         	// 2. PAY_MST INSERT
                	            			/*if(escrowSendEndResult != null){
                	            				escrowSendEndResult.put("ORD_MST_CD", ORD_MST_CD);
                	            				this.paymentService.insertPayMaster(escrowSendEndResult);
                	            			}*/
                                         }
                                	}catch(Exception e){
                                		e.printStackTrace();
                                		logger.error("에스크로 마지막 상품 배송완료시 kicc에 배송 요청 중 에러...");
                                	}
                                }
                			}
                		}
                	}
                	
                	
                }
                // 배송완료 -> 구매확정
                else if (toChangeOrderState == Code.OST_FIX)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송완료 -> 구매확정)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//배송완료 건만 구매확정
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_END))
                		{
                			//상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//변경이력 등록
                    		commandMap.put("ORD_PRD_DSC", "구매확정 처리");
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                		}
                	}
                	
                	if(result > 0){
                		// 현재 주문상태 확인 후 모든 상품이 구매확정인 경우에만 적립한다.
                        cState = defaultDAO.select("Order.selectOrderStateCnt",commandMap);
                        int EXCEPT_SWAP_TOTAL_CNT = StringUtil.getInt(cState.get("EXCEPT_SWAP_TOTAL_CNT"));//전체상품수
                        int FIX_CNT = StringUtil.getInt(cState.get("FIX_CNT"));//구매확정수
                        if(EXCEPT_SWAP_TOTAL_CNT > 0 && EXCEPT_SWAP_TOTAL_CNT == FIX_CNT){
                        	//회원 아이디
                        	String ORD_MST_ORD_ID = StringUtil.getString(orderInfo.get("ORD_MST_ORD_ID"));
                        	if(!"".equals("_GUEST_")){//회원인 경우에만
                            	// 캐쉬백 적립 처리
                        		int TOT_ORD_SAV_OCB = StringUtil.getInt(orderPayInfo.get("TOT_ORD_SAV_OCB"));//캐쉬백 적립금액
                        		
                        		if(TOT_ORD_SAV_OCB > 0){
                        			String CASHBAG_CARD_NO = "";
                        			
                        			//0. 사용 이력
                        			commandMap.put("trStatus", "U");//사용 이력
                        			Map<String, Object> cashbagUseInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
                        			
                        			if(cashbagUseInfo != null){//캐쉬백 정보 가져온다.
                        			    CASHBAG_CARD_NO = StringUtil.getString(cashbagUseInfo.get("PAY_MST_KICC_CARD_NO"));//캐쉬백 카드번호 주문때 썼던 카드로 수정!
                        			}
                                	
                                	if(!"".equals(CASHBAG_CARD_NO)){
                                		//2. 적립 이력(적립이력 없는 경우에만 적립)
                                    	commandMap.put("trStatus", "S");//적립 이력
                            			Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
                            			
                            			if(cashbagSavedInfo == null){
                            				String PAY_MST_PAYTYPE = StringUtil.getString(orderPayInfo.get("PAY_MST_PAYTYPE"));
                            				String EP_mall_id = StringUtil.getString(orderPayInfo.get("PAY_MST_MID"));
                            				
                            				if(!"KICC".equals(PAY_MST_PAYTYPE)){//kicc 아닌 경우 default mid
                            					EP_mall_id = this.propertiesService.getString("payment.kicc.mall.id");//default kicc mid
                            				}
                            				
                            				logger.debug("캐쉬백 적립시 결제때 쓴 kicc mid 쓴다. 없으면 그냥 default mid쓴다. EP_mall_id========"+EP_mall_id);
                            				
                            				Map<String, Object> cashbagMap = new HashMap<String, Object>();
                            				cashbagMap.put("EP_mall_id", EP_mall_id);
                            				String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
                            				if("test".equals(CST_PLATFORM)){
                            					cashbagMap.put("EP_mall_id", "T0001981"); //TODO 삭제예정
                            				}
                            				cashbagMap.put("EP_pay_type", "point");
                            				cashbagMap.put("EP_pnt_txtype", "40");
                            				cashbagMap.put("EP_pnt_cp_cd", "OCB");
                            				cashbagMap.put("EP_pnt_idno", CASHBAG_CARD_NO);
                            				cashbagMap.put("EP_pnt_pwd", "0000");
                            				cashbagMap.put("EP_order_no", ORD_MST_CD);
                            				cashbagMap.put("ORD_MST_CD", ORD_MST_CD);
                            				cashbagMap.put("EP_product_amt", TOT_ORD_SAV_OCB);
                            				cashbagMap.put("EP_tot_amt", TOT_ORD_SAV_OCB);
                            				cashbagMap.put("EP_pnt_amt", TOT_ORD_SAV_OCB);
                            				cashbagMap.put("EP_currency", "00");
                            				cashbagMap.put("EP_escrow_yn", "N");
                            				cashbagMap.put("EP_complex_yn", "N");
                            				
                            				// 캐쉬백 포인트 적립
                            				Map<String,Object> cashbagSaveResult = null;
                            				cashbagSaveResult = this.payment.kiccPayment(request, cashbagMap);
                            				
                            				// 2. PAY_MST INSERT
                	            			if(cashbagSaveResult != null){
                	            				this.paymentService.insertPayMaster(cashbagSaveResult);
                	            			}
                        					
                        					if("0000".equals(StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPCODE"))))
                            				{
                        						result = 1;
                        						resultMsg = "완료되었습니다.";
                        						
                            					logger.info("=====================================================================================");
                            					logger.info("Message : PG 캐쉬백 적립 성공");
                            					logger.info("=====================================================================================");
                            				}
                            				else
                            				{
                            					// 캐쉬백 적립 오류시 롤백 OR NOT????????? - 일단 롤백은 안하는 것으로...
                            					result = 0;
                            					resultMsg = StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPMSG"));
                            					logger.info("=====================================================================================");
                            					//logger.info("Message : PG 캐쉬백 적립시 오류발생-주문상태변경 Rollback.");
                            					logger.info("Message : PG 캐쉬백 적립시 오류발생 PAY_MST_RESPCODE ["+ StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPCODE")) +"] PAY_MST_RESPMSG ["+ resultMsg +"]");
                            					logger.info("=====================================================================================");
                            					
                            					//commandMap.put("resultCode", StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPCODE")));
                            					//commandMap.put("resultMsg", StringUtil.getString(cashbagSaveResult.get("PAY_MST_RESPMSG")));
                            					
                            					//throw new Exception("ERR_PG");
                            				}
                            			}
                                	}
                        		}
                        	}
                        }
                	}
                }
                /** ########################################반품 관련 시작########################################### */
                // 배송완료 -> 반품접수
                else if (toChangeOrderState == Code.OST_BACK)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(배송완료,구매확정 -> 반품접수)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		// 반품접수 가능한 건만 처리
                		boolean back_check = false;
                		for(int code : Code.OST_BACK_POSSIBLE_ARR) {
                			if(code == StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE"))) {
                				back_check = true;
                				break;
                			}
                		}
                		
                		if (back_check){
                			//재결제 주문은 반품 접수 불가!
                			if("".equals(StringUtil.getString(pMap.get("ORD_MST_PRE_CD")))){
                				//상태변경
                        		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                        		commandMap.put("DLV_PAY_WAY", commandMap.get("changeProduct"));
                        		result += defaultDAO.update("Order.updateOrderState", commandMap);
                        		
                        		// ===================== 반품 접수와 동시에 택배 배송 EDI 회수 지시를 해야 함(2020.06.15) ======================
                        		if(result > 0){
                            		// 일반택배(입점사배송X)인 경우 EDI 회수지시
                            		int ORD_PRD_DLV_TYPE = StringUtil.getInt(pMap.get("ORD_PRD_DLV_TYPE")); //배송구분
                            		if(Code.DLV_TYPE_PARCEL_SGS == ORD_PRD_DLV_TYPE){
                            			String changeProduct = (String) commandMap.get("changeProduct");
                                    	if("A".equals(changeProduct)) {	// 자동수거 선택시
                                    		this.defaultDAO.insert("Order.insertPickup", commandMap);
                                    		
                                    		logger.debug("##### EDI 회수지시 ######");
                                			Map<String,Object> ediMap = new HashMap<String,Object>();
                                			String ORD_PRD_IDX =  StringUtil.getString(pMap.get("ORD_PRD_IDX"));
                                			String ORD_PRD_SYS_SGS =  StringUtil.getString(pMap.get("ORD_PRD_SYS_SGS"));
                                    		//String ORD_PRD_DLV_DUE_DT = StringUtil.getString(pMap.get("ORD_PRD_DLV_DUE_DT"));
                                			
                                			ediMap.put("ORD_MST_CD", ORD_MST_CD);
                                			ediMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
                                			ediMap.put("ORD_PRD_SYS_SGS", ORD_PRD_SYS_SGS);
                                			ediMap = null;
                                			
                                			if(!"0".equals(StringUtil.getString(ediMap.get("resultCode")))){
                                				result = -999;
                                    			resultMsg = StringUtil.getString(ediMap.get("resultMsg"));
                                    			logger.error(resultMsg);
                                    			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                                    			break;
                                			}
                                    	}
                            		}
                            		
                            	}
                        		
                        		String ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX")); //교환 상품 여부
                        		if(result > 0){
                            		if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
                            			// 반품접수승인 SMS 발송
                                    	Map<String, Object> smsMap = new HashMap<String, Object>();
                    					
                    					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
                    					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
                    					
                    					smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 반품 신청이 접수되었습니다. 상품회수를 위한 방문예정입니다.  담당자가 반품신청상품을 확인하여 빠른 시간안에 연락드리도록 하겠습니다. 불편을 드려 죄송합니다."); 		
                    					
                    					smsMap = this.sms.sendLongMessage(smsMap);
                            		}
                            	}
                        		
                        		//변경이력 등록
                            	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                			}
                		}
                	}
                }
                
                // 결제완료 -> 반품취소(고객이 반품접수취소)(2020.06.23 추가)
                else if (toChangeOrderState == Code.OST_BACK_CLIENT_CANCEL)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(반품접수 -> 반품접수취소)");
                    logger.info("=====================================================================================");
                	
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		commandMap.put("ORD_PRD_DSC", "반품접수취소 처리");
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	//배송완료
            	    	commandMap.put("ORD_PRD_ORD_STATE",Code.OST_SEND_END);
            	    	commandMap.put("ORD_PRD_DSC", "반품취소 후 기존 주문상태 원복");
                	    
                		//배송완료 상태변경 처리
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//배송완료 변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                }
                
                
                // 반품접수 -> 반품접수승인(반품대기중)
                else if (toChangeOrderState == Code.OST_BACK_APPROVED)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(반품접수 -> 반품대기중)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		// 반품접수 건만 반품대기중으로 변경
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK))
                		{
                    		//상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                		}
                	}
                }
                
                /** 기존 반품회수지시는 사용하지 않습니다.(2020.06.15)
                // 반품접수 -> 반품회수지시
                else if (toChangeOrderState == Code.OST_BACK_COLLECT_CALL)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(반품접수 -> 반품회수지시)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		String ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX")); //교화 상품 여부
                		// 반품대기중인 건만 반품회수지시
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_APPROVED))
                		{
                    		//상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                        	
                		}
                	}
                }
                */
                
                // 반품대기중 -> 반품회수완료(반품승인)
                else if (toChangeOrderState == Code.OST_BACK_COLLECT_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(반품대기중 -> 반품회수완료(반품승인))");
                    logger.info("=====================================================================================");

                    logger.debug("PARTIAL_BACK_ING_YN================="+PARTIAL_BACK_ING_YN);
                    
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		// 반품대기중인 건만 반품회수완료
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_APPROVED))
                		{
                    		//상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                		}
                	}
                	
                }
                // 반품접수 -> 반품불가 (이전 상태로 원상복귀)
                else if (toChangeOrderState == Code.OST_BACK_CANCEL)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(반품접수/반품접수승인/회수지시/회수완료/반품완료(부분반품인 경우 필요) -> 반품불가)");
                    logger.info("=====================================================================================");
                    
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		// 반품접수/반품접수승인/회수지시/회수완료/반품완료(부분반품인 경우 필요) 건만 반품취소
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK) 
                			|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_APPROVED) 	
                			|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_CALL)	
                			|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_END)
        					|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_END)
                		   )
                		{
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		commandMap.put("ORD_EDI_ORD_NO", pMap.get("ORD_ORD_EDI_ORD_NO"));
                    		
                    		//반품불가
                	    	commandMap.put("ORD_PRD_ORD_STATE",Code.OST_BACK_CANCEL);
                	    	
                	    	//반품불가 상태변경 처리
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//반품불가 변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    		
                	    	//배송완료
                	    	commandMap.put("ORD_PRD_ORD_STATE",Code.OST_SEND_END);
                	    	commandMap.put("ORD_PRD_DSC", "반품취소 후 기존 주문상태 원복");
                    	    
                    		//배송완료 상태변경 처리
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//배송완료 변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                        	
                        	String ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
            				if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
            					// 반품불가 SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
            					
            					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            					smsMap.put("TR_MSG", "[MarketPlant] "+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 요청하신 상품이 반품불가 처리되었습니다. 궁금하신 내용이 있으시면 연락주시기 바랍니다."); 		
            					
            					smsMap = this.sms.sendLongMessage(smsMap);
            				}
                		}
                	}
                }
                // 환불접수 -> 환불완료
                // 환불접수 건만 환불완료 가능!
                else if (toChangeOrderState == Code.OST_REFUND_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(환불접수 -> 환불완료)");
                    logger.info("=====================================================================================");
					
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//환불접수 건만 환불완료
                		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_REFUND))
                		{
                			//주문상품 상태변경
                    		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    		result += defaultDAO.update("Order.updateOrderState", commandMap);
                    		
                    		//변경이력 등록
                        	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                		}
                	}
                }
                // 반품승인 -> 반품완료(erp취소요청)
                // 전체반품완료 / 부분반품 완료 따로 처리할것
                // 개별 반품완료 처리시에는... PG 취소 안한다.
                else if (toChangeOrderState == Code.OST_BACK_END)
                {
                	// 부분반품이면 헤더, 디테일 6번 R로 update
                	// 전체반품이면 헤더, 디테일 8번 R로 update
                	if("Y".equals(PARTIAL_BACK_ING_YN)){
                		if(ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_SERVICE_CD){
                			
                			// ERP 취소요청
                			List<Map<String, Object>> toErpCancelCallPrdList = new ArrayList<Map<String, Object>>();//erp 취소요청할 리스트
                			List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                        	for(Map<String, Object> pMap:pList)
                        	{
                        		if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_END)) {
                        			toErpCancelCallPrdList.add(pMap);
                        		}
                        	}
                			
                			for(Map<String, Object> pMap:toErpCancelCallPrdList)
                        	{
                    			Map<String,Object> erpResultMap = new HashMap<String,Object>();
                        		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                        		int erpResult = 1;
                        		
                        		if(erpResult > 0){
                        			//상세 erp 취소 요청
                        			erpResultMap.put("ORD_PRD_SEQ", StringUtil.getString(pMap.get("ORD_PRD_SEQ")));//라인번호
                            		erpResult = 1;
                        		}
                        		
                        		logger.debug("erpResult=================="+erpResult);
                        		
                        		if(erpResult > 0){
                        			result = erpResult;
                        		}else{//롤백
                        			result = erpResult;
                        			resultMsg = "ERP 취소요청 중 에러 발생";
                        			logger.error(resultMsg);
                        			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        			break;
                        		}
                        	}
                    	}
                	}else{//전체반품인 경우에는 ERP 전체 주문 취소 요청
                		// ERP 임시 테이블 저장 (겟잇나우, 클린킹은 제외)
                    	if(ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_SERVICE_CD){
                    		Map<String,Object> erpResultMap = new HashMap<String,Object>();
                    		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                    		int erpResult = 1;
                    		
                    		if(erpResult > 0){
                    			//상세 erp 취소 요청(라인 번호 없는 경우 전체 R 처리한다)
                        		erpResult = 1;
                    		}
                    		
                    		logger.debug("erpResult=================="+erpResult);
                    		
                    		if(erpResult > 0){
                    			result = erpResult;
                    		}else{//롤백
                    			result = erpResult;
                    			resultMsg = "ERP 취소요청 중 에러 발생";
                    			logger.error(resultMsg);
                    			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    		}
                    	}
                	}
                	
                	
                	logger.debug("PARTIAL_BACK_ING_YN================="+PARTIAL_BACK_ING_YN);
                	
                	String ORIGINAL_ORDER_CANCEL_YN = StringUtil.getString(commandMap.get("ORIGINAL_ORDER_CANCEL_YN"),"N");//재결제 원 주문 반품완료처리 여부
                	
                	logger.debug("ORIGINAL_ORDER_CANCEL_YN================="+ORIGINAL_ORDER_CANCEL_YN);
                	
                	// 재결제 원 주문 반품완료 처리가 아니고,
                	// 부분반품 완료인 경우
                	if("N".equals(ORIGINAL_ORDER_CANCEL_YN) && "Y".equals(PARTIAL_BACK_ING_YN)){
                		logger.info("=====================================================================================");
                		logger.info("Message : 주문 상태변경(반품회수지시(회수완료?) -> 부분 반품완료)");
                		logger.info("=====================================================================================");
                		
                		List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                		for(Map<String, Object> pMap:pList)
                		{
                			// 반품회수완료(반품대기중) 건만 반품완료
                			// 반품회수완료 주문상태 삭제로 인한 수정
                			// 반품회수지시 건만 반품완료
                			/*if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_CALL))*/
                			if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_END))
                			{
                				// ERP 취소 승인이 났는지 체크한다. 승인 안된 경우 반품 완료 불가.
                        		// 리얼 반영 보류
                        		/*Map<String,Object> erpResultMap = new HashMap<String,Object>();
                        		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                        		erpResultMap.put("ORD_PRD_SEQ", StringUtil.getString(pMap.get("ORD_PRD_SEQ")));//라인번호
                        		result = this.erpOrderService.selectErpCancelAcceptedCnt(erpResultMap);*/
                        		
                        		/*if(result == 0){
                        			logger.error("#################### ERP 취소 승인되지 않음. 반품완료처리 불가 ORD_MST_CD : "+ORD_MST_CD+" / ORD_PRD_SEQ : "+ StringUtil.getString(pMap.get("ORD_PRD_SEQ")) +" ###########################");
                        			resultMsg = "ERP 취소 승인되지 않음. 반품완료처리 불가.";
                        			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        			break;
                        		}*/
                        		
                				//상태변경
                				commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                				result += defaultDAO.update("Order.updateOrderState", commandMap);
                				
                				//변경이력 등록
                				defaultDAO.insert("Order.insertOrderHistory",commandMap);
                				
                				//ERP 전송 (취소완료 코드로 전송 2020.06.24)
                				commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                            	logger.info("=====================================================================================");
                            	logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, commandMap).get("RESULT_CODE"));
                            	logger.info("=====================================================================================");
                			}
                		}
                	}else{
                		logger.info("=====================================================================================");
                		logger.info("Message : 주문 상태변경(반품회수완료(erp취소요청) -> 전체 반품완료)");
                		logger.info("=====================================================================================");
                		
                		List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                		List<Map<String, Object>> targetPrdList = new ArrayList<Map<String, Object>>();	//문자,메일 발송 대상 상품 리스트
                		for(Map<String, Object> pMap:pList)
                		{
                			// 반품회수완료 건만 반품완료
                			// 단, 재결제 원 주문 반품완료 처리시에는 배송완료, 구매확정, 반품완료 상품이 타겟이다.
                			boolean isTargetPrd = false;
                			boolean isStockRestore = true; //재고원복해야할 타겟
                			if("Y".equals(ORIGINAL_ORDER_CANCEL_YN)){
                				if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_SEND_END)
                					|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_FIX)
                					|| StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_END))
                    			{
                					isTargetPrd = true;
                					
                					// 재주문시 원 주문 취소인 경우 부분반품한 상품만(현재 상태가 반품완료인 상품) 재고 원복해줘야 한다.
                					// 부분반품하지 않은 상품은 재고 원복하지 않는다.
                					if(StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) != (Code.OST_BACK_END)){
                						isStockRestore = false;
                					}
                    			}
                			}else{
                				if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_END))
                    			{
                					isTargetPrd = true;
                    			}
                			}
                			/*if (StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) == (Code.OST_BACK_COLLECT_CALL))*/
                			if (isTargetPrd)
                			{
                				// ERP 취소 승인이 났는지 체크한다. 승인 안된 경우 반품 완료 불가.
                        		// 리얼 반영 보류
                        		/*Map<String,Object> erpResultMap = new HashMap<String,Object>();
                        		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                        		erpResultMap.put("ORD_PRD_SEQ", StringUtil.getString(pMap.get("ORD_PRD_SEQ")));//라인번호
                        		result = this.erpOrderService.selectErpTotalCancelAcceptedCnt(erpResultMap);*/
                        		
                        		/*if(result == 0){
                        			logger.error("#################### ERP 취소 승인되지 않음. 반품완료처리 불가 ORD_MST_CD : "+ORD_MST_CD+" / ORD_PRD_SEQ : "+ StringUtil.getString(pMap.get("ORD_PRD_SEQ")) +" ###########################");
                        			resultMsg = "ERP 취소 승인되지 않음. 반품완료처리 불가.";
                        			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        			break;
                        		}*/
                        		
                        		// 반품완료인 경우 주문 상태 변경 없다.
                        		// 반품완료가 여기 들어오는 경우는 재결제 원 주문 반품완료 처리시밖에 없다.
                        		
                        		if(StringUtil.getInt(pMap.get("ORD_PRD_ORD_STATE")) != (Code.OST_BACK_END)){
                        			//상태변경
                    				commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                    				result += defaultDAO.update("Order.updateOrderState", commandMap);
                    				
                    				//변경이력 등록
                    				defaultDAO.insert("Order.insertOrderHistory",commandMap);
                        		}
                				
                				// 재고 원복
                            	if(isStockRestore && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD){
                            		Map<String, Object> map_prd = new HashMap<String, Object>();
                        			map_prd.put("ORD_PRD_MST_CD", StringUtil.getString(pMap.get("ORD_PRD_MST_CD"),"")); //ORD_PRD_MST_CD
                        			map_prd.put("ORD_PRD_ORD_CNT", StringUtil.getString(pMap.get("ORD_PRD_ORD_CNT"),"")); //주문수량
                        			
                        			int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(pMap.get("ORD_PRD_OPT_DTL_IDX"));
                					if(ORD_PRD_OPT_DTL_IDX == 0){//옵션 없는 상품 - 마스터 재고 원복
                						this.defaultDAO.update("Order.updatePrdMstStock", pMap);
                					}else{// 옵션 있는 상품 - 옵션 재고 원복
                						this.defaultDAO.update("Order.updatePrdOptStock", pMap);
                					}
                            	}
                				
                				if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
                					//입금 후면 환불접수로 변경(반품은 입금전인 상태가 있을 수 없다. 그러므로 무조건 환불접수.)
                					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_REFUND);
                				}else{//나머지는 환불완료로 변경
                					commandMap.put("ORD_PRD_ORD_STATE", Code.OST_REFUND_END);
                				}
                				
                				//상태변경
                				commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                				result += defaultDAO.update("Order.updateOrderState", commandMap);
                				
                				//변경이력 등록
                				defaultDAO.insert("Order.insertOrderHistory",commandMap);
                				
                				//ERP 전송 (취소완료 코드로 전송 2020.06.24)
                				commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                            	logger.info("=====================================================================================");
                            	logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, commandMap).get("RESULT_CODE"));
                            	logger.info("=====================================================================================");
                				
                				targetPrdList.add(pMap);
                			}
                		}
                		
                		if(result > 0)
                		{
                			// 캐쉬백 사용한 경우 캐쉬백 처리
                    		// 캐쉬백 포인트 사용 이력 
                    		Map<String,Object> cashbagCancelResult = null;
                			commandMap.put("trStatus", "U");//사용 이력
                			Map<String, Object> cashbagUseInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
                			if(cashbagUseInfo != null){//캐쉬백 사용 이력 있는 경우 취소
                				cashbagUseInfo.put("cashbagTrStatus", "N"); // 적립 취소인 경우 X / 사용 취소인 경우 N
                				cashbagUseInfo.put("mgr_txtype", 40);
                				cashbagCancelResult = this.payment.kiccManagePayment(request, cashbagUseInfo);
                				
                				// 2. PAY_MST INSERT
    	            			if(cashbagCancelResult != null){
    	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
    	            				this.paymentService.insertPayMaster(cashbagCancelResult);
    	            			}
    	            			
    	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 결제취소 성공");
                					logger.info("=====================================================================================");
                				}
                				else
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 결제취소시 오류발생-주문상태변경 Rollback.");
                					logger.info("=====================================================================================");
                					
                					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
                					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
                					
                					throw new Exception("ERR_PG");
                				}
                			}
                			
                			// 캐쉬백 포인트 적립 이력 
                			commandMap.put("trStatus", "S");//적립 이력
                			Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
                			if(cashbagSavedInfo != null){//캐쉬백 적립 이력 있는 경우 취소
                				cashbagSavedInfo.put("cashbagTrStatus", "X"); // 적립 취소인 경우 X / 사용 취소인 경우 N
                				cashbagSavedInfo.put("mgr_txtype", 40);
                				cashbagCancelResult = this.payment.kiccManagePayment(request, cashbagSavedInfo);
                				
                				// 2. PAY_MST INSERT
    	            			if(cashbagCancelResult != null){
    	            				cashbagCancelResult.put("ORD_MST_CD", ORD_MST_CD);
    	            				this.paymentService.insertPayMaster(cashbagCancelResult);
    	            			}
    	            			
    	            			if("0000".equals(StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE"))))
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 적립취소 성공");
                					logger.info("=====================================================================================");
                				}
                				else
                				{
                					logger.info("=====================================================================================");
                					logger.info("Message : PG 캐쉬백 적립취소시 오류발생-주문상태변경 Rollback.");
                					logger.info("=====================================================================================");
                					
                					commandMap.put("resultCode", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPCODE")));
                					commandMap.put("resultMsg", StringUtil.getString(cashbagCancelResult.get("PAY_MST_RESPMSG")));
                					
                					throw new Exception("ERR_PG");
                				}
                			}
                			
                			// 결제취소
                			// point 결제 아니고
                			// 가상계좌인 경우 입금대기 상태에서만 pg사 취소 가능
                			// 그외에는 현금 환불 수기 처리.
                			if("Y".equals(pgPayYn)) 
                			{
                				logger.info("=====================================================================================");
                				logger.info("Message : PG 결제 전체 취소 시작");
                				logger.info("=====================================================================================");
                				
                				// PG 연동 취소/환불처리
                				orderPayInfo.put("LGD_RFPHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"))+StringUtil.getString(orderInfo.get("ORD_MST_HP2"))+StringUtil.getString(orderInfo.get("ORD_MST_HP3")));	// 환불요청자 휴대폰번호
                				
                				Map<String,Object> cancelResult = null;
                				
                				boolean isCashReturn = false; //현금환불여부
                				if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW){// 가상계좌 or 에스크로
                					if(ORD_MST_PAY_DT.equals("00000000000000")){
                						if(ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT){
                							orderPayInfo.put("mgr_txtype", 40);
                						}else if(ORD_MST_PAY_TYPE == Code.PAY_ESCROW){
                							orderPayInfo.put("mgr_txtype", 61);
                							orderPayInfo.put("mgr_subtype", "ES02");
                						}
                						cancelResult = this.payment.kiccManagePayment(request, orderPayInfo);
                					}else{
                						logger.info("=====================================================================================");
                						logger.info("Message : 가상계좌 입금완료 주문 - 현금환불 처리");
                						logger.info("=====================================================================================");
                						
                						result = 3;
                						resultMsg = "완료되었습니다.";
                						isCashReturn = true;
                					}
                				}else if(ORD_MST_PAY_TYPE == Code.PAY_CARD || ORD_MST_PAY_TYPE == Code.PAY_FOREIGN_CARD){//신용카드
                					orderPayInfo.put("mgr_txtype", 40);
                					cancelResult = this.payment.kiccCardManagePayment(request, orderPayInfo);
                				}else if(ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT){//계좌이체
                					orderPayInfo.put("mgr_txtype", 40);
                					cancelResult = this.payment.kiccManagePayment(request, orderPayInfo);
                				/*}else if(ORD_MST_PAY_TYPE == Code.PAY_PAYNOW){//페이나우
                					cancelResult = this.payment.lgCancelPayment(request, orderPayInfo);*/
                				}else if(ORD_MST_PAY_TYPE == Code.PAY_KAKAOPAY){//카카오페이
                					cancelResult = this.payment.kakaoCancelPayment(request, orderPayInfo);
                				}
                				
                				// 2. PAY_MST INSERT
                				if(cancelResult != null){
                					this.paymentService.insertPayMaster(cancelResult);
                				}
                				
                				if(!isCashReturn){
                					if("0000".equals(StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE"))))
                					{
                						result = 1;
                						resultMsg = "완료되었습니다.";
                						
                						logger.info("=====================================================================================");
                						logger.info("Message : PG 결제취소 성공");
                						logger.info("=====================================================================================");
                					}
                					else
                					{
                						logger.info("=====================================================================================");
                						logger.info("Message : PG 결제취소시 오류발생-주문상태변경 Rollback.");
                						logger.info("=====================================================================================");
                						
                						commandMap.put("resultCode", StringUtil.getString(cancelResult.get("PAY_MST_RESPCODE")));
                						commandMap.put("resultMsg", StringUtil.getString(cancelResult.get("PAY_MST_RESPMSG")));
                						
                						throw new Exception("ERR_PG");
                					}	
                				}
                			}
                			else
                			{
                				result = 2;
                				logger.info("=====================================================================================");
                				logger.info("Message : 마일리지 only 결제");
                				logger.info("=====================================================================================");
                			}
                		}
                		
                		// 반품완료 메일 발송
                		if (result > 0)
		            	{
                			// 전체반품 완료시에만 메일 발송
                			if(!"Y".equals(PARTIAL_BACK_ING_YN)){
        	            		try{
                    				// 메일 발송시 필요한 정보 가져오기 시작...
                    				
                    				// 주문상품 목록
                    				commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
                    				commandMap.put("ORD_PRD_IDX", "");
                    				commandMap.put("ordPrdIdxs", "");
                    		        List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);//공통 사용 가능
                    		        
                    		        //  상품 옵션 가져오기
                    		 		for(Map<String, Object> ordPrd : orderProductList){
                    		 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
                    		 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
                    		 				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
                    		 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
                    		 			}
                    		 			
                    		 			//서브 옵션 리스트
                    		 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
                    		 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
                    		 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
                    						subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
                    						ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
                    		 			}
                    		 		}
                    		 		
                    		 		// 취소/교환/반품 정보
                             		commandMap.put("targetState", "cancel");
                             		List<Map<String,Object>> cancelInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                             		commandMap.put("targetState", "back");
                             		List<Map<String,Object>> backInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                    		 		
                    		        // 사은품 정보
                    		        List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);//공통 사용 가능
                    		        
                    		        // 배송정보
                    		        Map<String, Object> orderDeliveryInfo2 = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
                    		        
                    		        // 할인/결제정보
                    		        Map<String, Object> orderPayInfo2 = this.pcMyShoppingService.selectOrderPayInfo(commandMap);//공통 사용 가능
                    		        
                    		  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
                    		  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
                    		        String DEFAULT_CASHBAG_CARD_NO = "";
                            		Map<String,Object> getItNowShopInfo = null;
                            		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
                    				if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
                    					commandMap.put("trStatus", "U");//사용 이력
                    					Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
                    					
                    					if(cashbagSavedInfo != null){
                    						DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
                    					}
                    					
                    					// 겟잇나우 주문인 경우 지점 정보 가져오기
                    			 		int ORD_MST_DLV_GBN2 = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
                    			 		if(ORD_MST_DLV_GBN2 == Code.CART_DLV_GBN_GET_IT_NOW_CD){
                    			 			getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
                    			 		}
                    				}
                    				
                    				// 메일 contents 맵
                    	    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
                    	    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
                    	    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
                    	    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
                    	    		mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
                    	    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
                    	    		mailContentsMap.put("cancelInfoList", cancelInfoList);//취소사유정보
                    	    		mailContentsMap.put("backInfoList", backInfoList);//반품사유정보
                    	    		
                    	    		mailContentsMap.put("autoCancelYn", "N"); //입금기한 만료 자동 취소 여부
                    	    		
                    	    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
                        				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
                    	    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
                    	    		}
                    	    		
                    	    		// 주문일 
                    	    		Calendar calendar = Calendar.getInstance();
                    	    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
                    	    		String today = dateformat_text.format(calendar.getTime());
                    	    		mailContentsMap.put("today", today);
                    	    		
                    	    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
                    	    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
                    	    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
                    				
                    	    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
                    	    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
                    	    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
                    				
                    	    		int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
                    	    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
                    	    		int dlvCag = dlvCagTmp - addCag;
                    	    		
                    	    		mailContentsMap.put("dlvCag", dlvCag);
                    				mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
                    				mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
                    				mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
                    				mailContentsMap.put("number", new NumberTool());
                    				
                    	    		//-- 메일본문 정리
                    				String body = VelocityEngineUtils.mergeTemplateIntoString(
                    						velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
                    				body += VelocityEngineUtils.mergeTemplateIntoString(
                    						velocityEngine, "/MAIL-ORDER-BACK-END.vm", "utf-8", mailContentsMap);
                    				body += VelocityEngineUtils.mergeTemplateIntoString(
                    						velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
                    				
                    				//메일 발송용 맵
                    				Map<String, Object> mailMap = new HashMap<String, Object>();
                    				
                    				mailMap.put("MAIL_CODE", "14");	// 이메일 코드
                    	    		mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );		// 수신자 이메일
                    	    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
                    	    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님이 주문하신 상품이 반품되었습니다.");	// 메일 제목
                    	    		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
                    				
                    				this.mail.mailSend(mailMap);
                    			}catch(Exception e){
                    				e.printStackTrace();
                    				logger.error("SMS, EMAIL 발송 중 예외 발생");
                    			}
                			}
		            	}
                		
                		if (result > 0)
		            	{
                			for(Map<String, Object> pMap:targetPrdList)
                    		{
                				String ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
                				if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
                					// 반품완료 SMS 발송
                                	Map<String, Object> smsMap = new HashMap<String, Object>();
                					
                					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
                					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
                					
                					String TR_MSG = StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 반품이 완료되었습니다. 더 좋은 상품으로 찾아뵙겠습니다. "+StringUtil.getString(propertiesService.getString("app.name"),"")+"을 이용해 주셔서 감사드립니다.";
                					if("N".equals(ORIGINAL_ORDER_CANCEL_YN) && "Y".equals(PARTIAL_BACK_ING_YN)){//재주문으로 인한 원주문 반품완료가 아니고, 부분반품완료인 경우
                						TR_MSG = StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 반품이 완료되었습니다. 마이페이지에서 재주문해주시기 바랍니다.";
                        			}
                					
                					smsMap.put("TR_MSG", TR_MSG); 		
                					
                					smsMap = this.sms.sendLongMessage(smsMap);
                        		}
                    		}
		            	}
                		
                	}
                }
                /** ########################################반품 관련 끝########################################### */
                /** ########################################교환 관련 시작########################################### */
                // 교환접수 -> 교환접수승인(미사용)
                else if (toChangeOrderState == Code.OST_SWAP_APPROVED)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환접수 -> 교환접수승인)");
                    logger.info("=====================================================================================");
					
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                }
                // 교환접수승인 -> 교환회수지시
                // 교환접수승인 주문상태 삭제로 인한 수정
                // 교환접수 -> 교환회수지시
                else if (toChangeOrderState == Code.OST_SWAP_COLLECT_CALL)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환접수 -> 교환회수지시)");
                    logger.info("=====================================================================================");
					
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	if(result > 0){
                    		// 택배(MarketPlant)배송인 경우 EDI 회수지시
                    		int ORD_PRD_DLV_TYPE = StringUtil.getInt(pMap.get("ORD_PRD_DLV_TYPE")); //배송구분
                    		if(Code.DLV_TYPE_PARCEL_SGS == ORD_PRD_DLV_TYPE){
                    			logger.debug("##### EDI 회수지시 ######");
                    			Map<String,Object> ediMap = new HashMap<String,Object>();
                    			String ORD_PRD_IDX =  StringUtil.getString(pMap.get("ORD_PRD_IDX"));
                    			String ORD_PRD_SYS_SGS =  StringUtil.getString(pMap.get("ORD_PRD_SYS_SGS"));
                        		//String ORD_PRD_DLV_DUE_DT = StringUtil.getString(pMap.get("ORD_PRD_DLV_DUE_DT"));
                    			
                    			ediMap.put("ORD_MST_CD", ORD_MST_CD);
                    			ediMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
                    			ediMap.put("ORD_PRD_SYS_SGS", ORD_PRD_SYS_SGS);
                    			ediMap = null;
                    			
                    			if(!"0".equals(StringUtil.getString(ediMap.get("resultCode")))){
                    				result = -999;
                        			resultMsg = StringUtil.getString(ediMap.get("resultMsg"));
                        			logger.error(resultMsg);
                        			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                        			break;
                    			}
                    		}
                    	}
                    	
                    	if(result > 0){
                    		String ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
            				if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
            					// 교환회수지시 SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
            					
            					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            					smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 교환 신청이 접수되었습니다. 상품회수를 위한 방문예정입니다.담당자가 교환신청상품을 확인하여 빠른 시간안에 연락드리도록 하겠습니다. 불편을 드려 죄송합니다."); 		
            					
            					smsMap = this.sms.sendLongMessage(smsMap);
            				}
                    	}
                	}
                }
                // 교환회수지시 -> 교환회수완료
                else if (toChangeOrderState == Code.OST_SWAP_COLLECT_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환회수지시 -> 교환회수완료)");
                    logger.info("=====================================================================================");
					
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	// ERP 취소요청
                    	if(ORD_MST_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD && ORD_MST_DLV_GBN != Code.CART_DLV_GBN_SERVICE_CD){
                    		Map<String,Object> erpResultMap = new HashMap<String,Object>();
                    		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                    		erpResultMap.put("E1FLG6", "E");//교환은 R이 아닌 E가 들어간다.
                    		int erpResult = 1;
                    		
                    		if(erpResult > 0){
                    			erpResultMap.put("ORD_PRD_SEQ", StringUtil.getString(pMap.get("ORD_PRD_SEQ")));//라인번호
                        		erpResult = 1;
                    		}
                    		
                    		logger.debug("erpResult=================="+erpResult);
                    		
                    		if(erpResult > 0){
                    			result = erpResult;
                    		}else{//롤백
                    			result = erpResult;
                    			resultMsg = "ERP 취소요청 중 에러 발생";
                    			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    			break;
                    		}
                    	}
                	}
                }
                // 교환회수완료 -> 교환상품배송(교환배송중)
                else if (toChangeOrderState == Code.OST_SWAP_SEND)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환회수완료 -> 교환상품배송/교환배송중)");
                    logger.info("=====================================================================================");
					
                    String ORD_PRD_ORG_IDX = "0";
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	//ERP 전송 (취소완료 코드로 전송 2020.06.24)
        				commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
                    	logger.info("=====================================================================================");
                    	logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, commandMap).get("RESULT_CODE"));
                    	logger.info("=====================================================================================");
                	}
                	
                	if(result > 0){
                		//  교환대상 새상품을 교환상품준비중으로 변경한다.
                    	// 배송구분, 출고처, 배송처는 ERP에서 수정한다.
                    	// ERP에서 수정한 정보를 우리 DB로 반영하는 거는 확인 필요함...
                    	String NEW_ORD_PRD_IDX = this.defaultDAO.selectStr("Order.selectNewSwapProduct", commandMap); //신규상품 IDX 가져오기
                    	commandMap.put("ORD_PRD_IDX", NEW_ORD_PRD_IDX);
                    	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_TARGET_COLLECT_END);// 주문 상태 : 교환상품준비중
                    	result = defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                		//commandMap.put("ORD_PRD_DSC", "기존상품 교환완료 처리 후 배송준비중 변경");
                    	result = defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	if(result > 0){
            				if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
            					// 교환배송중 SMS 발송
                            	Map<String, Object> smsMap = new HashMap<String, Object>();
            					
            					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
            					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
            					smsMap.put("TR_MSG", "[MarketPlant] "+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 교환이 완료되어 교환상품발송을 준비중입니다. 궁금하신 내용이 있으시면 연락주시기 바랍니다."); 		
            					
            					smsMap = this.sms.sendLongMessage(smsMap);
            				}
                    	}
                	}
                }
                
                // 교환접수 -> 교환불가
                else if (toChangeOrderState == Code.OST_SWAP_CANCEL)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환접수 -> 교환불가)");
                    logger.info("=====================================================================================");

                    String ORD_PRD_ORG_IDX = "0";
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX"));//교환상품여부
                		//1. 기존상품 교환불가 처리
                		// 교환불가
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	//2. 기존상품 배송완료로 돌려놓는다.
                    	// 원래는 배송완료로 돌려놓는 것이지만....
                    	// 주문확정후 취소하고 싶을때도 교환신청을 받을 수 있게 바뀌어서....
                    	// 배송준비중 OR 배송완료로 돌려놓는 것으로 수정한다..........
                    	int sendEndHisCnt = this.defaultDAO.selectCount("Order.selectOrdPrdHisSendEndCnt", commandMap);
                    	
                    	if(sendEndHisCnt > 0){//배송완료 이력이 있는 경우
                    		// 배송완료
                	    	commandMap.put("ORD_PRD_ORD_STATE",Code.OST_SEND_END);
                    	}else{
                    		// 배송준비중
                	    	commandMap.put("ORD_PRD_ORD_STATE",Code.OST_SEND_READY);
                    	}
            	    	result += defaultDAO.update("Order.updateOrderState", commandMap);
            	    	
            	    	commandMap.put("ORD_PRD_DSC", "교환불가 후 기존 주문상태 원복");
            	    	//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                	
                	// 5. 신규상품 상태(교환취소 변경)
                	String NEW_ORD_PRD_IDX = this.defaultDAO.selectStr("Order.selectNewSwapProduct", commandMap); //신규상품 IDX 가져오기
                	commandMap.put("ORD_PRD_IDX", NEW_ORD_PRD_IDX);
            		commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_READY_CANCEL);// 주문 상태 : 교환취소
                	result = defaultDAO.update("Order.updateOrderState", commandMap);
                	
                	// 6. ORD_PRD_HISORY 등록    	
                	result = defaultDAO.insert("Order.insertOrderHistory", commandMap);
                	
                	if(result > 0){
                		if("".equals(ORD_PRD_ORG_IDX)){//교환상품 아닌 경우에만 발송
                			// 교환불가 SMS 발송
                        	Map<String, Object> smsMap = new HashMap<String, Object>();
        					
        					smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
        					smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
        					smsMap.put("TR_MSG", "[MarketPlant] "+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 요청하신 상품이 교환불가 처리되었습니다. 궁금하신 내용이 있으시면 연락주시기 바랍니다."); 		
        					
        					smsMap = this.sms.sendLongMessage(smsMap);
                		}
                	}
                }
                // 교환접수 -> 교환완료(새 상품 교환완료 처리 후 기존 상품도 교환 완료 처리)
                else if (toChangeOrderState == Code.OST_SWAP_SEND_END)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(교환접수 -> 교환완료)");
                    logger.info("=====================================================================================");
					
                    String ORD_PRD_ORG_IDX = "0";
                    
                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		ORD_PRD_ORG_IDX = StringUtil.getString(pMap.get("ORD_PRD_ORG_IDX")); // 기존 상품 주문번호
                		// ERP 취소 승인이 났는지 체크한다. 승인 안된 경우 교환 완료 불가.
                		// 리얼 반영 보류
                		/*Map<String,Object> erpResultMap = new HashMap<String,Object>();
                		erpResultMap.put("ORD_MST_CD", ORD_MST_CD);
                		erpResultMap.put("ORD_PRD_SEQ", StringUtil.getString(pMap.get("ORD_PRD_SEQ")));//라인번호
                		result = this.erpOrderService.selectErpCancelAcceptedCnt(erpResultMap);*/
                		
                		/*if(result == 0){
                			logger.error("#################### ERP 취소 승인되지 않음. 교환완료 처리 불가 ORD_MST_CD : "+ORD_MST_CD+" / ORD_PRD_SEQ : "+ StringUtil.getString(pMap.get("ORD_PRD_SEQ")) +" ###########################");
                			resultMsg = "ERP 취소 승인되지 않음. 교환완료 처리 불가.";
                			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                			break;
                		}*/
                		
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                    	
                    	//ERP 전송 (새 상품을 교환완료 코드로 전송 2020.06.24)
                    	logger.info("=====================================================================================");
                    	logger.info("ERP 전송 결과 코드 : " + orderErpApiService.orderErpApiTrans(request, commandMap).get("RESULT_CODE"));
                    	logger.info("=====================================================================================");
                	}
                	
                	if(result > 0) {
                		// 기존 상품을 교환완료상태로 변경
                		commandMap.put("ORD_PRD_IDX", ORD_PRD_ORG_IDX);
                		commandMap.put("ORD_PRD_ORD_STATE",Code.OST_SWAP_END);
                		defaultDAO.insert("Order.insertOrderHistory",commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                	
                }
                /** ########################################교환 관련 끝########################################### */
                /** ######################################## 클린킹 시작 ########################################### */
                // 예약상담신청 -> 예약상담취소
                else if (toChangeOrderState == Code.OST_CLEANKING_CANCEL)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(예약상담신청 -> 예약상담취소)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                	
                	// 취소완료 메일 발송
                	if (result > 0)
	            	{
	            		try{
            				// 메일 발송시 필요한 정보 가져오기 시작...
            				
            				// 주문상품 목록
            				commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
            				commandMap.put("ORD_PRD_IDX", "");
            				commandMap.put("ordPrdIdxs", "");
            		        List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);//공통 사용 가능
            		        
            		        //  상품 옵션 가져오기
            		 		for(Map<String, Object> ordPrd : orderProductList){
            		 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
            		 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
            		 				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
            		 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
            		 			}
            		 			
            		 			//서브 옵션 리스트
            		 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
            		 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
            		 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
            						subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
            						ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
            		 			}
            		 		}
            		 		
            		 		// 취소/교환/반품 정보
                     		commandMap.put("targetState", "cancel");
                     		List<Map<String,Object>> cancelInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
                     		commandMap.put("targetState", "back");
                     		List<Map<String,Object>> backInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
            		 		
            		        // 사은품 정보
            		        List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);//공통 사용 가능
            		        
            		        // 배송정보
            		        Map<String, Object> orderDeliveryInfo2 = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
            		        
            		        // 할인/결제정보
            		        Map<String, Object> orderPayInfo2 = this.pcMyShoppingService.selectOrderPayInfo(commandMap);//공통 사용 가능
            		        
            		  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
            		  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
            		        String DEFAULT_CASHBAG_CARD_NO = "";
                    		Map<String,Object> getItNowShopInfo = null;
                    		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_ID"));
            				if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
            					commandMap.put("trStatus", "U");//사용 이력
            					Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
            					
            					if(cashbagSavedInfo != null){
            						DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
            					}
            					
            					// 겟잇나우 주문인 경우 지점 정보 가져오기
            			 		int ORD_MST_DLV_GBN2 = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_GBN"));
            			 		if(ORD_MST_DLV_GBN2 == Code.CART_DLV_GBN_GET_IT_NOW_CD){
            			 			getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
            			 		}
            				}
            				
            				// 메일 contents 맵
            	    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
            	    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo2);//배송지정보
            	    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
            	    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
            	    		mailContentsMap.put("orderPayInfo", orderPayInfo2);//주문결제정보
            	    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
            	    		mailContentsMap.put("cancelInfoList", cancelInfoList);//취소사유정보
            	    		mailContentsMap.put("backInfoList", backInfoList);//반품사유정보
            	    		
            	    		mailContentsMap.put("autoCancelYn", "N"); //입금기한 만료 자동 취소 여부
            	    		
            	    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
                				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
            	    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
            	    		}
            	    		
            	    		// 주문일 
            	    		Calendar calendar = Calendar.getInstance();
            	    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
            	    		String today = dateformat_text.format(calendar.getTime());
            	    		mailContentsMap.put("today", today);
            	    		
            	    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
            	    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo2.get("ORD_MST_CD")));//주문 번호
            	    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
            				
            	    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
            	    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
            	    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
            				
            	    		int dlvCagTmp = StringUtil.getInt(orderPayInfo2.get("ORD_MST_DLV_CAG"));
            	    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
            	    		int dlvCag = dlvCagTmp - addCag;
            	    		
            	    		mailContentsMap.put("dlvCag", dlvCag);
            				mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
            				mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
            				mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
            				mailContentsMap.put("number", new NumberTool());
            				
            	    		//-- 메일본문 정리
            				String body = VelocityEngineUtils.mergeTemplateIntoString(
            						velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
            				body += VelocityEngineUtils.mergeTemplateIntoString(
            						velocityEngine, "/MAIL-ORDER-CANCEL.vm", "utf-8", mailContentsMap);
            				body += VelocityEngineUtils.mergeTemplateIntoString(
            						velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
            				
            				//메일 발송용 맵
            				Map<String, Object> mailMap = new HashMap<String, Object>();
            				
            				mailMap.put("MAIL_CODE", "13");	// 이메일 코드
            	    		mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo2.get("ORD_MST_MAIL")) );		// 수신자 이메일
            	    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM"))));			// 수신자 이름
            	    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo2.get("ORD_MST_ORD_NM")))  + "님의 상담예약이 취소되었습니다. ");	// 메일 제목
            	    		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
            				
            				this.mail.mailSend(mailMap);
            				
            				// SMS 발송
                        	Map<String, Object> smsMap = new HashMap<String, Object>();
            				
            				smsMap.put("TR_PHONE", StringUtil.getString(orderPayInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderPayInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderPayInfo.get("ORD_MST_HP3"), ""));  
            				smsMap.put("TR_NAME", StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"), ""));  		
            				
            				smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"), "") +"님, 상담예약이 취소되었습니다. 더 좋은 상품으로 찾아뵙겠습니다. "+StringUtil.getString(propertiesService.getString("app.name"),"")+"을 이용해 주셔서 감사드립니다."); 		
            				
            				smsMap = this.sms.sendLongMessage(smsMap);
            			}catch(Exception e){
            				e.printStackTrace();
            				logger.error("SMS, EMAIL 발송 중 예외 발생");
            			}
	            	}
                }
                // 예약상담신청 -> 예약상담확정
                else if (toChangeOrderState == Code.OST_CLEANKING_CONFIRM)
                {
                    logger.info("=====================================================================================");
                    logger.info("Message : 주문 상태변경(예약상담신청 -> 예약상담확정)");
                    logger.info("=====================================================================================");

                    List<Map<String, Object>> pList = defaultDAO.selectList("Order.selectOrderStateList",commandMap);
                	for(Map<String, Object> pMap:pList)
                	{
                		//상태변경
                		commandMap.put("ORD_PRD_IDX", pMap.get("ORD_PRD_IDX"));
                		result += defaultDAO.update("Order.updateOrderState", commandMap);
                		
                		//변경이력 등록
                    	defaultDAO.insert("Order.insertOrderHistory",commandMap);
                	}
                }
                /** ######################################## 클린킹 끝 ########################################### */
        	}
        }

        logger.info("=====================================================================================");
        logger.info("Message : 주문 상태변경 End.");
        logger.info("=====================================================================================");

        resultMap.put("result", result);
        resultMap.put("resultCode", resultCode);
        resultMap.put("resultMsg", resultMsg);
        
        return resultMap;
    }

    private void pointBack(Map<String, Object> orderPayInfo, HttpServletRequest request) {
    	Map<String, Object> pointMap = new HashMap<String, Object>();
    	pointMap.put("PIT_MST_GBN", "P");     // 적립 코드 
    	pointMap.put("PIT_MST_BRK_DWN", StringUtil.getString(Code.EACH_CANCEL_POINT_TYPE));      // 부분취소 적립 코드 
    	pointMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
    	pointMap.put("PIT_MST_REG_ID", orderPayInfo.get("ORD_MST_ORD_ID"));
    	pointMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
    	pointMap.put("MEM_PIT_REG_ID", orderPayInfo.get("ORD_MST_ORD_ID"));
    	pointMap.put("MEM_PIT_MEM_ID", orderPayInfo.get("ORD_MST_ORD_ID"));
    	
    	// 사용한 E포인트
    	int ORD_PRD_DC_PIT = StringUtil.getInt(orderPayInfo.get("ORD_MST_DC_PIT"));
    	// 사용한 통합포인트
    	int ORD_PRD_DC_TOT_PIT = StringUtil.getInt(orderPayInfo.get("ORD_PRD_DC_TOT_PIT"));
    	// 사용한 임직원포인트
    	int ORD_PRD_DC_SW_PIT = StringUtil.getInt(orderPayInfo.get("ORD_PRD_DC_SW_PIT"));
    	
    	try {
    		// E포인트 원복
	        if(ORD_PRD_DC_PIT > 0){
	        	pointMap.put("PIT_MST_PIT", ORD_PRD_DC_PIT);
					pcEventMainService.insertPoint(request, pointMap);
	        }
	        // 통합포인트 원복
	        if(ORD_PRD_DC_TOT_PIT > 0){
	        	pointMap.put("PIT_MST_PIT", ORD_PRD_DC_TOT_PIT);
	            pcEventMainService.insertTotPoint(request, pointMap);
	        }
	        // 임직원포인트 원복
	        if(ORD_PRD_DC_SW_PIT > 0){
	        	pointMap.put("PIT_MST_PIT", ORD_PRD_DC_SW_PIT);
	            //this.pcEventMainService.insertSwPoint(request, pointMap); // 임직원포인트 테이블 작업 후 적용
	        }
    	} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
    * <pre>
    * 1. MethodName : selectChangeOrderProductView
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 관리자 > 주문관리 > 주문 상세 > 교환접수 팝업
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 10. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectChangeOrderProductView(Map<String, Object> commandMap) throws Exception {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	 // 주문정보
    	Map<String, Object> orderInfo = defaultDAO.select("Order.selectOrderInfo", commandMap);
    	resultMap.put("orderInfo", orderInfo);
    	
    	// 주문상품 정보    	
    	commandMap.put("OST_SWAP_READY", Code.OST_SWAP_READY);//교환접수 시간을 가져오기 위해 추가
    	commandMap.put("OST_BACK_CANCEL", Code.OST_BACK_CANCEL);//반품불가
		List<Map<String, Object>> changeOrderProductInfo = defaultDAO.selectList("Order.selectChangeOrderProductInfo",commandMap);
		commandMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
		resultMap.put("changeOrderProductInfo", changeOrderProductInfo);
		
		for(Map<String, Object> mapData : changeOrderProductInfo) {
			// 사이즈정보
			List<Map<String, Object>> sizeList = defaultDAO.selectList("Order.selectSizeList", mapData);
			mapData.put("sizeList", sizeList);
		}
    	
    	 // 주문정보
    	Map<String, Object> postInfo = defaultDAO.select("Order.selectDeliveryInfo", commandMap);
    	resultMap.put("postInfo", postInfo);
    	
    	// 택배사목록
    	List<Map<String, Object>> dlvCpnList = defaultDAO.selectList("Order.selectDlvCpnList", commandMap);
    	resultMap.put("dlvCpnList", dlvCpnList);
    	
    	return resultMap;
    }
    
     @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSizeList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("Order.selectSizeList",commandMap);
    }
    	
    	
    /**
    * <pre>
    * 1. MethodName : insertChangeOrderProduct
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 관리자 > 주문관리 > 주문 상세 > 교환접수 등록
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 10. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public String insertChangeOrderProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	String resultCode = "99";
    	int result = 0;
    	
    	// 배송준비중에 신청했다면 이것은 ERP 상품 교체이다.... 
    	// 그러므로 이것은 주문상태를 교환접수가 아닌 교환회수완료로 바로 돌려놓고 ERP 취소요청을 해야 하는 것이다....
    	// 현재 상품의 주문상태를 체크함으로써.... 이것을 구분한다.... 배송완료라면 교환접수, 배송준비중이라면 교환회수완료로 바꾸는 것이다.....
    	Map<String, Object> orgPrdMap = new HashMap<String,Object>();
    	orgPrdMap.put("ORD_MST_CD", commandMap.get("ORD_MST_CD"));
    	orgPrdMap.put("ORD_PRD_IDX", commandMap.get("ORD_PRD_ORG_IDX"));
    	Map<String, Object> prdInfo = this.defaultDAO.select("Order.selectOrdPrdInfo", orgPrdMap);
    	
    	if(!prdInfo.isEmpty()){
    		int ORG_ORD_PRD_ORD_STATE = StringUtil.getInt(prdInfo.get("ORD_PRD_ORD_STATE")); //기존 상품 주문 상태
    		int ORG_ORD_PRD_DLV_TYPE = StringUtil.getInt(prdInfo.get("ORD_PRD_DLV_TYPE")); //기존 상품 배송 형태
    		
    		if(Code.OST_SEND_READY == ORG_ORD_PRD_ORD_STATE){//배송준비중이었던 경우
    			commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_COLLECT_END);	//주문상태 교환상품회수완료~~!!!
    		}else{//그 외에는.. 배송완료라고 가정하고 진행
    			commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP);	//주문상태 (교환접수)    	
    		}
    		
    		// 1. 기존 상품 주문상태 변경
        	commandMap.put("ORD_PRD_IDX", commandMap.get("ORD_PRD_ORG_IDX")); //기존상품 idx
        	this.defaultDAO.insert("Order.updateOrderState", commandMap);
        	
        	//변경이력 등록
        	this.defaultDAO.insert("Order.insertOrderHistory",commandMap);
        	
        	// 2. ORD_PRD 등록(교환 상품)
        	if(Code.DLV_TYPE_PARTNER == ORG_ORD_PRD_DLV_TYPE){
        		commandMap.put("isPartnerDlv", "Y");
        	}
        	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_READY);	//주문상태 (교환대기)    	
        	commandMap.put("DLV_TYPE_PARTNER", Code.DLV_TYPE_PARTNER);  //입점업체배송
        	this.defaultDAO.insert("Order.insertChangeOrderProduct", commandMap);
        	
        	// 교환 상품 ORD_PRD 인덱스
        	String NEW_ORD_PRD_IDX = StringUtil.getString(commandMap.get("NEW_ORD_PRD_IDX"),"");
        	logger.info("================교환상품 ORD_PRD_IDX========================="+NEW_ORD_PRD_IDX);
        	
        	// 3.ORD_PICKUP(수거지 등록)
        	String changeProduct = (String) commandMap.get("changeProduct");
        	if("A".equals(changeProduct)) {
        		this.defaultDAO.insert("Order.insertPickup", commandMap);
        	}
        	
        	// 4.ORD_DLV(배송지 업데이트)
        	this.defaultDAO.insert("Order.updateDeliveryInfo", commandMap);
        	
        	if(!("").equals(NEW_ORD_PRD_IDX)){
        		commandMap.put("ORD_PRD_IDX", NEW_ORD_PRD_IDX);//새로운 주문 상품 INDEX를 ORD_PRD_IDX로 담는다.
        		
        		//2. ORD_PRD_HISTORY 등록
            	result = this.defaultDAO.insert("Order.insertOrderHistory", commandMap);
            	
            	if(result > 0){
            	    resultCode = "00";
            	}else{
            		logger.info("========================================================================================================");
    				logger.info("Message : ORD_PRD_HISTORY INSERT 실패");
    				logger.info("========================================================================================================");
            	}
        	}else{
        		logger.info("========================================================================================================");
        		logger.info("Message : T_ORD_PRD INSERT 실패)");
        		logger.info("========================================================================================================");
        	}
    	}
    	
    	
    	
    	if(resultCode != "00"){
    		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    	}
    	
    	return resultCode;
    }
    
    // 사용자.MYPAGE.교환접수 - 다수 상품 선택한 경우가 포함됨
    public String insertChangeOrderProduct2(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	String resultCode = "99";
    	int result = 0;
    	String ORD_PRD_IDX = null;
    	String ORD_PRD_SIZE = null;
    	boolean isFirst = true;
    	
       	for(int i=1; i<=StringUtil.getInt(commandMap.get("recordCnt"), 0); i++) {
       		ORD_PRD_IDX = (String) commandMap.get("ORD_PRD_IDX"+i);
       		ORD_PRD_SIZE = (String) commandMap.get("ORD_PRD_SIZE"+i);
       		if(ORD_PRD_IDX != null) {
       			//logger.debug("ORD_PRD_IDX"+i+":"+commandMap.get("ORD_PRD_IDX"+i));
       			commandMap.put("ORD_PRD_IDX", ORD_PRD_IDX);
       			commandMap.put("ORD_PRD_SIZE", ORD_PRD_SIZE);
       			
       			Map<String, Object> orgPrdMap = new HashMap<String,Object>();
       	    	orgPrdMap.put("ORD_MST_CD", commandMap.get("ORD_MST_CD"));
       	    	//orgPrdMap.put("ORD_PRD_IDX", commandMap.get("ORD_PRD_ORG_IDX"));
       	    	orgPrdMap.put("ORD_PRD_IDX", commandMap.get("ORD_PRD_IDX"));
       	    	Map<String, Object> prdInfo = this.defaultDAO.select("Order.selectOrdPrdInfo", orgPrdMap);
       	  	
       	    	if(!prdInfo.isEmpty()){
       	    		int ORG_ORD_PRD_ORD_STATE = StringUtil.getInt(prdInfo.get("ORD_PRD_ORD_STATE")); //기존 상품 주문 상태
       	    		int ORG_ORD_PRD_DLV_TYPE = StringUtil.getInt(prdInfo.get("ORD_PRD_DLV_TYPE")); //기존 상품 배송 형태
       	    		
       	    		if(Code.OST_SEND_READY == ORG_ORD_PRD_ORD_STATE){//배송준비중이었던 경우
       	    			commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_COLLECT_END);	//주문상태 교환상품회수완료~~!!!
       	    		}else{//그 외에는.. 배송완료라고 가정하고 진행
       	    			commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP);	//주문상태 (교환접수)    	
       	    		}
       	    		
       	    		// 1. 기존 상품 주문상태 변경
       	        	this.defaultDAO.insert("Order.updateOrderState", commandMap);
       	        	
       	        	//변경이력 등록
       	        	this.defaultDAO.insert("Order.insertOrderHistory",commandMap);
       	        	
       	        	// 2. ORD_PRD 등록(교환 상품)
       	        	if(Code.DLV_TYPE_PARTNER == ORG_ORD_PRD_DLV_TYPE){
       	        		commandMap.put("isPartnerDlv", "Y");
       	        	}
       	        	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SWAP_READY);	//주문상태 (교환대기)    	
       	        	commandMap.put("DLV_TYPE_PARTNER", Code.DLV_TYPE_PARTNER);  //입점업체배송
       	        	this.defaultDAO.insert("Order.insertChangeOrderProduct", commandMap);
       	        	
       	        	// 교환 상품 ORD_PRD 인덱스
       	        	String NEW_ORD_PRD_IDX = StringUtil.getString(commandMap.get("NEW_ORD_PRD_IDX"),"");
       	        	logger.info("================교환상품 ORD_PRD_IDX========================="+NEW_ORD_PRD_IDX);
       	        	
       	        	if(isFirst == true) {
	       	        	// 3.ORD_PICKUP(수거지 등록)
	       	        	String changeProduct = (String) commandMap.get("changeProduct");
	       	        	if("A".equals(changeProduct)) {
	       	        		this.defaultDAO.insert("Order.insertPickup", commandMap);
	       	        	}
	       	        	
	       	        	// 4.ORD_DLV(배송지 업데이트)
	       	        	this.defaultDAO.update("Order.updateDeliveryInfo", commandMap);
	       	        	
	       	        	//5. 교환쿠폰사용 등록
	       	        	if(commandMap.get("payment").equals("C") && commandMap.get("useCoupon") != null) {
	       	        		defaultDAO.insert("Order.updateCouponUse", commandMap);
	       	        		commandMap.put("CPN_MEM_IDX", commandMap.get("useCoupon"));
	       	        		commandMap.put("ORD_CPN_DC_AMT", 0);
	       	        		defaultDAO.insert("PcCart.insertOrdCpn", commandMap);
	       	        	}
	       	        	
	       	        	isFirst = false;
       	        	}
       	        	if(!("").equals(NEW_ORD_PRD_IDX)){
       	        		commandMap.put("ORD_PRD_IDX", NEW_ORD_PRD_IDX);//새로운 주문 상품 INDEX를 ORD_PRD_IDX로 담는다.
       	        		
       	        		//2. ORD_PRD_HISTORY 등록
       	            	result = this.defaultDAO.insert("Order.insertOrderHistory", commandMap);
       	            	
       	            	if(result > 0){
       	            	    resultCode = "00";
       	            	}else{
       	            		logger.info("========================================================================================================");
       	    				logger.info("Message : ORD_PRD_HISTORY INSERT 실패");
       	    				logger.info("========================================================================================================");
       	            	}
       	        	}else{
       	        		logger.info("========================================================================================================");
       	        		logger.info("Message : T_ORD_PRD INSERT 실패)");
       	        		logger.info("========================================================================================================");
       	        	}
       	    	}
       	    	if(resultCode != "00"){
       	    		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
       	    	}
       	    	//return resultCode;
       		}
    	}

    	return resultCode;
    }
    
    /**
     * <PRE>
     * 1.MethodName : selectOrderPrdList
     * 3.Comment:		주문API
     * 4.작성자:			허평강
     * 5.작성일:			2020.06.11
     * </PRE>
     * 
     */
    public JSON selectOrderPrdList(Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
    	int coGubun = 0;
    	String usrGubun = null;
    	List<Map<String,Object>> list = defaultDAO.selectList("Order.selectOrderPrdList",commandMap);
    	for(int i=0; i<list.size(); i++) {
    		Map map = list.get(i);
    		if(map.get("VDR_MST_NM").equals("VIKY")) {
    			coGubun = 1; //자사상품
    		} else {
    			coGubun = 2; //타사 상품
    		}
    		json.put("DIV",coGubun);
    		json.put("ORDER_NO", (String)map.get("ORD_MST_CD"));
    		json.put("ORDER_DETAIL_NO","1");
    		json.put("ORDER_SEQ", (String)map.get("ORD_PRD_SEQ"));
    		if(map.get("ORD_MST_ORD_ID").equals("_GUEST_")) {
    			usrGubun = "X"; //비회원
    		} else if(map.get("MEM_MST_MEM_GBN_NM").equals("일반회원")) {
    			usrGubun = "A";	
    		} //임직원, 협력업체 케이스 남았음
    		json.put("ORDER_TYPE",usrGubun);
    		json.put("O2O_GB", (String)map.get("PRD_MST_O2O_YN"));
    		json.put("ORDER_STEP","P"); //결재완료
    		json.put("ORDER_DATE", (String)map.get("ORD_MST_ORD_DATE"));
    		json.put("STYLE_NO", (String)map.get("PRD_MST_CD")); //품번
    		json.put("SEASON_YEAR", (String)map.get("PRD_MST_YEAR")); //시즌년도
    		json.put("COLOR_CODE", (String)map.get("ORD_PRD_COLOR_NM"));
    		json.put("SIZE_CODE", (String)map.get("ORD_PRD_SIZE_NM"));
    	}
    	return json;
    	
    }
    
    /**
	 * 
	 * <pre>
	 * 1. MethodName	: selectOrderCstCount
	 * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문상세 > 상담내용
	 * 4. 작성자			: 이미정
	 * 5. 작성일			: 2014. 11. 06.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectOrderCstCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Order.selectOrderCstCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOtherOrderCstCount
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 해당 주문자의 다른 주문 상담 내역 리스트 개수 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectOtherOrderCstCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Order.selectOtherOrderCstCount",commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectOrderCstList
     * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문상세 > 상담내용
	 * 4. 작성자			: 이미정
	 * 5. 작성일			: 2014. 11. 06.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderCstList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("Order.selectOrderCstList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOtherOrderCstList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 해당 주문자의 다른 주문 상담 내역 리스트
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOtherOrderCstList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("Order.selectOtherOrderCstList",commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: insertOrderCst
     * 2. ClassName		: OrderServiceImpl.java
     * 3. Comment    	: 관리자 > 주문관리 > 주문상세 > 상담내용
	 * 4. 작성자			: 이미정
	 * 5. 작성일			: 2014. 11. 06.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public int insertOrderCst(Map<String, Object> commandMap) throws Exception 
    {
        return this.defaultDAO.insert("Order.insertOrderCst", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateRefBankAccount
    * 2. ClassName  : OrderServiceImpl.java
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
    public int updateRefBankAccount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.update("Order.updateRefBankAccount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertInvoiceNo
    * 2. ClassName  : OrderServiceImpl.java
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
    @SuppressWarnings("unchecked")
	public Map<String, Object> insertInvoiceNo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	Map<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		logger.info("=====================================================================================");
        logger.info("Message : 송장번호 입력 Start.");
        logger.info("=====================================================================================");
    	
        // 배송구분 체크
        Map<String,Object> ordPrdDlvTypeInfo = this.defaultDAO.select("Order.selectOrdPrdDlvTypeInfo", commandMap);
        int dlvType = StringUtil.getInt(ordPrdDlvTypeInfo.get("ORD_PRD_DLV_TYPE"));
        String ORD_PRD_SLT_YN = StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_SLT_YN"));//선택상품여부
        String ORD_PRD_ORG_IDX = StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_ORG_IDX"));//교환상품여부
        
        // TODO 입점업체 배송인 경우에만 배송중으로 update
        // 버튼 자체를 노출하지 않는 것으로 변경. 테스트를 위해 주석 처리
        //if(dlvType == Code.DLV_TYPE_PARTNER){
        	// 주문 상태 = 배송중
            commandMap.put("ORD_PRD_ORD_STATE", Code.OST_SEND);
        //}
        
		// 송장번호 입력
        if ( this.defaultDAO.update("Order.updateOrdPrdInvoiceNo", commandMap) > 0 )
		{
        	resultMsg = "처리되었습니다.";
        	
        		//주문상태 History 등록
                 result = defaultDAO.insert("Order.insertOrderHistory",commandMap);
                 
              // 입점배송인 경우 ERP UPDATE 필요
              if(dlvType == Code.DLV_TYPE_PARTNER){
            	    // ERP 출고일 UPDATE
	     			Map<String,Object> erpMap = new HashMap<String,Object>();
	     			erpMap.put("ORD_ORD_MST_CD", StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_ORD_MST_CD"),""));//주문번호
	     			erpMap.put("ORD_PRD_SEQ", StringUtil.getString(ordPrdDlvTypeInfo.get("ORD_PRD_SEQ"),""));//라인번호
	     			int erpResult = 1;
	     			
	     			if(erpResult == 0){
	         			logger.error("############### ERP 출고일 업데이트 에러 #################");
	         			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	         			result = -999;
	     			}else{
	     				result = erpResult;
	     			}
        	 }
			
			if(result > 0){
				//마스터 상품/교환 상품 아닌 경우만 메일 / LMS 발송
				if("N".equals(ORD_PRD_SLT_YN) && "".equals(ORD_PRD_ORG_IDX)){
					// 주문정보
					Map<String, Object> orderInfo = defaultDAO.select("Order.selectOrderInfo", commandMap);
					
					int ORD_MST_DLV_GBN = StringUtil.getInt(orderInfo.get("ORD_MST_DLV_GBN"));//상품배송유형
					
					// 겟잇나우/클린킹은 제외하고 발송
					if(Code.CART_DLV_GBN_GET_IT_NOW_CD != ORD_MST_DLV_GBN && Code.CART_DLV_GBN_SERVICE_CD != ORD_MST_DLV_GBN){
						//배송업체명
						String ORD_DLV_CPN_NM = StringUtil.getString(commandMap.get("ORD_DLV_CPN_NM"));
						//송장번호
						String ORD_PRD_IVC_NO = StringUtil.getString(commandMap.get("ORD_PRD_IVC_NO"));
						
						try{
							// 송장번호 입력 SMS 발송 
							Map<String, Object> smsMap = new HashMap<String, Object>();
							
							smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));  
							smsMap.put("TR_NAME", StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), ""));  		
							smsMap.put("TR_MSG",StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderInfo.get("ORD_MST_ORD_NM"), "") +"님, 주문하신 상품이 발송되었습니다. *"+ StringUtil.getString(orderInfo.get("PRD_NM"), "") +"/["+ ORD_DLV_CPN_NM +"]"+ORD_PRD_IVC_NO+" *빠르고 안전하게 배송될 수 있도록 최선을 다하겠습니다."); 		
							
							smsMap = this.sms.sendLongMessage(smsMap);
							
							// 메일 발송시 필요한 정보 가져오기 시작...
							
							// 주문상품 목록(commandMap에 ORD_PRD_IDX 가 있기 때문에, 송장 입력한 상품만 불러온다.)
							commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
					        List<Map<String, Object>> orderProductSelectedList = this.pcMyShoppingService.selectOrderProductList(commandMap);//공통 사용 가능
					        
					        //  상품 옵션 가져오기
					 		for(Map<String, Object> ordPrd : orderProductSelectedList){
					 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
					 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
					 				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
					 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
					 			}
					 			
					 			//서브 옵션 리스트
					 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
					 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
					 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
									subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
									ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
					 			}
					 		}
					 		
					 		// 전체 주문상품 목록(commandMap에 ORD_PRD_IDX를 삭제 후, 전체 상품 리스트를 불러온다.)
					 		commandMap.put("ORD_PRD_IDX","");
							commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
					        List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);//공통 사용 가능
					        
					        //  상품 옵션 가져오기
					 		for(Map<String, Object> ordPrd : orderProductList){
					 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
					 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
					 				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
					 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
					 			}
					 			
					 			//서브 옵션 리스트
					 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
					 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
					 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
									subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
									ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
					 			}
					 		}
					 		
					        // 사은품 정보
					        List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);//공통 사용 가능
					        
					        // 배송정보
					        Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
					        
					        // 할인/결제정보
					        Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);//공통 사용 가능
					        
					  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
					  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
					        String DEFAULT_CASHBAG_CARD_NO = "";
			        		Map<String,Object> getItNowShopInfo = null;
			        		Map<String, Object> userInfo = null;
			        		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_ID"));
							if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
								commandMap.put("trStatus", "U");//사용 이력
								Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
								
								if(cashbagSavedInfo != null){
									DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
								}
								
								// 겟잇나우 주문인 경우 지점 정보 가져오기
						 		/*int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_GBN"));
						 		if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
						 			getItNowShopInfo = this.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
						 		}*/
								
								// 회원정보
            			 		Map<String,Object> userMap = new HashMap<String,Object>();
            			 		userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
                    			userInfo = this.cartService.selectUserInfo(userMap);
							}
							
							// 메일 contents 맵
				    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
				    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo);//배송지정보
				    		mailContentsMap.put("orderProductSelectedList", orderProductSelectedList);//송장입력 해당 상품 리스트
				    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
				    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
				    		mailContentsMap.put("orderPayInfo", orderPayInfo);//주문결제정보
				    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
				    		mailContentsMap.put("userInfo", userInfo);//회원정보
				    		
				    		mailContentsMap.put("ORD_DLV_CPN_NM", ORD_DLV_CPN_NM);	//배송업체명
				    		mailContentsMap.put("ORD_PRD_IVC_NO", ORD_PRD_IVC_NO);	//송장번호
				    		
				    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
			    				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
				    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
				    		}
				    		
				    		// 주문일 
				    		Calendar calendar = Calendar.getInstance();
				    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
				    		String today = dateformat_text.format(calendar.getTime());
				    		mailContentsMap.put("today", today);
				    		
				    		// 발송일
				    		SimpleDateFormat dateformat_text2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    		String sendDay = dateformat_text2.format(calendar.getTime());
				    		mailContentsMap.put("sendDay", sendDay);
				    		
				    		mailContentsMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"))));			// 수신자 이름
				    		mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo.get("ORD_MST_CD")));//주문 번호
				    		mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));//결제방법
							
				    		mailContentsMap.put("SMS_HP", StringUtil.getString(commandMap.get("ORD_MST_HP1"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP2"),"") + StringUtil.getString(commandMap.get("ORD_MST_HP3"),""));//SMS 발신용 휴대폰 번호
				    		mailContentsMap.put("PAY_MST_FINANCENAME", StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"),""));//입금은행
				    		mailContentsMap.put("PAY_MST_ACCOUNTNUM", StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"),""));//입금계좌
							
				    		int dlvCagTmp = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_CAG"));
				    		int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
				    		int dlvCag = dlvCagTmp - addCag;
				    		
				    		mailContentsMap.put("dlvCag", dlvCag);
							mailContentsMap.put("cdnDomain", "http://"+this.propertiesService.getString("cdn.domain"));
							mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
							mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
							mailContentsMap.put("number", new NumberTool());
							
				    		//-- 메일본문 정리
							String body = VelocityEngineUtils.mergeTemplateIntoString(
									velocityEngine, "/MAIL-HEADER.vm", "utf-8", mailContentsMap);
							body += VelocityEngineUtils.mergeTemplateIntoString(
									velocityEngine, "/MAIL-ORDER-DELIVERY-START.vm", "utf-8", mailContentsMap);
							body += VelocityEngineUtils.mergeTemplateIntoString(
									velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
							
							//메일 발송용 맵
							Map<String, Object> mailMap = new HashMap<String, Object>();
							
							mailMap.put("MAIL_CODE", "12");	// 이메일 코드
							mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo.get("ORD_MST_MAIL")) );		// 수신자 이메일
				    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"))));			// 수신자 이름
				    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM")))  + "님이 주문하신 상품이 발송되었습니다.");	// 메일 제목
							mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
							
							this.mail.mailSend(mailMap);
						}catch(Exception e){
							logger.error("SMS, EMAIL 발송 중 예외 발생");
						}
					}
				}
			}
		}

        logger.info("=====================================================================================");
        logger.info("Message : 송장번호 입력 End.");
        logger.info("=====================================================================================");

        resultMap.put("result", result);
        resultMap.put("resultMsg", resultMsg);
        
        return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectMemberPointInfo
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : [부분취소팝업]회원 잔여 포인트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMemberPointInfo(Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.selectCount("Order.selectMemberPointInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBcncCdCheck
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 매장관리자 본인 매장 주문인지 체크
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBcncCdCheck(Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.selectCount("Order.selectBcncCdCheck", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderStateCodeList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 주문상태값 코드 리스트
    * 4. 작성자       : epass_n_11
    * 5. 작성일       : 2015. 10. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderStateCodeList(Map<String, Object> commandMap) throws Exception{
    	this.setOrderState(commandMap);
    	return this.defaultDAO.selectList("Order.selectOrderStateCodeList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateDeliveryInfo
    * 2. ClassName  : OrderServiceImpl.java
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
    public int updateDeliveryInfo(Map<String, Object> commandMap, HttpServletRequest request) throws Exception{
    	return this.defaultDAO.update("Order.updateDeliveryInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderPaySimpleInfo
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 주문 결제 간략 정보 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 11. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
	public Map<String, Object> selectOrderPaySimpleInfo(Map<String, Object> commandMap) throws Exception{
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	returnMap.put("orderPayInfo", defaultDAO.select("Order.selectOrderPaySimpleInfo",commandMap));
    	returnMap.put("orderPointInfo", defaultDAO.select("Order.selectOrderUsedPoints",commandMap));
    	returnMap.put("orderPromotionInfo", defaultDAO.select("Order.selectOrderPromotionCoupon", commandMap));
    	return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCodeList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 공통코드 하위코드 조회
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 11. 3.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCodeList(Map<String,Object> commandMap) throws Exception{
		return this.defaultDAO.selectList("Order.selectCodeList", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductAndOptionInfo
    * 2. ClassName  : OrderServiceImpl.java
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
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectProductAndOptionInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	// 주문상품 정보
    	Map<String, Object> orderProductInfo = defaultDAO.select("Order.selectOrderProductInfo",commandMap);
    	
    	commandMap.put("PRD_MST_CD", StringUtil.getString(orderProductInfo.get("ORD_PRD_MST_CD")));
    	commandMap.put("ORD_PRD_ORD_CNT", StringUtil.getString(orderProductInfo.get("ORD_PRD_ORD_CNT")));//주문 개수
    	// 주문상품 옵션 리스트
		//List<Map<String, Object>> optionList = defaultDAO.selectList("Order.selectBasicOnlineProductOptionList", commandMap);
    	// 주문상품 옵션 상세 리스트
		List<Map<String, Object>> optionDetailList = defaultDAO.selectList("Order.selectOrderProductOptionDetailList", commandMap);
    	
    	resultMap.put("orderProductInfo", orderProductInfo);
    	//resultMap.put("optionList", optionList);
    	resultMap.put("optionDetailList", optionDetailList);
    	
        return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateProductOption
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 옵션 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public int updateProductOption(Map<String, Object> commandMap) throws Exception {
    	int result = 0;
    	//주문 상품 정보
    	Map<String, Object> ordPrdInfo = defaultDAO.select("Order.selectOrderProductInfo", commandMap);
    	
    	// 1. 동일 옵션 체크
    	commandMap.put("ORD_MST_CD", ordPrdInfo.get("ORD_ORD_MST_CD"));
    	commandMap.put("ORD_PRD_IDX", ordPrdInfo.get("ORD_PRD_IDX"));
    	
    	// 필수/선택 옵션 여부
    	//선택 옵션인 경우 해당 마스터상품의 서브옵션들하고 겹치지 않아야 한다. 다른 마스터 상품 서브 옵션은 상관 없음
    	commandMap.put("ORD_PRD_SLT_YN", ordPrdInfo.get("ORD_PRD_SLT_YN"));
    	commandMap.put("ORD_PRD_UP_IDX", StringUtil.getString(ordPrdInfo.get("ORD_PRD_UP_IDX"),""));
    	int dupCnt = defaultDAO.selectCount("Order.selectOptionDupCnt", commandMap);
    	
    	if(dupCnt > 0){
    		//동일 옵션 있는 경우
    		result = -1;
    		return result;
    	}
    	
    	// 2. 재고 체크
    	commandMap.put("ORD_PRD_ORD_CNT", ordPrdInfo.get("ORD_PRD_ORD_CNT"));
    	int ordAvailableCnt = this.defaultDAO.selectCount("Order.selectOptionAvailableCnt", commandMap);
    	
    	if(ordAvailableCnt < 0){
    		//재고 부족한 경우
    		result = -2;
    		return result;
    	}
    	
    	//기존 옵션 재고 원복
    	defaultDAO.update("Order.updatePrdOptStock", ordPrdInfo);
    	
    	//변경 옵션 재고 차감
    	commandMap.put("ORD_PRD_ORD_CNT", StringUtil.getInt(ordPrdInfo.get("ORD_PRD_ORD_CNT"))*-1);
    	defaultDAO.update("Order.updatePrdOptStock", commandMap);
    	
    	//옵션 변경
    	result = defaultDAO.update("Order.updateProductOption", commandMap);
    	
    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateOrdGetAfterSend
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 교환권 발송 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
	public Map<String, Object> updateOrdGetAfterSend(Map<String, Object> commandMap) throws Exception {
    	Map<String,Object> resultMap = new HashMap<String,Object>();
    	int result = 0;
		String resultMsg = "에러가 발생했습니다.";
    	
    	// 교환권 번호 발생
    	String ORD_GET_TIK = this.defaultDAO.selectStr("Order.selectGetItNowTicketNo", null);
    	
    	Map<String,Object> getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);
    	
		// 교환권 발송
    	String ORD_GET_TEL1 = StringUtil.getString(commandMap.get("ORD_GET_TEL1"));
    	String ORD_GET_TEL2 = StringUtil.getString(commandMap.get("ORD_GET_TEL2"));
    	String ORD_GET_TEL3 = StringUtil.getString(commandMap.get("ORD_GET_TEL3"));
    	String ORD_GET_NM = StringUtil.getString(commandMap.get("ORD_GET_NM"));
    	
    	String PRD_NM = StringUtil.getString(getItNowShopInfo.get("PRD_NM"));
    	int PRD_CNT = StringUtil.getInt(getItNowShopInfo.get("PRD_CNT"));
    	String ORD_MST_CD = StringUtil.getString(getItNowShopInfo.get("ORD_MST_CD"));
    	String ORD_MST_ORD_NM = StringUtil.getString(getItNowShopInfo.get("ORD_MST_ORD_NM"));
    	String ORD_DT_STR = StringUtil.getString(getItNowShopInfo.get("ORD_DT_STR"));
    	String SHP_MST_NM = StringUtil.getString(getItNowShopInfo.get("SHP_MST_NM"));
    	String SHP_MST_TEL = StringUtil.getString(getItNowShopInfo.get("SHP_MST_TEL"));
    	
    	String PRD_NM_STR = PRD_NM;
    	if(PRD_CNT > 1){
    		PRD_NM_STR += PRD_NM_STR + " 외 "+ (PRD_CNT-1) +"건";
    	}
    	
    	//문자 내용
    	StringBuffer sb = new StringBuffer();
        sb.append("상품명 : " + PRD_NM_STR );
        sb.append("\n주문번호 : " + ORD_MST_CD );
        sb.append("\n주문자 : " + ORD_MST_ORD_NM );
        sb.append("\n주문일시 : " + ORD_DT_STR );
        sb.append("\n주문매장 : " + SHP_MST_NM );
        sb.append("\n전화번호 : " + SHP_MST_TEL );
        sb.append("\n교환코드 : " + ORD_GET_TIK );
        sb.append("\n\n");
        sb.append("<유의사항>\n\n");
        sb.append("상품준비가 완료되면 별도 알람 문자를 고객님께 발송합니다. 문자를 확인하신 후 매장에 방문해 주십시오.\n");
        sb.append("픽업일로부터 2일이 경과된 시점까지 상품을 수령하지 않으실 경우 주문하신 상품은 자동으로 취소됩니다.\n");
        sb.append("신분증, 결제신용카드, 교환권 문자를 꼭 가지고 매장에 방문해 주십시오.\n");
        sb.append("\n\n");
        sb.append("MarketPlant 쇼핑몰 고객센터 : ");
    	
    	// sms 발송용 맵
		Map<String, Object> smsMap = new HashMap<String, Object>();
		
		smsMap.put("TR_PHONE", ORD_GET_TEL1+ORD_GET_TEL2+ORD_GET_TEL3);  
		smsMap.put("TR_NAME", ORD_GET_NM);  		
		smsMap.put("TR_MSG", sb.toString());
		
		smsMap = this.sms.sendLongMessage(smsMap);
		
		String smsResultCode = StringUtil.getString(smsMap.get("resultCode"), "");
		String smsResultMsg = StringUtil.getString(smsMap.get("resultMsg"), "");
		
		//sms 발송 성공시에만...!
		if("0".equals(smsResultCode)){
			// 주문 겟잇나우 정보 수정
	    	commandMap.put("ORD_GET_TIK",ORD_GET_TIK);
	    	commandMap.put("ORD_GET_ADM_SMS_CNT", 1);
	    	result = defaultDAO.update("Order.updateOrdGetInfo", commandMap);
	    	
	    	//ERP UPDATE
	    	Map<String,Object> getItNowShopInfo2 = this.cartService.selectOrderGetItNowShopInfo(commandMap);
	    	Map<String, Object> erpMap = new HashMap<String, Object>();
	    	erpMap.put("P1DL01", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_NM")));
	    	erpMap.put("P1E1URCD2", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_RLT")));
	    	erpMap.put("P1AR12", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL1")));
	    	erpMap.put("P1ET1TELM", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL2"))+StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL3")));
	    	erpMap.put("P1E1SDOCO", StringUtil.getString(getItNowShopInfo2.get("ORD_MST_CD")));
	    	result = 0;
	    	
	    	erpMap.put("P1DL02", ORD_GET_TIK);
	    	result = 0;
			
			if(result > 0){
				resultMsg = "발송되었습니다.";
				
				// 지점장에게 상품준비요청 문자 발송
		    	String SHP_MST_MNG_HP = StringUtil.getString(getItNowShopInfo2.get("SHP_MST_MNG_HP"));//지점장 번호
		    	String SHP_MST_MNG_NM = StringUtil.getString(getItNowShopInfo2.get("SHP_MST_MNG_NM"));//지점장명
		    	
		    	//문자 내용
		    	StringBuffer sb2 = new StringBuffer();
		        sb2.append("[겟잇나우 상품준비요청]");
		        sb2.append("\n교환권번호 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TIK")) );
		        sb2.append("\n주문번호 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_MST_CD")) );
		        sb2.append("\n주문시간 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_DT_STR")) );
		        sb2.append("\n상품명/수량(개) : " + PRD_NM_STR );
		        sb2.append("\n가격 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_MST_ORD_PRC")) );
		        sb2.append("\n방문지점 : " + StringUtil.getString(getItNowShopInfo2.get("SHP_MST_NM")) );
		        sb2.append("\n방문예정일 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_PKU_DT_MAIL")) );
		        sb2.append("\n방문예정시간 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_PKU_HH")) );
		        sb2.append("\n고객명 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_NM")) );
		        sb2.append("\n고객연락처 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL1")) + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL2")) + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL3")) );
		        sb2.append("\n\n");
		        sb2.append("30분 이내로 재고 확인 부탁드립니다.");
		        sb2.append("상품준비가 완료되면 고객한테 LMS 발송해 주십시오.");

		        logger.debug("########### 겟잇나우 지점장 문자 발송!!!! #############");
		    	
		    	// sms 발송용 맵
				Map<String, Object> smsMap2 = new HashMap<String, Object>();
				
				smsMap2.put("TR_PHONE", SHP_MST_MNG_HP);  
				smsMap2.put("TR_NAME", SHP_MST_MNG_NM);  		
				smsMap2.put("TR_MSG", sb2.toString());
				
				smsMap2 = this.sms.sendLongMessage(smsMap2);
			}
		}else{
			resultMsg = smsResultMsg;
		}
    	
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
    	return resultMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateOrdGetInfo
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 겟잇나우 수령정보 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public int updateOrdGetInfo(Map<String, Object> commandMap) throws Exception {
    	int result = 0;
    	
    	// 교환권 번호 발생
    	String ORD_GET_TIK = this.defaultDAO.selectStr("Order.selectGetItNowTicketNo", null);
    	commandMap.put("ORD_GET_TIK", ORD_GET_TIK);
    	//겟잇나우 수령정보 변경
    	result = defaultDAO.update("Order.updateOrdGetInfo", commandMap);
    	
    	//ERP UPDATE
    	Map<String,Object> getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);
    	Map<String, Object> erpMap = new HashMap<String, Object>();
    	erpMap.put("P1DL01", StringUtil.getString(getItNowShopInfo.get("ORD_GET_NM")));
    	erpMap.put("P1E1URCD2", StringUtil.getString(getItNowShopInfo.get("ORD_GET_RLT")));
    	erpMap.put("P1AR12", StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL1")));
    	erpMap.put("P1ET1TELM", StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL2"))+StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL3")));
    	erpMap.put("P1E1SDOCO", StringUtil.getString(getItNowShopInfo.get("ORD_MST_CD")));
    	result = 0;
    	
    	erpMap.put("P1DL02", ORD_GET_TIK);
    	result = 0;
    	
    	if(result > 0){
			// 지점장에게 상품준비요청 문자 발송
	    	String SHP_MST_MNG_HP = StringUtil.getString(getItNowShopInfo.get("SHP_MST_MNG_HP"));//지점장 번호
	    	String SHP_MST_MNG_NM = StringUtil.getString(getItNowShopInfo.get("SHP_MST_MNG_NM"));//지점장명
	    	String PRD_NM = StringUtil.getString(getItNowShopInfo.get("PRD_NM"));
	    	int PRD_CNT = StringUtil.getInt(getItNowShopInfo.get("PRD_CNT"));
	    	
	    	String PRD_NM_STR = PRD_NM;
	    	if(PRD_CNT > 1){
	    		PRD_NM_STR += PRD_NM_STR + " 외 "+ (PRD_CNT-1) +"건";
	    	}
	    	
	    	//문자 내용
	    	StringBuffer sb2 = new StringBuffer();
	        sb2.append("[겟잇나우 상품준비요청]");
	        sb2.append("\n교환권번호 : " + ORD_GET_TIK );
	        sb2.append("\n주문번호 : " + StringUtil.getString(getItNowShopInfo.get("ORD_MST_CD")) );
	        sb2.append("\n주문시간 : " + StringUtil.getString(getItNowShopInfo.get("ORD_DT_STR")) );
	        sb2.append("\n상품명/수량(개) : " + PRD_NM_STR );
	        sb2.append("\n가격 : " + StringUtil.getString(getItNowShopInfo.get("ORD_MST_ORD_PRC")) );
	        sb2.append("\n방문지점 : " + StringUtil.getString(getItNowShopInfo.get("SHP_MST_NM")) );
	        sb2.append("\n방문예정일 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_PKU_DT_MAIL")) );
	        sb2.append("\n방문예정시간 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_PKU_HH")) );
	        sb2.append("\n고객명 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_NM")) );
	        sb2.append("\n고객연락처 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL1")) + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL2")) + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL3")) );
	        sb2.append("\n\n");
	        sb2.append("30분 이내로 재고 확인 부탁드립니다.");
	        sb2.append("상품준비가 완료되면 고객한테 LMS 발송해 주십시오.");

	        logger.debug("########### 겟잇나우 지점장 문자 발송!!!! #############");
	    	
	    	// sms 발송용 맵
			Map<String, Object> smsMap2 = new HashMap<String, Object>();
			
			smsMap2.put("TR_PHONE", SHP_MST_MNG_HP);  
			smsMap2.put("TR_NAME", SHP_MST_MNG_NM);  		
			smsMap2.put("TR_MSG", sb2.toString());
			
			smsMap2 = this.sms.sendLongMessage(smsMap2);
		}
    	
    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateScmCancel
    * 2. ClassName  : OrderServiceImpl.java
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
    public int updateScmCancel(HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.update("Order.updateScmCancel", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectReleaseDeliveryList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 출고처/배송처 리스트 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReleaseDeliveryList(Map<String,Object> commandMap) throws Exception{
		return this.defaultDAO.selectList("Order.selectReleaseDeliveryList", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : selectOrderCouponList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 주문 쿠폰 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOrderCouponList(Map<String, Object> commandMap) throws Exception 
    {
    	return defaultDAO.selectList("Order.selectOrderCouponList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderInfo
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 주문정보 가져오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectOrderInfo(Map<String, Object> commandMap) throws Exception 
    {
    	// 주문 정보
    	return defaultDAO.select("Order.selectOrderInfo",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOrderChannelList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 채널 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 27.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderChannelList(Map<String, Object> commandMap) throws Exception{
    	return defaultDAO.selectList("Order.selectOrderChannelList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectErpOrderInfoList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : ERP 주문 상세 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectErpOrderInfoList(Map<String, Object> commandMap) throws Exception{
    	return new ArrayList<Map<String, Object>>();
    }
    
    /**
    * <pre>
    * 1. MethodName : selectErpOrderAccountingList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : ERP 주문 회계 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectErpOrderAccountingList(Map<String, Object> commandMap) throws Exception{
    	return new ArrayList<Map<String, Object>>();
    }
  
    /**
    * <pre>
    * 1. MethodName : selectErpCancelCallOrderList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : ERP 취소요청중인 주문 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectErpCancelCallOrderList(Map<String, Object> commandMap) throws Exception{
    	//주문상태 
    	this.setOrderState(commandMap);
    	return defaultDAO.selectList("Order.selectErpCancelCallOrderList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : updateOrdCnlYnReset
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 취소요청 초기화
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 4. 11.
    * </pre>
    *
    * @param commandMap
    * @return
    *  @throws Exception
    */
	public int updateOrdCnlYnReset(Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.update("Order.updateOrdCnlYnReset", commandMap);
    }

	@Override
	public List<Map<String, Object>> selectOrderErpInfo(Map<String, Object> commandMap) throws Exception {
	    /**
		 *  주문 데이터 추출
		*/
		
		List<Map<String,Object>> erpParam = defaultDAO.selectList("Order.selectOrderErpInfo",commandMap);
      	Map<String,Object> erpMap = erpParam.get(0);
	    /**
		 *  주문 데이터 ERP연동
		*/
      	List<Map<String,Object>> resParam = ErpRequest.requestOrder(erpMap);
      	Map<String,Object> erpResMap = resParam.get(0);

	    /**
		 *  주문 데이터 ERP연동 히스토리 insert
		*/
      	erpResMap.put("ORD_PRD_ORD_STATE", commandMap.get("ORD_PRD_ORD_STATE"));
      	erpResMap.put("ORD_MST_CD", commandMap.get("ORD_MST_CD"));
      	erpResMap.put("ORD_ORD_PRD_IDX", commandMap.get("ORD_PRD_IDX"));
      	
      	String RESULT_CODE =resParam.get(0).get("resultCode").toString();
      	String RESULT_ORDER_DETAIL_NO =resParam.get(0).get("resultOrderDetailNo").toString();
      	String RESULT_ORDER_SEQ =resParam.get(0).get("resultOrderSeq").toString();
      	
      	erpResMap.put("RESULT_CODE", Integer.parseInt(RESULT_CODE));
      	erpResMap.put("RESULT_ORDER_NO", resParam.get(0).get("resultOrderNo"));
      	erpResMap.put("RESULT_ORDER_DETAIL_NO", Integer.parseInt(RESULT_ORDER_DETAIL_NO));
      	erpResMap.put("RESULT_ORDER_SEQ", Integer.parseInt(RESULT_ORDER_SEQ));
      	erpResMap.put("RESULT_TEXT", resParam.get(0).get("resultText"));
      	erpResMap.put("ORD_PRD_REG_IP", commandMap.get("ORD_PRD_REG_IP"));
      	
      	
      	erpResMap.put("DIV", erpParam.get(0).get("DIV"));
      	erpResMap.put("ORDER_NO", erpParam.get(0).get("ORDER_NO"));
      	erpResMap.put("ORDER_DETAIL_NO", erpParam.get(0).get("ORDER_DETAIL_NO"));
      	erpResMap.put("ORDER_SEQ", erpParam.get(0).get("ORDER_SEQ"));
      	erpResMap.put("ORDER_TYPE", erpParam.get(0).get("ORDER_TYPE"));
      	erpResMap.put("O2O_GB", erpParam.get(0).get("O2O_GB"));
      	erpResMap.put("ORDER_STEP", erpParam.get(0).get("ORDER_STEP"));
      	erpResMap.put("ORDER_DATE", erpParam.get(0).get("ORDER_DATE"));
      	erpResMap.put("STYLE_NO", erpParam.get(0).get("STYLE_NO"));
      	erpResMap.put("SEASON_YEAR", erpParam.get(0).get("SEASON_YEAR"));
      	erpResMap.put("COLOR_CODE", erpParam.get(0).get("COLOR_CODE"));
      	erpResMap.put("SIZE_CODE", erpParam.get(0).get("SIZE_CODE"));
      	erpResMap.put("PART_DIV", erpParam.get(0).get("PART_DIV"));
      	erpResMap.put("PART_NO", erpParam.get(0).get("PART_NO"));
      	erpResMap.put("BRAND", erpParam.get(0).get("BRAND"));
      	erpResMap.put("LINKED_ORDER_NO", erpParam.get(0).get("LINKED_ORDER_NO"));
      	erpResMap.put("LINKED_ORDER_DETAIL_NO", erpParam.get(0).get("LINKED_ORDER_DETAIL_NO"));
      	erpResMap.put("ORDER_QTY", erpParam.get(0).get("ORDER_QTY"));
      	erpResMap.put("ORDER_PRICE", erpParam.get(0).get("ORDER_PRICE"));
      	erpResMap.put("ORDER_AMT", erpParam.get(0).get("ORDER_AMT"));
      	erpResMap.put("SUPPLY_AMT", erpParam.get(0).get("SUPPLY_AMT"));
      	erpResMap.put("VAT_AMT", erpParam.get(0).get("VAT_AMT"));
      	erpResMap.put("COUPON_NO", erpParam.get(0).get("COUPON_NO"));
      	erpResMap.put("COUPON_NAME", erpParam.get(0).get("COUPON_NAME"));
      	erpResMap.put("COUPON_AMT", erpParam.get(0).get("COUPON_AMT"));
      	erpResMap.put("MEMBER_ID", erpParam.get(0).get("MEMBER_ID"));
      	erpResMap.put("USE_POINT", erpParam.get(0).get("USE_POINT"));
      	erpResMap.put("OCCUR_POINT", erpParam.get(0).get("OCCUR_POINT"));
      	erpResMap.put("USE_EPOINT", erpParam.get(0).get("USE_EPOINT"));
      	erpResMap.put("EMP_NO", erpParam.get(0).get("EMP_NO"));
      	erpResMap.put("EMP_SALE_AMT", erpParam.get(0).get("EMP_SALE_AMT"));
      	erpResMap.put("COOPER_NM", erpParam.get(0).get("COOPER_NM"));
      	erpResMap.put("COOPER_SALE_AMT", erpParam.get(0).get("COOPER_SALE_AMT"));
      	erpResMap.put("PROMOTION_AMT", erpParam.get(0).get("PROMOTION_AMT"));
      	erpResMap.put("RSALE_AMT", erpParam.get(0).get("RSALE_AMT"));
      	erpResMap.put("DELIVERY_CUST_CODE", erpParam.get(0).get("DELIVERY_CUST_CODE"));
      	erpResMap.put("INVOICE_NO", erpParam.get(0).get("INVOICE_NO"));
      	erpResMap.put("BUY_CONFM_DATE", erpParam.get(0).get("BUY_CONFM_DATE"));
      	erpResMap.put("ORDER_PAYMENT_NO", erpParam.get(0).get("ORDER_PAYMENT_NO"));
      	erpResMap.put("PAY_DATE", erpParam.get(0).get("PAY_DATE"));
      	erpResMap.put("DELI_DATE", erpParam.get(0).get("DELI_DATE"));
      	erpResMap.put("DELI_END_DATE", erpParam.get(0).get("DELI_END_DATE"));
      	erpResMap.put("SALE_CONFM_DATE", erpParam.get(0).get("SALE_CONFM_DATE"));
      	erpResMap.put("CANCEL_DATE", erpParam.get(0).get("CANCEL_DATE"));
      	erpResMap.put("RECHANGE_DATE", erpParam.get(0).get("RECHANGE_DATE"));
      	erpResMap.put("FEE_RATE", erpParam.get(0).get("FEE_RATE"));
      	erpResMap.put("SENDER_NAME", erpParam.get(0).get("SENDER_NAME"));
      	erpResMap.put("SENDER_ADDR", erpParam.get(0).get("SENDER_ADDR"));
      	erpResMap.put("SENDER_TEL_NO", erpParam.get(0).get("SENDER_TEL_NO"));
      	erpResMap.put("SENDER_CELL_NO", erpParam.get(0).get("SENDER_CELL_NO"));
      	erpResMap.put("SENDER_MEMO", erpParam.get(0).get("SENDER_MEMO"));
      	erpResMap.put("RCVER_NAME", erpParam.get(0).get("RCVER_NAME"));
      	erpResMap.put("RCVER_ADDR", erpParam.get(0).get("RCVER_ADDR"));
      	erpResMap.put("RCVER_TEL_NO", erpParam.get(0).get("RCVER_TEL_NO"));
      	erpResMap.put("RCVER_CELL_NO", erpParam.get(0).get("RCVER_CELL_NO"));
      	erpResMap.put("BUSI_NO", erpParam.get(0).get("BUSI_NO"));
      	erpResMap.put("TAG_PRICE", erpParam.get(0).get("TAG_PRICE"));
      	erpResMap.put("BRAND_NM", erpParam.get(0).get("BRAND_NM"));

      	defaultDAO.insert("Order.insertOrderErpResult", erpResMap);

		return resParam;
	}

	@Override
	public List<Map<String, Object>> selectOrderErpInfoApi(Map<String, Object> commandMap) throws Exception {

		return null;
	}

	@Override
	public Map<String, Object> selectOrdPrdIdx(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("Order.selectOrdPrdIdx",commandMap);
	}

	/**
    * <pre>
    * 1. MethodName : selectOrderBackList
    * 2. ClassName  : OrderServiceImpl.java
    * 3. Comment    : 반품관리 리스트 검색
    * 4. 작성자       	: 이원중
    * 5. 작성일       	: 2020. 6. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectOrderBackList(Map<String, Object> commandMap) {
		commandMap.put("OST_BACK_CODE", Code.OST_BACK_ARR);
		commandMap.remove("searchOrdPrdOrderStateArr");
		return defaultDAO.selectList("Order.selectOrderBackList",commandMap);
	}

	@Override
	public int selectOrderBackListCount(Map<String, Object> commandMap) {
		commandMap.put("OST_BACK_CODE", Code.OST_BACK_ARR);
		commandMap.remove("searchOrdPrdOrderStateArr");
		return defaultDAO.selectCount("Order.selectOrderBackListCount",commandMap);
	}

	@Override
	public int updateDeliveryTypeAjax(Map<String, Object> commandMap) {
		commandMap.put("ORD_PRD_DLV_TYPE", Code.DLV_TYPE_PARTNER);
		
		int result = 0;
		try {
			result += defaultDAO.update("Order.updateDeliveryTypeAjax", commandMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> selectOrderBackInfo(Map<String, Object> commandMap) throws Exception {
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);
		Map<String, Object> returnMap = defaultDAO.select("Order.selectOrderBackInfo",commandMap);
		String key = StringUtil.getString(returnMap.get("DLV_PAY_WAY"), "A");
		returnMap.put("dlv_pay_way_" + key, "checked");
		return returnMap;
	}
}
