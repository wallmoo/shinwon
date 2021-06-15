package com.market.mall.common.kakao.service;

import java.util.Map;

public interface BusinessKakaoTalkService {
	public void sendSwd57(Map<String, Object> commandMap) throws Exception;
	public void sendSwd64(Map<String, Object> commandMap) throws Exception;
	public void sendSwd61(Map<String, Object> commandMap) throws Exception;
	
}
