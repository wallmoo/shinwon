package com.market.mall.am.order.service;

import java.util.List;
import java.util.Map;

public interface TaxIvcService {
	
	public int selectTaxIvcCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectTaxIvcList(Map<String, Object> commandMap) throws Exception;
	
	public Map<String, Object> selectTaxIvcInfo(Map<String, Object> commandMap) throws Exception;
	
	public int updateTaxIvc(Map<String, Object> commandMap) throws Exception;
	
}
