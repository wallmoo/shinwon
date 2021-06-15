package com.market.mall.am.customer.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
import com.market.mall.am.customer.service.ProductInquiryService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.mail.service.MailService;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.customer.controller
 * @FileName : ProductInquiryController.java
 * @Date : 2015. 4. 10.
 * @프로그램 설명 : 관리자 > 고객센터 > 상품 문의를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ProductInquiryController {

	@Resource(name="productInquiryService")
	private ProductInquiryService productInquiryService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	
	@Resource(name="mailSendingService") 
	protected MailService mailService;
	
	/**
	* <pre>
	* 1. MethodName : productInquiryList
	* 2. ClassName : ProductInquiryController.java
	* 3. Comment : 관리자 > 고객센터 > 상품 문의 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/board/productInquiryList")
    public ModelAndView productInquiryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  {
        ModelAndView mv = new ModelAndView();
        
    	// 공통코드 상품 문의 commandMap에 담기
        commandMap.put("BRD_INQ_TYPE", Code.BOARD_INQ_TYPE_PRODUCT);
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        // 상품 문의 목록 갯수
        int totalCount = this.productInquiryService.selectProductInquiryListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        
        if (totalCount > 0){
            // 상품 문의 목록
            list = this.productInquiryService.selectProductInquiryList(commandMap);
        }
               
        mv.setViewName("/am/customer/productInquiryList");
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : productInquiryForm
	* 2. ClassName : ProductInquiryController.java
	* 3. Comment : 관리자 > 고객센터 > 상품 문의 답변 등록폼
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/board/productInquiryForm")
    public ModelAndView productInquiryForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Calendar cal = Calendar.getInstance();
        Date now = new Date();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
        {
            Map<String, Object> dataMap = this.productInquiryService.selectProductInquiryInfo(commandMap);

            // 상품 문의 상세 정보
            mv.addObject("row", dataMap.get("row"));
            
            Map<String, Object> row = (Map<String, Object>)dataMap.get("row");
            String regDate = StringUtil.getString(row.get("BRD_INQ_REG_DT"),"");
            
            Date regDT = new SimpleDateFormat("yyyyMMddHHmmss").parse(regDate);
        	cal.setTime(regDT);
        	cal.add(Calendar.HOUR_OF_DAY, 24);
            
            Date onedayLater = cal.getTime();
            //등록일+1일 지났는지 비교
            int compareDT = now.compareTo(onedayLater);
            if(compareDT >= 0) {
            	mv.addObject("pushAlarmYN", "Y");
            }
            // 첨부파일 목록
            //mv.addObject("fileList", dataMap.get("fileList"));
            
            // Common Codes
            String[] codes = {"ONE_TO_ONE_INQUIRY_TYPE_CODE","HP_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));
            mv.addObject("commandMap", commandMap);
            
        }
        
        mv.setViewName("/am/customer/productInquiryForm");
        
        return mv;
    }
	
    /**
    * <pre>
    * 1. MethodName : productInquiryRegist
    * 2. ClassName : ProductInquiryController.java
    * 3. Comment : 관리자 > 고객센터 > 상품문의 답변 등록 
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/productInquiryRegist")
    public ModelAndView productInquiryRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
        {
            int result = this.productInquiryService.updateProductInquiry(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
            	mailService.sendInquiryMail(commandMap);
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do");
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do");
            }
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : productInquirySendSmsAjax
    * 2. ClassName : ProductInquiryController.java
    * 3. Comment : 관리자 > 고객센터 > 상품 문의 답변 > 답변처리 요청 SMS 발송
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/productInquirySendSmsAjax")
    public JSON productInquirySendSmsAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
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
    * 1. MethodName : productInquiryEdit
    * 2. ClassName : ProductInquiryController.java
    * 3. Comment : 관리자 > 고객센터 > 상품 문의 답변 수정폼
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/productInquiryEdit")
     public ModelAndView productInquiryEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
         {
             Map<String, Object> dataMap = this.productInquiryService.selectProductInquiryInfo(commandMap);
             
             // 상품 문의 상세 정보
             mv.addObject("row", dataMap.get("row"));
             
             // 첨부파일 목록
             //mv.addObject("fileList", dataMap.get("fileList"));
             
             // Common Codes
             String[] codes = {"ONE_TO_ONE_INQUIRY_TYPE_CODE","HP_CODE"};
             mv.addObject("codes", this.commonService.selectCodes(codes));
             mv.addObject("commandMap", commandMap);
             
         }
         
         
         mv.setViewName("/am/customer/productInquiryEdit");
         return mv;
     }
     
     /**
     * <pre>
     * 1. MethodName : productInquiryModify
     * 2. ClassName : ProductInquiryController.java
     * 3. Comment : 관리자 > 고객센터 > 상품 문의 답변 수정 
     * 4. 작성자 : DEV_KIMSOYOUNG
     * 5. 작성일 : 2015. 4. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/board/productInquiryModify")
     public ModelAndView productInquiryModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         if(!"".equals(StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "")))
         {
             int result = this.productInquiryService.updateProductInquiry(request, commandMap);
             
             // view Page Info
             if(result > 0)
             {
                 mv.addObject("alertMsg", "수정 되었습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do");
                 
             }
             else
             {
                 mv.addObject("alertMsg", "수정에 실패하였습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/productInquiryList.do");
             }
         }
         mv.addObject("commandMap", commandMap);
         mv.setViewName("/am/common/result");
         return mv;
     }
}
