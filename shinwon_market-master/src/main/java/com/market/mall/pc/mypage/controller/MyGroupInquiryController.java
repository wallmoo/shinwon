package com.market.mall.pc.mypage.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyGroupInquiryService;
import com.market.mall.pc.mypage.service.MyPageService;

@Controller("pcMyGroupInquiryController")
public class MyGroupInquiryController 
{
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
	@Resource(name="pcMyGroupInquiryService")
	private MyGroupInquiryService pcMyGroupInquiryService;
	 
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
	
	/**
	* <pre>
	* 1. MethodName : myGroupInquiryList
	* 2. ClassName : MyGroupInquiryController.java
	* 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 29.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myGroupInquiryList")
    public ModelAndView myGroupInquiryList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
            // 브랜드 코드 가져오기
            commandMap.put("GRP_INQ_BRAND_CD", request.getAttribute("serverBrandCd"));

            commandMap.put("GRP_INQ_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 단체주문문의 목록 갯수
            int totalCount = this.pcMyGroupInquiryService.selectMyGroupInquiryListCount(commandMap);
            commandMap.put("pageSize", 10);
            Paging paging = new Paging(totalCount, commandMap); 
            
            if(totalCount>0)
            {
            	// 단체주문문의 목록
            	Map<String, Object> dataMap = this.pcMyGroupInquiryService.selectMyGroupInquiryList(commandMap);

                // 단체주문문의 목록
                mv.addObject("list", dataMap.get("list"));
            }        
            
            // 해당 브랜드로 이동
            mv.setViewName("pc/mypage/myGroupInquiryList");
            
            // 임직원 구분 코드 리스트
            //mv.addObject("codeList", this.pcCommonService.selectCode("COMMON_MEMBER_GROUP"));

            //RETURN OBJECT
            mv.addObject("paging", paging);
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
	* 1. MethodName : myGroupInquiryView
	* 2. ClassName : MyGroupInquiryController.java
	* 3. Comment : 사용자 > 마이페이지 > 쇼핑컨텐츠 > 단체주문문의 상세보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 29.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myGroupInquiryView")
	public ModelAndView myGroupInquiryView (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			if(!"".equals(StringUtil.getString(commandMap.get("GRP_INQ_IDX"), "")))
	        {
	            // 문의내역 상세정보
	        	Map<String, Object> resultMap = this.pcMyGroupInquiryService.selectMyGroupInquiryInfo(request,commandMap);
	            mv.addObject("row", resultMap.get("row"));
	            mv.addObject("fileList", resultMap.get("fileList"));
	        }
			
			// 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
	        
	        // 해당 브랜드로 이동
	        mv.setViewName("pc/mypage/myGroupInquiryView");
	        
	        // 임직원 구분 코드 리스트
            //mv.addObject("codeList", this.pcCommonService.selectCode("COMMON_MEMBER_GROUP"));
	        
	        mv.addObject("commandMap", commandMap);
	        mv.addObject("summaryMap", summaryMap);
	        
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
}
