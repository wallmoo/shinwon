package com.market.mall.pc.special.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.special.service.SpecialService;


@Service("pcSpecialService")
public class SpecialServiceImpl implements SpecialService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSpecialBannerList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcContent.selectSpecialBannerList", commandMap);
    }
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSpecialList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcContent.selectSpecialList", commandMap);
    }
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectSpecialInfo (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PcContent.selectContentInfo", commandMap);
    }

    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSpecialProductList (Map<String, Object> commandMap) throws Exception {

        List<Map<String, Object>> productList = defaultDAO.selectList("PcContent.selectContentProductList", commandMap);
        
       	List<Map<String, Object>> colorList = null;
    	try {
    		Map<String, Object> colorParam = new HashMap<String, Object>();
        	colorParam.put("productList", productList);
    		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
    	} catch (Exception e) {}
    	
		if(colorList != null) {
			
			for(int i = 0 ; i < productList.size(); i ++ ) {
				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
				String targetPrdCD = productList.get(i).get("PRD_MST_CD").toString();
				for(int k = 0; k < colorList.size(); k++) {
					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
						colorResult.add(colorList.get(k));
					}
				}
				productList.get(i).put("CNT_PRD_COLOR", colorResult);
			}
		}

        return productList;
    }
}
