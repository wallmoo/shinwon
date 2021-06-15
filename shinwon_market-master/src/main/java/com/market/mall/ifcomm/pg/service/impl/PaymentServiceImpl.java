package com.market.mall.ifcomm.pg.service.impl;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.model.Code;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.mypage.service.MyShoppingService;

import egovframework.rte.fdl.property.EgovPropertyService;
import lgdacom.XPayClient.XPayClient;

/**
 * @PackageName: com.market.mall.ifcomm.pg.service.impl
 * @FileName : PaymentServiceImpl.java
 * @Date : 2015. 10. 20.
 * @프로그램 설명 : PayMaster 처리하는 ServiceImpl Class
 * @author DEV_KANGHYUNKYU
 */
@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	//메일 발송시 필요한 서비스 시작
	@Resource
	protected Mail mail;	
	
	@Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
	
	@Resource (name="paymentService") 
	PaymentService paymentService;
	
	@Resource
	private CartService cartService;
	
	@Resource (name="orderService") 
	OrderService orderService;
	
	
	@Resource(name = "velocityEngine") 
	protected VelocityEngine velocityEngine;
	//메일 발송시 필요한 서비스 끝
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : insertPayMaster
	* 2. ClassName  : PaymentServiceImpl.java
	* 3. Comment    : PayMaster 등록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertPayMaster(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.insert("Payment.insertPayMaster", commandMap);
	}
	
	/**
	    * <pre>
	    * 1. MethodName : insertPayMaster
	    * 2. ClassName  : PaymentServiceImpl.java
	    * 3. Comment    : PayMasterLG 등록
	    * 4. 작성자       : DEV_KANGHYUNKYU
	    * 5. 작성일       : 2015. 10. 20.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	    */
	    public int insertLgPayMaster(Map<String, Object> commandMap) throws Exception {
	        return this.defaultDAO.insert("Payment.insertLgPayMaster", commandMap);
	    }
	
	/**
	* <pre>
	* 1. MethodName : deletePayMaster
	* 2. ClassName  : PaymentServiceImpl.java
	* 3. Comment    : PayMaster 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int deletePayMaster(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.insert("Payment.deletePayMaster", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updatePayDepositState
	* 2. ClassName  : PaymentServiceImpl.java
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
	public Map<String, Object> updatePayDepositState(HttpServletRequest request, Map<String,Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String resultcode = "99";
		String resultmessage = "에러가 발생했습니다.";
		
		//주문상태값 변경
		commandMap.put("ORDER_STATE", Code.OST_PAY);//결제완료 처리
		commandMap.put("ORDER_STATE_READY",Code.OST_PAY_READY);//결제대기중인 상품만 처리
		int result = this.defaultDAO.update("Payment.updatePayDepositState", commandMap);
		
		if(result > 0){
			//PAY MASTER 결제일시 변경
			this.defaultDAO.update("Payment.updatePayMst", commandMap);
			
			//ORDER MASTER 결제일시 변경
			this.defaultDAO.update("Payment.updateOrdMstPayDate", commandMap);
			
			//주문상태 변경 history 등록
			commandMap.put("ORD_PRD_DESC", commandMap.get("ORD_PRD_DESC")); //사유
			commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_PG); //등록구분				
			this.defaultDAO.insert("Payment.insertPayDepositOrdPrdHistory", commandMap);
			
			try{
				// 메일 발송시 필요한 정보 가져오기 시작...
				
				// 주문상품 목록
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
					}else{
						// 캐쉬백 카드번호
						commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
						Map<String, Object> memberCashbagInfo = this.cartService.selectMemberCashbagInfo(commandMap);//공통 사용 가능
						
						if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
							DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
						}
					}
					
					// 겟잇나우 주문인 경우 지점 정보 가져오기
			 		int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_GBN"));
			 		if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
			 			getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
			 		}
			 		
			 		// 회원정보
			 		Map<String,Object> userMap = new HashMap<String,Object>();
			 		userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
        			userInfo = this.cartService.selectUserInfo(userMap);
				}
				
				// 메일 contents 맵
	    		Map<String,Object> mailContentsMap = new HashMap<String,Object>();
	    		mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo);//배송지정보
	    		mailContentsMap.put("orderProductList", orderProductList);//주문상품리스트
	    		mailContentsMap.put("requestedGiftList", requestedGiftList);//사은품리스트
	    		mailContentsMap.put("orderPayInfo", orderPayInfo);//주문결제정보
	    		mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);//겟잇나우정보
	    		mailContentsMap.put("userInfo", userInfo);//회원정보
	    		
	    		if(!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8){
    				mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
	    			mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
	    		}
	    		
	    		// 주문일 
	    		Calendar calendar = Calendar.getInstance();
	    		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
	    		String today = dateformat_text.format(calendar.getTime());
	    		mailContentsMap.put("today", today);
	    		
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
						velocityEngine, "/MAIL-ORDER-CONFIRM-DEPOSIT.vm", "utf-8", mailContentsMap);
				body += VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
				
				//메일 발송용 맵
				Map<String, Object> mailMap = new HashMap<String, Object>();
				
				mailMap.put("MAIL_CODE", "11");	// 이메일 코드
				mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo.get("ORD_MST_MAIL")) );		// 수신자 이메일
	    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"))));			// 수신자 이름
	    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM")))  + ", 주문하신 상품의 입금이 확인되었습니다.");	// 메일 제목
				mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
				
				this.mail.mailSend(mailMap);
			}catch(Exception e){
				logger.error("SMS, EMAIL 발송 중 예외 발생");
			}
			
			resultcode = "00";
			resultmessage = "정상처리되었습니다.";
			
		}else{
			resultcode = "22";
			resultmessage = "주문상태값 변경 실패";
		}
		
		resultMap.put("resultcode", resultcode);
		resultMap.put("resultmessage", resultmessage);
		
		return resultMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateEscrowState
	* 2. ClassName  : PaymentServiceImpl.java
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
	public Map<String, Object> updateEscrowState(HttpServletRequest request, Map<String,Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String resultcode = "99";
		String resultmessage = "에러가 발생했습니다.";
		
		String r_stat_cd = StringUtil.getString(commandMap.get("r_stat_cd"));
		if("ES12".equals(r_stat_cd)){//구매확인
			commandMap.put("ORD_MST_ECR_CFM_YN","Y");
		}else if("ES13".equals(r_stat_cd)){//구매거절
			commandMap.put("ORD_MST_ECR_CFM_YN","N");
		}
		
		// 에스크로 상태값 변경
		int result = this.defaultDAO.update("Payment.updateEscrowState", commandMap);
		
		if(result > 0){
			resultcode = "00";
			resultmessage = "정상처리되었습니다.";
		}else{
			resultcode = "22";
			resultmessage = "에스크로 상태값 변경 실패";
		}
		
		resultMap.put("resultcode", resultcode);
		resultMap.put("resultmessage", resultmessage);
		
		return resultMap;
	}
	
	/**
    * <pre>
    * 1. MethodName : selectOrderCashbagInfo
    * 2. ClassName  : PaymentServiceImpl.java
    * 3. Comment    : 주문 캐쉬백 조회/사용/적립 정보
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderCashbagInfo(Map<String, Object> commandMap) throws Exception{
		return defaultDAO. select("Payment.selectOrderCashbagInfo", commandMap);
	}
    
    /**
     * <pre>
     * 1. MethodName : setPgApprovalValue
     * 2. ClassName  : PaymentServiceImpl.java
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
    @SuppressWarnings("rawtypes")
    public Map<String, Object> getPgApprovalValue(Map<String, Object> commandMap, HttpServletRequest request) throws Exception
    {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String setValue = "";
        
        // Parameter Select
        // 주문상품 정보
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
        commandMap.put("CART_PC_MOBILE_GUBUN", Code.USER_ENV_TYPE_PC);
        this.cartService.selectTempOrderProductList(commandMap);
        List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
        
        int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트금액
       
        //2020.16.18 데이터 생성 전 할인항목 계산          
        int CART_PAYMENT_DC_TPN = StringUtil.getInt(commandMap.get("CART_PAYMENT_DC_TPN"));
        int CART_PAYMENT_DC_EPN = StringUtil.getInt(commandMap.get("CART_PAYMENT_DC_EPN"));
        
        CART_PAYMENT_DC_POINT = CART_PAYMENT_DC_TPN + CART_PAYMENT_DC_EPN;
        
        int DB_PAYMENT_PRICE = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))); // DB 총 결제금액

        //DB_PAYMENT_PRICE = DB_PAYMENT_PRICE - CART_PAYMENT_DC_POINT;
        
        
        
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
        Date currentTime = new Date ();
        String dTime = formatter.format(currentTime);
        
        String OM_IDX = StringUtil.getString(commandMap.get("ORD_MST_CD"));                                     //주문번호
        String OM_PAY_PRICE = StringUtil.getString(DB_PAYMENT_PRICE);                                           //면세금액을 제외한 결제금액("," 를 제외한 결제금액을 입력하세요)
        String OM_NAME = StringUtil.getString(commandMap.get("ORD_MST_ORD_NM"));                                  //구매자명
        String P_NAME = StringUtil.getString(cartlist.get(0).get("PRD_MST_NM"));                                     //상품명
        String OM_EMAIL = StringUtil.getString(commandMap.get("EMAIL_ID"));                                //구매자 이메일
        String OM_EMAIL_DOMAIN = StringUtil.getString(commandMap.get("EMAIL_DOMAIN"));                  //구매자 이메일의 도메인
        //String OM_PAY_TAX_FREE_PRICE = StringUtil.getString(commandMap.get("OUT_OM_PAY_TAX_FREE_PRICE"), "0");  //면세금액("," 를 제외한 결제금액을 입력하세요)
        String OM_PAY_TAX_FREE_PRICE = "0";  //면세금액("," 를 제외한 결제금액을 입력하세요)
        
        int PRODUCT_CNT = StringUtil.getInt(cartlist.get(0).get("TOT_CNT"));
        
        P_NAME = PRODUCT_CNT == 1 ? P_NAME : P_NAME + " 외 " + Integer.toString(PRODUCT_CNT-1) + "건";
        OM_EMAIL = OM_EMAIL + "@" + OM_EMAIL_DOMAIN;
        
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd"); 
        
        // 가상계좌 만료일
        Calendar virtualInday = Calendar.getInstance();
        virtualInday.setTime(new Date());
        virtualInday.add(Calendar.DATE, 3);
        
        int radioPayment = StringUtil.getInt(commandMap.get("radioPayment"),0);
        String LG_PAY_TYPE ="";
        
        if(radioPayment == Code.PAY_CARD){
            LG_PAY_TYPE = Code.PG_PAY_METHOD_CARD;      // PG 결제타입 (신용카드)
        }else if(radioPayment == Code.PAY_ACCOUNT){
            LG_PAY_TYPE = Code.PG_PAY_METHOD_ACCOUNT;   // PG 결제타입 (계좌이체)
        }else if(radioPayment == Code.PAY_DEPOSIT){
            LG_PAY_TYPE = Code.PG_PAY_METHOD_VIRTUAL;   // PG 결제타입 (무통장입금)
        }else if(radioPayment == Code.PAY_PAYNOW){
            LG_PAY_TYPE = Code.PG_PAY_METHOD_PAYNOW;    // PG 결제타입 (패이나우)
        }else{
            LG_PAY_TYPE = "";     // PG 결제타입 (신용카드)
        }
        
        String month = StringUtil.getString(commandMap.get("paymentMonth"));
        
        //2020.06.25 할부 및 무이자 정보 확인해야함, 카드타입일 때
        
        String LGD_FINANCENAME = "";
     //   String LGD_FINANCECODE = "";
        String LGD_BACKBTN_YN = "N"; // PG 뒤로가기 버튼 사용여부
        String LGD_INSTALLRANGE = StringUtil.getString(commandMap.get("installRange"));
        String LGD_USABLECARD = "";
        String LGD_OSTYPE_CHECK = StringUtil.getString("CART_PC_MOBILE_GUBUN");
        String LGD_NOINTINF = "";
        
        
        if(LG_PAY_TYPE == Code.PG_PAY_METHOD_CARD) {
        	LGD_FINANCENAME = StringUtil.getString(commandMap.get("financeName"));
        //	LGD_FINANCECODE = StringUtil.getString(commandMap.get("paymentMonth")); // 확인해야함        	
        	LGD_USABLECARD =  StringUtil.getString(commandMap.get("paymentMonth"));
        	
        	//만약 무이자라면, 무이자 코드로 보내야함 , 데이터베이스에서 정보 가지고 온 후 무이자인지 아닌지 파악해야 할듯함.
        	if(StringUtil.getInt(commandMap.get("installRange")) < 6 && (StringUtil.getInt(commandMap.get("installRange"))) > 1) {
        		LGD_NOINTINF = LGD_USABLECARD+"-"+StringUtil.getInt(commandMap.get("installRange"));
        	}
        	/*
        	 else {
        	 
        		LGD_INSTALLRANGE = StringUtil.getString(commandMap.get("installRange"));
        	}
        	*/
        	
        }
        
        
        
        /*
         * [결제 인증요청 페이지(STEP2-1)]
         *
         * 샘플페이지에서는 기본 파라미터만 예시되어 있으며, 별도로 필요하신 파라미터는 연동메뉴얼을 참고하시어 추가 하시기 바랍니다.
         */

        /*
         * 1. 기본결제 인증요청 정보 변경
         *
         * 기본정보를 변경하여 주시기 바랍니다.(파라미터 전달시 POST를 사용하세요)
         */
        
        String CST_PLATFORM                = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");                                                //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
        String CST_MID                     = this.propertiesService.getString("payment.lg.xpay.CST_MID");                                                        //LG유플러스로 부터 발급받으신 상점아이디를 입력하세요.
        String LGD_MID                     = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;                        //테스트 아이디는 't'를 제외하고 입력하세요.
        //상점아이디(자동생성)
        String LGD_OID                     = OM_IDX;                                                                     //주문번호(상점정의 유니크한 주문번호를 입력하세요)
        String LGD_AMOUNT                  = OM_PAY_PRICE;                                                               //면세금액을 제외한 결제금액("," 를 제외한 결제금액을 입력하세요)
        String LGD_TAXFREEAMOUNT           = OM_PAY_TAX_FREE_PRICE;                                                      //면세금액("," 를 제외한 결제금액을 입력하세요)
        String LGD_MERTKEY                 = this.propertiesService.getString("payment.lg.xpay.LGD_MERTKEY");                //상점MertKey
        String LGD_BUYER                   = OM_NAME;                                                                    //구매자명
        String LGD_PRODUCTINFO             = P_NAME;                                                                     //상품명
        String LGD_BUYEREMAIL              = OM_EMAIL;                                                                   //구매자 이메일
        String LGD_TIMESTAMP               = dTime;                                                                      //타임스탬프
        String LGD_CUSTOM_USABLEPAY        = LG_PAY_TYPE;                                                               //상점정의 초기결제수단
        String LGD_CUSTOM_SKIN             = Code.PG_LGD_CUSTOM_SKIN;                                                   //상점정의 결제창 스킨(red, purple, yellow)
        String LGD_WINDOW_VER              = Code.PG_LGD_WINDOW_VER;                                                    //결제창 버젼정보
        String LGD_ENCODING                = Code.PG_LGD_ENCODING;                                                      //결제창 호출문자 인코딩
        String LGD_ENCODING_NOTEURL        = Code.PG_LGD_ENCODING_NOTEURL;                                              //결과수신페이지 호출문자 인코딩(무통장입금 통보)
        String LGD_ENCODING_RETURNURL      = Code.PG_LGD_ENCODING_RETURNURL;                                            //결과수신페이지 호출문자 인코딩(결제결과 페이지)       
        String LGD_CUSTOM_SWITCHINGTYPE    = Code.PG_LGD_CUSTOM_SWITCHINGTYPE;                                          //신용카드 카드사 인증 페이지 연동방식
        String LGD_CLOSEDATE               = fmt.format(virtualInday.getTime()) + "235959";                              //가상계좌 입금만료일
        String LGD_CASHRECEIPTYN           = "Y";                                                                        //현금영수증사용여부
        
        String LGD_WINDOW_TYPE             = Code.PG_CST_WINDOW_TYPE;                                                  //결제창 호출 방식 (수정불가)
        
        String LGD_CARDINSTALLMONTH  	   = month;       
        
        /*
         * 가상계좌(무통장) 결제 연동을 하시는 경우 아래 LGD_CASNOTEURL 을 설정하여 주시기 바랍니다.
         */
        String LGD_CASNOTEURL       = StringUtil.getString(request.getAttribute("serverDomain"),"") + Code.PG_LGD_CASNOTEURL_FRONT;

        /*
         * LGD_RETURNURL 을 설정하여 주시기 바랍니다. 반드시 현재 페이지와 동일한 프로트콜 및  호스트이어야 합니다. 아래 부분을 반드시 수정하십시요.
         */
        String LGD_RETURNURL        = StringUtil.getString(request.getAttribute("serverDomain"),"") + Code.PG_LGD_RETURNURL_FRONT;// FOR MANUAL        
        
        
        /************************************************************
         * MOBILE SMART X PAY 추가 파라메터 
         ************************************************************/
        String LGD_KVPMISPWAPURL = "";                                                                                  // ISP 승인완료 화면처리 URL
        String LGD_KVPMISPCANCELURL = "";                                                                               // ISP 결제취소 결과화면 URL
        String LGD_KVPMISPAUTOAPPYN = "";                                                                               // ISP 결제 처리방식 (동기/비동기)
        String LGD_MTRANSFERWAPURL = "";                                                                                // 계좌이체 승인완료 화면처리 URL
        String LGD_MTRANSFERCANCELURL = "";                                                                             // 계좌이체 결제실패(오류) 결과화면 URL
        String LGD_MTRANSFERAUTOAPPYN = "";                                                                             // 계좌이체 결제 처리방식 (동기/비동기)
        
        
        boolean isMobile = false;
        String userAgent = request.getHeader("user-Agent");
        
        String [] mobileOSs = {"iPhone", "iPod", "Android", "BlackBerry", "Windows CE", "Nokia", "Webos", "Opera Mini", "SonyEricsson", "Opera MObi", "IEMobile"};
        
        for (String mobileOs : mobileOSs)
        {
            // MOBILE CHECK
            if (userAgent.indexOf(mobileOs) > -1)
            {
                isMobile = true;
                
                /* MOBILE START X PAY PARAM */
                LGD_WINDOW_TYPE = "popup";
                LGD_CUSTOM_SWITCHINGTYPE = "SUBMIT";
                
                /******************************************
                 * MOBILE OS CHECK
                 ******************************************/
                // IOS
                if (userAgent.indexOf("iPhone") > -1 || userAgent.indexOf("iPod") > -1)
                {
                    LGD_KVPMISPAUTOAPPYN = "N";                                                                         // ISP 동기 결제처리 (IOS Web-to-Web)
                    LGD_MTRANSFERAUTOAPPYN = "N";                                                                       // 계좌이체 동기 결제처리 (IOS Web-to-Web)
                }
                // ANDROID
                else
                {
                    LGD_KVPMISPAUTOAPPYN = "A";                                                                         // ISP 동기 결제처리
                    LGD_MTRANSFERAUTOAPPYN = "A";                                                                       // 계좌이체 동기 결제처리
                }
                
                break;
            }
        }
        
        /*
         *************************************************
         * 2. MD5 해쉬암호화 (수정하지 마세요) - BEGIN
         *
         * MD5 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
         *************************************************
         *
         * 해쉬 암호화 적용( LGD_MID + LGD_OID + LGD_AMOUNT + LGD_TIMESTAMP + LGD_MERTKEY )
         * LGD_MID          : 상점아이디
         * LGD_OID          : 주문번호
         * LGD_AMOUNT       : 금액
         * LGD_TIMESTAMP    : 타임스탬프
         * LGD_MERTKEY      : 상점MertKey (mertkey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실수 있습니다)
         *
         * MD5 해쉬데이터 암호화 검증을 위해
         * LG유플러스에서 발급한 상점키(MertKey)를 환경설정 파일(lgdacom/conf/mall.conf)에 반드시 입력하여 주시기 바랍니다.
         */
        StringBuffer sb = new StringBuffer();
        
        sb.append(LGD_MID);
        sb.append(LGD_OID);
        sb.append(LGD_AMOUNT);
        sb.append(LGD_TIMESTAMP);
        sb.append(LGD_MERTKEY);
        
        byte[] bNoti = sb.toString().getBytes();
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(bNoti);

        StringBuffer strBuf = new StringBuffer();
        for (int i=0 ; i < digest.length ; i++) {
            int c = digest[i] & 0xff;
            if (c <= 15){
                strBuf.append("0");
            }
            strBuf.append(Integer.toHexString(c));
        }
        
        String LGD_HASHDATA = strBuf.toString();
        String LGD_CUSTOM_PROCESSTYPE = "TWOTR";
        /*
         *************************************************
         * 2. MD5 해쉬암호화 (수정하지 마세요) - END
         *************************************************
         */        

        HashMap<String, Object> payReqMap = new HashMap<String, Object>();
        
        /*
        payReqMap.put("LGD_OID"                     , LGD_OID );                           // 주문번호
        payReqMap.put("LGD_BUYER"                   , LGD_BUYER );                         // 구매자
        payReqMap.put("LGD_PRODUCTINFO"             , LGD_PRODUCTINFO );                   // 상품정보
        payReqMap.put("LGD_AMOUNT"                  , LGD_AMOUNT );                        // 결제금액
        payReqMap.put("LGD_TAXFREEAMOUNT"           , LGD_TAXFREEAMOUNT );                 // 면세금액
        payReqMap.put("LGD_BUYEREMAIL"              , LGD_BUYEREMAIL );                    // 구매자 이메일
        payReqMap.put("LGD_CUSTOM_SKIN"             , LGD_CUSTOM_SKIN );                   // 결제창 SKIN
        payReqMap.put("LGD_WINDOW_VER"              , LGD_WINDOW_VER );                    // 결제창 버젼정보
        payReqMap.put("LGD_CUSTOM_PROCESSTYPE"      , LGD_CUSTOM_PROCESSTYPE );            // 트랜잭션 처리방식(동기)
        payReqMap.put("LGD_TIMESTAMP"               , LGD_TIMESTAMP );                     // 타임스탬프
        payReqMap.put("LGD_HASHDATA"                , LGD_HASHDATA );                      // MD5 해쉬암호값
        payReqMap.put("LGD_RETURNURL"               , LGD_RETURNURL );                     // 응답수신페이지
        payReqMap.put("LGD_CUSTOM_USABLEPAY"        , LGD_CUSTOM_USABLEPAY );              // 디폴트 결제수단
        payReqMap.put("LGD_ENCODING"                , LGD_ENCODING );                      // 결제창 호출문자 인코딩
        payReqMap.put("LGD_ENCODING_NOTEURL"        , LGD_ENCODING_NOTEURL );              // 결과수신페이지 호출문자 인코딩(무통장입금 통보)
        payReqMap.put("LGD_ENCODING_RETURNURL"      , LGD_ENCODING_RETURNURL );            // 결과수신페이지 호출문자 인코딩(결제결과 페이지)
        payReqMap.put("LGD_CUSTOM_SWITCHINGTYPE"    , LGD_CUSTOM_SWITCHINGTYPE );          // 신용카드 카드사 인증 페이지 연동 방식
        */
        
        
        payReqMap.put("CST_PLATFORM"                , CST_PLATFORM);                    // 테스트, 서비스 구분
        payReqMap.put("CST_MID"                     , CST_MID );                           // 상점아이디
        payReqMap.put("LGD_WINDOW_TYPE"             , LGD_WINDOW_TYPE );                           // 상점아이디
        payReqMap.put("LGD_MID"                     , LGD_MID );                           // 상점아이디
        payReqMap.put("LGD_OID"                     , LGD_OID );                           // 주문번호
        payReqMap.put("LGD_BUYER"                   , LGD_BUYER );                         // 구매자
        payReqMap.put("LGD_PRODUCTINFO"             , LGD_PRODUCTINFO );                   // 상품정보
        payReqMap.put("LGD_AMOUNT"                  , LGD_AMOUNT );                        // 결제금액
        payReqMap.put("LGD_BUYEREMAIL"              , LGD_BUYEREMAIL );                    // 구매자 이메일
        payReqMap.put("LGD_CUSTOM_SKIN"             , LGD_CUSTOM_SKIN );                   // 결제창 SKIN
        payReqMap.put("LGD_CUSTOM_PROCESSTYPE"      , LGD_CUSTOM_PROCESSTYPE );            // 트랜잭션 처리방식
        payReqMap.put("LGD_TIMESTAMP"               , LGD_TIMESTAMP );                     // 타임스탬프
        payReqMap.put("LGD_HASHDATA"                , LGD_HASHDATA );                      // MD5 해쉬암호값
        payReqMap.put("LGD_RETURNURL"              , LGD_RETURNURL );                      // 응답수신페이지
        payReqMap.put("LGD_VERSION"                , "JSP_SmartXPay_1.0");                 // 버전정보 (삭제하지 마세요)
        payReqMap.put("LGD_CUSTOM_USABLEPAY"       , LGD_CUSTOM_USABLEPAY );               // 디폴트 결제수단 (해당 필드를 보내지 않으면 결제수단 선택 UI 가 보이게 됩니다.)
        
        
        /** 테스트 파라미터 */
        
        payReqMap.put("LGD_CARDINSTALLMONTH" 	   , LGD_CARDINSTALLMONTH	);				// 할부기간 test 인데 , 안넘어감, 카드랑 고유로 같이 가야하는지 확인해야함        
        payReqMap.put("LGD_FINANCENAME" 	   , LGD_FINANCENAME	);
        //payReqMap.put("LGD_FINANCECODE" 	   , LGD_FINANCECODE	);
        payReqMap.put("LGD_BACKBTN_YN"		   , LGD_BACKBTN_YN  );									 // 뒤로가기버튼 사용여부
        if(LGD_INSTALLRANGE != null && LGD_INSTALLRANGE.length() != 0) {
        	payReqMap.put("LGD_INSTALLRANGE"	   , LGD_INSTALLRANGE );										//표시할부개월수 <-- 앞단에서 받은 개월수를 끌고올 수 있다. 확인.
        	payReqMap.put("LGD_NOINTINF"					   , LGD_NOINTINF );		//특정카드 / 특정개월무이자 셋팅 << 모듈에 무이자 마크와 해당 캐월수 선택할 때 무이자 체크 가능
        }else {
        	payReqMap.put("LGD_NOINTINF"					   , LGD_NOINTINF );		//특정카드 / 특정개월무이자 셋팅 << 모듈에 무이자 마크와 해당 캐월수 선택할 때 무이자 체크 가능
        }        
        payReqMap.put("LGD_OSTYPE_CHECK"		, LGD_OSTYPE_CHECK);					//	피씨에서 모바일용 결제모듈의 실행방지.		
        payReqMap.put("LGD_USABLECARD"			, LGD_USABLECARD);	
        
        
        /** END 테스트 파라미터 */
        
        payReqMap.put("LGD_CUSTOM_SWITCHINGTYPE"   , LGD_CUSTOM_SWITCHINGTYPE );           // 신용카드 카드사 인증 페이지 연동 방식
        payReqMap.put("LGD_WINDOW_VER"             , LGD_WINDOW_VER );                     // 결제창 버젼정보 
        payReqMap.put("LGD_CLOSEDATE"               , LGD_CLOSEDATE);                      // 가상계좌 입금만료일
        payReqMap.put("LGD_CASHRECEIPTYN"           , LGD_CASHRECEIPTYN);                  // 현금영수증사용여부
        payReqMap.put("LGD_TAXFREEAMOUNT", LGD_TAXFREEAMOUNT);
        payReqMap.put("LGD_ENCODING", LGD_ENCODING);
        payReqMap.put("LGD_ENCODING_NOTEURL", LGD_ENCODING_NOTEURL);
        payReqMap.put("LGD_ENCODING_RETURNURL", LGD_ENCODING_RETURNURL);
        
        payReqMap.put("CART_PAYMENT_DC_MILEAGE", CART_PAYMENT_DC_MILEAGE);                  // 총 사용 마일리지
        payReqMap.put("CART_PAYMENT_DC_CASHBAG", CART_PAYMENT_DC_CASHBAG);                  // 총 사용 캐쉬백
        payReqMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);                    // 총 사용 쿠폰금액
        payReqMap.put("CART_PAYMENT_DC_POINT", CART_PAYMENT_DC_POINT);                      // 총 사용 포인트금액
        
        // 가상계좌(무통장) 결제연동을 하시는 경우  할당/입금 결과를 통보받기 위해 반드시 LGD_CASNOTEURL 정보를 LG 유플러스에 전송해야 합니다 .
        payReqMap.put("LGD_CASNOTEURL"          , LGD_CASNOTEURL );               // 가상계좌 NOTEURL

       /*Return URL에서 인증 결과 수신 시 셋팅될 파라미터 입니다.*/
        payReqMap.put("LGD_RESPCODE"        , "" );
        payReqMap.put("LGD_RESPMSG"         , "" );
        payReqMap.put("LGD_PAYKEY"          , "" );
        
        /************************************************************
         * MOBILE SMART X PAY 추가 파라메터 
         ************************************************************/
        
        payReqMap.put("LGD_KVPMISPWAPURL"           , LGD_KVPMISPWAPURL);                   // ISP 승인완료 화면처리 URL
        payReqMap.put("LGD_KVPMISPCANCELURL"        , LGD_KVPMISPCANCELURL);                // ISP 결제취소 결과화면 URL
        payReqMap.put("LGD_KVPMISPAUTOAPPYN"        , LGD_KVPMISPAUTOAPPYN);                // ISP 결제 처리방식 (동기/비동기)
        payReqMap.put("LGD_MTRANSFERWAPURL"         , LGD_MTRANSFERWAPURL);                 // 계좌이체 승인완료 화면처리 URL
        payReqMap.put("LGD_MTRANSFERCANCELURL"      , LGD_MTRANSFERCANCELURL);              // 계좌이체 결제실패(오류) 결과화면 URL
        payReqMap.put("LGD_MTRANSFERAUTOAPPYN"      , LGD_MTRANSFERAUTOAPPYN);              // 계좌이체 결제 처리방식 (동기/비동기)
        
        // paynow 체크
        if(("SC0010-SC0030").equals(LGD_CUSTOM_USABLEPAY))
        {
            payReqMap.put("LGD_EASYPAY_ONLY"    , "PAYNOW" );          // 신용카드 카드사 인증 페이지 연동 방식
        }
        
        if (Code.PG_PAY_METHOD_ACCOUNT.equals(LGD_CUSTOM_USABLEPAY) || Code.PG_PAY_METHOD_VIRTUAL.equals(LGD_CUSTOM_USABLEPAY))
        {
            // 에스크로 주문 여부
            payReqMap.put("LGD_ESCROW_USEYN", "Y");
        }
        
        for(Iterator i = payReqMap.keySet().iterator(); i.hasNext();)
        {
            Object key = i.next();
            setValue += "<input type='hidden' name='" + key + "' id='"+key+"' value='" + payReqMap.get(key) + "' readonly>";
        } 
        
        resultMap.put("setValue", setValue);
        resultMap.put("platForm", CST_PLATFORM);
        resultMap.put("windowType", LGD_WINDOW_TYPE);
        
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : pgApproval
     * 2. ClassName  : PaymentServiceImpl.java
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
    public Map<String,Object> pgApproval(Map<String, Object> commandMap, HttpServletRequest request) throws Exception
    {
        /* resultCode > 승인처리 결과 코드
         * AR0000 : 승인완료
         * AR8001 : API 초기화 실패 
         * AR8002 : LG유플러스 제공 API를 사용 불가. 환경파일 설정을 확인필요.
         * AR8003 : 최종결제 요청 실패
         * AR8004 : 결제 API 요청 실패 
         * AR9001 : 승인결과 PG DB 처리 실패
         * AR9002 : 승인결과 PG DB 처리 실패 > 자동취소 정상처리
         * AR9003 : 승인결과 PG DB 처리 실패 > 자동취소 실패
         */
        Map<String,Object> pgMap = new HashMap<String,Object>();
        String resultCode = "AR0000";
        
        /*
         * [최종결제요청 페이지(STEP2-2)]
         *
         * LG유플러스으로 부터 내려받은 LGD_PAYKEY(인증Key)를 가지고 최종 결제요청.(파라미터 전달시 POST를 사용하세요)
         */

        /* ※ 중요
        * 환경설정 파일의 경우 반드시 외부에서 접근이 가능한 경로에 두시면 안됩니다.
        * 해당 환경파일이 외부에 노출이 되는 경우 해킹의 위험이 존재하므로 반드시 외부에서 접근이 불가능한 경로에 두시기 바랍니다. 
        * 예) [Window 계열] C:\inetpub\wwwroot\lgdacom ==> 절대불가(웹 디렉토리)
        */
        
        String configPath = propertiesService.getString("payment.lg.xpay.LGD_PG_CONFIG_PATH");
        
        /*
         *************************************************
         * 1.최종결제 요청 - BEGIN
         *  (단, 최종 금액체크를 원하시는 경우 금액체크 부분 주석을 제거 하시면 됩니다.)
         *************************************************
         */
        
        String CST_PLATFORM                 = StringUtil.getString(commandMap.get("CST_PLATFORM"), "");
        String CST_MID                      = StringUtil.getString(commandMap.get("CST_MID"), "");
        String LGD_MID                      = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;
        String LGD_PAYKEY                   = StringUtil.getString(commandMap.get("LGD_PAYKEY"), "");        
        
        //해당 API를 사용하기 위해 WEB-INF/lib/XPayClient.jar 를 Classpath 로 등록하셔야 합니다. 
        XPayClient xpay = new XPayClient();
        boolean isInitOK = xpay.Init(configPath, CST_PLATFORM);        
        
        if( !isInitOK ) {
            //API 초기화 실패 화면처리
            resultCode = "AR8001";
            logger.debug("\t++++++++++++++++++\t 결제 API 초기화 실패 \t++++++++++++++++++");
        }else{      
            try{
                /*
                 *************************************************
                 * 1.최종결제 요청(수정하지 마세요) - END
                 *************************************************
                 */
                xpay.Init_TX(LGD_MID);
                xpay.Set("LGD_TXNAME", "PaymentByKey");
                xpay.Set("LGD_PAYKEY", LGD_PAYKEY);
            
                //금액을 체크하시기 원하는 경우 아래 주석을 풀어서 이용하십시요.
                //String DB_AMOUNT = "DB나 세션에서 가져온 금액"; //반드시 위변조가 불가능한 곳(DB나 세션)에서 금액을 가져오십시요.
                //xpay.Set("LGD_AMOUNTCHECKYN", "Y");
                //xpay.Set("LGD_AMOUNT", DB_AMOUNT);
            }catch(Exception e) {
                resultCode = "AR8002";
                logger.debug("\t++++++++++++++++++\t LG유플러스 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다. \t++++++++++++++++++");
                logger.info(e.getMessage());
            }
        }

        /*
         * 2. 최종결제 요청 결과처리
         *
         * 최종 결제요청 결과 리턴 파라미터는 연동메뉴얼을 참고하시기 바랍니다.
         */
         if ( xpay.TX() ) {
             //1)결제결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
             logger.debug("\t++++++++++++++++++\t 결제 요청 완료 \t++++++++++++++++++");
             
             for (int i = 0; i < xpay.ResponseNameCount(); i++)
             {
                 for (int j = 0; j < xpay.ResponseCount(); j++)
                 {
                     pgMap.put(xpay.ResponseName(i), xpay.Response(xpay.ResponseName(i), j));
                 }
             }
             
             if( "0000".equals( xpay.m_szResCode ) ) {
                 boolean isDBOK = true; //DB처리 실패시 false로 변경해 주세요.
                 
                 try{
                     //최종결제요청 결과 성공 DB처리
                     logger.debug("\t++++++++++++++++++\t 최종 결제요청 결과 DB 처리 \t++++++++++++++++++");
                     
                     pgMap.put("PAY_MST_TR_STATUS",        "A");
                     pgMap.put("ORD_MST_CD", commandMap.get("ORD_MST_CD"));
                     pgMap.put("PAY_MST_PG_TXNAME", "PaymentByKey");
                     pgMap.put("LGD_CLOSEDATE", commandMap.get("LGD_CLOSEDATE"));
                     
                     
                     this.paymentService.insertLgPayMaster(pgMap);
                    
                     
                     //defaultDAO.insert("Payment.insertPaymentGate", pgMap);
                     
                     if (!"".equals(StringUtil.getString(pgMap.get("LGD_CASHRECEIPTNUM"), "")))
                     {
                         // 세금계산서 신청 TODO 세금계산서 신청 수정해야함
                         //this.insertCashReceipt(pgMap);
                         // 세금계산서 수정
                         //this.updateCashReceipt(pgMap);
                     }
                     
                 }catch(Exception e){
                     //승인 결과 DB 처리 에러시 isDBOK값을 false로 설정하여 거래건을 취소 요청
                     isDBOK = false;
                     resultCode = "AR9001";                
                     logger.debug("\t++++++++++++++++++\t 최종 결제요청 결과 DB 처리실패 \t++++++++++++++++++");        
                     logger.info(e.getMessage());
                 }
                 
                //최종결제요청 결과 성공 DB처리 실패시 Rollback 처리
                if( !isDBOK ) {
                    xpay.Rollback("상점 DB처리 실패로 인하여 Rollback 처리 [TID:" +xpay.Response("LGD_TID",0)+",MID:" + xpay.Response("LGD_MID",0)+",OID:"+xpay.Response("LGD_OID",0)+"]");
                    
                     if( "0000".equals( xpay.m_szResCode ) ) {
                         resultCode = "AR9002";
                         logger.debug("\t++++++++++++++++++\t 최종 결제요청 결과 DB 처리실패 > 결제자동취소 정상처리 \t++++++++++++++++++");
                     }else{
                         resultCode = "AR9003";
                         logger.debug("\t++++++++++++++++++\t 최종 결제요청 결과 DB 처리실패 > 결제자동취소 실패 \t++++++++++++++++++");
                     }
                }
             }else if( "0016".equals( xpay.m_szResCode ) ) {
                 resultCode = "0016";
                 logger.debug("\t++++++++++++++++++\t 고객님의 신용카드 한도가 부족하거나, 체크카드인 경우 통장잔액 부족입니다.(1회 사용한도 초과) \t++++++++++++++++++");
             }else if( "3000".equals( xpay.m_szResCode ) ) {
                 resultCode = "3000";
                 logger.debug("\t++++++++++++++++++\t 카드사 문의요망 \t++++++++++++++++++");
             }else{
                 //최종결제요청 결과 실패
                 resultCode = "AR8003";
                 logger.debug("\t++++++++++++++++++\t 최종 결제요청 결과 실패 \t++++++++++++++++++");                 
             }
         }else {
             //2)API 요청실패
             resultCode = "AR8004";
             logger.debug("\t++++++++++++++++++\t API 요청실패 \t++++++++++++++++++");
         }        
        
         pgMap.put("resultCode", resultCode);
         
        return pgMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : pgPartCancel
     * 2. ClassName  : PaymentServiceImpl.java
     * 3. Comment    : PG 부분취소 요청/처리
     * 4. 작성자       : epasscni
     * 5. 작성일       : 2015. 4. 26.
     * </pre>
     *
     * @param commandMap
     * @param request
     * @return
     * @throws Exception
     */
    public Map<String, Object> pgPartCancel(Map<String, Object> commandMap, HttpServletRequest request) throws Exception
    {
        // 정상승인건에대한 LG유플러스 승인정보
        System.out.println("PAY_MST_TID================>"+commandMap.get("PAY_MST_TID"));
        String lgdTld = StringUtil.getString(commandMap.get("PAY_MST_TID"));
        
        /* resultCode > 부분취소처리 결과 코드
         * CR0000 : 부분취소 완료
         * CR8001 : 부분취소 API 요청 실패
         * CR9001 : 부분취소 요청결과 DB 처리 실패
         * CR9002 : 부분취소 실패
         */        
        
        Map<String,Object> pgMap = new HashMap<String,Object>();
        String resultCode = "CR0000";
        String resultMsg = "";
        
        /*
         * [결제 부분취소 요청 페이지]
         *
         * LG유플러스으로 부터 내려받은 거래번호(LGD_TID)를 가지고 부분취소 요청을 합니다.(파라미터 전달시 POST를 사용하세요)
         * (승인시 LG유플러스으로 부터 내려받은 PAYKEY와 혼동하지 마세요.)
         */
        String CST_PLATFORM                = Code.PG_CST_PLATFORM;                                                      //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
        String CST_MID                     = Code.PG_CST_MID;                                                           //LG유플러스로 부터 발급받으신 상점아이디를 입력하세요.
        String LGD_MID                     = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;                        //테스트 아이디는 't'를 제외하고 입력하세요.
                                                                                                                         //상점아이디(자동생성)
        String LGD_TID                     = lgdTld;                                                                     //LG유플러스으로 부터 내려받은 거래번호(LGD_TID)
        String LGD_CANCELAMOUNT            = StringUtil.getString(commandMap.get("LGD_CANCELAMOUNT"));                   //부분취소 금액
        String LGD_REMAINAMOUNT            = StringUtil.getString(commandMap.get("LGD_REMAINAMOUNT"));                   //남은 금액
        String LGD_CANCELTAXFREEAMOUNT     = StringUtil.getString(commandMap.get("LGD_CANCELTAXFREEAMOUNT"));            //면세대상 부분취소 금액 (과세/면세 혼용상점만 적용)
        String LGD_CANCELREASON            = "";                                                                         //취소사유
        String LGD_RFBANKCODE              = "";                                                                         //환불계좌 은행코드 (가상계좌만 필수)
        String LGD_RFACCOUNTNUM            = "";                                                                         //환불계좌 번호 (가상계좌만 필수)
        String LGD_RFCUSTOMERNAME          = "";                                                                         //환불계좌 예금주 (가상계좌만 필수)
        String LGD_RFPHONE                 = "";                                                                         //요청자 연락처 (가상계좌만 필수)
        String LGD_REQREMAIN               = "1";                                                                        //(옵션) 취소후 남은 금액 리턴 여부 (1: 남은 금액 리턴함, 0: 남은 금액 리턴안함)
         
        //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf") 위치 지정.
        String configPath = propertiesService.getString("payment.lg.xpay.LGD_PG_CONFIG_PATH");                                         
            
        LGD_CANCELAMOUNT                = ( LGD_CANCELAMOUNT == null )?"":LGD_CANCELAMOUNT; 
        LGD_REMAINAMOUNT                = ( LGD_REMAINAMOUNT == null )?"":LGD_REMAINAMOUNT; 
        LGD_CANCELTAXFREEAMOUNT         = ( LGD_CANCELTAXFREEAMOUNT == null )?"":LGD_CANCELTAXFREEAMOUNT;
        LGD_CANCELREASON                = ( LGD_CANCELREASON == null )?"":LGD_CANCELREASON;
        LGD_RFBANKCODE                  = ( LGD_RFBANKCODE == null )?"":LGD_RFBANKCODE;
        LGD_RFACCOUNTNUM                = ( LGD_RFACCOUNTNUM == null )?"":LGD_RFACCOUNTNUM;
        LGD_RFCUSTOMERNAME              = ( LGD_RFCUSTOMERNAME == null )?"":LGD_RFCUSTOMERNAME;
        LGD_RFPHONE                     = ( LGD_RFPHONE == null )?"":LGD_RFPHONE;
        LGD_REQREMAIN                   = ( LGD_RFPHONE == null )?"":LGD_REQREMAIN;
        
        XPayClient xpay = new XPayClient();
        xpay.Init(configPath, CST_PLATFORM);
        xpay.Init_TX(LGD_MID);
        xpay.Set("LGD_TXNAME", "PartialCancel");
        xpay.Set("LGD_TID", LGD_TID);    
        xpay.Set("LGD_CANCELAMOUNT", LGD_CANCELAMOUNT);
        xpay.Set("LGD_REMAINAMOUNT", LGD_REMAINAMOUNT);
        xpay.Set("LGD_CANCELTAXFREEAMOUNT", LGD_CANCELTAXFREEAMOUNT);
        xpay.Set("LGD_RFBANKCODE", LGD_RFBANKCODE);
        xpay.Set("LGD_RFACCOUNTNUM", LGD_RFACCOUNTNUM);
        xpay.Set("LGD_RFCUSTOMERNAME", LGD_RFCUSTOMERNAME);
        xpay.Set("LGD_RFPHONE", LGD_RFPHONE);
        xpay.Set("LGD_REQREMAIN", LGD_REQREMAIN);
     
        /*
         * 1. 결제 부분취소 요청 결과처리
         *
         */
        if (xpay.TX()) {
            //1)결제 부분취소결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
            if( "0000".equals( xpay.m_szResCode ) || "AV11".equals( xpay.m_szResCode ) ) {
                logger.debug("\t++++++++++++++++++\t 부분취소 요청 완료 \t++++++++++++++++++");
                
                for (int i = 0; i < xpay.ResponseNameCount(); i++)
                {
                    for (int j = 0; j < xpay.ResponseCount(); j++)
                    {
                        pgMap.put(xpay.ResponseName(i), xpay.Response(xpay.ResponseName(i), j));
                    }
                }
                
                try{
                    //최종결제요청 결과 성공 DB처리
                    logger.debug("\t++++++++++++++++++\t 부분취소 요청 결과 DB 처리 \t++++++++++++++++++");
                    
                    pgMap.put("OM_IDX", commandMap.get("OM_IDX"));
                    pgMap.put("LGD_AMOUNT", LGD_CANCELAMOUNT);
                    pgMap.put("LGD_TXNAME", "PartialCancel");
                    pgMap.put("PAY_MST_TR_STATUS",     "C");
                    
                    this.paymentService.insertLgPayMaster(pgMap);

                }catch(Exception e){
                    resultCode = "CR9001";                
                    resultMsg = "부분취소 요청 결과 DB 처리실패";
                    logger.debug("\t++++++++++++++++++\t 부분취소 요청 결과 DB 처리실패 \t++++++++++++++++++");        
                    logger.info(e.getMessage());
                }                  
            }else {
                resultCode = "CR9002";
                resultMsg = "부분취소 실패";
                logger.debug("\t++++++++++++++++++\t 부분취소 실패 \t++++++++++++++++++");                
            }
        }else {
            //2)API 요청 실패
            resultCode = "CR8001";
            resultMsg = "부분취소 API 요청 실패";
            logger.debug("\t++++++++++++++++++\t 부분취소 API 요청 실패 \t++++++++++++++++++");   
        }  
        
        
        pgMap.put("resultCode", resultCode);
        pgMap.put("resultMsg", resultMsg);
        
        return pgMap;
    }
    
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
    public Map<String, Object> pgCancel(Map<String, Object> commandMap, HttpServletRequest request) throws Exception
    {
        // 정상승인건에대한 LG유플러스으로 부터 내려받은 거래번호(LGD_TID)
        System.out.println("PAY_MST_TID================>"+commandMap.get("PAY_MST_TID"));
        String lgdTld = StringUtil.getString(commandMap.get("PAY_MST_TID"));   
        
        /* resultCode > 전체취소처리 결과 코드
         * AR0000 : 전체취소 완료
         * AR8001 : 전체취소 API 요청 실패
         * AR9001 : 전체취소 요청결과 DB 처리 실패
         * AR9002 : 전체취소 실패
         */                
        
        Map<String,Object> pgMap = new HashMap<String,Object>();
        String resultCode = "AR0000";
        
        /*
         * [결제취소 요청 페이지]
         *
         * LG유플러스으로 부터 내려받은 거래번호(LGD_TID)를 가지고 취소 요청을 합니다.(파라미터 전달시 POST를 사용하세요)
         * (승인시 LG유플러스으로 부터 내려받은 PAYKEY와 혼동하지 마세요.)
         */
        String CST_PLATFORM         = Code.PG_CST_PLATFORM;                                //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
        String CST_MID              = Code.PG_CST_MID;                                     //LG유플러스으로 부터 발급받으신 상점아이디를 입력하세요.
        String LGD_MID              = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;  //테스트 아이디는 't'를 제외하고 입력하세요.
                                                                                            //상점아이디(자동생성)
        String LGD_TID              = lgdTld;                                               //LG유플러스으로 부터 내려받은 거래번호(LGD_TID)

        /* ※ 중요
        * 환경설정 파일의 경우 반드시 외부에서 접근이 가능한 경로에 두시면 안됩니다.
        * 해당 환경파일이 외부에 노출이 되는 경우 해킹의 위험이 존재하므로 반드시 외부에서 접근이 불가능한 경로에 두시기 바랍니다. 
        * 예) [Window 계열] C:\inetpub\wwwroot\lgdacom ==> 절대불가(웹 디렉토리)
        */
        String configPath = propertiesService.getString("payment.lg.xpay.LGD_PG_CONFIG_PATH");
            
        LGD_TID                     = ( LGD_TID == null )?"":LGD_TID; 
        
        XPayClient xpay = new XPayClient();
        xpay.Init(configPath, CST_PLATFORM);
        xpay.Init_TX(LGD_MID);
        xpay.Set("LGD_TXNAME", "Cancel");
        xpay.Set("LGD_TID", LGD_TID);
     
        /*
         * 1. 결제취소 요청 결과처리
         *
         * 취소결과 리턴 파라미터는 연동메뉴얼을 참고하시기 바랍니다.
         *
         * [[[중요]]] 고객사에서 정상취소 처리해야할 응답코드
         * 1. 신용카드 : 0000, AV11  
         * 2. 계좌이체 : 0000, RF00, RF10, RF09, RF15, RF19, RF23, RF25 (환불진행중 응답건-> 환불결과코드.xls 참고)
         * 3. 나머지 결제수단의 경우 0000(성공) 만 취소성공 처리
         *
         */
        if (xpay.TX()) {
            //1)결제취소결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
            if( "0000".equals( xpay.m_szResCode ) || "AV11".equals( xpay.m_szResCode ) ) {
                logger.debug("\t++++++++++++++++++\t 전체취소 요청 완료 \t++++++++++++++++++");
                
                for (int i = 0; i < xpay.ResponseNameCount(); i++)
                {
                    for (int j = 0; j < xpay.ResponseCount(); j++)
                    {
                        pgMap.put(xpay.ResponseName(i), xpay.Response(xpay.ResponseName(i), j));
                    }
                }
                
                try{
                    //최종결제요청 결과 성공 DB처리
                    logger.debug("\t++++++++++++++++++\t 전체취소 요청 결과 DB 처리 \t++++++++++++++++++");
                    
                    pgMap.put("OM_IDX", commandMap.get("OM_IDX"));
                    pgMap.put("PAY_MST_PG_TXNAME", "Cancel");
                    pgMap.put("LGD_MID", commandMap.get("PAY_MST_MID"));
                    pgMap.put("LGD_TID", LGD_TID);
                    pgMap.put("PAY_MST_TR_STATUS",     "C");
                    pgMap.put("LGD_OID",commandMap.get("ORD_MST_CD"));
                    pgMap.put("LGD_PAYTYPE",commandMap.get("PAY_MST_PAYTYPE"));
                    pgMap.put("LGD_AMOUNT",commandMap.get("PAY_MST_AMOUNT"));
                    this.paymentService.insertLgPayMaster(pgMap);
                    
                    
                    //defaultDAO.insert("Payment.insertPaymentGate", pgMap);
                    
                }catch(Exception e){
                    resultCode = "AR9001";                
                    logger.debug("\t++++++++++++++++++\t 전체취소 요청 결과 DB 처리실패 \t++++++++++++++++++");        
                    logger.info(e.getMessage());
                }            
                
            }else {
                resultCode = "AR9002";
                logger.debug("\t++++++++++++++++++\t 전체취소 실패 \t++++++++++++++++++");                   
            }
        }else {
            //2)API 요청 실패 화면처리
            resultCode = "AR8001";
            logger.debug("\t++++++++++++++++++\t 전체취소 API 요청 실패 \t++++++++++++++++++");          
        }        
        
        pgMap.put("resultCode", resultCode);
        
        return pgMap;
    }
    
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
    public Map<String, Object> payNoteRes(Map<String, Object> commandMap, HttpServletRequest request) throws Exception
    {
        Map<String, Object> resultMap = new HashMap<String, Object>(); 
        
        String resultCode = "9999";
        
        String LGD_RESPCODE = "";           // 응답코드: 0000(성공) 그외 실패
        String LGD_RESPMSG = "";            // 응답메세지
        String LGD_MID = "";                // 상점아이디 
        String LGD_OID = "";                // 주문번호
        String LGD_AMOUNT = "";             // 거래금액
        String LGD_TID = "";                // LG유플러스에서 부여한 거래번호
        String LGD_PAYTYPE = "";            // 결제수단코드
        String LGD_PAYDATE = "";            // 거래일시(승인일시/이체일시)
        String LGD_HASHDATA = "";           // 해쉬값
        String LGD_FINANCECODE = "";        // 결제기관코드(은행코드)
        String LGD_FINANCENAME = "";        // 결제기관이름(은행이름)
        String LGD_ESCROWYN = "";           // 에스크로 적용여부
        String LGD_TIMESTAMP = "";          // 타임스탬프
        String LGD_ACCOUNTNUM = "";         // 계좌번호(무통장입금) 
        String LGD_CASTAMOUNT = "";         // 입금총액(무통장입금)
        String LGD_CASCAMOUNT = "";         // 현입금액(무통장입금)
        String LGD_CASFLAG = "";            // 무통장입금 플래그(무통장입금) - 'R':계좌할당, 'I':입금, 'C':입금취소 
        String LGD_CASSEQNO = "";           // 입금순서(무통장입금)
        String LGD_CASHRECEIPTNUM = "";     // 현금영수증 승인번호
        String LGD_CASHRECEIPTSELFYN = "";  // 현금영수증자진발급제유무 Y: 자진발급제 적용, 그외 : 미적용
        String LGD_CASHRECEIPTKIND = "";    // 현금영수증 종류 0: 소득공제용 , 1: 지출증빙용
        String LGD_PAYER = "";              // 임금자명
        
        /*
         * 구매정보
         */
        String LGD_BUYER = "";              // 구매자
        String LGD_PRODUCTINFO = "";        // 상품명
        String LGD_BUYERID = "";            // 구매자 ID
        String LGD_BUYERADDRESS = "";       // 구매자 주소
        String LGD_BUYERPHONE = "";         // 구매자 전화번호
        String LGD_BUYEREMAIL = "";         // 구매자 이메일
        String LGD_BUYERSSN = "";           // 구매자 주민번호
        String LGD_PRODUCTCODE = "";        // 상품코드
        String LGD_RECEIVER = "";           // 수취인
        String LGD_RECEIVERPHONE = "";      // 수취인 전화번호
        String LGD_DELIVERYINFO = "";       // 배송지

        LGD_RESPCODE            = StringUtil.getString(commandMap.get("LGD_RESPCODE"));
        LGD_RESPMSG             = StringUtil.getString(commandMap.get("LGD_RESPMSG"));
        LGD_MID                 = StringUtil.getString(commandMap.get("LGD_MID"));
        LGD_OID                 = StringUtil.getString(commandMap.get("LGD_OID"));
        LGD_AMOUNT              = StringUtil.getString(commandMap.get("LGD_AMOUNT"));
        LGD_TID                 = StringUtil.getString(commandMap.get("LGD_TID"));
        LGD_PAYTYPE             = StringUtil.getString(commandMap.get("LGD_PAYTYPE"));
        LGD_PAYDATE             = StringUtil.getString(commandMap.get("LGD_PAYDATE"));
        LGD_HASHDATA            = StringUtil.getString(commandMap.get("LGD_HASHDATA"));
        LGD_FINANCECODE         = StringUtil.getString(commandMap.get("LGD_FINANCECODE"));
        LGD_FINANCENAME         = StringUtil.getString(commandMap.get("LGD_FINANCENAME"));
        LGD_ESCROWYN            = StringUtil.getString(commandMap.get("LGD_ESCROWYN"));
        LGD_TIMESTAMP           = StringUtil.getString(commandMap.get("LGD_TIMESTAMP"));
        LGD_ACCOUNTNUM          = StringUtil.getString(commandMap.get("LGD_ACCOUNTNUM"));
        LGD_CASTAMOUNT          = StringUtil.getString(commandMap.get("LGD_CASTAMOUNT"));
        LGD_CASCAMOUNT          = StringUtil.getString(commandMap.get("LGD_CASCAMOUNT"));
        LGD_CASFLAG             = StringUtil.getString(commandMap.get("LGD_CASFLAG"));
        LGD_CASSEQNO            = StringUtil.getString(commandMap.get("LGD_CASSEQNO"));
        LGD_CASHRECEIPTNUM      = StringUtil.getString(commandMap.get("LGD_CASHRECEIPTNUM"));
        LGD_CASHRECEIPTSELFYN   = StringUtil.getString(commandMap.get("LGD_CASHRECEIPTSELFYN"));
        LGD_CASHRECEIPTKIND     = StringUtil.getString(commandMap.get("LGD_CASHRECEIPTKIND"));
        LGD_PAYER               = StringUtil.getString(commandMap.get("LGD_PAYER"));

        LGD_BUYER               = StringUtil.getString(commandMap.get("LGD_BUYER"));
        LGD_PRODUCTINFO         = StringUtil.getString(commandMap.get("LGD_PRODUCTINFO"));
        LGD_BUYERID             = StringUtil.getString(commandMap.get("LGD_BUYERID"));
        LGD_BUYERADDRESS        = StringUtil.getString(commandMap.get("LGD_BUYERADDRESS"));
        LGD_BUYERPHONE          = StringUtil.getString(commandMap.get("LGD_BUYERPHONE"));
        LGD_BUYEREMAIL          = StringUtil.getString(commandMap.get("LGD_BUYEREMAIL"));
        LGD_BUYERSSN            = StringUtil.getString(commandMap.get("LGD_BUYERSSN"));
        LGD_PRODUCTCODE         = StringUtil.getString(commandMap.get("LGD_PRODUCTCODE"));
        LGD_RECEIVER            = StringUtil.getString(commandMap.get("LGD_RECEIVER"));
        LGD_RECEIVERPHONE       = StringUtil.getString(commandMap.get("LGD_RECEIVERPHONE"));
        LGD_DELIVERYINFO        = StringUtil.getString(commandMap.get("LGD_DELIVERYINFO"));

        String LGD_MERTKEY = Code.PG_LGD_MERTKEY; //mertkey

        StringBuffer sb = new StringBuffer();
        sb.append(LGD_MID);
        sb.append(LGD_OID);
        sb.append(LGD_AMOUNT);
        sb.append(LGD_RESPCODE);
        sb.append(LGD_TIMESTAMP);
        sb.append(LGD_MERTKEY);

        byte[] bNoti = sb.toString().getBytes();
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(bNoti);

        StringBuffer strBuf = new StringBuffer();
        for (int i=0 ; i < digest.length ; i++) {
            int c = digest[i] & 0xff;
            if (c <= 15){
                strBuf.append("0");
            }
            strBuf.append(Integer.toHexString(c));
        }

        String LGD_HASHDATA2 = strBuf.toString();  //상점검증 해쉬값  
        
        /*
         * 상점 처리결과 리턴메세지
         *
         * OK  : 상점 처리결과 성공
         * 그외 : 상점 처리결과 실패
         *
         * ※ 주의사항 : 성공시 'OK' 문자이외의 다른문자열이 포함되면 실패처리 되오니 주의하시기 바랍니다.
         */    
        String resultMSG = "";  
        
        if (LGD_HASHDATA2.trim().equals(LGD_HASHDATA)) { //해쉬값 검증이 성공이면
            if ( ("0000".equals(LGD_RESPCODE.trim())) ){ //결제가 성공이면
                if( "R".equals( LGD_CASFLAG.trim() ) ) {
                    /*
                     * 무통장 할당 성공 결과 상점 처리(DB) 부분
                     * 상점 결과 처리가 정상이면 "OK"
                     */    
                    logger.error("[ pgMap Info ] : " + commandMap);
                    
                    resultCode = "0001";
                    resultMSG = "OK";   
                    
                }else if( "I".equals( LGD_CASFLAG.trim() ) ) {
                    /*
                     * 무통장 입금 성공 결과 상점 처리(DB) 부분
                     * 상점 결과 처리가 정상이면 "OK"
                     */    
                    
                    logger.error("[ pgMap Info ] : " + commandMap);
                    try
                    {
                        if (LGD_CASTAMOUNT.equals(LGD_AMOUNT))
                        {
                            // Payment Gate Update
                            if (this.defaultDAO.update("Payment.updatePayMst", commandMap) > 0)
                            {
                                resultCode = "0000";
                                resultMSG = "OK";
                            }
                            else
                            {
                                throw new Exception();
                            }
                        }
                        else
                        {
                            resultCode = "0003";
                            resultMSG = "OK";
                        }
                    }
                    catch (Exception e)
                    {
                        resultMSG = "상점 DB처리 실패 (입금결과 수정 또는 주문상태값 변경 오류)";
                        logger.error("\t++++++++++++++++++\t "+ resultMSG +" \t++++++++++++++++++");
                    }
                }else if( "C".equals( LGD_CASFLAG.trim() ) ) {
                    /*
                     * 당일취소가능
                     * 
                     * 무통장 입금취소 성공 결과 상점 처리(DB) 부분
                     * 상점 결과 처리가 정상이면 "OK"
                     */    
                    
                    logger.error("[ pgMap Info ] : " + commandMap);
                    try
                    {
                        // Payment Gate Update
                        if (this.defaultDAO.update("Payment.updatePaymentGateVirtual", commandMap) > 0)
                        {
                            resultCode = "0002";
                            resultMSG = "OK";
                            // TODO :  환불신청으로 상태값 수정
                        }
                        else
                        {
                            throw new Exception();
                        }
                    }
                    catch (Exception e)
                    {
                        resultMSG = "상점 DB처리 실패 (주문취소처리 실패)";
                        logger.error("\t++++++++++++++++++\t "+ resultMSG +" \t++++++++++++++++++");
                    }
                }
            } else { //결제가 실패이면
                
                logger.error("[ pgMap Info ] : " + commandMap);
                
                /*
                 * 거래실패 결과 상점 처리(DB) 부분
                 * 상점결과 처리가 정상이면 "OK"
                 */  
                resultMSG = "OK";     
            }
        } else { //해쉬값이 검증이 실패이면
            
            logger.error("[ pgMap Info ] : " + commandMap);
            
            resultMSG = "결제결과 상점 DB처리(LGD_CASNOTEURL) 해쉬값 검증이 실패하였습니다.";
            logger.error("\t++++++++++++++++++\t "+ resultMSG +" \t++++++++++++++++++");
        }
        resultMap.put("PAY_MST_OID", StringUtil.getString(commandMap.get("LGD_OID")));
        resultMap.put("resultCode", resultCode);
        resultMap.put("resultMSG", resultMSG);
        
        return resultMap;
    }

}
