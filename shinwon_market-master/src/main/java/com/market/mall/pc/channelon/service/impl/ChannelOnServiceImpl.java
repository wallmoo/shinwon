package com.market.mall.pc.channelon.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.channelon.service.ChannelOnService;


@Service("pcChannelOnService")
public class ChannelOnServiceImpl implements ChannelOnService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	public int selectChannelOnCount(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectCount("PcContent.selectChannelOnCount", commandMap);
	}
	//컨텐츠 목록
    public List<Map<String, Object>> selectChannelOnList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcContent.selectChannelOnList", commandMap);
    }
    
    public List<Map<String, Object>> selectUpCategoryList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcContent.selectUpCategoryList", commandMap);
    }
    
    
	//컨텐츠 상단 배너 리스트
    public List<Map<String, Object>> selectChannelOnBannerList (Map<String, Object> commandMap) throws Exception {
        //모바일 여부
        String mobileYn = StringUtil.getString(commandMap.get("mobileYn"),"N");
        
        return defaultDAO.selectList("PcContent.selectChannelOnBannerList", commandMap);
    }
    //컨텐츠 기본 정보
    public Map<String, Object> selectChannelOnInfo (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PcContent.selectContentInfo", commandMap);
    }
    //컨텐츠 상품 목록
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectChannelOnProductList (Map<String, Object> commandMap) throws Exception {

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
