package com.market.mall.batch.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.batch.service.BatchChangeLastCountService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("BatchChangeLastCountService")
public class BatchChangeLastCountServiceImpl implements BatchChangeLastCountService {

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	public Map<String, Object> updateLastCount() throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "F");
		this.defaultDAO.update("BatchChangeLastCount.updateLastCount", "");
		updateCurrentCount();	
		result.put("result", "S");
		return result;
	}
	
	private void updateCurrentCount() throws Exception{
		defaultDAO.update("BatchChangeLastCount.updateCurrentCount", "");
	}
}
