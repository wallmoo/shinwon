package com.market.mall.info.mobile.branch.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.info.mobile.branch.service.BranchService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

@Service("mobileBranchService")
public class BranchServiceImpl implements BranchService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public int selectBranchListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("Branch.selectBranchListCount", commandMap);
	}

	public List<Map<String, Object>> selectBranchList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Branch.selectBranchList", commandMap);
	}
	
	public String selectBranchAreaNm(String code) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectStr("Branch.selectBranchAreaNm", code);
	}
 
	public int updatePressReadCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
		
		iResult				= defaultDAO.insert("Branch.updatePressReadCount", commandMap);
		 
		return iResult;
	}

	public Map selectBranchInfo(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> info = new HashMap<String, Object>();
	 	
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    commandMap.put("CMM_FLE_TB_NM", "T_SHP_MST");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SHP_MST_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("Branch.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("Branch.selectBranchInfo", commandMap));
        return returnMap;
		
	}
	/**
	* <pre>
	* 1. MethodName : selectCode
	* 2. ClassName  : CommonServiceImpl.java
	* 3. Comment    : 공통코드 조회 
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 2. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCode (String code) throws Exception
	{
	    return (List<Map<String, Object>>)defaultDAO.selectList("Branch.selectCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
	}
	/**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectCodeByCode (String code) throws Exception
     {
         return (List<Map<String, Object>>)defaultDAO.selectList("Branch.selectCodeList", code);
     }
}
