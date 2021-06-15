package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface SpecialService {

    public int selectSpecialCount(Map<String, Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectSpecialList(Map<String, Object> commandMap) throws Exception;

    public Map<String, Object> selectSpecialInfo(Map<String, Object> commandMap) throws Exception;

    public int insertSpecial(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    public int updateSpecial(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int updateSpecialList(Map<String, Object> commandMap) throws Exception;
 
}
