package com.market.mall.pc.smstest;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.product.service.ProductListService;

/**
 * 
 * @PackageName: com.market.mall.pc.smsTest
 * @FileName : SmsTestController.java
 * @Date : 2016. 2. 17.
 * @프로그램 설명 : Sms 테스트
 * @author : DEV_LEEKWANGWOON
 */
@Controller
@AccessLevelUser(ROLEUSER.guest)
public class SmsTestController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="productListService") 	
	private ProductListService productListService;
	
    @Resource private Sms sms;
    
    /**
     * <pre>
     * 1. MethodName : brand
     * 2. ClassName  : SmsTestController.java
     * 3. Comment    : Sms 전송 테스트 
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 17.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
	@RequestMapping("/pc/sms/smsSendTest.do")
    public ModelAndView smsSendTest(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
		// sms 발송용 맵
		Map<String, Object> smsMap = new HashMap<String, Object>();
		
		//전화번호
		//smsMap.put("TR_PHONE", StringUtil.getString(orderInfo.get("ORD_MST_HP1"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP2"), "")+StringUtil.getString(orderInfo.get("ORD_MST_HP3"), ""));
		//smsMap.put("TR_MSG", "주문상품["+ SUBSTR_PRD_MST_NM +"]["+ ORD_DLV_CPN_NM + StringUtil.getString(commandMap.get("ORD_PRD_IVC_NO")) +"]로 발송되었습니다.");
		
		
		
		/*
		 
		  TR_PHONE   : 수신인 번호(숫자만)
		  TR_NAME  	 : 수신인 이름
		  TR_SUBJECT : LMS 제목
		  TR_MSG 	 : 문자내용
		  
		*/
		String userPhone= "01011112222";
		String userName=  "홍길동";
		
		smsMap.put("TR_PHONE", userPhone);  

		smsMap.put("TR_NAME", userName);  		
		
		smsMap.put("TR_SUBJECT", "제목입니다."); 		
				
		smsMap.put("TR_MSG", "주문상품 대한통운 배송사로 발송되었습니다.[20150217151131]");
		
		Map<String, Object> resultMap = this.sms.sendLongMessage(smsMap);
		
		logger.info("resultMap >> " + resultMap);
		
		String resultCode = StringUtil.getString(resultMap.get("resultCode"), "");
		logger.info("resultCode >> " + resultCode);
		
		/*
 			보낼때는 this.sms.sendLongMessage(smsMap); 이렇게만!!!
 			
			resultCode 
			0 : 정상처리
			1 : 수신번호 오류
			2 : 메세지 오류
			3 : 제목 오류
			4 : 이름 오류
			5 : 설정 메일설정
			6 : 기타오류
		*/
		
        return mv;
    }
	
	


}
