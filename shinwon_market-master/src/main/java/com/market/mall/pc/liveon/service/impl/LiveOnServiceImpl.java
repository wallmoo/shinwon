package com.market.mall.pc.liveon.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.liveon.service.LiveOnService;


@Service("pcLiveOnService")
public class LiveOnServiceImpl implements LiveOnService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	   
    public int selectLiveOnProductListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PcLiveOn.selectLiveOnProductListCount", commandMap);
    }
	

	public List<Map<String, Object>> selectLiveOnProductList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("PcLiveOn.selectLiveOnProductList", commandMap);
	}
	
}
