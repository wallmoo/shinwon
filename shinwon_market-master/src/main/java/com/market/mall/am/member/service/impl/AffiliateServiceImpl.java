package com.market.mall.am.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.member.service.AffiliateService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.util.StringUtils;

@Service("affiliateService")
public class AffiliateServiceImpl implements AffiliateService {
	
	@Autowired
    CommonDefaultDAO dao;
	
	@Override
	public int selectInfoAffiliateListCount(Map<String, Object> commandMap) throws Exception {
		return dao.selectCount("Affiliate.selectInfoAffiliateListCount", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectInfoAffiliateList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList("Affiliate.selectAffiliateList", commandMap);
	}

	@Override
	public Map<String,Object> selectInfoAffiliateDetail(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.select("Affiliate.selectInfoAffiliateDetail", commandMap);
	}

	@Override
	public int insertAffiliate(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		String code = this.getNewCocCode();
		commandMap.put("COC_SPC_CD", code);
		return dao.insert("Affiliate.insertAffiliate", commandMap);
	}
	@Override
	public int selectAffiliateNameCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCount("Affiliate.selectAffiliateNameCount", commandMap);
	}
	private String getNewCocCode() {
		Random random = new Random();
		char s1 = StringUtils.getRandomUpperCaseCharactor();
		char s2 = StringUtils.getRandomUpperCaseCharactor();
		int s3 = random.nextInt(10);
		int s4 = random.nextInt(10);
		int s5 = random.nextInt(10);
		int s6 = random.nextInt(10);
		int s7 = random.nextInt(10);
		int s8 = random.nextInt(10);
		
		String result = Character.toString(s1);
		result = result + Character.toString(s2);
		result = result + s3;
		result = result + s4;
		result = result + s5;
		result = result + s6;
		result = result + s7;
		result = result + s8;
		return result;
	}

	@Override
	public void updateAffiliate(Map<String, Object> commandMap) throws Exception {
		dao.update("Affiliate.updateAffiliate", commandMap);
	}

	@Override
	public List<Map<String, Object>> slectPointList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList("Affiliate.selectAffiliatePointList", commandMap);
	}

	@Override
	public int insertAffiliatePoint(Map<String, Object> commandMap) throws Exception {
		List<Map<String,Object>> privateCodeList = new ArrayList<Map<String,Object>>();
		String idx = StringUtil.getString(commandMap.get("COC_IDX"));
		int count = StringUtil.getInt(commandMap.get("COC_COUNT"));
		for(int i = 0; i<count;i++) {
			Map<String,Object> privateCode = new HashMap<String,Object>();
			privateCode.put("COC_SPC_PRV_CD", getNewCocCode());
			privateCodeList.add(privateCode);
		}
		commandMap.put("COC_SPC_LIST", privateCodeList);
		return dao.insert("Affiliate.insertAffiliatePoint", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectInfoAffiliatePointList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList("Affiliate.selectInfoAffiliatePointList", commandMap);
	}

	@Override
	public int deleteAffiliatePoint(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		if (!(commandMap.get("COC_SPC_PRV_CD_LIST") instanceof String[])) {
			String[] list = {(String)commandMap.get("COC_SPC_PRV_CD_LIST")};
			commandMap.put("COC_SPC_PRV_CD_LIST", list);
		}
		return dao.delete("Affiliate.deleteInfoAffiliatePointList", commandMap);
	}

	@Override
	public int updateAffiliatePoint(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		String[] cdList = (String[])commandMap.get("COC_SPC_PRV_CD_LIST");
		String[] pointList = (String[])commandMap.get("COC_SPC_PRV_PT_LIST");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(int i=0;i<cdList.length;i++) {
			Map<String,Object> item = new HashMap<String,Object>();
			item.put("COC_SPC_PRV_PT", pointList[i]);
			item.put("COC_SPC_PRV_CD", cdList[i]);
			list.add(item);
		}
		commandMap.put("LIST", list);
		return dao.update("Affiliate.updateInfoAffiliatePointList", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectInfoAffiliateListExcel(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> list = dao.selectList("Affiliate.selectAffiliateList", commandMap);
		
		return list;
	}
}
