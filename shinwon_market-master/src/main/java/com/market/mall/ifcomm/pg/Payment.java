package com.market.mall.ifcomm.pg;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.epasscni.util.StringUtil;
import com.kicc.EasyPayClient;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.co.lgcns.module.lite.CnsPayWebConnector;
import lgdacom.XPayClient.XPayClient;


/**
 * @PackageName: com.market.mall.ifcomm.pg
 * @FileName : Payment.java
 * @Date : 2015. 10. 20.
 * @프로그램 설명 : pg 처리하는 Class
 * @author DEV_KANGHYUNKYU
 */
@Component
public class Payment {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;
	
	@Resource (name="paymentService") 
	PaymentService paymentService;
	
	/**
	* <pre>
	* 1. MethodName : lgPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : LG UPLUS 결제 승인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	/**
	public Map<String, Object> lgPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] LG UPLUS 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		XPayClient xpay = new XPayClient();
		
		//LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
	    String configPath = this.propertiesService.getString("payment.lg.config.path");  
	    
	    String CST_PLATFORM                 = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
	    String CST_MID                      = this.propertiesService.getString("payment.lg.xpay.CST_MID");
	    String LGD_MID                      = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;
	    String LGD_PAYKEY                   = request.getParameter("LGD_PAYKEY");

	    //해당 API를 사용하기 위해 WEB-INF/lib/XPayClient.jar 를 Classpath 로 등록하셔야 합니다. 
	   	boolean isInitOK = xpay.Init(configPath, CST_PLATFORM);   	

	   	if( !isInitOK ) {
	    	//API 초기화 실패 화면처리
	        logger.error( "결제요청을 초기화 하는데 실패하였습니다.");
	        logger.error( "LG유플러스에서 제공한 환경파일이 정상적으로 설치 되었는지 확인하시기 바랍니다.");        
	        logger.error( "mall.conf에는 Mert ID = Mert Key 가 반드시 등록되어 있어야 합니다.");
	        logger.error( "문의전화 LG유플러스 1544-7772");
	   	}else{      
	   		try{
	   			/*
	   	   	     *************************************************
	   	   	     * 1.최종결제 요청(수정하지 마세요) - END
	   	   	     *************************************************
	   	   	     */
	/**
		    	xpay.Init_TX(LGD_MID);
		    	xpay.Set("LGD_TXNAME", "PaymentByKey");
		    	xpay.Set("LGD_PAYKEY", LGD_PAYKEY);
		    
		    	//금액을 체크하시기 원하는 경우 아래 주석을 풀어서 이용하십시요.
		    	@SuppressWarnings("unchecked")
				Map<String, Object> cartMap = (Map<String, Object>) commandMap.get("cartMap");
		    	String DB_AMOUNT = StringUtil.getString(cartMap.get("MEM_CRT_PAYMENT_TOTAL"),"9999999"); //세션으로부터 결제요청 직전 저장한 대상 금액을 가져와 비교합니다.
		    	xpay.Set("LGD_AMOUNTCHECKYN", "Y");
		    	xpay.Set("LGD_AMOUNT", DB_AMOUNT);
		    
	    	}catch(Exception e) {
	    		logger.error("LG유플러스 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다. ");
	    		logger.error(""+e.getMessage());    	
	    	}
	   	}

	    /*
	     * 2. 최종결제 요청 결과처리
	     *
	     * 최종 결제요청 결과 리턴 파라미터는 연동메뉴얼을 참고하시기 바랍니다.
	     */
	/**
	     if ( xpay.TX() ) {
	         //1)결제결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
	         logger.info( "결제요청이 완료되었습니다.  ");
	         logger.info( "TX 결제요청 Response_code = " + xpay.m_szResCode);
	         logger.info( "TX 결제요청 Response_msg = " + xpay.m_szResMsg);
	         
	         logger.info("거래번호 : " + xpay.Response("LGD_TID",0));
	         logger.info("상점아이디 : " + xpay.Response("LGD_MID",0));
	         logger.info("상점주문번호 : " + xpay.Response("LGD_OID",0));
	         logger.info("결제금액 : " + xpay.Response("LGD_AMOUNT",0));
	         logger.info("결과코드 : " + xpay.Response("LGD_RESPCODE",0));
	         logger.info("결과메세지 : " + xpay.Response("LGD_RESPMSG",0));
	         
	         for (int i = 0; i < xpay.ResponseNameCount(); i++)
	         {
	             logger.info(xpay.ResponseName(i) + " = ");
	             for (int j = 0; j < xpay.ResponseCount(); j++)
	             {
	                 logger.info("\t" + xpay.Response(xpay.ResponseName(i), j));
	             }
	         }
	         logger.info("<p>");
	         
	         if( "0000".equals( xpay.m_szResCode ) ) {
	         	//최종결제요청 결과 성공 DB처리
	         	logger.debug("최종결제요청 결과 성공 DB처리하시기 바랍니다.");
	         	
	         	//최종결제요청 결과 성공 DB처리 실패시 Rollback 처리
	         	boolean isDBOK = true; //DB처리 실패시 false로 변경해 주세요.
	         	if( !isDBOK ) {
	         		xpay.Rollback("상점 DB처리 실패로 인하여 Rollback 처리 [TID:" +xpay.Response("LGD_TID",0)+",MID:" + xpay.Response("LGD_MID",0)+",OID:"+xpay.Response("LGD_OID",0)+"]");
	         		
	                 logger.error( "TX Rollback Response_code = " + xpay.Response("LGD_RESPCODE",0));
	                 logger.error( "TX Rollback Response_msg = " + xpay.Response("LGD_RESPMSG",0));
	         		
	                 if( "0000".equals( xpay.m_szResCode ) ) {
	                 	logger.info("자동취소가 정상적으로 완료 되었습니다.");
	                 }else{
	         			logger.info("자동취소가 정상적으로 처리되지 않았습니다.");
	                 }
	         	}
	         	
	         }else{
	         	//최종결제요청 결과 실패 DB처리
	         	logger.error("최종결제요청 결과 실패 DB처리하시기 바랍니다.");          
	         }
	     }else {
	         //2)API 요청실패 화면처리
	         logger.error( "결제요청이 실패하였습니다.  ");
	         logger.error( "TX 결제요청 Response_code = " + xpay.m_szResCode);
	         logger.error( "TX 결제요청 Response_msg = " + xpay.m_szResMsg);
	         
	     	//최종결제요청 결과 실패 DB처리
	     	logger.debug("최종결제요청 결과 실패 DB처리하시기 바랍니다.");    
	     }
	     
	    commandMap.put("PAY_MST_TR_STATUS",		"A");
	    commandMap.put("PAY_MST_RESPCODE",			xpay.m_szResCode);
	    commandMap.put("PAY_MST_RESPMSG",			xpay.m_szResMsg);
		commandMap.put("PAY_MST_MID",				xpay.Response("LGD_MID",0));
		commandMap.put("PAY_MST_OID",				xpay.Response("LGD_OID",0));
		commandMap.put("PAY_MST_AMOUNT",			xpay.Response("LGD_AMOUNT",0));
		commandMap.put("PAY_MST_TID",				xpay.Response("LGD_TID",0));
		commandMap.put("PAY_MST_PAYTYPE",			xpay.Response("LGD_PAYTYPE",0));
		commandMap.put("PAY_MST_PAYDATE",			xpay.Response("LGD_PAYDATE",0));
		commandMap.put("PAY_MST_HASHDATA",			xpay.Response("LGD_HASHDATA",0));
		commandMap.put("PAY_MST_FINANCECODE",		xpay.Response("LGD_FINANCECODE",0));
		commandMap.put("PAY_MST_FINANCENAME",		xpay.Response("LGD_FINANCENAME",0));
		commandMap.put("PAY_MST_ESCROWYN",			xpay.Response("LGD_ESCROWYN",0));
		commandMap.put("PAY_MST_TRANSAMOUNT",		xpay.Response("LGD_TRANSAMOUNT",0));
		commandMap.put("PAY_MST_EXCHANGERATE",		xpay.Response("LGD_EXCHANGERATE",0));
		commandMap.put("PAY_MST_BUYER",			xpay.Response("LGD_BUYER",0));
		commandMap.put("PAY_MST_BUYERID",			xpay.Response("LGD_BUYERID",0));
		commandMap.put("PAY_MST_BUYERPHONE",		xpay.Response("LGD_BUYERPHONE",0));
		commandMap.put("PAY_MST_BUYEREMAIL",		xpay.Response("LGD_BUYEREMAIL",0));
		commandMap.put("PAY_MST_PRODUCTINFO",		xpay.Response("LGD_PRODUCTINFO",0));
		commandMap.put("PAY_MST_CARDINSTALLMONTH",	xpay.Response("LGD_CARDINSTALLMONTH",0));
		commandMap.put("PAY_MST_CARDNOINTYN",		xpay.Response("LGD_CARDNOINTYN",0));
		commandMap.put("PAY_MST_FINANCEAUTHNUM",	xpay.Response("LGD_FINANCEAUTHNUM",0));
		commandMap.put("PAY_MST_CASHRECEIPTNUM",	xpay.Response("LGD_CASHRECEIPTNUM",0));
		commandMap.put("PAY_MST_CASHRECEIPTSELFYN",xpay.Response("LGD_CASHRECEIPTSELFYN",0));
		commandMap.put("PAY_MST_CASHRECEIPTKIND",	xpay.Response("LGD_CASHRECEIPTKIND",0));
		commandMap.put("PAY_MST_ACCOUNTNUM",		xpay.Response("LGD_ACCOUNTNUM",0));
		commandMap.put("PAY_MST_CASTAMOUNT",		xpay.Response("LGD_CASTAMOUNT",0));
		commandMap.put("PAY_MST_CASCAMOUNT",		xpay.Response("LGD_CASCAMOUNT",0));
		commandMap.put("PAY_MST_CASFLAG",			xpay.Response("LGD_CASFLAG",0));
		commandMap.put("PAY_MST_CASSEQNO",			xpay.Response("LGD_CASSEQNO",0));
		commandMap.put("PAY_MST_TELNO",			xpay.Response("LGD_TELNO",0));
		commandMap.put("PAY_MST_CLOSEDATE",		commandMap.get("LGD_CLOSEDATE"));
		
		//logger.info("#####주문직후 LGD_TIMESTAMP ==== "+xpay.Response("LGD_TIMESTAMP",0));
		
		String PAY_MST_PAYTYPE = StringUtil.getString(commandMap.get("PAY_MST_PAYTYPE"));
		
		if("SC0040".equals(PAY_MST_PAYTYPE)){
			commandMap.put("PAY_MST_PAYDATE", "00000000000000"); /* 무통장만 00000000000000 처리 */
	/**
		}else{
			commandMap.put("PAY_MST_CLOSEDATE", "00000000000000"); /* 무통장 제외 기타 결제수단은 00000000000000 처리 */
	/**
		}
		
		logger.info("#######[END] LG UPLUS 결제 승인  [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		return commandMap;
	}
	*/
	
	/**
	* <pre>
	* 1. MethodName : lgCancelPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : LG UPLUS 결제 취소 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	/**
	public Map<String, Object> lgCancelPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] LG UPLUS 전체취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		//LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
		String configPath = this.propertiesService.getString("payment.lg.config.path");  
		
		String CST_PLATFORM                 = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
		String CST_MID                      = this.propertiesService.getString("payment.lg.xpay.CST_MID");
		String LGD_MID                      = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;
		String LGD_TID              		= StringUtil.getString(commandMap.get("PAY_MST_TID")); //LG유플러스으로 부터 내려받은 거래번호(LGD_TID)
		
		// 환불계좌정보
		String LGD_RFACCOUNTNUM				= StringUtil.getString(commandMap.get("LGD_RFACCOUNTNUM"));
		String LGD_RFBANKCODE				= StringUtil.getString(commandMap.get("LGD_RFBANKCODE"));
		String LGD_RFCUSTOMERNAME			= StringUtil.getString(commandMap.get("LGD_RFCUSTOMERNAME"));
		String LGD_RFPHONE					= StringUtil.getString(commandMap.get("LGD_RFPHONE"));
		
		LGD_TID     				= ( LGD_TID == null )?"":LGD_TID; 
	    
	    XPayClient xpay = new XPayClient();
	    xpay.Init(configPath, CST_PLATFORM);
	    xpay.Init_TX(LGD_MID);
	    xpay.Set("LGD_TXNAME", "Cancel");
	    xpay.Set("LGD_TID", LGD_TID);
	    
	    xpay.Set("LGD_RFACCOUNTNUM", LGD_RFACCOUNTNUM);
	    xpay.Set("LGD_RFBANKCODE", LGD_RFBANKCODE);
	    xpay.Set("LGD_RFCUSTOMERNAME", LGD_RFCUSTOMERNAME);
	    xpay.Set("LGD_RFPHONE", LGD_RFPHONE);
	 
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
	/**
	    if (xpay.TX()) {
	        //1)결제취소결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
	        logger.info("결제 취소요청이 완료되었습니다.  <br>");
	        logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	        logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }else {
	        //2)API 요청 실패 화면처리
	        logger.info("결제 취소요청이 실패하였습니다.  <br>");
	        logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	        logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }
		
		commandMap.put("PAY_MST_TR_STATUS",			"C"); // 취소승인
		commandMap.put("PAY_MST_RESPCODE",			xpay.Response("LGD_RESPCODE",0));
		commandMap.put("PAY_MST_RESPMSG",			xpay.Response("LGD_RESPMSG",0));
		
		//* [[[중요]]] 고객사에서 정상취소 처리해야할 응답코드
	    //* 1. 신용카드 : 0000, AV11  
	    //* 2. 계좌이체 : 0000, RF00, RF10, RF09, RF15, RF19, RF23, RF25 (환불진행중 응답건-> 환불결과코드.xls 참고)
	    //* 3. 나머지 결제수단의 경우 0000(성공) 만 취소성공 처리
		if("0000".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 정상-환불성공
		   "AV11".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 정상-신용카드 정상환불
		   "RF00".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 정상-환불 정상처리
		   "RF10".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))))			// 오프라인처리-환불기간 초과(환불진행중)
		{
			commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "Y"); // 환불완료
		}
		else if ("RF09".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||	// 백그라운드 처리-결제기관 미응답(환불진행중)
		   "RF15".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 백그라운드 처리-환불요청 기수행(환불진행중)
		   "RF19".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 백그라운드 처리-환불 타임아웃(환불진행중)
		   "RF23".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 상태응답-환불진행중
		   "RF25".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))))			// 상태응답-환불진행중
		{
			commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "N"); // 환불미완료
		}
		else
		{
			commandMap.put("XPAY_RESULT_YN", "N"); // 오류
			commandMap.put("XPAY_REFUND_YN", "N"); // 환불미완료
		}
		
        logger.info( "결제정상처리여부  = " + StringUtil.getString(commandMap.get("XPAY_RESULT_YN")));
        logger.info("#######[END] LG UPLUS 전체취소 [ORD_MST_CD : "+ StringUtil.getString(commandMap.get("ORD_MST_CD")) +"] ########");
        
        commandMap.put("PAY_MST_PAYDATE", "");//pay_mst_paydate는 초기화한다. 빈값인 경우 sysdate 가 들어간다. 취소시에는 pg사에서 취소날짜를 받아오지 못하기 때문에 이렇게 처리.
		
        logger.info("#######[END] LG UPLUS 전체취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		return commandMap;
	}
	*/
	
	/**
	* <pre>
	* 1. MethodName : lgPartialCancelPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : LG UPLUS 부분취소
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	/**
	public Map<String, Object> lgPartialCancelPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] LG UPLUS 부분 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
   	 
		//LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
		String configPath = this.propertiesService.getString("payment.lg.config.path");  
		
		String CST_PLATFORM                 = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
		String CST_MID                      = this.propertiesService.getString("payment.lg.xpay.CST_MID");
		String LGD_MID                      = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;
		String LGD_TID              		= StringUtil.getString(commandMap.get("PAY_MST_TID")); //LG유플러스으로 부터 내려받은 거래번호(LGD_TID)
	    String LGD_CANCELAMOUNT     	= StringUtil.getString(commandMap.get("CANCEL_PRICE"));   //부분취소 금액
    	String LGD_REMAINAMOUNT     	= StringUtil.getString(commandMap.get("REMAIN_PAYMENT_PRICE"));             //취소전 남은 금액 
	    
	    // 환불계좌정보
		String LGD_RFACCOUNTNUM				= StringUtil.getString(commandMap.get("LGD_RFACCOUNTNUM"));
		String LGD_RFBANKCODE				= StringUtil.getString(commandMap.get("LGD_RFBANKCODE"));
		String LGD_RFCUSTOMERNAME			= StringUtil.getString(commandMap.get("LGD_RFCUSTOMERNAME"));
		String LGD_RFPHONE					= StringUtil.getString(commandMap.get("LGD_RFPHONE"));
		
		logger.info("LGD_TID======"+LGD_TID);
		logger.info("LGD_CANCELAMOUNT======"+LGD_CANCELAMOUNT);
		logger.info("LGD_REMAINAMOUNT======"+LGD_REMAINAMOUNT);
		logger.info("LGD_RFACCOUNTNUM======"+LGD_RFACCOUNTNUM);
		logger.info("LGD_RFBANKCODE======"+LGD_RFBANKCODE);
		logger.info("LGD_RFCUSTOMERNAME======"+LGD_RFCUSTOMERNAME);
		logger.info("LGD_RFPHONE======"+LGD_RFPHONE);
		
	        
	    XPayClient xpay = new XPayClient();
	    xpay.Init(configPath, CST_PLATFORM);
	    xpay.Init_TX(LGD_MID);
	  	xpay.Set("LGD_TXNAME", "PartialCancel");
	    xpay.Set("LGD_TID", LGD_TID);    
	    xpay.Set("LGD_CANCELAMOUNT", LGD_CANCELAMOUNT);
	    xpay.Set("LGD_REMAINAMOUNT", LGD_REMAINAMOUNT);
//	    xpay.Set("LGD_CANCELTAXFREEAMOUNT", LGD_CANCELTAXFREEAMOUNT);
		xpay.Set("LGD_RFBANKCODE", LGD_RFBANKCODE);
	    xpay.Set("LGD_RFACCOUNTNUM", LGD_RFACCOUNTNUM);
	    xpay.Set("LGD_RFCUSTOMERNAME", LGD_RFCUSTOMERNAME);
	    xpay.Set("LGD_RFPHONE", LGD_RFPHONE);
		
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
	/**
	    if (xpay.TX()) {
	        //1)결제취소결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
	        logger.info("결제 취소요청이 완료되었습니다.  <br>");
	        logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	        logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }else {
	        //2)API 요청 실패 화면처리
	        logger.info("결제 취소요청이 실패하였습니다.  <br>");
	        logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	        logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }
		
		commandMap.put("PAY_MST_TR_STATUS",			"C"); // 취소승인
		commandMap.put("PAY_MST_RESPCODE",			xpay.Response("LGD_RESPCODE",0)); //부분취소 응답코드
		commandMap.put("PAY_MST_RESPMSG",			xpay.Response("LGD_RESPMSG",0)); //응답메세지
		commandMap.put("PAY_MST_AMOUNT",			LGD_CANCELAMOUNT); //취소할 금액
		
		//* [[[중요]]] 고객사에서 정상취소 처리해야할 응답코드
	    //* 1. 신용카드 : 0000, AV11  
	    //* 2. 계좌이체 : 0000, RF00, RF10, RF09, RF15, RF19, RF23, RF25 (환불진행중 응답건-> 환불결과코드.xls 참고)
	    //* 3. 나머지 결제수단의 경우 0000(성공) 만 취소성공 처리
		if("0000".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 정상-환불성공
		   "AV11".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 정상-신용카드 정상환불
		   "RF00".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 정상-환불 정상처리
		   "RF10".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))))			// 오프라인처리-환불기간 초과(환불진행중)
		{
			commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "Y"); // 환불완료
		}
		else if ("RF09".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||	// 백그라운드 처리-결제기관 미응답(환불진행중)
		   "RF15".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 백그라운드 처리-환불요청 기수행(환불진행중)
		   "RF19".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 백그라운드 처리-환불 타임아웃(환불진행중)
		   "RF23".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))) ||		// 상태응답-환불진행중
		   "RF25".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))))			// 상태응답-환불진행중
		{
			commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "N"); // 환불미완료
		}
		else
		{
			commandMap.put("XPAY_RESULT_YN", "N"); // 오류
			commandMap.put("XPAY_REFUND_YN", "N"); // 환불미완료
		}
		
        logger.debug( "결제정상처리여부  = " + StringUtil.getString(commandMap.get("XPAY_RESULT_YN")));
        logger.info("#######[END] LG UPLUS 부분 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");

		return commandMap;
    }
    */
	
