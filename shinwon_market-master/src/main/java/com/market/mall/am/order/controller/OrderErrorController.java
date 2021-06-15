package com.market.mall.am.order.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.pc.cart.service.CartService;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OrderErrorController {
	
	@Resource(name="orderErrorService")
	private OrderErrorService orderErrorService;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource
	private CartService cartService;
	
	/**
	* <pre>
	* 1. MethodName : orderErrorList
	* 2. ClassName  : OrderErrorController.java
	* 3. Comment    : 결제오류조회 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/order/orderError/orderErrorList")
    public ModelAndView orderErrorList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기본값 설정 - 검색 시작날짜 (today - 7)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        // 결제오류조회 목록 갯수
        int totalCount = this.orderErrorService.selectOrdErrCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 결제오류조회 목록 
            list = this.orderErrorService.selectOrdErrList(commandMap);
        }
        
        // Common Codes
        mv.addObject("cardList", this.cartService.selectKiccCardList(commandMap));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
}
