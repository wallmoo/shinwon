package com.market.mall.mobile.funding.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.model.Code;
import com.market.mall.pc.funding.service.FundingService;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.special.service.SpecialService;
import com.market.mall.pc.tag.service.TagService;

@Controller("mobileFundingController")
public class FundingController {
    
    @Resource(name="pcFundingService") FundingService pcFundingService;
    
    @Resource(name="productService") private ProductService productService;
	
    @Autowired
    TagService tagService;

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_CHANNEL_ON_PRODUCT;
	
    /**
     * @api {GET} /mobile/funding/fundingList.do
     * @apiName 펀딩 메인화면
     * @apiGroup Mobile 펀딩
     * 
     * @apiSuccess {Integer} totalCount 펀딩 상품 총 개수
     */
    @RequestMapping("/mobile/funding/fundingList")
    public ModelAndView fundingList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {POST} /mobile/funding/fundingView.do
     * @apiName 펀딩 상세화면
     * @apiGroup Mobile 펀딩
     * 
     * @apiSuccess {Object[]} productList 펀딩 상품 목록
     */
    @RequestMapping("/mobile/funding/fundingView")
    public ModelAndView fundingView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {POST} /mobile/funding/fundingIntendedView.do
     * @apiName 오픈예정펀딩 목록 화면
     * @apiGroup Mobile 펀딩
     * 
     * @apiSuccess {Object[]} productList 펀딩 상품 목록
     */
    @RequestMapping("/mobile/funding/fundingIntendedView")
    public ModelAndView fundingIntendedView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }

}
