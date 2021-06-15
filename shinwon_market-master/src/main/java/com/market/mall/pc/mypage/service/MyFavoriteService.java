package com.market.mall.pc.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyFavoriteService {

	List<String> selectFirstDepthCtg(Map<String, Object> commandMap);

	List<String> selectSecondDepthCtg(Map<String, Object> commandMap);
	int myPageInertCtgAjax(Map<String, Object> commandMap) throws Exception ;
	List<Map<String, Object>> selectMyFavoriteList(Map<String, Object> commandMap) throws Exception;
	int myPageDelCtgAjax(Map<String, Object> commandMap) throws Exception ;
}
