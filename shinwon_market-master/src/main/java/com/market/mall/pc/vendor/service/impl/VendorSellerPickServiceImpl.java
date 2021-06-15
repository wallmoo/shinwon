package com.market.mall.pc.vendor.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.vendor.service.VendorSellerPickService;


@Service("pcVendorSellerPickService")
public class VendorSellerPickServiceImpl implements VendorSellerPickService {
	
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	public List<Map<String, Object>> selectSellerPickList (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("PcContent.selectContentList", commandMap);
	}
	
	public int selectSellerPickCount(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectCount("PcContent.selectContentCount", commandMap);
	}
	
	public Map<String, Object> selectSellerPickInfo (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.select("PcContent.selectContentInfoSellerPickView", commandMap);
	    // 셀러픽 VIEW에서 셀러픽 DETAIL TYPE에 따라서 이미지일 경우에 CMM_FLE_SORT : 2 로 설정해야 하고, 그렇지 않을 경우에는 CMM_FLE_SORT : 1로 해야 기본 정보가 조회되도록 조회 쿼리 수정 
	    //return defaultDAO.select("PcContent.selectContentInfo", commandMap);
	    
	}
	
	public List<Map<String, Object>> selectSellerPickBannerList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcContent.selectSellerPickBannerList", commandMap);
    }
	
	
	public List<Map<String, Object>> selectSellerPickProductList(Map<String, Object> commandMap) throws Exception {
	    
	    List<Map<String, Object>> productList = defaultDAO.selectList("PcContent.selectContentProductList", commandMap);
        
	    for(int index=0; index < productList.size(); index++){
            
            Map<String,Object> paramMap = new HashMap<String, Object>();
            
            String prdCD = StringUtil.getString(productList.get(index).get("PRD_MST_CD"),"");
            
            paramMap.put("PRD_MST_CD", prdCD);
            List<Map<String, Object>> prdColorList = new ArrayList<Map<String,Object>>();
            prdColorList = this.defaultDAO.selectList("Product.selectProductColorList", paramMap);
            
            productList.get(index).put("CNT_PRD_COLOR", prdColorList);
        }
	    
	    return productList;
	}
	
	public int selectContentProductListCount(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectCount("PcContent.selectContentProductListCount", commandMap);
	}
}
