package com.market.mall.pc.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyLikeService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.product.service.ProductListService;

@Controller("pcMyLikeController")
public class MyLikeController {
	
	@Resource(name="pcMyPageService")
	private MyPageService pcMyPageService;
	    
	@Resource(name="pcMyLikeService") 
	private MyLikeService pcMyLikeService;
	    
	@Resource(name="pcCommonService") 
	private CommonService pcCommonService;
	
	@Resource(name="productListService")
	private ProductListService productListService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public String[] MY_LIKE_TYPE_ARR = {
			CONTENTS_TYPE_CODE.TYPE_PRODUCT, 
			CONTENTS_TYPE_CODE.TYPE_TOP_SELLER, 
			CONTENTS_TYPE_CODE.TYPE_SELLER_PICK, 
			CONTENTS_TYPE_CODE.TYPE_OOTD, 
			CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON, 
			CONTENTS_TYPE_CODE.TYPE_PLAN};
		
	// 리스트에서 보여질 상품의 이미지 사이즈
    private final static int THUMBNAIL_SIZE = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE;
    
    @AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myLikeList")
	public ModelAndView myLikeList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		    	
		ModelAndView mv = new ModelAndView();
		commandMap.put("MEM_MST_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        List<Integer> likeCount = new ArrayList<Integer>();
        for(String type: MY_LIKE_TYPE_ARR) {
        	commandMap.put("CNT_MST_TYPE", type);
        	likeCount.add(pcMyLikeService.selectLikeListCount(commandMap));
        }
        
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
        
		commandMap.put("orderType","new");
		commandMap.put("startNum", StringUtil.getString(commandMap.get("startNum"), "1"));
		commandMap.put("endNum", StringUtil.getString(commandMap.get("endNum"), "20"));

        mv.addObject("likeCount", likeCount);
        
        mv.addObject("likeProductList", pcMyLikeService.likeProductList(commandMap));
        mv.addObject("likeSellerList", pcMyLikeService.likeSellerList(commandMap));
        
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);
            
        return mv;
	        
	}
    
    
    @AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myLikeProductListAjax")
	public JSON myLikeProductListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
		json.put("list", pcMyLikeService.likeProductList(commandMap));
    	return json;
    }
    
    @AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myLikeSellerListAjax")
	public JSON myLikeSellerListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
		json.put("list", pcMyLikeService.likeSellerList(commandMap));
    	return json;
    }
		    
}
