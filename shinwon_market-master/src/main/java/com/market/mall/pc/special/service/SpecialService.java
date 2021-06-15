package com.market.mall.pc.special.service;

import java.util.List;
import java.util.Map;

public interface SpecialService {
	public List<Map<String, Object>> selectSpecialBannerList (Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectSpecialList (Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectSpecialProductList (Map<String, Object> commandMap) throws Exception;
	public Map<String, Object> selectSpecialInfo (Map<String, Object> commandMap) throws Exception;
}
