package com.market.mall.mobile.event.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.market.mall.model.Code;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.tag.service.TagService;

@Controller("mobileTimeSaleController")
public class TimeSaleController {
	
   @Resource(name="productListService")    
    private ProductListService productListService;
	
    @Autowired
    TagService tagService;
	
	private final static String [] _PRODUCT_LIST_ORDER_ = 
	{ 
		"", "ORD ASC", "PRD_MST_REG_DT DESC", "PRD_MST_CONSUM ER_PRICE DESC", "PRD_MST_CONSUMER_PRICE ASC",
		"REP_POINT DESC", 
    	"FLAT_PRICE_YN DESC, PROD_PERAMT1 DESC",
    	"PRD_MST_CD ASC"			
	};
	
	private final static int _PLAN_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE;
	
	/**
	 * @api {GET} /mobile/event/timeSaleList.do
	 * @apiName 타임세일 메인화면
	 * @apiGroup Mobile 타임세일
	 * 
	 *
	 * @apiSuccess {Integer} totalCount 타임 세일 상품 총 개수
	 */
	@RequestMapping("/mobile/event/timeSaleList")
    public ModelAndView timeSaleList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
        ModelAndView mv = new ModelAndView();
        
        return mv;
    }
	
	/**
     * @api {GET} /mobile/event/timeSaleView.do
     * @apiName 타임세일 상세화면
     * @apiGroup Mobile 타임세일
     * 
     * @apiSuccess {Object[]} productList 타임세일 상품 목록
     */
    @RequestMapping("/mobile/event/timeSaleView")
    public ModelAndView timeSaleView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        
        return mv;
    }

}
