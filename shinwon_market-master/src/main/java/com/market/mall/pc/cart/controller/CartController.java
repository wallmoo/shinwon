package com.market.mall.pc.cart.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.KakaoPayDataEncrypt;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.lgcns.kmpay.dto.DealApproveDto;
import com.lgcns.kmpay.service.CallWebService;
import com.market.mall.am.board.service.AgreementBoardService;
import com.market.mall.am.marketing.service.PointService;
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
import com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service.OrderErpApiService;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.event.service.EventMainService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.member.service.MemberDeliveService;
import com.market.mall.pc.mypage.service.MyCouponService;
import com.market.mall.pc.mypage.service.MyKeepService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyPointService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;
import com.market.util.TestLoginSession;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.cart.controller
 * @FileName : CartController.java
 * @Date : 2014. 7. 3.
 * @프로그램 설명 : 장바구니 / 주문.결제를 처리하는 Controller Class
 * @author 이상준
 */
@Controller
@AccessLevelUser(ROLEUSER.guest)
public class CartController {

    @Resource
    protected Sms sms;
    @Resource
    private CartService cartService;
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    @Resource(name = "orderErpApiService")
    protected OrderErpApiService orderErpApiService;
    
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
    
    @Resource(name="pointService")
    private PointService pointService;
    
    @Resource(name="pcEventMainService")
    private EventMainService pcEventMainService;
    
    //2020.06.17 포인트 조회
    @Resource(name="pcMyPointService")
    private MyPointService pcMyPointService;
    
    //2020.06.26 쿠폰조회
    @Resource(name="pcMyCouponService")
    private MyCouponService pcMyCouponService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL;
    
    private final static String CART_PC_MOBILE_GUBUN = "P"; //PC, MOBILE 구분

