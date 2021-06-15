package com.market.mall.am.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;


/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : AuthManagerController.java
 * @Date : 2020. 05. 08
 * @프로그램 설명 : 관리자 > 회원관리 > 제휴사관리
 * @author 서덕희
 */

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AffiliateController {
    
    @Resource(name="affiliateService")
    private AffiliateService affiliateService;

    @Resource(name="commonService")
    private CommonService commonService;
    
     /**
    * <pre>
    * 1. MethodName : basicManagerList
    * 2. ClassName  : AuthManagerController.java
    * 3. Comment    : 관리자 > 회원관리 > 제휴사관리
    * 4. 작성자       : 서덕희
    * 5. 작성일       : 2020.05.08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    /**
     * @api {GET} /am/board/affiliateList
     * @apiName 제휴사 목록
     * @apiGroup 제휴사 리스트
     * 
     * @apiSuccess {Number} totalCount 총 갯수 
     * @apiSuccess {JSON} commandMap 
     * @apiSuccess {JSON} list  
     */
    @RequestMapping("/am/member/affiliateList")
     public ModelAndView affiliateList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
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
             mv.addObject("list", list);
         }
         else
         {
        	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
             
             mv.setViewName("/am/common/result");
         }
         
         mv.addObject("commandMap", commandMap);
         return mv;
     }
    @RequestMapping("/am/member/affiliateDetail")
    public ModelAndView affiliateDetail(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
            mv.addObject("info", this.affiliateService.selectInfoAffiliateDetail(commandMap));
        }
        else
        {
       	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/member/affiliateForm")
    public ModelAndView affiliateForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
            mv.addObject("commandMap", commandMap);
        }
        else
        {
       	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    @RequestMapping("/am/member/affiliateEdit")
    public ModelAndView affiliateEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if("admin".equals(admin.getADM_MST_ID()))
        {
            mv.addObject("commandMap", commandMap);
            this.affiliateService.updateAffiliate(commandMap);
        }
        else
        {
       	 	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/member/affiliateRegistSubmit")
    public ModelAndView affiliateRegistSubmit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	commandMap.put("COC_REG_ID", admin.getADM_MST_ID());
        	commandMap.put("COC_REG_IP", request.getRemoteAddr());
        	commandMap.put("COC_UDP_ID", admin.getADM_MST_ID());
        	commandMap.put("COC_UDP_IP", request.getRemoteAddr());
        	
        	this.affiliateService.insertAffiliate(commandMap);
            //mv.addObject("commandMap", commandMap);
            mv.addObject("alertMsg", "등록되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/affiliateList.do");
            mv.setViewName("/am/common/result");
        }
        else
        {
       	 mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/member/affiliateNameDupCheckAjax")
    public JSON affiliateNameDupCheckAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	json.put("count", Integer.toString(this.affiliateService.selectAffiliateNameCount(commandMap)));
        }
        else
        {
        	json.put("count", Integer.toString(-1));
        }
        return json;
    }
    
    @RequestMapping("/am/member/affiliateEditSubmit")
    public ModelAndView affiliateEditSubmit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        if("admin".equals(admin.getADM_MST_ID()))
        {
        	if(!commandMap.containsKey("COC_IDX")) {
        		mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
                mv.setViewName("/am/common/result");
                return mv;
        	}
        	commandMap.put("COC_UDP_ID", admin.getADM_MST_ID());
        	commandMap.put("COC_UDP_IP", request.getRemoteAddr());
        	this.affiliateService.updateAffiliate(commandMap);
            //mv.addObject("commandMap", commandMap);
            mv.addObject("alertMsg", "수정되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/affiliateList.do");
            mv.setViewName("/am/common/result");
        }
        else
        {
       	 	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/member/affiliateListExcelDownload")
    public ModelAndView affiliateListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	int totalCount = this.affiliateService.selectInfoAffiliateListCount(commandMap);
    	
    	Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
    	commandMap.put("excelDown", "Y");
    	
    	if(totalCount > 0)
        {
    		List<Map<String, Object>> dataList = null;
            
            String fileName = "affiliateList_"+DateUtil.getToday();
            
            String [] rowTitle = null;
            String [] cellSize = null;
            String [] dataName = null;
            String [] dataType = null;
            
            rowTitle = new String[]{"NO", "제휴사명", "스페셜코드", "제휴사설명","회원수","등록일","사용설정"};
            cellSize = new String[]{"20", "50", "30", "100", "40", "40", "40"};
            dataName = new String[]{"RNUM", "COC_NM", "COC_SPC_CD","COC_DES","COC_COUNT","COC_REG_DT","COC_USE_YN"};
            dataType = new String[]{"String","String", "String", "String","String","Date","String"};
                       	
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
            dataList = this.affiliateService.selectInfoAffiliateList(commandMap);
            
            if(dataList != null) {
            	//제휴사 목록 엑셀 다운로드
            	ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
            }
            
        }
        return null;
    }
}
