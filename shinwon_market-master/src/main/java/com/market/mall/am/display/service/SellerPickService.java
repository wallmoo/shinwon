package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface SellerPickService {
    
    public int selectSellerPickListCount (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSellerPickList (Map<String, Object> commandMap)throws Exception;
    
    public int updateSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int insertSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectSellerPickInfo (Map<String, Object> commandMap) throws Exception;
    
    public int updateSellerPickList(Map<String, Object> commandMap) throws Exception;
    
}
