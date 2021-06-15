package com.market.mall.info.mobile.intro.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.info.intro.service.IntroService;
import com.market.mall.model.Paging;

@Service("mobileIntroService")
public class IntroServiceImpl implements IntroService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public int selectPressListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("Intro.selectPressListCount", commandMap);
	}

	public List<Map<String, Object>> selectPressList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("Intro.selectPressList", commandMap);
	}
 
	public int updatePressReadCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int iResult 			= 0;
		
		iResult				= defaultDAO.insert("Intro.updatePressReadCount", commandMap);
		 
		return iResult;
	}

	public Map selectPressInfo(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> info = new HashMap<String, Object>();
	 	
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    commandMap.put("CMM_FLE_TB_NM", "T_PRS_RLS");
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRS_RLS_IDX"), ""));
	    returnMap.put("fileList", defaultDAO.selectList("Intro.selectCommonFileList", commandMap));
	    returnMap.put("row", defaultDAO.select("Intro.selectPressInfo", commandMap));
        return returnMap;
		
	}

	 
}
