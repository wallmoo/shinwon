package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

public interface LayoutService {
	public List<Map<String, Object>> selectMenuList();
	public int deleteMenuList() throws Exception;
	public int insertMenuList(Map<String, Object> commandMap) throws Exception;
	public int updateMenuList(Map<String, Object> commandMap) throws Exception;
		
}
