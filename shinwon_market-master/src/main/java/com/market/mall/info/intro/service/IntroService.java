package com.market.mall.info.intro.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface IntroService {

	public int selectPressListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectPressList(Map<String, Object> commandMap) throws Exception;
	
	public int updatePressReadCount(Map<String, Object> commandMap) throws Exception;
	
	public Map selectPressInfo(Map<String, Object> commandMap) throws Exception;
}
