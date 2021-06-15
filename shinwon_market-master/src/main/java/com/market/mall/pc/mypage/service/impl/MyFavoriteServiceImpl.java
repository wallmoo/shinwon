package com.market.mall.pc.mypage.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.mypage.service.MyFavoriteService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("pcMyFavoriteService")
public class MyFavoriteServiceImpl implements MyFavoriteService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public List<String> selectFirstDepthCtg(Map<String, Object> commandMap) {
	
		return defaultDAO.selectList("PcMyFavorite.selectFirstDepthCtg", commandMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> selectSecondDepthCtg(Map<String, Object> commandMap) {
		
		return defaultDAO.selectList("PcMyFavorite.selectSecondDepthCtg", commandMap);
	}

	@Override
	public int myPageInertCtgAjax(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("PcMyFavorite.myPageInertCtgAjax",commandMap);
	}

	@Override
	public List<Map<String, Object>> selectMyFavoriteList(Map<String, Object> commandMap) throws Exception {
		 return defaultDAO.selectList("PcMyFavorite.selectMyFavoriteList",commandMap);
	}

	@Override
	public int myPageDelCtgAjax(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("PcMyFavorite.myPageDelCtgAjax",commandMap);
	}

}
