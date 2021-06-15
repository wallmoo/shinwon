package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface O2OStoreListService {

    public int selectO2OStoreListCount(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectO2OStoreList(Map<String, Object> commandMap) throws Exception;

    public int insertO2OStoreBatch(Map<String, Object> commandMap) throws Exception;
   
    public Map<String, Object> selectO2OStoreDetail(Map<String, Object> commandMap) throws Exception;   
    
    public int updateOperateTime(Map<String, Object> commandMap) throws Exception;
    
    public int deleteO2OStore(Map<String, Object> param) throws Exception;
    
    public int deleteO2OStoreListAll() throws Exception;


}
