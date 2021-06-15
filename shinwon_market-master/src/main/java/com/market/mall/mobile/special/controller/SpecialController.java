package com.market.mall.mobile.special.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.model.Code;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.special.service.SpecialService;
import com.market.mall.pc.tag.service.TagService;

@Controller("mobileSpecialController")
public class SpecialController {
    
    @Resource(name="pcSpecialService") SpecialService pcSpecialService;
    
    @Resource(name="productService") private ProductService productService;
	
    @Autowired
    TagService tagService;

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_CHANNEL_ON_PRODUCT;
	
    /**
     * @api {GET} /mobile/special/specialList.do
     * @apiName 스페셜 메인화면
     * @apiGroup Mobile 스페셜
     * 
     * @apiSuccess {Integer} totalCount 스페셜 상품 총 개수
     */
    @RequestMapping("/mobile/special/specialList")
    public ModelAndView specialList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {POST} /mobile/special/specialView.do
     * @apiName 스페셜 상세화면
     * @apiGroup Mobile 스페셜
     * 
     * @apiSuccess {Object[]} productList 스페셜 상품 목록
     */
    @RequestMapping("/mobile/special/specialView")
    public ModelAndView specialView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }

}
