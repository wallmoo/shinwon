package com.market.mall.am.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.site.service.AuthManagerService;
import com.market.mall.am.site.service.BasicManagerService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;


/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : BasicManagerController.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 관리자 관리를 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BasicManagerController {
    
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
    * 1. MethodName : basicManagerList
    * 2. ClassName  : BasicManager.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 목록 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/basicManagerList")
    public ModelAndView basicManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 권한 리스트
        commandMap.put("searchAutMstState","Y");
        mv.addObject("authList", this.authManagerService.selectAuthManagerList(commandMap));
        
        // 관리자 관리 목록 갯수
        int totalCount = this.basicManagerService.selectBasicManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            
            // 관리자 관리 목록
            list = this.basicManagerService.selectBasicManagerList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicManagerForm
    * 2. ClassName  : BasicManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 등록 폼 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    /**
     * @api {GET} /am/site/basicManagerForm.do
     * @apiName 관리자계정 등록 화면
     * @apiGroup SB시스템관리
     * 
     * @apiSuccess {Object} codes {HP_CODE:핸드폰 앞자리  코드, TEL_CODE:국번 코드, EMAIL_DOMAIN_CODE:이메일 도메인 코드, WORK_DIVISION_CODE:업무구분 코드}
     * @apiSuccess {Object[]} authList 관리자 권한 리스트 [{AUT_MST_IDX : 권한 IDX, AUT_MST_NM : 권한명 , AUT_MST_STATE: 권한상태}]
     * @apiSuccess {Object[]} vendorList 입점업체 리스트  [{VDR_MST_IDX : 입점업체IDX , VDR_MST_NM : 입점업체명}]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping("/am/site/basicManagerForm")
    public ModelAndView basicManagerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // Common Codes
        String[] codes = {"HP_CODE","TEL_CODE","EMAIL_DOMAIN_CODE","WORK_DIVISION_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        
        // 권한 리스트
        commandMap.put("searchAutMstState","Y");
        mv.addObject("authList", this.authManagerService.selectAuthManagerList(commandMap));
        
        // 입점업체 리스트
        commandMap.put("searchVdrMstUseYn","Y");
        mv.addObject("vendorList", this.vendorManagerService.selectVendorManagerList(commandMap));
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicManagerIdCheckAjax
    * 2. ClassName  : BasicManagerController.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 아이디 중복 체크   
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/site/basicManagerIdCheckAjax")
    public JSON basicManagerIdCheckAjax(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
        JSON json = new JSON();
         if(!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), "")))
         {
             // 아이디 중복 체크
             int idCount = this.basicManagerService.selectBasicManagerIdCheckCount(commandMap);
             
             if( idCount > 0)
             {
                 json.put("resultYn", "N");
             }
             else
             {
                 json.put("resultYn", "Y");
             }
             json.put("successYn", "Y");
         }
         else 
         {
             json.put("successYn", "N");
         }
         
         return json;
     }
    
    /**
     * <pre>
     * 1. MethodName : basicManagerRegist
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 등록 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    /**
     * @api {POST} /am/site/basicManagerRegist.do
     * @apiName 관리자계정 등록 처리
     * @apiGroup SB시스템관리
     * 
     * @apiParam {String} ADM_MST_ID 아이디
     * @apiParam {String} ADM_MST_NM 이름 
     * @apiParam {String} ADM_MST_PWD 비밀번호
     * @apiParam {String} AUT_MST_IDX 관리자권한
     * @apiParam {String} ADM_MST_SUB_IDX 입점업체관리 IDX
     * @apiParam {String} ADM_MST_ERP_VDR_IDX 입점업체 매장 선택시 매장IDX
     * @apiParam {String} ADM_MST_ERP_NO 사원번호 
     * @apiParam {String} ADM_MST_HP1 휴대폰1 
     * @apiParam {String} ADM_MST_HP2 휴대폰2
     * @apiParam {String} ADM_MST_HP3 휴대폰3
     * @apiParam {String} ADM_MST_TEL1 전화번호1
     * @apiParam {String} ADM_MST_TEL2 전화번호2 
     * @apiParam {String} ADM_MST_TEL3 전화번호3
     * @apiParam {String} ADM_MST_EMAIL_ID 이메일ID
     * @apiParam {String} ADM_MST_EMAIL_DOMAIN 이메일도메인
     * @apiParam {String} ADM_MST_TYPE 업무구분
     * @apiParam {String} ADM_MST_STATE 사용여부
     * 
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 성공/실패시 RETURN URL
     */
    @RequestMapping("/am/site/basicManagerRegist")
    public ModelAndView basicManagerRegist(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), "")))
        {
            // 관리자 관리 관리자 등록
            int result = this.basicManagerService.insertBasicManager(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/basicManagerList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/basicManagerList.do");
            }
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : basicManagerEdit
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 수정 폼  
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/site/basicManagerEdit")
     public ModelAndView basicManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         if(!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), "")))
         {
             // Common Codes
             String[] codes = {"HP_CODE","TEL_CODE","EMAIL_DOMAIN_CODE","WORK_DIVISION_CODE"};
             mv.addObject("codes", this.commonService.selectCodes(codes));	
             
             // 권한 리스트
             commandMap.put("searchAutMstState","Y");
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
     * 1. MethodName : basicManagerModify
     * 2. ClassName  : BasicManagerController.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 수정
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     /**
      * @api {POST} /am/site/basicManagerModify.do
      * @apiName 관리자계정 수정 처리
      * @apiGroup SB시스템관리
      * 
      * @apiParam {String} ADM_MST_NM 이름 
      * @apiParam {String} ADM_MST_PWD 비밀번호
      * @apiParam {String} AUT_MST_IDX 관리자권한
      * @apiParam {String} ADM_MST_SUB_IDX 입점업체관리 IDX
      * @apiParam {String} ADM_MST_ERP_VDR_IDX 입점업체 매장 선택시 매장IDX
      * @apiParam {String} ADM_MST_HP1 휴대폰1 
      * @apiParam {String} ADM_MST_HP2 휴대폰2
      * @apiParam {String} ADM_MST_HP3 휴대폰3
      * @apiParam {String} ADM_MST_TEL1 전화번호1
      * @apiParam {String} ADM_MST_TEL2 전화번호2 
      * @apiParam {String} ADM_MST_TEL3 전화번호3
      * @apiParam {String} ADM_MST_EMAIL_ID 이메일ID
      * @apiParam {String} ADM_MST_EMAIL_DOMAIN 이메일도메인
      * @apiParam {String} ADM_MST_TYPE 업무구분
      * @apiParam {String} ADM_MST_STATE 사용여부
      * 
      * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
      * @apiSuccess {String} returnUrl 등록 성공/실패시 RETURN URL
      */
    @RequestMapping("/am/site/basicManagerModify")
    public ModelAndView basicManagerModify(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("ADM_MST_ID"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.basicManagerService.updateBasicManager(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/basicManagerEdit.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/basicManagerEdit.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    
    
    

	@RequestMapping("/am/site/basicManagerDeleteList")
	public ModelAndView basicManagerDeleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		
        String[] array =  StringUtil.getArray(commandMap, "targetAdmList");
        commandMap.put("ADMIN_LIST", array);
        
		
		int result = this.basicManagerService.deleteBasicManager(request, commandMap);

		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "삭제 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/basicManagerList.do");
        }
        else  
        {
            mv.addObject("alertMsg", "삭제 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/basicManagerList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
		return mv;
	}

    
    
    
    
    
    
    
    
    
}
