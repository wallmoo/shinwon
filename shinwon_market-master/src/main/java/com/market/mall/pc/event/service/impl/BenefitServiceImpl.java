package com.market.mall.pc.event.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.event.service.BenefitService;

@Service("benefitService")
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

	public List selectCardOptList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardOptList", commandMap);
	}

	public Map selectCardBannerInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("benefit.selectCardBannerInfo", commandMap);
	}

	public List selectCardBannerList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectCardBannerInfo", commandMap);
	}

	public List<Map<String, Object>> selectProductCouponList(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectProductCouponList",commandMap);
	}

	public List selectMyCouponList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("benefit.selectMyCouponList", commandMap);
	}

	public int selectMyCouponListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("benefit.selectMyCouponListCount", commandMap);
	}

	public Map selectCouponInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("benefit.selectCouponInfo", commandMap);
	}
	
	
}
