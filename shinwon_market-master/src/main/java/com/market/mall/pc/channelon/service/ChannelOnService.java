package com.market.mall.pc.channelon.service;

import java.util.List;
import java.util.Map;

public interface ChannelOnService {
    
    public int selectChannelOnCount(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectChannelOnList (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectUpCategoryList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectChannelOnBannerList (Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectChannelOnInfo (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectChannelOnProductList (Map<String, Object> commandMap) throws Exception;
}
