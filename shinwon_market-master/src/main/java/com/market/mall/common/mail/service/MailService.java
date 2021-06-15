package com.market.mall.common.mail.service;

import java.util.Map;

public interface MailService {
	
	void sendInquiryMail(Map<String, Object> commandMap);
	void sendJoinusComplete(Map<String, Object> commandMap);
	void sendOrderComplete(Map<String, Object> commandMap);
	void sendRefundComplete(Map<String, Object> commandMap);
	void sendDeliveryStart(Map<String, Object> commandMap);
	void sendReturnRequest(Map<String, Object> commandMap);
	void sendOrderCancel(Map<String, Object> commandMap);
	void sendExchangeRequest(Map<String, Object> commandMap);
	void sendMemberGradeChange(Map<String, Object> commandMap);
}
