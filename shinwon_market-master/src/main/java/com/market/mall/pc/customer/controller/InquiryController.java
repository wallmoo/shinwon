package com.market.mall.pc.customer.controller;


import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.FileUploadException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.FaqBoardService;
import com.market.mall.pc.customer.service.InquiryService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyShoppingService;

/**
 * @PackageName: com.market.mall.pc.customer.controller
 * @FileName : InquiryController.java
 * @Date : 2014. 7. 24.
 * @프로그램 설명 : 프론트 > 고객센터 1:1문의를 처리하는 Controller Class
 * @author kanghk
 */
@Controller("pcInquiryController")
public class InquiryController {
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	@Resource(name="pcInquiryService")
    private InquiryService pcInquiryService;
	
	@Resource(name="pcMyPageService")		
	private MyPageService pcMyPageService;
	
	@Resource(name="pcFaqBoardService")
    private FaqBoardService pcFaqBoardService;
	
	@Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
	
	@Resource
	private CartService cartService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : inquiryMain
	 * 2. ClassName : InquiryController.java
	 * 3. Comment : 1:1 문의 메인 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/customer/inquiryMain")
    public ModelAndView inquiryMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
			
//		if(SessionsUser.isLogin(request))
//        {
	        ModelAndView mv = new ModelAndView();
	        
	        String faqCode	= "105";
	        
	        
	        // 테스트 용 세션 처리 후 삭제!!
//	        commandMap.put("MEM_MST_MEM_NM", "테스트");
	     // 로그인 회원정보
			User user = SessionsUser.getSessionUser(request);
			
			if(SessionsUser.isLogin(request) ){
//				commandMap.put("MEM_MST_MEMBER_GROUP", user.getMEM_MST_MEMBER_GROUP());
				commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
				commandMap.put("MEM_LOGIN_YN", "Y");
				commandMap.put("MEM_MST_MEM_NM", user.getMEM_MST_MEM_NM());
	      	
				// 개인정보 
				Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
				mv.addObject("userInfo", userInfo);
				String email	= (String) userInfo.get("MEM_MST_MAIL");
				
				if(!"".equals(email)){
					String[] emails	= email.split("@");
					if(emails.length == 2){
						mv.addObject("email1", emails[0]);
						mv.addObject("email2", emails[1]);
					}
				}
		        // FAQ 좌측 하위 카테고리 목록
		        mv.addObject("fqaCodeList", this.pcFaqBoardService.selectFaqCodeList(faqCode));
	
		        // 문의유형 목록
		        mv.addObject("inqTypeCodeList", this.pcCommonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
		        
		        // Common Codes
		        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
		        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
		
		        //RETURN OBJECT
		        mv.addObject("commandMap", commandMap);
		        
		     
			}else{
				
				//throw new PcAuthenticationException();
	        	commandMap.put("url", request.getAttribute("frontDomain") + "/pc/customer/inquiryMain.do");
	            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/manager/login.do");
	            // 해당 브랜드로 이동
	            mv.setViewName("pc/common/result");
			}
			
			return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : inquiryInsert
	* 2. ClassName  : InquiryController.java
	* 3. Comment    : 1:1문의 등록
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/pc/customer/inquiryInsert", method = RequestMethod.POST)
    public JSON inquiryInsert (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		String resultMsg = "";
		String isSuccessYn = "";
		JSON json = new JSON();
		
		if(SessionsUser.isLogin(request)){
			
			//로그인 회원정보
			User user = SessionsUser.getSessionUser(request);
	
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_MST_MEM_NM", user.getMEM_MST_MEM_NM());
    		
			// 1:1 문의 코드 값.
			commandMap.put("MEM_ADV_TYPE",	"2238");
			// CS 구분 
			commandMap.put("MEM_ADV_CS_STR", "2243");
			//PC모바일구분
			commandMap.put("MEM_ADV_CHN_GBN", "P");
			
			commandMap.put("BRD_INQ_REG_IP", request.getRemoteAddr());
					
			try{
				if(this.pcInquiryService.insertInquiry((MultipartHttpServletRequest)request,commandMap) > 0){
					isSuccessYn = "Y";
		            resultMsg = "등록 되었습니다.";
				}else{
					isSuccessYn = "N";
		            resultMsg = "등록에 실패하였습니다.";
				}
			}catch(FileUploadException e){
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn = "N";
				resultMsg = e.getMessage();
			}catch(Exception e){
				logger.debug("productCommentRegist Error : " + e.getMessage());
				isSuccessYn = "N";
				resultMsg = "등록에 실패하였습니다.";		
			}
			
			json.addObject("resultMsg",resultMsg);
			json.addObject("isSuccessYn",isSuccessYn);
		}
		
		return json;
    }
	
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : orderInfoPopup
	 * 2. ClassName : InquiryController.java
	 * 3. Comment : 상품 검색 팝업
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 8.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@AccessLevelUser(ROLEUSER.order_guest)
	@FrontBannerSkip
	@RequestMapping("/pc/customer/orderInfoPopup")
	public ModelAndView orderInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
//        commandMap.put("ORD_MST_ORD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		commandMap.put("ORD_MST_ORD_ID", "rkdgusrb1");
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);

    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
    	}    	
    	
		// 기본값 설정 - 검색 날짜(-6개월) 고정
        commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        commandMap.put("searchMaxDate", DateUtil.getToday("-"));
        commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));

        
        // searchState inquiry로 고정
        commandMap.put("searchState", "inquiry");

        // 나의 쇼핑내역 목록 갯수
        int totalCount = this.pcMyShoppingService.selectMyShoppingListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        commandMap.put("pageSize", 10);
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
            // 나의 쇼핑내역 목록
        	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
        	
        	// TODO 상품 옵션 가져오기
     		for(Map<String, Object> ordPrd : list){
     			int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));//필수옵션값
     			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
     				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(ordPrd);
     				ordPrd.put("optionList", optionList);//해당 상품 필수옵션 리스트
     			}
     			
     			//서브 옵션 리스트
     			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
     			int SUB_OPTION_CNT =  StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
     			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
    				subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);
    				ordPrd.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
     			}
     		}
        }
        
        mv.setViewName("pc/customer/orderInfoPopup");
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : getSubCodeAjax
	 * 2. ClassName : InquiryController.java
	 * 3. Comment : 문의유형 하위 카테고리 가져오기 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/customer/getSubCodeAjax")
    public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
    	
    	String faqCode						= StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
    	List<Map<String, Object>> list		= this.pcFaqBoardService.selectFaqCodeList(faqCode);
    	json.addObject("list", list);
    	
    	return json;
    } 
}
