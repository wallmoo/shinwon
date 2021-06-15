package com.market.mall.am.display.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DataConvertUtil;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.display.service.VendorDisplayService;
import com.market.mall.am.vendor.service.impl.VendorSellerPickServiceImpl;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.pc.tag.service.TagService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.display.controller
 * @FileName : VendorDisplayController.java
 * @Date : 2016. 2. 17.
 * @프로그램 설명 : 입점업체 상품상세 공지를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorDisplayController {
	
private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="vendorDisplayService")
    private VendorDisplayService vendorDisplayService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="vendorSellerPickService")
    private VendorSellerPickServiceImpl vendorSellerPickService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    @Autowired
    private TagService tagService;
    
    /**
    * <pre>
    * 1. MethodName : productDisplayView
    * 2. ClassName : VendorDisplayController.java
    * 3. Comment : 입점업체 공통전시 상세
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 17.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/vendorDisplayView")
    public ModelAndView productDisplayView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       
		ModelAndView mv = new ModelAndView();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX()); //입점업제 IDX
		
		//입점업체 공통전시 상세
		Map<String, Object> vendorInfo = this.vendorDisplayService.selectVendorDisplayInfo(commandMap);
		
		mv.addObject("vendorInfo", vendorInfo);
		mv.addObject("commandMap", commandMap);
		return mv;
    }
    
    @RequestMapping("/am/display/modifySellerPick")
    public ModelAndView sellerPickModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
 		if(!SessionsAdmin.isLoginAdmin(request)) {
 			mv.addObject("alertMsg", "권한이 없습니다");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/manager/login.do");
            mv.setViewName("/am/common/result");
 			return mv;
 		}
 		Admin admin = SessionsAdmin.getSessionAdmin(request); 		
 		return mv;
    }
    
    
    @RequestMapping("/am/display/sellerPickList")
    public ModelAndView sellerPickListView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       
    	ModelAndView mv = new ModelAndView();
 		if(!SessionsAdmin.isLoginAdmin(request)) {
 			mv.addObject("alertMsg", "권한이 없습니다");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/manager/login.do");
            mv.setViewName("/am/common/result");
 			return mv;
 		}
 		Admin admin = SessionsAdmin.getSessionAdmin(request);
 		commandMap.put("ADM_MST_ID", admin.getADM_MST_ID());

        int totalCount = this.vendorSellerPickService.selectSellerPickListCount(request, commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
 		
 		//commandMap.put("startNum", StringUtil.getString(commandMap.get("startNum"),"1"));
    	//commandMap.put("endNum", StringUtil.getString(commandMap.get("endNum"),"20"));
 		mv.addObject("list",this.vendorSellerPickService.getSellerPickList(request, commandMap));
 		mv.addObject("commandMap",commandMap);
 		mv.addObject("isVendorUserPage",true);
 		mv.addObject("sellerPickDetailUrl",StringUtil.getString(request.getAttribute("serverDomain"), "")+"/am/display/sellerPickDetail.do");
 		return mv;
    }
    
    @RequestMapping("/am/display/sellerPickForm")
    public ModelAndView sellerPickForm(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
    
    @RequestMapping("/am/display/sellerPickDetail")
    public ModelAndView sellerPickDetailView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
 		ModelAndView mv = new ModelAndView();
 		if(!SessionsAdmin.isLoginAdmin(request) || !commandMap.containsKey("CNT_MST_IDX")) {
 			mv.addObject("alertMsg", "권한이 없습니다");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/manager/login.do");
            mv.setViewName("/am/common/result");
 			return mv;
 		}
 		
 		mv.addObject("fileList",this.vendorDisplayService.selectVendorDisplayFileList(commandMap));
 		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT);
 		mv.addObject("sellerPickInfo",this.vendorSellerPickService.getSellerPickDetail(request, commandMap));
 		mv.addObject("sellerPickProductInfo",this.vendorSellerPickService.getSellerPickProduct(request, commandMap));
 		commandMap.put("TAG_BND_ID", commandMap.get("CNT_MST_IDX").toString());
 		commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
 		mv.addObject("bindedTagList", this.tagService.selectTagListById(commandMap));
 		mv.addObject("commandMap",commandMap);
 		return mv;
    }
     
    /**
    * <pre>
    * 1. MethodName : vendorDisplayModify
    * 2. ClassName : VendorDisplayController.java
    * 3. Comment : 입점업체 공통전시 등록 및 수정
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 17.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/display/vendorDisplayModify")
    public ModelAndView vendorDisplayModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       
		ModelAndView mv = new ModelAndView();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX()); //입점업제 IDX
		
		//기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("VDR_DSP_REG_IP", request.getRemoteAddr());
        commandMap.put("VDR_DSP_REG_ID", admin.getADM_MST_ID());
        commandMap.put("VDR_DSP_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_DSP_UPD_ID", admin.getADM_MST_ID());
		
		//입점업체 등록 여부
		
		int totalCount = this.vendorDisplayService.selectVendorDisplayCount(commandMap);
		
		int result = 0;
		
		if(totalCount > 0){//이미 등록
			result = this.vendorDisplayService.updateVendorDisplay(request, commandMap);
		}else{
			result = this.vendorDisplayService.insertVendorDisplay(request, commandMap);
		}
		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorDisplayView.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/display/vendorDisplayView.do");
        }
		
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/result");
		return mv;
    }

}
