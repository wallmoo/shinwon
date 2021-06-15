package com.market.mall.pc.event.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.event.service.PrenatalService;

@Service("prenatalService")
public class PrenatalServiceImpl implements PrenatalService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public int selectPrenatalCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectPrenatalCnt", commandMap);
	}

	public Map selectPrenatalInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("pcEventMain.selectPrenatalInfo", commandMap);
	}

	public int insertPrenatal(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.insert("pcEventMain.insertPrenatal", commandMap);
	}

	public int updatePrenatal(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("pcEventMain.updatePrenatal", commandMap);
	}

	public int selectPrenatalTotalCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEventMain.selectPrenatalTotalCount", commandMap);
	}

	public List selectPrenatalList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEventMain.selectPrenatalList", commandMap);
	}
	
}
