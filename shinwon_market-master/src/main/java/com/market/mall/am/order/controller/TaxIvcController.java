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
import com.market.mall.am.order.service.TaxIvcService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class TaxIvcController {
	
	@Resource(name="taxIvcService") 
    private TaxIvcService taxIvcService;    

	/**
	* <pre>
	* 1. MethodName : taxIvcList
	* 2. ClassName  : TaxIvcController.java
	* 3. Comment    : 세금계산서 신청관리 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 26.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/order/taxIvc/taxIvcList")
    public ModelAndView taxIvcList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchTaxIvcState", StringUtil.getString(commandMap.get("searchTaxIvcState"),"N")); //default 미발행 체크
        
        // 기본값 설정 - 검색 시작날짜 (today - 7)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        // 세금계산서 신청관리 목록 갯수
        int totalCount = this.taxIvcService.selectTaxIvcCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 세금계산서 신청관리 목록
            list = this.taxIvcService.selectTaxIvcList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : taxIvcInfoPopup
	* 2. ClassName  : TaxIvcController.java
	* 3. Comment    : 세금계산서 신청관리 상세
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/order/taxIvc/taxIvcInfoPopup")
    public ModelAndView taxIvcInfoPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> info =  this.taxIvcService.selectTaxIvcInfo(commandMap);
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("info", info);
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : taxIvcModify
	* 2. ClassName  : TaxIvcController.java
	* 3. Comment    : 세금계산서 수정
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/order/taxIvc/taxIvcModify")
    public ModelAndView taxIvcModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("TAX_IVC_IDX"), "")))
        {
        	Admin admin = SessionsAdmin.getSessionAdmin(request);
        	commandMap.put("TAX_IVC_UPD_ID", admin.getADM_MST_ID());
        	commandMap.put("TAX_IVC_UPD_IP", request.getRemoteAddr());
        	// 세금계산서 수정
            int result = this.taxIvcService.updateTaxIvc(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            
            mv.addObject("returnUrl", "/am/order/taxIvc/taxIvcInfoPopup.do");
            mv.addObject("commandMap", commandMap);
            // 부모창 새로고침 필요한가?
            //mv.addObject("parentFunction", "Y");
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
}
