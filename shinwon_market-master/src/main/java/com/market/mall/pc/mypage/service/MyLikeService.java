package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyLikeService{

	public int selectLikeListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> likeProductList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> likeSellerList(Map<String, Object> commandMap);
}
