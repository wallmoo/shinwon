package com.market.mall.pc.mypage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.mypage.service.MyEstimateService;

@Service("myEstimateService")
public class MyEstimateServiceImpl implements MyEstimateService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public int selectMyEstimateCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcMyEstimate.selectMyEstimateCount", commandMap);
	}

	public List selectMyEstimateList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcMyEstimate.selectMyEstimateList", commandMap);
	}

	public Map selectMyEstimateInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcMyEstimate.selectMyEstimateInfo", commandMap);
	}

	public List selectMyEstimatePrdList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcMyEstimate.selectMyEstimatePrdList", commandMap);
	}

	public List selectMyEstimateReplyList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcMyEstimate.selectMyEstimateReplyList", commandMap);
	}

	public int insertMyEstimateComment(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcMyEstimate.insertMyEstimateComment", commandMap);
	}

	public int updateMyEstimateChoiceAjax(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcMyEstimate.updateMyEstimateChoiceAjax", commandMap);
	}
	

}
