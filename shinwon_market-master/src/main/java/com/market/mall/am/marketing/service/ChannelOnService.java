package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ChannelOnService {

    public int insertChannelOn (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectChannelOnList (Map<String, Object> commandMap) throws Exception;
    
    public int selectChannelOnListCount (Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectChannelOnInfo (Map<String, Object> commandMap) throws Exception;
    
    public int updateChannelOn (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int updateChannelOnStatus (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
