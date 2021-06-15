package com.market.mall.mobile.store.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.model.Code;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.funding.service.FundingService;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.special.service.SpecialService;
import com.market.mall.pc.store.service.StoreService;
import com.market.mall.pc.tag.service.TagService;

@Controller("mobileStoreController")
public class StoreController {
    
    @Resource(name="pcStoreService") StoreService pcStoreService;
    
    @Resource(name="productService") private ProductService productService;
    @Resource(name="pcCommonService") private CommonService pcCommonService;
    @Autowired
    TagService tagService;

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_CHANNEL_ON_PRODUCT;
	
    /**
     * @api {GET} /mobile/store/storeList.do
     * @apiName STORE 메인화면
     * @apiGroup Mobile STORE
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/mobile/store/storeList")
    public ModelAndView storeList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("DSP_MST_ENV", Code.USER_ENV_TYPE_MOBILE);
        //타임특가 팝업 이미지 사이즈
        commandMap.put("POPUP_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_LARGE);
        //타임특가 팝업 > 테마전시배너 공통코드
        commandMap.put("TIME_SALE_CMM_IDX", Code.COMMON_THEME_PRODUCT_TIME_POPUP);
        
        Map<String, Object> timeSalePopup = this.pcCommonService.selectTimeSalePopup(commandMap);
        mv.addObject("timeSalePopup", timeSalePopup);
        return mv;
    }

}