	/**
	* <pre>
	* 1. MethodName : lgCyberAccountPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : LG UPLUS 가상계좌 발급
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	/**
	public Map<String, Object> lgCyberAccountPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] LG UPLUS 가상계좌 발급 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		XPayClient xpay = new XPayClient();
		
		String accountPid = "";
		// 구매자 개인식별번호 가져오기 위한 USER 정보
		User user = SessionsUser.getSessionUser(request);
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			//accountPid = user.getMEM_MST_MEMBER_NO(); //회원인 경우에는 회원번호
			accountPid = "abcde";
		}else{
			accountPid = StringUtil.getString(commandMap.get("ORD_MST_CD"),"").substring(1); //비회원인 경우에는 T를 제외한 주문번호
		}
		
		logger.info("accountPid 개인식별번호======================"+accountPid);
		
		//LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
	    String configPath = this.propertiesService.getString("payment.lg.config.path");  
	    
	    String CST_PLATFORM                 = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
	    String CST_MID                      = this.propertiesService.getString("payment.lg.xpay.CST_MID");
	    String LGD_MID                      = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;
	    
	    /*
	     * [가상계좌 발급/변경요청 페이지]
	     *
	     *
	     * 가상계좌 발급 변경(CHANGE)은 금액과 마감일만 변경 할수 있습니다. 
	     */
	/**
	    /* 필수 */
	/**
	    String LGD_METHOD   		  = "ASSIGN";														//ASSIGN:할당, CHANGE:변경
	    String LGD_OID                = request.getParameter("LGD_OID");					  //주문번호(상점정의 유니크한 주문번호를 입력하세요)
	    String LGD_AMOUNT     		  = request.getParameter("LGD_AMOUNT");             	  //금액("," 를 제외한 금액을 입력하세요)
	    String LGD_PRODUCTINFO		  = request.getParameter("LGD_PRODUCTINFO");			  //상품정보
	    String LGD_BUYER       		  = request.getParameter("LGD_BUYER");			  		  //구매자명
		String LGD_ACCOUNTOWNER       = request.getParameter("LGD_ACCOUNTOWNER");			  //입금자명
		String LGD_ACCOUNTPID		  = accountPid;		  	  //구매자 개인식별변호 (6자리~13자리)(옵션)
		String LGD_BUYERPHONE		  = request.getParameter("LGD_BUYERPHONE");			  	  //구매자휴대폰번호	
		String LGD_BUYEREMAIL		  = request.getParameter("LGD_BUYEREMAIL");			  	  //구매자이메일(옵션)
	    
	    String LGD_BANKCODE        	  = request.getParameter("LGD_BANKCODE");				  //입금계좌은행코드
		String LGD_CASHRECEIPTUSE	  = request.getParameter("LGD_CASHRECEIPTUSE");			  //현금영수증 발행구분('1':소득공제, '2':지출증빙)
		String LGD_CASHCARDNUM	  	  = request.getParameter("LGD_CASHCARDNUM");			  //현금영수증 카드번호
		String LGD_CLOSEDATE		  = request.getParameter("LGD_CLOSEDATE");				  //입금 마감일
		String LGD_TAXFREEAMOUNT	  = request.getParameter("LGD_TAXFREEAMOUNT");		  	  //면세금액
	    String LGD_CASNOTEURL		  = request.getParameter("LGD_CASNOTEURL");    		      	  //입금결과 처리를 위한 상점페이지를 반드시 설정해 주세요.
	    
	    LGD_OID       		    	  = ( LGD_OID == null )?"":LGD_OID;
	    LGD_AMOUNT   		    	  = ( LGD_AMOUNT == null )?"":LGD_AMOUNT;
	    LGD_PRODUCTINFO				  = ( LGD_PRODUCTINFO == null ) ?"":LGD_PRODUCTINFO;
	    
	    LGD_BANKCODE				  = ( LGD_BANKCODE == null ) ?"":LGD_BANKCODE;
	    LGD_CASHRECEIPTUSE			  = ( LGD_CASHRECEIPTUSE == null ) ? "":LGD_CASHRECEIPTUSE;
	    LGD_CASHCARDNUM				  = ( LGD_CASHCARDNUM == null ) ? "":LGD_CASHCARDNUM;
	    LGD_CLOSEDATE				  = ( LGD_CLOSEDATE == null ) ? "":LGD_CLOSEDATE;
	    LGD_CASNOTEURL				  = ( LGD_CASNOTEURL == null ) ? "":LGD_CASNOTEURL;
	    LGD_TAXFREEAMOUNT			  = ( LGD_TAXFREEAMOUNT == null ) ? "":LGD_TAXFREEAMOUNT;
	    
	    LGD_BUYER			  		  = ( LGD_BUYER == null ) ? "":LGD_BUYER;
	    LGD_ACCOUNTOWNER			  = ( LGD_ACCOUNTOWNER == null ) ? "":LGD_ACCOUNTOWNER;   
	    LGD_ACCOUNTPID			  	  = ( LGD_ACCOUNTPID == null ) ? "":LGD_ACCOUNTPID;
	    LGD_BUYERPHONE			  	  = ( LGD_BUYERPHONE == null ) ? "":LGD_BUYERPHONE;
	    LGD_BUYEREMAIL			  	  = ( LGD_BUYEREMAIL == null ) ? "":LGD_BUYEREMAIL;
	   
	    xpay.Init(configPath, CST_PLATFORM);
	    xpay.Init_TX(LGD_MID);
	    xpay.Set("LGD_TXNAME", "CyberAccount");
	    xpay.Set("LGD_METHOD", LGD_METHOD);
	    xpay.Set("LGD_OID", LGD_OID);
	    xpay.Set("LGD_AMOUNT", LGD_AMOUNT);
	    xpay.Set("LGD_PRODUCTINFO", LGD_PRODUCTINFO);
	    xpay.Set("LGD_BANKCODE", LGD_BANKCODE);
	    xpay.Set("LGD_CASHRECEIPTUSE", LGD_CASHRECEIPTUSE);
	    xpay.Set("LGD_CASHCARDNUM", LGD_CASHCARDNUM);
	    xpay.Set("LGD_CLOSEDATE", LGD_CLOSEDATE);
	    xpay.Set("LGD_CASNOTEURL", LGD_CASNOTEURL);
	    xpay.Set("LGD_TAXFREEAMOUNT", LGD_TAXFREEAMOUNT);
	    xpay.Set("LGD_BUYER", LGD_BUYER);
	    xpay.Set("LGD_ACCOUNTOWNER", LGD_ACCOUNTOWNER);
	    xpay.Set("LGD_ACCOUNTPID", LGD_ACCOUNTPID);
	    xpay.Set("LGD_BUYERPHONE", LGD_BUYERPHONE);
	    xpay.Set("LGD_BUYEREMAIL", LGD_BUYEREMAIL);
	    
	    /*
	     * 1. 가상계좌 발급/변경 요청 결과처리
	     *
	     * 결과 리턴 파라미터는 연동메뉴얼을 참고하시기 바랍니다.
	     */
	/**
	    if (xpay.TX()) {
	    	if( LGD_METHOD.equals("ASSIGN")){ //가상계좌 발급의 경우

	    		//1)가상계좌 발급/변경결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
	 	       	logger.info("가상계좌 발급 요청처리가 완료되었습니다.  <br>");
	 	       	logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	 	       	logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	     	        
	 	       	logger.info("거래번호 : " + xpay.Response("LGD_TID",0) + "<br>");
 	       		logger.info("결과코드 : " + xpay.Response("LGD_RESPCODE",0) + "<p>");

	        	for (int i = 0; i < xpay.ResponseNameCount(); i++)
	        	{
	        		logger.debug(xpay.ResponseName(i) + " = ");
	            	for (int j = 0; j < xpay.ResponseCount(); j++)
	            	{
	            		logger.debug("\t" + xpay.Response(xpay.ResponseName(i), j) + "<br>");
	            	}
	        	}
	        
	        }else{		//가상계좌 변경의 경우
	        	
	        	//가상계좌 변경결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
	        	logger.info("가상계좌 변경 요청처리가 완료되었습니다.  <br>");
	        	logger.info("결과코드 : " + xpay.Response("LGD_RESPCODE",0) + "<br>");
	        	logger.info("주문번호 : " + LGD_OID + "<br>");
	        	logger.info("입금액 : " + LGD_AMOUNT + "<br>");
	        	logger.info("입금마감일 : " + LGD_CLOSEDATE + "<p>");
	        	
	        }
	     }else {
	        //3)API 요청 실패 화면처리
	    	 logger.info("가상계좌 발급/변경 요청처리가 실패되었습니다.  <br>");
	    	 logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	    	 logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }
	     
	    commandMap.put("PAY_MST_TR_STATUS",		"A");
	    commandMap.put("PAY_MST_RESPCODE",			xpay.m_szResCode);
	    commandMap.put("PAY_MST_RESPMSG",			xpay.m_szResMsg);
		commandMap.put("PAY_MST_MID",				xpay.Response("LGD_MID",0));
		commandMap.put("PAY_MST_OID",				xpay.Response("LGD_OID",0));
		commandMap.put("PAY_MST_AMOUNT",			xpay.Response("LGD_AMOUNT",0));
		commandMap.put("PAY_MST_TID",				xpay.Response("LGD_TID",0));
		commandMap.put("PAY_MST_PAYTYPE",			xpay.Response("LGD_PAYTYPE",0));
		commandMap.put("PAY_MST_PAYDATE",			xpay.Response("LGD_PAYDATE",0));
		commandMap.put("PAY_MST_HASHDATA",			xpay.Response("LGD_HASHDATA",0));
		commandMap.put("PAY_MST_FINANCECODE",		xpay.Response("LGD_FINANCECODE",0));
		commandMap.put("PAY_MST_FINANCENAME",		xpay.Response("LGD_FINANCENAME",0));
		commandMap.put("PAY_MST_ESCROWYN",			xpay.Response("LGD_ESCROWYN",0));
		commandMap.put("PAY_MST_TRANSAMOUNT",		xpay.Response("LGD_TRANSAMOUNT",0));
		commandMap.put("PAY_MST_EXCHANGERATE",		xpay.Response("LGD_EXCHANGERATE",0));
		commandMap.put("PAY_MST_BUYER",			xpay.Response("LGD_BUYER",0));
		commandMap.put("PAY_MST_BUYERID",			xpay.Response("LGD_BUYERID",0));
		commandMap.put("PAY_MST_BUYERPHONE",		xpay.Response("LGD_BUYERPHONE",0));
		commandMap.put("PAY_MST_BUYEREMAIL",		xpay.Response("LGD_BUYEREMAIL",0));
		commandMap.put("PAY_MST_PRODUCTINFO",		xpay.Response("LGD_PRODUCTINFO",0));
		commandMap.put("PAY_MST_CARDINSTALLMONTH",	xpay.Response("LGD_CARDINSTALLMONTH",0));
		commandMap.put("PAY_MST_CARDNOINTYN",		xpay.Response("LGD_CARDNOINTYN",0));
		commandMap.put("PAY_MST_FINANCEAUTHNUM",	xpay.Response("LGD_FINANCEAUTHNUM",0));
		commandMap.put("PAY_MST_CASHRECEIPTNUM",	xpay.Response("LGD_CASHRECEIPTNUM",0));
		commandMap.put("PAY_MST_CASHRECEIPTSELFYN",xpay.Response("LGD_CASHRECEIPTSELFYN",0));
		commandMap.put("PAY_MST_CASHRECEIPTKIND",	xpay.Response("LGD_CASHRECEIPTKIND",0));
		commandMap.put("PAY_MST_ACCOUNTNUM",		xpay.Response("LGD_ACCOUNTNUM",0));
		commandMap.put("PAY_MST_CASTAMOUNT",		xpay.Response("LGD_CASTAMOUNT",0));
		commandMap.put("PAY_MST_CASCAMOUNT",		xpay.Response("LGD_CASCAMOUNT",0));
		commandMap.put("PAY_MST_CASFLAG",			xpay.Response("LGD_CASFLAG",0));
		commandMap.put("PAY_MST_CASSEQNO",			xpay.Response("LGD_CASSEQNO",0));
		commandMap.put("PAY_MST_TELNO",			xpay.Response("LGD_TELNO",0));
		commandMap.put("PAY_MST_CLOSEDATE",		commandMap.get("LGD_CLOSEDATE"));
		
		String PAY_MST_PAYTYPE = StringUtil.getString(commandMap.get("PAY_MST_PAYTYPE"));
		
		if("SC0040".equals(PAY_MST_PAYTYPE)){
			commandMap.put("PAY_MST_PAYDATE", "00000000000000"); /* 무통장만 00000000000000 처리 */
	/**
		}else{
			commandMap.put("PAY_MST_CLOSEDATE", "00000000000000"); /* 무통장 제외 기타 결제수단은 00000000000000 처리 */
	/**
		}
		
		logger.info("#######[END] LG UPLUS 가상계좌 발급 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		return commandMap;
	}
	*/
	
	/**
	* <pre>
	* 1. MethodName : lgCyberAccountCancelPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : LG UPLUS 정산요청(무통장 입금전에는 환불 아닌 정산요청 처리해야 함)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	/**
	public Map<String, Object> lgCyberAccountCancelPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] LG UPLUS 정산요청 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		//LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
		String configPath = this.propertiesService.getString("payment.lg.config.path");  
		
		String CST_PLATFORM                 = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
		String CST_MID                      = this.propertiesService.getString("payment.lg.xpay.CST_MID");
		String LGD_MID                      = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;
		String LGD_TID              		= StringUtil.getString(commandMap.get("PAY_MST_TID")); //LG유플러스으로 부터 내려받은 거래번호(LGD_TID)
		
		LGD_TID     				= ( LGD_TID == null )?"":LGD_TID; 
	    
	    XPayClient xpay = new XPayClient();
	    xpay.Init(configPath, CST_PLATFORM);
	    xpay.Init_TX(LGD_MID);
	    xpay.Set("LGD_TXNAME", "Settlement");
	    xpay.Set("LGD_TID", LGD_TID);
	    
	    /*
	     * 1. 정산 요청 결과처리
	     *
	     * 정산요청결과 리턴 파라미터는 연동메뉴얼을 참고하시기 바랍니다.
		 *
		 * [[[중요]]] 고객사에서 정상 정산처리해야할 응답코드
		 * 1, 모든 결제수단의 경우 0000(성공) 만 정산성공 처리
		 *
	     */
	/**
	    if (xpay.TX()) {
	        //1)정산요청결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
	        logger.info("정산요청이 완료되었습니다.  <br>");
	        logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	        logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }else {
	        //2)API 요청 실패 화면처리
	        logger.info("정산요청이 실패하였습니다.  <br>");
	        logger.info( "TX Response_code = " + xpay.m_szResCode + "<br>");
	        logger.info( "TX Response_msg = " + xpay.m_szResMsg + "<p>");
	    }
		
		commandMap.put("PAY_MST_TR_STATUS",			"C"); // 취소승인
		commandMap.put("PAY_MST_RESPCODE",			xpay.Response("LGD_RESPCODE",0));
		commandMap.put("PAY_MST_RESPMSG",			xpay.Response("LGD_RESPMSG",0));
	     
		//* [[[중요]]] 고객사에서 정상취소 처리해야할 응답코드
	    //* 1. 모든 결제수단의 경우 0000(성공) 만 정산성공 처리
		if("0000".equals(StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"))))			// 정산완료
		{
			commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "Y"); // 환불완료
		}
		else
		{
			commandMap.put("XPAY_RESULT_YN", "N"); // 오류
			commandMap.put("XPAY_REFUND_YN", "N"); // 환불미완료
		}

        logger.info( "정산요청 정상처리여부  = " + StringUtil.getString(commandMap.get("XPAY_RESULT_YN")));
        logger.info("#######[END] LG UPLUS 정산요청 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
        
        commandMap.put("PAY_MST_PAYDATE", "");//pay_mst_paydate는 초기화한다. 빈값인 경우 sysdate 가 들어간다. 취소시에는 pg사에서 취소날짜를 받아오지 못하기 때문에 이렇게 처리.

		return commandMap;
	}
	*/
	
	/**
	* <pre>
	* 1. MethodName : kakaoPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : 카카오페이 결제 승인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kakaoPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] 카카오페이 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		request.setCharacterEncoding("euc-kr");
		
		// 모듈이 설치되어 있는 경로 설정
	    CnsPayWebConnector connector = new CnsPayWebConnector();
	    
	    // 1. 로그 디렉토리 생성 : cnsPayHome/log 로 생성
	    connector.setLogHome(this.propertiesService.getString("payment.kakaopay.log.path"));
	    connector.setCnsPayHome(this.propertiesService.getString("payment.kakaopay.config.path"));
	    
	    // 2. 요청 페이지 파라메터 셋팅
	    connector.setRequestData(request);
	    
	    // 3. 추가 파라메터 셋팅
	    connector.addRequestData("actionType", "PY0");              // actionType : CL0 취소, PY0 승인
	    connector.addRequestData("MallIP", request.getRemoteAddr());// 가맹점 고유 ip
	    connector.addRequestData("CancelPwd", this.propertiesService.getString("payment.kakaopay.CANCEL_PWD"));//결제취소비밀번호
	    
	    //가맹점키 셋팅 (MID 별로 틀림) 
	    connector.addRequestData("EncodeKey", this.propertiesService.getString("payment.kakaopay.ENCODE_KEY"));

	    
	    // 4. CNSPAY Lite 서버 접속하여 처리
	    connector.requestAction();
	    
	    // 5. 결과 처리
	    String resultCode = connector.getResultData("ResultCode");      // 결과코드 (정상 :3001 , 그 외 에러)
	    String resultMsg = connector.getResultData("ResultMsg");        // 결과메시지
	    String authDate = connector.getResultData("AuthDate");          // 승인일시 YYMMDDHH24mmss
	    String authCode = connector.getResultData("AuthCode");          // 승인번호
	    String buyerName = connector.getResultData("BuyerName");        // 구매자명
	    String goodsName = connector.getResultData("GoodsName");        // 상품명
	    String payMethod = connector.getResultData("PayMethod");        // 결제수단
	    String mid = connector.getResultData("MID");                    // 가맹점ID
	    String tid = connector.getResultData("TID");                    // 거래ID
	    String moid = connector.getResultData("Moid");                  // 주문번호
	    String amt = connector.getResultData("Amt");                    // 금액
	    String cardCode = connector.getResultData("CardCode");          // 카드사 코드
	    String cardName = connector.getResultData("CardName");          // 결제카드사명
	    String cardQuota = connector.getResultData("CardQuota");        // 할부개월수 ex) 00:일시불,02:2개월
	    String cardInterest = connector.getResultData("CardInterest");  // 무이자여부
	    String cardCl = connector.getResultData("CardCl");              // 체크카드여부
	    String cardBin = connector.getResultData("CardBin");            // 카드BIN번호
	    String cardPoint = connector.getResultData("CardPoint");        // 카드사포인트사용여부
	    
	    //부인방지토큰값
	    String nonRepToken = request.getParameter("NON_REP_TOKEN");
	    
	    boolean paySuccess = false;                                     // 결제 성공 여부
	    
	    /** 위의 응답 데이터 외에도 전문 Header와 개별부 데이터 Get 가능 */
	    if(payMethod.equals("CARD")){                                   //신용카드
	        if(resultCode.equals("3001")) paySuccess = true;            // 결과코드 (정상 :3001 , 그 외 에러)
	    }
	    
	    if(paySuccess){
	       // 결제 성공시 DB처리 하세요.
	    	logger.info("카톡 페이 성공");
	    }else{
	       // 결제 실패시 DB처리 하세요.
	    	logger.info("카톡 페이 실패");
	    }
	    
	    logger.info("resultCode====="+resultCode);
	    logger.info("resultMsg====="+resultMsg);
	    logger.info("authDate====="+authDate);
	    logger.info("authCode====="+authCode);
	    logger.info("buyerName====="+buyerName);
	    logger.info("goodsName====="+goodsName);
	    logger.info("payMethod====="+payMethod);
	    logger.info("mid====="+mid);
	    logger.info("tid====="+tid);
	    logger.info("moid====="+moid);
	    logger.info("amt====="+amt);
	    logger.info("cardCode====="+cardCode);
	    logger.info("cardName====="+cardName);
	    logger.info("cardQuota====="+cardQuota);
	    logger.info("cardInterest====="+cardInterest);
	    logger.info("cardCl====="+cardCl);
	    logger.info("cardBin====="+cardBin);
	    logger.info("cardPoint====="+cardPoint);
	    logger.info("nonRepToken====="+nonRepToken);
	    
	    // 결과코드 3001만 정상, 그 외는 에러.. LG 에서는 0000이 정상이기 때문에 카카오페이도 3001이면 PAY_MST_RESPCODE에 0000을 넣어준다. 
	    // 에러 코드는 그대로 PAY_MST_RESPCODE에 넣는다.
	    String PAY_MST_RESPCODE = resultCode.equals("3001") ? "0000" : resultCode;
	    
	    //이하는 LG PG사와 동일한 컬럼 사용
	    commandMap.put("PAY_MST_TR_STATUS",		"A");
	    commandMap.put("PAY_MST_RESPCODE",			PAY_MST_RESPCODE);
	    commandMap.put("PAY_MST_RESPMSG",			resultMsg);
		commandMap.put("PAY_MST_MID",				mid);
		commandMap.put("PAY_MST_OID",				StringUtil.getString(commandMap.get("LGD_OID"),""));
		commandMap.put("PAY_MST_AMOUNT",			amt);
		commandMap.put("PAY_MST_TID",				tid);
		commandMap.put("PAY_MST_PAYTYPE",			"KAKAO");
		commandMap.put("PAY_MST_PAYDATE",			"20"+authDate);//YYYYMMDD 형식을 맞추기 위해 앞에 20을 붙여준다..
		commandMap.put("PAY_MST_KAKAO_AUTHDATE",			"20"+authDate);//YYYYMMDD 형식을 맞추기 위해 앞에 20을 붙여준다..
		commandMap.put("PAY_MST_HASHDATA",			StringUtil.getString(commandMap.get("EncryptData"),""));
		commandMap.put("PAY_MST_BUYER",			buyerName);
		commandMap.put("PAY_MST_BUYERID",			StringUtil.getString(commandMap.get("LGD_BUYERID"),""));
		commandMap.put("PAY_MST_BUYEREMAIL",		StringUtil.getString(commandMap.get("LGD_BUYEREMAIL"),""));
		commandMap.put("PAY_MST_PRODUCTINFO",		goodsName);
		//이하는 카카오페이 컬럼 별도 생성
		commandMap.put("PAY_MST_KAKAO_PAYMETHOD",			payMethod);
		commandMap.put("PAY_MST_KAKAO_AUTHCODE",			authCode);
		commandMap.put("PAY_MST_KAKAO_CARDCODE",			cardCode);
		commandMap.put("PAY_MST_KAKAO_CARDNAME",			cardName);
		commandMap.put("PAY_MST_KAKAO_CARDQUOTA",			cardQuota);
		commandMap.put("PAY_MST_KAKAO_CARDINTEREST",			cardInterest);
		commandMap.put("PAY_MST_KAKAO_CARDCL",			cardCl);
		commandMap.put("PAY_MST_KAKAO_CARDBIN",			cardBin);
		commandMap.put("PAY_MST_KAKAO_CARDPOINT",			cardPoint);
		commandMap.put("PAY_MST_KAKAO_NONREPTOKEN",			nonRepToken);
		
		commandMap.put("ORD_MST_PAY_TYPE", Code.PAY_KAKAOPAY); /* 결제방법-카카오페이 */
		logger.info("#######[END] 카카오페이 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		logger.info("=======================[END] 카카오페이 결제==========================");
	    
		return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kakaoCancelPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : 카카오페이 결제취소
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kakaoCancelPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] 카카오페이 결제 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		CnsPayWebConnector connector = new CnsPayWebConnector();
		
		// 1. 로그 디렉토리 생성 : cnsPayHome/log 로 생성
	    connector.setLogHome(this.propertiesService.getString("payment.kakaopay.log.path"));
	    connector.setCnsPayHome(this.propertiesService.getString("payment.kakaopay.config.path"));
	    
	    // 2. 요청 페이지 파라메터 셋팅
	    connector.setRequestData(request);
	    
	    // 3. 추가 파라메터 셋팅
	    connector.addRequestData("MID", StringUtil.getString(commandMap.get("PAY_MST_MID"),"")); //가맹점 id
	    connector.addRequestData("TID", StringUtil.getString(commandMap.get("PAY_MST_TID"),"")); //승인 응답값으로 받은 거래 구분 Transaction ID
	    connector.addRequestData("CancelAmt", StringUtil.getString(commandMap.get("PAY_MST_AMOUNT"),"")); //취소금액
	    connector.addRequestData("CancelMsg", "고객요청");
	    connector.addRequestData("PartialCancelCode", StringUtil.getString(commandMap.get("PartialCancelCode"),"0")); //0:전체취소, 1:부분취소
	    connector.addRequestData("CancelNo", StringUtil.getString(commandMap.get("CancelNo"),""));//부분취소일 경우 식별넘버 필요.
	    
	    connector.addRequestData("actionType", "CL0");              // actionType : CL0 취소, PY0 승인
	    connector.addRequestData("MallIP", request.getRemoteAddr());// 가맹점 고유 ip
	    connector.addRequestData("CancelPwd", this.propertiesService.getString("payment.kakaopay.CANCEL_PWD"));//결제취소비밀번호
	    
	    //가맹점키 셋팅 (MID 별로 틀림) 
	    connector.addRequestData("EncodeKey", this.propertiesService.getString("payment.kakaopay.ENCODE_KEY"));

		// 4. CNSPAY Lite 서버 접속하여 처리
		connector.requestAction();

		// 5. 결과 처리
		String resultCode = connector.getResultData("ResultCode");  // 결과코드 (정상 :2001(취소성공), 2002(취소진행중), 그 외 에러)
		String resultMsg = connector.getResultData("ResultMsg");    // 결과메시지
		String cancelAmt = connector.getResultData("CancelAmt");    // 취소금액
		String cancelDate = connector.getResultData("CancelDate");  // 취소일
		String cancelTime = connector.getResultData("CancelTime");  // 취소시간
		String cancelNum = connector.getResultData("CancelNum");    // 취소번호
		String payMethod = connector.getResultData("PayMethod");    // 취소 결제수단
		String mid =    connector.getResultData("MID");             // 가맹점 ID
		String tid = connector.getResultData("TID");                // 거래 ID
		String errorCD = connector.getResultData("ErrorCD");        // 에러코드
		String errorMsg = connector.getResultData("ErrorMsg");      // 에러메시지
		String AuthDate = cancelDate + cancelTime;                  // 취소거래시간
		String stateCD = connector.getResultData("StateCD");        // 거래상태코드
		String ccPartCl = connector.getResultData("CcPartCl");      // 부분취소 가능여부
		
		logger.info("resultCode====="+resultCode);
	    logger.info("resultMsg====="+resultMsg);
	    logger.info("payMethod====="+payMethod);
	    logger.info("mid====="+mid);
	    logger.info("tid====="+tid);
	    logger.info("cancelAmt====="+cancelAmt);
	    logger.info("cancelNum====="+cancelNum);
	    logger.info("errorCD====="+errorCD);
	    logger.info("errorMsg====="+errorMsg);
	    logger.info("AuthDate====="+AuthDate);
	    logger.info("stateCD====="+stateCD);
	    logger.info("ccPartCl====="+ccPartCl);
	    
	    // 결과코드 2001, 2002만 정상, 그 외는 에러.. LG 에서는 0000이 정상이기 때문에 카카오페이도 2001,2002이면 PAY_MST_RESPCODE에 0000을 넣어준다. 
	    // 에러 코드는 그대로 PAY_MST_RESPCODE에 넣는다.
	    String PAY_MST_RESPCODE = resultCode.equals("2001") || resultCode.equals("2002") ? "0000" : resultCode;
	    
