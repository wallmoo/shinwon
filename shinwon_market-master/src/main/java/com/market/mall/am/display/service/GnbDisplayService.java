package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

public interface GnbDisplayService {

    public List<Map<String, Object>> selectGnbDisplayList(Map<String, Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectSubGnbDisplayList(Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectGnbDisplayView(Map<String, Object> commandMap) throws Exception;

    public int insertGnbDisplay(Map<String, Object> commandMap) throws Exception;

    public int updateGnbDisplay(Map<String, Object> commandMap) throws Exception;
    
    public int deleteGnbDisplay(Map<String, Object> commandMap) throws Exception;
    
    public int insertGnbSpec(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSpecGnbList(Map<String, Object> commandMap) throws Exception;
    
    public int deleteGnbSpec(Map<String, Object> commandMap) throws Exception;
    
    public int selectGnbSpecCount(Map<String, Object> commandMap) throws Exception;
}
