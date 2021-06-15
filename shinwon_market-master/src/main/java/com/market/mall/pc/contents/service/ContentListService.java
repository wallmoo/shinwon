package com.market.mall.pc.contents.service;

import java.util.List;
import java.util.Map;

public interface ContentListService {
	
	public List<Map<String, Object>> selectPlanContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectTimeContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectNewContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectEventContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectPickContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectOotdContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectBestContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectFundContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectHaulContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectTopContentsList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectBannerContentsList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSearchProductList(Map<String, Object> commandMap) throws Exception;
	public int selectSearchProductCount(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectSearchTimeList(Map<String, Object> commandMap) throws Exception;
	public int selectSearchTimeCount(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectSearchFundList(Map<String, Object> commandMap) throws Exception;
	public int selectSearchFundCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSearchPlanList(Map<String, Object> commandMap) throws Exception;
	public int selectSearchPlanCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSearchEventList(Map<String, Object> commandMap) throws Exception;
	public int selectSearchEventCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSearchHaulList(Map<String, Object> commandMap) throws Exception;
	public int selectSearchHaulCount(Map<String, Object> commandMap) throws Exception;
	
}
