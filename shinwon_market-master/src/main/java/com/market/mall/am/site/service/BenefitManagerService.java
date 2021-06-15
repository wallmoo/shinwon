package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface BenefitManagerService {
	

	public int selectBenefitManagerListCount (Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectBenefitManagerList (Map<String, Object> commandMap) throws Exception;
	
	public int insertBenefitManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

	public Map<String, Object> selectBenefitManagerInfo (Map<String, Object> commandMap) throws Exception;

	public int updateBenefitManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	

}
