package com.market.mall.pc.member.service;

import java.util.Map;


public interface LikeContentsService {
	
	public String insertLikeContents(Map<String, Object> commandMap);
	
	public String deleteLikeContents(Map<String, Object> commandMap);
	
	public int selectLikeContentsCount(Map<String, Object> commandMap);
}
