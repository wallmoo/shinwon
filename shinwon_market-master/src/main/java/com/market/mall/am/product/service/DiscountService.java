package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface DiscountService {
    
    public int insertDiscountInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception; 
    
    public List<Map<String, Object>> selectDiscountList (Map<String, Object> commandMap) throws Exception;

    
}
