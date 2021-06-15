package com.market.mall.mobile.cart.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.KakaoPayDataEncrypt;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.lgcns.kmpay.dto.DealApproveDto;
import com.lgcns.kmpay.service.CallWebService;
import com.market.mall.am.board.service.AgreementBoardService;
import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.pg.Payment;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.member.service.MemberDeliveService;
import com.market.mall.pc.mypage.service.MyKeepService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.mobile.cart.controller
 * @FileName : CartController.java
 * @Date : 2016. 2. 5.
 * @프로그램 설명 : 장바구니 / 주문.결제를 처리하는 Controller Class
 * @author DEV_KANGHYUNKYU
 */
@Controller("mobileCartController")
@AccessLevelUser(ROLEUSER.guest)
public class CartController {
	@Resource
	protected Sms sms;
	@Resource
	private CartService cartService;
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "pcCommonService")
	private CommonService pcCommonService;

	@Resource(name = "pcMemberDeliveService")
	private MemberDeliveService pcMemberDeliveService;
	
	@Resource(name = "pcMyPageService")
	private MyPageService pcMyPageService;
	
	@Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
	
	@Resource(name="agreementBoardService")
	private AgreementBoardService agreementBoardService;
	
	@Resource(name="productListService") 	
	private ProductListService productListService;
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource KakaoPayDataEncrypt kakaoPayDataEncrypt;
	
	@Resource Payment payment;
	
	@Resource (name="paymentService") 
	PaymentService paymentService;
	
	@Resource(name="orderService")
    private OrderService orderService;
	
	@Resource (name="orderErrorService")
	OrderErrorService orderErrorService;
	
	@Resource(name="pcJoinMemberService") 
	private JoinMemberService pcJoinMemberService;
	
	@Resource(name="pcMyKeepService")
    private MyKeepService pcMyKeepService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE;
	
	private final static String CART_PC_MOBILE_GUBUN = "M";	//PC, MOBILE 구분
	
	@RequestMapping("/mobile/cart/carttest.do")
	public ModelAndView carttest(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : insertCartAjax
	 * 2. ClassName  : CartController.java
	 * 3. Comment    : 장바구니 상품 추가
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/insertCartAjax.do", method = RequestMethod.POST)
	public JSON insertCartAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);

		// -- 세션정보 (비회원으로 장바구니에 넣으면 session_id로 저장되고, 로그인 시 session_id가 MEM_CRT_SES_ID = ''로 update 하고  MEM_MST_MEM_ID = '회원아이디' 로 update
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);

		// 상품 옵션 idx
		String[] TEMP_OPT_DTL_IDXs = request.getParameterValues("OPT_DTL_IDXs");
		List<String> OPT_DTL_IDXs = Arrays.asList(TEMP_OPT_DTL_IDXs);
		commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
		
		// 겟잇나우 여부
		int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));
		if(Code.CART_DLV_GBN_GET_IT_NOW_CD == MEM_CRT_DLV_GBN){// 겟잇나우인 경우 재고 체크 하지 않음
			// 겟잇나우 중복 체크
			Map<String, Object> getItNowCheck = this.cartService.checkGetItNowCart(commandMap);
			
			if((Integer)getItNowCheck.get("result") > 0){//장바구니 담기 가능
				// 장바구니 상품 추가
				result = this.cartService.insertCart(commandMap);
			}else{//장바구니 담기 불가
				result = (Integer)getItNowCheck.get("result");
				resultMsg = StringUtil.getString(getItNowCheck.get("resultMsg"));
			}
			
		}else{
			// 재고 체크
			Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
			
			if((Integer)prdStock.get("result") > 0){//재고 있음
				// 장바구니 상품 추가
				result = this.cartService.insertCart(commandMap);
			}else{//재고 없음
				result = (Integer)prdStock.get("result");
				resultMsg = StringUtil.getString(prdStock.get("resultMsg"));
			}
		}
		
		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);

		// 카트 수량 가져오기
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			paramMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}
		paramMap.put("MEM_CRT_SES_ID", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));
		// 상품 채널 타입
		paramMap.put("PRD_MST_CNL_MB_YN", "Y"); //mobile용 
		json.addObject("cartCnt", String.valueOf(this.cartService.selectCartCnt(paramMap)));    	
		
		return json;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : insertDirectPurchaseAjax
	 * 2. ClassName  : CartController.java
	 * 3. Comment    : 상품상세 -> 바로구매
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/insertDirectPurchaseAjax.do", method = RequestMethod.POST)
	public JSON insertDirectPurchaseAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		// 상품 옵션 idx
		//String[] TEMP_OPT_DTL_IDXs = request.getParameterValues("OPT_DTL_IDXs");
		//List<String> OPT_DTL_IDXs = Arrays.asList(TEMP_OPT_DTL_IDXs);
		//commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
		
		// 겟잇나우 여부
		
//		int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));
//		if(Code.CART_DLV_GBN_GET_IT_NOW_CD == MEM_CRT_DLV_GBN){// 겟잇나우인 경우 재고 체크 하지 않음
//			// 장바구니 상품 추가
//			result = this.cartService.insertDirectPurchase(commandMap, request);
//		}else{
//			// 재고 체크
//			Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
//			
//			if((Integer)prdStock.get("result") > 0){//재고 있음
//				// 장바구니 상품 추가
				result = this.cartService.insertDirectPurchase(commandMap, request);
