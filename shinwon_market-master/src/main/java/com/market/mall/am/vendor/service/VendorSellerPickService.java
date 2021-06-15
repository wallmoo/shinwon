package com.market.mall.am.vendor.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface VendorSellerPickService {
	

    public int insertSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectSellerPickInfo (Map<String, Object> commandMap) throws Exception;
    
    public int updateSellerPick (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> getSellerPickList (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> getSellerAdminPickList (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public Map<String,Object> getSellerPickDetail(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> getSellerPickProduct (HttpServletRequest request, Map<String, Object> commandMap)throws Exception;

    public Integer selectSellerPickListCount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
