package com.market.mall.am.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.display.service.LayoutService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("layoutService")
public class LayoutServiceImpl implements LayoutService {

	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;

	@Override
	public List<Map<String, Object>> selectMenuList() {
		return defaultDAO.selectList("Layout.selectMenuList", null);		
	}

	@Override
	public int deleteMenuList() throws Exception {
		return defaultDAO.delete("Layout.deleteMenuList", null);
	}

	@Override
	public int insertMenuList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("Layout.insertMenuList", commandMap);
	}	
	
	@Override
	public int updateMenuList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("Layout.updateMenuList", commandMap);
	}		
}
