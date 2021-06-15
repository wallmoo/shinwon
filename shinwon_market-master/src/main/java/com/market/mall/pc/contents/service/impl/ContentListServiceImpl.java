package com.market.mall.pc.contents.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.contents.service.ContentListService;

@Service("contentListService")
public class ContentListServiceImpl implements ContentListService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPlanContentsList(Map<String, Object> commandMap) throws Exception {
	
		return defaultDAO.selectList("PcContent.selectPlanContentsList", commandMap);
	
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTimeContentsList(Map<String, Object> commandMap) throws Exception {
	
		List<Map<String, Object>> timeList = defaultDAO.selectList("PcContent.selectTimeContentsList", commandMap);
		for(int i = 0 ; i < timeList.size(); i++ ) {
			Map<String, Object> colorParam = new HashMap<String, Object>();
			colorParam.put("PRD_MST_CD", timeList.get(i).get("PRD_MST_CD"));
			timeList.get(i).put("CNT_PRD_COLOR", defaultDAO.selectList("Product.selectProductColorList", colorParam));

		}
		
		return timeList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNewContentsList(Map<String, Object> commandMap) throws Exception {
		
		commandMap.put("DSP_TAB_TYP", "N");
		List<Map<String, Object>> newList = defaultDAO.selectList("PcContent.selectNewTopContentsList", commandMap);
		for(int i = 0 ; i < newList.size(); i++ ) {
			Map<String, Object> colorParam = new HashMap<String, Object>();
			colorParam.put("PRD_MST_CD", newList.get(i).get("PRD_MST_CD"));
			newList.get(i).put("CNT_PRD_COLOR", defaultDAO.selectList("Product.selectProductColorList", colorParam));

		}
		
		return newList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventContentsList(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.selectList("PcContent.selectEventContentsList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPickContentsList(Map<String, Object> commandMap) throws Exception {
		
		commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
		
		return defaultDAO.selectList("PcContent.selectComContentsList", commandMap);
		
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOotdContentsList(Map<String, Object> commandMap) throws Exception {
		
		commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_OOTD);
		
		List<Map<String, Object>> nootdList = defaultDAO.selectList("PcContent.selectComContentsList", commandMap);
		for(int i = 0 ; i < nootdList.size(); i++ ) {
			Map<String, Object> ootdParam = new HashMap<String, Object>();
			ootdParam.put("CNT_MST_IDX", nootdList.get(i).get("CNT_MST_IDX"));
			ootdParam.put("THUMBNAIL_SIZE", commandMap.get("THUMBNAIL_SIZE"));
			ootdParam.put("USER_ENV_TYPE", commandMap.get("USER_ENV_TYPE"));
			ootdParam.put("MEM_MST_ID", commandMap.get("MEM_MST_ID"));
			
			nootdList.get(i).put("DTL_LIST", defaultDAO.selectList("PcContent.selectConDtlContentsList", ootdParam));

		}
		
		return nootdList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBestContentsList(Map<String, Object> commandMap) throws Exception {
	
		return defaultDAO.selectList("PcContent.selectBestContentsList", commandMap);
	}
	public List<Map<String, Object>> selectFundContentsList(Map<String, Object> commandMap) throws Exception {
		
		return new ArrayList<>();
		//return defaultDAO.selectList("pcEmagazine.selectEmagazineManyRead", commandMap);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHaulContentsList(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.selectList("PcContent.selectHaulContentsList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTopContentsList(Map<String, Object> commandMap) throws Exception {
		commandMap.put("DSP_TAB_TYP", "T");
		List<Map<String, Object>> newList = defaultDAO.selectList("PcContent.selectNewTopContentsList", commandMap);
		for(int i = 0 ; i < newList.size(); i++ ) {
			Map<String, Object> colorParam = new HashMap<String, Object>();
			colorParam.put("PRD_MST_CD", newList.get(i).get("PRD_MST_CD"));
			newList.get(i).put("CNT_PRD_COLOR", defaultDAO.selectList("Product.selectProductColorList", colorParam));

		}
		
		return newList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBannerContentsList(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.selectList("PcContent.selectBannerContentsList", commandMap);
	}
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchProductList(Map<String, Object> commandMap) throws Exception {
		
		List<Map<String, Object>> prdList = defaultDAO.selectList("PcContent.selectSearchProductList", commandMap);
		for(int i = 0 ; i < prdList.size(); i++ ) {
			Map<String, Object> colorParam = new HashMap<String, Object>();
			colorParam.put("PRD_MST_CD", prdList.get(i).get("PRD_MST_CD"));
			prdList.get(i).put("CNT_PRD_COLOR", defaultDAO.selectList("Product.selectProductColorList", colorParam));

		}
		return prdList;
		
	}
	
	public int selectSearchProductCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcContent.selectSearchProductCount", commandMap);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchTimeList(Map<String, Object> commandMap) throws Exception {
	
		List<Map<String, Object>> timeList = defaultDAO.selectList("PcContent.selectSearchTimeList", commandMap);
		for(int i = 0 ; i < timeList.size(); i++ ) {
			Map<String, Object> colorParam = new HashMap<String, Object>();
			colorParam.put("PRD_MST_CD", timeList.get(i).get("PRD_MST_CD"));
			timeList.get(i).put("CNT_PRD_COLOR", defaultDAO.selectList("Product.selectProductColorList", colorParam));

		}
		
		return timeList;
	}
	
	public int selectSearchTimeCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcContent.selectSearchTimeCount", commandMap);
	}

	public List<Map<String, Object>> selectSearchFundList(Map<String, Object> commandMap) throws Exception {
		
		return new ArrayList<>();
	}
	public int selectSearchFundCount(Map<String, Object> commandMap) throws Exception {
		return 0;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchPlanList(Map<String, Object> commandMap) throws Exception {
	
		return defaultDAO.selectList("PcContent.selectSearchPlanList", commandMap);
	}
	public int selectSearchPlanCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcContent.selectSearchPlanCount", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchEventList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcContent.selectSearchEventList", commandMap);
	}
	public int selectSearchEventCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcContent.selectSearchEventCount", commandMap);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchHaulList(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.selectList("PcContent.selectSearchHaulList", commandMap);
	}
	public int selectSearchHaulCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcContent.selectSearchHaulCount", commandMap);
	}
	
	
}
