package com.market.mall.pc.theme.category.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.theme.category.service.SingleService;

@Service("pcSingleService")
public class SingleServiceImpl implements SingleService{

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	public Map<String, Object> selectSinglegMain(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap		= new HashMap<String, Object>();
		
		// 테마가이드 카테고리 > 싱글 카테고리
		commandMap.put("CMN_COM_UP_IDX", "2252");
		commandMap.put("DSP_MST_ENV", "P");
		commandMap.put("CMM_FLE_TB_NM", "T_BNR_MST");
		
		// 웨딩가이드북 2Depth 리스트 
		resultMap.put("guide2DepList", defaultDAO.selectList("PcWedding.selectGuide2DepList", commandMap));
		resultMap.put("guide3DepList", defaultDAO.selectList("PcWedding.selectGuide3DepList", commandMap));
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		
		// 알뜰형
		commandMap.put("CMN_COM_IDX", "2356");
		resultMap.put("productList1", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner1", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
		// 실속형
		commandMap.put("CMN_COM_IDX", "2357");
		resultMap.put("productList2", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner2", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
		// 트랜트형 
		commandMap.put("CMN_COM_IDX", "2358");
		resultMap.put("productList3", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		resultMap.put("banner3", defaultDAO.selectList("PcWedding.selectThemeBannerList", commandMap));
		
		return resultMap;
	}
	
	
}
