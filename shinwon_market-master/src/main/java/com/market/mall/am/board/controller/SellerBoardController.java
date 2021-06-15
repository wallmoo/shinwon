package com.market.mall.am.board.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.customer.service.ProductInquiryService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SellerBoardController {
    
    @Resource(name="commonService")
    private CommonService commonService;
    @Resource(name="productInquiryService")
	private ProductInquiryService productInquiryService;

    @RequestMapping("/am/board/sellerInquiryList")
    public ModelAndView sellerInquiryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();

        commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_SELLER);
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        // 상품 문의 목록 갯수
        int totalCount = this.productInquiryService.selectSellerInquiryListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        
        if (totalCount > 0){
            // 상품 문의 목록
            list = this.productInquiryService.selectSellerInquiryList(commandMap);
        }
               
        mv.setViewName("/am/board/sellerInquiryList");
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    @RequestMapping("/am/board/sellerInquiryRegist")
    public ModelAndView sellerInquiryRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
        {
            int result = this.productInquiryService.updateProductInquiry(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do");
            }
        }
        mv.addObject("commandMap", commandMap);
        mv.setView(new RedirectView("/am/board/sellerInquiryList.do"));
        return mv;
    }
    
    @RequestMapping("/am/board/sellerInquiryRegistAjax")
    public JSON sellerInquiryRegistAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
    	int result = 0;
    	if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), ""))) {
    		
    		result = this.productInquiryService.updateProductInquiry(request, commandMap);
    	
        	if(result > 0) {
        		//알림톡 발송
        		json.put("result", "SUCCESS");
        		json.put("returnURL", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do" );
        	}else {
        		json.put("result", "FAIL");
        		json.put("returnURL", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do" );
        	}
    	}
        return json;
    }
    
    @RequestMapping("/am/board/sellerInquiryEdit")
    public ModelAndView sellerInquiryEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        Calendar cal = Calendar.getInstance();
        Date now = new Date();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
        {
            //입점업체일 경우 입점업체로만 검색
            String serverName = request.getServerName().toString();
            if(serverName.indexOf("scm") >= 0){
            	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()) {
            		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
            	}
            }
            
            Map<String, Object> dataMap = this.productInquiryService.selectSellerInquiryInfo(commandMap);
            
            Map<String, Object> row = (Map<String, Object>)dataMap.get("row");
            
            String regDate = StringUtil.getString(row.get("BRD_INQ_REG_DT"),"");
            
            Date regDT = new SimpleDateFormat("yyyyMMddHHmmss").parse(regDate);
        	cal.setTime(regDT);
        	cal.add(Calendar.HOUR_OF_DAY, 24);
            
            Date onedayLater = cal.getTime();
            //등록일+1일 지났는지 비교
            int compareDT = now.compareTo(onedayLater);
            if(compareDT >= 0) {
            	mv.addObject("pushAlarmYN", "Y");
            }
            
            // 상품 문의 상세 정보
            mv.addObject("row", dataMap.get("row"));
            mv.addObject("commandMap", commandMap);
            
        }
        return mv;
    }
    
   
}
