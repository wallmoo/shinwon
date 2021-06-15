package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface DeliveryStateService {
   
    public int selectDeliveryStateListCount (Map<String, Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectDeliveryStateList (Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectDeliveryStateInfo (Map<String, Object> commandMap) throws Exception;

    public int insertDeliveryState (Map<String, Object> commandMap) throws Exception;
    
}