//			}else{//재고 없음
//				result = (Integer)prdStock.get("result");
//				resultMsg = StringUtil.getString(prdStock.get("resultMsg"));
//			}
//		}
				
		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);
		json.addObject("ORD_MST_CD", StringUtil.getString(commandMap.get("ORD_MST_CD")));

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : insertCartpaymentAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니 -> 주문서(임시 주문 데이터 생성)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/insertCartpaymentAjax.do", method = RequestMethod.POST)
	public JSON insertCartpaymentAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		//재고 수량 체크
		String[] TEMP_MEM_CRT_IDXs = request.getParameterValues("MEM_CRT_IDX[]");
		List<String> MEM_CRT_IDXs = Arrays.asList(TEMP_MEM_CRT_IDXs);
		commandMap.put("MEM_CRT_IDXs", MEM_CRT_IDXs);
		Map<String, Object> cartStock = new HashMap<String,Object>();//this.cartService.selectCrtStock(commandMap);
		cartStock.put("result", 777);
		
		if((Integer)cartStock.get("result") > 0){
			// 임시 주문 생성
			String ORD_MST_CD = this.cartService.insertTempOrder(commandMap);
			
			if(!"".equals(ORD_MST_CD)){
				commandMap.put("ORD_MST_CD", ORD_MST_CD);
				result = 1;
			}else{
				result = -2;
			}
		}else{
			result = (Integer)cartStock.get("result");
			resultMsg = StringUtil.getString(cartStock.get("resultMsg"));
		}

		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);
		json.addObject("ORD_MST_CD", StringUtil.getString(commandMap.get("ORD_MST_CD")));

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : cartlist
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니목록 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/mobile/cart/cartlist.do")
	public ModelAndView cartlist(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		// 로그인한 경우 사용자 정보 가져온다.
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			mv.addObject("userInfo", userInfo);
			
			// 키핑 상품 가져오기
			//키핑 상품 MOBILE 구분 값
			commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_LARGE);
            commandMap.put("CHN_GBN",Code.USER_ENV_TYPE_MOBILE);
            commandMap.put("quickKeep","Y");
            mv.addObject("keepingPrdList", this.pcMyKeepService.selectKeepProductList(commandMap));
	        
	        // 마이페이지 요약정보(쿠폰/마일리지/포인트)
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            mv.addObject("summaryMap", summaryMap);
		}

		// 상품 채널 타입
		commandMap.put("PRD_MST_CNL_MB_YN", "Y"); //MOBILE용 
		// -- 상품정보
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectCartlist(commandMap);
		
		// 상품 옵션 가져오기
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		if(!cartlist.isEmpty()){
			for(Map<String, Object> cart : cartlist){
				int PRD_OPT_IDX = StringUtil.getInt(cart.get("PRD_OPT_IDX"));//필수옵션값
				if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
					List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(cart);
					cart.put("optionList", optionList);//해당 상품 필수옵션 리스트
				}
				
				//서브 옵션 리스트
				List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
				int SUB_OPTION_CNT =  StringUtil.getInt(cart.get("SUB_OPTION_CNT"));
				if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
					subPrdList = this.cartService.selectCartSubPrdList(cart);
					cart.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
					
					for(Map<String, Object> subPrd : subPrdList){
						List<Map<String,Object>> subOptionList = this.cartService.selectCartOptionDetailList(subPrd);
						subPrd.put("subOptionList", subOptionList);//해당 상품 서브 상품의 옵션 리스트
					}
				}
				
				// 청구할인 목록 가져오기
				//cart.put("CRD_PMT_GBN", Code.CARD_EVENT_TYPE_CHARGE);//청구할인만 가져온다
				//List<Map<String,Object>> cardPromotionList = this.cartService.selectCardPromotionList(cart);
				//cart.put("cardPromotionList", cardPromotionList);//해당 상품 청구할인 카드 목록
			}
		}
		
		//-- 사용자정보
		commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
		
        // 카드 이벤트 안내 목록
		List<Map<String,Object>> longInsCartList24 = (List<Map<String, Object>>) commandMap.get("longInsCartList24");
		List<Map<String,Object>> longInsCartList36 = (List<Map<String, Object>>) commandMap.get("longInsCartList36");
		if(!longInsCartList24.isEmpty() || !longInsCartList36.isEmpty()){
			commandMap.put("longCartYn", "Y");
		}
		List<Map<String,Object>> cardEventFreeList = this.cartService.selectCardEventFreeList(commandMap);
		
		int cardListSize = 0;
		if(cardEventFreeList != null){
			int cardIdx = 0;
			List<Map<String,Object>> subCardList = null;
			for(int i=0;i<cardEventFreeList.size();i++){
				Map<String,Object> cardMap = cardEventFreeList.get(i);
				int RNUM = StringUtil.getInt(cardMap.get("RNUM"));
				int CRD_DIV_CNT = StringUtil.getInt(cardMap.get("CRD_DIV_CNT"));
				if(RNUM == 1 && CRD_DIV_CNT > 1){//대표 카드인 경우 인덱스 저장
					cardIdx = i;
					subCardList = new ArrayList<Map<String,Object>>();
				}else if(RNUM > 1){//서브 카드는 리스트에 담아놓는다.
					if(subCardList != null){
						subCardList.add(cardMap);
					}
				}
				
				//마지막 서브 카드인 경우 대표 카드에 담는다.
				if(RNUM > 1 && RNUM == CRD_DIV_CNT){
					cardEventFreeList.get(cardIdx).put("subCardList", subCardList);
				}
				
				//RNUM 이 1인 애들만 COUNT
				if(RNUM == 1){
					cardListSize++;
				}
			}
		}
		
        mv.addObject("cardEventFreetList", cardEventFreeList);
        mv.addObject("cardListSize", cardListSize);
        
 		mv.setViewName("mobile/cart/cartlist");
		mv.addAllObjects(commandMap);

		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : calculateCartAmountAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니 주문금액 계산(체크박스 바뀔때마다 실행)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/calculateCartAmountAjax.do")
	public JSON calculateCartAmountAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);

		// 상품 채널 타입
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		
		// -- 상품정보
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		
		String[] cart_idx_arr = request.getParameterValues("MEM_CRT_IDX[]");
		List<String> MEM_CRT_IDXs = Arrays.asList(cart_idx_arr);
		commandMap.put("MEM_CRT_IDXs", MEM_CRT_IDXs);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectCartlist(commandMap);

		// 계산 금액만 담는다.
		Iterator<String> keys = commandMap.keySet().iterator();
        while( keys.hasNext() ){
            String key = keys.next();
            if(key.indexOf("cart_") == 0){
            	//logger.debug("key==="+key);
            	//logger.debug("value==="+commandMap.get(key));
            	json.addObject(key, commandMap.get(key));
            }
        }
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : deleteCart
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니 상품 개별/전체 삭제 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip
	@RequestMapping(value = "/mobile/cart/deleteCart.do", method = RequestMethod.POST)
	public JSON deleteCart(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);

		String[] cart_idx_arr = request.getParameterValues("MEM_CRT_IDX[]");
		List<String> MEM_CRT_IDXs = Arrays.asList(cart_idx_arr);
		commandMap.put("MEM_CRT_IDXs", MEM_CRT_IDXs);

		this.cartService.deleteCart(commandMap);

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : cartpayment
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니 -> 주문서작성
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/mobile/cart/cartpayment.do")
	public ModelAndView cartpayment(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//logger.debug("request method =========="+request.getMethod());
		/*if(request.getMethod().equals("GET") || request.getMethod().equals("get")){
			mv.addObject("alertMsg", "잘못된 접근입니다.\\n메인으로 이동합니다.");
			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + "/mobile/main/index.do");
			mv.setViewName("mobile/common/result");
			return mv;
		}*/
		
		// 주문번호
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("주문서 ORD_MST_CD ========="+ORD_MST_CD);
		
		if("".equals(ORD_MST_CD)){
			String returnUrl = StringUtil.getString(commandMap.get("returnUrl"));
			mv.addObject("alertMsg", "주문할 상품이 없습니다.\\n메인으로 이동합니다.");
			mv.addObject("returnUrl", ""==returnUrl ? StringUtil.getString(request.getAttribute("mobileDomain"),"") + "/mobile/main/index.do" : returnUrl);
			mv.setViewName("mobile/common/result");
			return mv;
		}
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
				
		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
				
		// 로그인한 경우 주소정보 가져와서 배송지 default 값으로 사용한다.
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			mv.addObject("userInfo", userInfo);
			
			// 최근 배송지 목록
			List<Map<String,Object>> recentDlvList = this.cartService.selectRecentDlvList(commandMap);
			mv.addObject("recentDlvList", recentDlvList);
			
			// 나의 배송지 목록
			List<Map<String,Object>> myDlvList = this.pcMemberDeliveService.selectMemberDeliveList(commandMap);
			mv.addObject("myDlvList", myDlvList);
			
			// 캐쉬백 카드번호
			Map<String, Object> preOrderCashbagInfo = this.cartService.selectPreOrderCashbagInfo(commandMap);
			String DEFAULT_CASHBAG_CARD_NO = "";
			if(preOrderCashbagInfo != null){//이전 주문에서 사용한 캐쉬백 카드 있는 경우
				DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(preOrderCashbagInfo.get("PAY_MST_KICC_CARD_NO"));
			}else{//이전 주문에서 사용한 캐쉬백 카드 없는 경우 회원 기본 캐쉬백 카드 번호
				Map<String, Object> memberCashbagInfo = this.cartService.selectMemberCashbagInfo(commandMap);
				if(memberCashbagInfo != null){//회원 캐쉬백 카드 있는 경우
					DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
				}
			}
			mv.addObject("DEFAULT_CASHBAG_CARD_NO", DEFAULT_CASHBAG_CARD_NO);
			
			// 마이페이지 요약정보(쿠폰/마일리지/포인트)
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            mv.addObject("summaryMap", summaryMap);
			
			// 소멸예정 마일리지 조회
			//commandMap.put("MEM_MST_MEM_ID", "lkw0114");
			Map<String, Object> extinctMileageMap = null;
			
			int extinctMileage = 0;
            if(extinctMileageMap == null){
            	extinctMileage = 0;
            }else{
            	extinctMileage = StringUtil.getInt(extinctMileageMap.get("EXMILEGE"));
            }
            mv.addObject("extinctMileage", extinctMileage);
            
            //회원 사용가능 마일리지
            String MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID"));
            commandMap.put("P9AN8", MEM_MST_ERP_ID);	//고객번호1719133
            //commandMap.put("P9AN8", 1719133);	//고객번호1719133
            Map<String, Object> memberMileageMap = null;

            int SOLUBLE_MILEAGE = Integer.valueOf(String.valueOf(memberMileageMap.get("SOLUBLE_MILEAGE")));//사용 가능 마일리지
            mv.addObject("SOLUBLE_MILEAGE", SOLUBLE_MILEAGE);
		}
		
		// 재결제시 이전 주문번호
		String PRE_ORD_MST_CD = StringUtil.getString(commandMap.get("PRE_ORD_MST_CD"));
		logger.info("주문서 PRE_ORD_MST_CD ========="+PRE_ORD_MST_CD);
		mv.addObject("PRE_ORD_MST_CD", PRE_ORD_MST_CD);
		
		// 주문서 금액 RESET
		this.cartService.updateTempCartAmtReset(commandMap);
		this.cartService.updateTempCartPrdAmtReset(commandMap);
		// 캐쉬백 조회 이력 삭제
		this.paymentService.deletePayMaster(commandMap);
				
		// 주문상품 리스트
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		if(cartlist.isEmpty()){
			String returnUrl = StringUtil.getString(commandMap.get("returnUrl"));
			mv.addObject("alertMsg", "주문서 생성에 실패하였습니다.\\n메인으로 이동합니다.");
			mv.addObject("returnUrl", ""==returnUrl ? StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + "/mobile/main/index.do" : returnUrl);
			mv.setViewName("mobile/common/result");
			return mv;
		}
		
		// 겟잇나우 주문인 경우 지점 정보 가져오기
		int ORD_TMP_DLV_GBN = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DLV_GBN"));
		if(ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){
			String SHP_MST_IDX = StringUtil.getString(cartlist.get(0).get("ORD_TMP_SHP_MST_IDX"));
			commandMap.put("SHP_MST_IDX",SHP_MST_IDX);
			Map<String,Object> getItNowShopInfo = this.cartService.selectGetItNowShopInfo(commandMap);
			mv.addObject("getItNowShopInfo",getItNowShopInfo);
			
			mv.addObject("getItNowReceiverList", this.pcCommonService.selectCode("GET_IT_NOW_RECEIVER_CD"));
		}
		
		 // 카드
        if(ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){
        	Map<String,Object> map_card = new HashMap<String,Object>();
			 // 장기할부인 경우 장기할부 가능 카드만 불러와야 한다.
			int ORD_TMP_LNG_DIV = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_LNG_DIV"));//개월수
			String cart_total = StringUtil.getString(commandMap.get("cart_total"));//결제금액

			map_card.put("ORD_TMP_LNG_DIV",ORD_TMP_LNG_DIV);
			map_card.put("cart_total",cart_total);
			
			List<Map<String,Object>> longCardCdList = this.cartService.selectCardLongInstallmentList(map_card);
			List<String> longCardCdArr = new ArrayList<String>();
			if(!longCardCdList.isEmpty()){
				for(Map<String,Object> longCardCd : longCardCdList){
					longCardCdArr.add(StringUtil.getString(longCardCd.get("DIV_DTL_CD")));
				}
				commandMap.put("longCardCdArr", longCardCdArr);
				try{
					mv.addObject("cardList", this.cartService.selectKiccCardList(commandMap));
				}catch(Exception e){
					mv.addObject("methodType","get");
					mv.addObject("alertMsg", "장기할부 가능 카드가 없습니다.\\n관리자에게 문의하시기 바랍니다.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + "/mobile/cart/cartlist.do");
					mv.setViewName("mobile/common/result");
					return mv;
				}
			}else{
				int longCardMinPrc = this.cartService.selectCardLongInstallmentMinimumPrc(map_card);
				
				String alertMsg = "장기할부 가능 카드가 없습니다.\\n관리자에게 문의하시기 바랍니다.";
				if(longCardMinPrc > 0){
					alertMsg = ORD_TMP_LNG_DIV +"개월 장기할부 주문 가능 최소금액은 "+ String.format("%,d", longCardMinPrc) +"원입니다.";
				}
				
				mv.addObject("methodType","get");
				mv.addObject("alertMsg", alertMsg);
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + "/mobile/cart/cartlist.do");
				mv.setViewName("mobile/common/result");
				return mv;
			}
		}else{
			mv.addObject("cardList", this.cartService.selectKiccCardList(commandMap));
		}
		
		// 재결제시 기존 주문 정보 필요
		if(!"".equals(PRE_ORD_MST_CD)){
			int PRE_USED_MLG = StringUtil.getInt(cartlist.get(0).get("PRE_USED_MLG"));
			//int SUM_FIN_DLV_ADD_CHARGE = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE"));
			
			logger.debug("재결제시 기존 사용 마일리지 PRE_USED_MLG==="+PRE_USED_MLG);
			//logger.debug("재결제시 기존 추가배송비 합계 SUM_FIN_DLV_ADD_CHARGE==="+SUM_FIN_DLV_ADD_CHARGE);
			
			// 재결제 주문은 마일리지 & 추가 배송비만 셋팅. 나머지는 0.
			// 가상마일리지(기존 주문에서 사용했던 마일리지 금액)
			commandMap.put("ORD_TMP_DC_MLG", PRE_USED_MLG);
			// 추가 배송비 업데이트
			//commandMap.put("ORD_TMP_DLV_ADD_CAG", SUM_FIN_DLV_ADD_CHARGE);//총 추가 배송비는 list에서 계산해서 가져온다.
			this.cartService.updateTempCartAmt(commandMap);
			
			// 금액 재계산
			//this.cartService.selectTempOrderProductList(commandMap);
			//cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
			
			mv.addObject("PRE_USED_MLG", PRE_USED_MLG);
			//mv.addObject("PRE_DLV_ADD_CAG", SUM_FIN_DLV_ADD_CHARGE);
			
			// 기존 주문 정보 가져오기
			Map<String,Object> preMap = new HashMap<String,Object>();
			preMap.put("ORD_MST_CD", PRE_ORD_MST_CD);
			Map<String,Object> preOrderInfo = this.orderService.selectOrderInfo(preMap);//주문정보
			Map<String,Object> preOrderDlvInfo = this.orderService.selectDeliveryInfo(preMap);//배송정보
			
			boolean isMyOrder = true;
			String PRE_ORD_MST_ORD_NM = StringUtil.getString(preOrderInfo.get("ORD_MST_ORD_NM"));
			String PRE_ORD_MST_ORD_ID = StringUtil.getString(preOrderInfo.get("ORD_MST_ORD_ID"));
			
			//본인 주문인지 체크
	    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.order_guest){
	    		String SESSION_ORD_NM = SessionsUser.getSessionUserValue("ORD_MST_ORD_NM");
	    		if(!PRE_ORD_MST_ORD_NM.equals(SESSION_ORD_NM)){
	    			isMyOrder = false;
	    		}
	    	}else if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
	    		String SESSION_ORD_ID = SessionsUser.getSessionUserValue("MEM_MST_MEM_ID");
    			if(!PRE_ORD_MST_ORD_ID.equals(SESSION_ORD_ID)){
    				isMyOrder = false;
	    		}
	    	}
			
	    	if(!isMyOrder){
	    		String returnUrl = StringUtil.getString(commandMap.get("returnUrl"));
				mv.addObject("alertMsg", "주문서 생성에 실패하였습니다.\\n메인으로 이동합니다.");
				mv.addObject("returnUrl", ""==returnUrl ? StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + "/mobile/main/index.do" : returnUrl);
				mv.setViewName("mobile/common/result");
				return mv;
	    	}
	    	
			mv.addObject("preOrderInfo", preOrderInfo);
			mv.addObject("preOrderDlvInfo", preOrderDlvInfo);
		}
		
		// 상품 옵션 가져오기
		List<List> prdCpnListArr = new ArrayList<List>();//상품 쿠폰리스트를 담은 리스트
		List<List> dlvCpnListArr = new ArrayList<List>();//배송비 쿠폰리스트를 담은 리스트
		List<List> dlvBundleCpnListArr = new ArrayList<List>();//묶음 배송비 쿠폰리스트를 담은 리스트
		int dlvBundleIndex = 0; //묶음배송 대표 index
		
		int cartIndex = 0;
		for(Map<String, Object> cart : cartlist){
			int PRD_OPT_IDX = StringUtil.getInt(cart.get("PRD_OPT_IDX"));//필수옵션값
			if(PRD_OPT_IDX > 0){//옵션 있는 상품인 경우에만 가져온다.
				List<Map<String,Object>> optionList = this.cartService.selectCartOptionDetailList(cart);
				cart.put("optionList", optionList);//해당 상품 필수옵션 리스트
			}
			
			//서브 옵션 리스트
			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
			int SUB_OPTION_CNT =  StringUtil.getInt(cart.get("SUB_OPTION_CNT"));
			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
				subPrdList = this.cartService.selectTempOrderSubPrdList(cart);
				cart.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
			}
			
			//로그인한 경우 쿠폰 정보 가져온다
			if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
				if("".equals(PRE_ORD_MST_CD)){//재주문 아닌 경우에만 가져온다.
					String PRD_MST_CD = StringUtil.getString(cart.get("PRD_MST_CD"));
					commandMap.put("PRD_MST_CD", PRD_MST_CD);//상품코드
					commandMap.put("PRD_TMP_CNT", cart.get("PRD_TMP_CNT"));//수량
					commandMap.put("OPT_DTL_IDX", cart.get("OPT_DTL_IDX"));//필수옵션 IDX
					commandMap.put("CHN_DTL_CD", StringUtil.getString(cart.get("CHN_DTL_CD")));//채널코드
					
					commandMap.put("CART_COUPON_TYPE", "prd");//상품쿠폰
					List<Map<String,Object>> prdCpnList = this.cartService.selectCartCouponList(commandMap);
					if(!prdCpnList.isEmpty()){
						cart.put("prdCpnList", prdCpnList);//상품별 상품 쿠폰 리스트
						prdCpnListArr.add(prdCpnList);
					}
					
					//배송비가 있는 경우에만 배송비 쿠폰 조회
					int FIN_DLV_CHARGE = StringUtil.getInt(cart.get("FIN_DLV_CHARGE"));//무료배송여부
					String FREE_DLV_CHARGE_YN = StringUtil.getString(cart.get("FREE_DLV_CHARGE_YN"));//최종배송비
					String DLV_BUNDLE_YN = StringUtil.getString(cart.get("DLV_BUNDLE_YN"));//묶음배송여부
					int VDR_ROWNUM = StringUtil.getInt(cart.get("VDR_ROWNUM"));//순번
					int VDR_IDX_CNT = StringUtil.getInt(cart.get("VDR_IDX_CNT"));//업체수(묶음배송 상품 개수)
					
					if("N".equals(DLV_BUNDLE_YN)){//개별배송인 경우
						if(FIN_DLV_CHARGE > 0 && "N".equals(FREE_DLV_CHARGE_YN)){
							commandMap.put("CART_COUPON_TYPE", "dlv");//배송비쿠폰
							List<Map<String,Object>> dlvCpnList = this.cartService.selectCartCouponList(commandMap);
							if(!dlvCpnList.isEmpty()){
								cart.put("dlvCpnList", dlvCpnList);//상품별 배송비 쿠폰 리스트
								dlvCpnListArr.add(dlvCpnList);
							}
						}
					}else{//묶음배송인 경우
						//무료배송 아닌 경우에만 적용
						if("N".equals(FREE_DLV_CHARGE_YN)){
							//묶음배송 중 첫번째 PRD_TMP_IDX는 대표 상품이므로 저장해둔다. 여기에 배송비 쿠폰 리스트를 담아서 넘길 예정.
							if(VDR_ROWNUM == 1){
								dlvBundleIndex = cartIndex;
								dlvBundleCpnListArr = new ArrayList<List>();
							}
							
							commandMap.put("CART_COUPON_TYPE", "dlv");//배송비쿠폰
							List<Map<String,Object>> dlvCpnList = this.cartService.selectCartCouponList(commandMap);
							if(!dlvCpnList.isEmpty()){
								dlvCpnListArr.add(dlvCpnList);
								dlvBundleCpnListArr.add(dlvCpnList);//묶음배송 리스트를 담는다.
							}
							
							if(VDR_IDX_CNT == VDR_ROWNUM && !dlvBundleCpnListArr.isEmpty()){//묶음배송 마지막 상품인 경우
								cartlist.get(dlvBundleIndex).put("dlvBundleCpnListArr", dlvBundleCpnListArr);//첫번째 대표 상품에 모든 쿠폰 리스트를 담아둔다.
							}
						}
					}
					
					if(FIN_DLV_CHARGE > 0 && "N".equals(FREE_DLV_CHARGE_YN)){
						commandMap.put("CART_COUPON_TYPE", "dlv");//배송비쿠폰
						List<Map<String,Object>> dlvCpnList = this.cartService.selectCartCouponList(commandMap);
						if(!dlvCpnList.isEmpty()){
							cart.put("dlvCpnList", dlvCpnList);//상품별 배송비 쿠폰 리스트
							dlvCpnListArr.add(dlvCpnList);
						}
					}
				}
			}
			
			cartIndex++;
		}
		
		//전체적용 가능 쿠폰(전체 쿠폰목록에 중복 존재하는 쿠폰 리스트)
		if(!prdCpnListArr.isEmpty()){
			int preListSize = 999999;
			Map<String,Object> minPrdCpnMap = new HashMap<String,Object>();
			for(List<Map<String,Object>> prdCpnList : prdCpnListArr){
				if(prdCpnList.size() > 0){
					if(prdCpnList.size() < preListSize){
						preListSize = prdCpnList.size();
						minPrdCpnMap.put("prdCpnList", prdCpnList);//개수가 가장 적은 쿠폰 리스트를 기준 리스트로 만든다.
					}
				}
			}
			
			List<Map<String,Object>> criterionPrdCpnList = (List<Map<String, Object>>) minPrdCpnMap.get("prdCpnList");//기준 리스트
			Set<String> totPrdCpnSet = new HashSet<String>();//중복 제거된 CPN_MST_IDX 셋(적용가능한 쿠폰 count 보여주기 위한 용도)
			for(int i=0;i<criterionPrdCpnList.size();i++){
				int dupCnt = 0;//중복 개수
				criterionPrdCpnList.get(i).put("totListCnt", prdCpnListArr.size());
				
				for(int j=0;j<prdCpnListArr.size();j++){
					List<Map<String,Object>> prdCpnList = prdCpnListArr.get(j);
					for(int k=0;k<prdCpnList.size();k++){
						String CPN_MST_IDX = (String) criterionPrdCpnList.get(i).get("CPN_MST_IDX");
						String THIS_CPN_MST_IDX = (String) prdCpnList.get(k).get("CPN_MST_IDX");
						totPrdCpnSet.add(THIS_CPN_MST_IDX);//총 상품쿠폰
						
						if(CPN_MST_IDX.equals(THIS_CPN_MST_IDX)){//다른 리스트와 중복되는 경우만 count+1 한다. 화면단에서 전체 개수와 dupCnt가 동일한 쿠폰만 보여준다.
							dupCnt++;
						}
						criterionPrdCpnList.get(i).put("dupCnt", dupCnt);
					}
				}
				
			}
			
			mv.addObject("criterionPrdCpnList",criterionPrdCpnList);
			mv.addObject("totPrdCpnSet",totPrdCpnSet);
		}
		
		//배송비 쿠폰(적용 가능한 쿠폰 개수 가져오기)
		if(!dlvCpnListArr.isEmpty()){
			//묶음배송인 경우 쿠폰 리스트 합쳐서 보여준다.
			for(Map<String, Object> cart : cartlist){
				Set<Map<String,Object>> dlvBundleCpnSet = new HashSet<Map<String,Object>>();//중복 제거된 쿠폰 리스트 셋(묶음배송)
				List<List> tmp_dlvBundleCpnListArr = (List<List>) cart.get("dlvBundleCpnListArr");
				if(tmp_dlvBundleCpnListArr != null){
					for(int j=0;j<tmp_dlvBundleCpnListArr.size();j++){
						List<Map<String,Object>> dlvCpnList = tmp_dlvBundleCpnListArr.get(j);
						for(int k=0;k<dlvCpnList.size();k++){
							String CPN_MST_IDX = StringUtil.getString(dlvCpnList.get(k).get("CPN_MST_IDX"));
							String CPN_MST_TITLE = StringUtil.getString(dlvCpnList.get(k).get("CPN_MST_TITLE"));
							String END_DATE = StringUtil.getString(dlvCpnList.get(k).get("END_DATE"));
							Map<String,Object> dlvBundleCpn = new HashMap<String,Object>();
							dlvBundleCpn.put("CPN_MST_IDX", CPN_MST_IDX);
							dlvBundleCpn.put("CPN_MST_TITLE", CPN_MST_TITLE);
							dlvBundleCpn.put("END_DATE", END_DATE);
							dlvBundleCpnSet.add(dlvBundleCpn);
						}
					}
					
					cart.put("dlvCpnList", dlvBundleCpnSet);//묶음 배송비 쿠폰 리스트는 대표 상품에 담아둔다.
				}
			}
			
			Set<String> totDlvCpnSet = new HashSet<String>();//중복 제거된 CPN_MST_IDX 셋(적용가능한 쿠폰 count 보여주기 위한 용도)
			for(int j=0;j<dlvCpnListArr.size();j++){
				List<Map<String,Object>> dlvCpnList = dlvCpnListArr.get(j);
				for(int k=0;k<dlvCpnList.size();k++){
					String THIS_CPN_MST_IDX = (String) dlvCpnList.get(k).get("CPN_MST_IDX");
					totDlvCpnSet.add(THIS_CPN_MST_IDX);//총 배송비 쿠폰
				}
			}
			mv.addObject("totDlvCpnSet",totDlvCpnSet);
		}
		
		// 픽업 주문 있는 경우 매장 정보 가져온다.
		/*if(((List)commandMap.get("pickupCartList")).size() > 0){
			commandMap.put("serverCompCd", StringUtil.getString(request.getAttribute("serverCompCd")));
			commandMap.put("shopInfo", this.cartService.selectBcncInfo(commandMap));
		}*/
		
		// 사은품 리스트
		// 재결제는 불러오지 않는다.
		// 클린킹도 불러오지 않는다.
		if("".equals(PRE_ORD_MST_CD)  && ORD_TMP_DLV_GBN != Code.CART_DLV_GBN_SERVICE_CD){
			Map<String, Object> giftMap = new HashMap<String, Object>();
			giftMap.put("SUM_TOT_ORDER_PRICE", cartlist.get(0).get("SUM_TOT_ORDER_PRICE"));//총주문금액
			giftMap.put("ORD_MST_CD", ORD_MST_CD);//주문번호
			giftMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);//썸네일 사이즈
			commandMap.put("giftList", this.cartService.selectGiftList(giftMap));
		}
		
		// 카드 이벤트 안내 목록
		if(ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){
			commandMap.put("longCartYn", "Y");
		}
		List<Map<String,Object>> cardEventFreeList = this.cartService.selectCardEventFreeList(commandMap);
		
		int cardListSize = 0;
		if(cardEventFreeList != null){
			int cardIdx = 0;
			List<Map<String,Object>> subCardList = null;
			for(int i=0;i<cardEventFreeList.size();i++){
				Map<String,Object> cardMap = cardEventFreeList.get(i);
				int RNUM = StringUtil.getInt(cardMap.get("RNUM"));
				int CRD_DIV_CNT = StringUtil.getInt(cardMap.get("CRD_DIV_CNT"));
				if(RNUM == 1 && CRD_DIV_CNT > 1){//대표 카드인 경우 인덱스 저장
					cardIdx = i;
					subCardList = new ArrayList<Map<String,Object>>();
				}else if(RNUM > 1){//서브 카드는 리스트에 담아놓는다.
					if(subCardList != null){
						subCardList.add(cardMap);
					}
				}
				
				//마지막 서브 카드인 경우 대표 카드에 담는다.
				if(RNUM > 1 && RNUM == CRD_DIV_CNT){
					cardEventFreeList.get(cardIdx).put("subCardList", subCardList);
				}
				
				//RNUM 이 1인 애들만 COUNT
				if(RNUM == 1){
					cardListSize++;
				}
			}
		}
		
        mv.addObject("cardEventFreetList", cardEventFreeList);
        mv.addObject("cardListSize", cardListSize);
        
        // 카드 행사 목록
        mv.addObject("cardPromotionList", this.cartService.selectCardPromotionList(commandMap));
		
		/** PG 관련 셋팅 START */
		String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
		commandMap.put("CST_PLATFORM", CST_PLATFORM ); //LG유플러스 결제서비스 선택(test:테스트, service:서비스)

		// 핸드폰 앞자리
		mv.addObject("hpCodeList", this.pcCommonService.selectCode("HP_CODE"));
		
		// 전화번호 국번
		mv.addObject("telCodeList", this.pcCommonService.selectCode("TEL_CODE"));
		
		// 무통장입금 계좌 마감 기한, D+3일 자정
		Calendar bank_account_calendar = Calendar.getInstance();
		bank_account_calendar.add(Calendar.DATE, 3);
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
		String LGD_CLOSEDATE = dateformat.format(bank_account_calendar.getTime());
		//LGD_CLOSEDATE += "235959";
		
		commandMap.put("EP_expire_date", LGD_CLOSEDATE);
		//commandMap.put("LGD_CLOSEDATE", LGD_CLOSEDATE);
		commandMap.put("LGD_CLOSEDATE_TEXT", dateformat_text.format(bank_account_calendar.getTime()));
		
		// 입금은행
        commandMap.put("CODE", Code.KICC_BANK_CD);
        commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
        mv.addObject("depositBankList", this.cartService.selectCodeList(commandMap));
        
		/** PG 관련 셋팅 END */
        
        /** 우편번호 찾기 레이어팝업 위한 지역 코드 START */
        // 지역코드
		mv.addObject("sidoList", this.pcCommonService.selectCode("AREA_CD"));
		
		// 프로토콜 여부 (https : true / http : false)
		boolean secureYn = request.isSecure();
		String domain = "";
		
		if(secureYn)
		{
			domain = StringUtil.getString(request.getAttribute("mobileSslDomain"));
		}
		else
		{
			domain = StringUtil.getString(request.getAttribute("mobileDomain"));
		}
		mv.addObject("domain",domain);
		/** 우편번호 찾기 레이어팝업 위한 지역 코드 END */
		
  		// 사용자정보
		commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
        
        // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "PAY_TYPE", "DLV_MESSAGE_CD"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        
        //오늘날짜의 해당연도를 구함
        Calendar t = Calendar.getInstance();
  		String year = Integer.toString(t.get(Calendar.YEAR));
  		// 90일 이후 날짜의 연도 구함
  		t.add(Calendar.DATE, 90);
  		String year2 = Integer.toString(t.get(Calendar.YEAR));
  		
  		HashSet<String> yearList = new HashSet<String>();
  		yearList.add(year);
  		yearList.add(year2);
  		mv.addObject("yearList",yearList);
        
        mv.setViewName("mobile/cart/cartpayment");
		mv.addAllObjects(commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : paymentPrepare
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니 -> 주문서작성 -> 결제요청
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	@FrontBannerSkip
	@RequestMapping(value = "/mobile/cart/paymentPrepare.do", method = RequestMethod.POST)
	public JSON paymentPrepare(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		json.addObject("result",0);
		
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		logger.info("주문 PREPARE ORD_MST_CD ========="+ORD_MST_CD);
		
		Map<String, Object> tempCartMap = new HashMap<String, Object>();
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		tempCartMap.put("user", user);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		tempCartMap.put("session_id", session_id);
				
		// 주문상품 리스트
		tempCartMap.put("ORD_MST_CD", ORD_MST_CD);
		tempCartMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		tempCartMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		tempCartMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(tempCartMap);
		
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) tempCartMap.get("cartlist");
		
		if(cartlist.isEmpty()){
			json.addObject("result",-999);
			json.addObject("resultMsg","주문서 생성에 실패했습니다.");
			return json;
		}
		
		// 배송유형
		int ORD_TMP_DLV_GBN = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DLV_GBN"));
		
		// 클린킹인 경우 클린킹 불가 상품 체크 필요.
		if(Code.CART_DLV_GBN_SERVICE_CD == ORD_TMP_DLV_GBN){
			//겟잇나우인 경우 상품 겟잇나우 가능 여부 한번 더 체크한다.
			int CLEANKING_Y_CNT = StringUtil.getInt(cartlist.get(0).get("CLEANKING_Y_CNT"));
			if(cartlist.size() != CLEANKING_Y_CNT){
				json.addObject("result",-888);
				json.addObject("resultMsg","클린킹 주문 불가 상품이 포함되어 있습니다.");
				return json;
			}
		}
				
		// 결제 전 재고 확인
		// 겟잇나우는 ERP 재고 체크한다.
		if(Code.CART_DLV_GBN_GET_IT_NOW_CD == ORD_TMP_DLV_GBN){
			//겟잇나우인 경우 상품 겟잇나우 가능 여부 한번 더 체크한다.
			int O2O_Y_CNT = StringUtil.getInt(cartlist.get(0).get("O2O_Y_CNT"));
			if(cartlist.size() != O2O_Y_CNT){
				json.addObject("result",-888);
				json.addObject("resultMsg","겟잇나우 주문 불가 상품이 포함되어 있습니다.");
				return json;
			}
		}
		
		// 재고 확인
		Map<String, Object> cartStock = this.cartService.selectTempOrderStock(commandMap);
		if((Integer)cartStock.get("result") < 0){
			json.addObject("result",(Integer)cartStock.get("result"));
			json.addObject("resultMsg",(String)cartStock.get("resultMsg"));
			return json;
		}
		
		// 결제대상금액 등 결제관련 정보 준비
		int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999) + CART_PAYMENT_DELIVERY; // 주문금액 + 총배송비
		int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
		int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
		
		commandMap.put("CART_PAYMENT_DC_MILEAGE", CART_PAYMENT_DC_MILEAGE);
		commandMap.put("CART_PAYMENT_DC_CASHBAG", CART_PAYMENT_DC_CASHBAG);
		commandMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);

		// 최종 결제금액
		int CART_PAYMENT_TOTAL = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_MILEAGE - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON;
		
		if(CART_PAYMENT_TOTAL < 0){
			json.addObject("result",-888);
			json.addObject("resultMsg","결제금액이 0원 이하인 경우 주문이 불가능합니다.\n관리자에게 문의해주시기 바랍니다.");
			return json;
		}
		
		commandMap.put("CART_PAYMENT_TOTAL", CART_PAYMENT_TOTAL);
		
		logger.debug("CART_PAYMENT_DELIVERY===="+CART_PAYMENT_DELIVERY);
		logger.debug("CART_PAYMENT_AMOUNT===="+CART_PAYMENT_AMOUNT);
		logger.debug("CART_PAYMENT_DC_MILEAGE===="+CART_PAYMENT_DC_MILEAGE);
		logger.debug("CART_PAYMENT_DC_CASHBAG===="+CART_PAYMENT_DC_CASHBAG);
		logger.debug("CART_PAYMENT_DC_COUPON===="+CART_PAYMENT_DC_COUPON);
		logger.debug("CART_PAYMENT_TOTAL===="+CART_PAYMENT_TOTAL);
		
		// 회원 or 비회원 쿠폰/포인트/캐쉬백 사용 체크
		Map<String, Object> userInfo = null;
		String MEM_MST_DCT_YN = ""; 
		int SOLUBLE_MILEAGE = 0;
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			userInfo = this.cartService.selectUserInfo(commandMap);
			MEM_MST_DCT_YN = StringUtil.getString(userInfo.get("MEM_MST_DCT_YN"));//쿠폰/마일리지/포인트 사용 제한 여부
			
			//회원 사용가능 마일리지
			String MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID"));
            commandMap.put("P9AN8", MEM_MST_ERP_ID);	//고객번호1719133
            //commandMap.put("P9AN8", 1719133);	//고객번호1719133
            Map<String, Object> memberMileageMap = null;
            SOLUBLE_MILEAGE = Integer.valueOf(String.valueOf(memberMileageMap.get("SOLUBLE_MILEAGE")));//사용 가능 마일리지
		}
		
		// 일반회원/간편회원만 쿠폰 사용 가능. 그 외에 사용시 에러 처리
		if(CART_PAYMENT_DC_COUPON > 0){
			if(userInfo == null || "Y".equals(MEM_MST_DCT_YN) || (Code.COMMON_PRI_MEMBER_GRADE != StringUtil.getInt(userInfo.get("MEM_MST_MEM_GBN")) && Code.MEMBER_TYPE_SIMPLE != StringUtil.getInt(userInfo.get("MEM_MST_MEM_GBN")))  ){
				logger.error("##################### 비 일반회원/간편회원 쿠폰 사용 ###########################");
				
				json.addObject("result",-888);
				json.addObject("resultMsg", "일반회원만 쿠폰 사용이 가능합니다.");
				return json;
			}
		}
		
		// 일반회원만 캐쉬백 포인트 사용 가능. 그 외에 사용시 에러 처리
		if(CART_PAYMENT_DC_CASHBAG > 0 && (userInfo == null ||  "Y".equals(MEM_MST_DCT_YN) || Code.COMMON_PRI_MEMBER_GRADE != StringUtil.getInt(userInfo.get("MEM_MST_MEM_GBN")))){
			logger.error("##################### 비 일반회원 캐쉬백 포인트 사용 ###########################");
			
			json.addObject("result",-888);
			json.addObject("resultMsg", "일반회원만 캐쉬백 포인트 사용이 가능합니다.");
			return json;
		}
		
		// 일반회원만 마일리지 사용 가능. 그 외에 사용시 에러 처리
		if(CART_PAYMENT_DC_MILEAGE > 0 && (userInfo == null || "Y".equals(MEM_MST_DCT_YN) || Code.COMMON_PRI_MEMBER_GRADE != StringUtil.getInt(userInfo.get("MEM_MST_MEM_GBN")))){
			logger.error("##################### 비 일반회원 마일리지 사용 ###########################");
			
			json.addObject("result",-888);
			json.addObject("resultMsg", "일반회원만 마일리지 사용이 가능합니다.");
			return json;
		}
		
		// 가용 마일리지 확인
		if(CART_PAYMENT_DC_MILEAGE > 0){
			if(CART_PAYMENT_DC_MILEAGE > SOLUBLE_MILEAGE){
				logger.error("##################### 사용 마일리지["+ CART_PAYMENT_DC_MILEAGE +"] 가용 마일리지["+ SOLUBLE_MILEAGE +"] 추가 ###########################");
				
				json.addObject("result",-888);
				json.addObject("resultMsg", "가용 마일리지가 부족합니다.");
				return json;
			}
		}
		
		// 장기할부인 경우 최소 구매 가능 금액 체크
		if(ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){
        	Map<String,Object> map_card = new HashMap<String,Object>();
			 // 장기할부인 경우 장기할부 가능 카드만 불러와야 한다.
			int ORD_TMP_LNG_DIV = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_LNG_DIV"));//개월수
			map_card.put("ORD_TMP_LNG_DIV",ORD_TMP_LNG_DIV);
			map_card.put("cart_total",CART_PAYMENT_TOTAL);
			
			int longCardMinPrc = this.cartService.selectCardLongInstallmentMinimumPrc(map_card);
			
			String resultMsg = "장기할부 가능 카드가 없습니다.\\n관리자에게 문의하시기 바랍니다.";
			if(longCardMinPrc > CART_PAYMENT_TOTAL){
				resultMsg = ORD_TMP_LNG_DIV +"개월 장기할부 주문 가능 최소금액은 "+ String.format("%,d", longCardMinPrc) +"원입니다.";

				json.addObject("result",-888);
				json.addObject("resultMsg",resultMsg);
				return json;
			}
		}
		
		// real / test 여부
		String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
		
		/** [START] KICC PARAMETER SETTING*/
		/* 공통 */
		String EP_pay_type = ""; //결제수단명 [신용카드 : card, 계좌이체 : bank, 무통장입금 : vacct, 휴대폰 : mobile, 전화결제 : phone, 포인트 : point]
		int EP_tot_amt = CART_PAYMENT_TOTAL; //결제 총 금액
		String EP_escrow_yn = "N"; //에스크로 사용유무
		//String EP_complex_yn = "N";//복합결제여부
		//String EP_tax_flag = "";//과세구분 플래그[복합과세 승인거래 : TG01]
		//int EP_com_tax_amt = 0;//과세 승인 금액[결제 총 금액 – 비과세 승인 금액 – 부가세 금액]
		//int EP_com_free_amt = 0;//비과세 승인 금액[결제 총 금액 – 과세 승인 금액 – 부가세 금액]
		//int EP_com_vat_amt = 0;//부가세 금액[결제 총 금액 – 과세 승인 금액 – 비과세 승인금액]
		
		//int EP_req_type = 0;//신용카드 요청구분 1:ISP 2:안심클릭
		String EP_return_url = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/cart/v3d_res.do";//가맹점 return URL --신용카드 안심클릭 사용시...
		
		/* 주문정보 */
		String EP_order_no = ORD_MST_CD;//가맹점 주문번호
		//String EP_product_type = "";//상품구분[0 : 실물, 1 : 컨텐츠]
		//String EP_product_nm = "상품이름";//상품명(특수문자 제외)
		int EP_product_amt = CART_PAYMENT_TOTAL;//상품금액
		//String EP_user_type = "1";//사용자 구분[1 : 일반, 2 : 회원]
		//String EP_user_id = "";//고객ID		
		//String EP_user_nm = "";//고객명
		//String EP_user_mail = "";//고객 e-mail
		//String EP_user_phone1 = "";//고객 전화번호(구매자 연락처(‘-‘없이 입력))
		//String EP_user_phone2 = "";//고객 휴대폰번호(구매자 휴대폰번호(‘-‘없이 입력))		
		//String EP_user_addr = "";//고객 주소
		
		//String EP_client_ip = "";//고객 ip ????필수????
		
		/** 신용카드 */
		/* 안심클릭 플러그인 설정정보 */
		String EP_mall_id = this.propertiesService.getString("payment.kicc.mall.id");//가맹점 mall id
		logger.debug("EP_mall_id=================="+EP_mall_id);
		
		/** [END] KICC PARAMETER SETTING*/
		
		//결제수단별 파라미터 셋팅
		int radioPayment = StringUtil.getInt(commandMap.get("radioPayment"));
		
		logger.debug("radioPayment============="+radioPayment);
		
		boolean isKiccPayment = false;
		switch(radioPayment){
			case Code.PAY_CARD : //신용카드(ISP/MPI(안심클릭))
			case Code.PAY_FOREIGN_CARD : //해외카드
				isKiccPayment = true;
				
				EP_pay_type = "card";
				
				// ERP 코드
				String ERP_IST_CD = "";
				
				int CRD_INF_IDX = StringUtil.getInt(commandMap.get("CRD_INF_IDX"));
				
				if(CRD_INF_IDX == 0){//0인 경우 해외카드
					EP_mall_id = "05109822";	//롯데
				}else{
					// 결제수단이 카드인 경우 할부여부, 겟잇나우 여부에 따라 MID가 달라진다. 장기할부는 무이자.
					// 무이자 여부
					String EP_noint = (String) commandMap.get("EP_noint"); //00 일반 02 무이자
					List<Map<String, Object>> cardList = this.cartService.selectKiccCardList(commandMap);
					Map<String, Object> cardInfo = cardList.get(0);
					if(Code.CART_DLV_GBN_GET_IT_NOW_CD == ORD_TMP_DLV_GBN){//겟잇나우인 경우
						if("00".equals(EP_noint)){//일반
							EP_mall_id = (String) cardInfo.get("CRD_INF_IST_O2O_MID");
							ERP_IST_CD = (String) cardInfo.get("CRD_INF_IST_ERP");
						}else{//무이자
							EP_mall_id = (String) cardInfo.get("CRD_INF_IST_FRE_O2O_MID");
							ERP_IST_CD = (String) cardInfo.get("CRD_INF_IST_FRE_ERP");
						}
					}else{//겟잇나우 아닌 경우
						if("00".equals(EP_noint)){//일반
							EP_mall_id = (String) cardInfo.get("CRD_INF_IST_MID");
							ERP_IST_CD = (String) cardInfo.get("CRD_INF_IST_ERP");
						}else{//무이자
							EP_mall_id = (String) cardInfo.get("CRD_INF_IST_FRE_MID");
							ERP_IST_CD = (String) cardInfo.get("CRD_INF_IST_FRE_ERP");
						}
					}
				}
				
				logger.info("############EP_mall_id###################" + EP_mall_id);
				logger.info("############ERP_IST_CD###################" + ERP_IST_CD);
				// 리얼 반영시 삭제 필요
				if("test".equals(CST_PLATFORM)){
					EP_mall_id =  this.propertiesService.getString("payment.kicc.mall.id");//가맹점 mall id
				}
				
				break;
			case Code.PAY_DEPOSIT : //무통장입금(가상계좌)
				isKiccPayment = true;
				
				// 리얼 반영시 삭제 필요
				if("test".equals(CST_PLATFORM)){
					EP_mall_id =  "T0002729";//입금 통보 위한.. 가맹점 mall id
				}
				
				EP_pay_type = "vacct";
				
				commandMap.put("EP_vacct_txtype", "10");//처리종류 10:일반형 20:고정형
				commandMap.put("EP_vacct_amt", EP_tot_amt);//결제금액
				
				break;
			case Code.PAY_ESCROW : // 에스크로	
				isKiccPayment = true;
				
				// 리얼 반영시 삭제 필요
				if("test".equals(CST_PLATFORM)){
					EP_mall_id =  "T0002729";//입금 통보 위한.. 가맹점 mall id
				}
				
				EP_escrow_yn = "Y";
				EP_pay_type = "vacct";
				
				commandMap.put("EP_vacct_txtype", "10");//처리종류 10:일반형 20:고정형
				
				// 상품 정보 담기
				String chr30 = new Character((char)30).toString();
				String chr31 = new Character((char)31).toString();
				
				String bk_goodinfo = "";
				String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
				
				String prdNm = StringUtil.getString(cartlist.get(0).get("PRD_MST_NM"));
				prdNm = prdNm.replaceAll(match, " ");
				prdNm = prdNm.replaceAll("\\s", "");		//특수문자, 공백 제거
				
				String prdNo = StringUtil.getString(cartlist.get(0).get("PRD_MST_CD"));
				int prdAmt = EP_tot_amt; 		//결제금액
				
				bk_goodinfo += "prd_no=" + prdNo + chr31;
	            bk_goodinfo += "prd_amt=" + prdAmt + chr31;
	          	bk_goodinfo += "prd_nm=" + prdNm + chr31 + chr30;
	          	
	          	//logger.debug("bk_goodinfo=============="+bk_goodinfo);
	          	
	          	commandMap.put("EP_bk_goodinfo", bk_goodinfo);
	          	commandMap.put("EP_bk_cnt", 1);
	          	
	          	//모바일은 묶음이 풀리는 현상이 있어서 각각 담아서 넘긴 후 주문 직전 다시 묶는다.
	          	commandMap.put("escrow_prd_no", prdNo);
	          	commandMap.put("escrow_prd_amt", prdAmt);
	          	commandMap.put("escrow_prd_nm", prdNm);
	          	
				break;
			case Code.PAY_ACCOUNT :	//계좌이체
				isKiccPayment = true;
				
				//EP_mall_id =  "05109822";//테스트중
				EP_return_url = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/cart/payment.do";//가맹점 return URL
				
				EP_pay_type = "bank";
				commandMap.put("hd_approve_no", this.propertiesService.getString("payment.kicc.account.approve.no"));	//금융결제원 승인번호
				
				String hd_ep_type = ("test".equals(CST_PLATFORM.trim()) ? "CERT" : "SECUCERT");
				commandMap.put("hd_ep_type", hd_ep_type);
				
				break;
			case Code.PAY_PAYNOW : //페이나우		
				/** [START] LG UPLUS PARAMETER SETTING */
				/**
				// 타임스탬프
				Calendar calendar = Calendar.getInstance();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
						
				int LGD_AMOUNT = CART_PAYMENT_TOTAL;
				String LGD_TIMESTAMP = dateFormat.format(calendar.getTime());
				
				String LGD_MERTKEY = this.propertiesService.getString("payment.lg.xpay.LGD_MERTKEY");

				// -- LGU+ 준비, 1. 기본결제 인증요청 정보 변경
				String CST_MID = this.propertiesService.getString("payment.lg.xpay.CST_MID");
				String LGD_MID = ("test".equals(CST_PLATFORM.trim()) ? "t" : "")+ CST_MID;

				commandMap.put("LGD_AMOUNT", LGD_AMOUNT); // LG유플러스 결제서비스 선택(test:테스트,service:서비스)
				commandMap.put("CST_PLATFORM", CST_PLATFORM); // LG유플러스 결제서비스선택(test:테스트,service:서비스)
				commandMap.put("CST_MID", CST_MID); // LG유플러스으로 부터 발급받으신 상점아이디를 입력하세요.
				commandMap.put("LGD_MID", LGD_MID); // 테스트 아이디는 't'를 제외하고 입력하세요.
				commandMap.put("LGD_OID", ORD_MST_CD); // 주문번호, T(R) + 주문일자(6) + 'A' +
														// 일련번호(6)
				commandMap.put("LGD_MERTKEY", LGD_MERTKEY); // 상점MertKey(mertkey는 상점관리자-> 계약정보 -> 상점정보관리에서 확인하실수있습니다)
				commandMap.put("LGD_TIMESTAMP", LGD_TIMESTAMP); // 타임스탬프
				// 상점정의 결제창 스킨(red,purple,yellow)
				commandMap.put("LGD_CUSTOM_SKIN", this.propertiesService.getString("payment.lg.xpay.LGD_CUSTOM_SKIN"));
				commandMap.put("LGD_WINDOW_VER", this.propertiesService.getString("payment.lg.xpay.LGD_WINDOW_VER")); // 결제창 버젼정보
				commandMap.put("LGD_BUYERIP", request.getRemoteAddr()); // 구매자IP
				
				// 가상계좌 NOTEURL
				commandMap.put("LGD_CASNOTEURL",
						this.propertiesService.getString("server.domain") + this.propertiesService.getString("payment.lg.xpay.LGD_CASNOTEURL"));
				
				// -- LGU+ 준비, 2. MD5 해쉬암호화 (수정하지 마세요) - BEGIN
				StringBuffer sb = new StringBuffer();
				
				sb.append(LGD_MID);
				sb.append(ORD_MST_CD);
				sb.append(LGD_AMOUNT);
				sb.append(LGD_TIMESTAMP);
				sb.append(LGD_MERTKEY);

				byte[] bNoti = sb.toString().getBytes();
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] digest = md.digest(bNoti);

				StringBuffer strBuf = new StringBuffer();
				for (int i = 0; i < digest.length; i++) {
					int c = digest[i] & 0xff;
					if (c <= 15) {
						strBuf.append("0");
					}
					strBuf.append(Integer.toHexString(c));
				}

				String LGD_HASHDATA = strBuf.toString();
				String LGD_CUSTOM_PROCESSTYPE = "TWOTR";
				
				commandMap.put("LGD_HASHDATA", LGD_HASHDATA);
				commandMap.put("LGD_CUSTOM_PROCESSTYPE", LGD_CUSTOM_PROCESSTYPE);
				*/
				/** [END] LG UPLUS PARAMETER SETTING*/
				break;
			case Code.PAY_KAKAOPAY :
				/** [START] KAKAOPAY PARAMETER SETTING*/
				String ediDate = kakaoPayDataEncrypt.getyyyyMMddHHmmss(); // 전문생성일시

				//가맹점키 (꼭 해당 가맹점키로 바꿔주세요)
				String EncodeKey = this.propertiesService.getString("payment.kakaopay.ENCODE_KEY");
				
				////////위변조 처리/////////
				//결제요청용 키값
				String MID = this.propertiesService.getString("payment.kakaopay.MID");
				String md_src = ediDate + MID + String.valueOf(CART_PAYMENT_TOTAL);
				String hash_String  = kakaoPayDataEncrypt.SHA256Salt(md_src, EncodeKey);
				
				// KaKaoPay의 INBOUND 전문 URL SETTING
				String merchantUrl = this.propertiesService.getString("payment.kakaopay.MERCHANT_URL"); //PG사의 결제용 운영서버 주소
				String msgName = this.propertiesService.getString("payment.kakaopay.MSG_NAME");

				String webPath = this.propertiesService.getString("payment.kakaopay.WEB_PATH"); //PG사의 인증용 운영서버 주소
				
				commandMap.put("prType", "MPM");//WPM(WEB 결제) / MPM(Mobile 결제)
				commandMap.put("MID", MID);//가맹점 ID
				commandMap.put("Moid", System.nanoTime());//가맹점 거래번호
				commandMap.put("Amt", CART_PAYMENT_TOTAL);//결제금액
				commandMap.put("currency", "KRW");//거래통화
				commandMap.put("certifiedFlag", "CN");//인증구분값
				commandMap.put("channelType", "2");//2 : 모바일 웹결제 채널 4 : PC TMS 결제 채널
				
				commandMap.put("EncryptData", hash_String);
				commandMap.put("requestDealApproveUrl", webPath + msgName);
				commandMap.put("EdiDate", ediDate);
				
				commandMap.put("PayMethod", "KAKAOPAY");//고정
				commandMap.put("AuthFlg", "10");//카카오는 10으로 고정
				/** [END] KAKAOPAY PARAMETER SETTING*/
				break;
			case Code.PAY_MILEAGE : //전액 쿠폰/마일리지/캐쉬백 포인트 금액. 결제금액이 0원.
				if(CART_PAYMENT_TOTAL > 0){
					commandMap.put("result", -888);
					commandMap.put("resultMsg", "잘못된 접근입니다.");
				}
				break;
		}
		
		if(isKiccPayment){
			commandMap.put("EP_mall_id", EP_mall_id);//mall id
			commandMap.put("EP_pay_type", EP_pay_type);
			commandMap.put("EP_tot_amt", EP_tot_amt);
			commandMap.put("EP_escrow_yn", EP_escrow_yn);
			commandMap.put("EP_order_no", EP_order_no);
			commandMap.put("EP_product_amt", EP_product_amt);
			commandMap.put("EP_return_url", EP_return_url);
		}
		
		json.addAllObjects(commandMap);

		return json;
	}

	/**
	 * <pre>
	 * 1. MethodName : paymentPrepare
	 * 2. ClassName  : CartController.java
	 * 3. Comment    : 결제가 비동기 방식으로 처리되므로 승인처리 완료 후 필요한 모든 form data를 DB에 저장 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 8. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/mobile/cart/paymentPrepareMobile.do", method = RequestMethod.POST)
	public JSON paymentPrepareMobile(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		// DB처리로 변경해야하는 부분
		Map<String,Object> MOBILE_PAYMENT_INFO = new HashMap<String,Object>();
		
		Enumeration<String> enumeration = request.getParameterNames();
		while (enumeration.hasMoreElements()) {
			String parameterName = (String) enumeration.nextElement();
			if(!"".equals(request.getParameter(parameterName).trim())){
				logger.debug("MOBILE_PAYMENT_INFO===["+parameterName+"] "+ request.getParameter(parameterName));
				MOBILE_PAYMENT_INFO.put(parameterName, request.getParameter(parameterName));
			}
		}
		String memCrtIdxArr = Arrays.toString(request.getParameterValues("MEM_CRT_IDX[]"));
		memCrtIdxArr = memCrtIdxArr.replaceAll("\\[", "");
		memCrtIdxArr = memCrtIdxArr.replaceAll("\\]", "");
		MOBILE_PAYMENT_INFO.put("MEM_CRT_IDX[]", memCrtIdxArr);
		
		String CRT_INFO = "";
		Set key = MOBILE_PAYMENT_INFO.keySet();
		for (Iterator iterator = key.iterator(); iterator.hasNext();) {
            String keyName = (String) iterator.next();
            logger.debug("key============"+keyName);
            String value = StringUtil.getString(MOBILE_PAYMENT_INFO.get(keyName),"");
            logger.debug("value============"+value);
            String separateStr = iterator.hasNext() ? "|DataseparatE|" : "";
            CRT_INFO += keyName + "|KeyandvaluE|" + value + separateStr;
		}
		
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		logger.debug("session_id========="+session_id);
		logger.debug("CRT_INFO========="+CRT_INFO);
		commandMap.put("CRT_SESSION_ID", session_id);
		commandMap.put("CRT_INFO", CRT_INFO);
		
		this.cartService.deleteCartTempInfo(commandMap);
		this.cartService.insertCartTempInfo(commandMap);
		
		json.addAllObjects(MOBILE_PAYMENT_INFO);
		
		return json;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : mobilepaymentcheck
	 * 2. ClassName  : CartController.java
	 * 3. Comment    : 모바일 승인완료 후 주문요청 전 parameter 최종 확인 LOGIC 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 8. 15.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mobile/cart/mobilepaymentcheck.do", method = RequestMethod.POST)
	public ModelAndView mobilepaymentcheck(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		HashMap<String,Object> payReqMap = (HashMap<String,Object>)request.getSession().getAttribute("MOBILE_PAYMENT_INFO");//결제 요청시, Session에 저장했던 파라미터 MAP 
		
		List<String> parameterList = new ArrayList<String>();
		
		for(Iterator<String> i = payReqMap.keySet().iterator(); i.hasNext();){
			Object key = i.next();
			logger.debug("["+key+"] "+ payReqMap.get(key));
			parameterList.add("<input type='text' name='" + key + "' value='" + payReqMap.get(key) + "'/>" );
		}
		
		mv.addObject("parameterList", parameterList);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : productOptionCntModifyAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 상품 수량/옵션 변경 ajax
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/productOptionCntModifyAjax.do")
	public JSON productOptionCntModifyAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);

		if (!"".equals(StringUtil.getString(commandMap.get("MEM_CRT_IDX"), ""))) {
			commandMap = this.cartService.updateProductOptionCnt(commandMap);
		}
		
		json.addAllObjects(commandMap);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : payment
	* 2. ClassName  : CartController.java
	* 3. Comment    : 결제 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	@FrontBannerSkip
	@RequestMapping(value = "/mobile/cart/payment.do", method = RequestMethod.POST)
	public ModelAndView payment(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> ordErrMap = new HashMap<String, Object>(); //결제오류시 DB 처리 위한 맵
		
		//리턴 코드/메시지
		String resultCode = "-1";
		String resultMessage = "";
		
		//주문 DB처리 결과 코드/메시지
		String orderDbResultcode = "";
		String orderDbResultmessage = "";
		
		//주문 유효성 체크 값
		boolean isValidOrder = true;
		
		//캐쉬백 사용 체크 값
		boolean isCashbagUsed = false;
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		/** [START]DB에 저장해둔 form 데이터 가져오기(only 모바일) */
		commandMap.put("CRT_SESSION_ID", session_id);//세션 id
		
		Map<String,Object> MOBILE_PAYMENT_INFO = this.cartService.selectCartTempInfo(commandMap);
		Map<String, Object> MOBILE_PAYMENT_INFO_MAP = new HashMap<String, Object>();
		if(MOBILE_PAYMENT_INFO!=null){
			logger.debug("MOBILE_PAYMENT_INFO============================="+MOBILE_PAYMENT_INFO);
			
			String[] tempInfoArr = StringUtil.getString(MOBILE_PAYMENT_INFO.get("CRT_INFO")).split("\\|DataseparatE\\|"); 
			
			logger.debug("tempInfoArr============================="+tempInfoArr);
			
			for(String tempInfo : tempInfoArr){
				logger.debug("tempInfo============"+tempInfo);
				String key = tempInfo.split("\\|KeyandvaluE\\|")[0];
				logger.debug("key============"+key);
				String value = tempInfo.split("\\|KeyandvaluE\\|")[1];
				logger.debug("value============"+value);
				MOBILE_PAYMENT_INFO_MAP.put(key, value);
			}
			
			commandMap.putAll(MOBILE_PAYMENT_INFO_MAP);
			
			//에스크로 주문인 경우
			String escrow_prd_no = StringUtil.getString(MOBILE_PAYMENT_INFO_MAP.get("escrow_prd_no"));
			String escrow_prd_amt = StringUtil.getString(MOBILE_PAYMENT_INFO_MAP.get("escrow_prd_amt"));
			String escrow_prd_nm = StringUtil.getString(MOBILE_PAYMENT_INFO_MAP.get("escrow_prd_nm"));
			
			if(!"".equals(escrow_prd_no)){
				// 상품 정보 담기
				String chr30 = new Character((char)30).toString();
				String chr31 = new Character((char)31).toString();
				
				String bk_goodinfo = "";
				bk_goodinfo += "prd_no=" + escrow_prd_no + chr31;
	            bk_goodinfo += "prd_amt=" + escrow_prd_amt + chr31;
	          	bk_goodinfo += "prd_nm=" + escrow_prd_nm + chr31 + chr30;
	          	
	          	//logger.debug("주문 직전 bk_goodinfo=============="+bk_goodinfo);
				commandMap.put("EP_bk_goodinfo", bk_goodinfo);
			}
			
		}
		/** [END]DB에 저장해둔 form 데이터 가져오기(only 모바일) */
		
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD")); //주문번호
		
		// 주문상품 정보
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		
		// 상품 옵션 가져오기
		for(Map<String, Object> cart : cartlist){
			//서브 옵션 리스트
			List<Map<String,Object>> subPrdList = new ArrayList<Map<String,Object>>();
			int SUB_OPTION_CNT =  StringUtil.getInt(cart.get("SUB_OPTION_CNT"));
			if(SUB_OPTION_CNT > 0){//서브 옵션 있는 경우
				subPrdList = this.cartService.selectTempOrderSubPrdList(cart);
				cart.put("subPrdList", subPrdList);//해당 상품 서브 상품 리스트
			}
		}
		
		// 재고 확인
		Map<String, Object> cartStock = this.cartService.selectTempOrderStock(commandMap);
		if((Integer)cartStock.get("result") < 0){
			resultCode = String.valueOf((Integer)cartStock.get("result"));
			resultMessage = (String)cartStock.get("resultMsg");
			isValidOrder = false;
		}
		
		// 캐쉬백 처리(결제랑 따로 태운다)
		Map<String, Object> cashbagMap = new HashMap<String, Object>();
		int toUseCashbag = StringUtil.getInt(commandMap.get("toUseCashbag"));//사용 캐쉬백 포인트
		int ORD_TMP_DC_OCB = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"));//DB 사용 캐쉬백 포인트
		
		logger.info("toUseCashbag================="+toUseCashbag);
		logger.info("ORD_TMP_DC_OCB================="+ORD_TMP_DC_OCB);
		
		// 실제 사용 포인트와 화면단 사용 포인트 다른 경우 에러 처리
		if(toUseCashbag != ORD_TMP_DC_OCB){
			logger.error("##################### 캐쉬백 사용 포인트 불일치 ###########################");
			isValidOrder = false;
			resultMessage = "캐쉬백 사용 포인트 상이 DB["+ ORD_TMP_DC_OCB +"] FRONT["+ toUseCashbag +"]";
		}
		
		if(isValidOrder && ORD_TMP_DC_OCB > 0){
			// 캐쉬백 포인트 조회 이력 
			commandMap.put("trStatus", "I");//조회 이력
			Map<String, Object> cashbagInquiryInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
			
			if(cashbagInquiryInfo != null){
				String CASHBAG_CARD_NO = StringUtil.getString(cashbagInquiryInfo.get("PAY_MST_KICC_CARD_NO"));//캐쉬백 카드번호
				String CASHBAG_PW = StringUtil.getString(commandMap.get("CASHBAG_PW"));//캐쉬백 비밀번호
				
				String EP_mall_id = StringUtil.getString(commandMap.get("EP_mall_id"));
				
				if("".equals(EP_mall_id)){
					EP_mall_id = this.propertiesService.getString("payment.kicc.mall.id");//default kicc mid
				}
				
				logger.debug("캐쉬백 사용시 결제 kicc mid 쓴다. 없으면 그냥 default mid쓴다. EP_mall_id========"+EP_mall_id);
				
				cashbagMap.put("EP_mall_id", EP_mall_id);
				String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
				if("test".equals(CST_PLATFORM)){
					cashbagMap.put("EP_mall_id", "T0001981"); // 삭제예정
				}
				cashbagMap.put("EP_pay_type", "point");
				cashbagMap.put("EP_pnt_txtype", "20");
				cashbagMap.put("EP_pnt_cp_cd", "OCB");
				cashbagMap.put("EP_pnt_idno", CASHBAG_CARD_NO);
				cashbagMap.put("EP_pnt_pwd", CASHBAG_PW);
				cashbagMap.put("EP_order_no", ORD_MST_CD);
				cashbagMap.put("ORD_MST_CD", ORD_MST_CD);
				cashbagMap.put("EP_product_amt", toUseCashbag);
				cashbagMap.put("EP_tot_amt", toUseCashbag);
				cashbagMap.put("EP_pnt_amt", toUseCashbag);
				cashbagMap.put("EP_currency", "00");
				cashbagMap.put("EP_escrow_yn", "N");
				cashbagMap.put("EP_complex_yn", "N");
				
				try{
					// 캐쉬백 포인트 사용
					this.payment.kiccPayment(request, cashbagMap);
					
					// pg 결과값 가져오기 0000 : 성공, 그 외는 실패.
	    			String PAY_MST_RESPCODE = StringUtil.getString(cashbagMap.get("PAY_MST_RESPCODE"));
	    			// 2. PAY_MST INSERT
	    			cashbagMap.put("PAY_MST_KICC_CARD_NO", CASHBAG_CARD_NO);//캐쉬백카드번호
	    			this.paymentService.insertPayMaster(cashbagMap);
	    			
	    			if("0000".equals(PAY_MST_RESPCODE)){//캐쉬백 사용 성공시
	    				logger.debug("캐쉬백 포인트 사용 성공 카드번호["+ CASHBAG_CARD_NO +"] 사용포인트["+ toUseCashbag +"]");
	    				isCashbagUsed = true;
	    				isValidOrder = true;
	    			}else{//결제승인 실패시
	    				isValidOrder = false;
						resultCode = StringUtil.getString(cashbagMap.get("PAY_MST_RESPCODE"));
						resultMessage = StringUtil.getString(cashbagMap.get("PAY_MST_RESPMSG"));
		    			logger.debug("####### 캐쉬백 사용 PG 승인 에러 #######");
		    			
		    			// ERROR LOG INSERT
		    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_PG);
		    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
		    			ordErrMap.put("ORD_ERR_CRD", "");
		    			ordErrMap.put("ORD_ERR_APV_NO", "");
		    			ordErrMap.put("ORD_ERR_PG_NO", "");
		    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
		    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(cashbagMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
		    			ordErrMap.put("ORD_ERR_BNK_CD", "");
		    			ordErrMap.put("ORD_ERR_MSG", resultMessage);
		    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
		    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
		    			this.orderErrorService.insertOrdErr(ordErrMap);
					}
				}catch(Exception e){
					isValidOrder = false;
					String errorMsg = e.getMessage();
		    		
    				logger.error("####### 캐쉬백 사용 처리중 Exception 발생 ########");
    				
    				resultCode = "5555";
    				resultMessage = "캐쉬백 사용 처리중 Exception 발생";
    				
    				logger.error("resultCode : "+resultCode);
		    		logger.error("resultMessage : "+resultMessage);
    				
    				// 에러메시지 DB 기록
    				StringWriter errors = new StringWriter();
    				e.printStackTrace(new PrintWriter(errors));
    				errorMsg = new String(errors.toString());
    				errorMsg = errorMsg.substring(0, Math.min(errorMsg.length(), 3800));
	    			logger.error("errorMsg : "+errorMsg);
	    			
	    			ordErrMap.put("ORD_ERR_MSG", errorMsg);
    				
    				// ERROR LOG INSERT
    				ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
	    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
	    			ordErrMap.put("ORD_ERR_CRD", "");
	    			ordErrMap.put("ORD_ERR_APV_NO", "");
	    			ordErrMap.put("ORD_ERR_PG_NO", "");
	    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
	    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(cashbagMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
	    			ordErrMap.put("ORD_ERR_BNK_CD", "");
	    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
	    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
	    			this.orderErrorService.insertOrdErr(ordErrMap);
				}
				
			}else{
				isValidOrder = false;
				resultMessage = "캐쉬백 포인트 조회 이력 미존재";
			}
		}
		
		// 1. PG 결제승인(KICC/LG/카카오페이)
		if(isValidOrder){
    		// pg 사 결제요청
    		int paymentType = StringUtil.getInt(commandMap.get("radioPayment"));
    		
    		logger.debug("paymentType=========================="+paymentType);
    		
    		try{
    			switch(paymentType){
    				case Code.PAY_CARD :
    				case Code.PAY_FOREIGN_CARD : //해외카드
    					//신용카드 kicc 처리
    					this.payment.kiccMobileCardPayment(request, commandMap);
    					break;
    				case Code.PAY_ACCOUNT :
    					//계좌이체 kicc 처리(모바일은 따로 처리)
    					this.payment.kiccMobileAccountPayment(request, commandMap);
    					break;
    				case Code.PAY_DEPOSIT :
    				case Code.PAY_ESCROW :
    					//무통장입금, 에스크로는 kicc 처리
    					this.payment.kiccPayment(request, commandMap);
    					break;
    				case 	Code.PAY_KAKAOPAY :
    					//카카오페이
    					this.payment.kakaoPayment(request, commandMap);
    					break;
    				/*case Code.PAY_PAYNOW :
    					//페이나우(LG)
    					this.payment.lgPayment(request, commandMap);
    					break;*/
    				case Code.PAY_MILEAGE : //0원 결제
    					commandMap.put("PAY_MST_AMOUNT",0);
    					commandMap.put("PAY_MST_RESPCODE", "0000");
    					break;
    				case Code.PAY_CLEANKING : //클린킹 결제
    					commandMap.put("PAY_MST_AMOUNT",StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))));
    					commandMap.put("PAY_MST_RESPCODE", "0000");
    					break;	
    			}
    			
    			// pg 결과값 가져오기 0000 : 성공, 그 외는 실패.
    			String PAY_MST_RESPCODE = StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"));
    			// 2. PAY_MST INSERT
    			if(paymentType != Code.PAY_MILEAGE && paymentType != Code.PAY_CLEANKING){//0원 결제, 클린킹은 pay_master 등록 없음
    				//무통장/에스크로는 입금일을 00000000000000으로 처리한다.
    				if(paymentType == Code.PAY_DEPOSIT || paymentType == Code.PAY_ESCROW){
    					commandMap.put("PAY_MST_PAYDATE", "00000000000000");
    				}
    				this.paymentService.insertPayMaster(commandMap);
    			}
    			
				if("0000".equals(PAY_MST_RESPCODE)){//결제성공시
					
					// 결제금액과 DB 금액 비교후 다른 경우 취소
					int PAY_MST_AMOUNT = StringUtil.getInt(commandMap.get("PAY_MST_AMOUNT"));
					int DB_PAYMENT_PRICE = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))); // DB 총 결제금액
					commandMap.put("DB_PAYMENT_PRICE",DB_PAYMENT_PRICE);
					
					logger.info("PAY_MST_AMOUNT============"+PAY_MST_AMOUNT);
					logger.info("DB_PAYMENT_PRICE============"+DB_PAYMENT_PRICE);
					
					if(PAY_MST_AMOUNT != DB_PAYMENT_PRICE){
						throw new Exception("ERR_AMT_PAY");
					}
					
					resultCode = PAY_MST_RESPCODE;
					
					// 3. 주문정보 DB 처리
    				commandMap = this.cartService.insertOrder(request, commandMap, response);
		    		
		    		orderDbResultcode = StringUtil.getString(commandMap.get("orderDbResultcode"));
		    		orderDbResultmessage = StringUtil.getString(commandMap.get("orderDbResultmessage"));
		    		
		    		// 주문 DB 처리 실패, 취소승인요청
		    		if(!"0000".equals(orderDbResultcode)){
	    				throw new Exception("ERR_DB_ORDER");
		    		}
				}else{//결제승인 실패시
					resultCode = StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"));
					resultMessage = StringUtil.getString(commandMap.get("PAY_MST_RESPMSG"));
	    			logger.debug("####### PG 승인 에러 #######");
	    			
	    			// ERROR LOG INSERT
	    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_PG);
	    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
	    			ordErrMap.put("ORD_ERR_CRD", "");
	    			ordErrMap.put("ORD_ERR_APV_NO", "");
	    			ordErrMap.put("ORD_ERR_PG_NO", "");
	    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
	    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(commandMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
	    			ordErrMap.put("ORD_ERR_BNK_CD", StringUtil.getString(commandMap.get("PAY_MST_KICC_BANK_CD")));//은행 코드
	    			ordErrMap.put("ORD_ERR_MSG", resultMessage);
	    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
	    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
	    			this.orderErrorService.insertOrdErr(ordErrMap);
				}
    		}catch(Exception e){
    			String errorMsg = e.getMessage();
	    		
    			try{
    				if("ERR_DB_ORDER".equals(errorMsg)){
	    				logger.error("####### 주문 DB 처리중 Error 발생 ########");
	    				
			    		resultCode = orderDbResultcode;
		    			resultMessage = orderDbResultmessage;
		    			
		    			logger.error("resultCode : "+resultCode);
			    		logger.error("resultMessage : "+resultMessage);
			    		
			    		ordErrMap.put("ORD_ERR_MSG", resultMessage);
			    		
			    		if("02".equals(orderDbResultcode))
			    		{
			    			// 회원등록 프로시져 에러시
			    			//this.pcJoinMemberService.insertErpError(commandMap);		
			    		}
			    		
	    			}else if("ERR_AMT_PAY".equals(errorMsg)){
	    				logger.error("####### 실결제금액과 DB 결제금액 불일치 ########");
	    				
			    		resultCode = "6666";
		    			resultMessage = "실결제금액과 DB 결제금액 불일치 실결제금액["+ StringUtil.getInt(commandMap.get("PAY_MST_AMOUNT")) +"] DB결제금액["+ StringUtil.getInt(commandMap.get("DB_PAYMENT_PRICE")) +"]";
		    			
		    			logger.error("resultCode : "+resultCode);
			    		logger.error("resultMessage : "+resultMessage);
			    		
			    		ordErrMap.put("ORD_ERR_MSG", resultMessage);
	    			}else{
	    				logger.error("####### 결제처리중 Exception 발생 ########");
	    				
	    				resultCode = "9999";
	    				resultMessage = "주문처리중 Exception 발생";
	    				
	    				logger.error("resultCode : "+resultCode);
			    		logger.error("resultMessage : "+resultMessage);
	    				
	    				// 에러메시지 DB 기록
	    				StringWriter errors = new StringWriter();
	    				e.printStackTrace(new PrintWriter(errors));
	    				errorMsg = new String(errors.toString());
	    				errorMsg = errorMsg.substring(0, Math.min(errorMsg.length(), 3800));
		    			logger.error("errorMsg : "+errorMsg);
		    			
		    			ordErrMap.put("ORD_ERR_MSG", errorMsg);
	    			}
    				
    				// ERROR LOG INSERT
    				ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
	    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
	    			ordErrMap.put("ORD_ERR_CRD", "");
	    			ordErrMap.put("ORD_ERR_APV_NO", "");
	    			ordErrMap.put("ORD_ERR_PG_NO", "");
	    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
	    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(commandMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
	    			ordErrMap.put("ORD_ERR_BNK_CD", StringUtil.getString(commandMap.get("PAY_MST_KICC_BANK_CD")));//은행 코드
	    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
	    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
	    			this.orderErrorService.insertOrdErr(ordErrMap);
    				
    				//거래번호 있는 경우 승인취소 처리
		    		String payMstTid = StringUtil.getString(commandMap.get("PAY_MST_TID"),"");
    				if(!"".equals(payMstTid)){
		    			logger.error("####### [BEGIN] PAY_MST_TID : "+ payMstTid +" 승인취소처리 #######");
		    			
		    			switch(paymentType){
		    				case Code.PAY_CARD :
		    				case Code.PAY_ACCOUNT :
		    				case Code.PAY_DEPOSIT :
		    				case Code.PAY_ESCROW :
		    				case Code.PAY_FOREIGN_CARD : //해외카드
		    					//신용카드, 실시간계좌이체, 무통장입금은 kicc 처리
		    					this.payment.kiccDirectCancelPayment(request, commandMap);
		    					break;
		    				case 	Code.PAY_KAKAOPAY :
		    					//카카오페이
		    					this.payment.kakaoCancelPayment(request, commandMap);
		    					break;
		    				/*case Code.PAY_PAYNOW :
		    					//페이나우(LG)
		    					this.payment.lgCancelPayment(request, commandMap);
		    					break;*/
		    			}
	    			
		    			// PAY_MST INSERT
		    			this.paymentService.insertPayMaster(commandMap);
	    			
	    				logger.error("####### [END] PAY_MST_TID : "+ payMstTid +" 승인취소처리 #######");
    				}
    				
    				// pg 결과값 가져오기 0000 : 성공, 그 외는 실패.
        			String PAY_MST_RESPCODE = StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"));
    				if(!"0000".equals(PAY_MST_RESPCODE)){//승인취소 실패시 DB 기록
    					resultCode = StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"));
    					resultMessage = StringUtil.getString(commandMap.get("PAY_MST_RESPMSG"));
    	    			logger.debug("####### PG 승인 에러 #######");
    	    			
    	    			// ERROR LOG INSERT
    	    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_PG);
    	    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
    	    			ordErrMap.put("ORD_ERR_CRD", "");
    	    			ordErrMap.put("ORD_ERR_APV_NO", "");
    	    			ordErrMap.put("ORD_ERR_PG_NO", "");
    	    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
    	    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(commandMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
    	    			ordErrMap.put("ORD_ERR_BNK_CD", StringUtil.getString(commandMap.get("PAY_MST_KICC_BANK_CD")));//은행 코드
    	    			ordErrMap.put("ORD_ERR_MSG", resultMessage);
    	    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
    	    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
    	    			this.orderErrorService.insertOrdErr(ordErrMap);
    				}
    			}catch(Exception e2){
    				//결제 승인 취소시 예외발생한 경우
    				resultCode = "8888";
    				resultMessage = "주문처리(결제취소)중 Exception 발생";
    				
    				logger.error("resultCode : "+resultCode);
		    		logger.error("resultMessage : "+resultMessage);
		    		
		    		// 에러메시지 DB 기록
    				StringWriter errors = new StringWriter();
    				e2.printStackTrace(new PrintWriter(errors));
    				errorMsg = new String(errors.toString());
    				errorMsg = errorMsg.substring(0, Math.min(errorMsg.length(), 3800));
	    			logger.error("errorMsg : "+errorMsg);
		    		
    				// ERROR LOG INSERT
	    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
	    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
	    			ordErrMap.put("ORD_ERR_CRD", "");
	    			ordErrMap.put("ORD_ERR_APV_NO", "");
	    			ordErrMap.put("ORD_ERR_PG_NO", "");
	    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
	    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(commandMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
	    			ordErrMap.put("ORD_ERR_BNK_CD", StringUtil.getString(commandMap.get("PAY_MST_KICC_BANK_CD")));//은행 코드
	    			ordErrMap.put("ORD_ERR_MSG", errorMsg);
	    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
	    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
	    			this.orderErrorService.insertOrdErr(ordErrMap);
    			}
    		}
		}else{
			//주문 유효성 검사 통과하지 못한 경우...!
			logger.error("####### [주문 실패 :"+ resultMessage +"] #######");
		}
		
 		String return_url = "/mobile/cart/paymentSuccess.do";
 		
 		// 주문완료, 결제성공
 		if("0000".equals(resultCode)){
 			commandMap.put("ORD_MST_CD", ORD_MST_CD);
	    }
 		// 주문완료, 결제실패
	    else{
 			// 캐쉬백 사용 취소....!
	    	try{
	    		if(isCashbagUsed){
		    		String cashbagPayMstTid = StringUtil.getString(cashbagMap.get("PAY_MST_TID"),"");
					logger.error("####### [BEGIN] PAY_MST_TID : "+ cashbagPayMstTid +" 캐쉬백 사용 취소처리 #######");
	    			
	    			this.payment.kiccDirectCancelPayment(request, cashbagMap);
				
	    			// PAY_MST INSERT
	    			this.paymentService.insertPayMaster(cashbagMap);
				
					logger.error("####### [END] PAY_MST_TID : "+ cashbagPayMstTid +" 캐쉬백 사용 취소처리 #######");
					
					// pg 결과값 가져오기 0000 : 성공, 그 외는 실패.
        			String PAY_MST_RESPCODE = StringUtil.getString(cashbagMap.get("PAY_MST_RESPCODE"));
    				if(!"0000".equals(PAY_MST_RESPCODE)){//승인취소 실패시 DB 기록
    					resultCode = StringUtil.getString(cashbagMap.get("PAY_MST_RESPCODE"));
    					resultMessage = StringUtil.getString(cashbagMap.get("PAY_MST_RESPMSG"));
    	    			logger.debug("####### PG 승인 에러 #######");
    	    			
    	    			// ERROR LOG INSERT
    	    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_PG);
    	    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
    	    			ordErrMap.put("ORD_ERR_CRD", "");
    	    			ordErrMap.put("ORD_ERR_APV_NO", "");
    	    			ordErrMap.put("ORD_ERR_PG_NO", "");
    	    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
    	    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(commandMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
    	    			ordErrMap.put("ORD_ERR_BNK_CD", StringUtil.getString(commandMap.get("PAY_MST_KICC_BANK_CD")));//은행 코드
    	    			ordErrMap.put("ORD_ERR_MSG", resultMessage);
    	    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
    	    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
    	    			this.orderErrorService.insertOrdErr(ordErrMap);
    				}
		    	}
	    	}catch(Exception e){
	    		String errorMsg = e.getMessage();
	    		
	    		//캐쉬백 결제 승인 취소시 예외발생한 경우
				resultCode = "8888";
				resultMessage = "주문처리(캐쉬백 승인취소)중 Exception 발생";
				
				logger.error("resultCode : "+resultCode);
	    		logger.error("resultMessage : "+resultMessage);
	    		
	    		// 에러메시지 DB 기록
				StringWriter errors = new StringWriter();
				e.printStackTrace(new PrintWriter(errors));
				errorMsg = new String(errors.toString());
				errorMsg = errorMsg.substring(0, Math.min(errorMsg.length(), 3800));
    			logger.error("errorMsg : "+errorMsg);
	    		
				// ERROR LOG INSERT
    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
    			ordErrMap.put("ORD_ERR_CRD", "");
    			ordErrMap.put("ORD_ERR_APV_NO", "");
    			ordErrMap.put("ORD_ERR_PG_NO", "");
    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
    			ordErrMap.put("ORD_ERR_LSSUER", StringUtil.getString(commandMap.get("PAY_MST_KICC_ISSUER_CD")));//카드사 코드를 여기에 넣는다.
    			ordErrMap.put("ORD_ERR_BNK_CD", StringUtil.getString(commandMap.get("PAY_MST_KICC_BANK_CD")));//은행 코드
    			ordErrMap.put("ORD_ERR_MSG", errorMsg);
    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
    			ordErrMap.put("ORD_ERR_REG_ID", StringUtil.getString(user.getMEM_MST_MEM_ID()));
    			this.orderErrorService.insertOrdErr(ordErrMap);
	    	}
	    	
	    	return_url = "/mobile/cart/paymentFail.do";
	    	commandMap.put("resultCode", resultCode);
	 		commandMap.put("resultMessage", resultMessage);
	    }
 		/*
        List<Map<String,Object>> erpParam = this.orderService.selectOrderErpInfo(commandMap);
        List<Map<String,Object>> erpResponse = new ArrayList<Map<String,Object>>();
        for(int i=0;i<erpParam.size();i++) {
        	erpResponse.addAll(ErpRequest.requestOrder(erpParam.get(i)));
        }
        */
 		mv.addObject("returnUrl",return_url);
 		mv.addObject("commandMap",commandMap);
    	mv.setViewName("mobile/common/result");
    	
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : mileageDiscountAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 마일리지 사용시 금액 계산
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	@AccessLevelUser(ROLEUSER.user)
	@FrontBannerSkip()
	@RequestMapping("/mobile/cart/mileageDiscountAjax")
	public JSON mileageDiscountAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		String allMileageUseYn = "N";//모두 사용 여부
		String isSuccessYn = "Y";
		
		// 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
				
		// 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
				
		//String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		
		// 주문상품 리스트
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		
		// 결제대상금액 등 결제관련 정보 준비
		int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
		//int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
		//int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
		
		//1. 사용할 마일리지
		int toUseMileage = StringUtil.getInt(commandMap.get("toUseMileage"));
		
		if(toUseMileage > 0){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			String MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID"));
			
			//2. 최소사용가능 마일리지
			int usableMinimumPoint = this.propertiesService.getInt("usable.minimum.point");//10000원 이상부터 사용 가능
			
			// 소멸예정 마일리지 조회
			//commandMap.put("MEM_MST_MEM_ID", "lkw0114");
			Map<String, Object> extinctMileageMap = null;
			
			int extinctMileage = 0;
            if(extinctMileageMap == null){
            	extinctMileage = 0;
            }else{
            	extinctMileage = StringUtil.getInt(extinctMileageMap.get("EXMILEGE"));
            }
            
            if(extinctMileage > 0){
            	usableMinimumPoint = 0; //소멸예정 마일리지 있는 경우 0원 이상부터 사용 가능
            }
            
            //logger.debug("toUseMileage==========="+toUseMileage);
            //logger.debug("extinctMileage==========="+extinctMileage);
            //logger.debug("usableMinimumPoint==========="+usableMinimumPoint);

            //회원 사용가능 마일리지
            commandMap.put("P9AN8", MEM_MST_ERP_ID);	//고객번호1719133
            //commandMap.put("P9AN8", 1719133);	//고객번호1719133
            Map<String, Object> memberMileageMap = null;

            int SOLUBLE_MILEAGE = Integer.valueOf(String.valueOf(memberMileageMap.get("SOLUBLE_MILEAGE")));//사용 가능 마일리지
            
            // 사용 마일리지가 사용가능 마일리지보다 큰 경우 사용마일리지는 사용가능 마일리지.
 			if(toUseMileage >= SOLUBLE_MILEAGE){
 				toUseMileage = SOLUBLE_MILEAGE;
 				if(toUseMileage > 0){
 					allMileageUseYn = "Y";
 				}
 			}
 			
 			//logger.debug("toUseMileage==========="+toUseMileage);
 			
 			// 사용 마일리지가 최소 사용가능 마일리지보다 작은 경우
			if(toUseMileage < usableMinimumPoint){
				isSuccessYn = "N";
				json.addObject("resultMsg","마일리지는 "+ String.format("%,d", usableMinimumPoint) +"M 이상부터 사용 가능합니다");
				toUseMileage = 0;
			}
            
	 		// 총 주문금액 - 쿠폰할인 - 캐쉬백할인이 최소사용가능 마일리지보다 큰지 비교
			if(usableMinimumPoint > CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_CASHBAG){
				isSuccessYn = "N";
				json.addObject("resultMsg","마일리지는 "+ String.format("%,d", usableMinimumPoint) +"M 이상부터 사용 가능합니다");
				toUseMileage = 0;
			}
			
			// 사용할 마일리지가 판매가-쿠폰할인-캐쉬백할인 보다 큰 경우 (배송비 제외) 사용가능 마일리지 = 판매가-쿠폰할인-캐쉬백할인
			if(toUseMileage > CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_CASHBAG){
				toUseMileage = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_CASHBAG;
			}
		}
		
		// [BEGIN] 마일리지정보 적용
		int cart_add_disc_prc = toUseMileage + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
		
		//logger.debug("CART_PAYMENT_AMOUNT======"+CART_PAYMENT_AMOUNT);
		//logger.debug("toUseMileage======"+toUseMileage);
		//logger.debug("CART_PAYMENT_DC_PRD_COUPON======"+CART_PAYMENT_DC_PRD_COUPON);
		//logger.debug("CART_PAYMENT_DC_CASHBAG======"+CART_PAYMENT_DC_CASHBAG);
		
		int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
		
		commandMap.put("ORD_TMP_DC_MLG", toUseMileage);
		this.cartService.updateTempCartAmt(commandMap);

		//화면에 뿌려줄 데이터
		json.addObject("isSuccessYn", isSuccessYn);
		json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
		json.addObject("toUseMileage", toUseMileage);//총 포인트 사용
		json.addObject("cart_total", cart_total);//최종결제금액
		json.addObject("allMileageUseYn", allMileageUseYn);//모두사용 여부
		
		//  적립예정 마일리지/캐쉬백 계산 필요
		// 최종결제금액-배송비+배송비무료쿠폰-추가배송비
		Map<String,Object> map_save = new HashMap<String,Object>();
		int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
		map_save.put("ORD_PRC", cartOrdPrc);
		map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		map_save.put("TYPE", "M"); //마일리지
		int saveMlg = this.cartService.selectReservePrice(map_save);
		map_save.put("TYPE", "C"); //캐쉬백
		int saveCashbag = this.cartService.selectReservePrice(map_save);
		
		json.addObject("saveMlg", saveMlg);
		json.addObject("saveCashbag", saveCashbag);
		
		// RETURN OBJECT
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : cashbagDiscountAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 캐쉬백 사용시 금액 계산
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	@AccessLevelUser(ROLEUSER.user)
	@FrontBannerSkip()
	@RequestMapping(value="/mobile/cart/cashbagDiscountAjax", method = RequestMethod.POST)
	public JSON cashbagDiscountAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		String allCashbagUseYn = "N";//모두 사용 여부
		String isSuccessYn = "Y";
		
		// 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
				
		// 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
				
		//String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		
		// 주문상품 리스트
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		
		// 결제대상금액 등 결제관련 정보 준비
		int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
		int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
		//int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
		//int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
		
		// 사용할 포인트
		int toUseCashbag = StringUtil.getInt(commandMap.get("toUseCashbag"));
		//toUseCashbag = (int) (Math.floor(toUseCashbag/10) * 10); 10원 단위 사용
		
		logger.info("toUseCashbag===="+toUseCashbag);
		
		if(toUseCashbag > 0){
			//1. 최대포인트 가져온다.
			int cashbagRemainPoint = StringUtil.getInt(commandMap.get("cashbagRemainPoint"));
			//cashbagRemainPoint = (int) (Math.floor(cashbagRemainPoint/10) * 10); 10원 단위 사용
			
			logger.info("cashbagRemainPoint===="+cashbagRemainPoint);
			
			// 사용 포인트가 사용가능 포인트보다 큰 경우 사용포인트는 사용가능 포인트.
			if(toUseCashbag >= cashbagRemainPoint){
				toUseCashbag = cashbagRemainPoint;
				if(toUseCashbag > 0){
					allCashbagUseYn = "Y";
				}
			}
			
			// 사용할 포인트가 판매가-쿠폰할인-포인트할인 보다 큰 경우 (배송비 제외) 사용가능 포인트 = 판매가-쿠폰할인-포인트할인
			if(toUseCashbag > CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_MILEAGE){
				toUseCashbag = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_MILEAGE;
			}
		}
		
		logger.debug("CART_PAYMENT_AMOUNT========"+CART_PAYMENT_AMOUNT);
		
		// [BEGIN] 포인트정보 적용
		int cart_add_disc_prc = CART_PAYMENT_DC_MILEAGE + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + toUseCashbag;// 총 추가할인
		int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
		
		commandMap.put("ORD_TMP_DC_OCB", toUseCashbag);
		this.cartService.updateTempCartAmt(commandMap);

		//화면에 뿌려줄 데이터
		json.addObject("isSuccessYn", isSuccessYn);
		json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
		json.addObject("toUseCashbag", toUseCashbag);//총 포인트 사용
		json.addObject("cart_total", cart_total);//최종결제금액
		json.addObject("allCashbagUseYn", allCashbagUseYn);//모두사용 여부
		
		//  적립예정 마일리지/캐쉬백 계산 필요
		// 최종결제금액-배송비+배송비무료쿠폰-추가배송비
		Map<String,Object> map_save = new HashMap<String,Object>();
		int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
		map_save.put("ORD_PRC", cartOrdPrc);
		map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		map_save.put("TYPE", "M"); //마일리지
		int saveMlg = this.cartService.selectReservePrice(map_save);
		map_save.put("TYPE", "C"); //캐쉬백
		int saveCashbag = this.cartService.selectReservePrice(map_save);
		
		json.addObject("saveMlg", saveMlg);
		json.addObject("saveCashbag", saveCashbag);
				
		// RETURN OBJECT
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : paymentSuccess
	* 2. ClassName  : CartController.java
	* 3. Comment    : 주문완료 화면 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/mobile/cart/paymentSuccess.do")
	public ModelAndView paymentSuccess(HttpServletRequest request,	@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 신용카드/현금영수증 영수증출력 정보
		//commandMap.put("LGD_RECEIPT_SCRIPTURL", this.propertiesService.getString("payment.lg.xpay.LGD_RECEIPT_SCRIPTURL"));
		commandMap.put("CST_PLATFORM", this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM"));
		
		// 주문상품 목록
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
        
        //  상품 옵션 가져오기
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
 		
 		// 주문상태 정보
		Map<String, Object> orderState = this.pcMyShoppingService.selectOrderStateCnt(commandMap);
        
        // 사은품 정보
        List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);
        
        // 배송정보
        Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);
        
        // 할인/결제정보
        Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);
        
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
		}*/
        
        //-- 사용자정보
  		commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
  		User user = SessionsUser.getSessionUser(request);
  		mv.addObject("user", user);
  		
  		//  로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
  		// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			mv.addObject("userInfo", userInfo);
			
			String DEFAULT_CASHBAG_CARD_NO = "";
			
			commandMap.put("trStatus", "U");//사용 이력
			Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);
			
			if(cashbagSavedInfo != null){
				DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
			}else{
				// 캐쉬백 카드번호
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
		
		/** 우편번호 찾기 레이어팝업 위한 지역 코드 START */
        // 지역코드
		mv.addObject("sidoList", this.pcCommonService.selectCode("AREA_CD"));
		
		// 프로토콜 여부 (https : true / http : false)
		boolean secureYn = request.isSecure();
		String domain = "";
		
		if(secureYn)
		{
			domain = StringUtil.getString(request.getAttribute("mobileSslDomain"));
		}
		else
		{
			domain = StringUtil.getString(request.getAttribute("mobileDomain"));
		}
		mv.addObject("domain",domain);
		/** 우편번호 찾기 레이어팝업 위한 지역 코드 END */
        
        mv.addObject("orderProductList", orderProductList);
        mv.addObject("orderState", orderState);
        mv.addObject("orderDeliveryInfo", orderDeliveryInfo);
        mv.addObject("orderPayInfo", orderPayInfo);
        mv.addObject("requestedGiftList", requestedGiftList);
		
        mv.addObject("commandMap", commandMap);
        
        mv.setViewName("mobile/cart/paymentSuccess");

		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : paymentFail
	* 2. ClassName  : CartController.java
	* 3. Comment    : 주문실패 화면
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/mobile/cart/paymentFail.do")
	public ModelAndView paymentFail(HttpServletRequest request,	@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//commandMap = (Map<String,Object>)request.getSession().getAttribute("_ORDER_INFO_MAP_");
		
		mv.addObject("commandMap", commandMap);
		
		//-- 사용자정보
  		commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
        
        mv.setViewName("mobile/cart/paymentFail");
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : getTxnId
	* 2. ClassName  : CartController.java
	* 3. Comment    : kakaoPay getTxnId
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 5. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip
	@RequestMapping(value = "/mobile/cart/getTxnId.do", method = RequestMethod.POST)
	public JSON getTxnId(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		// 서버로부터 받은 결과값 저장 JSONObject
	    JSONObject  resultJSONObject =  new JSONObject();

	    // TXN_ID를 요청하기 위한 PARAMETER
	    String PR_TYPE = request.getParameter("prType");
	    String MERCHANT_ID = request.getParameter("MID");
	    String MERCHANT_TXN_NUM = request.getParameter("Moid");
	    String channelType = request.getParameter("channelType");
	    //문자열 인코딩 문제 극복을 위해 상품명은 api에 직접 setting
	    byte[] PRODUCT_NAME = (""+request.getParameter("GoodsName")).getBytes("UTF-8");
	    String AMOUNT = request.getParameter("Amt");
	    String serviceAmt = request.getParameter("ServiceAmt");
	    String supplyAmt = request.getParameter("SupplyAmt");
	    String goodsVat = request.getParameter("GoodsVat");
	    
	    String CURRENCY = request.getParameter("currency");
	    String RETURN_URL = request.getParameter("returnUrl");
	    // ENC KEY와 HASH KEY는 가맹점에서 생성한 KEY 로 SETTING 한다.
	    //TXN_ID 호출전용 키값
  		String merchantEncKey = this.propertiesService.getString("payment.kakaopay.ENC_KEY");
  		String merchantHashKey = this.propertiesService.getString("payment.kakaopay.HASH_KEY");
	  		
	    String requestDealApproveUrl = request.getParameter("requestDealApproveUrl");
	    String certifiedFlag = request.getParameter("certifiedFlag");
	    
	    String requestorName = request.getParameter("requestorName");
	    String requestorTel = request.getParameter("requestorTel");
	    
	    String offerPeriod = request.getParameter("offerPeriod");
	    String offerPeriodFlag = request.getParameter("offerPeriodFlag");
	    
	    //무이자옵션
	    String possiCard = request.getParameter("possiCard");
	    String fixedInt = request.getParameter("fixedInt");
	    String maxInt = request.getParameter("maxInt");
	    String noIntYN = request.getParameter("noIntYN");
	    String noIntOpt = request.getParameter("noIntOpt");
	    String pointUseYN = request.getParameter("pointUseYn");
	    String blockCard = request.getParameter("blockCard");
	    
	    String blockBin = request.getParameter("blockBin");
	    
	    // 결과값을 담는 부분
	    String resultString = "";
	    String resultCode = "";
	    String resultMsg = "";
	    String txnId = "";
	    String merchantTxnNum = "";
	    String prDt = "";
	    
	    // 가맹점에서 MPay로 전문을 날리기 위한 객체 생성
	    CallWebService webService = new CallWebService();
	    // 가맹점에서 MPay로 전문에 담을 Parameter DTO 객체 생성
	    DealApproveDto approveDto = new DealApproveDto();
	    
	    
	    // 필수값 SETTING
	    approveDto.setRequestDealApproveUrl(requestDealApproveUrl); // 결제요청을 위한 URL
	    approveDto.setMerchantEncKey(merchantEncKey); // 가맹점의 EncKey
	    approveDto.setMerchantHashKey(merchantHashKey); // 가맹점의 HashKey

	    approveDto.setCertifiedFlag(certifiedFlag); // WEB결제로 신청할시에 필수 'CN'
	    approveDto.setPrType(PR_TYPE);
	    approveDto.setChannelType(channelType); // TMS 및 방판 결제시 필수
	    
	    approveDto.setRequestorName(requestorName);
	    approveDto.setRequestorTel(requestorTel);
	    
	    approveDto.setMerchantID(MERCHANT_ID);
	    approveDto.setMerchantTxnNum(MERCHANT_TXN_NUM);
	    
	    approveDto.setProductName(new String(PRODUCT_NAME,"UTF-8"));
	    
	    approveDto.setAmount(AMOUNT);
	    approveDto.setServiceAmt(serviceAmt);
	    approveDto.setSupplyAmt(supplyAmt);
	    approveDto.setGoodsVat(goodsVat);
	    
	    approveDto.setCurrency(CURRENCY);
	    approveDto.setReturnUrl(RETURN_URL);
	    
	    approveDto.setOfferPeriod(offerPeriod);
	    approveDto.setOfferPeriodFlag(offerPeriodFlag);
	    
	    approveDto.setPossiCard(possiCard);
	    approveDto.setFixedInt(fixedInt);
	    approveDto.setMaxInt(maxInt);
	    approveDto.setNoIntYN(noIntYN);
	    approveDto.setNoIntOpt(noIntOpt);
	    approveDto.setPointUseYN(pointUseYN);
	    approveDto.setBlockCard(blockCard);
	    
	    approveDto.setBlockBin(blockBin);
	    
	    resultJSONObject = webService.requestDealApprove(approveDto);
	    resultString = resultJSONObject.toString();

	    if( !resultString.equals("{}") ) {
	        resultCode = resultJSONObject.getString("RESULT_CODE");
	        resultMsg = resultJSONObject.getString("RESULT_MSG");
	        
	        if( resultCode.equals("00") ) {
	            txnId = resultJSONObject.getString("TXN_ID");
	            merchantTxnNum = resultJSONObject.getString("MERCHANT_TXN_NUM");
	            prDt = resultJSONObject.getString("PR_DT");
	        }
	    }
	    
	    commandMap.put("resultCode", resultCode);
	    commandMap.put("resultMsg", resultMsg);
	    commandMap.put("txnId", txnId);
	    commandMap.put("merchantTxnNum", merchantTxnNum);
	    commandMap.put("prDt", prDt);
	    
	    logger.debug("resultCode========="+resultCode);
	    logger.debug("resultMsg========="+resultMsg);
	    logger.debug("txnId========="+txnId);
	    logger.debug("merchantTxnNum========="+merchantTxnNum);
	    logger.debug("prDt========="+prDt);
	    
	    json.addAllObjects(commandMap);
	    
	    logger.info("commandMap==========="+commandMap);

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : addDlvChargeAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 추가배송비 계산 ajax
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/addDlvChargeAjax.do")
	public JSON addDlvChargeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		String addDlvChargeYn = "N";
		int addDlvCharge = 0;
		
		//  고객 주소가 제주도인 경우 추가 배송비 설정
		String SUBSTR_ZIP_CDE5_TMP = StringUtil.getString(commandMap.get("ORD_DLV_ZIP_CDE5"));
		String SUBSTR_ZIP_CDE5 = "";
		if(!"".equals(SUBSTR_ZIP_CDE5_TMP)){
			SUBSTR_ZIP_CDE5 = StringUtil.getString(commandMap.get("ORD_DLV_ZIP_CDE5")).substring(0, 2);
		}
		//String SUBSTR_ZIP_CDE6 = StringUtil.getString(commandMap.get("ORD_DLV_ZIP_CDE6_1")).substring(0, 2);
		
		// 제주도인 경우만 추가 배송비 설정
		if("63".equals(SUBSTR_ZIP_CDE5) /*|| "69".equals(SUBSTR_ZIP_CDE6)*/){
			addDlvCharge = 5000;
			addDlvChargeYn = "Y";
		}
		commandMap.put("PRD_TMP_DLV_ADD_CAG", addDlvCharge);
		this.cartService.updateTempCartPrdAmt(commandMap);//임시 주문 상품 추가배송비 update
		
		// 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
				
		// 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		// 주문상품 리스트
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		if(cartlist.isEmpty()){
			throw new Exception("주문정보 없음!");
		}else{
			// 배송비 업데이트
			commandMap.put("ORD_TMP_DLV_ADD_CAG", StringUtil.getString(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")));//총 추가 배송비는 list에서 계산해서 가져온다.
			this.cartService.updateTempCartAmt(commandMap);
		}
		
		// 계산 금액만 담는다.
		Iterator<String> keys = commandMap.keySet().iterator();
        while( keys.hasNext() ){
            String key = keys.next();
            if(key.indexOf("cart_") == 0){
            	//logger.debug("key==="+key);
            	//logger.debug("value==="+commandMap.get(key));
            	json.addObject(key, commandMap.get(key));
            }
        }
		
		json.addObject("addDlvChargeYn", addDlvChargeYn);
		json.addObject("addDlvCharge", addDlvCharge);
		
		//  적립예정 마일리지/캐쉬백 계산 필요
		// 최종결제금액-배송비+배송비무료쿠폰-추가배송비
		int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
		int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
		int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
		
		int cart_add_disc_prc = CART_PAYMENT_DC_MILEAGE + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
		int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
		
		Map<String,Object> map_save = new HashMap<String,Object>();
		int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
		map_save.put("ORD_PRC", cartOrdPrc);
		map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		map_save.put("TYPE", "M"); //마일리지
		int saveMlg = this.cartService.selectReservePrice(map_save);
		map_save.put("TYPE", "C"); //캐쉬백
		int saveCashbag = this.cartService.selectReservePrice(map_save);
		
		json.addObject("saveMlg", saveMlg);
		json.addObject("saveCashbag", saveCashbag);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : v3d_req
	* 2. ClassName  : CartController.java
	* 3. Comment    : KICC 안심클릭 요청 페이지
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/mobile/cart/v3d_req")
    public ModelAndView v3d_req (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // real / test 여부
     	String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
     	
     	mv.addObject("CST_PLATFORM", CST_PLATFORM);
        mv.addObject("commandMap" ,commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : v3d_res
	* 2. ClassName  : CartController.java
	* 3. Comment    : KICC 안심클릭 응답 페이지
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/mobile/cart/v3d_res")
    public ModelAndView v3d_res (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap" ,commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : acnt_req
	* 2. ClassName  : CartController.java
	* 3. Comment    : 실시간 계좌이체 request
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/mobile/cart/acnt_req")
    public ModelAndView acnt_req (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // real / test 여부
     	String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
     	
     	mv.addObject("CST_PLATFORM", CST_PLATFORM);
        mv.addObject("commandMap" ,commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : acnt_res
	* 2. ClassName  : CartController.java
	* 3. Comment    : 실시간 계좌이체 response
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 2. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/mobile/cart/acnt_res")
    public ModelAndView acnt_res (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap" ,commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : deleteSoldOutCartAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 장바구니 품절 상품 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/deleteSoldOutCartAjax.do", method = RequestMethod.POST)
	public JSON deleteSoldOutCartAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);

		// -- 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
		
		//재고 수량 체크 후 품절 상품 삭제
		String[] TEMP_MEM_CRT_IDXs = request.getParameterValues("MEM_CRT_IDX[]");
		List<String> MEM_CRT_IDXs = Arrays.asList(TEMP_MEM_CRT_IDXs);
		commandMap.put("MEM_CRT_IDXs", MEM_CRT_IDXs);
		this.cartService.deleteSoldOutCart(commandMap);

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : getCardInstallmentListAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 카드 할부 목록 가져오기
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/getCardInstallmentListAjax.do")
	public JSON getCardInstallmentListAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();

		List<Map<String,Object>> list = this.cartService.selectCardInstallmentList(commandMap);
		
		json.addObject("list", list);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : insertInterestProductAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 프론트 > 장바구니 > 관심상품 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/cart/insertInterestProductAjax")
	public JSON insertInterestProductAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		int insertResult = 0;
		
		if(SessionsUser.isLogin(request))
		{
			// 관심상품 중복체크
			int interestProductCount = this.cartService.selectInterestProductCheckCount(request,commandMap);
			
			if(interestProductCount == 0){
				// 관심상품 등록
				insertResult = this.cartService.insertInterestProduct(request, commandMap);
				
				if(insertResult > 0)
				{
					result = 1;
					resultMsg = "MY 키핑 상품으로 등록되었습니다.";
				}
				else
				{
					result = -1;
					resultMsg = "에러가 발생했습니다.";
				}
			}else{
				result = 1;
				resultMsg = "MY 키핑 상품으로 등록되었습니다.";
			}
		}
		else
		{
			resultMsg = "로그인이 필요한 서비스입니다.\n로그인하시겠습니까?";
		}
		
		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : deliveryModifyPopup
	* 2. ClassName  : CartController.java
	* 3. Comment    : 주문완료 페이지 배송지 수정 팝업
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 30.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/deliveryModifyPopup")
	public ModelAndView deliveryModifyPopup(HttpServletRequest request,	@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		//본인 주문인지 체크
    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
    	}else{//비회원 구매인 경우
    		commandMap.put("SESSION_MEM_MST_MEM_ID", "_GUEST_");//주문자ID
    	}
    	int result = this.pcMyShoppingService.selectOrderCount(commandMap);
    	
    	if(result > 0){
    		// -- 사용자정보 전달
    		User user = SessionsUser.getSessionUser(request);
    				
    		//  로그인한 경우 주소정보 가져온다
    		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
    			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
    			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
    			mv.addObject("userInfo", userInfo);
    			
    			// 최근 배송지 목록
    			List<Map<String,Object>> recentDlvList = this.cartService.selectRecentDlvList(commandMap);
    			mv.addObject("recentDlvList", recentDlvList);
    			
    			// 나의 배송지 목록
    			List<Map<String,Object>> myDlvList = this.pcMemberDeliveService.selectMemberDeliveList(commandMap);
    			mv.addObject("myDlvList", myDlvList);
    		}
    		
    		// 핸드폰 앞자리
    		mv.addObject("hpCodeList", this.pcCommonService.selectCode("HP_CODE"));
    		
    		// 전화번호 국번
    		mv.addObject("telCodeList", this.pcCommonService.selectCode("TEL_CODE"));
    				
    		// 배송정보
            Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);
            mv.addObject("orderDeliveryInfo", orderDeliveryInfo);
            
    	    mv.addObject("commandMap", commandMap);
    	}else{
    		mv.setViewName("mobile/common/result");
    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
    	}
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : checkJejuAddrAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 배송지 수정
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 30.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/orderDeliveryModifyProcAjax.do")
	public JSON orderDeliveryModifyProcAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		int result = 0;
		String isSuccessYn = "N";
		String resultMsg = "에러가 발생했습니다.";
		
		//본인 주문인지 체크
    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
    		commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
    	}else{//비회원 구매인 경우
    		commandMap.put("SESSION_MEM_MST_MEM_ID", "_GUEST_");//주문자ID
    	}
    	int chk_result = this.pcMyShoppingService.selectOrderCount(commandMap);
    	
    	if(chk_result > 0){
    		
    		isSuccessYn = "Y";
    		
    		/*
    		// 배송정보
            Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);
            
            int ORD_MST_DLV_GBN = StringUtil.getInt(orderDeliveryInfo.get("ORD_MST_DLV_GBN"));
            if(Code.CART_DLV_GBN_LONG_INS_CD == ORD_MST_DLV_GBN || Code.CART_DLV_GBN_SERVICE_CD == ORD_MST_DLV_GBN){//클린킹/장기할부는 추가배송비 없음
            	isSuccessYn = "Y";
            }else{
            	// 기존 우편번호
                String ORG_DLV_ZIP_CDE5 = StringUtil.getString(orderDeliveryInfo.get("ORD_DLV_ZIP_CDE5"));
                String SUBSTR_ORG_DLV_ZIP_CDE5 = "";
        		if(!"".equals(ORG_DLV_ZIP_CDE5)){
        			SUBSTR_ORG_DLV_ZIP_CDE5 = ORG_DLV_ZIP_CDE5.substring(0, 2);
        		}
        		
                // 새로운 우편번호
                String NEW_DLV_ZIP_CDE5 = StringUtil.getString(commandMap.get("ORD_DLV_ZIP_CDE5"));
                String SUBSTR_NEW_DLV_ZIP_CDE5 = "";
        		if(!"".equals(NEW_DLV_ZIP_CDE5)){
        			SUBSTR_NEW_DLV_ZIP_CDE5 = NEW_DLV_ZIP_CDE5.substring(0, 2);
        		}
                
                if(!"".equals(SUBSTR_ORG_DLV_ZIP_CDE5) && !"".equals(SUBSTR_NEW_DLV_ZIP_CDE5)){
                	if("63".equals(SUBSTR_ORG_DLV_ZIP_CDE5)){//기존 우편번호가 제주였던 경우
            			if("63".equals(SUBSTR_NEW_DLV_ZIP_CDE5)){//새로운 우편번호도 제주인 경우에만 통과
            				isSuccessYn = "Y";
            			}else{//새로운 우편번호가 내륙인 경우
            				resultMsg = "추가배송비가 발생된 주문으로 배송지 수정이 불가능합니다.\n주문취소 후 재주문해주시기 바랍니다.";
            			}
            		}else{//기존 우편번호가 내륙이었던 경우
            			if("63".equals(SUBSTR_NEW_DLV_ZIP_CDE5)){//새로운 우편번호도 내륙인 경우에만 통과
            				resultMsg = "제주도는 추가배송비 5,000원이 발생되므로\n배송지 수정이 불가능합니다.\n배송지 수정문의는 고객센터 문의해 주시기 바랍니다.";
            			}else{//새로운 우편번호가 내륙인 경우
            				isSuccessYn = "Y";
            			}
            		}
                }
            }
            */
            
            if("Y".equals(isSuccessYn)){
            	result = this.pcMyShoppingService.updateDeliveryInfo(request, commandMap);
            }
    	}

        json.addObject("isSuccessYn", isSuccessYn);
        json.addObject("resultMsg", resultMsg);
        json.addObject("result", result);
        
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : checkCashBagPointAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 캐쉬백 포인트 조회 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 31.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/checkCashBagPointAjax.do")
	public JSON checkCashBagPointAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		String PAY_MST_RESPCODE = "";
		String PAY_MST_RESPMSG = "에러가 발생했습니다.";
		String cashbagRemainPoint = "0";
		
		try{
			// 캐쉬백 포인트 조회
			String EP_mall_id = this.propertiesService.getString("payment.kicc.mall.id");//default kicc mid
			commandMap.put("EP_mall_id", EP_mall_id);
			String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
			if("test".equals(CST_PLATFORM)){
				commandMap.put("EP_mall_id", "T0001981"); // 삭제예정
			}
			commandMap.put("EP_pay_type", "point");
			commandMap.put("EP_pnt_txtype", "10"); //10 조회 20 사용 40 적립
			commandMap.put("EP_pnt_cp_cd", "OCB");
			commandMap.put("EP_currency", "00");
			commandMap.put("EP_escrow_yn", "N");
			commandMap.put("EP_complex_yn", "N");
			this.payment.kiccPayment(request, commandMap);
			
			// 기존 조회 데이터는 삭제처리
			this.paymentService.deletePayMaster(commandMap);
			
			// pg 결과값 가져오기 0000 : 성공, 그 외는 실패.
			PAY_MST_RESPCODE = StringUtil.getString(commandMap.get("PAY_MST_RESPCODE"));
			PAY_MST_RESPMSG = StringUtil.getString(commandMap.get("PAY_MST_RESPMSG"));
			if("0000".equals(PAY_MST_RESPCODE)){//조회성공시
				commandMap.put("PAY_MST_KICC_CARD_NO", request.getParameter("EP_pnt_idno"));//캐쉬백카드번호
				cashbagRemainPoint = StringUtil.getString(commandMap.get("PAY_MST_KICC_REMAIN_PNT"),"0");
				// 2. PAY_MST INSERT
				this.paymentService.insertPayMaster(commandMap);
			}else{//조회 실패시
				logger.debug("캐쉬백 조회실패!!");
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("캐쉬백 조회오류!!");
		}
		
		json.put("PAY_MST_RESPCODE", PAY_MST_RESPCODE);
		json.put("PAY_MST_RESPMSG", PAY_MST_RESPMSG);
		json.put("cashbagRemainPoint", cashbagRemainPoint);

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : prdCpnDiscountAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 선택 상품 쿠폰 적용
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/cart/prdCpnDiscountAjax.do")
	public JSON prdCpnDiscountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		String isSuccessYn = "Y";
		
		// 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
				
		// 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
				
		//String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		
		// 주문상품 리스트
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		
		// 쿠폰 할인금액 update
		int prd_cpn_tot_dc_amt_real =  this.cartService.updateTempCartPrdCpnAmt(commandMap);
		
		logger.debug("prd_cpn_tot_dc_amt_real=============="+prd_cpn_tot_dc_amt_real);
		
		// 총 쿠폰 금액 계산
		int totCouponDcAmt = this.cartService.selectTotCouponDcAmt(commandMap);
		
		// 총 쿠폰 금액 update
		commandMap.put("ORD_TMP_DC_CPN", totCouponDcAmt);
		this.cartService.updateTempCartAmt(commandMap);
		
		logger.debug("totCouponDcAmt=============="+totCouponDcAmt);
		
		// 결제대상금액 등 결제관련 정보 준비
		int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
		int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
		//int CART_PAYMENT_DC_COUPON = totCouponDcAmt; // 총 사용 쿠폰금액
		
		int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
		
		logger.debug("CART_PAYMENT_AMOUNT========"+CART_PAYMENT_AMOUNT);
		
		// [BEGIN] 포인트정보 적용
		int cart_add_disc_prc = CART_PAYMENT_DC_MILEAGE + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
		int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
		
		//화면에 뿌려줄 데이터
		json.addObject("isSuccessYn", isSuccessYn);
		json.addObject("prd_cpn_tot_dc_amt_real", prd_cpn_tot_dc_amt_real);//총 상품쿠폰 할인 금액
		json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
		json.addObject("cart_total", cart_total);//최종결제금액
		
		//  적립예정 마일리지/캐쉬백 계산 필요
		// 최종결제금액-배송비+배송비무료쿠폰-추가배송비
		Map<String,Object> map_save = new HashMap<String,Object>();
		int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
		map_save.put("ORD_PRC", cartOrdPrc);
		map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		map_save.put("TYPE", "M"); //마일리지
		int saveMlg = this.cartService.selectReservePrice(map_save);
		map_save.put("TYPE", "C"); //캐쉬백
		int saveCashbag = this.cartService.selectReservePrice(map_save);
		
		json.addObject("saveMlg", saveMlg);
		json.addObject("saveCashbag", saveCashbag);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : dlvCpnDiscountAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 선택 배송비 쿠폰 적용
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 7.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/cart/dlvCpnDiscountAjax.do")
	public JSON dlvCpnDiscountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		String isSuccessYn = "Y";
		
		// 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
				
		// 세션정보
		String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
		commandMap.put("session_id", session_id);
				
		//String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		
		// 주문상품 리스트
		commandMap.put("PRD_MST_CNL_MOBILE_YN", "Y"); //MOBILE용 
		commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
		commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
		this.cartService.selectTempOrderProductList(commandMap);
		List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		
		// 쿠폰 할인금액 update
		int dlv_cpn_tot_dc_amt_real =  this.cartService.updateTempCartDlvCpnAmt(commandMap);
		
		logger.debug("dlv_cpn_tot_dc_amt_real=============="+dlv_cpn_tot_dc_amt_real);
		
		// 총 쿠폰 금액 계산
		int totCouponDcAmt = this.cartService.selectTotCouponDcAmt(commandMap);
		
		// 총 쿠폰 금액 update
		commandMap.put("ORD_TMP_DC_CPN", totCouponDcAmt);
		this.cartService.updateTempCartAmt(commandMap);
		
		logger.debug("totCouponDcAmt=============="+totCouponDcAmt);
		
		// 배송비가 변경되므로 금액 재계산 필요
		this.cartService.selectTempOrderProductList(commandMap);
		cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		
		// 결제대상금액 등 결제관련 정보 준비
		int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
		int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
		
		//int CART_PAYMENT_DC_COUPON = totCouponDcAmt; // 총 사용 쿠폰금액
		
		int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
		
		logger.debug("CART_PAYMENT_AMOUNT========"+CART_PAYMENT_AMOUNT);
		
		// [BEGIN] 포인트정보 적용
		int cart_add_disc_prc = CART_PAYMENT_DC_MILEAGE + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
		int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
		
		//화면에 뿌려줄 데이터
		json.addObject("isSuccessYn", isSuccessYn);
		json.addObject("dlv_cpn_tot_dc_amt_real", dlv_cpn_tot_dc_amt_real);//총 상품쿠폰 할인 금액
		json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
		json.addObject("cart_total", cart_total);//최종결제금액
		
		//  적립예정 마일리지/캐쉬백 계산 필요
		// 최종결제금액-배송비+배송비무료쿠폰-추가배송비
		Map<String,Object> map_save = new HashMap<String,Object>();
		int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
		map_save.put("ORD_PRC", cartOrdPrc);
		map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		map_save.put("TYPE", "M"); //마일리지
		int saveMlg = this.cartService.selectReservePrice(map_save);
		map_save.put("TYPE", "C"); //캐쉬백
		int saveCashbag = this.cartService.selectReservePrice(map_save);
		
		json.addObject("saveMlg", saveMlg);
		json.addObject("saveCashbag", saveCashbag);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : getItNowTicketPopup
	* 2. ClassName  : CartController.java
	* 3. Comment    : 겟잇나우 팝업
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/cart/getItNowTicketPopup.do")
	public ModelAndView getItNowTicketPopup(HttpServletRequest request,	@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("SESSION_MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		
		//본인 주문 체크
		int orderCount = this.pcMyShoppingService.selectOrderCount(commandMap);
		
		if(orderCount > 0){
			Map<String,Object> getItNowShopInfo = this.cartService.selectOrderGetItNowShopInfo(commandMap);
			mv.addObject("getItNowShopInfo",getItNowShopInfo);
			
			// 핸드폰 앞자리
			mv.addObject("hpCodeList", this.pcCommonService.selectCode("HP_CODE"));
			
			// 겟잇나우 수령자와의 관계
			mv.addObject("getItNowReceiverList", this.pcCommonService.selectCode("GET_IT_NOW_RECEIVER_CD"));
			
			// 주문상품 목록
			commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	        List<Map<String, Object>> orderProductList = this.pcMyShoppingService.selectOrderProductList(commandMap);
	        
	        //  상품 옵션 가져오기
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
	 		mv.addObject("orderProductList", orderProductList);
	 		 
			mv.addObject("commandMap", commandMap);
		}else{
    		mv.setViewName("mobile/common/result");
    		mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
    	}
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : getItNowTicketPreviewPopup
	* 2. ClassName  : CartController.java
	* 3. Comment    : 겟잇나우 교환권 미리보기 팝업
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/getItNowTicketPreviewPopup.do")
	public ModelAndView getItNowTicketPreviewPopup(HttpServletRequest request,	@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : sendGetItNowTicketAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 겟잇나우 교환권 발송
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value = "/mobile/cart/sendGetItNowTicketAjax.do", method = RequestMethod.POST)
	public JSON sendGetItNowTicketAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		int ORD_GET_SMS_CNT = 0;

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		commandMap.put("user", user);
		
		// -- 사용자 아이피
		String remote_addr = request.getRemoteAddr();
		commandMap.put("remote_addr", remote_addr);
		
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("SESSION_MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		
		//본인 주문 체크
		int orderCount = this.pcMyShoppingService.selectOrderCount(commandMap);
		
		if(orderCount > 0){
			// 교환권 발송
			Map<String, Object> resultMap = this.cartService.updateGetItNowTicketSend(commandMap);
			
			result = StringUtil.getInt(resultMap.get("result"));
			resultMsg = StringUtil.getString(resultMap.get("resultMsg"));
			ORD_GET_SMS_CNT = StringUtil.getInt(resultMap.get("ORD_GET_SMS_CNT"));
		}

		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);
		json.addObject("ORD_GET_SMS_CNT", ORD_GET_SMS_CNT);

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : getItNowShopInfoPopup
	* 2. ClassName  : CartController.java
	* 3. Comment    : 겟잇나우 매장위치 안내 팝업
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/getItNowShopInfoPopup.do")
	public ModelAndView getItNowShopInfoPopup(HttpServletRequest request,	@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> getItNowShopInfo = this.cartService.selectGetItNowShopInfo(commandMap);
		mv.addObject("getItNowShopInfo",getItNowShopInfo);
		
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : getCardListAjax
	* 2. ClassName  : CartController.java
	* 3. Comment    : 카드종류 가져오기 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value = "/mobile/cart/getCardListAjax.do", method = RequestMethod.POST)
	public JSON getCardListAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";
		
		// 장기할부인 경우 대상 카드사 cd 리스트 먼저 가져온다.
		String ORD_TMP_LNG_DIV = StringUtil.getString(commandMap.get("ORD_TMP_LNG_DIV"));//장기할부개월수
		logger.debug("ORD_TMP_LNG_DIV==================="+ORD_TMP_LNG_DIV);
		
		String PAYMENT_PRICE = StringUtil.getString(commandMap.get("PAYMENT_PRICE"));//결제금액
		logger.debug("PAYMENT_PRICE==================="+PAYMENT_PRICE);
		
		List<Map<String,Object>> longCardCdList = this.cartService.selectCardLongInstallmentList(commandMap);
		List<String> longCardCdArr = new ArrayList<String>();
		if(!longCardCdList.isEmpty()){
			for(Map<String,Object> longCardCd : longCardCdList){
				longCardCdArr.add(StringUtil.getString(longCardCd.get("DIV_DTL_CD")));
			}
			commandMap.put("longCardCdArr", longCardCdArr);
			try{
				List<Map<String,Object>> cardList = this.cartService.selectKiccCardList(commandMap);
				json.addObject("cardList",cardList);
				result = 1;
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			int longCardMinPrc = this.cartService.selectCardLongInstallmentMinimumPrc(commandMap);
			
			resultMsg = "장기할부 가능 카드가 없습니다.\\n관리자에게 문의하시기 바랍니다.";
			if(longCardMinPrc > 0){
				resultMsg = ORD_TMP_LNG_DIV +"개월 장기할부 주문 가능 최소금액은 "+ String.format("%,d", longCardMinPrc) +"원입니다.";
			}
			result = -1;
		}
		
		json.addObject("result", result);
		json.addObject("resultMsg", resultMsg);

		return json;
	}
}
