package com.market.mall.pc.mypage.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyProductCommentService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.product.service.ProductService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyShoppingController.java
 * @Date : 2014. 7. 8.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 쇼핑내역을 처리하는 Controller Class
 * @author LJH
 */
@Controller("pcMyShoppingController")
public class MyShoppingController {

	@Resource
	private CartService cartService;
	
    @Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;

    @Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
    
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
    @Resource(name="orderService")
    private OrderService orderService;
    
    @Resource(name="productService") private ProductService productService;
    
    @Resource(name="pcMyProductCommentService")
    private MyProductCommentService pcMyProductCommentService;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
	@Resource (name="orderErrorService") 
	private OrderErrorService orderErrorService;
	
	@Resource (name="paymentService") 
	PaymentService paymentService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL;
	
	@Resource(name = "velocityEngine") 
	protected VelocityEngine velocityEngine;
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: myShoppingList
	 * 2. ClassName		: MyShoppingController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 8. 오전 10:46:02
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myShoppingList")
    public ModelAndView myShoppingList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        
        // 배송현황
        Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
        
        // 기본값 설정 - 검색 날짜(-1개월)
        String month1 = FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-1),"-");
        String month3 = FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-3),"-");
        String month6 = FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-");
        String month12 = FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-");
        String today = DateUtil.getToday("-");
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), month1));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), today));
        commandMap.put("searchMaxDate", DateUtil.getToday("-"));
        commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-120),"-"));
        
        String tabId = StringUtil.getString(commandMap.get("tabId"), "tab1");
        commandMap.put("tabId", tabId);
        
        if(tabId.equals("tab1")) {
        	commandMap.put("searchDlvGbn", Code.CART_DLV_GBN_NORMAL_CD);
        }else {
        	commandMap.put("searchDlvGbn", Code.CART_DLV_GBN_GET_IT_NOW_CD);
        }
        
        if(commandMap.get("searchEndDate").equals(today)) {
        	if(commandMap.get("searchStartDate").equals(month1)) {
        		mv.addObject("selectedMonth1", "checked");
        	}else if(commandMap.get("searchStartDate").equals(month3)) {
        		mv.addObject("selectedMonth3", "checked");
        	}else if(commandMap.get("searchStartDate").equals(month6)) {
        		mv.addObject("selectedMonth6", "checked");
        	}else if(commandMap.get("searchStartDate").equals(month12)) {
        		mv.addObject("selectedMonth12", "checked");
        	}
        }

        // 마이페이지 요약정보
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
        
        // 나의 쇼핑내역 목록 갯수
        int totalCount = this.pcMyShoppingService.selectMyShoppingListCount(commandMap);
        commandMap.put("pageSize", 5);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount > 0){
            // 나의 쇼핑내역 목록
        	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
        }        

        // 해당 브랜드로 이동
        mv.setViewName("pc/mypage/myShoppingList");
        
        //RETURN OBJECT
        mv.addObject("myPageOrderInfo", myPageOrderInfo);
        mv.addObject("list", list);
        //mv.addObject("paging", paging);
        mv.addObject("summaryMap", summaryMap);
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: myOrderCancelBackList
	 * 2. ClassName		: MyShoppingController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 (취소/반품 내역)
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 8. 오전 10:46:02
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOrderCancelBackList")
    public ModelAndView myOrderCancelBackList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("searchCancelBack", "Y");
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 배송현황
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 기본값 설정 - 검색 날짜(-6개월)
            commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-")));
            commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
            commandMap.put("searchMaxDate", DateUtil.getToday("-"));
            commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-120),"-"));
            
            // 취소반품 내역
            String searchState = StringUtil.getString(commandMap.get("searchState"), "cancel");
            commandMap.put("searchState", searchState);

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            // 나의 쇼핑내역 목록 갯수
            int totalCount = this.pcMyShoppingService.selectMyShoppingListCount(commandMap);
            commandMap.put("pageSize", 10);
            Paging paging = new Paging(totalCount, commandMap); 
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 나의 쇼핑내역 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
            	
            	// 상품 옵션 가져오기
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
            
            // 해당 브랜드로 이동
            mv.setViewName("pc/mypage/myOrderCancelBackList");

            //RETURN OBJECT
            mv.addObject("myPageOrderInfo", myPageOrderInfo);
            mv.addObject("list", list);
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
     * 1. MethodName : gestDeliveryList
     * 2. ClassName  : MyShoppingController.java
     * 3. Comment    : 프론트 > 마이페이지 > 비회원 주문/배송 조회
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception  
     */
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/nonMember/gestDeliveryList")
    public ModelAndView gestDeliveryList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
          
        // 비회원 로그인 체크, 회원(SNS) 로그인 체크
        if(SessionsUser.isNonLogin(request) || SessionsUser.isLogin(request))
        {
            // 비회원 로그인
            if(!"".equals(StringUtil.getString(SessionsUser.getSessionUserValue("ORD_MST_CD"), "")))
            {
                commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));
                commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));
            }
            // 회원(SNS) 로그인
            else
            {
                commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            }
            
            // 배송현황 입금대기,결제완료,배송준비중,배송중,배송완료,취소,반품,교환 개수  
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 나의 쇼핑내역 목록 갯수
            int totalCount = this.pcMyShoppingService.selectMyShoppingListCount(commandMap);
            commandMap.put("pageSize", 10);
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 나의 쇼핑내역 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
            }        

            mv.addObject("myPageOrderInfo", myPageOrderInfo);
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            
            // 해당 브랜드로 이동
            mv.setViewName("pc/mypage/gestDeliveryList");
        }
        else
        {  
        	throw new PcAuthenticationException();
        }
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : gestOrderCancelBackList
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 프론트 > 마이페이지 > 비회원 주문/배송 조회 (취소/반품 내역)
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 19.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/gestOrderCancelBackList")
    public ModelAndView gestOrderCancelBackList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
            commandMap.put("searchCancelBack", "Y");
            commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));
            commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));
            
            // 배송현황
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 취소반품 내역
            String searchState = StringUtil.getString(commandMap.get("searchState"), "cancel");
            commandMap.put("searchState", searchState);

            // 나의 쇼핑내역 목록 갯수
            int totalCount = this.pcMyShoppingService.selectMyShoppingListCount(commandMap);
            Paging paging = new Paging(totalCount, commandMap); 
            commandMap.put("pageSize", 10);
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 나의 쇼핑내역 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
            	
            	// 상품 옵션 가져오기
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
            
            // 해당 브랜드로 이동
            mv.setViewName("pc/mypage/gestOrderCancelBackList");

            //RETURN OBJECT
            mv.addObject("myPageOrderInfo", myPageOrderInfo);
            mv.addObject("list", list);
            mv.addObject("paging", paging);
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
    * 1. MethodName : myReceiptIssueList
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 프론트 > 마이페이지 > 증빙서류 발급 목록
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/myReceiptIssueList")
    public ModelAndView myReceiptIssueList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            //본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}
            commandMap.put("CST_PLATFORM", this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM"));
            
            // 기본값 설정 - 검색 날짜(-6개월)
            commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-")));
            commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
            commandMap.put("searchMaxDate", DateUtil.getToday("-"));
            commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-120),"-"));

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            // 나의 쇼핑내역 목록 갯수
            int totalCount = this.pcMyShoppingService.selectMyReceiptIssueListCount(commandMap);
            commandMap.put("pageSize", 10);
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 나의 쇼핑내역 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	list = this.pcMyShoppingService.selectMyReceiptIssueList(commandMap);
            }        

            // 해당 브랜드로 이동
            mv.setViewName("pc/mypage/myReceiptIssueList");
            
            //RETURN OBJECT
            mv.addObject("list", list);
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
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/returnProductView")
    public ModelAndView returnProductView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	return this.myShoppingInfo(request, commandMap);
    }
    /**
    
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/productExchangeView")
    public ModelAndView productExchangeView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	return this.myShoppingInfo(request, commandMap);
    }
    /**
     * 
     * <pre>
     * 1. MethodName	: orderInfoPopup
     * 2. ClassName		: MyShoppingController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문상세
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 11. 오후 2:10:16
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/myShoppingInfo")
    public ModelAndView myShoppingInfo (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            User user = SessionsUser.getSessionUser(request);
            boolean isUser = false;
            //본인 주문인지 체크
        	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
        		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
        		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
        	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        		isUser = true;
        		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        	}    	
        	System.out.println("ORD_PRD_IDX==================>"+commandMap.get("ORD_PRD_IDX"));
        	System.out.println("ORD_MST_CD==================>"+commandMap.get("ORD_MST_CD"));
        	int result = this.pcMyShoppingService.selectOrderCount(commandMap);

        	if(result > 0){
        		// 신용카드/현금영수증 영수증출력 정보
        		//commandMap.put("LGD_RECEIPT_SCRIPTURL", this.propertiesService.getString("payment.lg.xpay.LGD_RECEIPT_SCRIPTURL"));
        		commandMap.put("CST_PLATFORM", this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM"));
        		
        		// 주문상품 목록
        		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
                List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
                
                // 상품 옵션 가져오기
         		for(Map<String, Object> ordPrd : orderProductList){
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
        				
        				for(Map<String, Object> subPrd : subPrdList){
    						List<Map<String,Object>> subOptionList = this.cartService.selectCartOptionDetailList(subPrd);
    						subPrd.put("subOptionList", subOptionList);//해당 상품 서브 상품의 옵션 리스트
    					}
         			}
         		}
         		
         		// 취소/교환/반품 정보
         		commandMap.put("targetState", "cancel");
         		List<Map<String,Object>> cancelInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
         		commandMap.put("targetState", "swap");
         		List<Map<String,Object>> swapInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
         		commandMap.put("targetState", "back");
         		List<Map<String,Object>> backInfoList = this.pcMyShoppingService.selectOrdCancelSwapBackInfo(commandMap);
         		
         		// 재주문 가능 여부
         		int repayYn = this.pcMyShoppingService.selectRepayYn(commandMap);
         		mv.addObject("repayYn", repayYn);
         		
         		// 주문상태 정보
        		Map<String, Object> orderState = this.pcMyShoppingService.selectOrderStateCnt(commandMap);
                
                // 사은품 정보
                List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);
                
                // 배송정보
                Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);
                
                // 할인/결제정보
                Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);
                
                // 사용 쿠폰 리스트
        		if(StringUtil.getInt(orderPayInfo.get("ORD_MST_DC_CPN")) > 0){
        			mv.addObject("orderCouponList", this.orderService.selectOrderCouponList(commandMap));
        		}
        		
        		
                // 무결성 검증필드
        		if (orderPayInfo != null)
        		{
            		String LGD_MID = StringUtil.getString(orderPayInfo.get("PAY_MST_MID"),"");
            		String LGD_TID = StringUtil.getString(orderPayInfo.get("PAY_MST_TID"),"");
            		String LGD_MERTKEY = this.propertiesService.getString("payment.lg.xpay.LGD_MERTKEY");
            		//-- LGU+ 준비, 2. MD5 해쉬암호화 (수정하지 마세요) - BEGIN
            		StringBuffer sb = new StringBuffer();
            	    sb.append(LGD_MID);
            	    sb.append(LGD_TID);
            	    sb.append(LGD_MERTKEY);

            	    byte[] bNoti = sb.toString().getBytes();
            	    MessageDigest md = MessageDigest.getInstance("MD5");
            	    byte[] digest = md.digest(bNoti);

            	    StringBuffer strBuf = new StringBuffer();
            	    for (int i=0 ; i < digest.length ; i++) {
            	        int c = digest[i] & 0xff;
            	        if (c <= 15){
            	            strBuf.append("0");
            	        }
            	        strBuf.append(Integer.toHexString(c));
            	    }

            	    String LGD_HASHDATA = strBuf.toString();
            		//-- LGU+ 준비, 2. MD5 해쉬암호화 (수정하지 마세요) - END

            	    commandMap.put("LGD_HASHDATA", LGD_HASHDATA);
        		}
                
          		// 로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
        		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
        		String DEFAULT_CASHBAG_CARD_NO = "";
        		Map<String,Object> getItNowShopInfo = null;
        		if(isUser){
        			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
        			mv.addObject("userInfo", userInfo);
        			
        			// 마이페이지 요약정보
                    Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
                    mv.addObject("summaryMap", summaryMap);
                    
        			commandMap.put("trStatus", "U");//사용 이력
        			Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
        			
        			if(cashbagSavedInfo != null){
        				DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
        			}else{
        				// 캐쉬백 카드번호
        				commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        				Map<String, Object> memberCashbagInfo = this.cartService.selectMemberCashbagInfo(commandMap);
        				
        				if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
        					DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
        				}
        			}
        			mv.addObject("DEFAULT_CASHBAG_CARD_NO", DEFAULT_CASHBAG_CARD_NO);
        			
        			// 겟잇나우 주문인 경우 지점 정보 가져오기
        	 		int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_GBN"));
        	 		if(ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
        	 			getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);
        	 			mv.addObject("getItNowShopInfo",getItNowShopInfo);
        	 		}
        		}
                
        		/** 우편번호 찾기 레이어팝업 위한 지역 코드 START */
                // 지역코드
        		mv.addObject("sidoList", this.pcCommonService.selectCode("AREA_CD"));
        		
        		// 프로토콜 여부 (https : true / http : false)
        		boolean secureYn = request.isSecure();
        		String domain = "";
        		
        		if(secureYn)
        		{
        			domain = StringUtil.getString(request.getAttribute("serverSslDomain"));
        		}
        		else
        		{
        			domain = StringUtil.getString(request.getAttribute("frontDomain"));
        		}
        		mv.addObject("domain",domain);
        		/** 우편번호 찾기 레이어팝업 위한 지역 코드 END */
        		
                mv.addObject("orderProductList", orderProductList);
                mv.addObject("cancelInfoList", cancelInfoList);
                mv.addObject("swapInfoList", swapInfoList);
                mv.addObject("backInfoList", backInfoList);
                mv.addObject("orderState", orderState);
                mv.addObject("orderDeliveryInfo", orderDeliveryInfo);
                mv.addObject("orderPayInfo", orderPayInfo);
                mv.addObject("requestedGiftList", requestedGiftList);
        		
                mv.addObject("commandMap", commandMap);
        	}
    		
        	//mv.setViewName("pc/mypage/myShoppingInfo");
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: orderCancel
     * 2. ClassName		: MyShoppingController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 주문취소 팝업
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 15. 오전 10:53:02
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/orderCancelView")
    public ModelAndView orderCancelView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	return this.orderCancel(request,commandMap);
    }
    
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/orderCancel")
    public ModelAndView orderCancel (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            //본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);	    	
	    	
	    	if(result > 0){
	    		 // Common Codes
	            //String[] codes = {"ORDER_CANCEL_RETURN_REASON"};
	    		String[] codes = {"ORDER_CANCEL_REASON"};
	            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	            
	            // 입금은행
	            commandMap.put("CODE", Code.KICC_BANK_CD);
	            //commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
	            mv.addObject("depositBankList", this.cartService.selectCodeList(commandMap));
	            
	            // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
	            // 프론트에서는 배열이 필수
	            String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR"));
	            if(!"".equals(ORD_PRD_IDX_ARR)){
	            	String[] ordPrdIdxs = ORD_PRD_IDX_ARR.split(",");
	            	String selectedIdx = null;
	            	String selectedVdrIdx = null;
	            	logger.debug("ordPrdIdxs.length============================="+ordPrdIdxs.length);
	            	if(ordPrdIdxs.length == 1){
	            		commandMap.put("ORD_PRD_IDX", StringUtil.getString(ordPrdIdxs[0],""));
	            	}else {
	            		Map<String, Object> map = new HashMap<String, Object>(commandMap);
	            		map.put("ORD_PRD_IDX", commandMap.get("ORD_PRD_IDX"));
	            		Map<String, Object> selectedPrd = pcMyShoppingService.selectOrderProductList(map).get(0);
	            		selectedVdrIdx = StringUtil.getString(selectedPrd.get("ORD_PRD_VDR_IDX"));
	            		selectedIdx = StringUtil.getString(commandMap.get("ORD_PRD_IDX"));
	            		commandMap.put("ORD_PRD_IDX", "");
	            		commandMap.put("allCancel", "all");
	            	}
	            	commandMap.put("ordPrdIdxs", ordPrdIdxs);
	            	
	            	 // 주문 정보
		            // 주문상품 목록
	        		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	                List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
		            Map<String, Object> orderCancelInfo = this.pcMyShoppingService.selectOrderCancelInfo(commandMap);		            
	                
	                // 가져올 값이 여러개일 경우 그중 선택된 값을 다시 commandMap에 싣어 주기
	                if(selectedIdx != null) {
	                	commandMap.put("ORD_PRD_IDX", selectedIdx);
	                }
	                
	                // 상품 옵션 가져오기
	         		for(Map<String, Object> ordPrd : orderProductList){
	         			// 선택된 상품과 같은 판매자의 상품이 아닌 경우 리스트에서 삭제
						/*
						 * if(selectedVdrIdx != null &&
						 * !StringUtil.getString(ordPrd.get("ORD_PRD_VDR_IDX")).equals(selectedVdrIdx))
						 * { orderProductList.remove(ordPrd); continue; }
						 */
	         			
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
		            
		    		// 할인/결제정보(환불계좌)
		            Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);

		            //RETURN OBJECT
		            mv.addObject("orderProductList", orderProductList);
		            mv.addObject("orderCancelInfo", orderCancelInfo);		            
		            mv.addObject("orderPayInfo", orderPayInfo);
		            mv.addObject("commandMap", commandMap);
		            mv.setViewName("pc/mypage/orderCancelPopup");
	            }
	    	}else{
	    		mv.setViewName("pc/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}
            
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: orderBackPopup
     * 2. ClassName		: MyShoppingController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 반품접수 팝업
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 15. 오전 10:53:02
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping("/pc/mypage/orderBackPopup")
    public ModelAndView orderBackPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            //본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
	    	
	    	if(result > 0){
	    		 // Common Codes
	            String[] codes = {"ORDER_CANCEL_RETURN_REASON"};
	            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	            
	            // 입금은행
	            commandMap.put("CODE", Code.KICC_BANK_CD);
	            //commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
	            mv.addObject("depositBankList", this.cartService.selectCodeList(commandMap));
	            
	            // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
	            // 프론트에서는 배열이 필수
	            String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR"));
	            if(!"".equals(ORD_PRD_IDX_ARR)){
	            	String[] ordPrdIdxs = ORD_PRD_IDX_ARR.split(",");
	            	logger.debug("ordPrdIdxs.length============================="+ordPrdIdxs.length);
	            	if(ordPrdIdxs.length == 1){
	            		commandMap.put("ORD_PRD_IDX", StringUtil.getString(ordPrdIdxs[0],""));
	            	}
	            	commandMap.put("ordPrdIdxs", ordPrdIdxs);
	            	
	            	 // 주문 정보
		            // 주문상품 목록
	        		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	                List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
	                
	                // 상품 옵션 가져오기
	         		for(Map<String, Object> ordPrd : orderProductList){
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
		            
		    		// 할인/결제정보(환불계좌)
		            Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);

		            //RETURN OBJECT
		            mv.addObject("orderProductList", orderProductList);
		            mv.addObject("orderPayInfo", orderPayInfo);
		            mv.addObject("commandMap", commandMap);
		            mv.setViewName("pc/mypage/orderBackPopup");
	            }
	    	}else{
	    		mv.setViewName("pc/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}
            
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
    
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/orderBack")
    public ModelAndView orderBack (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            //본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
	    	
	    	if(result > 0){
	    		 // Common Codes
	            String[] codes = {"ORDER_CANCEL_RETURN_REASON"};
	            mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	            
	            // 입금은행
	            commandMap.put("CODE", Code.KICC_BANK_CD);
	            //commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
	            mv.addObject("depositBankList", this.cartService.selectCodeList(commandMap));
	            
	            // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
	            // 프론트에서는 배열이 필수
	            String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR"));
	            if(!"".equals(ORD_PRD_IDX_ARR)){
	            	String[] ordPrdIdxs = ORD_PRD_IDX_ARR.split(",");
	            	String selectedIdx = null;
	            	String selectedVdrIdx = null;
	            	logger.debug("ordPrdIdxs.length============================="+ordPrdIdxs.length);
	            	if(ordPrdIdxs.length == 1){
	            		commandMap.put("ORD_PRD_IDX", StringUtil.getString(ordPrdIdxs[0],""));
	            	}else {
	            		Map<String, Object> map = new HashMap<String, Object>(commandMap);
	            		map.put("ORD_PRD_IDX", commandMap.get("ORD_PRD_IDX"));
	            		Map<String, Object> selectedPrd = pcMyShoppingService.selectOrderProductList(map).get(0);
	            		selectedVdrIdx = StringUtil.getString(selectedPrd.get("ORD_PRD_VDR_IDX"));
	            		selectedIdx = StringUtil.getString(commandMap.get("ORD_PRD_IDX"));
	            		commandMap.put("ORD_PRD_IDX", "");
	            	}
	            	commandMap.put("ordPrdIdxs", ordPrdIdxs);
	            	
	            	 // 주문 정보
		            // 주문상품 목록
	        		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	                /*
	        		List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
	                
	                // 가져올 값이 여러개일 경우 그중 선택된 값을 다시 commandMap에 싣어 주기
	                if(selectedIdx != null) {
	                	commandMap.put("ORD_PRD_IDX", selectedIdx);
	                }
	                
	                // 상품 옵션 가져오기
	         		for(Map<String, Object> ordPrd : orderProductList){
	         			// 선택된 상품과 같은 판매자의 상품이 아닌 경우 리스트에서 삭제
	         			if(selectedVdrIdx != null && !StringUtil.getString(ordPrd.get("ORD_PRD_VDR_IDX")).equals(selectedVdrIdx)) {
	         				orderProductList.remove(ordPrd);
	         				continue;
	         			}
	         			
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
	         		*/
	        		
	        		//주문상품 정보
		        	commandMap.put("GET_BACK_CPN", true);
		            Map<String, Object> resultMap = orderService.selectOrderView(commandMap); //this.orderService.selectChangeOrderProductView(commandMap);
		            /*
		            Map<String, Object> changeOrderProductInfo = (Map<String, Object>) resultMap.get("changeOrderProductInfo");
		            // 상품 옵션 가져오기
		            
	     			int PRD_OPT_IDX = StringUtil.getInt(changeOrderProductInfo.get("PRD_OPT_IDX"));//필수옵션값
	     			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
	     				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(changeOrderProductInfo);
	     				changeOrderProductInfo.put("optionList", optionList);//해당 상품 필수옵션 리스트
	     			}
	     			
	     			//서브 옵션 리스트
	     			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
	     			int SUB_OPTION_CNT =  StringUtil.getInt(changeOrderProductInfo.get("SUB_OPTION_CNT"));
	     			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
	    				subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(changeOrderProductInfo);
	    				changeOrderProductInfo.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
	     			}
		            */
		            
		            mv.addAllObjects(resultMap);
		            
		            /** 2020.06.29 카드정보 및 할부기간 테이블 및 코드값 임시 데이터 불러오기  */
		            List<Map<String, Object>> cardTempList = this.cartService.selectTempCardList();
		            mv.addObject("cardTempList",cardTempList);
		            
		    		// 할인/결제정보(환불계좌)
		            Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);

		            //RETURN OBJECT
		            //mv.addObject("orderProductList", orderProductList);
		            mv.addObject("orderPayInfo", orderPayInfo);
		            mv.addObject("commandMap", commandMap);
		            mv.addObject("changeCouponList", orderService.selectChangeCouponList(commandMap, "C"));
		            mv.setViewName("pc/mypage/orderBack");
	            }
	    	}else{
	    		mv.setViewName("pc/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}
            
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: orderStateProc
     * 2. ClassName		: MyShoppingController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문취소 or 반품접수 or 구매확정
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 15. 오후 12:29:16
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/pc/mypage/orderStateProc", method=RequestMethod.POST)
    public ModelAndView orderStateProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
    		
	        ModelAndView mv = new ModelAndView();
	        
	        //본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	
	    	if(!StringUtil.getString(commandMap.get("ORD_PRD_CLE_TYPE")).equals("all")){
                String [] arrORD_PRD_IDXs = StringUtil.split(StringUtil.getString(commandMap.get("ORD_PRD_IDXs")),",") ;
                for(int i = 0; i < arrORD_PRD_IDXs.length; i++){
                }
                commandMap.put("arrORD_PRD_IDXs", arrORD_PRD_IDXs);
            }
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
	        
	        if(result > 0){
	        	 String closeMsg ="처리 중 오류가 발생하였습니다.";
	        	boolean success = false; 
	        	// 프론트에서는 주문취소/반품접수 가능(구매확정은 상품평 등록시 구매확정되기 때문에 그쪽에서 처리한다.)
	        	// 클린킹 예약상담취소도 가능~~~~
	        	int ORD_PRD_ORD_STATE = StringUtil.getInt(commandMap.get("ORD_PRD_ORD_STATE"));
	        	if(ORD_PRD_ORD_STATE == Code.OST_CANCEL || ORD_PRD_ORD_STATE == Code.OST_BACK || ORD_PRD_ORD_STATE == Code.OST_CLEANKING_CANCEL || ORD_PRD_ORD_STATE == Code.OST_EACH_CANCEL){
	        		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		    		Map<String, Object> ordErrMap = new HashMap<String, Object>(); //결제오류시 DB 처리 위한 맵
		    		String resultCode = "";
		    		String resultMsg = "";
		        	
		            commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_USER);
		            commandMap.put("REG_ID", "".equals(StringUtil.getString(SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID(),"")) ? "_GUEST_" : SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		            commandMap.put("REG_IP", request.getRemoteAddr());
		            
		            // 반품인 경우 선택옵션까지 통으로 반품처리한다.
		            List<String> totOrdPrdIdxs = new ArrayList<String>();//선택옵션까지 포함한 전체 상품 idx
		            if(ORD_PRD_ORD_STATE == Code.OST_BACK){
		            	String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR"));
	    	            if(!"".equals(ORD_PRD_IDX_ARR)){
	    	            	String[] ordPrdIdxs = ORD_PRD_IDX_ARR.split(",");
	    	            	commandMap.put("FRONT_ORD_PRD_IDX_ARR", ordPrdIdxs);
	    	            }
		            	List<Map<String,Object>> prdList = this.pcMyShoppingService.selectOrdPrdAllOptionList(commandMap);
			    		if(!prdList.isEmpty()){
			    			for(Map<String,Object> prd : prdList){
			    				String ORD_PRD_IDX = StringUtil.getString(prd.get("ORD_PRD_IDX"));
			    				int PRD_ORD_PRD_ORD_STATE = StringUtil.getInt(prd.get("ORD_PRD_ORD_STATE"));
			    				if(Code.OST_SEND_END != PRD_ORD_PRD_ORD_STATE && Code.OST_SWAP_READY_CANCEL != PRD_ORD_PRD_ORD_STATE){//옵션중 하나라도 배송완료 or 교환취소가 아닌 경우 반품접수 불가
			    					String PRD_NM = StringUtil.getString(prd.get("PRD_NM"));
			    					String ORD_PRD_ORD_STATE_NM = StringUtil.getString(prd.get("ORD_PRD_ORD_STATE_NM"));
			    					result = -1;
			    					String PRD_SLT_YN = StringUtil.getString(prd.get("ORD_PRD_SLT_YN"));
			    					String prdTypeStr = "Y".equals(PRD_SLT_YN) ? "선택옵션상품" : "상품";
			    					closeMsg = PRD_NM + " "+ prdTypeStr +"이 "+ ORD_PRD_ORD_STATE_NM + " 상태입니다.\n반품이 불가능합니다.";
			    					break;
			    				}else if(Code.OST_SEND_END == PRD_ORD_PRD_ORD_STATE){//배송완료 상품만 담는다
			    					totOrdPrdIdxs.add(ORD_PRD_IDX);
			    				}
			    			}
			    		}
			    		
			    		// ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
			            if(!totOrdPrdIdxs.isEmpty()){
			            	if(totOrdPrdIdxs.size() == 1){
			            		commandMap.put("ORD_PRD_IDX", StringUtil.getString(totOrdPrdIdxs.get(0),""));
			            	}
			            	commandMap.put("ordPrdIdxs", totOrdPrdIdxs.toArray(new String[totOrdPrdIdxs.size()]));
			            }
		            }
		            
		            if(result > 0){
			    		Map<String,Object> resultMap = new HashMap<String,Object>();

			    		// Modify
			            try
			        	{
			            	resultMap = this.orderService.updateOrderState(commandMap, request);
			            	if(StringUtil.getInt(resultMap.get("result")) > 0)
			                {
			                	closeMsg = "정상적으로 처리되었습니다.";
			                	success = true;
			                }
			            	else
			            	{
			            		resultCode = "0";
			            		resultMsg = StringUtil.getString(resultMap.get("resultMsg"));
			            		if("".equals(resultMsg)){
			            			resultMsg = "ORD_PRD_ORD_STATE["+StringUtil.getString(commandMap.get("ORD_PRD_ORD_STATE"))+"] 상태 변경 UPDATE 실패...";
			            		}
			            		
			            		//ERROR LOG INSERT
			            		ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
			        			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
			        			ordErrMap.put("ORD_ERR_CRD", "");
			        			ordErrMap.put("ORD_ERR_APV_NO", "");
			        			ordErrMap.put("ORD_ERR_PG_NO", "");
			        			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
			        			ordErrMap.put("ORD_ERR_LSSUER", "");
			        			ordErrMap.put("ORD_ERR_BNK_CD", "");
			        			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
			        			ordErrMap.put("ORD_ERR_REG_ID", "");
			        			ordErrMap.put("ORD_ERR_MSG", resultMsg.substring(0, Math.min(resultMsg.length(), 3800)));
			        			this.orderErrorService.insertOrdErr(ordErrMap);
			            	}
			        	}
			        	catch(Exception e){
			        		String errorMsg = e.getMessage();
			        		
			        		if("ERR_PG".equals(errorMsg)){
			        			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_PG);
			        			
			        			resultCode = StringUtil.getString(commandMap.get("resultCode"));
			        			resultMsg = StringUtil.getString(commandMap.get("resultMsg"));
			        			
			        			logger.error("resultCode : "+resultCode);
			    	    		logger.error("resultMessage : "+resultMsg);
			    	    		
			    	    		ordErrMap.put("ORD_ERR_MSG", resultMsg);
			    			}else{
			    				logger.error("####### 주문상태 변경 처리중 Exception 발생 ########");
			    				ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
			    				
			    				resultCode = "9999";
			    				resultMsg = "주문상태 변경 처리중 Exception 발생";
			    				
			    				logger.error("resultCode : "+resultCode);
			    	    		logger.error("resultMessage : "+resultMsg);
			    				
			    				// 에러메시지 DB 기록
			    				StringWriter errors = new StringWriter();
			    				e.printStackTrace(new PrintWriter(errors));
			    				errorMsg = new String(errors.toString());
			    				errorMsg = errorMsg.substring(0, Math.min(errorMsg.length(), 3800));
			        			logger.error("errorMsg : "+errorMsg);
			        			
			        			ordErrMap.put("ORD_ERR_MSG", errorMsg);
			    			}
			    			
			    			//ERROR LOG INSERT
			    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
			    			ordErrMap.put("ORD_ERR_CRD", "");
			    			ordErrMap.put("ORD_ERR_APV_NO", "");
			    			ordErrMap.put("ORD_ERR_PG_NO", "");
			    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
			    			ordErrMap.put("ORD_ERR_LSSUER", "");
			    			ordErrMap.put("ORD_ERR_BNK_CD", "");
			    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
			    			ordErrMap.put("ORD_ERR_REG_ID", "");
			    			this.orderErrorService.insertOrdErr(ordErrMap);
			        	}
		            }
	        	}
	        	
	        	mv.addObject("closeMsg",closeMsg);
                mv.addObject("parentReload","Y");
                if(commandMap.get("selfReturn") != null && success) {
                	mv.addObject("closeMsg", "");
                	mv.addObject("messages", closeMsg);
                	String returnUrl = request.getAttribute("serverSslDomain") + "/pc/mypage/myShoppingList.do"; 
                	
                	if(StringUtil.getInt(commandMap.get("ORD_PRD_ORD_STATE")) == Code.OST_BACK) {
                		returnUrl = request.getAttribute("serverSslDomain") + "/pc/mypage/myOrderCancelBackList.do?searchState=back";
                	}else if(StringUtil.getInt(commandMap.get("ORD_PRD_ORD_STATE")) == Code.OST_SWAP) {
                		returnUrl = request.getAttribute("serverSslDomain") + "/pc/mypage/myOrderCancelBackList.do?searchState=swap";
                	}
                	mv.addObject("returnUrl", returnUrl);
                }
	            
	            // View page
                mv.setViewName("/pc/common/result");
	        }
	        
	        return mv;
    	}
        else
        {
        	throw new PcAuthenticationException();
        }
    }

    /**
    * <pre>
    * 1. MethodName : changeOrderProductRegistPopup
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 교환접수 팝업
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked" })
    @FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/changeOrderProductRegistPopup")
    public ModelAndView changeOrderProductRegistPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
	    	ModelAndView mv = new ModelAndView();
	
	    	//본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
	    	
	    	if(result > 0){
	    		// Common Codes
	        	String[] codes = {"ORDER_CANCEL_RETURN_REASON"};
	        	mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	        	
	        	//주문상품 정보
	        	commandMap.put("GET_ERP_STOCK", true);
	        	commandMap.put("GET_ERP_STOCK_ALL_SIZE", true);
	        	commandMap.put("GET_CHANGE_CPN", true);
	            Map<String, Object> resultMap = orderService.selectOrderView(commandMap); //this.orderService.selectChangeOrderProductView(commandMap);
	            /*
	            Map<String, Object> changeOrderProductInfo = (Map<String, Object>) resultMap.get("changeOrderProductInfo");
	            // 상품 옵션 가져오기
	            
     			int PRD_OPT_IDX = StringUtil.getInt(changeOrderProductInfo.get("PRD_OPT_IDX"));//필수옵션값
     			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
     				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(changeOrderProductInfo);
     				changeOrderProductInfo.put("optionList", optionList);//해당 상품 필수옵션 리스트
     			}
     			
     			//서브 옵션 리스트
     			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
     			int SUB_OPTION_CNT =  StringUtil.getInt(changeOrderProductInfo.get("SUB_OPTION_CNT"));
     			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
    				subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(changeOrderProductInfo);
    				changeOrderProductInfo.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
     			}
	            */
	            
	         // Common Codes
	            
	            mv.addAllObjects(resultMap);
	            
	            /** 2020.06.29 카드정보 및 할부기간 테이블 및 코드값 임시 데이터 불러오기  */
	            List<Map<String, Object>> cardTempList = this.cartService.selectTempCardList();
	            mv.addObject("cardTempList",cardTempList);
	            
	            mv.setViewName("pc/mypage/changeOrderProductRegistPopup");
	         
	        	//RETURN OBJECT
	        	mv.addObject("commandMap", commandMap);
	    	}else{
	    		mv.setViewName("pc/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}

	    	return mv;
    	}
    	else
        {
        	throw new PcAuthenticationException();
        }
    	
    }
    
    //교환접수 등록
    @RequestMapping(value="/mypage/changeOrderProductProc2")
    public ModelAndView changeOrderProductProc2(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        String closeMsg = "";
        String resultCode = "";
        
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_USER);
        commandMap.put("REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        
        //logger.debug("REG_ID:"+commandMap.get("REG_ID"));
        try{
        	resultCode = this.orderService.insertChangeOrderProduct2(request, commandMap);
        }catch(Exception e){
        	e.printStackTrace();
        	logger.info("========================================================================================================");
    		logger.info("Message : 교환접수중 예외 발생");
    		logger.info("========================================================================================================");
        	resultCode = "90";
        }
        
        if("00".equals(resultCode)){
        	closeMsg = "교환접수되었습니다.";       	
        }else{
        	closeMsg = "교환접수중 오류가 발생했습니다.";
        }
        mv.setViewName("pc/common/result");
        mv.addObject("returnUrl", "/pc/mypage/myOrderCancelBackList.do");
        mv.addObject("closeMsg", closeMsg);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    
    @AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/pc/mypage/useCouponAjax", method = RequestMethod.POST)
    public JSON useCouponAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
    	if(SessionsUser.isLogin(request)) {
    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
    		return json;
		}
		else
	    {
	    	throw new PcAuthenticationException();
	    }
    }
    /**
    * <pre>
    * 1. MethodName : changeOrderProductProc
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 프론트 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 교환접수 등록
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/pc/mypage/changeOrderProductProcAjax", method = RequestMethod.POST)
    public JSON changeOrderProductProcAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
    		Map<String, Object> resultMap = new HashMap<String, Object>();
    		int result = 0;
            String resultMsg = "에러가 발생했습니다.";
            
    		//본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int chkResult = this.pcMyShoppingService.selectOrderCount(commandMap);
    		
	    	if(chkResult > 0){
	    		// 선택옵션 목록까지 다 가져와서 처리해야한다.
	    		List<Map<String,Object>> prdList = this.pcMyShoppingService.selectOrdPrdAllOptionList(commandMap);
	    				
	    		if(!prdList.isEmpty()){
	    			for(Map<String,Object> prd : prdList){
	    				int PRD_ORD_PRD_ORD_STATE = StringUtil.getInt(prd.get("ORD_PRD_ORD_STATE"));
	    				if(Code.OST_SEND_END != PRD_ORD_PRD_ORD_STATE && Code.OST_SWAP_READY_CANCEL != PRD_ORD_PRD_ORD_STATE){//옵션중 하나라도 배송완료 or 교환취소가 아닌 경우 교환접수 불가
	    					String PRD_NM = StringUtil.getString(prd.get("PRD_NM"));
	    					String ORD_PRD_ORD_STATE_NM = StringUtil.getString(prd.get("ORD_PRD_ORD_STATE_NM"));
	    					result = -1;
	    					String PRD_SLT_YN = StringUtil.getString(prd.get("ORD_PRD_SLT_YN"));
	    					String prdTypeStr = "Y".equals(PRD_SLT_YN) ? "선택옵션상품" : "상품";
	    					resultMsg = PRD_NM + " "+ prdTypeStr +"이 "+ ORD_PRD_ORD_STATE_NM + " 상태입니다.\n교환이 불가능합니다.";
	    					break;
	    				}
	    			}
	    		}
	    		
	    		if(result >= 0){
		            try{
		            	commandMap.put("prdList", prdList);
		            	resultMap = this.pcMyShoppingService.insertChangeOrderProduct(request, commandMap);
		            	
		            	result = StringUtil.getInt(resultMap.get("result"));
			    		resultMsg = StringUtil.getString(resultMap.get("resultMsg"));
		            }catch(Exception e){
		            	e.printStackTrace();
		            	logger.info("========================================================================================================");
		        		logger.info("Message : 교환접수중 예외 발생");
		        		logger.info("========================================================================================================");
		            	result = -1;
		            }
	    		}
	    	}
	    	json.addObject("result",result);
	    	json.addObject("resultMsg",resultMsg);
	    	
	    	return json;
    	}
    	else
        {
        	throw new PcAuthenticationException();
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : repayPrepareAjax
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 재결제 요청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/repayPrepareAjax.do")
    public JSON repayPrepareAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
            //본인 주문인지 체크
        	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
        		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
        		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
        	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        	}    	
        	result = this.pcMyShoppingService.selectOrderCount(commandMap);

        	if(result > 0){
        		// 주문 정보
            	Map<String, Object> orderInfo = this.orderService.selectOrderInfo(commandMap);
            	
        		// 주문상품 목록
            	commandMap.put("repayYn", "Y");//재결제시에는 선택옵션 상품들까지 다 가지고 와야 한다.
                commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
                List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
        		
        		// -- 사용자정보 전달
        		User user = SessionsUser.getSessionUser(request);
        		commandMap.put("user", user);
        		
        		// -- 사용자 아이피
        		String remote_addr = request.getRemoteAddr();
        		commandMap.put("remote_addr", remote_addr);

        		// -- 세션정보
        		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
        		commandMap.put("session_id", session_id);
        		
    			// 재결제 주문 임시 데이터 생성
        		commandMap.put("orderInfo",orderInfo);
        		commandMap.put("orderProductList",orderProductList);
    			String ORD_MST_CD = this.cartService.insertRepayTempOrder(commandMap, request);
    			
    			if(!"".equals(ORD_MST_CD)){
    				commandMap.put("ORD_MST_CD", ORD_MST_CD);
    				commandMap.put("PRE_ORD_MST_CD", StringUtil.getString(orderInfo.get("ORD_MST_CD")));
    				result = 1;
    			}else{
    				result = -2;
    			}
        				
    			json.addObject("result", result);
    			json.addObject("resultMsg", resultMsg);
    			json.addObject("ORD_MST_CD", StringUtil.getString(commandMap.get("ORD_MST_CD")));
    			json.addObject("PRE_ORD_MST_CD", StringUtil.getString(commandMap.get("PRE_ORD_MST_CD")));
        	}
    		
        	return json;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : productOptionCntModifyAjax
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 마이페이지 주문 상세 옵션 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
	@RequestMapping(value = "/pc/mypage/productOptionCntModifyAjax.do")
	public JSON productOptionCntModifyAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		
		if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
			//본인 주문인지 체크
        	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
        		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
        		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
        	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        	}    	
        	result = this.pcMyShoppingService.selectOrderCount(commandMap);

			if (result > 0 && !"".equals(StringUtil.getString(commandMap.get("ORD_PRD_IDX"), ""))) {
				commandMap = this.pcMyShoppingService.updateProductOptionCnt(commandMap);
			}
			
			json.addAllObjects(commandMap);
			
			return json;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
    
    /**
    * <pre>
    * 1. MethodName : backAvailableCheckAjax
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 반품 가능 여부 체크
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
	@RequestMapping(value = "/pc/mypage/backAvailableCheckAjax.do")
	public JSON backAvailableCheckAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
			//본인 주문인지 체크
        	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
        		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
        		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
        	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        	}    	
        	result = this.pcMyShoppingService.selectOrderCount(commandMap);

			if (result > 0) {
				
				String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR"));
	            if(!"".equals(ORD_PRD_IDX_ARR)){
	            	String[] ordPrdIdxs = ORD_PRD_IDX_ARR.split(",");
	            	commandMap.put("FRONT_ORD_PRD_IDX_ARR", ordPrdIdxs);
	            }
            	List<Map<String,Object>> prdList = this.pcMyShoppingService.selectOrdPrdAllOptionList(commandMap);
	    		if(!prdList.isEmpty()){
	    			for(Map<String,Object> prd : prdList){
	    				int PRD_ORD_PRD_ORD_STATE = StringUtil.getInt(prd.get("ORD_PRD_ORD_STATE"));
	    				if(Code.OST_SEND_END != PRD_ORD_PRD_ORD_STATE && Code.OST_SWAP_READY_CANCEL != PRD_ORD_PRD_ORD_STATE){//옵션중 하나라도 배송완료 or 교환취소가 아닌 경우 반품접수 불가
	    					String PRD_NM = StringUtil.getString(prd.get("PRD_NM"));
	    					String ORD_PRD_ORD_STATE_NM = StringUtil.getString(prd.get("ORD_PRD_ORD_STATE_NM"));
	    					result = -1;
	    					String PRD_SLT_YN = StringUtil.getString(prd.get("ORD_PRD_SLT_YN"));
	    					String prdTypeStr = "Y".equals(PRD_SLT_YN) ? "선택옵션상품" : "상품";
	    					resultMsg = PRD_NM + " "+ prdTypeStr +"이 "+ ORD_PRD_ORD_STATE_NM + " 상태입니다.\n반품이 불가능합니다.";
	    					break;
	    				}
	    			}
	    		}
			}
			
			json.addObject("result",result);
			json.addObject("resultMsg",resultMsg);
			
			return json;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
    
    /**
    * <pre>
    * 1. MethodName : swapAvailableCheckAjax
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 교환 가능 여부 체크
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
	@RequestMapping(value = "/pc/mypage/swapAvailableCheckAjax.do")
	public JSON swapAvailableCheckAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request))
        {
			//본인 주문인지 체크
        	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
        		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
        		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
        	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        	}    	
        	result = this.pcMyShoppingService.selectOrderCount(commandMap);

			if (result > 0) {
            	List<Map<String,Object>> prdList = this.pcMyShoppingService.selectOrdPrdAllOptionList(commandMap);
	    		if(!prdList.isEmpty()){
	    			for(Map<String,Object> prd : prdList){
	    				int PRD_ORD_PRD_ORD_STATE = StringUtil.getInt(prd.get("ORD_PRD_ORD_STATE"));
	    				if(Code.OST_SEND_END != PRD_ORD_PRD_ORD_STATE && Code.OST_SWAP_READY_CANCEL != PRD_ORD_PRD_ORD_STATE){//옵션중 하나라도 배송완료 or 교환취소가 아닌 경우 교환접수 불가
	    					String PRD_NM = StringUtil.getString(prd.get("PRD_NM"));
	    					String ORD_PRD_ORD_STATE_NM = StringUtil.getString(prd.get("ORD_PRD_ORD_STATE_NM"));
	    					result = -1;
	    					String PRD_SLT_YN = StringUtil.getString(prd.get("ORD_PRD_SLT_YN"));
	    					String prdTypeStr = "Y".equals(PRD_SLT_YN) ? "선택옵션상품" : "상품";
	    					resultMsg = PRD_NM + " "+ prdTypeStr +"이 "+ ORD_PRD_ORD_STATE_NM + " 상태입니다.\n교환이 불가능합니다.";
	    					break;
	    				}
	    			}
	    		}
				
			}
			
			json.addObject("result",result);
			json.addObject("resultMsg",resultMsg);
			
			return json;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
    
    /**
    * <pre>
    * 1. MethodName : taxInvoiceFormPopup
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 세금계산서 신청 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/pc/mypage/taxInvoiceFormPopup")
    public ModelAndView taxInvoiceFormPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
	    	ModelAndView mv = new ModelAndView();
	
	    	//본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
	    	
	    	if(result > 0){
	    		// 주문 정보
            	Map<String, Object> orderInfo = this.orderService.selectOrderInfo(commandMap);
	    		
	            mv.setViewName("pc/mypage/taxInvoiceFormPopup");
	            
	        	//RETURN OBJECT
	            mv.addObject("orderInfo", orderInfo);
	        	mv.addObject("commandMap", commandMap);
	    	}else{
	    		mv.setViewName("pc/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}

	    	return mv;
    	}
    	else
        {
        	throw new PcAuthenticationException();
        }
    	
    }
    
    /**
    * <pre>
    * 1. MethodName : insertTaxIvcProc
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 세금계산서 신청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/pc/mypage/insertTaxIvcProc", method = RequestMethod.POST)
    public ModelAndView insertTaxIvcProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
    		ModelAndView mv = new ModelAndView();
    		String closeMsg = "에러가 발생했습니다.";
            int resultCd = 0;
            
    		//본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
    		
	    	if(result > 0){
	            commandMap.put("TAX_IVC_REG_ID", "".equals(StringUtil.getString(SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID(),"")) ? "_GUEST_" : SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	            commandMap.put("TAX_IVC_REG_IP", request.getRemoteAddr());
	            
	            try{
	            	resultCd = this.pcMyShoppingService.insertTaxIvc(commandMap);
	            }catch(Exception e){
	            	e.printStackTrace();
	            	logger.info("========================================================================================================");
	        		logger.info("Message : 세금계산서 신청중 예외 발생");
	        		logger.info("========================================================================================================");
	        		resultCd = -1;
	            }
	            
	            if(resultCd > 0){
	            	closeMsg = "신청되었습니다.";       	
	            }else{
	            	closeMsg = "세금계산서 신청중 오류가 발생했습니다.";
	            }
	            
	            mv.addObject("parentReload", "Y");
	    	}
	    	
	    	mv.setViewName("pc/common/result");
            mv.addObject("closeMsg", closeMsg);
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
    * 1. MethodName : insertEstimateOrderAjax
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 견적 주문 바로구매
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 2. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/insertEstimateOrderAjax.do")
    public JSON insertEstimateOrderAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
    	if(SessionsUser.isLogin(request))
        {
    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID

    		// -- 사용자정보 전달
    		User user = SessionsUser.getSessionUser(request);
    		commandMap.put("user", user);
    		
    		// -- 사용자 아이피
    		String remote_addr = request.getRemoteAddr();
    		commandMap.put("remote_addr", remote_addr);

    		// -- 세션정보
    		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
    		commandMap.put("session_id", session_id);
    		
			// 견적 주문 임시 데이터 생성
    		// ESM_PRD_MST_IDX 견적관리 idx 필요
    		// 쿼리에서 PCH 테이블 INNER JOIN으로 걸것
    		Map<String,Object> resultMap = this.cartService.insertEstimateTempOrder(commandMap, request);
			String ORD_MST_CD = StringUtil.getString(resultMap.get("ORD_MST_CD"));
			resultMsg = StringUtil.getString(resultMap.get("resultMsg"));
			
			if(!"".equals(ORD_MST_CD)){
				commandMap.put("ORD_MST_CD", ORD_MST_CD);
				result = 1;
			}else{
				result = -2;
			}
    				
			json.addObject("result", result);
			json.addObject("resultMsg", resultMsg);
			json.addObject("ORD_MST_CD", StringUtil.getString(commandMap.get("ORD_MST_CD")));
    		
        	return json;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : orderCancelRequestAjax
    * 2. ClassName  : MyShoppingController.java
    * 3. Comment    : 주문 취소 요청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 3. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/pc/mypage/orderCancelRequestAjax", method = RequestMethod.POST)
    public JSON orderCancelRequestAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
    		JSON json = new JSON();
    		String resultMsg = "에러가 발생했습니다.";
            int resultCd = 0;
            
    		//본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
	    		commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
	    	}    	
	    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
    		
	    	if(result > 0){
	            try{
	            	resultCd = this.pcMyShoppingService.updateOrderCancelRequest(commandMap);
	            }catch(Exception e){
	            	e.printStackTrace();
	            	logger.info("========================================================================================================");
	        		logger.info("Message : 주문 취소 요청 중 에러 발생");
	        		logger.info("========================================================================================================");
	        		resultCd = -1;
	            }
	            
	            if(resultCd > 0){
	            	resultMsg = "취소요청되었습니다.";       	
	            }else{
	            	resultMsg = "취소요청 중 오류가 발생했습니다.";
	            }
	    	}
	    	
	    	json.addObject("result", result);
			json.addObject("resultMsg", resultMsg);
	    	return json;
    	}
    	else
        {
        	throw new PcAuthenticationException();
        }
    }
}
