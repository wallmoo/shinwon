package com.market.mall.batch.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.batch.service.BatchMemberGradeYearService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * 
    * @PackageName: com.market.mall.batch.service.impl
    * @FileName : BatchMemberGradeYearServiceImpl.java
    * @Date : 2016. 1. 20.
    * @프로그램 설명 : 최근1년 구매금액에 따른 회원등급 하향조정 처리하는  Class
    * @author : DEV_LEEKWANGWOON
 */
@Service("batchMemberGradeYearService")
public class BatchMemberGradeYearServiceImpl implements BatchMemberGradeYearService{

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource protected Mail mail;	
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	/**
	 * <pre>
	 * 1. MethodName : updateMemberGradeYear
	 * 2. ClassName  : BatchMemberGradeYearServiceImpl.java
	 * 3. Comment    : 개인회원 등급 변경처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 1. 20.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public Map<String, Object> updateMemberGradeYear( final Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("result", "F");
		commandMap.put("IGNO_ORD_PRD_ORD_STATE", Code.OST_SWAP_IGNORE_ARR);	// 교환관련 주문상태
		commandMap.put("ORD_PRD_ORD_STATE", 	 Code.OST_FIX);	// 구매확정
		commandMap.put("MEM_MST_MEM_GBN", 	 	 Code.COMMON_PRI_MEMBER_GRADE);	// 개인회원
    	
		List<Map<String, Object>> list = defaultDAO.selectList("BatchMemberGradeYear.selectMemberGradeYear",commandMap);
    	
    	/**
		 * 파일문서:\#MarketPlant\03.설계\01.기획 > MarketPlant 쇼핑몰구축PRJ_자동발행 쿠폰 속성 정의_20160308.xlsx
		 * 
		 * PLATINUM 
		 * 			5% 할인 * 5장
		 * 			7% 할인 * 1장
		 * 			무료배송쿠폰 1장
		 * VIP   
		 * 		    5% 할인 * 3장
		 *          7% 할인 * 1장
		 * 			무료배송쿠폰 1장
		 * GOLD  
		 * 		    5% 할인 * 3장
		 *          7% 할인 * 1장
		 * 			무료배송쿠폰 1장
		 * 
		 * SILVER 
		 * 		    5% 할인 * 1장
		 * 
		 * RED 
		 * 		    5% 할인 * 1장
		 * 
		 */	        	
    	
    	final int GOLD_FIVE_COUPON_COUNT = 3;
    	final int GOLD_SEVEN_COUPON_COUNT = 1;
    	final int GOLD_FREE_DELIVERY = 1;
    	
    	final int VIP_FIVE_COUPON_COUNT = 3;
    	final int VIP_SEVEN_COUPON_COUNT = 1;
    	final int VIP_FREE_DELIVERY = 1;
    	
    	final int PLATINUM_FIVE_COUPON_COUNT = 5;
    	final int PLATINUM_SEVEN_COUPON_COUNT = 1;
    	final int PLATINUM_FREE_DELIVERY = 1;
    	
    	Map<String, Object> mailMap = new HashMap<String, Object>();
    	
    	/* 주문 이력 없는 회원 RED 등급 조정 */
		List<Map<String, Object>> redList = defaultDAO.selectList("BatchMemberGradeYear.selectMemberOrderCntYear",commandMap);
		
