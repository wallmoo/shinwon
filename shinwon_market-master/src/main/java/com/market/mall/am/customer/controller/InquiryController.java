package com.market.mall.am.customer.controller;

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
import com.market.mall.am.customer.service.InquiryService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.mail.service.MailService;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.util.MailSender;

/**
 * @PackageName: com.market.mall.am.customer.controller
 * @FileName : InquiryController.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 고객센터 > 1:1 문의를 처리하는 Controller Class
 * @author kanghk
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class InquiryController {
	
	@Resource(name="inquiryService") 
	private InquiryService inquiryService;

	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name="mailSendingService")
    private MailService mailService;
    /**
     * <pre>
     * 1. MethodName : inquiryList
     * 2. ClassName  : InquiryController.java
     * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 목록
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/board/inquiryList")
    public ModelAndView inquiryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  {
        ModelAndView mv = new ModelAndView();
        
        // 공통코드 1:1문의 commandMap에 담기
        commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_CUSTOMER);
        
        // 1:1 문의 목록 갯수
        int totalCount = this.inquiryService.selectInquiryListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 1:1 문의 목록
            list = this.inquiryService.selectInquiryList(commandMap);
        }
        
        // 문의 유형 코드 목록
        
        mv.addObject("inqTypeCodeList", this.commonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
        mv.addObject("advTypeCodeList", this.commonService.selectCode("MEM_ADV_TYPE_CODE"));
        
        mv.setViewName("/am/customer/inquiryList");
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : inquiryForm
    * 2. ClassName  : InquiryController.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 등록폼
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/inquiryForm")
    public ModelAndView inquiryForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
             
        mv.addObject("advTypeCodeList", this.commonService.selectCode("MEM_ADV_TYPE_CODE"));
        mv.addObject("inqTypeCodeList", this.commonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
        mv.addObject("strTypeCodeList", this.commonService.selectCode("MEM_ADV_CS_STR_CODE"));
        mv.addObject("itmTypeCodeList", this.commonService.selectCode("MEM_ADV_CS_ITM_CODE"));
        
        mv.addObject("commandMap", commandMap);
       
        mv.setViewName("/am/customer/inquiryForm");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : inquirySendSmsAjax
    * 2. ClassName  : InquiryController.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 > 답변처리 요청 SMS 발송
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/inquirySendSmsAjax")
    public JSON inquirySendSmsAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("SMS_HP1"), "")) &&
                !"".equals(StringUtil.getString(commandMap.get("SMS_HP2"), "")) &&
                !"".equals(StringUtil.getString(commandMap.get("SMS_HP3"), "")))
        {
            //sns 발송 부분
            json.put("message", "문자메시지가 발송되었습니다.");
        }
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : inquiryEdit
    * 2. ClassName  : InquiryController.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 수정폼
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/inquiryEdit")
    public ModelAndView inquiryEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_ADV_IDX"), "")))
        {
            Map<String, Object> dataMap = this.inquiryService.selectInquiryInfo(commandMap);

            // 1:1 문의 상세 정보
            mv.addObject("row", dataMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", dataMap.get("fileList"));
            
            // Common Codes
            String[] codes = {"ONE_TO_ONE_INQUIRY_TYPE_CODE","HP_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));
            mv.addObject("commandMap", commandMap);
            
        }
        mv.setViewName("/am/customer/inquiryEdit");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : inquiryModify
    * 2. ClassName  : InquiryController.java
    * 3. Comment    : 관리자 > 고객센터 > 1:1 문의 답변 수정
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/inquiryModify")
    public ModelAndView inquiryModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_ADV_IDX"), "")))
        {
        	int result = this.inquiryService.updateInquiry(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/inquiryList.do");
                mailService.sendInquiryMail(commandMap);
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/inquiryList.do");
            }
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }
    /**
     * <pre>
     * 1. MethodName : inquiryRegist
     * 2. ClassName  : InquiryController.java
     * 3. Comment    : 관리자 > 고객센터 > 고객상담 등록
     * 4. 작성자       : khcho
     * 5. 작성일       : 2016. 1. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/board/inquiryRegist")
     public ModelAndView inquiryRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         int result = this.inquiryService.insertInquiry(request, commandMap);
             
         // view Page Info
         if(result > 0)
         {
        	 mv.addObject("alertMsg", "등록 되었습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/inquiryList.do");
                 
         }
         else
         {
             mv.addObject("alertMsg", "등록에 실패하였습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/inquiryList.do");
         }
         
         mv.addObject("commandMap", commandMap);
         mv.setViewName("/am/common/result");
         return mv;
     }
}
