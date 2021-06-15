package com.market.mall.pc.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyInquiryService;
import com.market.mall.pc.mypage.service.MyPageService;

@Controller("pcMyInquiryController")
public class MyInquiryController {
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
	@Resource(name="pcMyInquiryService")
	private MyInquiryService pcMyInquiryService;
	 
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL;

	/**
	* <pre>
	* 1. MethodName : myInquiryList
	* 2. ClassName  : MyInquiryController.java
	* 3. Comment    : 문의내역 목록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myInquiryList")
    public ModelAndView myInquiryList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            commandMap.put("MEM_ADV_TYPE", "2238");
            // 1:1문의 목록 갯수
            int totalCount = this.pcMyInquiryService.selectMyInquiryListCount(commandMap);
            commandMap.put("pageSize", 10);
            Paging paging = new Paging(totalCount, commandMap); 
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
            	// 1:1문의 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	list = this.pcMyInquiryService.selectMyInquiryList(commandMap);

            }        
            //RETURN OBJECT
            mv.addObject("paging", paging);
            mv.addObject("list", list);
            mv.addObject("totalCount", totalCount);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : myInquiryForm
	* 2. ClassName : MyInquiryController.java
	* 3. Comment : 1:1문의 작성
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInquiryForm")
	public ModelAndView myInquiryForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			
			// 문의유형 목록
	        mv.addObject("inqTypeCodeList", this.pcCommonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
			
			// 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // Common Codes
            String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	        
	        mv.addObject("commandMap", commandMap);
	        mv.addObject("summaryMap", summaryMap);
	        
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : inquiryRegist
	* 2. ClassName : MyInquiryController.java
	* 3. Comment : 1:1문의 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/inquiryRegist")
	public ModelAndView inquiryRegist (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("MEM_MST_MEM_NM", SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
			
			commandMap.put("MEM_ADV_TYPE", "2238");//문의유형 (1:1문의)
			commandMap.put("MEM_ADV_CHN_GBN", Code.USER_ENV_TYPE_PC);//문의채널
			
			int result = this.pcMyInquiryService.insertInquiry((MultipartHttpServletRequest)request, commandMap);
			
			// view Page Info
	        if(result > 0)
	        {
	        	mv.addObject("alertMsg", "등록 되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInquiryList.do");
	        }
	        else
	        {
	            mv.addObject("alertMsg", "등록에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInquiryList.do");
	        }

	        mv.addObject("commandMap", commandMap);
	        mv.setViewName("/pc/common/result");
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myInquiryView
	* 2. ClassName : MyInquiryController.java
	* 3. Comment : 문의내역 상세보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInquiryView")
	public ModelAndView myInquiryView (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("MEM_ADV_TYPE", "2238");//문의유형 (1:1문의)
            // 문의내역 상세정보
        	Map<String, Object> resultMap = this.pcMyInquiryService.selectMyInquiryInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
			
			// 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
	        
	        mv.addObject("commandMap", commandMap);
	        mv.addObject("summaryMap", summaryMap);
	        
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myInquiryEdit
	* 2. ClassName : MyInquiryController.java
	* 3. Comment : 문의사항 수정 폼
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInquiryEdit")
	public ModelAndView myInquiryEdit (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("MEM_ADV_TYPE", "2238");//문의유형 (1:1문의)
            // 문의내역 상세정보
        	Map<String, Object> resultMap = this.pcMyInquiryService.selectMyInquiryInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
			
			// 문의유형 목록
	        mv.addObject("inqTypeCodeList", this.pcCommonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
			
			// 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // Common Codes
            String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	        
	        mv.addObject("commandMap", commandMap);
	        mv.addObject("summaryMap", summaryMap);
	        
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myInquiryModify
	* 2. ClassName : MyInquiryController.java
	* 3. Comment : 문의사항 수정
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInquiryModify")
	public ModelAndView myInquiryModify (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			// 브랜드 코드 가져오기
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			
			commandMap.put("MEM_ADV_UPD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("MEM_ADV_UPD_IP", request.getRemoteAddr());
			
			int result = this.pcMyInquiryService.updateInquiry((MultipartHttpServletRequest)request,commandMap);
			
			if(result > 0)
			{
				mv.addObject("alertMsg", "수정되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInquiryView.do");
				
			}
			else
			{
				mv.addObject("alertMsg", "수정실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/customer/myInquiryView.do");
			}
			mv.addObject("commandMap", commandMap);
			// 해당 브랜드로 이동
	        mv.setViewName("pc/common/result");
			return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myInquiryRemove
	* 2. ClassName  : MyInquiryController.java
	* 3. Comment    : 문의내역 삭제
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myInquiryRemove")
    public ModelAndView myInquiryRemove(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			
			int result = this.pcMyInquiryService.deleteMyInquiry(commandMap);
			
			// view Page Info
			if(result > 0)
			{
				mv.addObject("alertMsg", "삭제되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInquiryList.do");
				
			}
			else
			{
				mv.addObject("alertMsg", "삭제 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myInquiryList.do");
			}
			
			mv.addObject("commandMap", commandMap);
			
			// 해당 브랜드로 이동
	        mv.setViewName("pc/common/result");
	        
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : getSubCodeAjax
	* 2. ClassName : MyInquiryController.java
	* 3. Comment : 공통코드 하위 코드 불러오기
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/pc/mypage/getSubCodeAjax.do")
    public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        String code = StringUtil.getString(commandMap.get("code"));
        
        List<Map<String, Object>> listCode = this.pcCommonService.selectCodeIdxList(code);
        
        json.put("listCode", listCode);
        
        return json;
    }
}
