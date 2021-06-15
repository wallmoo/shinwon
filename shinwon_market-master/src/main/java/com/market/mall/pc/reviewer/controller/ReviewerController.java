package com.market.mall.pc.reviewer.controller;

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
import com.market.mall.pc.reviewer.service.ReviewerService;
import com.market.mall.pc.tag.service.TagService;

@Controller("pcReviewerController")
public class ReviewerController {
    
    @Resource(name="pcReviewerService") ReviewerService pcReviewerService;
    
    @Resource(name="productService") private ProductService productService;
	
    @Autowired
    TagService tagService;

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_CHANNEL_ON_PRODUCT;
	
    /**
     * @api {GET} /pc/reviewer/reviewerList.do
     * @apiName 리뷰어 메인화면
     * @apiGroup 리뷰어
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/reviewer/reviewerList")
    public ModelAndView reviewerList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/reviewer/reviewerView.do
     * @apiName 리뷰어 상세화면
     * @apiGroup 리뷰어
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/reviewer/reviewerView")
    public ModelAndView reviewerView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }
    
    /**
     * @api {GET} /pc/reviewer/reviewerForm.do
     * @apiName 리뷰어 등록화면
     * @apiGroup 리뷰어
     * 
     * @apiSuccess {Integer} totalCount 상품 총 개수
     */
    @RequestMapping("/pc/reviewer/reviewerForm")
    public ModelAndView reviewerForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();

        return mv;
    }

}
