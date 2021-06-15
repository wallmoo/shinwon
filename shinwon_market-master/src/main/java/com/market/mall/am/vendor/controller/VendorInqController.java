package com.market.mall.am.vendor.controller;

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
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.am.vendor.service.VendorInqService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

/**
 * @PackageName: com.market.mall.am.vendor.controller
 * @FileName : VendorInqController.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점업체 문의사항을 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorInqController {
    
    @Resource(name="vendorInqService") 
    private VendorInqService vendorInqService;

    @Resource(name="vendorManagerService")
    private VendorManagerService vendorManagerService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : vendorInqList
     * 2. ClassName  : VendorInqController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 문의사항 목록 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/vendor/vendorInqList")
    public ModelAndView vendorInqList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        // 입점업체 문의 목록 갯수
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0)
        {
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		// 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
        	}
        }
    	totalCount = this.vendorInqService.selectVendorInqListCount(commandMap);
    	paging = new Paging(totalCount, commandMap);
        
        if (totalCount > 0)
        {
            // 입점업체 문의 목록
            list = this.vendorInqService.selectVendorInqList(commandMap);
        }
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        // 문의 유형 코드 목록
        mv.addObject("inqTypeCodeList", this.commonService.selectCode("VENDOR_INQUIRY_TYPE_CODE"));
        
        mv.setViewName("/am/vendor/vendorInqList");
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorInqForm
     * 2. ClassName  : VendorInqController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 문의사항 답변 등록 폼 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorInqForm")
    public ModelAndView vendorInqForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //입점업체일경우 문의 내용 등록
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		mv.addObject("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		// 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
        	}
        }
        
        if(!"".equals(StringUtil.getString(commandMap.get("SCM_INQ_IDX"), "")))
        {
            Map<String, Object> dataMap = this.vendorInqService.selectVendorInqInfo(commandMap);

            // 1:1 문의 상세 정보
            mv.addObject("row", dataMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", dataMap.get("fileList"));
            
            // Common Codes
            String[] codes = {"VENDOR_INQUIRY_TYPE_CODE","HP_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));
            
            
        }
        // 문의 유형 코드 목록
        mv.addObject("inqTypeCodeList", this.commonService.selectCode("VENDOR_INQUIRY_TYPE_CODE"));
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/vendor/vendorInqForm");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorInqRegist
     * 2. ClassName  : VendorInqController.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 문의사항 등록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorInqRegist")
    public ModelAndView vendorInqRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        // 공지사항 등록
        int result = this.vendorInqService.insertVendorInqToEtland((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorInqList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorInqList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorInqEdit
     * 2. ClassName  : VendorInqController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 문의사항 답변 수정 폼
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorInqEdit")
    public ModelAndView vendorInqEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("SCM_INQ_IDX"), "")))
        {
            Map<String, Object> dataMap = this.vendorInqService.selectVendorInqInfo(commandMap);

            // 1:1 문의 상세 정보
            mv.addObject("row", dataMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", dataMap.get("fileList"));
            
            // Common Codes
           /* String[] codes = {"VENDOR_INQUIRY_TYPE_CODE","HP_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));*/
            mv.addObject("commandMap", commandMap);
            
        }
        mv.setViewName("/am/vendor/vendorInqEdit");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorInqModify
    * 2. ClassName  : VendorInqController.java
    * 3. Comment    : 관리자 > 입점업체관리 > 입점업체문의사항 답변 수정
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 11.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    /**
     * <pre>
     * 1. MethodName : vendorInqModify
     * 2. ClassName  : VendorInqController.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 문의사항 답변 등록/수정 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorInqModify")
    public ModelAndView vendorInqModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("SCM_INQ_IDX"), "")))
        {
            int result = this.vendorInqService.updateVendorInq(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorInqList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorInqList.do");
            }
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }
    
}
