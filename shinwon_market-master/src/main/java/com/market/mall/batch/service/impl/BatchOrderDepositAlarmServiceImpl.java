package com.market.mall.batch.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.batch.service.BatchMail;
import com.market.mall.batch.service.BatchOrderDepositAlarmService;
import com.market.mall.batch.service.BatchOrderMailService;
import com.market.mall.batch.service.BatchSms;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.batch.service.impl
 * @FileName : BatchOrderDepositAlarmServiceImpl.java
 * @Date : 2016. 3. 14.
 * @프로그램 설명 : 입금대기 주문 입금요청 처리하는 Class
 * @author DEV_KANGHYUNKYU
 */
@Service("batchOrderDepositAlarmService")
public class BatchOrderDepositAlarmServiceImpl implements BatchOrderDepositAlarmService{
	
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="batchOrderMailService") protected BatchOrderMailService batchOrderMailService;
	
	//메일 발송시 필요한 서비스 시작
	@Resource
	protected BatchMail batchMail;	
	
	@Resource
	protected BatchSms batchSms;
	
	@Resource(name = "velocityEngine") 
	protected VelocityEngine velocityEngine;
	//메일 발송시 필요한 서비스 끝
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	* <pre>
	* 1. MethodName : updateOrderDepositAlarm
	* 2. ClassName  : BatchOrderDepositAlarmServiceImpl.java
	* 3. Comment    : 입금대기 주문 입금요청
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> updateOrderDepositAlarm(Map<String, Object> commandMap) throws Exception{
		commandMap.put("result", "F");
    	
		List<Map<String, Object>> list =  defaultDAO.selectList("BatchOrderDepositAlarm.selectOrderDepositAlarmList",commandMap);    	

    	for( Map<String,Object>orderMap : list )
    	{
    		commandMap.put("ORD_MST_CD", StringUtil.getString(orderMap.get("ORD_MST_CD")));
    		try{
				// 메일 발송시 필요한 정보 가져오기 시작...
				
				// 주문상품 목록
				commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
		        List<Map<String, Object>> orderProductList = this.batchOrderMailService.selectOrderProductList(commandMap);//공통 사용 가능
		        
		        //  상품 옵션 가져오기
		 		for(Map<String, Object> ordPrd : orderProductList){
		 			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
		 			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
		 				List<Map<String,Object>> optionList = this.batchOrderMailService.selectCartOptionDetailList(ordPrd);//공통 사용 가능
		 				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
		 			}
		 			
		 			//서브 옵션 리스트
		 			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
		 			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
		 			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
						subPrdList = this.batchOrderMailService.selectOrderSubPrdList(ordPrd);//공통 사용 가능
						ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
		 			}
		 		}
		 		
		        // 사은품 정보
		        List<Map<String, Object>> requestedGiftList = this.batchOrderMailService.selectRequestedGiftList(commandMap);//공통 사용 가능
		        
		        // 배송정보
		        Map<String, Object> orderDeliveryInfo = this.batchOrderMailService.selectOrderDeliveryInfo(commandMap);//공통 사용 가능
		        
		        // 할인/결제정보
		        Map<String, Object> orderPayInfo = this.batchOrderMailService.selectOrderPayInfo(commandMap);//공통 사용 가능
		        
		  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
		  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
		        String DEFAULT_CASHBAG_CARD_NO = "";
        		Map<String,Object> getItNowShopInfo = null;
        		Map<String, Object> userInfo = null;
        		String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_ID"));
				if(!"_GUEST_".equals(ORD_MST_ORD_ID)){//회원인 경우
					commandMap.put("trStatus", "U");//사용 이력
					Map<String, Object> cashbagSavedInfo = this.batchOrderMailService.selectOrderCashbagInfo(commandMap);//공통 사용 가능
					
					if(cashbagSavedInfo != null){
						DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
					}else{
						// 캐쉬백 카드번호
						commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
						Map<String, Object> memberCashbagInfo = this.batchOrderMailService.selectMemberCashbagInfo(commandMap);//공통 사용 가능
						
						if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
							DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
						}
					}
					
					// 겟잇나우 주문인 경우 지점 정보 가져오기
			 		int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_GBN"));
			 		if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
			 			getItNowShopInfo = this.batchOrderMailService.selectOrderGetItNowShopInfo(commandMap);//공통 사용 가능
			 		}
			 		
			 		// 회원정보
			 		Map<String,Object> userMap = new HashMap<String,Object>();
			 		userMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
        			userInfo = this.batchOrderMailService.selectUserInfo(userMap);
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
						velocityEngine, "/MAIL-ORDER-ALARM-DEPOSIT.vm", "utf-8", mailContentsMap);
				body += VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "/MAIL-FOOTER.vm", "utf-8", mailContentsMap);
				
				//메일 발송용 맵
				Map<String, Object> mailMap = new HashMap<String, Object>();
				
				mailMap.put("MAIL_CODE", "11");	// 이메일 코드
	    		mailMap.put("MEMBER_EMAIL", StringUtil.getString(orderPayInfo.get("ORD_MST_MAIL")) );		// 수신자 이메일
	    		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"))));			// 수신자 이름
	    		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM")))  + ", 주문하신 상품의 입금확인 부탁드립니다.");	// 메일 제목
	    		mailMap.put("EMAIL_CONTENTS", body);	// 메일 내용
				
				this.batchMail.mailSend(mailMap);
				
				//TODO SMS 발송
            	Map<String, Object> smsMap = new HashMap<String, Object>();
				
				smsMap.put("TR_PHONE", StringUtil.getString(orderPayInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderPayInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderPayInfo.get("ORD_MST_HP3"), ""));  
				smsMap.put("TR_NAME", StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"), ""));  		
				
				String linkUrl = this.propertiesService.getString("mobile.ssl.domain") + "/mobile/mypage/myShoppingList.do";
				if("_GUEST_".equals(ORD_MST_ORD_ID)){
					//비회원 주문인 경우 링크 없음
					linkUrl = "";
				}
				
				int ORD_MST_PAY_PRC = StringUtil.getInt(orderPayInfo.get("ORD_MST_PAY_PRC"));
				String ordMstPayPrcStr = String.format("%,d", ORD_MST_PAY_PRC);
				
				smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name")+" ","")+ StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"), "") +"님, 주문하신 상품에 대한 입금을 기다리고 있습니다. 금일 기준, 1일 이후 주문이 취소되오니, 총 주문금액 "+ ordMstPayPrcStr +"원을 입급해주시기 바랍니다."); 		
				
				smsMap = this.batchSms.sendLongMessage(smsMap);
				
			}catch(Exception e){
				logger.error("SMS, EMAIL 발송 중 예외 발생");
			}
    	}    	
    	
    	commandMap.put("result", "S");
    	return commandMap;
	}

}
