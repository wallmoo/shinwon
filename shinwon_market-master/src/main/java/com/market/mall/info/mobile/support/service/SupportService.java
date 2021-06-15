package com.market.mall.info.mobile.support.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface SupportService {

	public int selectNoticeListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectNoticeListMain(Map<String, Object> commandMap) throws Exception;
	
	public int updateNoticeReadCount(Map<String, Object> commandMap) throws Exception;
	
	public Map selectNoticeInfo(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectCode (String code) throws Exception;
	
	public int selectErpEmpListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectErpEmpList(Map<String, Object> commandMap) throws Exception;
 
    public int insertPraise (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public String selectPraiseRegCheck (HttpServletRequest request) throws Exception;
    
    public List<Map<String, Object>> selectCounselBranchList(Map<String, Object> commandMap) throws Exception;
    
    public int insertCounsel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int selectFaqListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectFaqList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectYearList(Map<String, Object> commandMap) throws Exception;
	
	public Map<String, Object> selectPraiseMailInfo(Map<String, Object> commandMap) throws Exception;
    
}
