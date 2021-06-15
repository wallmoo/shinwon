package com.market.mall.pc.mypage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.mypage.service.MyLikeService;

import egovframework.rte.fdl.property.EgovPropertyService;

@SuppressWarnings("unchecked")
@Service("pcMyLikeService")
public class MyLikeServiceImpl implements MyLikeService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public int selectLikeListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcMyLike.selectLikeListCount", commandMap);
	}

	@Override
	public List<Map<String, Object>> likeProductList(Map<String, Object> commandMap) throws Exception {

		commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_PRODUCT);
		String userId = SessionsUser.getSessionUserValue("MEM_MST_MEM_ID");
		commandMap.put("MEM_MST_ID", userId);
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        commandMap.put("MEM_CRT_SES_ID", userId);
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
        commandMap.put("catIdx", StringUtil.getString(commandMap.get("PRD_CTG_IDX")));
        
		List<Map<String,Object>> result =  this.defaultDAO.selectList("PcMyLike.selectLikeProductList", commandMap);
    	
        for(int index=0; index < result.size(); index++){
            
            Map<String,Object> paramMap = new HashMap<String, Object>();
            paramMap.put("PRD_MST_CD", StringUtil.getString(result.get(index).get("PRD_MST_CD"),""));
            
            List<Map<String, Object>> prdColorList = new ArrayList<Map<String,Object>>();
            prdColorList = this.defaultDAO.selectList("Product.selectProductColorList", paramMap);
            
            result.get(index).put("CNT_PRD_COLOR", prdColorList);
        }
    	
    	return result;
	}

	@Override
	public List<Map<String, Object>> likeSellerList(Map<String, Object> commandMap) {
		commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_TOP_SELLER);
		return defaultDAO.selectList("PcMyLike.selectLikeSellerList",commandMap);
	}

}