    @FrontBannerSkip()
    @RequestMapping("/pc/cart/carttest.do")
    public ModelAndView carttest(HttpServletRequest request,
            @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("user", user);
        commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
                
        //상품정보 불러오기
        Map<String, Object> productInfo = this.cartService.selectProductInfo(commandMap);
        mv.addAllObjects(productInfo);
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    
    @FrontBannerSkip()
    @RequestMapping("/pc/cart/cartsample.do")
    public ModelAndView cartsample(HttpServletRequest request,
            @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("user", user);
        commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
                
        //상품정보 불러오기
        Map<String, Object> productInfo = this.cartService.selectProductInfo(commandMap);
        mv.addAllObjects(productInfo);
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : insertCart
     * 2. ClassName  : CartController.java
     * 3. Comment    : 상품상세 -> 장바구니 상품 추가
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 7. 3.
     * </pre>
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /pc/cart/insertCartAjax.do
     * @apiVersion 0.1.0
     * @apiName 장바구니 추가
     * @apiGroup 장바구니
     *
     * @apiParam {String} MEM_CRT_DLV_GBN 장바구니 유형 구분(장기할부, 즉시구매)
     * @apiParam {String} PRD_MST_O2O_YN O2O 여부
     * @apiParam {String} MEM_PRD_MST_CD 상품코드
     * @apiParam {String} MEM_CRT_COLOR 컬러 IDX
     * @apiParam {String} MEM_CRT_SIZE 사이즈 IDX
	 * @apiParam {String} MEM_CRT_CNT 개수
     * @apiParam {String} MEM_PRD_OPT_DTL_IDX 0 고정 (임시)
     * @apiParam {String} MEM_CRT_SLT_YN 상품선택여부 N 고정 (임시)
     
     * @apiSuccess {String} resultMsg 메세지
     * @apiSuccess {String} result  결과코드 0 이하 실패
     * @apiSuccess {String} cartCnt 장바구니 상품 개수
     *
     * @apiSuccessExample Success-Response:
     *     HTTP/1.1 200 OK
     *     {
	 *		    "result": 1,
	 *		    "resultMsg": "장바구니에 추가되었습니다",
	 *		    "cartCnt": "2"
	 *	   }
     */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/insertCartAjax.do", method = RequestMethod.POST)
    public JSON insertCartAjax(HttpServletRequest request,
            @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        int result = 0;
        String resultMsg = "에러가 발생했습니다.";

        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        //User user = TestLoginSession.getTestSession();
        commandMap.put("user", user);
        
        // -- 사용자 아이피
        String remote_addr = request.getRemoteAddr();
        commandMap.put("remote_addr", remote_addr);

        // -- 세션정보 (비회원으로 장바구니에 넣으면 session_id로 저장되고, 로그인 시 session_id가 MEM_CRT_SES_ID = ''로 update 하고  MEM_MST_MEM_ID = '회원아이디' 로 update
        String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
        commandMap.put("session_id", session_id);

        // 상품 옵션 idx
        //String[] TEMP_OPT_DTL_IDXs = request.getParameterValues("OPT_DTL_IDXs");
        //List<String> OPT_DTL_IDXs = Arrays.asList(TEMP_OPT_DTL_IDXs);
        //commandMap.put("OPT_DTL_IDXs", OPT_DTL_IDXs);
        
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
                resultMsg = "장바구니에 추가되었습니다";
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
        paramMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
    @RequestMapping(value = "/pc/cart/insertDirectPurchaseAjax.do", method = RequestMethod.POST)
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
//        int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));
//        if(Code.CART_DLV_GBN_GET_IT_NOW_CD == MEM_CRT_DLV_GBN){// 겟잇나우인 경우 재고 체크 하지 않음
//            // 장바구니 상품 추가
//            result = this.cartService.insertDirectPurchase(commandMap, request);
//        }else{
//            // 재고 체크
//            Map<String, Object> prdStock = this.cartService.selectPrdStock(commandMap, request);
//            
//            if((Integer)prdStock.get("result") > 0){//재고 있음
//                // 장바구니 상품 추가
//                result = this.cartService.insertDirectPurchase(commandMap, request);
//            }else{//재고 없음
//                result = (Integer)prdStock.get("result");
//                resultMsg = StringUtil.getString(prdStock.get("resultMsg"));
//            }
//        }
        result = this.cartService.insertDirectPurchase(commandMap, request);        
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
    * 5. 작성일       : 2015. 11. 25.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    /**
     * @api {POST} /pc/cart/insertCartpaymentAjax.do
     * @apiVersion 0.1.0
     * @apiName 임시주문생성
     * @apiGroup 장바구니
     *
     * @apiParam {Array} MEM_CRT_IDX 임시주문번호
     * @apiSuccess {String} ORD_MST_CD 임시주문코드
     */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/insertCartpaymentAjax.do", method = RequestMethod.POST)
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
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 7. 3.
     * </pre>
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    /**
     * @api {POST} /pc/cart/cartlist.do
     * @apiVersion 0.1.0
     * @apiName 장바구니 조회
     * @apiGroup 장바구니
     *
     */
    @RequestMapping(value = "/pc/cart/cartlist.do")
    public ModelAndView cartlist(HttpServletRequest request,
            @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        //User user = TestLoginSession.getTestSession();
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
            //키핑 상품 PC 구분 값
            //commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
            //commandMap.put("CHN_GBN",Code.USER_ENV_TYPE_PC);
            //commandMap.put("quickKeep","Y");
            //mv.addObject("keepingPrdList", this.pcMyKeepService.selectKeepProductList(commandMap));
            
            // 마이페이지 요약정보
            //Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            //mv.addObject("summaryMap", summaryMap);
            
            // 포인트 정보
            //Map<String, Object> pointSumMap = this.pointService.selectMemberPointSum(commandMap);
            //mv.addObject("pointSum", pointSumMap);
        }

        // 상품 채널 타입
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
        // -- 상품정보
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
        this.cartService.selectCartlist(commandMap);
        
        
        //-- 사용자정보
        commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
        
        // 카드 이벤트 안내 목록
       
        mv.addObject("cardEventFreetList", this.cartService.selectCardEventFreeList(commandMap));
        
        mv.setViewName("pc/cart/cartlist");
        mv.addAllObjects(commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : calculateCartAmountAjax
    * 2. ClassName  : CartController.java
    * 3. Comment    : 장바구니 주문금액 계산(체크박스 바뀔때마다 실행)
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/calculateCartAmountAjax.do")
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
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
        
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
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    /**
     * @api {POST} /pc/cart/deleteCart.do
     * @apiVersion 0.1.0
     * @apiName 장바구니 제거
     * @apiGroup 장바구니
     *
     * @apiParam {Array} MEM_CRT_IDXs cart_idx_arr
     * @apiSuccess {String} resultMsg 메세지
     * @apiSuccess {String} result  결과코드 0 이하 실패
     * @apiSuccess {String} cartCnt 장바구니 상품 개수
     */
    
    @FrontBannerSkip
    @RequestMapping(value = "/pc/cart/deleteCart.do", method = RequestMethod.POST)
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
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /pc/cart/cartpayment.do
     * @apiVersion 0.1.0
     * @apiName 결제신청
     * @apiGroup 장바구니
     *
     * @apiParam {String} ORD_MST_CD 임시주문번호

     
     * @apiSuccess {Object} cartlist 임시주문 상품리스트
     * @apiSuccess {Object} sessionUser 사용자정보
     * @apiSuccess {Object} myDlvList 나의 배송지
     * @apiSuccess {Object} summaryMap 마이페이지 요약
     * @apiSuccess {Object} recentDlvList 최근 배송지 목록
     * @apiSuccess {Object} prdCpnList 상품별 상품 쿠폰 리스트
     * @apiSuccess {Object} totPrdCpnSet 전체적용 가능 쿠폰(전체 쿠폰목록에 중복 존재하는 쿠폰 리스트)'
     * @apiSuccess {Object} dlvCpnList 묶음 배송비 쿠폰 리스트는 대표 상품에 담아둔다.
     * @apiSuccess {Object} criterionPrdCpnList /복 제거된 CPN_MST_IDX 셋(적용가능한 쿠폰 count 보여주기 위한 용도)
     * @apiSuccess {Object} depositBankList 무통장 입금 가능은행 리스트
     * @apiSuccess {Object} cardPromotionList 카드 행사 목록
     * @apiSuccess {Object} hpCodeList 핸드폰 앞자리
     * @apiSuccess {Object} telCodeList 전화번호 국번
     * @apiSuccess {Object} codes 이메일도메인, PAY_TYPE, DLV_MESSAGE_CD
     * @apiSuccess {Object} CST_PLATFORM 결제모드
     * @apiSuccess {Object} cardEventFreetList 카드 이벤트 안내 리스트 
     * @apiSuccess {Object} cardEventFreetList 카드 프로모션 리스트
     */
    
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
    @RequestMapping(value = "/pc/cart/cartpayment.do")
    public ModelAndView cartpayment(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        // 주문번호
        String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
        logger.info("주문서 ORD_MST_CD ========="+ORD_MST_CD);
        
        if("".equals(ORD_MST_CD)){
            String returnUrl = StringUtil.getString(commandMap.get("returnUrl"));
            mv.addObject("alertMsg", "주문할 상품이 없습니다.\\n메인으로 이동합니다.");
            mv.addObject("returnUrl", ""==returnUrl ? StringUtil.getString(request.getAttribute("serverSslDomain"),"") + "/pc/main/index.do" : returnUrl);
            mv.setViewName("pc/common/result");
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
        commandMap.put("StorageKey", session_id);
                
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

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            mv.addObject("summaryMap", summaryMap);

            // 포인트 정보
            Map<String, Object> pointSumMap = this.pointService.selectMemberPointSum(commandMap);  
            
            mv.addObject("pointSum", pointSumMap);           
            
            Map<String, Object> innerMap = new HashMap<String, Object>();
            innerMap.put("MEM_MST_MEM_ID",commandMap.get("MEM_MST_MEM_ID"));
            Map<String, Object> myEpointMap = pcMyPointService.selectMyEpoint(innerMap); //E-point
            mv.addObject("myEpointMap",myEpointMap); 
            
            Map<String, Object> myTpointMap = pcMyPointService.selectMyTpoint(innerMap); //통합포인트
            mv.addObject("myTpointMap", myTpointMap);
            //myTpointMap.POINT_AMT 로 EL 출력
            
            // 2020.06.24 임직원 포인트 조회
            Map<String, Object> myInfo = pcMyPointService.selectMyInfo(commandMap);
            int memSwId = 0;        
            if(myInfo.get("MEM_MST_SW_ID") != null) {        	
            	memSwId = Integer.valueOf(StringUtil.getString(myInfo.get("MEM_MST_SW_ID"),"-1"));
            	List<Map<String, Object>> mySwPointList = pcMyPointService.selectMyPointSwOne(commandMap);
//            	mv.addObject("mySwPointMap", mySwPointMap);
            	int initialSwPoint = (int) mySwPointList.get(0).get("LIMIT_AMT");//연간 임직원포인트
            	
            	List<Map<String, Object>> mySwAddPointList = pcMyPointService.selectUserAddEmpPointLimit(commandMap);
            	int additionalSwPoint = (int) mySwAddPointList.get(0).get("OCCUR_POINT");//임직원 추가포인트
            	
            	int mySwPoint = initialSwPoint + additionalSwPoint;
            	
            	mv.addObject("mySwAddPoint", mySwPoint);//가용 임직원 포인트 (연간 임직원 포인트 + 임직원 개인 추가포인트)
            }
            
        }
        
        // 주문서 금액 RESET
        this.cartService.updateTempCartAmtReset(commandMap);
        this.cartService.updateTempCartPrdAmtReset(commandMap);
        // 캐쉬백 조회 이력 삭제
        this.paymentService.deletePayMaster(commandMap);
        
        //2020.06.27 쿠폰사용 초기화
        this.pcMyCouponService.updateCpnReset(commandMap);
                
        // 주문상품 리스트
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
        this.cartService.selectTempOrderProductList(commandMap);
        
        List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
        if(cartlist.isEmpty()){
            String returnUrl = StringUtil.getString(commandMap.get("returnUrl"));
            mv.addObject("alertMsg", "주문서 생성에 실패하였습니다.\\n메인으로 이동합니다.");
            mv.addObject("returnUrl", ""==returnUrl ? StringUtil.getString(request.getAttribute("serverSslDomain"),"") + "/pc/main/index.do" : returnUrl);
            mv.setViewName("pc/common/result");
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
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"),"") + "/pc/cart/cartlist.do");
                    mv.setViewName("pc/common/result");
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
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"),"") + "/pc/cart/cartlist.do");
                mv.setViewName("pc/common/result");
                return mv;
            }
        }else{
            mv.addObject("cardList", this.cartService.selectKiccCardList(commandMap));
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
                
                //logger.debug("criterionPrdCpnList.get("+i+")======"+criterionPrdCpnList.get(i));
                
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
                
                //logger.debug("after criterionPrdCpnList.get("+i+")======"+criterionPrdCpnList.get(i));
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
        // 클린킹 불러오지 않는다.
        //if(ORD_TMP_DLV_GBN != Code.CART_DLV_GBN_SERVICE_CD){
            Map<String, Object> giftMap = new HashMap<String, Object>();
            giftMap.put("SUM_TOT_ORDER_PRICE", cartlist.get(0).get("SUM_TOT_ORDER_PRICE"));//총주문금액
            giftMap.put("ORD_MST_CD", ORD_MST_CD);//주문번호
            giftMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_MIDDLE);//썸네일 사이즈
            commandMap.put("giftList", this.cartService.selectGiftList(giftMap));
        //}
        
        // 카드 이벤트 안내 목록
        if(ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){
            commandMap.put("longCartYn", "Y");
        }
        mv.addObject("cardEventFreetList", this.cartService.selectCardEventFreeList(commandMap));
        
        // 카드 행사 목록
        //mv.addObject("cardPromotionList", this.cartService.selectCardPromotionList(commandMap));
        
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
        commandMap.put("LGD_CLOSEDATE", LGD_CLOSEDATE);
        //LGD_CLOSEDATE += "235959";
        
        commandMap.put("EP_expire_date", LGD_CLOSEDATE);
        //commandMap.put("LGD_CLOSEDATE", LGD_CLOSEDATE);
        commandMap.put("LGD_CLOSEDATE_TEXT", dateformat_text.format(bank_account_calendar.getTime()));
        
        // 입금은행
        commandMap.put("CODE", Code.KICC_BANK_CD);
        commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
        mv.addObject("depositBankList", this.cartService.selectCodeList(commandMap));
        
        /** PG 관련 셋팅 END */
        
        // 사용자정보
        commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
        
        /** 2020.06.25 카드정보 및 할부기간 테이블 및 코드값 정리 되는 대로 수정예정  */
        List<Map<String, Object>> cardTempList = this.cartService.selectTempCardList();
        mv.addObject("cardTempList",cardTempList);
        
        // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "PAY_TYPE", "DLV_MESSAGE_CD"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        mv.addObject("CST_PLATFORM",this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM"));
        mv.setViewName("pc/cart/cartpayment");
        mv.addAllObjects(commandMap);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProdCpnProcAjax
     * 2. ClassName  : CartController.java
     * 3. Comment    : 프론트 > 주문 > 상품쿠폰 팝업 > 쿠폰리스트 조회 
     * 4. 작성일       : 2020. 6. 26.
     * </pre>
     *  
     * @param request
     * @param CPN_TGT_CD
     * @return
     */
    @RequestMapping(value="/pc/cart/selectProdCpnProcAjax.do")
    public JSON selectProdCpnProcAjax(HttpServletRequest request, @RequestParam String CPN_TGT_CD)throws Exception {
    	JSON json = new JSON();    	    	
    	String CPN_MEM_ID = SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID();
    	Map<String, Object> selectCpnMap = new HashMap<String, Object>();
    	selectCpnMap.put("CPN_MEM_ID",CPN_MEM_ID);
    	selectCpnMap.put("CPN_TGT_CD",CPN_TGT_CD);    	
    	List<Map<String ,Object>> cpnList = this.pcMyCouponService.selectProdCpnProcAjax(selectCpnMap);    	
    	json.addObject("cpnList", cpnList);    	
    	return json;
    }
      
    /**
     * 
     *<pre>
     * 1. MethodName : cpnUseUpdateProc
     * 2. ClassName  : CartController.java
     * 3. Comment    : 프론트 > 주문 > 상품쿠폰 팝업 > 주문서에서 쿠폰리스트 사용처리 (주문서로 진입 시 원복) 
     * 4. 작성일       : 2020. 6. 27.
     * </pre> 
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/pc/cart/cpnUseUpdateProc.do" , method = RequestMethod.POST)
    @ResponseBody
    public boolean cpnUseUpdateProc(HttpServletRequest request, @RequestParam Map<String, Object> commandMap) throws Exception {
    	
    	boolean check = false;
    	
    	check = this.pcMyCouponService.cpnUseUpdateProc(commandMap);  
    	
    	return check;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName : calcIniPayment
     * 2. ClassName  : CartController.java
     * 3. Comment    : 프론트 > 주문 > 쿠폰사용 후 금액계산 (변조방지)
     * 4. 작성일       : 2020. 6. 29.
     * </pre> 
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/pc/cart/calcIniPayment.do" , method  = RequestMethod.POST)
    public JSON calcIniPayment(HttpServletRequest request, @RequestParam Map<String, Object> commandMap) throws Exception {
    	JSON json = new JSON();
    	boolean check = false;
    	
		/*
		 * String CPN_MEM_ID = SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID();
		 * 
		 * commandMap.put("MEM_MST_MEM_ID",CPN_MEM_ID);
		 */
    	
    	List<Map<String,Object>> cartlist = cartService.calcIniPayment(commandMap);
    	
    	json.addObject("check",check);
    	json.addObject("cartlist",cartlist);
    	
    	return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : ajaxCartPayCheck
     * 2. ClassName  : CartController.java
     * 3. Comment    : 프론트 > 주문 > 주문서 생성 및 주문정보 체크
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @FrontBannerSkip
    @RequestMapping(value="/pc/cart/ajaxCartPayCheck")
    public JSON ajaxCartPayCheck (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
        logger.info("주문 PREPARE ORD_MST_CD ========="+ORD_MST_CD);
        
        Map<String, Object> tempCartMap = new HashMap<String, Object>();
        
        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        tempCartMap.put("user", user);

        // -- 세션정보
        String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
        tempCartMap.put("session_id", session_id);
        commandMap.put("StorageKey", session_id);
                
        // 주문상품 리스트
        tempCartMap.put("ORD_MST_CD", ORD_MST_CD);
        tempCartMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
        
        commandMap.put("CART_PAYMENT_DC_POINT", CART_PAYMENT_DC_POINT);
        commandMap.put("CART_PAYMENT_DC_CASHBAG", CART_PAYMENT_DC_CASHBAG);
        commandMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);

        // 최종 결제금액
        int CART_PAYMENT_TOTAL = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_POINT - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON;
        
        if(CART_PAYMENT_TOTAL < 0){
            json.addObject("result",-888);
            json.addObject("resultMsg","결제금액이 0원 이하인 경우 주문이 불가능합니다.\n관리자에게 문의해주시기 바랍니다.");
            return json;
        }
        
        commandMap.put("CART_PAYMENT_TOTAL", CART_PAYMENT_TOTAL);
        
        logger.debug("CART_PAYMENT_DELIVERY===="+CART_PAYMENT_DELIVERY);
        logger.debug("CART_PAYMENT_AMOUNT===="+CART_PAYMENT_AMOUNT);
        logger.debug("CART_PAYMENT_DC_POINT===="+CART_PAYMENT_DC_POINT);
        logger.debug("CART_PAYMENT_DC_CASHBAG===="+CART_PAYMENT_DC_CASHBAG);
        logger.debug("CART_PAYMENT_DC_COUPON===="+CART_PAYMENT_DC_COUPON);
        logger.debug("CART_PAYMENT_TOTAL===="+CART_PAYMENT_TOTAL);
        
        // 회원 or 비회원 쿠폰/포인트/캐쉬백 사용 체크
        Map<String, Object> userInfo = null;
        String MEM_MST_DCT_YN = ""; 
        int SOLUBLE_POINT = 0;
        if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
            commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
            userInfo = this.cartService.selectUserInfo(commandMap);
            MEM_MST_DCT_YN = StringUtil.getString(userInfo.get("MEM_MST_DCT_YN"));//쿠폰/마일리지/포인트 사용 제한 여부
            
            //회원 사용가능 포인트
            Map<String, Object> pointSumMap = this.pointService.selectMemberPointSum(commandMap);
            SOLUBLE_POINT = StringUtil.getInt(pointSumMap.get("CUR_POINT"), 0);
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
        
        // 일반회원만 포인트 사용 가능. 그 외에 사용시 에러 처리
        if(CART_PAYMENT_DC_POINT > 0 && (userInfo == null || "Y".equals(MEM_MST_DCT_YN) || Code.COMMON_PRI_MEMBER_GRADE != StringUtil.getInt(userInfo.get("MEM_MST_MEM_GBN")))){
            logger.error("##################### 비 일반회원 포인트 사용 ###########################");
            
            json.addObject("result",-888);
            json.addObject("resultMsg", "일반회원만 포인트 사용이 가능합니다.");
            return json;
        }
        
        // 가용 마일리지 확인
        if(CART_PAYMENT_DC_POINT > 0){
            if(CART_PAYMENT_DC_POINT > SOLUBLE_POINT){
                logger.error("##################### 사용 포인트["+ CART_PAYMENT_DC_POINT +"] 가용 마일리지["+ SOLUBLE_POINT +"] 추가 ###########################");
                
                json.addObject("result",-888);
                json.addObject("resultMsg", "가용 포인트가 부족합니다.");
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
        json.addObject("result",0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : paymentPrepare
     * 2. ClassName  : CartController.java
     * 3. Comment    : 장바구니 -> 주문서작성 -> 결제요청
     * 4. 작성자       : 이상준
     * 5. 작성일       : 2014. 7. 17.
     * </pre>
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @FrontBannerSkip
    @RequestMapping(value = "/pc/cart/paymentPrepare.do", method = RequestMethod.POST)
    public JSON paymentPrepare(HttpServletRequest request,
            @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("result",0);
        
        String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
        logger.info("주문 PREPARE ORD_MST_CD ========="+ORD_MST_CD);
        
        Map<String, Object> tempCartMap = new HashMap<String, Object>();
        tempCartMap.putAll(commandMap);
        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        //User user = TestLoginSession.getTestSession();
        tempCartMap.put("user", user);

        // -- 세션정보
        String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
        tempCartMap.put("session_id", session_id);
        commandMap.put("StorageKey", session_id);
                
        // 주문상품 리스트
        tempCartMap.put("ORD_MST_CD", ORD_MST_CD);
        tempCartMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
        
        //2020.16.18 포인트 벨리데이션
        
        //1. 해당유져의 포인트 확인
        Map<String, Object> checkPointMap = new HashMap<String, Object>();
        checkPointMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());//주문자ID
        Map<String, Object> myEpointMap = pcMyPointService.selectMyEpoint(checkPointMap);
        Map<String , Object> myTotintMap = (Map<String, Object>) myEpointMap.get("myTotPoint");
        int useTpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_TPN")));
    	int useEpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_EPN")));
    	int useSw = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_SW"))); //임직원포인트 작업할 때 데이터 넣을 예정
        /*
        int useTpn = 0;
        int useEpn = 0;
        if(myTotintMap != null && myTotintMap.size() > 0) {
        	useTpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_TPN")));
        	useEpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_EPN")));
        } 
        */       
        //2. 그 후 들어온 포인트 금액이 사용될 수 있는건지 확인 들어온 포인트가 보유포인트보다 많을 때 에러메세지 출력        
        if(Integer.valueOf((String) myTotintMap.get("MemberPointCheckResult")) < useTpn &&  Integer.valueOf((String) myEpointMap.get("MEM_PIT_TOT_PIT")) < useEpn ) {
        	json.addObject("result",-888);
            json.addObject("resultMsg","잘못된 포인트 사용입니다.");
            return json;
        }
        //사용한 포인트 금액 UPDATE
        commandMap.put("ORD_TMP_DC_PIT", useTpn+useEpn+useSw);
        this.cartService.updateTempCartAmt(commandMap);
        
        //ORD_TMP_DC_PIT        
        //cartlist.get(0).put("ORD_TMP_DC_PIT",cartlist.get(0).get("ORD_TMP_DC_PIT"));
        cartlist.get(0).put("ORD_TMP_DC_PIT",useTpn+useEpn+useSw);
        // 재고 확인
        /*
        Map<String, Object> cartStock = this.cartService.selectTempOrderStock(commandMap);
        if((Integer)cartStock.get("result") < 0){
            json.addObject("result",(Integer)cartStock.get("result"));
            json.addObject("resultMsg",(String)cartStock.get("resultMsg"));
            return json;
        }
        */
        // 결제대상금액 등 결제관련 정보 준비
        int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
        int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999) + CART_PAYMENT_DELIVERY; // 주문금액 + 총배송비
        int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트금액
        
        //포인트 추가
        int CART_PAYMENT_DC_TPN = useTpn;
        int CART_PAYMENT_DC_EPN = useEpn;
        int CART_PAYMENT_DC_SWP = useSw;
        
        //2020.06.30 쿠폰사용 추가
        if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
            commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        }
        
        if(cartlist != null) {
    		for(Map<String, Object> data : cartlist) {
    			String PRD_TMP_IDX = StringUtil.getString(data.get("PRD_TMP_IDX")); // 주문서번호
    			String PRD_MST_CD = StringUtil.getString(data.get("PRD_MST_CD")); // 상품번호    			
    			Map<String , Object> selectMap = new HashMap<String, Object>();
    			selectMap.put("CPN_MEM_ID",commandMap.get("MEM_MST_MEM_ID"));
    			selectMap.put("CPN_MEM_USE_DT",PRD_TMP_IDX);
    			selectMap.put("CPN_TGT_CD",PRD_MST_CD);
    			List<Map<String,Object>> cpnSelectList = this.cartService.selectUseCpn(selectMap);
    			
    			if(cpnSelectList != null && cpnSelectList.size() != 0) {
    				//해당 주문서에 쿠폰사용함
    				for(Map<String, Object> cpnData : cpnSelectList) {
    					CART_PAYMENT_DC_COUPON = CART_PAYMENT_DC_COUPON + StringUtil.getInt(cpnData.get("CPN_MST_SAL_GBN_PAY")); //할인금액    					
    				}
    			}    				
    		}
    	}               
        // END 2020.06.30 쿠폰사용 추가
        
        commandMap.put("CART_PAYMENT_DC_MILEAGE", CART_PAYMENT_DC_MILEAGE);
        commandMap.put("CART_PAYMENT_DC_CASHBAG", CART_PAYMENT_DC_CASHBAG);
        commandMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);
        commandMap.put("CART_PAYMENT_DC_POINT", CART_PAYMENT_DC_POINT);
        
        //임시 업데이트용 변수
        commandMap.put("ORD_TMP_DC_CPN",CART_PAYMENT_DC_COUPON);
        
        //쿠폰 사용 금액 업데이트
        this.cartService.updateTempCartAmt(commandMap);
        
        //2020.06 신원몰 포인트 사용변수
        commandMap.put("CART_PAYMENT_DC_TPN", CART_PAYMENT_DC_TPN);
        commandMap.put("CART_PAYMENT_DC_EPN", CART_PAYMENT_DC_EPN);
        commandMap.put("CART_PAYMENT_DC_SWP", CART_PAYMENT_DC_SWP);               
                
        tempCartMap.put("CART_PAYMENT_DC_TPN", CART_PAYMENT_DC_TPN);
        tempCartMap.put("CART_PAYMENT_DC_EPN", CART_PAYMENT_DC_EPN);
        tempCartMap.put("CART_PAYMENT_DC_SWP", CART_PAYMENT_DC_SWP);
        
        tempCartMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);

        // 최종 결제금액
        //int CART_PAYMENT_TOTAL = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_MILEAGE - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON;
        int CART_PAYMENT_TOTAL = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_MILEAGE - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON - CART_PAYMENT_DC_TPN - CART_PAYMENT_DC_EPN - CART_PAYMENT_DC_SWP;
        
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
            commandMap.put("P9AN8", MEM_MST_ERP_ID);    //고객번호1719133
            //commandMap.put("P9AN8", 1719133); //고객번호1719133
            //Map<String, Object> memberMileageMap = this.pcMyMileageService.selectMemberMileage(commandMap);
            SOLUBLE_MILEAGE = 50000;//사용 가능 마일리지
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
        
        if(CART_PAYMENT_TOTAL == 0) {
        	json.addObject("paymentComplete",true);
        //	return "redirect:login/loginOk";
        //	return json;
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
        Map<String,Object> paymentData = paymentService.getPgApprovalValue(tempCartMap,request);
        json.addAllObjects(paymentData);
        json.addAllObjects(commandMap);

        return json;
    }

    /**
    * <pre>
    * 1. MethodName : productOptionCntModifyAjax
    * 2. ClassName  : CartController.java
    * 3. Comment    : 상품 수량/옵션 변경 ajax
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/productOptionCntModifyAjax.do")
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
    @RequestMapping(value = "/pc/cart/payment.do", method = RequestMethod.POST)
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
        
        String return_url = "";
        if(commandMap.containsKey("cartResult") && commandMap.get("cartResult").equals("Y")){//주문임시저장 테스트를 위한 내용 
            resultCode = "-1";
            resultMessage = "주문임시정보 테스트입니다.주문서 페이지로 이동하겠습니다.";
            return_url = "/pc/cart/cartpayment.do";
            commandMap.put("resultCode", resultCode);
            commandMap.put("resultMessage", resultMessage);
        }else{
            
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
            
            String ORD_MST_CD = StringUtil.getString(commandMap.get("LGD_OID")); //주문번호
            
            if(ORD_MST_CD == null || ORD_MST_CD.length() == 0) {
            	commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
            	ORD_MST_CD = cartService.selectOrderTmpMstCd(commandMap);
    		}
            
            commandMap.put("ORD_MST_CD", ORD_MST_CD);
            
            // 주문상품 정보
            commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
            //
            // 재고 확인
            /*
            Map<String, Object> cartStock = this.cartService.selectTempOrderStock(commandMap);
            if((Integer)cartStock.get("result") < 0){
                resultCode = String.valueOf((Integer)cartStock.get("result"));
                resultMessage = (String)cartStock.get("resultMsg");
                isValidOrder = false;
            }
            */
            //
                                   
            //2020.16.18 포인트 벨리데이션            
            //해당유져의 포인트 확인
            Map<String, Object> checkPointMap = new HashMap<String, Object>();
            checkPointMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());//주문자ID
            Map<String, Object> myEpointMap = pcMyPointService.selectMyEpoint(checkPointMap);
            Map<String , Object> myTotintMap = (Map<String, Object>) myEpointMap.get("myTotPoint");
            //int useTpn = 0;
            //int useEpn = 0;
            //int useSw = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_SW")));
            int useTpn = StringUtil.getInt((StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_TPN"))));
            int useEpn = StringUtil.getInt((StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_EPN"))));
            int useSw = StringUtil.getInt((StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_SW"))));
            /*
            if(myTotintMap != null && myTotintMap.size() > 0) {
            	useTpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_TPN")));
                useEpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_EPN")));
            } 
            */                 
            if(Integer.valueOf((String) myTotintMap.get("MemberPointCheckResult")) < useTpn &&  Integer.valueOf((String) myEpointMap.get("MEM_PIT_TOT_PIT")) < useEpn ) {
                logger.error("##################### 잘못된 포인트 사용입니다 ###########################");
                isValidOrder = false;
                resultMessage = "잘못된 포인트 사용 DB["+ Integer.valueOf((String) myTotintMap.get("MemberPointCheckResult"))+Integer.valueOf((String) myEpointMap.get("MEM_PIT_TOT_PIT")) +"] FRONT["+ useTpn+useEpn +"]";
            }
            
            //포인트 사용
            //int toUsePoint = StringUtil.getInt(commandMap.get("toUsePoint"));//사용 포인트
            int toUsePoint = useTpn + useEpn + useSw;//사용 포인트    (통합포인트+임직원포인트+E포인트)         
            int ORD_TMP_DC_PIT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT"));//DB 사용 포인트 (E포인트)
            // 실제 사용 포인트와 화면단 사용 포인트 다른 경우 에러 처리
            if(toUsePoint != ORD_TMP_DC_PIT){
                logger.error("##################### 포인트 사용 포인트 불일치 ###########################");
                isValidOrder = false;
                resultMessage = "포인트 사용 포인트 상이 DB["+ ORD_TMP_DC_PIT +"] FRONT["+ toUsePoint +"]";
            }
                       
            //포인트 사용 (E포인트)
            if(isValidOrder && ORD_TMP_DC_PIT > 0){
            	//사용 포인트를 차감해준다.
                commandMap.put("PIT_MST_GBN", "M");     // 차감 코드 
                commandMap.put("PIT_MST_BRK_DWN", StringUtil.getString(Code.PRD_BUY_POINT_TYPE));      // 사용 차감 코드 
                commandMap.put("PIT_MST_PIT", ORD_TMP_DC_PIT);
                
                commandMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
                commandMap.put("PIT_MST_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                
                commandMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
                commandMap.put("MEM_PIT_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                
                commandMap.put("MEM_PIT_MEM_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                this.pcEventMainService.insertPoint(request, commandMap);
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
                    cashbagMap.put("EP_pnt_txtype", "20");//10 조회 20 사용 40 적립
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
            
          //2020.06.30 쿠폰사용 추가
            /*
            int totCpnDcAmt = 0;                       
            this.cartService.selectUseCpn(commandMap);                        
            List<Map<String,Object>> cpnSelectList = (List<Map<String,Object>>) commandMap.get("cpnSelectList");
            if(cpnSelectList != null) {        	        	
            	if(cartlist != null) {
            		for(Map<String, Object> data : cartlist) {
            			String PRD_MST_CD = StringUtil.getString(data.get("PRD_MST_CD")); //상품코드
            			for(Map<String, Object> selectCpn : cpnSelectList) {
            				String CPN_TGT_CD = StringUtil.getString(selectCpn.get("CPN_TGT_CD"));
            				if(PRD_MST_CD.equals(CPN_TGT_CD)) { //쿠폰을 사용함.
            					if(selectCpn.get("CPN_MST_SAL_GBN").equals(Code.CPN_MST_GBN_GENERAL)) { //정율할인
            						double prdAmt = Double.parseDouble((StringUtil.getString(data.get("TMP_CUSTOMER_PRICE"))));
            						double salPrc = Double.parseDouble(StringUtil.getString(selectCpn.get("CPN_MST_SAL_PRC")));
            						
            						double cpnDcAmt = ((prdAmt * salPrc) / 100) ;
            						
            						int amt = (int) cpnDcAmt;
            						        						
            						totCpnDcAmt = amt;
            					}        					
            				}
            			}
            		}
            	}
            	
            }
            */
            //2020.06.20 0원결제 금액정의. 쿠폰부분 추가 시 수정
            int cart_ist_cpn_prc = ((Long) commandMap.get("cart_ist_cpn_prc")).intValue();
            int cartTotal = ((Long) commandMap.get("cart_total")).intValue();
            //cartTotal = cartTotal - totCpnDcAmt;
            //cartTotal = cartTotal;
            int ckeckNum = (toUsePoint + cart_ist_cpn_prc ) ;            
            
            if(isValidOrder){  // 1. PG 결제승인(KICC/LG/카카오페이)
            	int paymentType = 0;
                // pg 사 결제요청        
            	if(cartTotal > 0) {
            		paymentType = StringUtil.getInt(commandMap.get("radioPayment"),0);
            	}
                //int paymentType = StringUtil.getInt(commandMap.get("radioPayment"),0);                
                logger.debug("paymentType=========================="+paymentType);
                System.out.println("paymentType===============>"+paymentType);
                
                try{
                    String PAY_MST_RESPCODE = "";
                    commandMap.put("CST_PLATFORM", StringUtil.getString(commandMap.get("CST_PLATFORM")));
                    commandMap.put("CST_MID", StringUtil.getString(commandMap.get("CST_MID")));
                    commandMap.put("LGD_PAYKEY", StringUtil.getString(commandMap.get("LGD_PAYKEY")));
                    commandMap.put("LGD_CLOSEDATE", StringUtil.getString(commandMap.get("LGD_CLOSEDATE")));
                    
                    Map<String, Object> paymentInfo = new HashMap<String, Object>();
                    if(cartTotal == 0) {
                    	paymentType = Code.PAY_MILEAGE;
                    	PAY_MST_RESPCODE = "0000";
                    	commandMap.put("ORD_MST_PAY_TYPE",455);                    	                    	
                    	
                    }else {
                    	// PG 연동
                        paymentInfo = this.paymentService.pgApproval(commandMap, request);
                        PAY_MST_RESPCODE = StringUtil.getString(paymentInfo.get("resultCode")) == "AR0000" ? "0000" : StringUtil.getString(paymentInfo.get("resultCode"));
                        commandMap.put("PAY_MST_AMOUNT", paymentInfo.get("LGD_AMOUNT"));
                        commandMap.put("PAY_MST_RESPCODE", paymentInfo.get("LGD_RESPCODE"));
                        commandMap.put("PAY_MST_RESPMSG", paymentInfo.get("LGD_RESMSG"));
                        commandMap.put("ORD_MST_PAY_PRC", paymentInfo.get("ORD_MST_PAY_PRC"));
                        commandMap.put("LGD_PAYTYPE",paymentInfo.get("LGD_PAYTYPE"));
                    }                                                                               
                                                        
                    // 2. PAY_MST INSERT
                    if((paymentType != Code.PAY_MILEAGE && paymentType != Code.PAY_CLEANKING) && paymentType == Code.PAY_KAKAOPAY){//0원 결제, 클린킹은 pay_master 등록 없음
                        //무통장/에스크로는 입금일을 00000000000000으로 처리한다.
                        /*if(paymentType == Code.PAY_DEPOSIT || paymentType == Code.PAY_ESCROW){
                            commandMap.put("PAY_MST_PAYDATE", "00000000000000");
                        }*/
                        this.paymentService.insertPayMaster(commandMap);
                    }

                    if("0000".equals(PAY_MST_RESPCODE)){//결제성공시
                    	
                        // 결제금액과 DB 금액 비교후 다른 경우 취소
                        int PAY_MST_AMOUNT = StringUtil.getInt(commandMap.get("PAY_MST_AMOUNT"));
                        int DB_PAYMENT_PRICE = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))); // DB 총 결제금액
                        commandMap.put("DB_PAYMENT_PRICE",DB_PAYMENT_PRICE);
                        
                        logger.info("PAY_MST_AMOUNT============"+PAY_MST_AMOUNT);
                        logger.info("DB_PAYMENT_PRICE============"+DB_PAYMENT_PRICE);
                        
                        if(PAY_MST_AMOUNT != DB_PAYMENT_PRICE){
                            throw new Exception("ERR_AMT_PAY");
                        }
                        
                        resultCode = PAY_MST_RESPCODE;
                        
                     // 결제대상금액 등 결제관련 정보 준비
                        int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
                        int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999) + CART_PAYMENT_DELIVERY; // 주문금액 + 총배송비
                        int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
                        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
                        int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
                        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트금액 (E포인트)
                        CART_PAYMENT_DC_POINT =CART_PAYMENT_DC_POINT+ useTpn+useSw; // 통합포인트 + 임직원포인트 + E포인트 사용 SUM                                                
                        
                        //CART_PAYMENT_DC_COUPON = CART_PAYMENT_DC_COUPON + totCpnDcAmt ;
                        System.out.println("CART_PAYMENT_DC_POINT============>"+CART_PAYMENT_DC_POINT);
                        
                        commandMap.put("CART_PAYMENT_DC_MILEAGE", CART_PAYMENT_DC_MILEAGE);
                        commandMap.put("CART_PAYMENT_DC_CASHBAG", CART_PAYMENT_DC_CASHBAG);
                        commandMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);
                        commandMap.put("CART_PAYMENT_DC_POINT", CART_PAYMENT_DC_POINT);

                        // 최종 결제금액
                        int CART_PAYMENT_TOTAL = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_MILEAGE - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON - CART_PAYMENT_DC_POINT;
                        
                        commandMap.put("ORD_MST_PAY_PRC", CART_PAYMENT_TOTAL);
                        
                        // 결제수단정의
                        getPayTypeCode(commandMap);
                        commandMap.put("ORD_MST_ORD_TYPE", "P");
                        
                        String ORD_MST_ORD_NM = (String) commandMap.get("ORD_MST_ORD_NM");
                    	if(ORD_MST_ORD_NM == null || ORD_MST_ORD_NM.length() == 0) {
                    		ORD_MST_ORD_NM = user.getMEM_MST_MEM_NM();
                    		commandMap.put("ORD_MST_ORD_NM",ORD_MST_ORD_NM);
                    	}
                    	
                    	//Strung hp = user.getMEM_MST_HP();
                    	
                    	//String ORD_MST_HP1 = StringUtil.getString(commandMap.get("ORD_MST_HP1"), "");
                    	
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
                        String payMstTid = StringUtil.getString(commandMap.get("LGD_TID"),"");
                        if(!"".equals(payMstTid)){
                            logger.error("####### [BEGIN] LGD_TID : "+ payMstTid +" 승인취소처리 #######");
                            
                            switch(paymentType){
                                case Code.PAY_CARD :
                                case Code.PAY_ACCOUNT :
                                case Code.PAY_DEPOSIT :
                                case Code.PAY_ESCROW :
                                case Code.PAY_FOREIGN_CARD : //해외카드
                                    //신용카드, 실시간계좌이체, 무통장입금은 kicc 처리
                                    this.payment.kiccDirectCancelPayment(request, commandMap);
                                    break;
                                case    Code.PAY_KAKAOPAY :
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
                        /*
                        if(ORD_TMP_DC_PIT > 0) { //2020.06.19 포인트 원복        
                        	
                        	Map<String, Object> pointInsertMap = new HashMap<String, Object>();
                        	pointInsertMap.put("PIT_MST_GBN", "P");     // 차감 코드 
                        	pointInsertMap.put("PIT_MST_BRK_DWN", StringUtil.getString("1878"));      // 사용 차감 코드
                        	pointInsertMap.put("PIT_MST_PIT", ORD_TMP_DC_PIT);
                            
                        	pointInsertMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
                        	pointInsertMap.put("PIT_MST_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                            
                        	pointInsertMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
                        	pointInsertMap.put("MEM_PIT_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                            
                        	pointInsertMap.put("MEM_PIT_MEM_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                            this.pcEventMainService.insertPoint(request, pointInsertMap);
                        }
                        */
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
                logger.error("####### [주문 불가 :"+ resultMessage +"] #######");
            }
            
            return_url = "/pc/cart/paymentSuccess.do";
            
            // 주문완료, 결제성공
            if("0000".equals(resultCode)){
                commandMap.put("ORD_MST_CD", ORD_MST_CD);
                               
                //2020.07.01 해당 ERP 위치변경
        		/*@TODO ERP 연계 */
                logger.debug("==================================================================");
                
                Map<String, Object> selectMap = new HashMap<String, Object>();
                
                selectMap.put("ORD_PRD_REG_ID",commandMap.get("MEM_MST_MEM_ID"));
                selectMap.put("ORD_ORD_MST_CD",ORD_MST_CD);
                List<Map<String ,Object>> erpInsertGatOrdData = orderErpApiService.selectGetOrdData(selectMap);
                
                if(erpInsertGatOrdData != null) {
                	
                	for(Map<String, Object> data : erpInsertGatOrdData) {
                		//commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));  //주문ID
                  	  	//commandMap.put("ORD_MST_CD", ORD_MST_CD);//주문번호
                  	 	commandMap.put("ORD_PRD_IDX", data.get("ORD_ORD_PRD_IDX"));        //주문상품번호
                  	    commandMap.put("ORD_PRD_ORD_STATE", data.get("ORD_PRD_ORD_STATE"));     //주문단계
                  	       
                  	   // commadMap.put("CPN_MEM_IDX","CPN_MEM_IDX");
                  	    
                  	    
                  	  Map<String,Object> resParam = orderErpApiService.orderErpApiTrans(request,commandMap);
                  	  logger.debug("resultCode=================================================================="+resParam.get("resultCode"));
                      logger.debug("resultOrderNo=================================================================="+resParam.get("resultOrderNo"));
                      logger.debug("resultOrderDetailNo=================================================================="+resParam.get("resultOrderDetailNo"));
                      logger.debug("resultOrderSeq=================================================================="+resParam.get("resultOrderSeq"));
                      logger.debug("resultText=================================================================="+resParam.get("resultText"));
                	}
                }                
                
                logger.debug("==================================================================");
              	logger.debug("주문API 결제완료 END");
                logger.debug("==================================================================");
                
                
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
					}else if(ORD_TMP_DC_PIT > 0) { //2020.06.19 E 포인트 원복        
                    	
                    	Map<String, Object> pointInsertMap = new HashMap<String, Object>();
                    	pointInsertMap.put("PIT_MST_GBN", "P");     // 차감 코드 
                    	pointInsertMap.put("PIT_MST_BRK_DWN", StringUtil.getString("1878"));      // 사용 차감 코드
                    	pointInsertMap.put("PIT_MST_PIT", ORD_TMP_DC_PIT);
                        
                    	pointInsertMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
                    	pointInsertMap.put("PIT_MST_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                        
                    	pointInsertMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
                    	pointInsertMap.put("MEM_PIT_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                        
                    	pointInsertMap.put("MEM_PIT_MEM_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                        this.pcEventMainService.insertPoint(request, pointInsertMap);
                    } else if(ORD_TMP_DC_PIT > 0) { //2020.07.01 사용한 쿠폰 원복코드 입력예정
                    	
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
                
                return_url = "/pc/cart/paymentFail.do";
                commandMap.put("resultCode", resultCode);
                commandMap.put("resultMessage", resultMessage);
            }
        }
       	mv.addObject("returnUrl",return_url);
        mv.addObject("messages",resultMessage);
        mv.addObject("commandMap",commandMap);
        mv.setViewName("pc/common/result");
        
        return mv;
    }

    
    /*
    @SuppressWarnings("unchecked")
    @FrontBannerSkip
    @RequestMapping(value = "/pc/cart/payment.do", method = RequestMethod.POST)
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
        
        String return_url = "";
        if(commandMap.containsKey("cartResult") && commandMap.get("cartResult").equals("Y")){//주문임시저장 테스트를 위한 내용 
            resultCode = "-1";
            resultMessage = "주문임시정보 테스트입니다.주문서 페이지로 이동하겠습니다.";
            return_url = "/pc/cart/cartpayment.do";
            commandMap.put("resultCode", resultCode);
            commandMap.put("resultMessage", resultMessage);
        }else{
            
            //주문 유효성 체크 값
            boolean isValidOrder = true;
            
            //캐쉬백 사용 체크 값
            boolean isCashbagUsed = false;
            
            String ORD_MST_CD = StringUtil.getString(commandMap.get("LGD_OID")); //주문번호
            commandMap.put("ORD_MST_CD", ORD_MST_CD);
            // -- 사용자정보 전달
            User user = SessionsUser.getSessionUser(request);
            commandMap.put("user", user);
    
            // -- 세션정보
            String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
            commandMap.put("session_id", session_id);
            
            // 주문상품 정보
            commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
            //
            // 재고 확인
            /*
            Map<String, Object> cartStock = this.cartService.selectTempOrderStock(commandMap);
            if((Integer)cartStock.get("result") < 0){
                resultCode = String.valueOf((Integer)cartStock.get("result"));
                resultMessage = (String)cartStock.get("resultMsg");
                isValidOrder = false;
            }
            
            //
                                   
            //2020.16.18 포인트 벨리데이션            
            //해당유져의 포인트 확인
            Map<String, Object> checkPointMap = new HashMap<String, Object>();
            checkPointMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());//주문자ID
            Map<String, Object> myEpointMap = pcMyPointService.selectMyEpoint(checkPointMap);
            Map<String , Object> myTotintMap = (Map<String, Object>) myEpointMap.get("myTotPoint");
            int useTpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_TPN")));
            int useEpn = Integer.parseInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_EPN")));       
            if(Integer.valueOf((String) myTotintMap.get("MemberPointCheckResult")) < useTpn &&  Integer.valueOf((String) myEpointMap.get("MEM_PIT_TOT_PIT")) < useEpn ) {
                logger.error("##################### 잘못된 포인트 사용입니다 ###########################");
                isValidOrder = false;
                resultMessage = "잘못된 포인트 사용 DB["+ Integer.valueOf((String) myTotintMap.get("MemberPointCheckResult"))+Integer.valueOf((String) myEpointMap.get("MEM_PIT_TOT_PIT")) +"] FRONT["+ useTpn+useEpn +"]";
            }
            
            //포인트 사용
            //int toUsePoint = StringUtil.getInt(commandMap.get("toUsePoint"));//사용 포인트
            int toUsePoint = useTpn + useEpn;//사용 포인트            
            int ORD_TMP_DC_PIT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT"));//DB 사용 포인트
            // 실제 사용 포인트와 화면단 사용 포인트 다른 경우 에러 처리
            if(toUsePoint != ORD_TMP_DC_PIT){
                logger.error("##################### 포인트 사용 포인트 불일치 ###########################");
                isValidOrder = false;
                resultMessage = "포인트 사용 포인트 상이 DB["+ ORD_TMP_DC_PIT +"] FRONT["+ toUsePoint +"]";
            }
            
            //포인트 사용
            if(isValidOrder && ORD_TMP_DC_PIT > 0){
            	//사용 포인트를 차감해준다.
                commandMap.put("PIT_MST_GBN", "M");     // 차감 코드 
                commandMap.put("PIT_MST_BRK_DWN", StringUtil.getString(Code.PRD_BUY_POINT_TYPE));      // 사용 차감 코드 
                commandMap.put("PIT_MST_PIT", ORD_TMP_DC_PIT);
                
                commandMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
                commandMap.put("PIT_MST_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                
                commandMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
                commandMap.put("MEM_PIT_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                
                commandMap.put("MEM_PIT_MEM_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                this.pcEventMainService.insertPoint(request, commandMap);
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
                    cashbagMap.put("EP_pnt_txtype", "20");//10 조회 20 사용 40 적립
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
                System.out.println("paymentType===============>"+paymentType);
                
                try{
                    String PAY_MST_RESPCODE = "";
                    commandMap.put("CST_PLATFORM", StringUtil.getString(commandMap.get("CST_PLATFORM")));
                    commandMap.put("CST_MID", StringUtil.getString(commandMap.get("CST_MID")));
                    commandMap.put("LGD_PAYKEY", StringUtil.getString(commandMap.get("LGD_PAYKEY")));
                    commandMap.put("LGD_CLOSEDATE", StringUtil.getString(commandMap.get("LGD_CLOSEDATE")));
                    // PG 연동
                    Map<String, Object> paymentInfo = this.paymentService.pgApproval(commandMap, request);
                    PAY_MST_RESPCODE = StringUtil.getString(paymentInfo.get("resultCode")) == "AR0000" ? "0000" : StringUtil.getString(paymentInfo.get("resultCode"));
                    commandMap.put("PAY_MST_AMOUNT", paymentInfo.get("LGD_AMOUNT"));
                    commandMap.put("PAY_MST_RESPCODE", paymentInfo.get("LGD_RESPCODE"));
                    commandMap.put("PAY_MST_RESPMSG", paymentInfo.get("LGD_RESMSG"));
                    commandMap.put("ORD_MST_PAY_PRC", paymentInfo.get("ORD_MST_PAY_PRC"));
                    commandMap.put("LGD_PAYTYPE",paymentInfo.get("LGD_PAYTYPE"));
                    
                    // 2. PAY_MST INSERT
                    if((paymentType != Code.PAY_MILEAGE && paymentType != Code.PAY_CLEANKING) && paymentType == Code.PAY_KAKAOPAY){//0원 결제, 클린킹은 pay_master 등록 없음
                        //무통장/에스크로는 입금일을 00000000000000으로 처리한다.
                        if(paymentType == Code.PAY_DEPOSIT || paymentType == Code.PAY_ESCROW){
                            commandMap.put("PAY_MST_PAYDATE", "00000000000000");
                        }
                        this.paymentService.insertPayMaster(commandMap);
                    }

                    if("0000".equals(PAY_MST_RESPCODE)){//결제성공시
                    	
                        // 결제금액과 DB 금액 비교후 다른 경우 취소
                        int PAY_MST_AMOUNT = StringUtil.getInt(commandMap.get("PAY_MST_AMOUNT"));
                        int DB_PAYMENT_PRICE = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))); // DB 총 결제금액
                        commandMap.put("DB_PAYMENT_PRICE",DB_PAYMENT_PRICE);
                        
                        logger.info("PAY_MST_AMOUNT============"+PAY_MST_AMOUNT);
                        logger.info("DB_PAYMENT_PRICE============"+DB_PAYMENT_PRICE);
                        
                        if(PAY_MST_AMOUNT != DB_PAYMENT_PRICE){
                            throw new Exception("ERR_AMT_PAY");
                        }
                        
                        resultCode = PAY_MST_RESPCODE;
                        
                     // 결제대상금액 등 결제관련 정보 준비
                        int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
                        int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999) + CART_PAYMENT_DELIVERY; // 주문금액 + 총배송비
                        int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
                        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
                        int CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
                        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트금액
                        
                        System.out.println("CART_PAYMENT_DC_POINT============>"+CART_PAYMENT_DC_POINT);
                        
                        commandMap.put("CART_PAYMENT_DC_MILEAGE", CART_PAYMENT_DC_MILEAGE);
                        commandMap.put("CART_PAYMENT_DC_CASHBAG", CART_PAYMENT_DC_CASHBAG);
                        commandMap.put("CART_PAYMENT_DC_COUPON", CART_PAYMENT_DC_COUPON);
                        commandMap.put("CART_PAYMENT_DC_POINT", CART_PAYMENT_DC_POINT);

                        // 최종 결제금액
                        int CART_PAYMENT_TOTAL = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_MILEAGE - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON - CART_PAYMENT_DC_POINT;
                        
                        commandMap.put("ORD_MST_PAY_PRC", CART_PAYMENT_TOTAL);
                        
                        // 결제수단정의
                        getPayTypeCode(commandMap);
                        commandMap.put("ORD_MST_ORD_TYPE", "P");
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
                        String payMstTid = StringUtil.getString(commandMap.get("LGD_TID"),"");
                        if(!"".equals(payMstTid)){
                            logger.error("####### [BEGIN] LGD_TID : "+ payMstTid +" 승인취소처리 #######");
                            
                            switch(paymentType){
                                case Code.PAY_CARD :
                                case Code.PAY_ACCOUNT :
                                case Code.PAY_DEPOSIT :
                                case Code.PAY_ESCROW :
                                case Code.PAY_FOREIGN_CARD : //해외카드
                                    //신용카드, 실시간계좌이체, 무통장입금은 kicc 처리
                                    this.payment.kiccDirectCancelPayment(request, commandMap);
                                    break;
                                case    Code.PAY_KAKAOPAY :
                                    //카카오페이
                                    this.payment.kakaoCancelPayment(request, commandMap);
                                    break;
                                case Code.PAY_PAYNOW :
                                    //페이나우(LG)
                                    this.payment.lgCancelPayment(request, commandMap);
                                    break;
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
                        
                        if(ORD_TMP_DC_PIT > 0) { //2020.06.19 포인트 원복        
                        	
                        	Map<String, Object> pointInsertMap = new HashMap<String, Object>();
                        	pointInsertMap.put("PIT_MST_GBN", "P");     // 차감 코드 
                        	pointInsertMap.put("PIT_MST_BRK_DWN", StringUtil.getString("1878"));      // 사용 차감 코드
                        	pointInsertMap.put("PIT_MST_PIT", ORD_TMP_DC_PIT);
                            
                        	pointInsertMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
                        	pointInsertMap.put("PIT_MST_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                            
                        	pointInsertMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
                        	pointInsertMap.put("MEM_PIT_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                            
                        	pointInsertMap.put("MEM_PIT_MEM_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
                            this.pcEventMainService.insertPoint(request, pointInsertMap);
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
                logger.error("####### [주문 불가 :"+ resultMessage +"] #######");
            }
            
            return_url = "/pc/cart/paymentSuccess.do";
            
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
						 * else if(ORD_TMP_DC_PIT > 0) { //2020.06.19 포인트 원복
						 * 
						 * Map<String, Object> pointInsertMap = new HashMap<String, Object>();
						 * pointInsertMap.put("PIT_MST_GBN", "P"); // 차감 코드
						 * pointInsertMap.put("PIT_MST_BRK_DWN", StringUtil.getString("1878")); // 사용 차감
						 * 코드 pointInsertMap.put("PIT_MST_PIT", ORD_TMP_DC_PIT);
						 * 
						 * pointInsertMap.put("PIT_MST_REG_IP", request.getRemoteAddr());
						 * pointInsertMap.put("PIT_MST_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
						 * 
						 * pointInsertMap.put("MEM_PIT_REG_IP", request.getRemoteAddr());
						 * pointInsertMap.put("MEM_PIT_REG_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
						 * 
						 * pointInsertMap.put("MEM_PIT_MEM_ID", cartlist.get(0).get("ORD_TMP_MEM_ID"));
						 * this.pcEventMainService.insertPoint(request, pointInsertMap); }
						 
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
                
                return_url = "/pc/cart/paymentFail.do";
                commandMap.put("resultCode", resultCode);
                commandMap.put("resultMessage", resultMessage);
            }
        }
       	mv.addObject("returnUrl",return_url);
        mv.addObject("messages",resultMessage);
        mv.addObject("commandMap",commandMap);
        mv.setViewName("pc/common/result");
        
        return mv;
    }

    */
    
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
    @RequestMapping(value = "/pc/cart/payment_kicc.do", method = RequestMethod.POST)
    public ModelAndView payment_kicc(HttpServletRequest request,
            @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> ordErrMap = new HashMap<String, Object>(); //결제오류시 DB 처리 위한 맵
        
        //리턴 코드/메시지
        String resultCode = "-1";
        String resultMessage = "";
        
        //주문 DB처리 결과 코드/메시지
        String orderDbResultcode = "";
        String orderDbResultmessage = "";
        
        String return_url = "";
        if(commandMap.get("cartResult").equals("Y")){//주문임시저장 테스트를 위한 내용 
            resultCode = "-1";
            resultMessage = "주문임시정보 테스트입니다.준문서 페이지로 이동하겠습니다.";
            return_url = "/pc/cart/cartpayment.do";
            commandMap.put("resultCode", resultCode);
            commandMap.put("resultMessage", resultMessage);
        }else{
            
            //주문 유효성 체크 값
            boolean isValidOrder = true;
            
            //캐쉬백 사용 체크 값
            boolean isCashbagUsed = false;
            
            String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD")); //주문번호
            
            // -- 사용자정보 전달
            User user = SessionsUser.getSessionUser(request);
            commandMap.put("user", user);
    
            // -- 세션정보
            String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
            commandMap.put("session_id", session_id);
            
            // 주문상품 정보
            commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
                    cashbagMap.put("EP_pnt_txtype", "20");//10 조회 20 사용 40 적립
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
                System.out.println("paymentType===============>"+paymentType);
                
                try{
                    switch(paymentType){
                        case Code.PAY_CARD :
                        case Code.PAY_FOREIGN_CARD : //해외카드
                            //신용카드 kicc 처리
                            this.payment.kiccCardPayment(request, commandMap);
                            break;
                        case Code.PAY_ACCOUNT :
                        case Code.PAY_DEPOSIT :
                        case Code.PAY_ESCROW :
                            //실시간계좌이체, 무통장입금, 에스크로는 kicc 처리
                            this.payment.kiccPayment(request, commandMap);
                            break;
                        case    Code.PAY_KAKAOPAY :
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
                            commandMap.put("PAY_MST_AMOUNT", StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))));
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
                        int DB_PAYMENT_PRICE = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")) - (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")) + StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB"))); // DB 총 결제금액
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
                        
                        /*@TODO ERP 연계 */
                        logger.debug("==================================================================");

                    	commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));  //주문ID
                    	commandMap.put("ORD_MST_CD", "2020062404316");//주문번호
                    	commandMap.put("ORD_PRD_IDX", 342005);        //주문상세번호
                    	commandMap.put("ORD_PRD_ORD_STATE", 407);     //주문단계
                    	Map<String,Object> resParam = orderErpApiService.orderErpApiTrans(request,commandMap);
                        logger.debug("resultCode=================================================================="+resParam.get("resultCode"));
                        logger.debug("resultOrderNo=================================================================="+resParam.get("resultOrderNo"));
                        logger.debug("resultOrderDetailNo=================================================================="+resParam.get("resultOrderDetailNo"));
                        logger.debug("resultOrderSeq=================================================================="+resParam.get("resultOrderSeq"));
                        logger.debug("resultText=================================================================="+resParam.get("resultText"));
                       
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
                                case    Code.PAY_KAKAOPAY :
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
                logger.error("####### [주문 불가 :"+ resultMessage +"] #######");
            }
            
            return_url = "/pc/cart/paymentSuccess.do";
            
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
                
                return_url = "/pc/cart/paymentFail.do";
                commandMap.put("resultCode", resultCode);
                commandMap.put("resultMessage", resultMessage);
            }
        }
        
        mv.addObject("returnUrl",return_url);
        mv.addObject("messages",resultMessage);
        mv.addObject("commandMap",commandMap);
        mv.setViewName("pc/common/result");
        
        return mv;
    }

    /**
    * <pre>
    * 1. MethodName : pointDiscountAjax
    * 2. ClassName  : CartController.java
    * 3. Comment    : 포인트 사용시 금액 계산
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 6. 5.
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
    @RequestMapping("/pc/cart/pointDiscountAjax")
    public JSON pointDiscountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        String allPointUseYn = "N";//모두 사용 여부
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
                
        // 주문상품 리스트
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
        this.cartService.selectTempOrderProductList(commandMap);
        List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
        
        // 결제대상금액 등 결제관련 정보 준비
        int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
        int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
        int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
        
        //1. 사용할 포인트
        int toUsePoint = StringUtil.getInt(commandMap.get("toUsePoint"));
        
        if(toUsePoint > 0){
            commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
            
            //2. 최소사용가능 포인트
            int usableMinimumPoint = this.propertiesService.getInt("usable.minimum.point");//10000원 이상부터 사용 가능

            //회원 사용가능 포인트
            commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
            Map<String, Object> pointSumMap = this.pointService.selectMemberPointSum(commandMap);

            int SOLUBLE_POINT = StringUtil.getInt(pointSumMap.get("CUR_POINT"), 0);
            
            // 사용 포인트가 사용가능 포인트와 동일한 경우
            if(toUsePoint == SOLUBLE_POINT){
                allPointUseYn = "Y";
            }
            
            // 사용 포인트가 사용가능 포인트보다 큰경우
            if(toUsePoint > SOLUBLE_POINT){
               isSuccessYn = "N";
               toUsePoint = 0;
               json.addObject("resultMsg","포인트가 부족합니다.");
            }
            
            // 사용 포인트가 최소 사용가능 포인트보다 작은 경우
            if(("Y").equals(isSuccessYn) && toUsePoint < usableMinimumPoint){
                isSuccessYn = "N";
                toUsePoint = 0;
                json.addObject("resultMsg","포인트는 "+ String.format("%,d", usableMinimumPoint) +"P 이상부터 사용 가능합니다");
            }
            
            // 총 주문금액 - 쿠폰할인 - 캐쉬백할인이 최소사용가능 포인트보다 큰지 비교
            if(("Y").equals(isSuccessYn) && usableMinimumPoint > CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_CASHBAG){
                isSuccessYn = "N";
                toUsePoint = 0;
                json.addObject("resultMsg","마일리지는 "+ String.format("%,d", usableMinimumPoint) +"M 이상부터 사용 가능합니다");
            }
            
            // 사용할 포인트가 판매가-쿠폰할인-캐쉬백할인 보다 큰 경우 (배송비 제외) 사용가능 포인트 = 판매가-쿠폰할인-캐쉬백할인
            if(("Y").equals(isSuccessYn) && toUsePoint > CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_CASHBAG){
                toUsePoint = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_CASHBAG;
            }
        }
        
        // [BEGIN] 포인트정보 적용
        int cart_add_disc_prc = toUsePoint + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
        
        int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
        
        commandMap.put("ORD_TMP_DC_PIT", toUsePoint);
        this.cartService.updateTempCartAmt(commandMap);

        //화면에 뿌려줄 데이터
        json.addObject("isSuccessYn", isSuccessYn);
        json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
        json.addObject("toUsePoint", toUsePoint);//총 포인트 사용
        json.addObject("cart_total", cart_total);//최종결제금액
        json.addObject("allPointUseYn", allPointUseYn);//모두사용 여부
        
        // 적립예정 포인트/캐쉬백 계산 필요
        // 최종결제금액-배송비+배송비무료쿠폰-추가배송비
        Map<String,Object> map_save = new HashMap<String,Object>();
        int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
        
        map_save.put("ORD_PRC", cartOrdPrc);
        map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        map_save.put("TYPE", "M"); //포인트
        int savePit = this.cartService.selectReservePrice(map_save);
        
        map_save.put("TYPE", "C"); //캐쉬백
        int saveCashbag = this.cartService.selectReservePrice(map_save);
        
        json.addObject("savePit", savePit);
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
    * 5. 작성일       : 2015. 6. 25.
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
    @RequestMapping(value="/pc/cart/cashbagDiscountAjax", method = RequestMethod.POST)
    public JSON cashbagDiscountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
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
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        commandMap.put("CART_PC_MOBILE_GUBUN", CART_PC_MOBILE_GUBUN);
        this.cartService.selectTempOrderProductList(commandMap);
        List<Map<String,Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
        
        // 결제대상금액 등 결제관련 정보 준비
        int CART_PAYMENT_DELIVERY = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")) + StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
        int CART_PAYMENT_AMOUNT = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"), 9999999); // 주문금액(배송비 제외)
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 마일리지
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
            if(toUseCashbag > CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_POINT){
                toUseCashbag = CART_PAYMENT_AMOUNT - CART_PAYMENT_DC_PRD_COUPON - CART_PAYMENT_DC_POINT;
            }
        }
        
        logger.debug("CART_PAYMENT_AMOUNT========"+CART_PAYMENT_AMOUNT);
        
        // [BEGIN] 포인트정보 적용
        int cart_add_disc_prc = CART_PAYMENT_DC_POINT + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + toUseCashbag;// 총 추가할인
        int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
        
        commandMap.put("ORD_TMP_DC_OCB", toUseCashbag);
        this.cartService.updateTempCartAmt(commandMap);

        //화면에 뿌려줄 데이터
        json.addObject("isSuccessYn", isSuccessYn);
        json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
        json.addObject("toUseCashbag", toUseCashbag);//총 포인트 사용
        json.addObject("cart_total", cart_total);//최종결제금액
        json.addObject("allCashbagUseYn", allCashbagUseYn);//모두사용 여부
        
        //  적립예정 포인트/캐쉬백 계산 필요
        // 최종결제금액-배송비+배송비무료쿠폰-추가배송비
        Map<String,Object> map_save = new HashMap<String,Object>();
        int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
       
        map_save.put("ORD_PRC", cartOrdPrc);
        map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        map_save.put("TYPE", "M"); //포인트
        int savePit = this.cartService.selectReservePrice(map_save);
        
        map_save.put("TYPE", "C"); //캐쉬백
        int saveCashbag = this.cartService.selectReservePrice(map_save);
        
        json.addObject("savePit", savePit);
        json.addObject("saveCashbag", saveCashbag);
        
        // RETURN OBJECT
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : paymentSuccess
    * 2. ClassName  : CartController.java
    * 3. Comment    : 주문완료 화면
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 29.
    * </pre>
    *
    * @param request
    * @param ORD_MST_CD : 주문번호
    * @return
    * @throws Exception
    */
    
    /**
     * @api {POST} /pc/cart/paymentSuccess.do
     * @apiVersion 0.1.0
     * @apiName 결제신청
     * @apiGroup 장바구니
     *
     * @apiParam {String} ORD_MST_CD 주문번호

     * @apiSuccess {Object} orderProductList  주문 상품리스트
     * @apiSuccess {Object} requestedGiftList 선택 사은품 정보
     * @apiSuccess {Object} orderPayInfo  할인 및 결제정보 
     * @apiSuccess {Object} orderDeliveryInfo  주문배송정보
     * @apiSuccess {Object} orderState 주문상태
     */
    @RequestMapping(value = "/pc/cart/paymentSuccess.do")
    public ModelAndView paymentSuccess(HttpServletRequest request,  @RequestParams Map<String, Object> commandMap) throws Exception {
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
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_MIDDLE);
        List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService.selectRequestedGiftList(commandMap);
        
        // 배송정보
        Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);
        
        // 할인/결제정보
        Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);
        
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
        
        //-- 사용자정보
        commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
        User user = SessionsUser.getSessionUser(request);
        
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
            }
        }
        String auth = StringUtil.getString( getAuthDataForReceipt(orderPayInfo));
        commandMap.put("auth", auth);
        mv.addObject("orderProductList", orderProductList);
        mv.addObject("orderState", orderState);
        mv.addObject("orderDeliveryInfo", orderDeliveryInfo);
        mv.addObject("orderPayInfo", orderPayInfo);
        mv.addObject("requestedGiftList", requestedGiftList);
        
        mv.addObject("commandMap", commandMap);
        
        mv.setViewName("pc/cart/paymentSuccess");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : paymentFail
    * 2. ClassName  : CartController.java
    * 3. Comment    : 주문실패 화면
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 7. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/pc/cart/paymentFail.do")
    public ModelAndView paymentFail(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        //commandMap = (Map<String,Object>)request.getSession().getAttribute("_ORDER_INFO_MAP_");
        
        mv.addObject("commandMap", commandMap);
        
        //-- 사용자정보
        commandMap.put("sessionUser", SessionsUser.getSessionUser(request));
        
        mv.setViewName("pc/cart/paymentFail");
        
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
    @RequestMapping(value = "/pc/cart/getTxnId.do", method = RequestMethod.POST)
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
    * 5. 작성일       : 2015. 11. 13.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/addDlvChargeAjax.do")
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
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
        int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
        
        int cart_add_disc_prc = CART_PAYMENT_DC_POINT + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
        int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
        
        Map<String,Object> map_save = new HashMap<String,Object>();
        int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
        
        map_save.put("ORD_PRC", cartOrdPrc);
        map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        map_save.put("TYPE", "M"); //포인트
        int savePit = this.cartService.selectReservePrice(map_save);
        
        map_save.put("TYPE", "C"); //캐쉬백
        int saveCashbag = this.cartService.selectReservePrice(map_save);
        
        json.addObject("savePit", savePit);
        json.addObject("saveCashbag", saveCashbag);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectGetItNowShopTimeAjax
    * 2. ClassName  : CartController.java
    * 3. Comment    : 겟잇나우 선택 매장 방문가능 시간 가져오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/selectGetItNowShopTimeAjax.do")
    public JSON selectGetItNowShopTimeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        
        this.cartService.selectGetItNowShopTimeInfo(commandMap);
        json.addAllObjects(commandMap);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : v3d_req
    * 2. ClassName  : CartController.java
    * 3. Comment    : KICC 안심클릭 요청 페이지
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 11. 30.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value="/pc/cart/v3d_req")
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
    * 5. 작성일       : 2015. 11. 30.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value="/pc/cart/v3d_res")
    public ModelAndView v3d_res (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap" ,commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : kiccNotice
    * 2. ClassName  : CartController.java
    * 3. Comment    : KICC 공통통보 페이지
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping(value = "/pc/cart/kiccNotice.do")
    public ModelAndView kiccNotice(HttpServletRequest request,  @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String resultMSG = "";
        
        final char DELI_US = 0x1f;
        final String RESULT_SUCCESS = "0000";
        final String RESULT_FAIL    = "5001";
        
        resultMap = this.payment.kiccNotice(request, commandMap);
        
        String resultcode = StringUtil.getString(resultMap.get("resultcode"));
        String resultmessage = StringUtil.getString(resultMap.get("resultmessage"));
        
        if("00".equals(resultcode)){
            resultMSG = "res_cd=" + RESULT_SUCCESS + DELI_US + "res_msg=SUCCESS";
        }else{
            logger.debug("공통 통보 페이지 실패 resultcode : "+ resultcode +" resultmessage : "+ resultmessage);
            resultMSG = "res_cd=" + RESULT_FAIL + DELI_US + "res_msg=FAIL";
        }
        
        mv.addObject("resultMSG", resultMSG);
        
        mv.setViewName("pc/cart/kiccNotice");
        
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
    @RequestMapping(value = "/pc/cart/deleteSoldOutCartAjax.do", method = RequestMethod.POST)
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
    @RequestMapping(value = "/pc/cart/getCardInstallmentListAjax.do")
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
    @RequestMapping("/pc/cart/insertInterestProductAjax")
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
    @RequestMapping(value = "/pc/cart/deliveryModifyPopup")
    public ModelAndView deliveryModifyPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        //본인 주문인지 체크
        if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
            commandMap.put("SESSION_MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));//주문자ID
        }else{//비회원 구매인 경우
            commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
            commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
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
            
            // 배송 메세지
            mv.addObject("dlvMsgList", this.pcCommonService.selectCode("DLV_MESSAGE_CD"));
            
            // 핸드폰 앞자리
            mv.addObject("hpCodeList", this.pcCommonService.selectCode("HP_CODE"));
            
            // 전화번호 국번
            mv.addObject("telCodeList", this.pcCommonService.selectCode("TEL_CODE"));
                    
            // 배송정보
            Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);
            mv.addObject("orderDeliveryInfo", orderDeliveryInfo);
            
            mv.addObject("commandMap", commandMap);
        }else{
            mv.setViewName("pc/common/result");
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
    @RequestMapping(value = "/pc/cart/orderDeliveryModifyProcAjax.do")
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
            commandMap.put("SESSION_ORD_MST_ORD_NM", SessionsUser.getSessionUserValue("ORD_MST_ORD_NM"));//주문자명
            commandMap.put("ORD_MST_CD", SessionsUser.getSessionUserValue("ORD_MST_CD"));//주문번호
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
                            resultMsg = "제주도는 추가배송비 5,000원이 발생되므로\n배송지 수정이 불가능합니다.\n배송지 수정문의는 고객센터로 문의해 주시기 바랍니다.";
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
    @RequestMapping(value = "/pc/cart/checkCashBagPointAjax.do")
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
    @RequestMapping(value = "/pc/cart/prdCpnDiscountAjax.do")
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
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        //int CART_PAYMENT_DC_COUPON = totCouponDcAmt; // 총 사용 쿠폰금액
        
        int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
        int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
        
        logger.debug("CART_PAYMENT_AMOUNT========"+CART_PAYMENT_AMOUNT);
        
        // [BEGIN] 포인트정보 적용
        int cart_add_disc_prc = CART_PAYMENT_DC_POINT + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
        int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
        
        //화면에 뿌려줄 데이터
        json.addObject("isSuccessYn", isSuccessYn);
        json.addObject("prd_cpn_tot_dc_amt_real", prd_cpn_tot_dc_amt_real);//총 상품쿠폰 할인 금액
        json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
        json.addObject("cart_total", cart_total);//최종결제금액
        
        //  적립예정 포인트/캐쉬백 계산 필요
        // 최종결제금액-배송비+배송비무료쿠폰-추가배송비
        Map<String,Object> map_save = new HashMap<String,Object>();
        int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
        map_save.put("ORD_PRC", cartOrdPrc);
        map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        map_save.put("TYPE", "M"); //마일리지
        int savePit = this.cartService.selectReservePrice(map_save);
        
        map_save.put("TYPE", "C"); //캐쉬백
        int saveCashbag = this.cartService.selectReservePrice(map_save);
        
        json.addObject("savePit", savePit);
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
    @RequestMapping(value = "/pc/cart/dlvCpnDiscountAjax.do")
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
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
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
        int CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 마일리지
        int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
        
        //int CART_PAYMENT_DC_COUPON = totCouponDcAmt; // 총 사용 쿠폰금액
        
        int CART_PAYMENT_DC_PRD_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_PRD_DC_CPN")); // 총 사용 쿠폰금액
        int CART_PAYMENT_DC_DLV_COUPON = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 총 배송비 쿠폰금액
        
        logger.debug("CART_PAYMENT_AMOUNT========"+CART_PAYMENT_AMOUNT);
        
        // [BEGIN] 포인트정보 적용
        int cart_add_disc_prc = CART_PAYMENT_DC_POINT + CART_PAYMENT_DC_PRD_COUPON + CART_PAYMENT_DC_DLV_COUPON + CART_PAYMENT_DC_CASHBAG;// 총 추가할인
        int cart_total = CART_PAYMENT_AMOUNT + CART_PAYMENT_DELIVERY - cart_add_disc_prc;// 최종결제금액
        
        //화면에 뿌려줄 데이터
        json.addObject("isSuccessYn", isSuccessYn);
        json.addObject("dlv_cpn_tot_dc_amt_real", dlv_cpn_tot_dc_amt_real);//총 상품쿠폰 할인 금액
        json.addObject("cart_add_disc_prc", cart_add_disc_prc);// 총 추가할인
        json.addObject("cart_total", cart_total);//최종결제금액
        
        //  적립예정 포인트/캐쉬백 계산 필요
        // 최종결제금액-배송비+배송비무료쿠폰-추가배송비
        Map<String,Object> map_save = new HashMap<String,Object>();
        int cartOrdPrc = cart_total - CART_PAYMENT_DELIVERY + CART_PAYMENT_DC_DLV_COUPON;
        
        map_save.put("ORD_PRC", cartOrdPrc);
        map_save.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        map_save.put("TYPE", "M"); //포인트
        int savePit = this.cartService.selectReservePrice(map_save);
        
        map_save.put("TYPE", "C"); //캐쉬백
        int saveCashbag = this.cartService.selectReservePrice(map_save);
        
        json.addObject("savePit", savePit);
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
    @RequestMapping(value = "/pc/cart/getItNowTicketPopup.do")
    public ModelAndView getItNowTicketPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
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
            mv.setViewName("pc/common/result");
            mv.addObject("closeMsg", "존재하지 않는 주문입니다.");
        }
        
        return mv;
    }
    private String getAuthDataForReceipt(Map<String,Object> paymentInfo) throws NoSuchAlgorithmException {
    	String LGD_MERTKEY = propertiesService.getString("payment.lg.xpay.LGD_MERTKEY");
    	if(paymentInfo!=null && (!paymentInfo.containsKey("PAY_MST_MID") || !paymentInfo.containsKey("PAY_MST_TID"))) {return "";}
    	StringBuffer authStringBuffer = new StringBuffer();
        authStringBuffer.append(paymentInfo.get("PAY_MST_MID"));
        authStringBuffer.append(paymentInfo.get("PAY_MST_TID"));
        authStringBuffer.append(LGD_MERTKEY);
        byte[] tmp = authStringBuffer.toString().getBytes();
        MessageDigest md2 = MessageDigest.getInstance("MD5");
        byte[] digest2 = md2.digest(tmp);
        StringBuffer stringBuffer = new StringBuffer();
        for (int i=0 ; i < digest2.length ; i++) {
            int c = digest2[i] & 0xff;
            if (c <= 15){
                stringBuffer.append("0");
            }
            stringBuffer.append(Integer.toHexString(c));
        }
		return stringBuffer.toString();
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
    @RequestMapping(value = "/pc/cart/getItNowTicketPreviewPopup.do")
    public ModelAndView getItNowTicketPreviewPopup(HttpServletRequest request,  @RequestParams Map<String, Object> commandMap) throws Exception {
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
    @RequestMapping(value = "/pc/cart/sendGetItNowTicketAjax.do", method = RequestMethod.POST)
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
    @RequestMapping(value = "/pc/cart/getItNowShopInfoPopup.do")
    public ModelAndView getItNowShopInfoPopup(HttpServletRequest request,   @RequestParams Map<String, Object> commandMap) throws Exception {
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
    @RequestMapping(value = "/pc/cart/getCardListAjax.do", method = RequestMethod.POST)
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
    
    private void getPayTypeCode(Map<String,Object> commandMap){
    	/*
    	 * 신용카드	SC0010
			계좌이체	SC0030
			무통장	SC0040
			휴대폰	SC0060
			유선전화결제	SC0070
			OK캐쉬백	SC0090
			문화상품권	SC0111
			게임문화상품권	SC0112
			도서문화상품권	SC0113
			모바일T머니	SC0220
    	 */
    	String payTypeByPgModule = StringUtil.getString(commandMap.get("LGD_PAYTYPE"),"");
    	commandMap.put("ORD_MST_ORD_NM", StringUtil.getString(commandMap.get("LGD_BUYER"),""));
    	if("SC0010".equals(payTypeByPgModule)) {
    		commandMap.put("ORD_MST_PAY_TYPE", Code.PAY_CARD);
    	}
    	else if("SC0030".equals(payTypeByPgModule)) {
    		commandMap.put("ORD_MST_CSH_RCP", StringUtil.getString(commandMap.get("LGD_CASHRECEIPTKIND"),""));
    		commandMap.put("ORD_MST_PAY_TYPE", Code.PAY_ACCOUNT);
    	}
		else if("SC0040".equals(payTypeByPgModule)) {
			commandMap.put("ORD_MST_CSH_RCP", StringUtil.getString(commandMap.get("LGD_PAYER"),""));
			commandMap.put("ORD_MST_CSH_RCP", StringUtil.getString(commandMap.get("LGD_CASHRECEIPTKIND"),""));
			commandMap.put("ORD_MST_PAY_TYPE", Code.PAY_DEPOSIT);
    	}
		else if("SC0060".equals(payTypeByPgModule)) {
			commandMap.put("ORD_MST_PAY_TYPE", Code.PAY_HP);
		}
    }
    
    
    //2020.06.17 할인정보 추가
    /**
     * 프론트 -> 주문서 -> 통합포인트 사용가능 체크
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/pc/cart/tpnPointProcAjax.do")
    public JSON tpnPointProcAjax(HttpServletRequest request, @RequestParam Map<String, Object> commandMap) throws Exception {
    	JSON json = new JSON();    
        
        if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
        	int top = pcMyPointService.selectMyTotPoint(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        	json.addObject(top);        	                     
        }
        
    	return json;
    }
    
    /**
     * 
     * 2020.06.24 
     * 프론트 -> 주문서 -> E포인트 조회 후 비교
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/pc/cart/epnPointProcAjax.do")
    public JSON epnPointProcAjax(HttpServletRequest request)throws Exception {
    	JSON json = new JSON();
    	  	
    	if(SessionsUser.getSessionUserRole(request) == ROLEUSER.user){
    		Map<String, Object> commandMap = new HashMap<String, Object>();
        	commandMap.put("MEM_MST_MEM_ID",StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"), "0"));
        	int epn = pcMyPointService.selectAjaxEpoint(commandMap);    	
        	json.addObject(epn);
    	}    	
    	return json;
    }
    
    /**
     * 프론트 - 주문서 -  해당 회원정보 조회
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/pc/cart/selectUserInfo.do" , method = RequestMethod.POST)
    public JSON selectUserInfo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap) throws Exception {
    	JSON json = new JSON();
    	
    	String sessionId = SessionsUser.getSessionUserValue("MEM_MST_MEM_ID");
    	String userId = (String) commandMap.get("MEM_MST_MEM_ID");    	
    	if(sessionId.equals(userId)) {
    		Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
    		if(userInfo != null) {
    			json.addObject("userInfo",userInfo);
    		}
    	}    
    	return json;
    }
    
    
}
