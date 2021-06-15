package com.market.mall.info.mobile.branch.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BranchService {

	public int selectBranchListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectBranchList(Map<String, Object> commandMap) throws Exception;
	
	public int updatePressReadCount(Map<String, Object> commandMap) throws Exception;
	
	public Map selectBranchInfo(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectCode (String code) throws Exception;
	
	/**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectCodeByCode (String code) throws Exception;
     
     public String selectBranchAreaNm (String code) throws Exception;
     
     
}
