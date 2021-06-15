package com.market.mall.mobile.mypage.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.MemberDeliveService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyProductCommentService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.product.service.ProductService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : MyShoppingController.java
 * @Date : 2016. 2. 16.
 * @프로그램 설명 : 모바일 > 마이페이지 > 나의 쇼핑내역을 처리하는 Controller Class
 * @author DEV_KANGHYUNKYU
 */
@Controller("mobileMyShoppingController")
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
	
	@Resource(name = "pcMemberDeliveService")
	private MemberDeliveService pcMemberDeliveService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST;
	
	/**
	* <pre>
	* 1. MethodName : myShoppingList
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myShoppingList")
    public ModelAndView myShoppingList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 배송현황
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 날짜 없는 경우 기본 6개월
            String searchDate = StringUtil.getString(commandMap.get("searchDate"), "3");
            commandMap.put("searchDate", searchDate);
            if("1".equals(searchDate)){//1주일
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-"));
            }else if("2".equals(searchDate)){//한달
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-1),"-"));
            }else if("3".equals(searchDate)){//6개월
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
            }else if("4".equals(searchDate)){//1년
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-"));
            }
            
            // 기본값 설정 - 검색 날짜(-6개월)
            commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-")));
            commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
            commandMap.put("searchMaxDate", DateUtil.getToday("-"));
            commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-"));

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            // 나의 쇼핑내역 목록 갯수
            commandMap.put("searchDlvGbn", Code.CART_DLV_GBN_NORMAL_CD);
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

            // 해당 브랜드로 이동
            mv.setViewName("mobile/mypage/myShoppingList");
            
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
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : myOrderCancelBackList
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 (취소/반품 내역)
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myOrderCancelBackList")
    public ModelAndView myOrderCancelBackList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("searchCancelBack", "Y");
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 배송현황
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 날짜 없는 경우 기본 6개월
            String searchDate = StringUtil.getString(commandMap.get("searchDate"), "3");
            commandMap.put("searchDate", searchDate);
            if("1".equals(searchDate)){//1주일
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-"));
            }else if("2".equals(searchDate)){//한달
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-1),"-"));
            }else if("3".equals(searchDate)){//6개월
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
            }else if("4".equals(searchDate)){//1년
            	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-"));
            }
            
            // 기본값 설정 - 검색 날짜(-6개월)
            commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-")));
            commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
            commandMap.put("searchMaxDate", DateUtil.getToday("-"));
            commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-"));
            
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
            mv.setViewName("mobile/mypage/myOrderCancelBackList");

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
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : myOfflineShoppingList
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 오프라인 매장 주문내역
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myOfflineShoppingList")
    public ModelAndView myOfflineShoppingList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 배송현황
            Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            List<Map<String, Object>> list = null;
            Paging paging = null;
            // 회원정보
            Map<String,Object> userInfo = this.pcMyShoppingService.selectMemberInfo(request, commandMap);
            String MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID")); //ERP ID
            
            if(!"".equals(MEM_MST_ERP_ID)){
            	commandMap.put("MEM_MST_ERP_ID", MEM_MST_ERP_ID);
            	
            	// 날짜 없는 경우 기본 6개월
                String searchDate = StringUtil.getString(commandMap.get("searchDate"), "3");
                commandMap.put("searchDate", searchDate);
                if("1".equals(searchDate)){//1주일
                	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-"));
                }else if("2".equals(searchDate)){//한달
                	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-1),"-"));
                }else if("3".equals(searchDate)){//6개월
                	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
                }else if("4".equals(searchDate)){//1년
                	commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-"));
                }
                
                // 기본값 설정 - 검색 날짜(-6개월)
                commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-")));
                commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
                commandMap.put("searchMaxDate", DateUtil.getToday("-"));
                commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-12),"-"));

                // 오프라인 매장 주문내역 개수
                commandMap.put("searchDlvGbn", Code.CART_DLV_GBN_GET_IT_NOW_CD);
                int totalCount = this.pcMyShoppingService.selectMyShoppingListCount(commandMap);
                commandMap.put("pageSize", 10);
                paging = new Paging(totalCount, commandMap); 
                
                if(totalCount > 0){
                    // 오프라인 매장 주문내역 목록
                	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
                }        
            }

            mv.setViewName("mobile/mypage/myOfflineShoppingList");
            
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
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : gestDeliveryList
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 비회원 주문/배송 조회 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/mobile/mypage/gestDeliveryList")
    public ModelAndView gestDeliveryList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isNonLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));
            commandMap.put("ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));
            
            // 배송현황
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

            // 해당 브랜드로 이동
            mv.setViewName("mobile/mypage/gestDeliveryList");
            
            //RETURN OBJECT
            mv.addObject("myPageOrderInfo", myPageOrderInfo);
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : gestOrderCancelBackList
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 비회원 주문/배송 조회 (취소/반품 내역)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/mobile/mypage/gestOrderCancelBackList")
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
            mv.setViewName("mobile/mypage/gestOrderCancelBackList");

            //RETURN OBJECT
            mv.addObject("myPageOrderInfo", myPageOrderInfo);
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }

	/**
	* <pre>
	* 1. MethodName : myShoppingInfo
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 > 주문상세
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/mobile/mypage/myShoppingInfo")
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
        		/** if (orderPayInfo != null)
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
        		} */
                
          		// 로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
        		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
        		if(isUser){
        			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
        			mv.addObject("userInfo", userInfo);
        			
        			// 마이페이지 요약정보
                    Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
                    mv.addObject("summaryMap", summaryMap);

                    
                    String DEFAULT_CASHBAG_CARD_NO = "";
        			
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
        	 			Map<String,Object> getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);
        	 			mv.addObject("getItNowShopInfo",getItNowShopInfo);
        	 			
        	 			/** 겟잇나우 수령인 정보 수정 팝업용 정보 */
            			// 겟잇나우 수령자와의 관계
            			mv.addObject("getItNowReceiverList", this.pcCommonService.selectCode("GET_IT_NOW_RECEIVER_CD"));
            	 		/** 겟잇나우 수령인 정보 수정 팝업용 정보 */
        	 		}
        	 		
        	 		/** 배송지 수정 팝업용 정보 */
        	 		// 최근 배송지 목록
        			List<Map<String,Object>> recentDlvList = this.cartService.selectRecentDlvList(commandMap);
        			mv.addObject("recentDlvList", recentDlvList);
        			
        			// 나의 배송지 목록
        			List<Map<String,Object>> myDlvList = this.pcMemberDeliveService.selectMemberDeliveList(commandMap);
        			mv.addObject("myDlvList", myDlvList);
        			/** 배송지 수정 팝업용 정보 */
        		}
                
        		/** 배송지 수정 팝업용 정보 */
        		// 배송 메세지
        		mv.addObject("dlvMsgList", this.pcCommonService.selectCode("DLV_MESSAGE_CD"));
        		// 핸드폰 앞자리
        		mv.addObject("hpCodeList", this.pcCommonService.selectCode("HP_CODE"));
        		// 전화번호 국번
        		mv.addObject("telCodeList", this.pcCommonService.selectCode("TEL_CODE"));
        		/** 배송지 수정 팝업용 정보 */
        		
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
    		
        	mv.setViewName("mobile/mypage/myShoppingInfo");
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : orderCancelPopup
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 주문취소 팝업 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping("/mobile/mypage/orderCancelPopup")
    public ModelAndView orderCancelPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
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
	            commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
	            mv.addObject("depositBankList", this.cartService.selectCodeList(commandMap));
	            
	            // 주문 정보
	            commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	            Map<String, Object> orderCancelInfo = this.pcMyShoppingService.selectOrderCancelInfo(commandMap);
	            
	    		// 할인/결제정보(환불계좌)
	            Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);

	            //RETURN OBJECT
	            mv.addObject("orderCancelInfo", orderCancelInfo);
	            mv.addObject("orderPayInfo", orderPayInfo);
	            mv.addObject("commandMap", commandMap);
	            mv.setViewName("mobile/mypage/orderCancelPopup");
	    	}else{
	    		mv.setViewName("mobile/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : orderBack
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 반품접수 팝업
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping("/mobile/mypage/orderBack")
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
		            mv.setViewName("mobile/mypage/orderBackPopup");
	            }
	    	}else{
	    		mv.setViewName("mobile/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : orderStateProc
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 > 주문취소 or 반품접수 or 구매확정
	* 모바일은 pc와 다르게 ajax 로 처리한다...!
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/mobile/mypage/orderStateProcAjax", method=RequestMethod.POST)
    public JSON orderStateProcAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request) || SessionsUser.isNonLogin(request)){
    		JSON json = new JSON();
	        
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
	        	 String closeMsg ="처리 중 오류가 발생하였습니다.";
	        	 
	        	// 프론트에서는 주문취소/반품접수 가능(구매확정은 상품평 등록시 구매확정되기 때문에 그쪽에서 처리한다.)
	        	// 클린킹 예약상담취소도 가능~~~~
	        	int ORD_PRD_ORD_STATE = StringUtil.getInt(commandMap.get("ORD_PRD_ORD_STATE"));
	        	if(ORD_PRD_ORD_STATE == Code.OST_CANCEL || ORD_PRD_ORD_STATE == Code.OST_BACK || ORD_PRD_ORD_STATE == Code.OST_CLEANKING_CANCEL){
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
			            	commandMap.put("ordPrdIdxs", totOrdPrdIdxs);
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
			                }
			            	else
			            	{
			            		result = -2;
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
			        		result = -2;
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
	        	
	        	json.addObject("result",result);
		    	json.addObject("resultMsg",closeMsg);
	        }
	        
	        return json;
    	}
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : changeOrderProductRegist
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 교환접수 팝업 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
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
    @RequestMapping("/mobile/mypage/changeOrderProductRegist")
    public ModelAndView changeOrderProductRegist (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
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
	            Map<String, Object> resultMap = this.orderService.selectChangeOrderProductView(commandMap);
	            
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
	            
	            mv.addAllObjects(resultMap);
	            
	            mv.setViewName("mobile/mypage/changeOrderProductRegistPopup");
	            
	        	//RETURN OBJECT
	        	mv.addObject("commandMap", commandMap);
	    	}else{
	    		mv.setViewName("mobile/common/result");
	    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
	    	}

	    	return mv;
    	}
    	else
        {
        	throw new MobileAuthenticationException();
        }
    	
    }
	
	/**
	* <pre>
	* 1. MethodName : changeOrderProductProcAjax
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 모바일 > 마이페이지 > 나의 쇼핑내역 > 주문상세 팝업 > 교환접수 등록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.order_guest)
    @FrontBannerSkip()
    @RequestMapping(value="/mobile/mypage/changeOrderProductProcAjax", method = RequestMethod.POST)
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
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : repayPrepareAjax
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 재결제 요청
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
    @RequestMapping("/mobile/mypage/repayPrepareAjax.do")
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
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : productOptionCntModifyAjax
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 마이페이지 주문 상세 옵션 변경
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
	@RequestMapping(value = "/mobile/mypage/productOptionCntModifyAjax.do")
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
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : backAvailableCheckAjax
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 반품 가능 여부 체크
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
	@RequestMapping(value = "/mobile/mypage/backAvailableCheckAjax.do")
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
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : swapAvailableCheckAjax
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 교환 가능 여부 체크
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.order_guest)
	@RequestMapping(value = "/mobile/mypage/swapAvailableCheckAjax.do")
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
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : insertEstimateOrderAjax
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 견적 주문 바로구매
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 16.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/insertEstimateOrderAjax.do")
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
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : myGetItNowOrderList
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 겟잇나우 주문 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myGetItNowOrderList")
    public ModelAndView myGetItNowOrderList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            List<Map<String, Object>> list = this.pcMyShoppingService.selectGetItNowOrderList(commandMap);

            //RETURN OBJECT
            mv.addObject("list", list);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : myGetItNowOrderInfo
	* 2. ClassName  : MyShoppingController.java
	* 3. Comment    : 겟잇나우 주문 상세
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myGetItNowOrderInfo")
    public ModelAndView myGetItNowOrderInfo (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            //본인 주문인지 체크
        	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        		commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        	}    	
        	int result = this.pcMyShoppingService.selectOrderCount(commandMap);

        	if(result > 0){
        		// 겟잇나우 상세
        		Map<String,Object> getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);
	 			mv.addObject("getItNowShopInfo",getItNowShopInfo);
        		
                mv.addObject("commandMap", commandMap);
        	}
        	
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
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
    @RequestMapping(value="/mobile/mypage/orderCancelRequestAjax", method = RequestMethod.POST)
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
        	throw new MobileAuthenticationException();
        }
    }
}