	    if("0000".equals(PAY_MST_RESPCODE)){
	    	commandMap.put("XPAY_RESULT_YN", "Y"); // 정상
			commandMap.put("XPAY_REFUND_YN", "Y"); // 환불완료
	    }
		
	    commandMap.put("PAY_MST_PAYDATE",			AuthDate);//YYYYMMDD 취소때는 이런 형식으로 오기때문에 20 붙여줄 필요가 없음
	    commandMap.put("PAY_MST_KAKAO_AUTHDATE",			AuthDate);//YYYYMMDD 취소때는 이런 형식으로 오기때문에 20 붙여줄 필요가 없음
		commandMap.put("PAY_MST_TR_STATUS",			"C"); // 취소승인
		commandMap.put("PAY_MST_RESPCODE",			PAY_MST_RESPCODE);
		commandMap.put("PAY_MST_RESPMSG",			resultMsg);
		
        logger.info( "결제정상처리여부  = " + StringUtil.getString(commandMap.get("XPAY_RESULT_YN")));
        logger.info("#######[END] 카카오페이 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 결제승인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		// ============================================================================== 
		// =   PAGE : 결제 정보 환경 설정 PAGE                                     		= 
		// = -------------------------------------------------------------------------- = 
		// =   Copyright (c)  2010   KICC Inc.   All Rights Reserved.                   = 
		// ============================================================================== 
		
		// ============================================================================== 
		// =   01. 지불 데이터 셋업 (업체에 맞게 수정)                             		= 
		// = -------------------------------------------------------------------------- = 
		// = ※ 주의 ※                                                           		= 
		// =  cert_file 변수 설정                                                 		= 
		// = pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                         = 
		// =                                                                            = 
		// =  log_dir 변수 설정                                                   		=
		// = log 디렉토리 설정                                                    		=
		// =  log_level 변수 설정                                                 		=
		// = log 레벨 설정                                                        		=
		// = -------------------------------------------------------------------------- =
		
		String g_cert_file  = this.propertiesService.getString("payment.kicc.certificate.path");
		String g_log_dir    = this.propertiesService.getString("payment.kicc.log.path");
		int g_log_level  = 1;
		
		// ============================================================================== /
		// =   02. 쇼핑몰 지불 정보 설정                                                = /
		// = -------------------------------------------------------------------------- = /		
		String g_gw_url    = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
		//String g_gw_url    = "gw.easypay.co.kr";     // Gateway URL ( real )
		String g_gw_port   = "80";                  // 포트번호(변경불가) /
		
		//String g_mall_id   =  this.propertiesService.getString("payment.kicc.mall.id");             // 리얼 반영시 KICC에 발급된 mall_id 사용
		String g_mall_id           = StringUtil.getString(commandMap.get("EP_mall_id"          ));   // [필수]가맹점ID
		// ============================================================================= /
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_PAYMENT    = "00101000";   // 승인(일반, 에스크로)

	    String tr_cd            = TRAN_CD_NOR_PAYMENT;           // [필수]요청구분
	    String pay_type         = StringUtil.getString(commandMap.get("EP_pay_type"));        // [필수]결제수단

	    /* -------------------------------------------------------------------------- */
	    /* ::: 신용카드 정보 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    String card_amt          = StringUtil.getString(commandMap.get("EP_card_amt"));        // [필수]신용카드 결제금액
	    String card_txtype       = StringUtil.getString(commandMap.get("EP_card_txtype"));     // [필수]처리종류
	    String req_type          = StringUtil.getString(commandMap.get("EP_req_type"));        // [필수]카드결제종류
	    String cert_type         = StringUtil.getString(commandMap.get("EP_cert_type"));       // [필수]인증여부
	    String wcc               = StringUtil.getString(commandMap.get("EP_wcc"));             // [필수]wcc
	    String card_no           = StringUtil.getString(commandMap.get("EP_card_no"));         // [필수]카드번호
	    String expire_date       = StringUtil.getString(commandMap.get("EP_expire_date"));     // [필수]유효기간
	    String install_period    = StringUtil.getString(commandMap.get("EP_install_period"));  // [필수]할부개월
	    String noint             = StringUtil.getString(commandMap.get("EP_noint"));           // [필수]무이자여부
	    String card_user_type    = StringUtil.getString(commandMap.get("EP_card_user_type"));  // [선택]카드구분 : 인증여부에 따라 필수
	    String password          = StringUtil.getString(commandMap.get("EP_password"));        // [선택]비밀번호 : 인증여부에 따라 필수
	    String auth_value        = StringUtil.getString(commandMap.get("EP_auth_value"));      // [선택]인증값   : 인증여부에 따라 필수
	    String cavv              = StringUtil.getString(commandMap.get("EP_cavv"));            // [선택]CAVV  : 카드결제종류에 따라 필수
	    String xid               = StringUtil.getString(commandMap.get("EP_xid"));             // [선택]XID   : 카드결제종류에 따라 필수
	    String eci               = StringUtil.getString(commandMap.get("EP_eci"));             // [선택]ECI   : 카드결제종류에 따라 필수
	    String kvp_cardcode      = StringUtil.getString(commandMap.get("EP_kvp_cardcode"));    // [선택]KVP_CARDCODE   : 카드결제종류에 따라 필수
	    String kvp_sessionkey    = StringUtil.getString(commandMap.get("EP_kvp_sessionkey"));  // [선택]KVP_SESSIONKEY : 카드결제종류에 따라 필수
	    String kvp_encdata       = StringUtil.getString(commandMap.get("EP_kvp_encdata"));     // [선택]KVP_ENCDATA    : 카드결제종류에 따라 필수
	    String req_cno           = StringUtil.getString(commandMap.get("EP_cno"));             // [선택]은련카드 인증거래번호
	    String kvp_pgid          = StringUtil.getString(commandMap.get("EP_kvp_pgid"));        // [선택]은련카드 PGID

	    kvp_sessionkey = URLEncoder.encode( kvp_sessionkey );
	    kvp_encdata = URLEncoder.encode( kvp_encdata );

	    /* -------------------------------------------------------------------------- */
	    /* ::: 계좌이체 정보 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    String acnt_amt          = StringUtil.getString(commandMap.get("EP_acnt_amt"));        // [필수]계좌이체 결제금액
	    String acnt_txtype       = StringUtil.getString(commandMap.get("EP_acnt_txtype"));     // [필수]계좌이체 처리종류
	    String kftc_signdata     = StringUtil.getString(commandMap.get("hd_pi"));              // [필수]전자지갑 암호문
	    String kftc_serialno     = StringUtil.getString(commandMap.get("hd_serial_no"));       // [필수]전자지갑 일련번호
	    
	    

	    /* -------------------------------------------------------------------------- */
	    /* ::: 무통장입금 정보 설정                                                   */
	    /* -------------------------------------------------------------------------- */
	    String vacct_amt         = StringUtil.getString(commandMap.get("EP_vacct_amt"));       // [필수]무통장입금 결제금액
	    String vacct_txtype      = StringUtil.getString(commandMap.get("EP_vacct_txtype"));    // [필수]무통장입금 처리종류
	    String bank_cd           = StringUtil.getString(commandMap.get("EP_bank_cd"));         // [필수]은행코드
	    String vacct_expr_date   = StringUtil.getString(commandMap.get("EP_expire_date"));     // [필수]입금만료일
	    String vacct_expr_time   = StringUtil.getString(commandMap.get("EP_expire_time"));     // [필수]입금만료시간

	    /* -------------------------------------------------------------------------- */
	    /* ::: 현금영수증 정보 설정                                                   */
	    /* -------------------------------------------------------------------------- */
	    String cash_yn           = StringUtil.getString(commandMap.get("EP_cash_yn"));         // [필수]현금영수증 발행여부
	    String cash_issue_type   = StringUtil.getString(commandMap.get("EP_cash_issue_type")); // [선택]현금영수증발행용도
	    String cash_auth_type    = StringUtil.getString(commandMap.get("EP_cash_auth_type"));  // [선택]인증구분
	    String cash_auth_value   = StringUtil.getString(commandMap.get("EP_cash_auth_value")); // [선택]인증번호

	    /* -------------------------------------------------------------------------- */
	    /* ::: 휴대폰결제 정보 설정                                                   */
	    /* -------------------------------------------------------------------------- */
	    String mob_amt           = StringUtil.getString(commandMap.get("EP_mob_amt"));         // [필수]휴대폰 결제금액
	    String mob_txtype        = StringUtil.getString(commandMap.get("EP_mob_txtype"));      // [필수]휴대폰 처리종류
	    String mobile_cd         = StringUtil.getString(commandMap.get("EP_mobile_cd"));       // [필수]이통사코드
	    String mobile_no         = StringUtil.getString(commandMap.get("EP_mobile_no"));       // [필수]휴대폰번호
	    String jumin_no          = StringUtil.getString(commandMap.get("EP_jumin_no"));        // [필수]휴대폰 가입자 주민등록번호
	    String mob_auth_id       = StringUtil.getString(commandMap.get("EP_mob_auth_id"));     // [필수]인증고유번호(승인 시 필수)
	    String mob_billid        = StringUtil.getString(commandMap.get("EP_mob_billid"));      // [필수]인증번호(승인 시 필수)
	    String mob_cno           = StringUtil.getString(commandMap.get("EP_mob_cno"));         // [필수]PG거래번호(승인 시 필수)

	    /* -------------------------------------------------------------------------- */
	    /* ::: 포인트 결제 정보 설정                                                  */
	    /* -------------------------------------------------------------------------- */
	    String pnt_amt           = StringUtil.getString(commandMap.get("EP_pnt_amt"));         // [필수]포인트 결제금액
	    String pnt_txtype        = StringUtil.getString(commandMap.get("EP_pnt_txtype"));      // [필수]포인트 처리종류
	    String pnt_cp_cd         = StringUtil.getString(commandMap.get("EP_pnt_cp_cd"));       // [필수]포인트 서비스사 코드
	    String pnt_idno          = StringUtil.getString(commandMap.get("EP_pnt_idno"));        // [필수]포인트 ID(카드)번호
	    String pnt_pwd           = StringUtil.getString(commandMap.get("EP_pnt_pwd"));         // [옵션]포인트 비밀번호

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제 주문 정보 설정                                                    */
	    /* -------------------------------------------------------------------------- */
	    String user_type        = StringUtil.getString(commandMap.get("EP_user_type"));        // [선택]사용자구분구분[1:일반,2:회원]
	    String order_no         = StringUtil.getString(commandMap.get("EP_order_no"));         // [필수]주문번호
	    String memb_user_no     = StringUtil.getString(commandMap.get("EP_memb_user_no"));     // [선택]가맹점 고객일련번호
	    String user_id          = StringUtil.getString(commandMap.get("EP_user_id"));          // [선택]고객 ID
	    String user_nm          = StringUtil.getString(commandMap.get("EP_user_nm"));          // [필수]고객명
	    String user_mail        = StringUtil.getString(commandMap.get("EP_user_mail"));        // [필수]고객 E-mail
	    String user_phone1      = StringUtil.getString(commandMap.get("EP_user_phone1"));      // [필수]가맹점 고객 연락처1
	    String user_phone2      = StringUtil.getString(commandMap.get("EP_user_phone2"));      // [선택]가맹점 고객 연락처2
	    String user_addr        = StringUtil.getString(commandMap.get("EP_user_addr"));        // [선택]가맹점 고객 주소
	    String product_type     = StringUtil.getString(commandMap.get("EP_product_type"));     // [필수]상품정보구분[0:실물,1:컨텐츠]
	    String product_nm       = StringUtil.getString(commandMap.get("EP_product_nm"));       // [필수]상품명
	    String product_amt      = StringUtil.getString(commandMap.get("EP_product_amt"));      // [필수]상품금액
		String user_define1     = StringUtil.getString(commandMap.get("EP_user_define1"));     // [선택]가맹점필드1
		String user_define2     = StringUtil.getString(commandMap.get("EP_user_define2"));     // [선택]가맹점필드2
		String user_define3     = StringUtil.getString(commandMap.get("EP_user_define3"));     // [선택]가맹점필드3
		String user_define4     = StringUtil.getString(commandMap.get("EP_user_define4"));     // [선택]가맹점필드4
		String user_define5     = StringUtil.getString(commandMap.get("EP_user_define5"));     // [선택]가맹점필드5
		String user_define6     = StringUtil.getString(commandMap.get("EP_user_define6"));     // [선택]가맹점필드6
		
		 /* -------------------------------------------------------------------------- */
	    /* :::  에스크로정보                                                    */
	    /* -------------------------------------------------------------------------- */
		String bask_cnt      = StringUtil.getString(commandMap.get("EP_bask_cnt"));      // [필수]상품금액
	    String bask_info      = StringUtil.getString(commandMap.get("EP_bask_info"));      // [필수]상품금액
	    
	    String escr_type        = StringUtil.getString(commandMap.get("EP_escr_type"));        //[필수] 에스크로구분 Y : 신한, K : 자체, O : 오픈마켓
	    String bk_cnt       = StringUtil.getString(commandMap.get("EP_bk_cnt"));       // [필수] 장바구니 건수 
	    String bk_totamt      = StringUtil.getString(commandMap.get("EP_bk_totamt"));      //[필수] 장바구니 총 금액 
	    String bk_goodinfo      = StringUtil.getString(commandMap.get("EP_bk_goodinfo"));      // [필수] 장바구니 상품정보

	    String recv_id         = StringUtil.getString(commandMap.get("EP_recv_id"));         // [선택] 구매자ID
	    String recv_nm     = StringUtil.getString(commandMap.get("EP_recv_nm"));     // [선택] 구매자명 (KICC 에스크로(K) 경우 필수)
	    String recv_tel          = StringUtil.getString(commandMap.get("EP_recv_tel"));          // [선택] 구매자 전화번호
	    String recv_mob          = StringUtil.getString(commandMap.get("EP_recv_mob"));          // [선택] 구매자 휴대폰번호 (KICC 에스크로(K) 경우 필수)
	    String recv_mail        = StringUtil.getString(commandMap.get("EP_recv_mail"));        // [선택] 구매자 email (KICC 에스크로(K) 경우 필수)
	    String recv_zip      = StringUtil.getString(commandMap.get("EP_recv_zip"));      // [선택] 구매자 우편번호
	    String recv_addr1        = StringUtil.getString(commandMap.get("EP_recv_addr1"));        // [선택] 구매자 주소1
	    String recv_addr2     = StringUtil.getString(commandMap.get("EP_recv_addr2"));     // [선택] 구매자 주소2
	    String deli_type      = StringUtil.getString(commandMap.get("EP_deli_type"));      // [선택] 배송 구분(택배,자가)

	    /* -------------------------------------------------------------------------- */
	    /* ::: 기타정보 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    String client_ip        = request.getRemoteAddr();                                     // [필수]결제고객 IP
	    String tot_amt          = StringUtil.getString(commandMap.get("EP_tot_amt"));          // [필수]결제 총 금액
	    String currency         = StringUtil.getString(commandMap.get("EP_currency"));         // [필수]통화코드
	    String escrow_yn        = StringUtil.getString(commandMap.get("EP_escrow_yn"));        // [필수]에스크로여부
	    String complex_yn       = StringUtil.getString(commandMap.get("EP_complex_yn"));       // [필수]복합결제여부
	    String tax_flg          = StringUtil.getString(commandMap.get("EP_tax_flg"));          // [필수]과세구분 플래그(TG01:복합과세 승인거래)
	    String com_tax_amt      = StringUtil.getString(commandMap.get("EP_com_tax_amt"));      // [필수]과세 승인 금액(복합과세 거래 시 필수)
	    String com_free_amt     = StringUtil.getString(commandMap.get("EP_com_free_amt"));     // [필수]비과세 승인 금액(복합과세 거래 시 필수)
	    String com_vat_amt      = StringUtil.getString(commandMap.get("EP_com_vat_amt"));      // [필수]부가세 금액(복합과세 거래 시 필수)

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제 결과                                                              */
	    /* -------------------------------------------------------------------------- */
	    String bDBProc          = "";
	    String res_cd           = "";
	    String res_msg          = "";
	    String r_order_no       = "";
	    String r_complex_yn     = "";
	    String r_msg_type       = "";     //거래구분
	    String r_noti_type	    = "";     //노티구분
	    String r_cno            = "";     //PG거래번호
	    String r_amount         = "";     //총 결제금액
	    String r_auth_no        = "";     //승인번호
	    String r_tran_date      = "";     //거래일시
	    String r_pnt_auth_no    = "";     //포인트 승인 번호
	    String r_pnt_tran_date  = "";     //포인트 승인 일시
	    String r_cpon_auth_no   = "";     //쿠폰 승인 번호
	    String r_cpon_tran_date = "";     //쿠폰 승인 일시
	    String r_card_no        = "";     //카드번호
	    String r_issuer_cd      = "";     //발급사코드
	    String r_issuer_nm      = "";     //발급사명
	    String r_acquirer_cd    = "";     //매입사코드
	    String r_acquirer_nm    = "";     //매입사명
	    String r_install_period = "";     //할부개월
	    String r_noint          = "";     //무이자여부
	    String r_bank_cd        = "";     //은행코드
	    String r_bank_nm        = "";     //은행명
	    String r_account_no     = "";     //계좌번호
	    String r_deposit_nm     = "";     //입금자명
	    String r_expire_date    = "";     //계좌사용 만료일
	    String r_cash_res_cd    = "";     //현금영수증 결과코드
	    String r_cash_res_msg   = "";     //현금영수증 결과메세지
	    String r_cash_auth_no   = "";     //현금영수증 승인번호
	    String r_cash_tran_date = "";     //현금영수증 승인일시
	    String r_auth_id        = "";     //PhoneID
	    String r_billid         = "";     //인증번호
	    String r_mobile_no      = "";     //휴대폰번호
	    String r_ars_no         = "";     //ARS 전화번호
	    String r_cp_cd          = "";     //포인트사
	    String r_used_pnt       = "";     //사용포인트
	    String r_remain_pnt     = "";     //잔여한도
	    String r_pay_pnt        = "";     //할인/발생포인트
	    String r_accrue_pnt     = "";     //누적포인트
	    String r_remain_cpon    = "";     //쿠폰잔액
	    String r_used_cpon      = "";     //쿠폰 사용금액
	    String r_mall_nm        = "";     //제휴사명칭
	    String r_escrow_yn	    = "";     //에스크로 사용유무
	    String r_canc_acq_data  = "";     //매입취소일시
	    String r_canc_date      = "";     //취소일시
	    String r_refund_date    = "";     //환불예정일시

	    /* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	    easyPayClient.easypay_setenv_init( g_gw_url, g_gw_port, g_cert_file, g_log_dir );
	    easyPayClient.easypay_reqdata_init();

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인요청 전문 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    if( TRAN_CD_NOR_PAYMENT.equals(tr_cd) ) {

	        // 승인요청 전문 설정
	    	// 결제 주문 정보 DATA
	        int easypay_order_data_item;
	        easypay_order_data_item = easyPayClient.easypay_item( "order_data" );

	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_type"		, user_type 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "order_no"		, order_no		);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "memb_user_no"	, memb_user_no 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_id"		, user_id		);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_nm"		, user_nm		);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_mail"		, user_mail 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone1"	, user_phone1 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone2"	, user_phone2 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_addr"		, user_addr 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_type"	, product_type 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_nm"	, product_nm 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_amt"	, product_amt 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define1"	, user_define1 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define2"	, user_define2 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define3"	, user_define3 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define4"	, user_define4 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define5"	, user_define5 	);
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define6"	, user_define6 	);

	        // 결제정보 DATA부
	        int easypay_pay_data_item;
	        easypay_pay_data_item = easyPayClient.easypay_item( "pay_data" );

	        // 결제 공통 정보 DATA
	        int easypay_common_item;
	        easypay_common_item = easyPayClient.easypay_item( "common" );

	        easyPayClient.easypay_deli_us( easypay_common_item, "tot_amt"       , tot_amt       );
	        easyPayClient.easypay_deli_us( easypay_common_item, "currency"      , currency      );
	        easyPayClient.easypay_deli_us( easypay_common_item, "client_ip"     , client_ip     );
	        easyPayClient.easypay_deli_us( easypay_common_item, "escrow_yn"     , escrow_yn     );
	        easyPayClient.easypay_deli_us( easypay_common_item, "complex_yn"    , complex_yn    );
	        easyPayClient.easypay_deli_us( easypay_common_item, "tax_flg"       , tax_flg       );
	        easyPayClient.easypay_deli_us( easypay_common_item, "com_tax_amt"   , com_tax_amt   );
	        easyPayClient.easypay_deli_us( easypay_common_item, "com_free_amt"  , com_free_amt  );
	        easyPayClient.easypay_deli_us( easypay_common_item, "com_vat_amt"   , com_vat_amt   );
	        easyPayClient.easypay_deli_us( easypay_common_item, "cli_ver"       , "N8"          );

	        if ( !req_cno.equals( "" ) )
	            easyPayClient.easypay_deli_us( easypay_common_item, "req_cno", req_cno      );
	        easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_common_item );
	        
	        // 신용카드 결제 DATA SET
	        if( pay_type.equals("card") ) {
	            int easypay_card_item;

	            easypay_card_item = easyPayClient.easypay_item( "card" );

	            easyPayClient.easypay_deli_us( easypay_card_item, "card_txtype"    , card_txtype       );
	            easyPayClient.easypay_deli_us( easypay_card_item, "req_type"       , req_type          );
	            easyPayClient.easypay_deli_us( easypay_card_item, "card_amt"       , card_amt          );
	            easyPayClient.easypay_deli_us( easypay_card_item, "noint"          , noint             );
	            easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"      , cert_type         );
	            easyPayClient.easypay_deli_us( easypay_card_item, "wcc"            , wcc               );
	            easyPayClient.easypay_deli_us( easypay_card_item, "install_period" , install_period    );

	            if( req_type.equals("0") ) {
	                // 일반(SSL)
	                easyPayClient.easypay_deli_us( easypay_card_item, "card_no"        , card_no           );
	                easyPayClient.easypay_deli_us( easypay_card_item, "expire_date"    , expire_date       );
	                easyPayClient.easypay_deli_us( easypay_card_item, "user_type"      , card_user_type    );

	                if( cert_type.equals("0") ) {

	                    easyPayClient.easypay_deli_us( easypay_card_item, "password"       , password          );
	                    easyPayClient.easypay_deli_us( easypay_card_item, "auth_value"     , auth_value        );
	                }
	            }
	            else if( req_type.equals("1") ) {
	                // ISP
	                easyPayClient.easypay_deli_us( easypay_card_item, "kvp_cardcode"   , kvp_cardcode   );
	                easyPayClient.easypay_deli_us( easypay_card_item, "kvp_sessionkey" , kvp_sessionkey );
	                easyPayClient.easypay_deli_us( easypay_card_item, "kvp_encdata"    , kvp_encdata    );
	            }
	            else if( req_type.equals("2") ) {
	                // 안심클릭
	                easyPayClient.easypay_deli_us( easypay_card_item, "card_no"        , card_no           );
	                easyPayClient.easypay_deli_us( easypay_card_item, "expire_date"    , expire_date       );
	                easyPayClient.easypay_deli_us( easypay_card_item, "cavv"           , cavv              );
	                easyPayClient.easypay_deli_us( easypay_card_item, "xid"            , xid               );
	                easyPayClient.easypay_deli_us( easypay_card_item, "eci"            , eci               );
	            }

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_card_item );
	        }
	        else if( pay_type.equals("bank") ) {

	            int easypay_bank_item;

	            easypay_bank_item = easyPayClient.easypay_item( "acnt" );

	            easyPayClient.easypay_deli_us( easypay_bank_item, "acnt_txtype"    , acnt_txtype     );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "acnt_amt"       , acnt_amt        );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "kftc_signdata"  , kftc_signdata   );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "kftc_serialno"  , kftc_serialno   );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "bank_cd"        , bank_cd         );
	            easyPayClient.easypay_deli_us( easypay_bank_item, "cash_yn"        , cash_yn         );

	            // 현금영수증
	            if( cash_yn.equals("1") ) {
	                easyPayClient.easypay_deli_us( easypay_bank_item, "cash_issue_type" , cash_issue_type  );
	                easyPayClient.easypay_deli_us( easypay_bank_item, "cash_auth_type"  , cash_auth_type   );
	                easyPayClient.easypay_deli_us( easypay_bank_item, "cash_auth_value" , cash_auth_value  );
	            }
	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_bank_item );
	        }
	        else if( pay_type.equals("vacct") ) {

	            int easypay_vacct_item;

	            easypay_vacct_item = easyPayClient.easypay_item( "vacct" );

	            easyPayClient.easypay_deli_us( easypay_vacct_item, "vacct_txtype"    , vacct_txtype     );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "vacct_amt"       , vacct_amt        );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "bank_cd"         , bank_cd          );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "expire_date"     , vacct_expr_date  );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "expire_time"     , vacct_expr_time  );
	            easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_yn"         , cash_yn          );

	            // 현금영수증
	            if( cash_yn.equals("1") ) {

	                easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_issue_type" , cash_issue_type  );
	                easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_auth_type"  , cash_auth_type   );
	                easyPayClient.easypay_deli_us( easypay_vacct_item, "cash_auth_value" , cash_auth_value  );
	            }

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_vacct_item );


	        }
	        else if( pay_type.equals("mobile") ) {

	            int easypay_mobile_item;

	            easypay_mobile_item = easyPayClient.easypay_item( "mob" );

	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mob_txtype"    , mob_txtype    );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mob_amt"       , mob_amt       );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mobile_cd"     , mobile_cd     );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "mobile_no"     , mobile_no     );
	            easyPayClient.easypay_deli_us( easypay_mobile_item, "jumin_no"      , jumin_no      );

	            // 승인
	            if( mob_txtype.equals("20") ) {

	                easyPayClient.easypay_deli_us( easypay_mobile_item, "auth_id" , mob_auth_id  );
	                easyPayClient.easypay_deli_us( easypay_mobile_item, "billid"  , mob_billid   );
	                easyPayClient.easypay_deli_us( easypay_mobile_item, "cno"     , mob_cno      );
	            }

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_mobile_item );
	        }
	        else if( pay_type.equals("point") ) {

	        	int easypay_point_item;

	            easypay_point_item = easyPayClient.easypay_item( "pnt" );

	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_txtype"   , pnt_txtype   );
	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_amt"      , pnt_amt      );
	            easyPayClient.easypay_deli_us( easypay_point_item, "cp_cd"        , pnt_cp_cd    );
	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_idno"     , pnt_idno     );
	            easyPayClient.easypay_deli_us( easypay_point_item, "pnt_pwd"      , pnt_pwd      );

	            easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_point_item );
	        }
	        
	        //에스크로 여부 
	        if("Y".equals(escrow_yn)){
	        	
	        	int easypay_escrow_data_item;
	        	easypay_escrow_data_item = easyPayClient.easypay_item( "escrow_data" );

	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "escr_type"		, escr_type 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "bk_cnt"		, bk_cnt		);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "bk_totamt"	, bk_totamt 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "bk_goodinfo"		, bk_goodinfo );
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_id"		, recv_id		);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_nm"		, recv_nm 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_tel"	, recv_tel 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_mob"	, recv_mob 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_mail"		, recv_mail 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_zip"	, recv_zip 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_addr1"	, recv_addr1 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "recv_addr2"	, recv_addr2 	);
	            easyPayClient.easypay_deli_gs( easypay_escrow_data_item, "deli_type"	, deli_type 	);
	        	
	        }
	    }


	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) {
	        easyPayClient.easypay_run( g_mall_id, tr_cd, order_no );

	        res_cd = easyPayClient.res_cd;
	        res_msg = easyPayClient.res_msg;

	    }
	    else {
	        res_cd  = "M114";
	        res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno             = easyPayClient.easypay_get_res( "cno"             );    // PG거래번호
	    r_amount          = easyPayClient.easypay_get_res( "amount"          );    //총 결제금액
	    r_order_no        = easyPayClient.easypay_get_res( "order_no"        );    //주문번호
	    r_noti_type       = easyPayClient.easypay_get_res( "noti_type"       );    //노티구분
	    r_auth_no         = easyPayClient.easypay_get_res( "auth_no"         );    //승인번호
	    r_tran_date       = easyPayClient.easypay_get_res( "tran_date"       );    //승인일시
	    r_pnt_auth_no     = easyPayClient.easypay_get_res( "pnt_auth_no"     );    //포인트승인번호
	    r_pnt_tran_date   = easyPayClient.easypay_get_res( "pnt_tran_date"   );    //포인트승인일시
	    r_cpon_auth_no    = easyPayClient.easypay_get_res( "cpon_auth_no"    );    //쿠폰승인번호
	    r_cpon_tran_date  = easyPayClient.easypay_get_res( "cpon_tran_date"  );    //쿠폰승인일시
	    r_card_no         = easyPayClient.easypay_get_res( "card_no"         );    //카드번호
	    r_issuer_cd       = easyPayClient.easypay_get_res( "issuer_cd"       );    //발급사코드
	    r_issuer_nm       = easyPayClient.easypay_get_res( "issuer_nm"       );    //발급사명
	    r_acquirer_cd     = easyPayClient.easypay_get_res( "acquirer_cd"     );    //매입사코드
	    r_acquirer_nm     = easyPayClient.easypay_get_res( "acquirer_nm"     );    //매입사명
	    r_install_period  = easyPayClient.easypay_get_res( "install_period"  );    //할부개월
	    r_noint           = easyPayClient.easypay_get_res( "noint"           );    //무이자여부
	    r_bank_cd         = easyPayClient.easypay_get_res( "bank_cd"         );    //은행코드
	    r_bank_nm         = easyPayClient.easypay_get_res( "bank_nm"         );    //은행명
	    r_account_no      = easyPayClient.easypay_get_res( "account_no"      );    //계좌번호
	    r_deposit_nm      = easyPayClient.easypay_get_res( "deposit_nm"      );    //입금자명
	    r_expire_date     = easyPayClient.easypay_get_res( "expire_date"     );    //계좌사용만료일
	    r_cash_res_cd     = easyPayClient.easypay_get_res( "cash_res_cd"     );    //현금영수증 결과코드
	    r_cash_res_msg    = easyPayClient.easypay_get_res( "cash_res_msg"    );    //현금영수증 결과메세지
	    r_cash_auth_no    = easyPayClient.easypay_get_res( "cash_auth_no"    );    //현금영수증 승인번호
	    r_cash_tran_date  = easyPayClient.easypay_get_res( "cash_tran_date"  );    //현금영수증 승인일시
	    r_auth_id         = easyPayClient.easypay_get_res( "auth_id"         );    //PhoneID
	    r_billid          = easyPayClient.easypay_get_res( "billid"          );    //인증번호
	    r_mobile_no       = easyPayClient.easypay_get_res( "mobile_no"       );    //휴대폰번호
	    r_ars_no          = easyPayClient.easypay_get_res( "ars_no"          );    //전화번호
	    r_cp_cd           = easyPayClient.easypay_get_res( "cp_cd"           );    //포인트사/쿠폰사
	    r_used_pnt        = easyPayClient.easypay_get_res( "used_pnt"        );    //사용포인트
	    r_remain_pnt      = easyPayClient.easypay_get_res( "remain_pnt"      );    //잔여한도
	    r_pay_pnt         = easyPayClient.easypay_get_res( "pay_pnt"         );    //할인/발생포인트
	    r_accrue_pnt      = easyPayClient.easypay_get_res( "accrue_pnt"      );    //누적포인트
	    r_remain_cpon     = easyPayClient.easypay_get_res( "remain_cpon"     );    //쿠폰잔액
	    r_used_cpon       = easyPayClient.easypay_get_res( "used_cpon"       );    //쿠폰 사용금액
	    r_mall_nm         = easyPayClient.easypay_get_res( "mall_nm"         );    //제휴사명칭
	    r_escrow_yn       = easyPayClient.easypay_get_res( "escrow_yn"       );    //에스크로 사용유무
	    r_complex_yn      = easyPayClient.easypay_get_res( "complex_yn"      );    //복합결제 유무
	    r_canc_acq_data   = easyPayClient.easypay_get_res( "canc_acq_data"   );    //매입취소일시
	    r_canc_date       = easyPayClient.easypay_get_res( "canc_date"       );    //취소일시
	    r_refund_date     = easyPayClient.easypay_get_res( "refund_date"     );    //환불예정일시
	    
	    logger.debug("res_cd========================"+res_cd);
	    logger.debug("res_msg========================"+res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_noti_type========================"+r_noti_type);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    
	    logger.debug("r_pnt_auth_no========================"+r_pnt_auth_no);//캐쉬백 사용 or 적립시 리턴되는 승인번호
	    logger.debug("r_pnt_tran_date========================"+r_pnt_tran_date);
	    logger.debug("r_cpon_auth_no========================"+r_cpon_auth_no);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_cpon_tran_date========================"+r_cpon_tran_date);// 메뉴얼에도 없는 파라미터..
	    
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    
	    logger.debug("r_bank_cd========================"+r_bank_cd);
	    logger.debug("r_bank_nm========================"+r_bank_nm);
	    logger.debug("r_account_no========================"+r_account_no);
	    logger.debug("r_deposit_nm========================"+r_deposit_nm);
	    logger.debug("r_expire_date========================"+r_expire_date);
	    logger.debug("r_cash_res_cd========================"+r_cash_res_cd);
	    logger.debug("r_cash_res_msg========================"+r_cash_res_msg);
	    logger.debug("r_cash_auth_no========================"+r_cash_auth_no);
	    logger.debug("r_cash_tran_date========================"+r_cash_tran_date);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    
	    logger.debug("r_ars_no========================"+r_ars_no);
	    logger.debug("r_cp_cd========================"+r_cp_cd);//캐쉬백인 경우 OCB 리턴 받음
	    logger.debug("r_used_pnt========================"+r_used_pnt);//캐쉬백 사용시 사용 포인트 리턴, 적립시 적립 포인트 리턴
	    logger.debug("r_remain_pnt========================"+r_remain_pnt);
	    logger.debug("r_pay_pnt========================"+r_pay_pnt);
	    logger.debug("r_accrue_pnt========================"+r_accrue_pnt);
	    logger.debug("r_remain_cpon========================"+r_remain_cpon);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_used_cpon========================"+r_used_cpon);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_mall_nm========================"+r_mall_nm);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_acq_data========================"+r_canc_acq_data);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    logger.debug("r_refund_date========================"+r_refund_date);
	    
	    // 포인트 처리종류가 있는 경우에는 포인트 처리종류, 없는 경우에는 A가 들어간다.
	    String PAY_MST_TR_STATUS = "A";
	    if(!"".equals(pnt_txtype)){
	    	if("10".equals(pnt_txtype)){//포인트 조회
	    		PAY_MST_TR_STATUS = "I";
	    	}else if("20".equals(pnt_txtype)){//포인트 사용
	    		PAY_MST_TR_STATUS = "U";
	    	}else if("40".equals(pnt_txtype)){//포인트 적립
	    		PAY_MST_TR_STATUS = "S";
	    	}
	    }
	    
	    commandMap.put("PAY_MST_TR_STATUS",		PAY_MST_TR_STATUS);
	    commandMap.put("PAY_MST_RESPCODE", res_cd);
	    commandMap.put("PAY_MST_RESPMSG", res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_MID",				g_mall_id);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_PNT_AUTH_NO", r_pnt_auth_no);
	    commandMap.put("PAY_MST_KICC_PNT_TRAN_DATE", r_pnt_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_BANK_CD", r_bank_cd);
	    commandMap.put("PAY_MST_KICC_BANK_NM", r_bank_nm);
	    commandMap.put("PAY_MST_KICC_ACCOUNT_NO", r_account_no);
	    commandMap.put("PAY_MST_KICC_DEPOSIT_NM", r_deposit_nm);
	    commandMap.put("PAY_MST_KICC_EXPIRE_DATE", r_expire_date);
	    commandMap.put("PAY_MST_KICC_CASH_RES_CD", r_cash_res_cd);
	    commandMap.put("PAY_MST_KICC_CASH_RES_MSG", r_cash_res_msg);
	    commandMap.put("PAY_MST_KICC_CASH_AUTH_NO", r_cash_auth_no);
	    commandMap.put("PAY_MST_KICC_CASH_TRAN_DATE", r_cash_tran_date);
	    commandMap.put("PAY_MST_KICC_AUTH_ID", r_auth_id);
	    commandMap.put("PAY_MST_KICC_BILLID", r_billid);
	    commandMap.put("PAY_MST_KICC_MOBILE_NO", r_mobile_no);
	    commandMap.put("PAY_MST_KICC_ARS_NO", r_ars_no);
	    commandMap.put("PAY_MST_KICC_USED_PNT", r_used_pnt); // 'P'가 리턴돼서.. 주석처리
	    commandMap.put("PAY_MST_KICC_REMAIN_PNT", r_remain_pnt);
	    commandMap.put("PAY_MST_KICC_PAY_PNT", r_pay_pnt);
	    commandMap.put("PAY_MST_KICC_ACCURE_PNT", r_accrue_pnt);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_ACQ_DATE", r_canc_acq_data);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    commandMap.put("PAY_MST_KICC_REFUND_DATE", r_refund_date);
	    
	    commandMap.put("client_ip", client_ip);	//즉시 취소시 필요한 client_ip 

	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    /*if ( res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals( tr_cd ) )
	    {
	    	bDBProc = "false";     // DB처리 성공 시 "true", 실패 시 "false"
	    	if ( bDBProc.equals("false") )
	    	{
	    		
	    	}
	    }*/
	    
	    logger.info("#######[END] KICC 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccDirectCancelPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 결제 즉시취소(주문 후 DB 처리 실패시 호출하는 메소드)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccDirectCancelPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 결제 즉시취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		// ============================================================================== 
		// =   PAGE : 결제 정보 환경 설정 PAGE                                     		= 
		// = -------------------------------------------------------------------------- = 
		// =   Copyright (c)  2010   KICC Inc.   All Rights Reserved.                   = 
		// ============================================================================== 
		
		// ============================================================================== 
		// =   01. 지불 데이터 셋업 (업체에 맞게 수정)                             		= 
		// = -------------------------------------------------------------------------- = 
		// = ※ 주의 ※                                                           		= 
		// =  cert_file 변수 설정                                                 		= 
		// = pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                         = 
		// =                                                                            = 
		// =  log_dir 변수 설정                                                   		=
		// = log 디렉토리 설정                                                    		=
		// =  log_level 변수 설정                                                 		=
		// = log 레벨 설정                                                        		=
		// = -------------------------------------------------------------------------- =
		
		String g_cert_file  = this.propertiesService.getString("payment.kicc.certificate.path");
		String g_log_dir    = this.propertiesService.getString("payment.kicc.log.path");
		int g_log_level  = 1;
		
		// ============================================================================== /
		// =   02. 쇼핑몰 지불 정보 설정                                                = /
		// = -------------------------------------------------------------------------- = /		
		String g_gw_url    = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
		//String g_gw_url    = "gw.easypay.co.kr";     // Gateway URL ( real )
		String g_gw_port   = "80";                  // 포트번호(변경불가) /
		
		String g_mall_id   =  StringUtil.getString(commandMap.get("PAY_MST_MID"));             //주문시 사용한 mid 그대로
		// ============================================================================= /
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_MGR        = "00201000";   // 변경(일반, 에스크로)

	    /* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	    easyPayClient.easypay_setenv_init( g_gw_url, g_gw_port, g_cert_file, g_log_dir );
		
	    /*결제 취소 요청*/
	    String r_escrow_yn	    = StringUtil.getString(commandMap.get("PAY_MST_KICC_ESCROW_YN"));     //에스크로 사용유무
	    String r_cno = StringUtil.getString(commandMap.get("PAY_MST_TID"));		//거래번호
	    String order_no = StringUtil.getString(commandMap.get("PAY_MST_OID"));		//주문번호
	    String client_ip = StringUtil.getString(commandMap.get("client_ip"));		//결제고객 IP
	    String res_cd = "";
	    String res_msg = "";
	    String r_canc_date = "";
	    
	    int easypay_mgr_data_item;

	    easyPayClient.easypay_reqdata_init();

	    String tr_cd = TRAN_CD_NOR_MGR; //요청구분
	    easypay_mgr_data_item = easyPayClient.easypay_item( "mgr_data" );
	    if ( !r_escrow_yn.equals( "Y" ) )
	    {
	        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype", "40" 	);
	    }
	    else
	    {
	        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype",  "61" 	);
	        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_subtype", "ES02" );

	    }
	    easyPayClient.easypay_deli_us( easypay_mgr_data_item, "org_cno",  r_cno 		);
	    easyPayClient.easypay_deli_us( easypay_mgr_data_item, "order_no", order_no 		);
	    easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_ip",   client_ip  	);
	    easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_id",   "MALL_R_TRANS" );
	    easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_msg",  "DB 처리 실패로 망취소"  );

	    easyPayClient.easypay_run( g_mall_id, tr_cd, order_no );

	    res_cd = easyPayClient.res_cd;
	    res_msg = easyPayClient.res_msg;
	    r_cno       = easyPayClient.easypay_get_res( "cno"             );    // PG거래번호
	    r_canc_date = easyPayClient.easypay_get_res( "canc_date"       );    //취소일시
	    
	    logger.debug("res_cd========================"+res_cd);
	    logger.debug("res_msg========================"+res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    
	    commandMap.put("PAY_MST_TR_STATUS",		"C");
	    commandMap.put("PAY_MST_RESPCODE", res_cd);
	    commandMap.put("PAY_MST_RESPMSG", res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_MID",				g_mall_id);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    
	    logger.info("#######[END] KICC 결제 즉시취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccManagePayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 변경 요청(취소, 에스크로 등등)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 20.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccManagePayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 변경 요청 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		/**
		 * 
		 * 		-	mgr_txtype(거래구분)
				매입요청 : 20
				매입취소 : 30
				부분매입취소(신용카드) : 31
				부분취소(계좌이체) : 33
				즉시취소(승인/매입자동판단 취소) : 40
				현금영수증 취소 : 51
				에스크로 상태변경 : 61

				-	mgr_subtype(변경세부 구분)
				코드	내용	비고
				ES02	승인취소	배송 전 취소!
				ES05	환불요청	
				ES07	배송중	송장 나오면 그때 kicc 쪽에 보냄
				ES08	배송중 취소요청	
				ES09	배송중 취소완료	
				ES10	배송중 환불요청	
		 * 
		 */
		// ============================================================================== 
		// =   PAGE : 결제 정보 환경 설정 PAGE                                     		= 
		// = -------------------------------------------------------------------------- = 
		// =   Copyright (c)  2010   KICC Inc.   All Rights Reserved.                   = 
		// ============================================================================== 
		
		// ============================================================================== 
		// =   01. 지불 데이터 셋업 (업체에 맞게 수정)                             		= 
		// = -------------------------------------------------------------------------- = 
		// = ※ 주의 ※                                                           		= 
		// =  cert_file 변수 설정                                                 		= 
		// = pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                         = 
		// =                                                                            = 
		// =  log_dir 변수 설정                                                   		=
		// = log 디렉토리 설정                                                    		=
		// =  log_level 변수 설정                                                 		=
		// = log 레벨 설정                                                        		=
		// = -------------------------------------------------------------------------- =
		
		String g_cert_file  = this.propertiesService.getString("payment.kicc.certificate.path");
		String g_log_dir    = this.propertiesService.getString("payment.kicc.log.path");
		int g_log_level  = 1;
		
		// ============================================================================== /
		// =   02. 쇼핑몰 지불 정보 설정                                                = /
		// = -------------------------------------------------------------------------- = /		
		String g_gw_url    = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
		//String g_gw_url    = "gw.easypay.co.kr";     // Gateway URL ( real )
		String g_gw_port   = "80";                  // 포트번호(변경불가) /
		
		String g_mall_id   =  StringUtil.getString(commandMap.get("PAY_MST_MID"));             //주문시 사용한 mid 그대로
		// ============================================================================= /
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_MGR        = "00201000";   // 변경(일반, 에스크로)

	    String tr_cd            = TRAN_CD_NOR_MGR;           // [필수]요청구분
	    String pay_type         = StringUtil.getString(commandMap.get("EP_pay_type"));        // [필수]결제수단
	    String order_no         = ORD_MST_CD;         // [필수]주문번호
		
	    /* -------------------------------------------------------------------------- */
	    /* ::: 기타정보 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    String client_ip        = request.getRemoteAddr();                                     // [필수]결제고객 IP

	    /* -------------------------------------------------------------------------- */
	    /* ::: 변경관리 정보 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    String mgr_txtype       = StringUtil.getString(commandMap.get("mgr_txtype"));          // [필수]거래구분
	    String mgr_subtype      = StringUtil.getString(commandMap.get("mgr_subtype"));         // [선택]변경세부구분
	    String org_cno          = StringUtil.getString(commandMap.get("PAY_MST_TID"));             // [필수]원거래고유번호
	    String mgr_amt          = StringUtil.getString(commandMap.get("mgr_amt"));             // [선택]부분취소/환불요청 금액
	    String mgr_bank_cd      = StringUtil.getString(commandMap.get("mgr_bank_cd"));         // [선택]환불계좌 은행코드
	    String mgr_account      = StringUtil.getString(commandMap.get("mgr_account"));         // [선택]환불계좌 번호
	    String mgr_depositor    = StringUtil.getString(commandMap.get("mgr_depositor"));       // [선택]환불계좌 예금주명
	    String mgr_socno        = StringUtil.getString(commandMap.get("mgr_socno"));           // [선택]환불계좌 주민번호
	    String mgr_telno        = StringUtil.getString(commandMap.get("mgr_telno"));           // [선택]환불고객 연락처
	    String deli_cd          = StringUtil.getString(commandMap.get("deli_cd"));             // [선택]배송구분[자가:DE01,택배:DE02]
	    String deli_corp_cd     = StringUtil.getString(commandMap.get("deli_corp_cd"));        // [선택]택배사코드
	    String deli_invoice     = StringUtil.getString(commandMap.get("deli_invoice"));        // [선택]운송장 번호
	    String deli_rcv_nm      = StringUtil.getString(commandMap.get("deli_rcv_nm"));         // [선택]수령인 이름
	    String deli_rcv_tel     = StringUtil.getString(commandMap.get("deli_rcv_tel"));        // [선택]수령인 연락처
	    String req_id           = StringUtil.getString(commandMap.get("req_id"));               // [선택]가맹점 관리자 로그인 아이디
	    String mgr_msg          = StringUtil.getString(commandMap.get("mgr_msg"));             // [선택]변경 사유

	    /* -------------------------------------------------------------------------- */
	    /* ::: 전문                                                                   */
	    /* -------------------------------------------------------------------------- */
	    String mgr_data    = "";     // 변경정보
	    String tx_req_data = "";     // 요청전문

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제 결과                                                              */
	    /* -------------------------------------------------------------------------- */
	    String bDBProc          = "";
	    String res_cd           = "";
	    String res_msg          = "";
	    String r_order_no       = "";
	    String r_complex_yn     = "";
	    String r_msg_type       = "";     //거래구분
	    String r_noti_type	    = "";     //노티구분
	    String r_cno            = "";     //PG거래번호
	    String r_amount         = "";     //총 결제금액
	    String r_auth_no        = "";     //승인번호
	    String r_tran_date      = "";     //거래일시
	    String r_pnt_auth_no    = "";     //포인트 승인 번호
	    String r_pnt_tran_date  = "";     //포인트 승인 일시
	    String r_cpon_auth_no   = "";     //쿠폰 승인 번호
	    String r_cpon_tran_date = "";     //쿠폰 승인 일시
	    String r_card_no        = "";     //카드번호
	    String r_issuer_cd      = "";     //발급사코드
	    String r_issuer_nm      = "";     //발급사명
	    String r_acquirer_cd    = "";     //매입사코드
	    String r_acquirer_nm    = "";     //매입사명
	    String r_install_period = "";     //할부개월
	    String r_noint          = "";     //무이자여부
	    String r_bank_cd        = "";     //은행코드
	    String r_bank_nm        = "";     //은행명
	    String r_account_no     = "";     //계좌번호
	    String r_deposit_nm     = "";     //입금자명
	    String r_expire_date    = "";     //계좌사용 만료일
	    String r_cash_res_cd    = "";     //현금영수증 결과코드
	    String r_cash_res_msg   = "";     //현금영수증 결과메세지
	    String r_cash_auth_no   = "";     //현금영수증 승인번호
	    String r_cash_tran_date = "";     //현금영수증 승인일시
	    String r_auth_id        = "";     //PhoneID
	    String r_billid         = "";     //인증번호
	    String r_mobile_no      = "";     //휴대폰번호
	    String r_ars_no         = "";     //ARS 전화번호
	    String r_cp_cd          = "";     //포인트사
	    String r_used_pnt       = "";     //사용포인트
	    String r_remain_pnt     = "";     //잔여한도
	    String r_pay_pnt        = "";     //할인/발생포인트
	    String r_accrue_pnt     = "";     //누적포인트
	    String r_remain_cpon    = "";     //쿠폰잔액
	    String r_used_cpon      = "";     //쿠폰 사용금액
	    String r_mall_nm        = "";     //제휴사명칭
	    String r_escrow_yn	    = "";     //에스크로 사용유무
	    String r_canc_acq_data  = "";     //매입취소일시
	    String r_canc_date      = "";     //취소일시
	    String r_refund_date    = "";     //환불예정일시

	    /* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	    easyPayClient.easypay_setenv_init( g_gw_url, g_gw_port, g_cert_file, g_log_dir );
	    easyPayClient.easypay_reqdata_init();

        int easypay_mgr_data_item;
        easypay_mgr_data_item = easyPayClient.easypay_item( "mgr_data" );

        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype"		, mgr_txtype 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_subtype"		, mgr_subtype 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "org_cno"			, org_cno 		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "order_no"		, order_no		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "pay_type"		, pay_type		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_amt"			, mgr_amt		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_bank_cd"		, mgr_bank_cd 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_account"		, mgr_account 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_depositor"	, mgr_depositor );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_socno"		, mgr_socno 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_telno"		, mgr_telno 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_cd"			, deli_cd 		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_corp_cd"	, deli_corp_cd 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_invoice"	, deli_invoice 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_rcv_nm"		, deli_rcv_nm 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "deli_rcv_tel"	, deli_rcv_tel 	);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_ip"			, client_ip		);
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_id"			, req_id        );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_msg"			, mgr_msg		);


	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) {
	        easyPayClient.easypay_run( g_mall_id, tr_cd, order_no );

	        res_cd = easyPayClient.res_cd;
	        res_msg = easyPayClient.res_msg;

	    }
	    else {
	        res_cd  = "M114";
	        res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno             = easyPayClient.easypay_get_res( "cno"             );    // PG거래번호
	    r_amount          = easyPayClient.easypay_get_res( "amount"          );    //총 결제금액
	    r_order_no        = easyPayClient.easypay_get_res( "order_no"        );    //주문번호
	    r_noti_type       = easyPayClient.easypay_get_res( "noti_type"       );    //노티구분
	    r_auth_no         = easyPayClient.easypay_get_res( "auth_no"         );    //승인번호
	    r_tran_date       = easyPayClient.easypay_get_res( "tran_date"       );    //승인일시
	    r_pnt_auth_no     = easyPayClient.easypay_get_res( "pnt_auth_no"     );    //포인트승인번호
	    r_pnt_tran_date   = easyPayClient.easypay_get_res( "pnt_tran_date"   );    //포인트승인일시
	    r_cpon_auth_no    = easyPayClient.easypay_get_res( "cpon_auth_no"    );    //쿠폰승인번호
	    r_cpon_tran_date  = easyPayClient.easypay_get_res( "cpon_tran_date"  );    //쿠폰승인일시
	    r_card_no         = easyPayClient.easypay_get_res( "card_no"         );    //카드번호
	    r_issuer_cd       = easyPayClient.easypay_get_res( "issuer_cd"       );    //발급사코드
	    r_issuer_nm       = easyPayClient.easypay_get_res( "issuer_nm"       );    //발급사명
	    r_acquirer_cd     = easyPayClient.easypay_get_res( "acquirer_cd"     );    //매입사코드
	    r_acquirer_nm     = easyPayClient.easypay_get_res( "acquirer_nm"     );    //매입사명
	    r_install_period  = easyPayClient.easypay_get_res( "install_period"  );    //할부개월
	    r_noint           = easyPayClient.easypay_get_res( "noint"           );    //무이자여부
	    r_bank_cd         = easyPayClient.easypay_get_res( "bank_cd"         );    //은행코드
	    r_bank_nm         = easyPayClient.easypay_get_res( "bank_nm"         );    //은행명
	    r_account_no      = easyPayClient.easypay_get_res( "account_no"      );    //계좌번호
	    r_deposit_nm      = easyPayClient.easypay_get_res( "deposit_nm"      );    //입금자명
	    r_expire_date     = easyPayClient.easypay_get_res( "expire_date"     );    //계좌사용만료일
	    r_cash_res_cd     = easyPayClient.easypay_get_res( "cash_res_cd"     );    //현금영수증 결과코드
	    r_cash_res_msg    = easyPayClient.easypay_get_res( "cash_res_msg"    );    //현금영수증 결과메세지
	    r_cash_auth_no    = easyPayClient.easypay_get_res( "cash_auth_no"    );    //현금영수증 승인번호
	    r_cash_tran_date  = easyPayClient.easypay_get_res( "cash_tran_date"  );    //현금영수증 승인일시
	    r_auth_id         = easyPayClient.easypay_get_res( "auth_id"         );    //PhoneID
	    r_billid          = easyPayClient.easypay_get_res( "billid"          );    //인증번호
	    r_mobile_no       = easyPayClient.easypay_get_res( "mobile_no"       );    //휴대폰번호
	    r_ars_no          = easyPayClient.easypay_get_res( "ars_no"          );    //전화번호
	    r_cp_cd           = easyPayClient.easypay_get_res( "cp_cd"           );    //포인트사/쿠폰사
	    r_used_pnt        = easyPayClient.easypay_get_res( "used_pnt"        );    //사용포인트
	    r_remain_pnt      = easyPayClient.easypay_get_res( "remain_pnt"      );    //잔여한도
	    r_pay_pnt         = easyPayClient.easypay_get_res( "pay_pnt"         );    //할인/발생포인트
	    r_accrue_pnt      = easyPayClient.easypay_get_res( "accrue_pnt"      );    //누적포인트
	    r_remain_cpon     = easyPayClient.easypay_get_res( "remain_cpon"     );    //쿠폰잔액
	    r_used_cpon       = easyPayClient.easypay_get_res( "used_cpon"       );    //쿠폰 사용금액
	    r_mall_nm         = easyPayClient.easypay_get_res( "mall_nm"         );    //제휴사명칭
	    r_escrow_yn       = easyPayClient.easypay_get_res( "escrow_yn"       );    //에스크로 사용유무
	    r_complex_yn      = easyPayClient.easypay_get_res( "complex_yn"      );    //복합결제 유무
	    r_canc_acq_data   = easyPayClient.easypay_get_res( "canc_acq_data"   );    //매입취소일시
	    r_canc_date       = easyPayClient.easypay_get_res( "canc_date"       );    //취소일시
	    r_refund_date     = easyPayClient.easypay_get_res( "refund_date"     );    //환불예정일시
	    
	    logger.debug("res_cd========================"+res_cd);
	    logger.debug("res_msg========================"+res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_noti_type========================"+r_noti_type);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_pnt_auth_no========================"+r_pnt_auth_no);
	    logger.debug("r_pnt_tran_date========================"+r_pnt_tran_date);
	    logger.debug("r_cpon_auth_no========================"+r_cpon_auth_no);
	    logger.debug("r_cpon_tran_date========================"+r_cpon_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_bank_cd========================"+r_bank_cd);
	    logger.debug("r_bank_nm========================"+r_bank_nm);
	    logger.debug("r_account_no========================"+r_account_no);
	    logger.debug("r_deposit_nm========================"+r_deposit_nm);
	    logger.debug("r_expire_date========================"+r_expire_date);
	    logger.debug("r_cash_res_cd========================"+r_cash_res_cd);
	    logger.debug("r_cash_res_msg========================"+r_cash_res_msg);
	    logger.debug("r_cash_auth_no========================"+r_cash_auth_no);
	    logger.debug("r_cash_tran_date========================"+r_cash_tran_date);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    logger.debug("r_auth_id========================"+r_auth_id);
	    logger.debug("r_billid========================"+r_billid);
	    logger.debug("r_mobile_no========================"+r_mobile_no);
	    logger.debug("r_ars_no========================"+r_ars_no);
	    logger.debug("r_cp_cd========================"+r_cp_cd);
	    logger.debug("r_used_pnt========================"+r_used_pnt);
	    logger.debug("r_remain_pnt========================"+r_remain_pnt);
	    logger.debug("r_pay_pnt========================"+r_pay_pnt);
	    logger.debug("r_accrue_pnt========================"+r_accrue_pnt);
	    logger.debug("r_remain_cpon========================"+r_remain_cpon);
	    logger.debug("r_used_cpon========================"+r_used_cpon);
	    logger.debug("r_mall_nm========================"+r_mall_nm);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_acq_data========================"+r_canc_acq_data);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    logger.debug("r_refund_date========================"+r_refund_date);
	    
		String PAY_MST_TR_STATUS = "";
		
		if("61".equals(mgr_txtype)){
			PAY_MST_TR_STATUS = "M";	//에스크로 상태변경인 경우
		}else{
			String cashbagTrStatus = StringUtil.getString(commandMap.get("cashbagTrStatus"));
			
			if("".equals(cashbagTrStatus)){
				PAY_MST_TR_STATUS = "C"; //일반 취소인 경우
			}else{
				PAY_MST_TR_STATUS = cashbagTrStatus;	//캐쉬백 적립 취소 X/사용 취소 N 
			}
		}
	    
	    commandMap.put("PAY_MST_TR_STATUS",		PAY_MST_TR_STATUS);//변경상태값에 따라 다르게 
	    commandMap.put("PAY_MST_RESPCODE", res_cd);
	    commandMap.put("PAY_MST_RESPMSG", res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_MID",				g_mall_id);
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_PNT_AUTH_NO", r_pnt_auth_no);
	    commandMap.put("PAY_MST_KICC_PNT_TRAN_DATE", r_pnt_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_BANK_CD", r_bank_cd);
	    commandMap.put("PAY_MST_KICC_BANK_NM", r_bank_nm);
	    commandMap.put("PAY_MST_KICC_ACCOUNT_NO", r_account_no);
	    commandMap.put("PAY_MST_KICC_DEPOSIT_NM", r_deposit_nm);
	    commandMap.put("PAY_MST_KICC_EXPIRE_DATE", r_expire_date);
	    commandMap.put("PAY_MST_KICC_CASH_RES_CD", r_cash_res_cd);
	    commandMap.put("PAY_MST_KICC_CASH_RES_MSG", r_cash_res_msg);
	    commandMap.put("PAY_MST_KICC_CASH_AUTH_NO", r_cash_auth_no);
	    commandMap.put("PAY_MST_KICC_CASH_TRAN_DATE", r_cash_tran_date);
	    commandMap.put("PAY_MST_KICC_AUTH_ID", r_auth_id);
	    commandMap.put("PAY_MST_KICC_BILLID", r_billid);
	    commandMap.put("PAY_MST_KICC_MOBILE_NO", r_mobile_no);
	    commandMap.put("PAY_MST_KICC_ARS_NO", r_ars_no);
	    //commandMap.put("PAY_MST_KICC_USED_PNT", r_used_pnt);		// 'P'가 리턴돼서.. 주석처리
	    commandMap.put("PAY_MST_KICC_REMAIN_PNT", r_remain_pnt);
	    commandMap.put("PAY_MST_KICC_PAY_PNT", r_pay_pnt);
	    commandMap.put("PAY_MST_KICC_ACCURE_PNT", r_accrue_pnt);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_ACQ_DATE", r_canc_acq_data);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    commandMap.put("PAY_MST_KICC_REFUND_DATE", r_refund_date);

	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    
	    logger.info("#######[END] KICC 변경 요청 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    return commandMap;
	    
	}
	
	
	/**
	* <pre>
	* 1. MethodName : kiccCardPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 카드 결제승인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccCardPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 카드 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_PAYMENT    = "00101000";   // 승인

	    /* -------------------------------------------------------------------------- */
	    /* ::: 쇼핑몰 지불 정보 설정                                                  */
	    /* -------------------------------------------------------------------------- */
	    final String GW_URL                 = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
	    //final String GW_URL               = "gw.easypay.co.kr";      // Gateway URL ( real )
	    final String GW_PORT                = "80";                    // 포트번호(변경불가) 
		
	    /* -------------------------------------------------------------------------- */ 
	    /* ::: 지불 데이터 셋업 (업체에 맞게 수정)                                    */ 
	    /* -------------------------------------------------------------------------- */ 
	    /* ※ 주의 ※                                                                 */ 
	    /* cert_file 변수 설정                                                        */
	    /* - pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                       */ 
	    /* log_dir 변수 설정                                                          */
	    /* - log 디렉토리 설정                                                        */
	    /* log_level 변수 설정                                                        */
	    /* - log 레벨 설정                                                            */
	    /* -------------------------------------------------------------------------- */
	    final String CERT_FILE              = this.propertiesService.getString("payment.kicc.certificate.path");
	    final String LOG_DIR                = this.propertiesService.getString("payment.kicc.log.path");
	    final int LOG_LEVEL                 = 1;
	    
	    /* --------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 가맹점 주문정보                                              */
	    /* --------------------------------------------------------------------------- */
	    String order_no          = StringUtil.getString(commandMap.get("EP_order_no"         ));   // [필수]*주문번호
	    String user_type         = StringUtil.getString(commandMap.get("user_type"           ));   // [선택]사용자구분 [1:일반,2:회원]    
	    String memb_user_no      = StringUtil.getString(commandMap.get("memb_user_no"        ));   // [선택]가맹점 고객일련번호
	    String user_id           = StringUtil.getString(commandMap.get("user_id"             ));   // [선택]고객 ID
	    String user_nm           = StringUtil.getString(commandMap.get("user_nm"             ));   // [선택]고객명
	    String user_mail         = StringUtil.getString(commandMap.get("user_mail"           ));   // [선택]고객 E-mail
	    String user_phone1       = StringUtil.getString(commandMap.get("user_phone1"         ));   // [선택]가맹점 고객 연락처1
	    String user_phone2       = StringUtil.getString(commandMap.get("user_phone2"         ));   // [선택]가맹점 고객 연락처2
	    String user_addr         = StringUtil.getString(commandMap.get("user_addr"           ));   // [선택]가맹점 고객 주소
	    String product_type      = StringUtil.getString(commandMap.get("product_type"        ));   // [선택]상품정보구분[0:실물,1:컨텐츠]
	    String product_nm        = StringUtil.getString(commandMap.get("product_nm"          ));   // [선택]상품명
	    String product_amt       = "";                                                             // [필수]상품금액
	    String user_define1      = StringUtil.getString(commandMap.get("user_define1"        ));   // [선택]가맹점필드1
	    String user_define2      = StringUtil.getString(commandMap.get("user_define2"        ));   // [선택]가맹점필드2
	    String user_define3      = StringUtil.getString(commandMap.get("user_define3"        ));   // [선택]가맹점필드3
	    String user_define4      = StringUtil.getString(commandMap.get("user_define4"        ));   // [선택]가맹점필드4
	    String user_define5      = StringUtil.getString(commandMap.get("user_define5"        ));   // [선택]가맹점필드5
	    String user_define6      = StringUtil.getString(commandMap.get("user_define6"        ));   // [선택]가맹점필드6
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 승인공통 정보                                               */
	    /* -------------------------------------------------------------------------- */
	   //String mall_id           = this.propertiesService.getString("payment.kicc.mall.id");
	    String mall_id           = StringUtil.getString(commandMap.get("EP_mall_id"          ));   // [필수]가맹점ID
	    String tot_amt           = "";                                                             // [필수]총결제금액
	    String tr_cd             = TRAN_CD_NOR_PAYMENT;   // [필수]*처리구분    
	    String currency          = StringUtil.getString(commandMap.get("EP_currency"         ));   // [필수]통화코드 (원화:00)
	    String client_version    = StringUtil.getString(commandMap.get("EP_client_version"   ));   // [필수]*EasyPay 모듈 버전    
	    String req_cno           = StringUtil.getString(commandMap.get("EP_cno"              ));   // [필수]*PG거래번호
	    String join_cd           = "";                                                             // [선택]제휴서비스 코드    
	    String client_ip         = request.getRemoteAddr();                                        // [선택]고객IP
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 승인카드정보                                                */
	    /* -------------------------------------------------------------------------- */
	    String card_txtype       = "20";                                                           // [필수]신용카드 처리구분(수정불가)
	    String req_type          = StringUtil.getString(commandMap.get("EP_req_type"         ));   // [필수]*인증구분(0:일반(Kmotion), 1:ISP, 2:MPI)    
	    String cert_type         = "";                                                             // [필수]신용카드 인증여부    
	    String card_cd           = StringUtil.getString(commandMap.get("EP_card_cd"          ));   // [필수]*카드 코드(포인트와 세이브 결제 처리를 위해)
	    String card_amt          = StringUtil.getString(commandMap.get("EP_card_amt"         ));   // [필수]*신용카드금액
	    String wcc               = "@";                                                            // [선택]WCC    
	    String noint             = StringUtil.getString(commandMap.get("EP_noint"            ));   // [선택]*무이자여부
	    String install_period    = StringUtil.getString(commandMap.get("EP_install_period"   ));   // [필수]*할부개월
	    String card_no           = StringUtil.getString(commandMap.get("EP_card_no"          ));   // [선택]*MPI만 카드번호    
	    String expire_date       = StringUtil.getString(commandMap.get("EP_expire_date"      ));   // [선택]*유효기간(Kmotion 결제시)
	    String cavv              = StringUtil.getString(commandMap.get("EP_cavv"             ));   // [선택]*MPI인증응답
	    String xid               = StringUtil.getString(commandMap.get("EP_xid"              ));   // [선택]*MPI인증응답
	    String eci               = StringUtil.getString(commandMap.get("EP_eci"              ));   // [선택]*MPI인증응답
	    String ret_save_used     = StringUtil.getString(commandMap.get("EP_ret_save_used"    ));   // [선택]*세이브 여부
	    String ret_save_kind     = StringUtil.getString(commandMap.get("EP_ret_save_kind"    ));   // [선택]*세이브 종류
	    String point_useyn       = StringUtil.getString(commandMap.get("EP_point_useyn"      ));   // [선택]*포인트 사용 유무
	    String kvp_pgid          = StringUtil.getString(commandMap.get("EP_kvp_pgid"         ));   // [선택]*KVP PGID
	    String kvp_cardcode      = StringUtil.getString(commandMap.get("EP_kvp_cardcode"     ));   // [선택]*KVP 카드코드
	    String kvp_sessionkey    = StringUtil.getString(commandMap.get("EP_kvp_sessionkey"   ));   // [선택]*KVP 세션키
	    String kvp_encdata       = StringUtil.getString(commandMap.get("EP_kvp_encdata"      ));   // [선택]*KVP 암호화 전문
	    String kvp_quota         = StringUtil.getString(commandMap.get("EP_kvp_quota"        ));   // [선택]*KVP 할부개월
	    String kvp_noint         = StringUtil.getString(commandMap.get("EP_kvp_noint"        ));   // [선택]*KVP 무이자여부
	    String kvp_point_flag    = StringUtil.getString(commandMap.get("EP_kvp_payset_flag"  ));   // [선택]*국민카드 포인트 사용유무    
	    String kvp_point_amt     = StringUtil.getString(commandMap.get("EP_kvp_using_point"  ));   // [선택]*국민카드 포인트 사용금액
	    String kvp_ret_save_used = StringUtil.getString(commandMap.get("EP_vp_ret_save_point"));   // [선택]*KVP 세이브 결제 유무
	    String kmotion_useyn     = StringUtil.getString(commandMap.get("EP_kmotion_useyn"    ));   // [선택]*KMOTION 사용유무
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 무이자/포인트/세이브 재설정                                            */
	    /* -------------------------------------------------------------------------- */
	    // ISP 결제 할부개월 및 무이자 여부 재설정
	    if( "1".equals(req_type) )
	    {
	        install_period = Integer.toString(Integer.parseInt(kvp_quota));
	        if( "1".equals(kvp_noint) )
	        {
	            noint = "02";
	        }
	        else
	        {
	            noint = "00";
	        }
	    }
	    
	    // 포인트 및 세이브 사용 가맹점 주의!!!
	    // 할부개월 계산    
	    if("TRUE".equals(kvp_point_flag)) //국민카드 포인트 사용시
	    {
	        kvp_point_flag = "1"; // 포인트 사용 시 승인요청 전문은 "1"
	        point_useyn    = "Y"; 
	    }
	    
	    //포인트 결제- 제휴사별 할부개월 상이할 수 있으므로 필히 영업담당자에게 문의
	    if("Y".equals(point_useyn)) 
	    {
	        if("027".equals(card_cd)) //현대M포인트
	        {
	            install_period = Integer.toString(Integer.parseInt(install_period) + 80);
	            join_cd = "JC02"; //세이브 결제시, 제휴서비스 코드 [변경불가]
	        }
	        else //기타카드
	        {
	            install_period = Integer.toString(Integer.parseInt(install_period) + 60);
	        }
	    }
	    else
	    {
	        if("TRUE".equals(kvp_ret_save_used))
	        {
	            // ISP 세이브 결제 유무 확인 및 할부개월 설정
	            ret_save_used = "Y";
	            install_period = Integer.toString(Integer.parseInt(install_period) + 40);
	        }
	        
	        if("Y".equals(ret_save_used)) //세이브 결제 
	        { 
	            if("008".equals(card_cd)) //외환,하나카드
	            {           
	                if("41".equals(ret_save_kind)) // 세이브 종류가 41 이라면, 할부개월 41로
	                {  
	                    install_period = "41";
	                }
	                else // 41이 아니라면 할부개월 + 40 으로 처리
	                {                              
	                    install_period = Integer.toString(Integer.parseInt(install_period) + 40); 
	                }
	            }
	            
	            join_cd = "JC06"; //세이브 결제시, 제휴서비스 코드 [변경불가]
	        }
	    }

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인 전문 금액 처리                                                    */
	    /* -------------------------------------------------------------------------- */

	    tot_amt = product_amt = card_amt;
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인 응답 결과 선언                                                    */
	    /* -------------------------------------------------------------------------- */
	    // CA : 카드승인, CAO : 카드승인옵션 
	    // CC : 카드승인취소, CCO : 카드승인취소옵션, CPC : 카드매입취소 
	    String r_res_cd          = "";    // 응답코드          (CA, CAO, CC, CCO, CPC)
	    String r_res_msg         = "";    // 응답메시지        (CA, CAO, CC, CCO, CPC)
	    String r_cno             = "";    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    String r_amount          = "";    // 총 결제금액       (CA,                  )
	    String r_order_no        = "";    // 주문번호          (CA,                  )
	    String r_auth_no         = "";    // 승인번호          (CA,                  )
	    String r_tran_date       = "";    // 승인일시          (CA,      CC,      CPC)
	    String r_escrow_yn       = "";    // 에스크로 사용유무 (CA,                  )
	    String r_complex_yn      = "";    // 복합결제 유무     (CA,                  )
	    String r_stat_cd         = "";    // 상태코드          (CA,      CC,      CPC)
	    String r_stat_msg        = "";    // 상태메시지        (CA,      CC,      CPC)
	    String r_pay_type        = "";    // 결제수단          (CA,                  )
	    String r_mall_id         = "";    // 가맹점 Mall ID    (CA                   )
	    String r_card_no         = "";    // 카드번호          (CA,          CCO     )
	    String r_issuer_cd       = "";    // 발급사코드        (CA,          CCO     )
	    String r_issuer_nm       = "";    // 발급사명          (CA,          CCO     )
	    String r_acquirer_cd     = "";    // 매입사코드        (CA,          CCO     )
	    String r_acquirer_nm     = "";    // 매입사명          (CA,          CCO     )
	    String r_install_period  = "";    // 할부개월          (CA,          CCO     )
	    String r_noint           = "";    // 무이자여부        (CA                   )
	    String r_join_no         = "";    // 가맹점 번호       (CA,          CCO     )
	    String r_part_cancel_yn  = "";    // 부분취소 가능여부 (CA                   )
	    String r_card_gubun      = "";    // 신용카드 종류     (CA                   )
	    String r_card_biz_gubun  = "";    // 신용카드 구분     (CA                   )
	    String r_cpon_flag       = "";    // 쿠폰 사용유무     (    CAO,     CCO     )
	    String r_used_cpon       = "";    // 쿠폰 사용금액     (    CAO              )
	    String r_canc_acq_date   = "";    // 매입취소일시      (                  CPC)
	    String r_canc_date       = "";    // 취소일시          (CC,               CPC)

	/* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	   
	    easyPayClient.easypay_setenv_init( GW_URL, GW_PORT, CERT_FILE, LOG_DIR );
	    easyPayClient.easypay_reqdata_init();

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인요청 전문 설정                                                     */
	    /* -------------------------------------------------------------------------- */
        // 승인요청 전문 설정
        // 결제 주문 정보 DATA
        int easypay_order_data_item;
        easypay_order_data_item = easyPayClient.easypay_item( "order_data" );

        easyPayClient.easypay_deli_us( easypay_order_data_item, "order_no"      , order_no      );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_type"     , user_type     );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "memb_user_no"  , memb_user_no  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_id"       , user_id       );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_nm"       , user_nm       );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_mail"     , user_mail     );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone1"   , user_phone1   );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone2"   , user_phone2   );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_addr"     , user_addr     );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_type"  , product_type  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_nm"    , product_nm    );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_amt"   , product_amt   );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define1"  , user_define1  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define2"  , user_define2  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define3"  , user_define3  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define4"  , user_define4  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define5"  , user_define5  );
        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define6"  , user_define6  );
        
        // 결제정보 DATA부
        int easypay_pay_data_item;
        easypay_pay_data_item = easyPayClient.easypay_item( "pay_data" );

        // 결제 공통 정보 DATA
        int easypay_common_item;
        easypay_common_item = easyPayClient.easypay_item( "common" );

        easyPayClient.easypay_deli_us( easypay_common_item, "tot_amt"       , tot_amt       );
        easyPayClient.easypay_deli_us( easypay_common_item, "currency"      , currency      );
        easyPayClient.easypay_deli_us( easypay_common_item, "client_ip"     , client_ip     );
        easyPayClient.easypay_deli_us( easypay_common_item, "cli_ver"       , client_version);        
        easyPayClient.easypay_deli_us( easypay_common_item, "req_cno"       , req_cno       );
        easyPayClient.easypay_deli_us( easypay_common_item, "join_cd"       , join_cd       );
        
        easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_common_item );

