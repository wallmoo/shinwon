package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BrandPointService {

    public int insertBrandPoint (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectBrandPointList (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectBrandList (Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectOtherBrandPointList (Map<String,Object> commandMap) throws Exception;

}
