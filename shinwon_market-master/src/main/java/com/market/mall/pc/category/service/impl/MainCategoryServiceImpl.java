package com.market.mall.pc.category.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.category.service.MainCategoryService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("mainCategoryService")
public class MainCategoryServiceImpl implements MainCategoryService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    public int selectProductListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("MainCategory.selectProductListCount", commandMap);
    }
    
    public List<Map<String,Object>> selectProductList(Map<String, Object> commandMap) throws Exception {
        List<Map<String,Object>> result = defaultDAO.selectList("MainCategory.selectProductList", commandMap);
        for(int index=0; index < result.size(); index++){
            Map<String,Object> paramMap = new HashMap<String, Object>();
            
            String prdCD = StringUtil.getString(result.get(index).get("PRD_MST_CD"));
            
            paramMap.put("PRD_MST_CD", prdCD);
            
            List<Map<String, Object>> prdColorList = new ArrayList<Map<String,Object>>();
            prdColorList = this.defaultDAO.selectList("Product.selectProductColorList", paramMap);
            
            result.get(index).put("CNT_PRD_COLOR", prdColorList);
        }
        return result;
    }
    
	@Override
	public void updateCategoryReadCount(Map<String, Object> commandMap) throws Exception {
		defaultDAO.update("PcCategoryProduct.updateCategoryReadCount", commandMap);
	}
	
    

	@Override
	public Map<String, Object> selectCategoryByIdx(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("PcCategoryProduct.selectCategoryByIdx", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectCategoryChildrenByIdx(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcCategoryProduct.selectCategoryChildrenByIdx", commandMap);
	}

	@Override
	public Map<String, Object> selectCategoryDetailByIdx(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> category = this.selectCategoryByIdx(commandMap);
		if(category==null || category.isEmpty()) {return null;}
		category.put("children", this.selectCategoryChildrenByIdx(commandMap));
		return category;
	}
    
	
}

