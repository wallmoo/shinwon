package com.market.mall.am.info;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.site.service.AuthManagerService;
import com.market.mall.am.site.service.BasicManagerService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class InfoController {
	
	@Resource(name="basicManagerService") 
    private BasicManagerService basicManagerService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="authManagerService")
    private AuthManagerService authManagerService;
    
    @Resource(name="vendorManagerService")
    private VendorManagerService vendorManagerService;
	
	/**
	* <pre>
	* 1. MethodName : managerInfoEdit
	* 2. ClassName  : InfoController.java
	* 3. Comment    : 관리자 정보 수정 폼 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 10. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/info/managerInfoEdit")
    public ModelAndView managerInfoEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String adminId = StringUtil.getString(admin.getADM_MST_ID(),"");

        if(!"".equals(adminId))
        {
        	commandMap.put("ADM_MST_ID", adminId);
        	
        	// Common Codes
            String[] codes = {"HP_CODE","TEL_CODE","EMAIL_DOMAIN_CODE","WORK_DIVISION_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));	
            
            // 권한 리스트
            mv.addObject("authList", this.authManagerService.selectAuthManagerList(commandMap));
            
            // 입점업체 리스트
            commandMap.put("searchVdrMstUseYn","Y");
            mv.addObject("vendorList", this.vendorManagerService.selectVendorManagerList(commandMap));
            
            // 관리자 상세 정보
            mv.addObject("row", this.basicManagerService.selectBasicManagerInfo(commandMap));
            
        }
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : managerInfoModify
	* 2. ClassName  : InfoController.java
	* 3. Comment    : 관리자 정보 수정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 10. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/info/managerInfoModify")
    public ModelAndView managerInfoModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String adminId = StringUtil.getString(admin.getADM_MST_ID(),"");
        
        if(!"".equals(adminId))
        {
        	commandMap.put("ADM_MST_ID", adminId);
            // 관리자 관리 관리자 수정
            int result = this.basicManagerService.updateBasicManager(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
            }
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/info/managerInfoEdit.do");
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }

}
