package com.market.mall.common.kakao.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.common.kakao.ButtonEnum;
import com.market.mall.common.kakao.ButtonFactory;
import com.market.mall.common.kakao.MessageFactory;
import com.market.mall.common.kakao.service.BusinessKakaoTalkService;
import com.market.mall.dao.CommonDefaultDAO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("kakaoService")
public class BusinessKakaoTalkServiceImpl implements BusinessKakaoTalkService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;

	
	public void sendKakaoTalk(Map<String, Object> commandMap) throws Exception {
		commandMap.put("STATUS", "1");
		commandMap.put("PROFILE_KEY", StringUtil.getString(propertiesService.getString("kakao.profilekey")));
		commandMap.put("CALLBACK", StringUtil.getString(propertiesService.getString("kakao.callback.number")));
		commandMap.put("failed_type", "MMS");
		commandMap.put("failed_msg", StringUtil.getString(commandMap.get("MSG")));
		defaultDAO.insert("Kakao.insertKakaoBatch", commandMap);
	}
	
	private String getButtonString(JSONArray array) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("button", array);
		return jsonObject.toString();
	}
	
	@Override
	public void sendSwd57(Map<String, Object> commandMap) throws Exception {
		String CONST_TEMPLATE_CODE = "SWD57";
		String message = MessageFactory.getMessageInstance(CONST_TEMPLATE_CODE, commandMap);
		commandMap.put("MSG", message);
		commandMap.put("template_code", CONST_TEMPLATE_CODE);
		commandMap.put("failed_subject", "SMS제목");
		
		JSONArray buttonList = new JSONArray();
		buttonList.put(ButtonFactory.getButtonInstance(ButtonEnum.MD, "회원가입"));
		commandMap.put("BUTTON_JSON", getButtonString(buttonList));
		sendKakaoTalk(commandMap);
	}
	
	@Override
	public void sendSwd64(Map<String, Object> commandMap) throws Exception {
		String CONST_TEMPLATE_CODE = "SWD64";
		String message = MessageFactory.getMessageInstance(CONST_TEMPLATE_CODE, commandMap);
		commandMap.put("MSG", message);
		commandMap.put("template_code", CONST_TEMPLATE_CODE);
		commandMap.put("failed_subject", "SMS제목");
		
		JSONArray buttonList = new JSONArray();
		buttonList.put(ButtonFactory.getButtonInstance(ButtonEnum.MD, "업무공유게시판-입점사등록"));
		commandMap.put("BUTTON_JSON", getButtonString(buttonList));
		sendKakaoTalk(commandMap);
	}

	
	@Override
	public void sendSwd61(Map<String, Object> commandMap) throws Exception {
		String CONST_TEMPLATE_CODE = "SWD61";
		String message = MessageFactory.getMessageInstance(CONST_TEMPLATE_CODE, commandMap);
		commandMap.put("MSG", message);
		commandMap.put("template_code", CONST_TEMPLATE_CODE);
		commandMap.put("failed_subject", "SMS제목");
		
		JSONArray buttonList = new JSONArray();
		buttonList.put(ButtonFactory.getButtonInstance(ButtonEnum.MD, "재입고알림"));
		commandMap.put("BUTTON_JSON", getButtonString(buttonList));
		sendKakaoTalk(commandMap);
	}
	
	
	/*
	    SWD80	포인트소멸알림
		SWD79	쿠폰소멸알림
		SWD78	베스트후기 선정
		SWD77	정산확인완료
		SWD76	정산확인요청
		SWD75	매장발송거절알림
		SWD74	매장발송지정알림
		SWD73	매장발송주문알림
		SWD72	입점사상품변경신청
		SWD71	입점사상품신청
		SWD70	관리자상품변경승인-보류
		SWD69	관리자상품변경승인-승인
		SWD68	관리자상품승인-보류
		SWD67	관리자상품승인-승인
		SWD66	입점사공지게시판-관리자등록
		SWD65	업무공유게시판-관리자등록
		SWD64	업무공유게시판-입점사등록
		SWD63	리뷰어 모집 알림
		SWD62	이벤트 알림
		SWD61	재입고알림
		SWD60	문의답변-셀러 Q&A
		SWD59	문의답변-상품 문의
		SWD58	문의답변-1:1 문의
		SWD57	회원가입
		SWD56	교환-교환불가
		SWD55	교환-교환완료
		SWD54	교환-교환승인
		SWD53	교환-교환신청
		SWD52	반품-반품불가
		SWD51	반품-반품완료
		SWD50	반품-반품승인
		SWD48	취소-주문취소
		SWD49	반품-반품신청
		SWD47	취소-취소완료
		SWD46	주문-결제완료(매장픽업)
		SWD45	주문-상품준비중(매장픽업)
		SWD44	주문-배송완료
		SWD43	주문-배송중
		SWD42	주문-결제완료
		SWD41	주문-입금대기
	 */	
}
