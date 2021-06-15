package com.market.mall.mobile.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyInquiryService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyProductInquiryService;

/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : MyProductInquiryController.java
 * @Date : 2015. 6. 23.
 * @프로그램 설명 : 사용자 > 모바일 > MYPAGE > 쇼핑컨텐츠 > 상품 Q&A 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */

@Controller("mobileMyProductInquiryController")
public class MyProductInquiryController 
{
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
	@Resource(name="pcMyProductInquiryService")
	private MyProductInquiryService pcMyProductInquiryService;
	 
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_SMALL;
	
	/**
	* <pre>
	* 1. MethodName : myProductInquiryList
	* 2. ClassName : MyProductInquiryController.java
	* 3. Comment : 사용자 > 모바일 > mypage > 쇼핑컨텐츠 > 상품 QnA 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myProductInquiryCompleteList")
	public ModelAndView myProductInquiryCompleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		
		commandMap.put("BRD_INQ_RET_YN", "Y");
		return this.myProductInquiryList(request,commandMap);
	}
	
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myProductInquiryIncompleteList")
	public ModelAndView myProductInquiryIncompleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		
		commandMap.put("BRD_INQ_RET_YN", "N");
		return this.myProductInquiryList(request,commandMap);
	}
	
	
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myProductInquiryList")
	public ModelAndView myProductInquiryList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();

            commandMap.put("BRD_INQ_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("BRD_INQ_TYPE", Code.INQUIRY_TYPE_PRODUCT);
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 상품 QnA 목록 갯수
            int totalCount = this.pcMyProductInquiryService.selectMyProductInquiryListCount(commandMap);
            commandMap.put("pageSize", 5);
            Paging paging = new Paging(totalCount, commandMap); 
            
            if(totalCount>0)
            {
            	// 상품 QnA 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	List<Map<String,Object>> list = this.pcMyProductInquiryService.selectMyProductInquiryList(commandMap);

                // 상품 QnA 목록
                mv.addObject("list", list);
            }        
            
            // 해당 브랜드로 이동
            mv.setViewName("mobile/mypage/myProductInquiryList");
            
            //RETURN OBJECT
            mv.addObject("paging", paging);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
		else
		{
			throw new MobileAuthenticationException();
		}
	}
}
