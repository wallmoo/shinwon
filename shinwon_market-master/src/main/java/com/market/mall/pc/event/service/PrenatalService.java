package com.market.mall.pc.event.service;

import java.util.List;
import java.util.Map;

public interface PrenatalService {

	public int selectPrenatalCnt(Map<String, Object> commandMap) throws Exception;

	public Map selectPrenatalInfo(Map<String, Object> commandMap) throws Exception;

	public int insertPrenatal(Map<String, Object> commandMap) throws Exception;

	public int updatePrenatal(Map<String, Object> commandMap) throws Exception;

	public int selectPrenatalTotalCount(Map<String, Object> commandMap) throws Exception;

	public List selectPrenatalList(Map<String, Object> commandMap) throws Exception;

}
