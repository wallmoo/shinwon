package com.market.mall.am.site.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.member.service.AffiliateService;
import com.market.mall.am.site.service.MenuManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;
import com.market.util.DataAuthInfoUtil;
import com.market.util.ObjectToJsonUtil;


/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : AuthManagerController.java
 * @Date : 2014. 3. 25.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 권한관리 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AffiliatePointController {
    
	@Resource(name="affiliateService")
    private AffiliateService affiliateService;
    
    @Resource(name="menuManagerService")
    private MenuManagerService menuManagerService;

    @Resource(name="commonService")
    private CommonService commonService;
    
     /**
    * <pre>
    * 1. MethodName : basicManagerList
    * 2. ClassName  : AuthManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/member/affiliatePointList")
     public ModelAndView affiliatePointList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         
         if("admin".equals(admin.getADM_MST_ID()))
         {
        	 int totalCount = this.affiliateService.selectInfoAffiliateListCount(commandMap);
             
             Paging paging = new Paging(totalCount, commandMap);
             mv.addObject( "paging", paging );

             commandMap.put("startNum", paging.getStartNum());
             commandMap.put("endNum", paging.getEndNum());
             
             List<Map<String, Object>> list = null;
             if (totalCount > 0){
                 
                 // 권한관리 목록
                 list = this.affiliateService.selectInfoAffiliateList(commandMap);
             }
             
             mv.addObject("totalCount", totalCount);
             mv.addObject("commandMap", commandMap);
             mv.addObject("list", list);
         }
         else
         {
        	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
             
             mv.setViewName("/am/common/result");
         }
         
         return mv;
     }
    
    @RequestMapping("/am/member/affiliateListPopup")
    public ModelAndView affiliateListPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
            int totalCount = this.affiliateService.selectInfoAffiliateListCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap);
            mv.addObject( "paging", paging );

            commandMap.put("startNum", paging.getStartNum());
            commandMap.put("endNum", paging.getEndNum());
            
            List<Map<String, Object>> list = null;
            if (totalCount > 0){
                
                // 권한관리 목록
                list = this.affiliateService.selectInfoAffiliateList(commandMap);
            }
            
            mv.addObject("totalCount", totalCount);
            mv.addObject("commandMap", commandMap);
            mv.addObject("list", list);
        }
        else
        {
       	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
    
    @RequestMapping("/am/member/affiliatePointRegist")
    public ModelAndView affiliatePointRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {

        	
        }
        else
        {
       	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
    @RequestMapping("/am/member/affiliatePointDetail")
    public ModelAndView affiliatePointDetail(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	if(commandMap.containsKey("COC_IDX")) {
        		List<Map<String,Object>> list = this.affiliateService.slectPointList(commandMap);
            	JSONArray array = new JSONArray();
            	for(int i=0;i<list.size();i++) {
            		array.add(ObjectToJsonUtil.objectToJson(list.get(i)));
            	}
            	mv.addObject("masterDetail", ObjectToJsonUtil.objectToJson(this.affiliateService.selectInfoAffiliateDetail(commandMap)));
            	mv.addObject("pointList", array.toString());
        	}
        	
        }
        else
        {
       	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
    @RequestMapping("/am/member/affiliatePointDetailAjax")
    public JSON affiliateEditSubmit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	if(!commandMap.containsKey("COC_IDX")) {
        		json.put("code",""+(-1));
                return json;
        	}
        	json.put("masterDetail", this.affiliateService.selectInfoAffiliateDetail(commandMap));
        	json.put("pointList", this.affiliateService.slectPointList(commandMap));
        }
        else
        {
        	json.put("code",""+(-1));
        }
        return json;
    }
    @RequestMapping("/am/member/affiliatePointRegistAjax")
    public JSON affiliatePointRegistAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        List<Map<String,Object>> list = null;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	if(!commandMap.containsKey("COC_IDX") || !commandMap.containsKey("COC_COUNT")|| !commandMap.containsKey("COC_SPC_PRV_PT")) {
        		json.put("code",""+(-1));
                return json;
        	}
        	commandMap.putAll(DataAuthInfoUtil.getAdminAuthInfoInstance(request,"COC_SPC_"));
        	int result = this.affiliateService.insertAffiliatePoint(commandMap);
        	if(result>0) {
        		list =  this.affiliateService.selectInfoAffiliatePointList(commandMap);
        	}
        	
        	json.put("code",""+result);
        	json.put("list",list);
        }
        else
        {
        	json.put("code",""+(-1));
        }
        return json;
    }
    @RequestMapping("/am/member/affiliatePointDelete")
    public ModelAndView affiliatePointDelete(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	this.affiliateService.deleteAffiliatePoint(commandMap);
        	mv.addObject("alertMsg", "삭제되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/affiliatePointList.do");
        }
        else
        {
       	 	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    @RequestMapping("/am/member/affiliatePointModify")
    public ModelAndView affiliatePointModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	this.affiliateService.updateAffiliatePoint(commandMap);
        	mv.addObject("alertMsg", "수정되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/affiliatePointList.do");
        }
        else
        {
       	 	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    @RequestMapping("/am/member/affiliatePointListExcelDownload") 
    public ModelAndView affiliatePointListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	 
        commandMap.put("excelDown", "Y"); 
        int totalCount = this.affiliateService.selectInfoAffiliateListCount(commandMap);
        
        if(totalCount > 0){
        	List<Map<String, Object>> list = null;
        	 
           String fileName = "affiliatePointList_"+DateUtil.getToday();
           
           String [] rowTitle = { "제휴사명","스페셜개인코드발급수", "지급수","등록일","사용설정(Y/N)"};
           String [] dataName = { "COC_NM" ,"COC_SPC_LMT","COC_COUNT" , "COC_REG_DT","COC_USE_YN"} ;
           String [] cellSize = {"50" , "50" , "50" , "50", "50"};
           String [] dataType = {"String","String","String","String","String"};            
           
           ArrayList<String> dataTypeList = new ArrayList<String>();
           ArrayList<String> cellSizeList = new ArrayList<String>();
           /*
           for(int i=0;i<rowTitle.length;i++) {
           	cellSizeList.add("50");
           	dataTypeList.add("String");
           }
           String [] dataType = (String[]) dataTypeList.toArray();
           String [] cellSize = (String[]) cellSizeList.toArray();
           */
           
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
           
        	//list = this.infoMemberService.selectInfoMemberList(commandMap);  // 엑셀다운로드
        	list = this.affiliateService.selectInfoAffiliateListExcel(commandMap);  // 엑셀다운로드         	
        	
        	
        	if(list != null){
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
}
