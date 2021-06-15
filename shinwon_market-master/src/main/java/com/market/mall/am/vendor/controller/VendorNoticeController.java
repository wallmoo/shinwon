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
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.vendor.service.VendorNoticeService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;

/**
 * @PackageName: com.market.mall.am.vendor.controller
 * @FileName : VendorNoticeController.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점업체 공지사항을 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorNoticeController {

    @Resource(name="vendorNoticeService") 
    private VendorNoticeService vendorNoticeService; 
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : vendorNoticeList
     * 2. ClassName  : VendorNoticeController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체공지사항 목록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorNoticeList")
    public ModelAndView vendorNoticeList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //상단공지 리스트 먼저 가져오기
        commandMap.put("SCM_NTS_TOP_YN", "Y");
        List<Map<String, Object>> topList = this.vendorNoticeService.selectVendorNoticeList(commandMap);
        
        // 공지사항 목록 갯수
        commandMap.put("SCM_NTS_TOP_YN", "N");
        int totalCount = this.vendorNoticeService.selectVendorNoticeListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 공지사항 목록
            list = this.vendorNoticeService.selectVendorNoticeList(commandMap);
        }
        
        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("COMMON_NOTICE_TYPE"));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("topList", topList);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorNoticeForm
     * 2. ClassName  : VendorNoticeController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 등록 폼 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorNoticeForm")
    public ModelAndView vendorNoticeForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX == -1){ //슈퍼 관리자인 경우
            // 구분 코드 리스트
            mv.addObject("codeList", this.commonService.selectCode("COMMON_NOTICE_TYPE"));
            mv.addObject("commandMap", commandMap);
            
        }
        return mv;

    }
    
    /**
     * <pre>
     * 1. MethodName : vendorNoticeEdit
     * 2. ClassName  : VendorNoticeController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 수정 폼
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorNoticeEdit")
    public ModelAndView vendorNoticeEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("SCM_NTS_IDX"), "")))
        {
            // 공지사항 상세정보
            Map<String, Object> resultMap = this.vendorNoticeService.selectVendorNoticeInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
        }

        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("COMMON_NOTICE_TYPE"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorNoticeRegist
     * 2. ClassName  : VendorNoticeController.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 공지사항 등록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorNoticeRegist")
    public ModelAndView vendorNoticeRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        
        if(ADM_MST_SUB_IDX > 1){ //입점업체 관리자인 경우
            mv.addObject("alertMsg", "등록 권한이 없습니다.");
            return mv;
        }
        // 공지사항 등록
        int result = this.vendorNoticeService.insertVendorNotice((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorNoticeList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorNoticeList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorNoticeModify
     * 2. ClassName  : VendorNoticeController.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 수정
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorNoticeModify")
    public ModelAndView vendorNoticeModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("SCM_NTS_IDX"), "")))
        {
         // 공지사항 수정
            int result = this.vendorNoticeService.updateVendorNotice((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorNoticeList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorNoticeList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : vendorNoticeTopCountAjax
     * 2. ClassName  : VendorNoticeController.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 상단공지 사용 가능 유무
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/vendor/vendorNoticeTopCountAjax")
    public JSON vendorNoticeTopCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        int result = this.vendorNoticeService.selectVendorNoticeTopCount(commandMap); //상단공지 개수
        
        if(result > 5)
        {
            json.put("resultYn", "N");           
        }
        else if(result == 5)
        {
         json.put("resultYn", "F");     //FULL
        }
        else 
        {
            json.put("resultYn", "Y");  
        }
        return json;
    }
}
