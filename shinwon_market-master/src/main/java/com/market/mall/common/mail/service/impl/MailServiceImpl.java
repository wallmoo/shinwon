package com.market.mall.common.mail.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.epasscni.util.StringUtil;
import com.market.mall.common.constants.ENUM_MAIL;
import com.market.mall.common.mail.service.MailService;
import com.market.util.MailSender;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("mailSendingService")
public class MailServiceImpl implements MailService{
	private static final Logger LOGGER = LoggerFactory.getLogger(MailServiceImpl.class);
	
	@Resource(name="velocityEngine")
    VelocityEngine velocityEngine;

	@Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;
	
	@Override
	public void sendInquiryMail(Map<String,Object> commandMap) {
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW]  답변완료 안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.INQUIRY_ANSWER, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	private String getBindedTemplate(ENUM_MAIL enumMail,Map<String,Object> emailMap) {
		return VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, enumMail.getValue()+".vm", "UTF-8", emailMap);
	}

	@Override
	public void sendJoinusComplete(Map<String, Object> commandMap) {
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 회원가입완료안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.JOINUS_COMPLETE, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	@Override
	public void sendOrderComplete(Map<String, Object> commandMap) {
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 주문완료안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.ORDER_COMPLETE, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
		
	}

	@Override
	public void sendRefundComplete(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 환불완료안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.REFUND_COMPLETE, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	@Override
	public void sendDeliveryStart(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 상품배송안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.DELIVERY_START, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	@Override
	public void sendReturnRequest(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "SHOWINDOW] 반품신청완료안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.RETURN_REQUEST, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	@Override
	public void sendOrderCancel(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 주문취소완료안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.ORDER_CANCLE, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	@Override
	public void sendExchangeRequest(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 교환신청완료안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.EXCHANGE_REQUEST, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	@Override
	public void sendMemberGradeChange(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		String memberEmail = StringUtil.getString(commandMap.get("MEM_MST_MAIL"));
		String emailTitle = "[SHOWINDOW] 회원등급변경안내";
		String emailContents = getBindedTemplate(ENUM_MAIL.MEMBER_GRADE_CHANGE, commandMap);
		MailSender.sendMail(propertiesService, memberEmail, emailTitle, emailContents);
	}

	
}
