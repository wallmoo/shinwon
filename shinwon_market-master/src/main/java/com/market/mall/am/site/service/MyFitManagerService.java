package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MyFitManagerService {
	
    public int insertMyFitManager (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    public int selectMyFitManagerListCount (Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> selectMyFitManagerList (Map<String,Object> commandMap) throws Exception;
	
    public Map<String,Object> selectMyFitInfo (Map<String,Object> commandMap) throws Exception;

    public List<Map<String,Object>> selectMyFitInputList (Map<String,Object> commandMap) throws Exception;
    
    public int updateMyFit (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectMyFitSubCategoryList(Map<String, Object> commandMap) throws Exception;
}