        // 신용카드 결제 DATA SET
        int easypay_card_item;
        easypay_card_item = easyPayClient.easypay_item( "card" );

        easyPayClient.easypay_deli_us( easypay_card_item, "card_txtype"    , card_txtype    );
        easyPayClient.easypay_deli_us( easypay_card_item, "req_type"       , req_type       );
        easyPayClient.easypay_deli_us( easypay_card_item, "card_amt"       , card_amt       );
        easyPayClient.easypay_deli_us( easypay_card_item, "noint"          , noint          );        
        easyPayClient.easypay_deli_us( easypay_card_item, "wcc"            , wcc            );
        easyPayClient.easypay_deli_us( easypay_card_item, "install_period" , install_period );

        if( "0".equals(req_type) ) 
        {
            if( "Y".equals(kmotion_useyn) ) // KMOTION 
            {
                cert_type = "1";
                expire_date = "8911"; // 유효기간 수정불가
                easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"   , cert_type   );                
                easyPayClient.easypay_deli_us( easypay_card_item, "card_no"     , card_no     );
                easyPayClient.easypay_deli_us( easypay_card_item, "expire_date" , expire_date );                    
            }
        }
        else if( "1".equals(req_type) ) // ISP
        {
            cert_type = "0";
            
            easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"      , cert_type      );
            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_pgid"       , kvp_pgid       );
            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_cardcode"   , kvp_cardcode   );
            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_sessionkey" , kvp_sessionkey );
            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_encdata"    , kvp_encdata    );
            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_point_flag" , kvp_point_flag );
            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_point_amt"  , kvp_point_amt  );
        }
        else if( "2".equals(req_type) ) // MPI 
        {
            cert_type = "0";
            expire_date = "7912"; // 유효기간 수정불가
            
            easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"      , cert_type   );
            easyPayClient.easypay_deli_us( easypay_card_item, "card_no"        , card_no     );
            easyPayClient.easypay_deli_us( easypay_card_item, "expire_date"    , expire_date );
            easyPayClient.easypay_deli_us( easypay_card_item, "cavv"           , cavv        );
            easyPayClient.easypay_deli_us( easypay_card_item, "xid"            , xid         );
            easyPayClient.easypay_deli_us( easypay_card_item, "eci"            , eci         );
        }

        easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_card_item );

	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) 
	    {
	        easyPayClient.easypay_run( mall_id, tr_cd, order_no );
	        r_res_cd  = easyPayClient.res_cd;
	        r_res_msg = easyPayClient.res_msg;
	    }
	    else 
	    {
	        r_res_cd  = "M114";
	        r_res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno                  = getNullToSpace(easyPayClient.easypay_get_res("cno"           ));    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    r_amount               = getNullToSpace(easyPayClient.easypay_get_res("amount"        ));    // 총 결제금액       (CA,                  )
	    r_order_no             = getNullToSpace(easyPayClient.easypay_get_res("order_no"      ));    // 주문번호          (CA,                  )
	    r_auth_no              = getNullToSpace(easyPayClient.easypay_get_res("auth_no"       ));    // 승인번호          (CA,                  )
	    r_tran_date            = getNullToSpace(easyPayClient.easypay_get_res("tran_date"     ));    // 승인일시          (CA,      CC,      CPC)
	    r_escrow_yn            = getNullToSpace(easyPayClient.easypay_get_res("escrow_yn"     ));    // 에스크로 사용유무 (CA,                  )
	    r_complex_yn           = getNullToSpace(easyPayClient.easypay_get_res("complex_yn"    ));    // 복합결제 유무     (CA,                  )
	    r_stat_cd              = getNullToSpace(easyPayClient.easypay_get_res("stat_cd"       ));    // 상태코드          (CA,      CC,      CPC)
	    r_stat_msg             = getNullToSpace(easyPayClient.easypay_get_res("stat_msg"      ));    // 상태메시지        (CA,      CC,      CPC)
	    r_pay_type             = getNullToSpace(easyPayClient.easypay_get_res("pay_type"      ));    // 결제수단          (CA,                  )
	    r_mall_id              = getNullToSpace(easyPayClient.easypay_get_res("mall_id"       ));    // 가맹점 Mall ID    (CA                   )
	    r_card_no              = getNullToSpace(easyPayClient.easypay_get_res("card_no"       ));    // 카드번호          (CA,          CCO     )
	    r_issuer_cd            = getNullToSpace(easyPayClient.easypay_get_res("issuer_cd"     ));    // 발급사코드        (CA,          CCO     )
	    r_issuer_nm            = getNullToSpace(easyPayClient.easypay_get_res("issuer_nm"     ));    // 발급사명          (CA,          CCO     )
	    r_acquirer_cd          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_cd"   ));    // 매입사코드        (CA,          CCO     )
	    r_acquirer_nm          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_nm"   ));    // 매입사명          (CA,          CCO     )
	    r_install_period       = getNullToSpace(easyPayClient.easypay_get_res("install_period"));    // 할부개월          (CA,          CCO     )
	    r_noint                = getNullToSpace(easyPayClient.easypay_get_res("noint"         ));    // 무이자여부        (CA                   )
	    r_join_no              = getNullToSpace(easyPayClient.easypay_get_res("join_no"       ));    // 가맹점 번호       (CA,          CCO     )
	    r_part_cancel_yn       = getNullToSpace(easyPayClient.easypay_get_res("part_cancel_yn"));    // 부분취소 가능여부 (CA                   )
	    r_card_gubun           = getNullToSpace(easyPayClient.easypay_get_res("card_gubun"    ));    // 신용카드 종류     (CA                   )
	    r_card_biz_gubun       = getNullToSpace(easyPayClient.easypay_get_res("card_biz_gubun"));    // 신용카드 구분     (CA                   )
	    r_cpon_flag            = getNullToSpace(easyPayClient.easypay_get_res("cpon_flag"     ));    // 쿠폰 사용유무     (    CAO,     CCO     )
	    r_used_cpon            = getNullToSpace(easyPayClient.easypay_get_res("used_cpon"     ));    // 쿠폰 사용금액     (    CAO              )
	    r_canc_acq_date        = getNullToSpace(easyPayClient.easypay_get_res("canc_acq_date" ));    // 매입취소일시      (                  CPC)
	    r_canc_date            = getNullToSpace(easyPayClient.easypay_get_res("canc_date"     ));    // 취소일시          (CC,               CPC)
	   
	    logger.debug("r_res_cd========================"+r_res_cd);
	    logger.debug("r_res_msg========================"+r_res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    
	    logger.debug("r_stat_cd========================"+r_stat_cd);
	    logger.debug("r_stat_msg========================"+r_stat_msg);
	    logger.debug("r_pay_type========================"+r_pay_type);
	    logger.debug("r_mall_id========================"+r_mall_id);
	    logger.debug("r_join_no========================"+r_join_no);
	    logger.debug("r_part_cancel_yn========================"+r_part_cancel_yn);
	    logger.debug("r_card_gubun========================"+r_card_gubun);
	    logger.debug("r_card_biz_gubun========================"+r_card_biz_gubun);
	    logger.debug("r_cpon_flag========================"+r_cpon_flag);
	    logger.debug("r_used_cpon========================"+r_used_cpon);
	    logger.debug("r_canc_acq_date========================"+r_canc_acq_date);
	    
	    
	    commandMap.put("PAY_MST_TR_STATUS",		"A");
	    commandMap.put("PAY_MST_RESPCODE", r_res_cd);
	    commandMap.put("PAY_MST_RESPMSG", r_res_msg);
	    commandMap.put("PAY_MST_MID", mall_id);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    
	    commandMap.put("client_ip", client_ip);	//즉시 취소시 필요한 client_ip
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    /*if ( r_res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals( tr_cd ) )
	    {
	        String bDBProc = "true";     // DB처리 성공 시 "true", 실패 시 "false"
	        if ( bDBProc.equals("false") )
	        {
	        	
	        }
	    }*/
	    
	    logger.info("#######[END] KICC 카드 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccMobileCardPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 모바일 카드 결제 승인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 2.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccMobileCardPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 모바일 카드 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_PAYMENT    = "00101000";   // 승인

	    /* -------------------------------------------------------------------------- */
	    /* ::: 쇼핑몰 지불 정보 설정                                                  */
	    /* -------------------------------------------------------------------------- */
	    final String GW_URL                 = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
	    //final String GW_URL               = "gw.easypay.co.kr";      // Gateway URL ( real )
	    final String GW_PORT                = "80";                    // 포트번호(변경불가) 

	    /* -------------------------------------------------------------------------- */ 
	    /* ::: 지불 데이터 셋업 (업체에 맞게 수정)                                    */ 
	    /* -------------------------------------------------------------------------- */ 
	    /* ※ 주의 ※                                                                 */ 
	    /* cert_file 변수 설정                                                        */
	    /* - pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                       */ 
	    /* log_dir 변수 설정                                                          */
	    /* - log 디렉토리 설정                                                        */
	    /* log_level 변수 설정                                                        */
	    /* - log 레벨 설정                                                            */
	    /* -------------------------------------------------------------------------- */
	    final String CERT_FILE              = this.propertiesService.getString("payment.kicc.certificate.path");
	    final String LOG_DIR                = this.propertiesService.getString("payment.kicc.log.path");
	    final int LOG_LEVEL                 = 1;
	 
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 가맹점 주문정보                                             */
	    /* -------------------------------------------------------------------------- */
	    String order_no         = StringUtil.getString(commandMap.get("sp_order_no"        ));    // [필수]*주문번호
	    String user_type        = StringUtil.getString(commandMap.get("user_type"          ));    // [선택]사용자구분 [1:일반,2:회원]    
	    String memb_user_no     = StringUtil.getString(commandMap.get("memb_user_no"       ));    // [선택]가맹점 고객일련번호
	    String user_id          = StringUtil.getString(commandMap.get("user_id"            ));    // [선택]고객 ID
	    String user_nm          = StringUtil.getString(commandMap.get("user_nm"            ));    // [선택]고객명
	    String user_mail        = StringUtil.getString(commandMap.get("user_mail"          ));    // [선택]고객 E-mail
	    String user_phone1      = StringUtil.getString(commandMap.get("user_phone1"        ));    // [선택]가맹점 고객 연락처1
	    String user_phone2      = StringUtil.getString(commandMap.get("user_phone2"        ));    // [선택]가맹점 고객 연락처2
	    String user_addr        = StringUtil.getString(commandMap.get("user_addr"          ));    // [선택]가맹점 고객 주소
	    String product_type     = StringUtil.getString(commandMap.get("product_type"       ));    // [선택]상품정보구분[0:실물,1:컨텐츠]
	    String product_nm       = StringUtil.getString(commandMap.get("product_nm"         ));    // [선택]상품명
	    String product_amt      = "";                                                             // [필수]상품금액
	    String user_define1     = StringUtil.getString(commandMap.get("user_define1"       ));    // [선택]가맹점필드1
	    String user_define2     = StringUtil.getString(commandMap.get("user_define2"       ));    // [선택]가맹점필드2
	    String user_define3     = StringUtil.getString(commandMap.get("user_define3"       ));    // [선택]가맹점필드3
	    String user_define4     = StringUtil.getString(commandMap.get("user_define4"       ));    // [선택]가맹점필드4
	    String user_define5     = StringUtil.getString(commandMap.get("user_define5"       ));    // [선택]가맹점필드5
	    String user_define6     = StringUtil.getString(commandMap.get("user_define6"       ));    // [선택]가맹점필드6
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 승인공통 정보                                               */
	    /* -------------------------------------------------------------------------- */
	    // String mall_id          = this.propertiesService.getString("payment.kicc.mall.id");    // [필수]몰아이디
	    String mall_id          = StringUtil.getString(commandMap.get("sp_mall_id"          ));   // [필수]가맹점ID
	    String tot_amt          = "";                                                             // [필수]총결제금액
	    String tr_cd            = TRAN_CD_NOR_PAYMENT;    // [필수]*처리구분    
	    String currency         = StringUtil.getString(commandMap.get("sp_currency"        ));    // [필수]통화코드 (원화:00)
	    String client_version   = StringUtil.getString(commandMap.get("sp_client_version"  ));    // [필수]*EasyPay 모듈 버전    
	    String req_cno          = StringUtil.getString(commandMap.get("sp_cno"             ));    // [필수]*PG거래번호    
	    String join_cd          = "";                                                             // [선택]제휴서비스 코드    
	    String client_ip        = request.getRemoteAddr();                                        // [선택]고객IP
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 승인카드정보                                                */
	    /* -------------------------------------------------------------------------- */
	    String card_txtype      = "20";                                                           // [필수]신용카드 처리구분(수정불가)
	    String req_type         = StringUtil.getString(commandMap.get("sp_req_type"        ));    // [필수]*인증구분(0:일반(Kmotion), 1:ISP, 2:MPI)    
	    String cert_type        = "";                                                             // [필수]신용카드 인증여부
	    String card_cd          = StringUtil.getString(commandMap.get("sp_card_cd"         ));    // [필수]*카드 코드(포인트와 세이브 결제 처리를 위해)
	    String card_amt         = StringUtil.getString(commandMap.get("sp_card_amt"        ));    // [필수]*신용카드금액    
	    String wcc              = "@";                                                            // [선택]WCC
	    String noint            = StringUtil.getString(commandMap.get("sp_noint"           ));    // [선택]*무이자여부    
	    String install_period   = StringUtil.getString(commandMap.get("sp_install_period"  ));    // [필수]*할부개월
	    String card_no          = StringUtil.getString(commandMap.get("sp_card_no"         ));    // [선택]*MPI만 카드번호    
	    String expire_date      = StringUtil.getString(commandMap.get("sp_expire_date"     ));    // [선택]*유효기간(Kmotion 결제시)
	    String cavv             = StringUtil.getString(commandMap.get("sp_cavv"            ));    // [선택]*MPI인증응답
	    String xid              = StringUtil.getString(commandMap.get("sp_xid"             ));    // [선택]*MPI인증응답
	    String eci              = StringUtil.getString(commandMap.get("sp_eci"             ));    // [선택]*MPI인증응답
	    String ret_save_used    = StringUtil.getString(commandMap.get("sp_ret_save_used"   ));    // [선택]*세이브 여부
	    String ret_save_kind    = StringUtil.getString(commandMap.get("sp_ret_save_kind"   ));    // [선택]*세이브 종류
	    String point_useyn      = StringUtil.getString(commandMap.get("sp_point_useyn"     ));    // [선택]*포인트 사용 유무
	    String kvp_pgid         = "";                                                             // [선택]자체가맹점의 경우 VP와 계약한 ID로 설정
	    String kvp_cardcode     = StringUtil.getString(commandMap.get("sp_kvp_cardcode"    ));    // [선택]*KVP 카드코드
	    String kvp_sessionkey   = StringUtil.getString(commandMap.get("sp_kvp_sessionkey"  ));    // [선택]*KVP 세션키
	    String kvp_encdata      = StringUtil.getString(commandMap.get("sp_kvp_encdata"     ));    // [선택]*KVP 암호화 전문
	    String kvp_point_flag   = StringUtil.getString(commandMap.get("sp_kvp_payset_flag" ));    // [선택]*국민카드 포인트 사용유무
	    String kvp_point_amt    = StringUtil.getString(commandMap.get("sp_kvp_using_point" ));    // [선택]*국민카드 포인트 사용금액
	    String kvp_remain_point = StringUtil.getString(commandMap.get("sp_kvp_remain_point"));    // [선택]*국민카드 포인트 잔액
	    String kmotion_useyn    = StringUtil.getString(commandMap.get("sp_kmotion_useyn"   ));    // [선택]*KMOTION 사용유무
	        
	    /* -------------------------------------------------------------------------- */
	    /* ::: 무이자/포인트/세이브 재설정                                            */
	    /* -------------------------------------------------------------------------- */
	    // 포인트및 세이브 할부개월 계산
	    if("TRUE".equals(kvp_point_flag)) //국민카드 포인트 사용시
	    {
	       kvp_point_flag = "1"; // 포인트 사용 시 승인요청 전문은 "1"
	       point_useyn    = "Y"; 
	    }   
	    
	    //포인트 결제- 제휴사별 할부개월 상이할 수 있으므로 필히 영업담당자에게 문의
	    if("Y".equals(point_useyn)) 
	    {
	        if("027".equals(card_cd)) //현대M포인트
	        {
	            install_period = Integer.toString(Integer.parseInt(install_period) + 80);
	            join_cd = "JC02"; //세이브 결제시, 제휴서비스 코드 [변경불가]
	        }
	        else //기타카드
	        {
	            install_period = Integer.toString(Integer.parseInt(install_period) + 60);
	        }
	    }
	    else 
	    {
	        if("Y".equals(ret_save_used)) //세이브 결제 
	        { 
	            if("008".equals(card_cd)) //외환,하나카드
	            {           
	                if("41".equals(ret_save_kind)) // 세이브 종류가 41 이라면, 할부개월 41로
	                {  
	                    install_period = "41";
	                }
	                else // 41이 아니라면 할부개월 + 40 으로 처리
	                {                              
	                    install_period = Integer.toString(Integer.parseInt(install_period) + 40); 
	                }
	            }
	            join_cd = "JC06"; //세이브 결제시, 제휴서비스 코드 [변경불가]
	        }
	    }

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인 전문 금액 처리                                                    */
	    /* -------------------------------------------------------------------------- */
		tot_amt = product_amt = card_amt;

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인 응답 결과 처리                                                    */
	    /* -------------------------------------------------------------------------- */
	    // CA : 카드승인, CAO : 카드승인옵션 
	    // CC : 카드승인취소, CCO : 카드승인취소옵션, CPC : 카드매입취소 

	    String r_res_cd          = "";    // 응답코드          (CA, CAO, CC, CCO, CPC)
	    String r_res_msg         = "";    // 응답메시지        (CA, CAO, CC, CCO, CPC)
	    String r_cno             = "";    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    String r_amount          = "";    // 총 결제금액       (CA,                  )
	    String r_order_no        = "";    // 주문번호          (CA,                  )
	    String r_auth_no         = "";    // 승인번호          (CA,                  )
	    String r_tran_date       = "";    // 승인일시          (CA,      CC,      CPC)
	    String r_escrow_yn       = "";    // 에스크로 사용유무 (CA,                  )
	    String r_complex_yn      = "";    // 복합결제 유무     (CA,                  )
	    String r_stat_cd         = "";    // 상태코드          (CA,      CC,      CPC)
	    String r_stat_msg        = "";    // 상태메시지        (CA,      CC,      CPC)
	    String r_pay_type        = "";    // 결제수단          (CA,                  )
	    String r_mall_id         = "";    // 가맹점 Mall ID    (CA                   )
	    String r_card_no         = "";    // 카드번호          (CA,          CCO     )
	    String r_issuer_cd       = "";    // 발급사코드        (CA,          CCO     )
	    String r_issuer_nm       = "";    // 발급사명          (CA,          CCO     )
	    String r_acquirer_cd     = "";    // 매입사코드        (CA,          CCO     )
	    String r_acquirer_nm     = "";    // 매입사명          (CA,          CCO     )
	    String r_install_period  = "";    // 할부개월          (CA,          CCO     )
	    String r_noint           = "";    // 무이자여부        (CA                   )
	    String r_join_no         = "";    // 가맹점 번호       (CA,          CCO     )
	    String r_part_cancel_yn  = "";    // 부분취소 가능여부 (CA                   )
	    String r_card_gubun      = "";    // 신용카드 종류     (CA                   )
	    String r_card_biz_gubun  = "";    // 신용카드 구분     (CA                   )
	    String r_cpon_flag       = "";    // 쿠폰 사용유무     (    CAO,     CCO     )
	    String r_used_cpon       = "";    // 쿠폰 사용금액     (    CAO              )
	    String r_canc_acq_date   = "";    // 매입취소일시      (                  CPC)
	    String r_canc_date       = "";    // 취소일시          (CC,               CPC)
	    String r_cp_cd           = "";    // 포인트사/쿠폰사   (                     )
	    String r_cpon_auth_no    = "";    // 쿠폰승인번호      (                     )
	    String r_cpon_tran_date  = "";    // 쿠폰승인일시      (                     )
	    String r_cpon_no         = "";    // 쿠폰번호          (                     ) 
	    String r_remain_cpon     = "";    // 쿠폰잔액          (                     )
	        
	    /* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	   
	    easyPayClient.easypay_setenv_init( GW_URL, GW_PORT, CERT_FILE, LOG_DIR );
	    easyPayClient.easypay_reqdata_init();

	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인요청 전문 설정                                                     */
	    /* -------------------------------------------------------------------------- */
	    if( TRAN_CD_NOR_PAYMENT.equals(tr_cd) ) 
	    {
	        // 승인요청 전문 설정
	        // 결제 주문 정보 DATA
	        int easypay_order_data_item;
	        easypay_order_data_item = easyPayClient.easypay_item( "order_data" );

	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_type"     , user_type     );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "order_no"      , order_no      );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "memb_user_no"  , memb_user_no  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_id"       , user_id       );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_nm"       , user_nm       );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_mail"     , user_mail     );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone1"   , user_phone1   );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_phone2"   , user_phone2   );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_addr"     , user_addr     );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_type"  , product_type  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_nm"    , product_nm    );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "product_amt"   , product_amt   );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define1"  , user_define1  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define2"  , user_define2  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define3"  , user_define3  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define4"  , user_define4  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define5"  , user_define5  );
	        easyPayClient.easypay_deli_us( easypay_order_data_item, "user_define6"  , user_define6  );
	        
	        // 결제정보 DATA부
	        int easypay_pay_data_item;
	        easypay_pay_data_item = easyPayClient.easypay_item( "pay_data" );

	        // 결제 공통 정보 DATA
	        int easypay_common_item;
	        easypay_common_item = easyPayClient.easypay_item( "common" );
	         
	        easyPayClient.easypay_deli_us( easypay_common_item, "tot_amt"       , tot_amt        );
	        easyPayClient.easypay_deli_us( easypay_common_item, "currency"      , currency       );
	        easyPayClient.easypay_deli_us( easypay_common_item, "client_ip"     , client_ip      );
	        easyPayClient.easypay_deli_us( easypay_common_item, "cli_ver"       , client_version );        
	        easyPayClient.easypay_deli_us( easypay_common_item, "req_cno"       , req_cno            );
	        easyPayClient.easypay_deli_us( easypay_common_item, "join_cd"       , join_cd        );

	        easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_common_item );

	        // 신용카드 결제 DATA SET
	        int easypay_card_item;
	        easypay_card_item = easyPayClient.easypay_item( "card" );

	        easyPayClient.easypay_deli_us( easypay_card_item, "card_txtype"    , card_txtype    );
	        easyPayClient.easypay_deli_us( easypay_card_item, "req_type"       , req_type       );
	        easyPayClient.easypay_deli_us( easypay_card_item, "card_amt"       , card_amt       );
	        easyPayClient.easypay_deli_us( easypay_card_item, "noint"          , noint          );        
	        easyPayClient.easypay_deli_us( easypay_card_item, "wcc"            , wcc            );
	        easyPayClient.easypay_deli_us( easypay_card_item, "install_period" , install_period );

	        if( "0".equals(req_type))
	        {
	            if("Y".equals(kmotion_useyn)) // KMOTION 
	            {
	                cert_type = "1";
	                expire_date = "8911"; // 유효기간 수정불가            
	                easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"   , cert_type   );                
	                easyPayClient.easypay_deli_us( easypay_card_item, "card_no"     , card_no     );
	                easyPayClient.easypay_deli_us( easypay_card_item, "expire_date" , expire_date );                
	            }
	        }       
	        else if( "1".equals(req_type)) // ISP
	        {
	            cert_type = "0";
	            
	            easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"      , cert_type      );
	            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_cardcode"   , kvp_cardcode   );
	            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_sessionkey" , kvp_sessionkey );
	            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_encdata"    , kvp_encdata    );
	            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_point_flag" , kvp_point_flag );
	            easyPayClient.easypay_deli_us( easypay_card_item, "kvp_point_amt"  , kvp_point_amt  );
	        }
	        else if( "2".equals(req_type)) // MPI 
	        {
	            cert_type = "0";
	            expire_date = "7912"; // 유효기간 수정불가
	            
	            easyPayClient.easypay_deli_us( easypay_card_item, "cert_type"      , cert_type   );
	            easyPayClient.easypay_deli_us( easypay_card_item, "card_no"        , card_no     );
	            easyPayClient.easypay_deli_us( easypay_card_item, "expire_date"    , expire_date );
	            easyPayClient.easypay_deli_us( easypay_card_item, "cavv"           , cavv        );
	            easyPayClient.easypay_deli_us( easypay_card_item, "xid"            , xid         );
	            easyPayClient.easypay_deli_us( easypay_card_item, "eci"            , eci         );
	        }
	        
	        easyPayClient.easypay_deli_rs( easypay_pay_data_item , easypay_card_item );
	    }

	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) 
	    {
	        easyPayClient.easypay_run( mall_id, tr_cd, order_no );
	        r_res_cd  = easyPayClient.res_cd;
	        r_res_msg = easyPayClient.res_msg;
	    }
	    else 
	    {
	        r_res_cd  = "M114";
	        r_res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }

	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno                  = getNullToSpace(easyPayClient.easypay_get_res("cno"           ));    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    r_amount               = getNullToSpace(easyPayClient.easypay_get_res("amount"        ));    // 총 결제금액       (CA,                  )
	    r_order_no             = getNullToSpace(easyPayClient.easypay_get_res("order_no"      ));    // 주문번호          (CA,                  )
	    r_auth_no              = getNullToSpace(easyPayClient.easypay_get_res("auth_no"       ));    // 승인번호          (CA,                  )
	    r_tran_date            = getNullToSpace(easyPayClient.easypay_get_res("tran_date"     ));    // 승인일시          (CA,      CC,      CPC)
	    r_escrow_yn            = getNullToSpace(easyPayClient.easypay_get_res("escrow_yn"     ));    // 에스크로 사용유무 (CA,                  )
	    r_complex_yn           = getNullToSpace(easyPayClient.easypay_get_res("complex_yn"    ));    // 복합결제 유무     (CA,                  )
	    r_stat_cd              = getNullToSpace(easyPayClient.easypay_get_res("stat_cd"       ));    // 상태코드          (CA,      CC,      CPC)
	    r_stat_msg             = getNullToSpace(easyPayClient.easypay_get_res("stat_msg"      ));    // 상태메시지        (CA,      CC,      CPC)
	    r_pay_type             = getNullToSpace(easyPayClient.easypay_get_res("pay_type"      ));    // 결제수단          (CA,                  )
	    r_mall_id              = getNullToSpace(easyPayClient.easypay_get_res("mall_id"       ));    // 가맹점 Mall ID    (CA                   )
	    r_card_no              = getNullToSpace(easyPayClient.easypay_get_res("card_no"       ));    // 카드번호          (CA,          CCO     )
	    r_issuer_cd            = getNullToSpace(easyPayClient.easypay_get_res("issuer_cd"     ));    // 발급사코드        (CA,          CCO     )
	    r_issuer_nm            = getNullToSpace(easyPayClient.easypay_get_res("issuer_nm"     ));    // 발급사명          (CA,          CCO     )
	    r_acquirer_cd          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_cd"   ));    // 매입사코드        (CA,          CCO     )
	    r_acquirer_nm          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_nm"   ));    // 매입사명          (CA,          CCO     )
	    r_install_period       = getNullToSpace(easyPayClient.easypay_get_res("install_period"));    // 할부개월          (CA,          CCO     )
	    r_noint                = getNullToSpace(easyPayClient.easypay_get_res("noint"         ));    // 무이자여부        (CA                   )
	    r_join_no              = getNullToSpace(easyPayClient.easypay_get_res("join_no"       ));    // 가맹점 번호       (CA,          CCO     )
	    r_part_cancel_yn       = getNullToSpace(easyPayClient.easypay_get_res("part_cancel_yn"));    // 부분취소 가능여부 (CA                   )
	    r_card_gubun           = getNullToSpace(easyPayClient.easypay_get_res("card_gubun"    ));    // 신용카드 종류     (CA                   )
	    r_card_biz_gubun       = getNullToSpace(easyPayClient.easypay_get_res("card_biz_gubun"));    // 신용카드 구분     (CA                   )
	    r_cpon_flag            = getNullToSpace(easyPayClient.easypay_get_res("cpon_flag"     ));    // 쿠폰 사용유무     (    CAO,     CCO     )
	    r_used_cpon            = getNullToSpace(easyPayClient.easypay_get_res("used_cpon"     ));    // 쿠폰 사용금액     (    CAO              )
	    r_canc_acq_date        = getNullToSpace(easyPayClient.easypay_get_res("canc_acq_date" ));    // 매입취소일시      (                  CPC)
	    r_canc_date            = getNullToSpace(easyPayClient.easypay_get_res("canc_date"     ));    // 취소일시          (CC,               CPC)
	   
	    logger.debug("r_res_cd========================"+r_res_cd);
	    logger.debug("r_res_msg========================"+r_res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    
	    logger.debug("r_stat_cd========================"+r_stat_cd);
	    logger.debug("r_stat_msg========================"+r_stat_msg);
	    logger.debug("r_pay_type========================"+r_pay_type);
	    logger.debug("r_mall_id========================"+r_mall_id);
	    logger.debug("r_join_no========================"+r_join_no);
	    logger.debug("r_part_cancel_yn========================"+r_part_cancel_yn);
	    logger.debug("r_card_gubun========================"+r_card_gubun);
	    logger.debug("r_card_biz_gubun========================"+r_card_biz_gubun);
	    logger.debug("r_cpon_flag========================"+r_cpon_flag);
	    logger.debug("r_used_cpon========================"+r_used_cpon);
	    logger.debug("r_canc_acq_date========================"+r_canc_acq_date);
	    
	    
	    commandMap.put("PAY_MST_TR_STATUS",		"A");
	    commandMap.put("PAY_MST_RESPCODE", r_res_cd);
	    commandMap.put("PAY_MST_RESPMSG", r_res_msg);
	    commandMap.put("PAY_MST_MID", mall_id);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    
	    commandMap.put("client_ip", client_ip);	//즉시 취소시 필요한 client_ip
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    /*if ( r_res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals( tr_cd ) )
	    {
	        String bDBProc = "true";     // DB처리 성공 시 "true", 실패 시 "false"
	        if ( bDBProc.equals("false") )
	        {
	        	
	        }
	    }*/
	    
	    logger.info("#######[END] KICC 모바일 카드 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccMobileAccountPayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : KICC 모바일 실시간 계좌이체
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccMobileAccountPayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 모바일 실시간 계좌이체 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		// ============================================================================== 
		// =   01. 지불 데이터 셋업 (업체에 맞게 수정)                         		= 
		// = -------------------------------------------------------------------------- = 
		// = ※ 주의 ※                                                        		= 
		// =  cert_file 변수 설정                                              		= 
		// = pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                         = 
		// =                                                                            = 
		// =  log_dir 변수 설정                                                		=
		// = log 디렉토리 설정                                                 		=
		// =  log_level 변수 설정                                              		=
		// = log 레벨 설정                                                     		=
		// = -------------------------------------------------------------------------- =
		
		String g_cert_file  = this.propertiesService.getString("payment.kicc.certificate.path");
		String g_log_dir    = this.propertiesService.getString("payment.kicc.log.path");
		int g_log_level     = 1;
		
		// ============================================================================== /
		// =   02. 쇼핑몰 지불 정보 설정                                                = /
		// = -------------------------------------------------------------------------- = /		
		String g_gw_url    = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
		String g_gw_port   = "80";          // 포트번호(변경불가) /
		// String g_mall_id          = this.propertiesService.getString("payment.kicc.mall.id");    // [필수]몰아이디
	    String g_mall_id          = StringUtil.getString(commandMap.get("sp_mall_id"          ));   // [필수]가맹점ID
		// ============================================================================= /
		
		/* -------------------------------------------------------------------------- */
		/* ::: 처리구분 설정                                                          */
		/* -------------------------------------------------------------------------- */
		final String TRAN_CD_NOR_PAYMENT = "00101000"; // 승인(일반, 에스크로)

		/* -------------------------------------------------------------------------- */
		/* ::: EasyPay 8.0 direct mobile 계좌이체 인증 응답값 설정                    */
		/* -------------------------------------------------------------------------- */
		String sp_res_cd         = StringUtil.getString(commandMap.get("sp_res_cd")); // 응답코드
		String sp_res_msg        = StringUtil.getString(commandMap.get("sp_res_msg")); // 응답메세지
		String sp_cno            = StringUtil.getString(commandMap.get("sp_cno")); // 추적번호
		String sp_order_no       = StringUtil.getString(commandMap.get("sp_order_no")); // 가맹점 주문번호
		String sp_acnt_txtype    = StringUtil.getString(commandMap.get("sp_acnt_txtype")); // 거래구분
		String sp_acnt_amt       = StringUtil.getString(commandMap.get("sp_acnt_amt")); // 거래금액
		String sp_kftc_signdata  = StringUtil.getString(commandMap.get("sp_kftc_signdata")); // 금결원 계좌이체 전자서명 전문
		String sp_kftc_serialno  = StringUtil.getString(commandMap.get("sp_kftc_serialno")); // 금결원 일련번호
		String sp_tr_cd          = TRAN_CD_NOR_PAYMENT; // 처리구분
		String sp_client_version = StringUtil.getString(commandMap.get("sp_client_version")); // EasyPay 모듈 버전
		String client_ip        = request.getRemoteAddr();                                        // [선택]고객IP

		/* -------------------------------------------------------------------------- */
		/* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
		/* -------------------------------------------------------------------------- */
		EasyPayClient easyPayClient = new EasyPayClient();

		easyPayClient.easypay_setenv_init(g_gw_url, g_gw_port, g_cert_file,	g_log_dir);
		easyPayClient.easypay_reqdata_init();

		/* -------------------------------------------------------------------------- */
		/* ::: 계좌이체 승인요청 전문 설정                                                     */
		/* -------------------------------------------------------------------------- */
		if (sp_tr_cd.equals(TRAN_CD_NOR_PAYMENT)) {
			/* -------------------------------------------------------------------------- */
			/* ::: 가맹점 주문번호(sp_order_no)로 가맹점DB에서 결제정보(상품정보/고객정보)를 조회  */
			/* -------------------------------------------------------------------------- */
			//1. DB조회
			//2. 금액 검증 (DB금액과 sp_card_amt가 다를 시 고객에게 금액변조 알림)
			//아래 sample 값은 하드코딩

			// 계좌이체 주문 정보 설정 -전문: PK_DATA_ORDER(결제방식에 관계없이, 모두 동일)

		    String user_type        = StringUtil.getString(commandMap.get("user_type"          ));    // [선택]사용자구분 [1:일반,2:회원]    
		    String order_no = sp_order_no; // [필수]주문번호             
		    String memb_user_no     = StringUtil.getString(commandMap.get("memb_user_no"       ));    // [선택]가맹점 고객일련번호
		    String user_id          = StringUtil.getString(commandMap.get("user_id"            ));    // [선택]고객 ID
		    String user_nm          = StringUtil.getString(commandMap.get("user_nm"            ));    // [선택]고객명
		    String user_mail        = StringUtil.getString(commandMap.get("user_mail"          ));    // [선택]고객 E-mail
		    String user_phone1      = StringUtil.getString(commandMap.get("user_phone1"        ));    // [선택]가맹점 고객 연락처1
		    String user_phone2      = StringUtil.getString(commandMap.get("user_phone2"        ));    // [선택]가맹점 고객 연락처2
		    String user_addr        = StringUtil.getString(commandMap.get("user_addr"          ));    // [선택]가맹점 고객 주소
		    String product_type     = StringUtil.getString(commandMap.get("product_type"       ));    // [선택]상품정보구분[0:실물,1:컨텐츠]
		    String product_nm       = StringUtil.getString(commandMap.get("product_nm"         ));    // [선택]상품명
		    String product_amt      = "";                                                             // [필수]상품금액
		    String user_define1     = StringUtil.getString(commandMap.get("user_define1"       ));    // [선택]가맹점필드1
		    String user_define2     = StringUtil.getString(commandMap.get("user_define2"       ));    // [선택]가맹점필드2
		    String user_define3     = StringUtil.getString(commandMap.get("user_define3"       ));    // [선택]가맹점필드3
		    String user_define4     = StringUtil.getString(commandMap.get("user_define4"       ));    // [선택]가맹점필드4
		    String user_define5     = StringUtil.getString(commandMap.get("user_define5"       ));    // [선택]가맹점필드5
		    String user_define6     = StringUtil.getString(commandMap.get("user_define6"       ));    // [선택]가맹점필드6

			// 공통 결제 정보 설정 -전문: PK_DATA_COMMON

			String tot_amt = sp_acnt_amt; // [필수]결제 총 금액
			String currency = "00"; // [필수]통화코드 (원화:00)
			String escrow_yn = "N"; // [필수]에스크로여부
			String complex_yn = "N"; // [필수]복합결제여부
			String tax_flg = ""; // [필수]과세구분 플래그(TG01:복합과세 승인거래)
			String com_tax_amt = ""; // [필수]과세 승인 금액(복합과세 거래 시 필수)
			String com_free_amt = ""; // [필수]비과세 승인 금액(복합과세 거래 시 필수)
			String com_vat_amt = ""; // [필수]부가세 금액(복합과세 거래 시 필수)
			String client_version = sp_client_version; // [필수]EasyPay 모듈 버전

			String cno = ""; // [선택]PG거래번호(MPI 거래 시 필수)
			if (!sp_cno.equals(""))
				cno = sp_cno;

			// 계좌이체 결제 정보 설정 -전문: PK_DATA_ANCT

			String acnt_txtype   = sp_acnt_txtype;   // [필수]처리종류 (승인:20)
			String acnt_amt      = sp_acnt_amt;      // [필수]계좌이체 결제금액
			String kftc_signdata = sp_kftc_signdata; // [필수]금결원 암호 데이터
			String kftc_serialno = sp_kftc_serialno; // [필수]금결원 일련번호

			/* -------------------------------------------------------------------------- */
			/* ::: 승인요청 전문 설정   -전문 : TX_REQ_DATA */
			/* -------------------------------------------------------------------------- */
			//주문정보 DATA -전문: PK_DATA_ORDER

			int easypay_order_data_item;
			easypay_order_data_item = easyPayClient.easypay_item("order_data");
			
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_type", user_type);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"order_no", order_no);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"memb_user_no", memb_user_no);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_id", user_id);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_nm", user_nm);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_mail", user_mail);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_phone1", user_phone1);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_phone2", user_phone2);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_addr", user_addr);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"product_type", product_type);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"product_nm", product_nm);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"product_amt", product_amt);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_define1", user_define1);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_define2", user_define2);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_define3", user_define3);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_define4", user_define4);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_define5", user_define5);
			easyPayClient.easypay_deli_us(easypay_order_data_item,"user_define6", user_define6);

			// 결제정보 DATA -전문: PK_DATA_PAY

			int easypay_pay_data_item;
			easypay_pay_data_item = easyPayClient.easypay_item("pay_data");

			// 결제 공통 정보 DATA
			int easypay_common_item;
			easypay_common_item = easyPayClient.easypay_item("common");

			easyPayClient.easypay_deli_us(easypay_common_item, "tot_amt",tot_amt);
			easyPayClient.easypay_deli_us(easypay_common_item, "currency",currency);
			easyPayClient.easypay_deli_us(easypay_common_item, "client_ip",request.getRemoteAddr());
			easyPayClient.easypay_deli_us(easypay_common_item, "escrow_yn",escrow_yn);
			easyPayClient.easypay_deli_us(easypay_common_item,"complex_yn", complex_yn);
			easyPayClient.easypay_deli_us(easypay_common_item, "tax_flg",tax_flg);
			easyPayClient.easypay_deli_us(easypay_common_item,"com_tax_amt", com_tax_amt);
			easyPayClient.easypay_deli_us(easypay_common_item,"com_free_amt", com_free_amt);
			easyPayClient.easypay_deli_us(easypay_common_item,"com_vat_amt", com_vat_amt);
			easyPayClient.easypay_deli_us(easypay_common_item, "cli_ver",client_version);
			easyPayClient.easypay_deli_us(easypay_common_item, "req_cno",cno);
			
			easyPayClient.easypay_deli_rs(easypay_pay_data_item, easypay_common_item);

			// 계좌이체 결제정보 DATA SET -전문:PK_DATA_ACNT
			int easypay_acnt_item;
			easypay_acnt_item = easyPayClient.easypay_item("acnt");

			easyPayClient.easypay_deli_us(easypay_acnt_item, "acnt_txtype",acnt_txtype);
			easyPayClient.easypay_deli_us(easypay_acnt_item, "acnt_amt",acnt_amt);
			easyPayClient.easypay_deli_us(easypay_acnt_item, "kftc_signdata", kftc_signdata);
			easyPayClient.easypay_deli_us(easypay_acnt_item, "kftc_serialno", kftc_serialno);
			
			easyPayClient.easypay_deli_rs(easypay_pay_data_item, easypay_acnt_item);

		}

		/* -------------------------------------------------------------------------- */
		/* ::: 실행                                                                   */
		/* -------------------------------------------------------------------------- */
		String r_res_cd = "";
		String r_res_msg = "";

		// 인증응답코드(sp_res_cd)가 정상일때 승인요청 (정상:0000)
		if (sp_res_cd.equals("0000")) {
			if (sp_tr_cd.length() > 0) {
				easyPayClient.easypay_run(g_mall_id, sp_tr_cd, sp_order_no);

				r_res_cd = easyPayClient.res_cd;
				r_res_msg = easyPayClient.res_msg;
				
			} else {
				r_res_cd = "M114";
				r_res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
			}
			
		} else { /* ::: 승인 응답 결과 처리 시작,  NO 1,2 전문: TK_RES_DATA    */
			r_res_cd = sp_res_cd;
			r_res_msg = sp_res_msg;
		}

		/* -------------------------------------------------------------------------- */
		/* ::: 승인 응답 결과 처리 이어서.. 전문: TK_RES_DATA                                                            */
		/* -------------------------------------------------------------------------- */
		String r_cno        = easyPayClient.easypay_get_res("cno"); //PG거래번호
		String r_amount     = easyPayClient.easypay_get_res("amount"); //총 결제금액
		String r_order_no   = easyPayClient.easypay_get_res("order_no"); //주문번호
		String r_auth_no    = easyPayClient.easypay_get_res("auth_no"); //승인번호
		String r_tran_date  = easyPayClient.easypay_get_res("tran_date"); //승인일시
		String r_bank_cd    = easyPayClient.easypay_get_res("bank_cd"); //은행코드
		String r_bank_nm    = easyPayClient.easypay_get_res("bank_nm"); //은행명
		String r_escrow_yn  = easyPayClient.easypay_get_res("escrow_yn"); //에스크로 사용유무
		String r_pay_type   = easyPayClient.easypay_get_res("pay_type"); //결제수단

		logger.debug("r_res_cd========================"+r_res_cd);
	    logger.debug("r_res_msg========================"+r_res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_pay_type========================"+r_pay_type);
	    
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_bank_cd========================"+r_bank_cd);
	    logger.debug("r_bank_nm========================"+r_bank_nm);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    
	    commandMap.put("PAY_MST_TR_STATUS",		"A");
	    commandMap.put("PAY_MST_RESPCODE", r_res_cd);
	    commandMap.put("PAY_MST_RESPMSG", r_res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_MID",				g_mall_id);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_BANK_CD", r_bank_cd);
	    commandMap.put("PAY_MST_KICC_BANK_NM", r_bank_nm);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    
	    commandMap.put("client_ip", client_ip);	//즉시 취소시 필요한 client_ip 
	    
		/* -------------------------------------------------------------------------- */
		/* ::: 가맹점 DB 처리                                                         */
		/* -------------------------------------------------------------------------- */
		/* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
		/* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
		/* -------------------------------------------------------------------------- */
		/*if (r_res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals(sp_tr_cd)) {
			// DB처리 성공 시 "true", 실패 시 "false"
			String bDBProc = "true";
		}*/
	    
	    logger.info("#######[END] KICC 모바일 실시간 계좌이체 결제 승인 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccCardManagePayment
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 카드 승인 취소
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccCardManagePayment(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("#######[BEGIN] KICC 카드 결제 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
		
		/* -------------------------------------------------------------------------- */
	    /* ::: 처리구분 설정                                                          */
	    /* -------------------------------------------------------------------------- */
	    final String TRAN_CD_NOR_MGR        = "00201000";   // 변경

	    /* -------------------------------------------------------------------------- */
	    /* ::: 쇼핑몰 지불 정보 설정                                                  */
	    /* -------------------------------------------------------------------------- */
	    final String GW_URL                 = this.propertiesService.getString("payment.kicc.server.url");  // Gateway URL ( test )
	    //final String GW_URL               = "gw.easypay.co.kr";      // Gateway URL ( real )
	    final String GW_PORT                = "80";                    // 포트번호(변경불가) 
		
	    /* -------------------------------------------------------------------------- */ 
	    /* ::: 지불 데이터 셋업 (업체에 맞게 수정)                                    */ 
	    /* -------------------------------------------------------------------------- */ 
	    /* ※ 주의 ※                                                                 */ 
	    /* cert_file 변수 설정                                                        */
	    /* - pg_cert.pem 파일이 있는 디렉토리의  절대 경로 설정                       */ 
	    /* log_dir 변수 설정                                                          */
	    /* - log 디렉토리 설정                                                        */
	    /* log_level 변수 설정                                                        */
	    /* - log 레벨 설정                                                            */
	    /* -------------------------------------------------------------------------- */
	    final String CERT_FILE              = this.propertiesService.getString("payment.kicc.certificate.path");
	    final String LOG_DIR                = this.propertiesService.getString("payment.kicc.log.path");
	    final int LOG_LEVEL                 = 1;
	    
	    /* --------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 가맹점 주문정보                                              */
	    /* --------------------------------------------------------------------------- */
	    String order_no          = ORD_MST_CD;   // [필수]*주문번호
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결제요청 - 승인공통 정보                                               */
	    /* -------------------------------------------------------------------------- */
	    //String mall_id           = this.propertiesService.getString("payment.kicc.mall.id");
	    String mall_id           = StringUtil.getString(commandMap.get("PAY_MST_MID"          ));   // [필수]가맹점ID
	    String tr_cd             = TRAN_CD_NOR_MGR;   // [필수]*처리구분    
	    String client_ip         = request.getRemoteAddr();                                        // [선택]고객IP
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 변경관리 정보 설정(mgr.jsp)                                            */
	    /* -------------------------------------------------------------------------- */
	    String mgr_txtype        = StringUtil.getString(commandMap.get("mgr_txtype"          ));   // [필수]거래구분
	    String org_cno           = StringUtil.getString(commandMap.get("PAY_MST_TID"             ));   // [필수]원거래고유번호 
	    String mgr_amt           = StringUtil.getString(commandMap.get("mgr_amt"             ));   // [선택]취소요청금액
	    String req_ip            = client_ip;   // [필수]요청자 IP
	    String req_id            = StringUtil.getString(commandMap.get("req_id"              ));   // [선택]요청자 ID
	    String mgr_msg           = StringUtil.getString(commandMap.get("mgr_msg"             ));   // [선택]변경 사유
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 승인 응답 결과 선언                                                    */
	    /* -------------------------------------------------------------------------- */
	    // CA : 카드승인, CAO : 카드승인옵션 
	    // CC : 카드승인취소, CCO : 카드승인취소옵션, CPC : 카드매입취소 
	    String r_res_cd          = "";    // 응답코드          (CA, CAO, CC, CCO, CPC)
	    String r_res_msg         = "";    // 응답메시지        (CA, CAO, CC, CCO, CPC)
	    String r_cno             = "";    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    String r_amount          = "";    // 총 결제금액       (CA,                  )
	    String r_order_no        = "";    // 주문번호          (CA,                  )
	    String r_auth_no         = "";    // 승인번호          (CA,                  )
	    String r_tran_date       = "";    // 승인일시          (CA,      CC,      CPC)
	    String r_escrow_yn       = "";    // 에스크로 사용유무 (CA,                  )
	    String r_complex_yn      = "";    // 복합결제 유무     (CA,                  )
	    String r_stat_cd         = "";    // 상태코드          (CA,      CC,      CPC)
	    String r_stat_msg        = "";    // 상태메시지        (CA,      CC,      CPC)
	    String r_pay_type        = "";    // 결제수단          (CA,                  )
	    String r_mall_id         = "";    // 가맹점 Mall ID    (CA                   )
	    String r_card_no         = "";    // 카드번호          (CA,          CCO     )
	    String r_issuer_cd       = "";    // 발급사코드        (CA,          CCO     )
	    String r_issuer_nm       = "";    // 발급사명          (CA,          CCO     )
	    String r_acquirer_cd     = "";    // 매입사코드        (CA,          CCO     )
	    String r_acquirer_nm     = "";    // 매입사명          (CA,          CCO     )
	    String r_install_period  = "";    // 할부개월          (CA,          CCO     )
	    String r_noint           = "";    // 무이자여부        (CA                   )
	    String r_join_no         = "";    // 가맹점 번호       (CA,          CCO     )
	    String r_part_cancel_yn  = "";    // 부분취소 가능여부 (CA                   )
	    String r_card_gubun      = "";    // 신용카드 종류     (CA                   )
	    String r_card_biz_gubun  = "";    // 신용카드 구분     (CA                   )
	    String r_cpon_flag       = "";    // 쿠폰 사용유무     (    CAO,     CCO     )
	    String r_used_cpon       = "";    // 쿠폰 사용금액     (    CAO              )
	    String r_canc_acq_date   = "";    // 매입취소일시      (                  CPC)
	    String r_canc_date       = "";    // 취소일시          (CC,               CPC)

	/* -------------------------------------------------------------------------- */
	    /* ::: EasyPayClient 인스턴스 생성 [변경불가 !!].                             */
	    /* -------------------------------------------------------------------------- */
	    EasyPayClient easyPayClient = new EasyPayClient();
	   
	    easyPayClient.easypay_setenv_init( GW_URL, GW_PORT, CERT_FILE, LOG_DIR );
	    easyPayClient.easypay_reqdata_init();

        /* -------------------------------------------------------------------------- */
        /* ::: 변경관리 요청                                                          */
        /* -------------------------------------------------------------------------- */
        int easypay_mgr_data_item;
        easypay_mgr_data_item = easyPayClient.easypay_item( "mgr_data" );

        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_txtype" , mgr_txtype );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "org_cno"    , org_cno    );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_amt"    , mgr_amt    );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_ip"     , req_ip     );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "req_id"     , req_id     );
        easyPayClient.easypay_deli_us( easypay_mgr_data_item, "mgr_msg"    , mgr_msg    );

	    /* -------------------------------------------------------------------------- */
	    /* ::: 실행                                                                   */
	    /* -------------------------------------------------------------------------- */
	    if ( tr_cd.length() > 0 ) 
	    {
	        easyPayClient.easypay_run( mall_id, tr_cd, order_no );
	        r_res_cd  = easyPayClient.res_cd;
	        r_res_msg = easyPayClient.res_msg;
	    }
	    else 
	    {
	        r_res_cd  = "M114";
	        r_res_msg = "연동 오류|tr_cd값이 설정되지 않았습니다.";
	    }
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 결과 처리                                                              */
	    /* -------------------------------------------------------------------------- */
	    r_cno                  = getNullToSpace(easyPayClient.easypay_get_res("cno"           ));    // PG거래번호        (CA, CAO, CC, CCO, CPC)
	    r_amount               = getNullToSpace(easyPayClient.easypay_get_res("amount"        ));    // 총 결제금액       (CA,                  )
	    r_order_no             = getNullToSpace(easyPayClient.easypay_get_res("order_no"      ));    // 주문번호          (CA,                  )
	    r_auth_no              = getNullToSpace(easyPayClient.easypay_get_res("auth_no"       ));    // 승인번호          (CA,                  )
	    r_tran_date            = getNullToSpace(easyPayClient.easypay_get_res("tran_date"     ));    // 승인일시          (CA,      CC,      CPC)
	    r_escrow_yn            = getNullToSpace(easyPayClient.easypay_get_res("escrow_yn"     ));    // 에스크로 사용유무 (CA,                  )
	    r_complex_yn           = getNullToSpace(easyPayClient.easypay_get_res("complex_yn"    ));    // 복합결제 유무     (CA,                  )
	    r_stat_cd              = getNullToSpace(easyPayClient.easypay_get_res("stat_cd"       ));    // 상태코드          (CA,      CC,      CPC)
	    r_stat_msg             = getNullToSpace(easyPayClient.easypay_get_res("stat_msg"      ));    // 상태메시지        (CA,      CC,      CPC)
	    r_pay_type             = getNullToSpace(easyPayClient.easypay_get_res("pay_type"      ));    // 결제수단          (CA,                  )
	    r_mall_id              = getNullToSpace(easyPayClient.easypay_get_res("mall_id"       ));    // 가맹점 Mall ID    (CA                   )
	    r_card_no              = getNullToSpace(easyPayClient.easypay_get_res("card_no"       ));    // 카드번호          (CA,          CCO     )
	    r_issuer_cd            = getNullToSpace(easyPayClient.easypay_get_res("issuer_cd"     ));    // 발급사코드        (CA,          CCO     )
	    r_issuer_nm            = getNullToSpace(easyPayClient.easypay_get_res("issuer_nm"     ));    // 발급사명          (CA,          CCO     )
	    r_acquirer_cd          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_cd"   ));    // 매입사코드        (CA,          CCO     )
	    r_acquirer_nm          = getNullToSpace(easyPayClient.easypay_get_res("acquirer_nm"   ));    // 매입사명          (CA,          CCO     )
	    r_install_period       = getNullToSpace(easyPayClient.easypay_get_res("install_period"));    // 할부개월          (CA,          CCO     )
	    r_noint                = getNullToSpace(easyPayClient.easypay_get_res("noint"         ));    // 무이자여부        (CA                   )
	    r_join_no              = getNullToSpace(easyPayClient.easypay_get_res("join_no"       ));    // 가맹점 번호       (CA,          CCO     )
	    r_part_cancel_yn       = getNullToSpace(easyPayClient.easypay_get_res("part_cancel_yn"));    // 부분취소 가능여부 (CA                   )
	    r_card_gubun           = getNullToSpace(easyPayClient.easypay_get_res("card_gubun"    ));    // 신용카드 종류     (CA                   )
	    r_card_biz_gubun       = getNullToSpace(easyPayClient.easypay_get_res("card_biz_gubun"));    // 신용카드 구분     (CA                   )
	    r_cpon_flag            = getNullToSpace(easyPayClient.easypay_get_res("cpon_flag"     ));    // 쿠폰 사용유무     (    CAO,     CCO     )
	    r_used_cpon            = getNullToSpace(easyPayClient.easypay_get_res("used_cpon"     ));    // 쿠폰 사용금액     (    CAO              )
	    r_canc_acq_date        = getNullToSpace(easyPayClient.easypay_get_res("canc_acq_date" ));    // 매입취소일시      (                  CPC)
	    r_canc_date            = getNullToSpace(easyPayClient.easypay_get_res("canc_date"     ));    // 취소일시          (CC,               CPC)
	   
	    logger.debug("r_res_cd========================"+r_res_cd);
	    logger.debug("r_res_msg========================"+r_res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_complex_yn========================"+r_complex_yn);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    
	    logger.debug("r_stat_cd========================"+r_stat_cd);
	    logger.debug("r_stat_msg========================"+r_stat_msg);
	    logger.debug("r_pay_type========================"+r_pay_type);
	    logger.debug("r_mall_id========================"+r_mall_id);
	    logger.debug("r_join_no========================"+r_join_no);
	    logger.debug("r_part_cancel_yn========================"+r_part_cancel_yn);
	    logger.debug("r_card_gubun========================"+r_card_gubun);
	    logger.debug("r_card_biz_gubun========================"+r_card_biz_gubun);
	    logger.debug("r_cpon_flag========================"+r_cpon_flag);
	    logger.debug("r_used_cpon========================"+r_used_cpon);
	    logger.debug("r_canc_acq_date========================"+r_canc_acq_date);
	    
	    
	    commandMap.put("PAY_MST_TR_STATUS",		"C");
	    commandMap.put("PAY_MST_RESPCODE", r_res_cd);
	    commandMap.put("PAY_MST_RESPMSG", r_res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_MID",				mall_id);
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_COMPLEX_YN", r_complex_yn);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 가맹점 DB 처리                                                         */
	    /* -------------------------------------------------------------------------- */
	    /* r_amount가 주문DB의 금액과 다를 시 반드시 취소 요청을 하시기 바랍니다.     */
	    /* DB 처리 실패 시 취소 처리를 해주시기 바랍니다.                             */
	    /* -------------------------------------------------------------------------- */
	    /*if ( r_res_cd.equals("0000") && TRAN_CD_NOR_PAYMENT.equals( tr_cd ) )
	    {
	        String bDBProc = "true";     // DB처리 성공 시 "true", 실패 시 "false"
	        if ( bDBProc.equals("false") )
	        {
	        	
	        }
	    }*/
	    
	    logger.info("#######[END] KICC 카드 결제 취소 [ORD_MST_CD : "+ ORD_MST_CD +"] ########");
	    
	    return commandMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : kiccNotice
	* 2. ClassName  : Payment.java
	* 3. Comment    : kicc 공통통보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccNotice(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		logger.info("#######[BEGIN] KICC 공통통보 ########");
	    
	    /* -------------------------------------------------------------------------- */
	    /* ::: 노티수신          
	     * 변경:20, 입금:30, 에스크로 변경:40                                                     */
	    /* -------------------------------------------------------------------------- */
	    String r_res_cd         = StringUtil.getString(commandMap.get( "res_cd"         ));  // 응답코드
	    String r_res_msg        = StringUtil.getString(commandMap.get( "res_msg"        ));  // 응답 메시지
	    String r_cno            = StringUtil.getString(commandMap.get( "cno"            ));  // PG거래번호
	    String r_memb_id        = StringUtil.getString(commandMap.get( "memb_id"        ));  // 가맹점 ID	
	    String r_amount         = StringUtil.getString(commandMap.get( "amount"         ));  // 총 결제금액
	    String r_order_no       = StringUtil.getString(commandMap.get( "order_no"       ));  // 주문번호
	    String r_noti_type      = StringUtil.getString(commandMap.get( "noti_type"      ));  // 노티구분
	    String r_auth_no        = StringUtil.getString(commandMap.get( "auth_no"        ));  // 승인번호
	    String r_tran_date      = StringUtil.getString(commandMap.get( "tran_date"      ));  // 승인일시
	    String r_card_no        = StringUtil.getString(commandMap.get( "card_no"        ));  // 카드번호
	    String r_issuer_cd      = StringUtil.getString(commandMap.get( "issuer_cd"      ));  // 발급사코드
	    String r_issuer_nm      = StringUtil.getString(commandMap.get( "issuer_nm"      ));  // 발급사명
	    String r_acquirer_cd    = StringUtil.getString(commandMap.get( "acquirer_cd"    ));  // 매입사코드
	    String r_acquirer_nm    = StringUtil.getString(commandMap.get( "acquirer_nm"    ));  // 매입사명
	    String r_install_period = StringUtil.getString(commandMap.get( "install_period" ));  // 할부개월
	    String r_noint          = StringUtil.getString(commandMap.get( "noint"          ));  // 무이자여부
	    String r_bank_cd        = StringUtil.getString(commandMap.get( "bank_cd"        ));  // 은행코드
	    String r_bank_nm        = StringUtil.getString(commandMap.get( "bank_nm"        ));  // 은행명
	    String r_account_no     = StringUtil.getString(commandMap.get( "account_no"     ));  // 계좌번호
	    String r_deposit_nm     = StringUtil.getString(commandMap.get( "deposit_nm"     ));  // 입금자명
	    String r_expire_date    = StringUtil.getString(commandMap.get( "expire_date"    ));  // 계좌사용만료일
	    String r_cash_res_cd    = StringUtil.getString(commandMap.get( "cash_res_cd"    ));  // 현금영수증 결과코드
	    String r_cash_res_msg   = StringUtil.getString(commandMap.get( "cash_res_msg"   ));  // 현금영수증 결과메시지
	    String r_cash_auth_no   = StringUtil.getString(commandMap.get( "cash_auth_no"   ));  // 현금영수증 승인번호
	    String r_cash_tran_date = StringUtil.getString(commandMap.get( "cash_tran_date" ));  // 현금영수증 승인일시
	    
	    String r_cp_cd          = StringUtil.getString(commandMap.get( "cp_cd"          ));  // 포인트사
	    String r_used_pnt       = StringUtil.getString(commandMap.get( "used_pnt"       ));  // 사용포인트
	    String r_remain_pnt     = StringUtil.getString(commandMap.get( "remain_pnt"     ));  // 잔여한도
	    String r_pay_pnt        = StringUtil.getString(commandMap.get( "pay_pnt"        ));  // 할인/발생포인트 
	    String r_accrue_pnt     = StringUtil.getString(commandMap.get( "accrue_pnt"     ));  // 누적포인트
	    String r_escrow_yn      = StringUtil.getString(commandMap.get( "escrow_yn"      ));  // 에스크로 사용유무
	    String r_canc_date      = StringUtil.getString(commandMap.get( "canc_date"      ));  // 취소일시
	    String r_canc_acq_date  = StringUtil.getString(commandMap.get( "canc_acq_date"  ));  // 매입취소일시
	    String r_refund_date    = StringUtil.getString(commandMap.get( "refund_date"    ));  // 환불예정일시
	    String r_pay_type       = StringUtil.getString(commandMap.get( "pay_type"       ));  // 결제수단
	    String r_auth_cno       = StringUtil.getString(commandMap.get( "auth_cno"       ));  // 인증거래번호
	    String r_tlf_sno        = StringUtil.getString(commandMap.get( "tlf_sno"        ));  // 채번거래번호
	    String r_account_type   = StringUtil.getString(commandMap.get( "account_type"   ));  // 채번계좌 타입 US AN 1 (V-일반형, F-고정형)
	    String r_reserve1       = StringUtil.getString(commandMap.get( "reserve1"       ));  // 가맹점 필드1
	    String r_reserve2       = StringUtil.getString(commandMap.get( "reserve2"       ));  // 가맹점 필드2
	    String r_reserve3       = StringUtil.getString(commandMap.get( "reserve3"       ));  // 가맹점 필드3
	    String r_reserve4       = StringUtil.getString(commandMap.get( "reserve4"       ));  // 가맹점 필드4
	    String r_reserve5       = StringUtil.getString(commandMap.get( "reserve5"       ));  // 가맹점 필드5
	    String r_reserve6       = StringUtil.getString(commandMap.get( "reserve6"       ));  // 가맹점 필드6
	    
	    String r_stat_cd        = getNullToSpace(request.getParameter( "stat_cd"        ));  // 추가함 에스크로 상태코드
	    String r_stat_msg        = getNullToSpace(request.getParameter( "stat_msg"        ));  // 추가함 에스크로 상태메시지
	    
	    logger.debug("r_res_cd========================"+r_res_cd);
	    logger.debug("r_res_msg========================"+r_res_msg);
	    logger.debug("r_cno========================"+r_cno);
	    logger.debug("r_amount========================"+r_amount);
	    logger.debug("r_order_no========================"+r_order_no);
	    logger.debug("r_noti_type========================"+r_noti_type);
	    logger.debug("r_auth_no========================"+r_auth_no);
	    logger.debug("r_tran_date========================"+r_tran_date);
	    logger.debug("r_card_no========================"+r_card_no);
	    logger.debug("r_issuer_cd========================"+r_issuer_cd);
	    logger.debug("r_issuer_nm========================"+r_issuer_nm);
	    logger.debug("r_acquirer_cd========================"+r_acquirer_cd);
	    logger.debug("r_acquirer_nm========================"+r_acquirer_nm);
	    logger.debug("r_install_period========================"+r_install_period);
	    logger.debug("r_noint========================"+r_noint);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    logger.debug("r_pay_type========================"+r_pay_type);
	    logger.debug("r_canc_acq_date========================"+r_canc_acq_date);
	    
	    logger.debug("r_bank_cd========================"+r_bank_cd);
	    logger.debug("r_bank_nm========================"+r_bank_nm);
	    logger.debug("r_account_no========================"+r_account_no);
	    logger.debug("r_deposit_nm========================"+r_deposit_nm);
	    logger.debug("r_expire_date========================"+r_expire_date);
	    logger.debug("r_cash_res_cd========================"+r_cash_res_cd);
	    logger.debug("r_cash_res_msg========================"+r_cash_res_msg);
	    logger.debug("r_cash_auth_no========================"+r_cash_auth_no);
	    logger.debug("r_cash_tran_date========================"+r_cash_tran_date);
	    
	    logger.debug("r_cp_cd========================"+r_cp_cd);// 메뉴얼에도 없는 파라미터..
	    logger.debug("r_used_pnt========================"+r_used_pnt);
	    logger.debug("r_remain_pnt========================"+r_remain_pnt);
	    logger.debug("r_pay_pnt========================"+r_pay_pnt);
	    logger.debug("r_accrue_pnt========================"+r_accrue_pnt);
	    logger.debug("r_escrow_yn========================"+r_escrow_yn);
	    logger.debug("r_canc_date========================"+r_canc_date);
	    logger.debug("r_refund_date========================"+r_refund_date);
	    
	    logger.debug("r_auth_cno========================"+r_auth_cno);
	    logger.debug("r_tlf_sno========================"+r_tlf_sno);
	    logger.debug("r_account_type========================"+r_account_type);
	    
	    logger.debug("r_stat_cd========================"+r_stat_cd);
	    logger.debug("r_stat_msg========================"+r_stat_msg);
	    
	    /*commandMap.put("r_memb_id", r_memb_id);
	    
	    commandMap.put("PAY_MST_RESPCODE", r_res_cd);
	    commandMap.put("PAY_MST_RESPMSG", r_res_msg);
	    commandMap.put("PAY_MST_TID", r_cno);
	    commandMap.put("PAY_MST_PAYTYPE",			"KICC");
	    commandMap.put("PAY_MST_AMOUNT", r_amount);
	    commandMap.put("PAY_MST_OID", r_order_no);
	    commandMap.put("PAY_MST_KICC_AUTH_NO", r_auth_no);
	    commandMap.put("PAY_MST_KICC_TRAN_DATE", r_tran_date);
	    commandMap.put("PAY_MST_KICC_CARD_NO", r_card_no);
	    commandMap.put("PAY_MST_KICC_ISSUER_CD", r_issuer_cd);
	    commandMap.put("PAY_MST_KICC_ISSUER_NM", r_issuer_nm);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_CD", r_acquirer_cd);
	    commandMap.put("PAY_MST_KICC_ACQUIRER_NM", r_acquirer_nm);
	    commandMap.put("PAY_MST_KICC_INSTALL_PERIOD", r_install_period);
	    commandMap.put("PAY_MST_KICC_NOINT", r_noint);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    
	    commandMap.put("PAY_MST_KICC_BANK_CD", r_bank_cd);
	    commandMap.put("PAY_MST_KICC_BANK_NM", r_bank_nm);
	    commandMap.put("PAY_MST_KICC_ACCOUNT_NO", r_account_no);
	    commandMap.put("PAY_MST_KICC_DEPOSIT_NM", r_deposit_nm);
	    commandMap.put("PAY_MST_KICC_EXPIRE_DATE", r_expire_date);
	    commandMap.put("PAY_MST_KICC_CASH_RES_CD", r_cash_res_cd);
	    commandMap.put("PAY_MST_KICC_CASH_RES_MSG", r_cash_res_msg);
	    commandMap.put("PAY_MST_KICC_CASH_AUTH_NO", r_cash_auth_no);
	    commandMap.put("PAY_MST_KICC_CASH_TRAN_DATE", r_cash_tran_date);
	    //commandMap.put("PAY_MST_KICC_USED_PNT", r_used_pnt); // 'P'가 리턴돼서.. 주석처리
	    commandMap.put("PAY_MST_KICC_REMAIN_PNT", r_remain_pnt);
	    commandMap.put("PAY_MST_KICC_PAY_PNT", r_pay_pnt);
	    commandMap.put("PAY_MST_KICC_ACCURE_PNT", r_accrue_pnt);
	    commandMap.put("PAY_MST_KICC_ESCROW_YN", r_escrow_yn);
	    commandMap.put("PAY_MST_KICC_CANC_DATE", r_canc_date);
	    commandMap.put("PAY_MST_KICC_REFUND_DATE", r_refund_date);*/

	    //PAY_MST INSERT
		//this.paymentService.insertPayMaster(commandMap);
	    
	    Map<String,Object> resultMap = new HashMap<String,Object>();
		
	    if ( r_res_cd.equals("0000") && !"".equals(r_order_no))
	    {
		    /* ---------------------------------------------------------------------- */
		    /* ::: 가맹점 DB 처리                                                     */
		    /* ---------------------------------------------------------------------- */
		    /* DB처리 성공 시 : res_cd=0000, 실패 시 : res_cd=5001                    */
		    /* ---------------------------------------------------------------------- */
			//if DB처리 성공 시
			//{
			//	result_msg = "res_cd=" + RESULT_SUCCESS + DELI_US + "res_msg=SUCCESS";
			//}	
			//else
			//{
	    	//	result_msg = "res_cd=" + RESULT_FAIL + DELI_US + "res_msg=FAIL";
			//}
	    	
	    	//주문번호 담기
	    	commandMap.put("ORD_MST_CD", r_order_no);
	    	
	    	if("20".equals(r_noti_type)){//변경
	    		
	    	}else if("30".equals(r_noti_type)){//입금완료
	    		resultMap = this.paymentService.updatePayDepositState(request, commandMap);
	    	}else if("40".equals(r_noti_type)){//에스크로변경
	    		if("ES04".equals(r_stat_cd)){//입금완료
	    			resultMap = this.paymentService.updatePayDepositState(request, commandMap);
	    		}else if("ES12".equals(r_stat_cd) || "ES13".equals(r_stat_cd)){//구매확인/구매거절만 처리
	    			// 에스크로 구매확인 여부 UPDATE
		    		commandMap.put("r_stat_cd", r_stat_cd);
		    		resultMap = this.paymentService.updateEscrowState(request, commandMap);
	    		}
	    	}
	    	
	    }
	  
	    /* -------------------------------------------------------------------------- */
	    /* ::: 노티 처리결과 처리                                                     */
	    /* -------------------------------------------------------------------------- */
	    
	    logger.info("#######[END] KICC 공통통보 ########");
	    
	    return resultMap;
	}
	
	
	
	/** kicc 파라미터 체크 메소드 */
    public String getNullToSpace(String param) { return (param == null) ? "" : param.trim(); }
}
