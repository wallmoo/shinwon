package com.market.mall.mobile.customer.controller;


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
import com.market.mall.mobile.customer.service.InquiryService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.FaqBoardService;
import com.market.mall.pc.mypage.service.MyShoppingService;

/**
 * @PackageName: com.market.mall.mobile.customer.controller
 * @FileName : InquiryController.java
 * @Date : 2016. 2. 16.
 * @프로그램 설명 : 프론트 > 고객센터 1:1문의를 처리하는 Controller Class
 * @author kanghk
 */
@Controller("mobileInquiryController")
public class InquiryController {
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	@Resource(name="mobileInquiryService")
    private InquiryService mobileInquiryService;
	
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
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/customer/inquiryMain")
    public ModelAndView inquiryMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
			
		if(SessionsUser.isLogin(request))
        {
	        ModelAndView mv = new ModelAndView();
	        
	        //commandMap.put("MEM_MST_MEM_NM", "테스트");
	        
	        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	        commandMap.put("MEM_MST_MEM_NM", SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
            commandMap.put("MEM_MST_MEMBER_NO", SessionsUser.getSessionUserValue("MEM_MST_MEMBER_NO"));
            commandMap.put("MEM_MST_MEMBER_GRADE", SessionsUser.getSessionUserValue("MEM_MST_MEMBER_GROUP"));
	       
	        // 문의유형 목록
	        mv.addObject("inqTypeCodeList", this.pcCommonService.selectCode("ONE_TO_ONE_INQUIRY_TYPE_CODE"));
	        
	        // Common Codes
	        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
	        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	
	        // 해당 브랜드로 이동
	        mv.setViewName("mobile/customer/inquiryMain");
	        
	        //RETURN OBJECT
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
	@RequestMapping(value="/mobile/customer/inquiryInsert", method = RequestMethod.POST)
    public JSON inquiryInsert (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		String resultMsg = "";
		String isSuccessYn = "";
		
		if(SessionsUser.isLogin(request)){
			JSON json = new JSON();
			// 브랜드 코드 가져오기
	        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
	       
	        // 테스트용 아이디 세션 처리 후 삭제!!
	        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	        commandMap.put("MEM_MST_MEM_NM", SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
			
			// 1:1 문의 코드 값.
			commandMap.put("MEM_ADV_TYPE",	"2238");
			// CS 구분 
			commandMap.put("MEM_ADV_CS_STR", "2243");
			//PC모바일구분
			commandMap.put("MEM_ADV_CHN_GBN", "M");
			
			commandMap.put("BRD_INQ_REG_IP", request.getRemoteAddr());
					
			try{
				if(this.mobileInquiryService.insertInquiry(commandMap) > 0){
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
			
			return json;
        }else{
        	throw new PcAuthenticationException();
        }
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
	@RequestMapping("/mobile/customer/orderInfoAjax")
	public ModelAndView orderInfoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
		
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
        commandMap.put("pageSize", 5);
        Paging paging = new Paging(totalCount, commandMap); 
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
        
        mv.setViewName("mobile/customer/orderInfoAjax");
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
	@RequestMapping("/mobile/customer/getSubCodeAjax")
    public JSON getSubCodeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	JSON json = new JSON();
    	
    	String faqCode						= StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
    	List<Map<String, Object>> list		= this.pcFaqBoardService.selectFaqCodeList(faqCode);
    	json.addObject("list", list);
    	
    	return json;
    } 
}
