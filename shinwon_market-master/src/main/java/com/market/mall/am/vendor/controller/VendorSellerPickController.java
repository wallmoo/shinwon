package com.market.mall.am.vendor.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.vendor.service.VendorSellerPickService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.tag.TAG_MODEL;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorSellerPickController {

	@Resource(name="vendorSellerPickService")
	private VendorSellerPickService vendorSellerPickService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@RequestMapping("/am/vendor/vendorSellerPickList")
    public ModelAndView vendorSellerPickList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("Y".equals(StringUtil.getString(commandMap.get("admSellerCheckYN"),"")))
        {
        	//commandMap.put("CNT_MST_REG_ID", admin.getADM_MST_ID());
        	commandMap.put("VDR_MST_IDX", admin.getAUT_MST_IDX());
        }
        
        int totalCount = this.vendorSellerPickService.selectSellerPickListCount(request, commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
        List<Map<String, Object>> list = null;
        
        if (totalCount > 0){
            list = this.vendorSellerPickService.getSellerPickList(request, commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
	
	@RequestMapping("/am/vendor/vendorSellerPickForm")
    public ModelAndView vendorSellerPickForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        return mv;
    }
	
	@RequestMapping("/am/vendor/vendorSellerPickRegist")
    public ModelAndView vendorSellerPickRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 입점업체관리 > 셀러픽관리 관리자 등록
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK); //셀러픽 타입
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK); //셀러픽 타입
        int result = this.vendorSellerPickService.insertSellerPick((MultipartHttpServletRequest)request, commandMap);

        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorSellerPickList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorSellerPickList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
	
    @RequestMapping("/am/vendor/vendorSellerPickEdit")
    public ModelAndView vendorSellerPickEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 채널ON 관리 상세정보
            Map<String, Object> resultMap = this.vendorSellerPickService.selectSellerPickInfo(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            // 기본 정보
            mv.addObject("row",resultMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", resultMap.get("fileList"));
            
            // 상품구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
            
            // 태그 리스트
            mv.addObject("tagList", resultMap.get("tagList"));
        }
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/vendor/vendorSellerPickModify")
    public ModelAndView vendorSellerPickModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
        	
        	//System.out.println( "-----------------------------------" + StringUtil.getString(commandMap.get("CNT_MST_PC_BANNER"), ""));
        	//System.out.println( "-----------------------------------" + StringUtil.getString(commandMap.get("CNT_MST_PC_BANNER"), ""));
        	
        	
            // 관리자 수정
            int result = this.vendorSellerPickService.updateSellerPick((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorSellerPickList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorSellerPickList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
}
