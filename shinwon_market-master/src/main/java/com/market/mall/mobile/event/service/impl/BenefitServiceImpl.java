package com.market.mall.mobile.event.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.mobile.event.service.BenefitService;

@Service("mBenefitService")
public class BenefitServiceImpl implements BenefitService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	public List selectMemberCouponList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectMemberCouponList", commandMap);
	}

	public int selectCouponListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("benefit.selectCouponListCount", commandMap);
	}

	public List selectCouponList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCouponList", commandMap);
	}

	public List selectCommonCodeList(String code) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcCommon.selectCodeList", code);
	}

	public List selectCardDivList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardDivList",  commandMap);
	}

	public List selectCardEventList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardEventList",  commandMap);
	}

	public List selectCardCodeList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardCodeList", commandMap);
	}

	public List selectDivInfList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectDivInfList", commandMap);
	}

	public List selectCardBannerList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardBannerInfo", commandMap);
	}

	public int selectMyCouponListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("benefit.selectMyCouponListCount", commandMap);
	}

	public List selectMyCouponList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectMyCouponList", commandMap);
	}

	public List selectCardOptList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardOptList", commandMap);
	}

	public int selectCardBannerTotalCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("benefit.selectCardBannerTotalCount", commandMap);
	}
	
}
