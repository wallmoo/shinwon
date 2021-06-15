package com.market.mall.am.site.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.site.service.O2OStoreListService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class O2oStoreController {
    
    @Resource(name="o2oStoreListService") 
    private O2OStoreListService o2oStoreListService;
	
    @RequestMapping("/am/site/o2oStoreList")
    public ModelAndView o2oStoreList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
	     ModelAndView mv = new ModelAndView();
	     
	     Admin admin = SessionsAdmin.getSessionAdmin(request);
	     
	     if("admin".equals(admin.getADM_MST_ID()))
	     {
	    	// O2O 매장 목록
	         int totalCount = this.o2oStoreListService.selectO2OStoreListCount(commandMap);
	         
	         Paging paging = new Paging(totalCount, commandMap);
	         
	         List<Map<String, Object>> list = null;
	         if (totalCount > 0){
	             // 권한관리 목록
	             list = this.o2oStoreListService.selectO2OStoreList(commandMap);
	         }
	         
	         mv.addObject("totalCount", totalCount);
	         mv.addObject("commandMap", commandMap);
	         mv.addObject("list", list);
	         mv.addObject("paging", paging);
	     }
	     else
	     {
	    	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
	         mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
	         mv.setViewName("/am/common/result");
	     }
	     
	     return mv;
    }
    
    @RequestMapping("/am/site/o2oStoreListERPSync")
    public ModelAndView o2oStoreListERPSync(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	List<Map<String, Object>> parts = ErpRequest.requestPartInfo();    	
    	Map<String, Object> param = new HashMap<String, Object>();
    	param.put("parts", parts);
    	this.o2oStoreListService.deleteO2OStoreListAll();
    	this.o2oStoreListService.insertO2OStoreBatch(param);
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("alertMsg", "동기화 되었습니다.");
    	mv.addObject("returnUrl", "/am/site/o2oStoreList.do");
    	mv.addObject("commandMap", commandMap);
    	mv.setViewName("am/common/result");
    	return mv;
    }
    
    @RequestMapping("/am/site/o2oStoreEdit")
    public ModelAndView o2oStoreEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	Map<String, Object> storeInfo = this.o2oStoreListService.selectO2OStoreDetail(commandMap);
    	mv.addObject("storeInfo", storeInfo);
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    @RequestMapping("/am/site/o2oStoreModify")
    public ModelAndView o2oStoreModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	this.o2oStoreListService.updateOperateTime(commandMap);    	
    	mv.addObject("alertMsg", "수정 되었습니다.");
    	mv.addObject("returnUrl", "/am/site/o2oStoreEdit.do");
    	mv.addObject("commandMap", commandMap);
    	mv.setViewName("am/common/result");
    	return mv;
    }
}
