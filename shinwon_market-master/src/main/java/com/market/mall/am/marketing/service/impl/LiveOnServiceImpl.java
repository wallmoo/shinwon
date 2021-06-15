package com.market.mall.am.marketing.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.market.mall.am.marketing.service.LiveOnService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("LiveOnService")
public class LiveOnServiceImpl implements LiveOnService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
	@Override
	public int selectLiveOnListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("LiveOn.selectliveOnListCount", commandMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectLiveOnList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("LiveOn.selectliveOnList", commandMap);
	}

	@Override
	public int updateLiveOn(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.update("LiveOn.updateLiveOn", commandMap);
	}

    public int updateLiveOnList(Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.update("LiveOn.updateLiveOnList", commandMap);
    }
}
