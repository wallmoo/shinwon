package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

public interface LiveOnService {

	public int selectLiveOnListCount(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectLiveOnList (Map<String, Object> commandMap) throws Exception;
    
    public int updateLiveOn(Map<String, Object> commandMap) throws Exception;   

    public int updateLiveOnList(Map<String, Object> commandMap) throws Exception;   
}