		for( Map<String,Object>gradeRedMap : redList )
    	{
			commandMap.put("UPDATE_CMN_COM_IDX", Code.PRI_MEMBER_BRONZE_GRADE);	// 변경할 등급
			commandMap.put("MEM_MST_MEM_ID",  StringUtil.getString(gradeRedMap.get("MEM_MST_MEM_ID")));		// 해당 아이디
			
			// 회원등급 변경 
    		defaultDAO.update("BatchMemberGradeYear.updateMemberGradeYear", commandMap);
    		
    		// 쿠폰 5%
			commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_RED_5);	
			defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);
			mailMap.put("MAIL_CODE", "23");	// 이메일 코드
			
			// 메일전송
			logger.info("email Yn >> " + StringUtil.getString(gradeRedMap.get("EMAILYN")));
			
    		if("Y".equals(StringUtil.getString(gradeRedMap.get("EMAILYN")))){
    			mailMap.put("MEMBER_EMAIL", StringUtil.getString(gradeRedMap.get("MEM_MST_MAIL"), ""));		// 수신자 이메일
        		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(gradeRedMap.get("MEM_MST_MEM_NM"))));		// 수신자 이름
        		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name")+" ","") + FormatUtil.markingName(StringUtil.getString(gradeRedMap.get("MEM_MST_MEM_NM")))  + "님, " + StringUtil.getString(gradeRedMap.get("NOW_MONTH") ,"")  + "월 회원등급은 " + StringUtil.getString(gradeRedMap.get("UPDATE_CMN_COM_NM") ,"")  + " 입니다. 고객님만의 혜택을 지금 바로 확인하세요.");	// 메일 제목
        		
            	StringBuffer resultContent = new StringBuffer();
            	
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeRedMap.get("NOW_MONTH") ,"")) );
        		StringUtil.textSumDelimiter(resultContent.append(FormatUtil.markingName(StringUtil.getString(gradeRedMap.get("MEM_MST_MEM_NM")))));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeRedMap.get("NOW_MONTH") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeRedMap.get("UPDATE_CMN_COM_NM") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(FormatUtil.markingName(StringUtil.getString(gradeRedMap.get("MEM_MST_MEM_NM")))));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeRedMap.get("MEM_AGR_REG_DT") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeRedMap.get("REJECT_URL") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeRedMap.get("REJECT_URL") ,"")));
	
	        	mailMap.put("EMAIL_CONTENTS1", resultContent.toString());	// 메일 내용	        			
        			
        		// 메일전송 
        		Map<String, Object> resultMailMap = this.mail.mailSendForm(mailMap);
        		
        		// mail 결과 코드
        		String resultMailCode = StringUtil.getString(resultMailMap.get("resultCode"));
        		
        		logger.info("#################MAIL 관련 LOG 시작#######################");
    			logger.info("resultCode : " + resultMailCode);
    			logger.info("resultMsg : " + StringUtil.getString(resultMailMap.get("resultMsg")));
    			logger.info("#################MAIL 관련 LOG 끝#######################");
        		
    			// mail 발송 실패 시
    			if(Integer.valueOf(resultMailCode) != 0)
    			{
    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    			}
	
    		}
    	}
		
    	 /*주문 이력 있는 회원 등급 재 산정*/ 
    	for( Map<String,Object>gradeMap : list )
    	{
    		
    		commandMap.put("UPDATE_CMN_COM_IDX", StringUtil.getString(gradeMap.get("UPDATE_CMN_COM_IDX")));	// 변경할 등급
    		commandMap.put("ORD_MST_ORD_ID",  StringUtil.getString(gradeMap.get("ORD_MST_ORD_ID")));		// 해당 아이디

    		// 회원등급 변경 
    		defaultDAO.update("BatchMemberGradeYear.updateMemberGradeYear", commandMap);
    		
    		commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(gradeMap.get("ORD_MST_ORD_ID"),"")); // 회원 아이디
    		
    		// RED
			if( Code.PRI_MEMBER_BRONZE_GRADE == StringUtil.getInt(gradeMap.get("UPDATE_CMN_COM_IDX")) )
			{	
				// 쿠폰 5%
				commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_RED_5);	
				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);
				mailMap.put("MAIL_CODE", "23");	// 이메일 코드
	        				
			}
			
			// SILVER
			else if(Code.PRI_MEMBER_SILVER_GRADE == StringUtil.getInt(gradeMap.get("UPDATE_CMN_COM_IDX"))){

				// 쿠폰 5%
				commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_SILVER_5);	
				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);				
				mailMap.put("MAIL_CODE", "22");	// 이메일 코드
			}
			
			// GOLD
			else if(Code.PRI_MEMBER_GOLD_GRADE == StringUtil.getInt(gradeMap.get("UPDATE_CMN_COM_IDX"))){
				
				// 쿠폰 5%
				for(int i=0; i<GOLD_FIVE_COUPON_COUNT; i++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_GOLD_5);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);    					
				}
				
				// 쿠폰 7%
				for(int a=0; a<GOLD_SEVEN_COUPON_COUNT; a++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_GOLD_7);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}
				
				// 무료배송 쿠폰
				for(int b=0; b<GOLD_FREE_DELIVERY; b++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_FREE_DELIVERY_GOLD);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}				
				
				mailMap.put("MAIL_CODE", "21");	// 이메일 코드
			}
			
			
			
			// VIP 
			else if(  Code.PRI_MEMBER_VIP_GRADE == StringUtil.getInt(gradeMap.get("UPDATE_CMN_COM_IDX")) )
			{ 
				// 쿠폰 5%
				for(int i=0; i<VIP_FIVE_COUPON_COUNT; i++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_VIP_5);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);    					
				}
				
				// 쿠폰 7%
				for(int a=0; a<VIP_SEVEN_COUPON_COUNT; a++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_VIP_7);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}
				
				// 무료배송 쿠폰
				for(int b=0; b<VIP_FREE_DELIVERY; b++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_FREE_DELIVERY_GOLD);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}
				
				mailMap.put("MAIL_CODE", "20");	// 이메일 코드
				
				
				
			}
			// PLATINUM
			else if( Code.PRI_MEMBER_PLATINUM_GRADE == StringUtil.getInt(gradeMap.get("UPDATE_CMN_COM_IDX")) )
			{ 
				
				// 쿠폰 5%
				for(int i=0; i<PLATINUM_FIVE_COUPON_COUNT; i++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_PLATINUM_5);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}
				
				// 쿠폰 7%
				for(int a=0; a<PLATINUM_SEVEN_COUPON_COUNT; a++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_MEMBER_GRADE_PLATINUM_7);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}
				
				// 무료배송 쿠폰
				for(int b=0; b<PLATINUM_FREE_DELIVERY; b++){
					commandMap.put("CPN_MST_IDX", Code.AUTO_COUPON_FREE_DELIVERY_PLATINUM);
    				defaultDAO.insert("BatchMemberGradeMonth.insertDwnCoupon", commandMap);	
				}
				
				mailMap.put("MAIL_CODE", "19");	// 이메일 코드	        				
				
			}
			
			// 메일전송
			logger.info("email Yn >> " + StringUtil.getString(gradeMap.get("EMAILYN")));
			
    		if("Y".equals(StringUtil.getString(gradeMap.get("EMAILYN")))){
    			mailMap.put("MEMBER_EMAIL", StringUtil.getString(gradeMap.get("MEM_MST_MAIL"), ""));		// 수신자 이메일
        		mailMap.put("MEMBER_NAME",  FormatUtil.markingName(StringUtil.getString(gradeMap.get("MEM_MST_MEM_NM"))));		// 수신자 이름
        		mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name")+" ","") + FormatUtil.markingName(StringUtil.getString(gradeMap.get("MEM_MST_MEM_NM")))  + "님, " + StringUtil.getString(gradeMap.get("NOW_MONTH") ,"")  + "월 회원등급은 " + StringUtil.getString(gradeMap.get("UPDATE_CMN_COM_NM") ,"")  + " 입니다. 고객님만의 혜택을 지금 바로 확인하세요.");	// 메일 제목
        		
            	StringBuffer resultContent = new StringBuffer();
            	
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeMap.get("NOW_MONTH") ,"")) );
        		StringUtil.textSumDelimiter(resultContent.append(FormatUtil.markingName(StringUtil.getString(gradeMap.get("MEM_MST_MEM_NM")))));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeMap.get("NOW_MONTH") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeMap.get("UPDATE_CMN_COM_NM") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(FormatUtil.markingName(StringUtil.getString(gradeMap.get("MEM_MST_MEM_NM")))));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeMap.get("MEM_AGR_REG_DT") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeMap.get("REJECT_URL") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(gradeMap.get("REJECT_URL") ,"")));
	
	        	mailMap.put("EMAIL_CONTENTS1", resultContent.toString());	// 메일 내용	        			
        			
        		// 메일전송 
        		Map<String, Object> resultMailMap = this.mail.mailSendForm(mailMap);
        		
        		// mail 결과 코드
        		String resultMailCode = StringUtil.getString(resultMailMap.get("resultCode"));
        		
        		logger.info("#################MAIL 관련 LOG 시작#######################");
    			logger.info("resultCode : " + resultMailCode);
    			logger.info("resultMsg : " + StringUtil.getString(resultMailMap.get("resultMsg")));
    			logger.info("#################MAIL 관련 LOG 끝#######################");
        		
    			// mail 발송 실패 시
    			if(Integer.valueOf(resultMailCode) != 0)
    			{
    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    			}
	
    		}
    	}

    	commandMap.put("result", "S");
    	return commandMap;
    }	
	
}
