package com.market.mall.pc.theme.category.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.theme.category.service.WeddingService;

/**
 * @PackageName: com.market.mall.pc.theme.category.service.impl
 * @FileName : WeddingServiceImpl.java
 * @Date : 2016. 1. 11.
 * @프로그램 설명 : 프론트 > 테마카테고리 > 웨딩 Service Implement Class
 * @author Lee
 */
@Service("pcWeddingService")
public class WeddingServiceImpl implements WeddingService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public Map<String, Object> selectWeddingMain(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap		= new HashMap<String, Object>();
		
		// 테마가이드 카테고리 > 웨딩 카테고
		commandMap.put("CMN_COM_UP_IDX", "2251");
		commandMap.put("DSP_MST_ENV", "P");
		commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
        
		// 카테고리 및 환경정보
        commandMap.put("PRD_CTG_ENV", "P" ); // P는 웹, M은 모바일 
		// 웨딩가이드북 2Depth 리스트 
		resultMap.put("guide2DepList", defaultDAO.selectList("PcWedding.selectGuide2DepList", commandMap));
		resultMap.put("guide3DepList", defaultDAO.selectList("PcWedding.selectGuide3DepList", commandMap));
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		
//		// 300만원 대 제품
		commandMap.put("CMN_COM_IDX", "2351");
		resultMap.put("product300List", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner300", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
//		// 500만원 대 제품
		commandMap.put("CMN_COM_IDX", "2352");
		resultMap.put("product500List", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner500", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
//		// 800만원 대 제품
		commandMap.put("CMN_COM_IDX", "2353");
		resultMap.put("product800List", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner800", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
//		// 1000만원 대 제품
		commandMap.put("CMN_COM_IDX", "2354");
		resultMap.put("product1000List", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner1000", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
		
		return resultMap;
	}

	public List getGuide3DepList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcWedding.selectGuide2DepList", commandMap);
	}

	public int selectThemeGuideContentsListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("PcWedding.selectThemeGuideContentsListCount", commandMap);
	}

	@SuppressWarnings("unchecked")
	public List selectThemeGuideContentsList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcWedding.selectThemeGuideContentsList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectWeddingContenInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcWedding.selectWeddingContenInfo", commandMap);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSingleKingMain(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap		= new HashMap<String, Object>();
		
		// 테마가이드 카테고리 > 싱글킹 카테고리 
		commandMap.put("CMN_COM_UP_IDX", "2252");
		// 웨딩가이드북 2Depth 리스트 
		resultMap.put("guide2DepList", defaultDAO.selectList("PcWedding.selectGuide2DepList", commandMap));
		
		return resultMap;
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectWeddingDepList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap		= new HashMap<String, Object>();
		
		commandMap.put("DSP_MST_ENV", "P");
		commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
		
		// 웨딩가이드북 2Depth 리스트
		resultMap.put("guide2DepList", defaultDAO.selectList("PcWedding.selectGuide2DepList", commandMap));
		resultMap.put("guide3DepList", defaultDAO.selectList("PcWedding.selectGuide3DepList", commandMap));
			
		return resultMap;
	}

	public List selectWeddingProductList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcWedding.selectThemeCateProductList", commandMap);
	}

	public Map selectCodeInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcWedding.selectCodeInfo", commandMap);
	}

}
