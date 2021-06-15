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
import com.market.mall.am.vendor.service.VendorLoginManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.vendor.controller
 * @FileName : VendorLoginManagerController.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점상담 업체 관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorLoginManagerController {

	@Resource(name="vendorLoginManagerService")
	private VendorLoginManagerService vendorLoginManagerService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	/**
	 * <pre>
	 * 1. MethodName : vendorLoginManagerList
	 * 2. ClassName  : VendorLoginManagerController.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체관리 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/vendor/vendorLoginManagerList")
	public ModelAndView vendorLoginManagerList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int totalCount = this.vendorLoginManagerService.selectVendorLoginManagerListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if (totalCount > 0){
            // 입점상담 업체관리 목록
            list = this.vendorLoginManagerService.selectVendorLoginManagerList(commandMap);
        }
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping("/am/vendor/vendorLoginManagerForm")
    public ModelAndView vendorLoginManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("workDivisionList", this.commonService.selectCode("VENDOR_WORK_DIVISION_CODE")); //업무구분유형 리스트
        return mv;
    }
	
	/**
	 * <pre>
	 * 1. MethodName : vendorLoginManagerEdit
	 * 2. ClassName  : VendorLoginManagerController.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/vendor/vendorLoginManagerEdit")
	public ModelAndView vendorLoginManagerEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("VDR_LGN_IDX"),"")))
		{
			// 입점상담 업체 상세정보
        	Map<String, Object> resultMap = this.vendorLoginManagerService.selectVendorLoginManagerInfo(commandMap);
        	
        	mv.addObject("row", resultMap);
        	mv.addObject("commandMap", commandMap);
		}
		
		// 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("BUSINESS_CODE"));
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : sendVendorMemTempPwAjax
	* 2. ClassName  : VendorLoginManagerController.java
	* 3. Comment    : 관리자 > 입점업체 관리 > 입점상담 업체 상세정보 > 임시 비밀번호 발송 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
/*	@RequestMapping("/am/vendor/sendVendorMemTempPwAjax")
	public JSON sendVendorMemTempPwAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
        commandMap.put("VDR_LGN_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_LGN_UPD_ID", admin.getADM_MST_ID());
        
        // 임시 비밀번호 발송
        int result = this.vendorLoginManagerService.updateVendorMemTempPw(commandMap);
         
		if(result > 0)
		{
		    json.put("resultYn", "Y");           
		}
		else 
		{
			json.put("resultYn", "N");	
		}
         
        return json;
	}*/
	
	/**
	 * <pre>
	 * 1. MethodName : vendorLoginManagerModify
	 * 2. ClassName  : VendorLoginManagerController.java
	 * 3. Comment    : 관리자 > 입점업체 관리 > 입점상담 업체 수정 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/vendor/vendorLoginManagerModify")
	public ModelAndView vendorLoginManagerModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
        commandMap.put("VDR_LGN_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_LGN_UPD_ID", admin.getADM_MST_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("VDR_LGN_IDX"), "")))
        {
        	// 입점상담 업체 수정
            int result = this.vendorLoginManagerService.updateVendorLoginManager(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorLoginManagerList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorLoginManagerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
	}
}
