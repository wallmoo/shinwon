package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface TagDisplayService {

    public List<Map<String, Object>> selectTagDisplayCategoryList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectTagDisplayCategoryCodeList (Map<String, Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectTagDisplayList (Map<String, Object> commandMap) throws Exception;
    
    public int insertTagDisplay (Map<String, Object> commandMap) throws Exception;     
}
