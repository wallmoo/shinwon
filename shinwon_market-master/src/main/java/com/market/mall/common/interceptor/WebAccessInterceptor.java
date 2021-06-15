package com.market.mall.common.interceptor;

import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.UtilInterceptor;
import com.epasscni.common.exception.AccessException;
import com.epasscni.common.exception.AccessMypageDeniedException;
import com.epasscni.common.exception.AmAuthenticationException;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.AesCrypto;
import com.epasscni.util.DateUtil;
import com.epasscni.util.MobileUrlConvertor;
import com.epasscni.util.RequestUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.util.UrlTypeUtil;
import com.market.mall.am.logo.service.LogoService;
import com.market.mall.am.manager.service.LoginManagerService;
import com.market.mall.am.site.service.PopularSearchWordService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsBusiness;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.NoticeBoardService;
import com.market.mall.pc.event.service.PlanService;
import com.market.mall.pc.mypage.service.MyKeepService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyRegularStoreService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.theme.category.service.WeddingService;
import com.market.util.CategoryUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

public class WebAccessInterceptor implements HandlerInterceptor{
    @Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    @Resource(name="loginManagerService") LoginManagerService loginManagerService;
    @Resource(name="productListService") private ProductListService productListService;
    @Resource(name="cartService") private CartService cartService;
    @Resource(name="pcCommonService") private CommonService pcCommonService;
    @Resource(name="pcPlanService") private PlanService pcPlanService;
    @Resource(name="pcMyRegularStoreService") private MyRegularStoreService pcMyRegularStoreService;
    @Resource(name="pcNoticeBoardService") private NoticeBoardService pcNoticeBoardService;
    @Resource(name="pcMyKeepService") private MyKeepService pcMyKeepService;
    @Resource(name="pcLoginManagerService") private com.market.mall.pc.manager.service.LoginManagerService pcLoginManagerService;
    @Resource(name="pcMyPageService") private MyPageService pcMyPageService;
    @Resource(name="pcWeddingService") private WeddingService pcWeddingService;
    @Resource(name="logoService") private LogoService logoService;
    
    @Resource(name="popularSearchWordService") private PopularSearchWordService popularSearchWordService;//
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        String requestUri = request.getRequestURI().toString();
        String requestURL = request.getRequestURL().toString();
        Class<?> thisClass = handler.getClass();
        Method thisMethod = UtilInterceptor.getMethod(thisClass, requestUri);
        
        RequestUtil.setCurrentRequest(request);
        
        /******************************************************************************* PC/MOBILE */
        if(requestUri.indexOf("/am/") < 0){
            /* 사용자 세션 쿠키 생성 */
            this.createUserCookie(request, response);
            
            /* 권한 체크 */
            this.frontAuthorityCheck(request, response, requestUri, thisClass, thisMethod);

            if(requestUri.indexOf("/mobile/") >= 0){
            /** MOBILE */
                /* SNS 회원 MyPage 접근 체크 */
                this.accessMyPageSNSCheck(request, requestUri, "mobile");
                
                /* 전시배너 영역 가져오기 */
                this.mobileBannerDisplaySetting(request, response, requestUri, thisClass, thisMethod);

                /* 로고 */
                request.setAttribute("logoUrl", this.selectlogoUrl(request, Code.LOGO_TYPE_MOBILE));
                
                /*인기검색어 */
                request.setAttribute("popSearchWord", this.popularSearchWordService.selectPcPopSearcWordList(request));
            }else{
            /** PC */
                /* SNS 회원 MyPage 접근 체크 */
                this.accessMyPageSNSCheck(request, requestUri, "pc");
                
                /* 전시배너 영역 가져오기 */
                this.pcBannerDisplaySetting(request, response, requestUri, thisClass, thisMethod);

                /* 로고 */
                request.setAttribute("logoUrl", this.selectlogoUrl(request, Code.LOGO_TYPE_WEB));
                
                /*인기검색어 */
                request.setAttribute("popSearchWord", this.popularSearchWordService.selectPcPopSearcWordList(request));
            }
        }else{ 
        /******************************************************************************* ADMIN */
            /* 권한 체크 */
            String isMobileChk = "N";
            if(!MobileUrlConvertor.isMobile(request)){ // 모바일이면 권한체크 안함
                isMobileChk = "N";
            }else{
                isMobileChk = "Y";
            }
            
            this.adminAuthorityCheck(request, response, requestUri, thisClass, thisMethod);
            request.setAttribute("isMobileChk", isMobileChk);
            
            /* 로고 */
            request.setAttribute("logoUrl", this.selectlogoUrl(request, Code.LOGO_TYPE_ADMIN));
        }
        
        String protocol = propertiesService.getString("cdn.protocol");
        request.setAttribute("protocol", protocol);
        
        String ssl = request.isSecure()?"ssl.":"";
        String serverDomain = "";
        String serverSslDomain = "";
        
        if(requestURL.toLowerCase().indexOf("scm")>= 0){
            serverDomain = propertiesService.getString("scm.domain");
            serverSslDomain = propertiesService.getString("scm.ssl.domain");
        }else if(requestUri.indexOf("/pc/") >= 0){
            serverDomain = propertiesService.getString("front.domain");
            serverSslDomain = propertiesService.getString("front.ssl.domain");
        }else if(requestUri.indexOf("/mobile/") >= 0){
            serverDomain = propertiesService.getString("mobile.domain");
            serverSslDomain = propertiesService.getString("mobile.ssl.domain");
        }else{
            serverDomain = propertiesService.getString("server.domain");
            serverSslDomain = propertiesService.getString("server.ssl.domain");
        }
        
        String mobileSslDomain = propertiesService.getString("mobile.ssl.domain");
        request.setAttribute("mobileSslDomain", mobileSslDomain);
      
        String frontDomain = propertiesService.getString("front.domain");
        request.setAttribute("frontDomain", frontDomain);
        
        String mobileDomain = propertiesService.getString("mobile.domain");
        request.setAttribute("mobileDomain", mobileDomain);
        
        request.setAttribute("serverDomain", serverDomain);
        request.setAttribute("serverSslDomain", serverSslDomain);
        request.setAttribute("cdnDomain", protocol+propertiesService.getString("cdn."+ ssl +"domain"));
        request.setAttribute("img_domain", protocol+propertiesService.getString("cdn.domain"));
        request.setAttribute("requestUrl", request.getRequestURI());
        request.setAttribute("locationProtocol", request.getScheme());
        
        //multiPartRequest로 넘어온 파라미터를 request.getParameter 로 가능하게 하도록 설정
        if (request instanceof MultipartHttpServletRequest) {
            RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
        }
        
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws AmAuthenticationException{
        //today
        request.setAttribute("today", new SimpleDateFormat("yyyy.MM.dd",Locale.KOREA).format(new Date()));
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
        //empty
    }
    
    // PC/MOBILE 사용자 쿠키 생성
    public void createUserCookie(HttpServletRequest request, HttpServletResponse response) throws Exception{
        // session정보 유무에 따른 setting
        Map<String, Object> userMap = SessionsUser.getSessionUserMap(request);
        
        // 현재 시간 
        String todayTime = StringUtil.getString(DateUtil.getToday() +DateUtil.getTime().substring(0,4),"0");
        
        if(userMap != null){
            String strUserInfo = "";
            
            // 쿠키 삭제
            Cookie del_cookie = new Cookie("front_user_cookie", "");
            del_cookie.setMaxAge(0); 
            del_cookie.setPath("/");
            response.addCookie(del_cookie);
            
            // session 값을 받아와서 cookie 생성 
            @SuppressWarnings("rawtypes")
            Iterator sessionKeys = userMap.keySet().iterator();
            while(sessionKeys.hasNext()){
                String cookieName = (String)sessionKeys.next();
                strUserInfo = strUserInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(userMap.get(cookieName))) + "#";
            }
            
            strUserInfo = strUserInfo+"LAST_TIME="+AesCrypto.encrypt(todayTime);
        
            //login 정보를 cookie 저장 
            Cookie front_user_cookie = new Cookie("front_user_cookie", strUserInfo);
            front_user_cookie.setPath("/");
            response.addCookie(front_user_cookie);
            
        }else{
            Cookie[] cookies = request.getCookies(); 
            String strUserInfo = "";
            boolean isSessionCookieExist = false;
            boolean isJoinCodeCookieExist =false;
            
            if(cookies != null){
                for(Cookie cookie : cookies){
                    if("front_user_cookie".equals(cookie.getName())){
                        strUserInfo = cookie.getValue();
                        logger.debug("###############################################################");
                        logger.debug("############               쿠키값 확인중 ...          #########");
                        logger.debug("######### front_user_cookie = "+strUserInfo);
                        logger.debug("###############################################################");

                        if(strUserInfo != null){
                            Map<String, Object> tempMap = new HashMap<String, Object>();
                            String[] userItem = strUserInfo.split("#");
                            
                            // 쿠키가 생성된 시간을 비교해서 삭제 합시다.
                            String lastDt = StringUtil.getString(AesCrypto.decrypt(userItem[userItem.length-1].split("=")[1]),"0");
                            int passTime = Math.round(Long.parseLong(todayTime) - Long.parseLong(lastDt));                                  
                            logger.debug("######### setting ##  passTime "+passTime);
                            
                            // 30분이 넘으면 쿠키 삭제
                            if(passTime > 29 ){
                                Cookie del_cookie = new Cookie("front_user_cookie", "");
                                del_cookie.setMaxAge(0); 
                                del_cookie.setPath("/");
                                response.addCookie(del_cookie);
                            }else{
                                for(int i = 0 ; i < userItem.length-1 ; i++){
                                    tempMap.put(userItem[i].split("=")[0], AesCrypto.decrypt(userItem[i].split("=")[1]));
                                }
                                
                                SessionsUser.setSessionUser(request, tempMap);
                                request.setAttribute("sessionUser", SessionsUser.getSessionUser(request));
                            } 
                        }
                    }else if("session_cookie".equals(cookie.getName())){ //장바구니 비회원용 세션 아이디
                        isSessionCookieExist = true;

                        String session_cookie = AesCrypto.decrypt(cookie.getValue());
                        request.getSession().setAttribute("seesion_cookie_id", session_cookie);
                    }else if("join_code_cookie".equals(cookie.getName())){ //회원가입 채널 저장을 위한 joinCode
                        isJoinCodeCookieExist = true;

                        String join_code_cookie_str = "";
                        String param_join_code = StringUtil.getString(request.getParameter("joinCode"));

                        if(!"".equals(param_join_code)){
                            join_code_cookie_str = param_join_code;
                        }else{
                            // 파라미터가 없는 경우 
                            // 진짜 없는 경우
                            // 날라간 경우
                            join_code_cookie_str = cookie.getValue();
                        }
                        
                        request.getSession().setAttribute("join_code_cookie", join_code_cookie_str);

                        if(!"".equals(join_code_cookie_str)){
                            logger.info("join_code_cookie set");
                            
                            Cookie join_code_cookie = new Cookie("join_code_cookie", join_code_cookie_str);
                            join_code_cookie.setPath("/");
                            response.addCookie(join_code_cookie);
                        }
                    }else if("cookieEtlandUserAutoLogin".equals(cookie.getName())){ // 자동로그인
                        User user = new User();
                        
                        user.setMEM_MST_MEM_ID(cookie.getValue());
                        user.setMEM_MST_WEB_PWD("etlandmall");
                        user.setROLE_USER(ROLEUSER.user);

                        this.pcLoginManagerService.loginManagerProc(request, user, response);
                    }
                }
            }

            if(!isSessionCookieExist){
                //세션 id 정보를 cookie 저장 
                Cookie session_cookie = new Cookie("session_cookie", AesCrypto.encrypt(request.getSession().getId()));
                session_cookie.setPath("/");
                response.addCookie(session_cookie);
            }

            if(!isJoinCodeCookieExist){
                //세션에 있는 joinCode를 cookie 저장 
                String joinCode = StringUtil.getString(request.getParameter("joinCode"));
                
                if(!"".equals(joinCode)){
                    logger.info("join_code_cookie set");
                    
                    Cookie join_code_cookie = new Cookie("join_code_cookie", joinCode);
                    join_code_cookie.setPath("/");
                    response.addCookie(join_code_cookie);
                }
            }
        }
    }
    
    // PC 권한 체크
    public void frontAuthorityCheck(HttpServletRequest request, HttpServletResponse response, String requestUri, Class<?> thisClass, Method thisMethod) throws Exception{
        ROLEUSER baseAccessUserRole = ROLEUSER.guest;

        try{
            if(AnnotationUtils.findAnnotation(thisMethod, AccessLevelUser.class)!=null?true:false){
                baseAccessUserRole = AnnotationUtils.findAnnotation(thisMethod, AccessLevelUser.class).value();
            }else if(thisClass.isAnnotationPresent(AccessLevelUser.class)){
                baseAccessUserRole = thisClass.getAnnotation(AccessLevelUser.class).value();
            }
        }catch(Exception e){

        }
        
        ROLEUSER userAccessUserRole = ROLEUSER.guest;
        if(SessionsUser.isLogin(request)){
            userAccessUserRole = (ROLEUSER)SessionsUser.getSessionUserRole(request);
        }
        if(SessionsUser.isNonLogin(request)){
            userAccessUserRole = (ROLEUSER)SessionsUser.getSessionUserRole(request);
        }

        int baseAccessRoleCnt = User.levels.get(baseAccessUserRole);
        int userAccessRoleCnt = User.levels.get(userAccessUserRole);

        if(userAccessRoleCnt < baseAccessRoleCnt){
            if(requestUri.indexOf("/pc/") >= 0){
                request.setAttribute("serverSslDomain", propertiesService.getString("server.ssl.domain"));
                throw new PcAuthenticationException();
            }else if(requestUri.indexOf("/mobile/") >= 0){
                request.setAttribute("serverSslDomain", propertiesService.getString("server.ssl.domain"));
                throw new MobileAuthenticationException();
            }
        }

        if (SessionsUser.getSessionUser(request) != null){
            request.setAttribute("sessionUser", SessionsUser.getSessionUser(request));
        }

        // 입점센터 로그인
        if (SessionsBusiness.getSessionBusiness(request) != null){
            request.setAttribute("sessionBusiness", SessionsBusiness.getSessionBusiness(request));
        }
    }
    
    // PC 전시배너 셋팅
    @SuppressWarnings({ "unused", "unchecked", "rawtypes" })
    public void pcBannerDisplaySetting(HttpServletRequest request, HttpServletResponse response, String requestUri, Class<?> thisClass, Method thisMethod) throws Exception {
        // FrontBannerSkip 어노테이션 태그가 있는 경우에는 가져오지 않는다.
        try{
            if(AnnotationUtils.findAnnotation(thisMethod, FrontBannerSkip.class)==null && !thisClass.isAnnotationPresent(FrontBannerSkip.class)){
                logger.debug("########################## [START] FRONT BANNER ####################################");

                Map<String, Object> paramMap = new HashMap<String, Object>();

                // 메뉴 GNB 가져오기
                paramMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC);
                List<Map<String, Object>> listGnbMenu = this.pcCommonService.selectGnbCategoryList(paramMap); 
                List<Map<String, Object>> listGnbMenuTree = CategoryUtil.convertCategoryTreeData(listGnbMenu);
                request.setAttribute("listGnbMenu",listGnbMenuTree);
                
                List<Map<String, Object>> listGnbSubMenu = this.pcCommonService.selectGnbMenuList();
                request.setAttribute("listGnbSubMenu",listGnbSubMenu);
                
                // GNB(ACTIVITY) MD추천상품 가져오기
                int COMMON_PRODUCT_DISPLAY_PC_GNB_ACTIVITY = 0;
                paramMap.put("PD_IDX", COMMON_PRODUCT_DISPLAY_PC_GNB_ACTIVITY);

                // GNB(MAN) MD추천상품 가져오기
                int COMMON_PRODUCT_DISPLAY_PC_GNB_MAN = 0;
                paramMap.put("PD_IDX", COMMON_PRODUCT_DISPLAY_PC_GNB_MAN);
                
                // GNB(WOMAN) MD추천상품 가져오기
                int COMMON_PRODUCT_DISPLAY_PC_GNB_WOMAN = 0;

                paramMap.put("PD_IDX", COMMON_PRODUCT_DISPLAY_PC_GNB_WOMAN);

                // GNB(FOOTWEAR) MD추천상품 가져오기
                int COMMON_PRODUCT_DISPLAY_PC_GNB_FOOTWEAR = 0;
                paramMap.put("PD_IDX", COMMON_PRODUCT_DISPLAY_PC_GNB_FOOTWEAR);

                
                // GNB(EQUIPMENT) MD추천상품 가져오기
                int COMMON_PRODUCT_DISPLAY_PC_GNB_EQUIPMENT = 0;
                paramMap.put("PD_IDX", COMMON_PRODUCT_DISPLAY_PC_GNB_EQUIPMENT);

                // TOP 배너 가져오기
                int COMMON_BANNER_DISPLAY_PC_SHOP_TOP_BANNER = 0;

                paramMap.put("BANNER_IDX", COMMON_BANNER_DISPLAY_PC_SHOP_TOP_BANNER);
                request.setAttribute("topBannerList", this.productListService.selectBannerDisplayList(paramMap));

                // FOOTER 배너 가져오기
                int COMMON_BANNER_DISPLAY_PC_SHOP_FOOTER_BANNER = 0;

                paramMap.put("BANNER_IDX", COMMON_BANNER_DISPLAY_PC_SHOP_FOOTER_BANNER);
                request.setAttribute("footerBannerList", this.productListService.selectBannerDisplayList(paramMap));
                
                // 이벤트 목록 가져오기
                paramMap.put("searchPlnMstShopType", Code.EVENT_PLAN_CHANNEL_CD_PC); //PC용 기획전
                paramMap.put("EVENT_PLAN_CHANNEL_CD_PCMOBILE", Code.EVENT_PLAN_CHANNEL_CD_PCMOBILE); //PC+MOBILE 기획전

                // 탑 배너 가져오기
                paramMap.put("BANNER_IDX", 153);
                request.setAttribute("listBanner_TOP_A",this.productListService.selectBannerDisplayList(paramMap));         

                // 카트 수량 가져오기
                User user = SessionsUser.getSessionUser(request);
                if(SessionsUser.isLogin(request)){
                    paramMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
                }
                paramMap.put("MEM_CRT_SES_ID", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));

                // 상품 채널 타입
                paramMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC용 
                
                request.setAttribute("cartCnt",this.cartService.selectCartCnt(paramMap));

                List<Map<String,Object>> keepProductList = null;
                List<Map<String,Object>> keepContentsList = null;
                List<Map<String,Object>> keepPlanList = null;
                List<Map<String,Object>> keepEventList = null;

                if(SessionsUser.isLogin(request)){
                    // 키핑 상품
                    paramMap.put("CHN_GBN",Code.USER_ENV_TYPE_PC);
                    paramMap.put("quickKeep", "Y");
                    paramMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
                    keepProductList = this.pcMyKeepService.selectKeepProductList(paramMap);

                    // 키핑 콘텐츠
                    keepContentsList = this.pcMyKeepService.selectKeepContentsList(paramMap);

                    // 키핑 기획전
                    paramMap.put("PLN_MST_CHANNEL_PC_YN","Y");
                    keepPlanList = this.pcMyKeepService.selectKeepPlanList(paramMap);

                    // 키핑 이벤트
                    paramMap.put("EVT_MST_PC_YN", "Y");
                    keepEventList = this.pcMyKeepService.selectKeepEventList(paramMap);
                }

                request.setAttribute("keepProductList", keepProductList);
                request.setAttribute("keepContentsList", keepContentsList);
                request.setAttribute("keepPlanList", keepPlanList);
                request.setAttribute("keepEventList", keepEventList);

                // 쿠키에 담은 최근 본 상품
                Cookie[] cookies = request.getCookies();
                String recentProductCode = "";

                if(cookies != null){
                    for(Cookie cookie : cookies){
                        if("recentProductList".equals(cookie.getName())){
                            recentProductCode = cookie.getValue();
                        }
                    }
                }

                if(!"".equals(recentProductCode)){
                    String[] recentProductCodeArr = URLDecoder.decode(recentProductCode, "UTF-8").split(",");
                    paramMap.put("recentProductCodeArr", recentProductCodeArr);
                    request.setAttribute("recentProductList", this.pcCommonService.selectRecentProductList(paramMap));
                    request.setAttribute("recentProductCount", recentProductCodeArr.length);        
                }

                // footer 윙배너A 
                Map<String, Object> wingA_BannerMap = new HashMap<String, Object>();

                wingA_BannerMap.put("BANNER_IDX", Code.PC_LEFT_WING_A_BANNER);
                wingA_BannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
                wingA_BannerMap.put("BNR_MST_ENV", "P");
                wingA_BannerMap.put("RUNM", 4);

                List<Map<String,Object>> wingA_BannerList = this.productListService.selectBannerDisplayList(wingA_BannerMap);

                request.setAttribute("wingA_BannerList", wingA_BannerList);
                request.setAttribute("wingA_BannerCnt", wingA_BannerList.size());

                // footer 윙배너B
                Map<String, Object> wingB_BannerMap = new HashMap<String, Object>();

                wingB_BannerMap.put("BANNER_IDX", Code.PC_LEFT_WING_B_BANNER);
                wingB_BannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
                wingB_BannerMap.put("BNR_MST_ENV", "P");

                request.setAttribute("wingB_BannerList", this.productListService.selectBannerDisplayList(wingB_BannerMap));

                // 지역설정 시도 리스트  
                Map<String, Object> areaParamMap = new HashMap<String, Object>();
                areaParamMap.put("CMN_COM_UP_IDX", "2394");
                request.setAttribute("areaList", this.pcWeddingService.getGuide3DepList(areaParamMap));

                boolean areaCheck   = false;

                if(cookies != null){
                    for(Cookie cookie : cookies){
                        if("areaInfo".equals(cookie.getName())){
                            areaCheck   = true;
                        }
                    }
                }

                String remoteIp = request.getRemoteAddr();
                areaParamMap.put("remoteIp", remoteIp);

                int areaResultMapCount = this.pcCommonService.selectIpCheckCount(areaParamMap);

                Map<String, Object> areaResultMap = this.pcCommonService.selectIpLocationInfo(areaParamMap);

                // IP 같은 정보가 있다면 정보를 쿠키로 만든다.
                if(areaResultMap != null && areaResultMapCount > 0){
                    // 없으면 이상
                    if(areaResultMap.size() > 0){
                        String areaInfo = "";

                        Iterator keys = areaResultMap.keySet().iterator();
                        while(keys.hasNext()) {
                            String cookieName = (String) keys.next();
                            areaInfo = areaInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(areaResultMap.get(cookieName))) + "#";
                        }

                        Cookie areaCoookie  = new Cookie("areaInfo", areaInfo);
                        areaCoookie.setPath("/");
                        response.addCookie(areaCoookie);
                    }
                }else{
                    // 없으면 데이터 쌓고 쿠키 만들 기
                    areaParamMap.put("LOC_INF_ADR", "서울특별시 용산구");
                    areaParamMap.put("CTY_SDO_NM", "서울특별시");
                    areaParamMap.put("CTY_GGU_NM", "용산구");

                    //int areaResult = this.pcCommonService.insertLocationIp(areaParamMap);
                    int areaResult = 0;
                    // 성공 하면 쿠키 생성 합시다.
                    if(areaResult > 0){
                        areaResultMap = this.pcCommonService.selectIpLocationInfo(areaParamMap);

                        // 없으면 이상???
                        if(areaResultMap.size() > 0){
                            String areaInfo     = "";

                            Iterator keys = areaResultMap.keySet().iterator();
                            while(keys.hasNext()) {
                                String cookieName = (String) keys.next();
                                areaInfo = areaInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(areaResultMap.get(cookieName))) + "#";
                            }

                            Cookie areaCoookie  = new Cookie("areaInfo", areaInfo);
                            response.addCookie(areaCoookie);
                        }
                    }
                }

                request.setAttribute("areaResultMap", areaResultMap);

                logger.debug("########################## [END] FRONT BANNER ####################################");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    // MOBILE 전시배너 셋팅
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public void mobileBannerDisplaySetting(HttpServletRequest request, HttpServletResponse response, String requestUri, Class<?> thisClass, Method thisMethod) throws Exception{
        // FrontBannerSkip 어노테이션 태그가 있는 경우에는 가져오지 않는다.
        try{
            if(AnnotationUtils.findAnnotation(thisMethod, FrontBannerSkip.class)==null && !thisClass.isAnnotationPresent(FrontBannerSkip.class)){
                logger.debug("########################## [START] FRONT BANNER ####################################");

                Map<String, Object> paramMap = new HashMap<String, Object>();

                // 카트 수량 가져오기
                User user = SessionsUser.getSessionUser(request);
                if(user!=null){
                    paramMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
                }
                paramMap.put("MEM_CRT_SES_ID", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));

                // 상품 채널 타입
                paramMap.put("PRD_MST_CNL_MB_YN", "Y"); //MOBILE용 
                request.setAttribute("cartCnt",this.cartService.selectCartCnt(paramMap));
                
                // 메뉴 GNB 가져오기
                paramMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC);
                List<Map<String, Object>> listGnbMenu = this.pcCommonService.selectGnbCategoryList(paramMap); 
                List<Map<String, Object>> listGnbMenuTree = CategoryUtil.convertCategoryTreeData(listGnbMenu);
                request.setAttribute("listGnbMenu",listGnbMenuTree);
                logger.debug("===================listGnbMenu=========================================="+request.getAttribute("listGnbMenu"));
                
                if(SessionsUser.isLogin(request)){
                    // 쿠폰 갯수 및 마일리지 
                    Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, paramMap);
                    request.setAttribute("summaryMap", summaryMap);
                }

                // 쿠키에 담은 최근 본 상품
                Cookie[] cookies = request.getCookies();
                String recentProductCode = "";

                if(cookies != null){
                    for(Cookie cookie : cookies){
                        if("recentProductList".equals(cookie.getName())){
                            recentProductCode = cookie.getValue();
                        }
                    }
                }

                if(!"".equals(recentProductCode)){
                    String[] recentProductCodeArr = URLDecoder.decode(recentProductCode, "UTF-8").split(",");
                    paramMap.put("recentProductCodeArr", recentProductCodeArr);
                    request.setAttribute("recentProductList", this.pcCommonService.selectRecentProductList(paramMap));
                    request.setAttribute("recentProductCount", recentProductCodeArr.length);        
                }

                // 지역설정 시도 리스트  
                Map<String, Object> areaParamMap  = new HashMap<String, Object>();
                areaParamMap.put("CMN_COM_UP_IDX", "2394");
                request.setAttribute("areaList", this.pcWeddingService.getGuide3DepList(areaParamMap));

                @SuppressWarnings("unused")
                boolean areaCheck   = false;

                if(cookies != null){
                    for(Cookie cookie : cookies){
                        if("areaInfo".equals(cookie.getName())){
                            areaCheck   = true;
                        }
                    }
                }

                String remoteIp = request.getRemoteAddr();
                areaParamMap.put("remoteIp", remoteIp);

                int areaResultMapCount = this.pcCommonService.selectIpCheckCount(areaParamMap);

                Map<String, Object> areaResultMap           = new HashMap<String, Object>();

                // IP 같은 정보가 있다면 정보를 쿠키로 만든다.
                if(areaResultMapCount > 0){
                    areaResultMap = this.pcCommonService.selectIpLocationInfo(areaParamMap);

                    // 없으면 이상???
                    if(areaResultMap.size() > 0){
                        // 혹시 쿠키가 있다면 삭제하고 새로 생성.
                        Cookie kc = new Cookie("areaInfo", null) ;
                        kc.setMaxAge(0) ;
                        response.addCookie(kc) ;

                        String areaInfo     = "";

                        Iterator keys = areaResultMap.keySet().iterator();
                        while(keys.hasNext()) {
                            String cookieName = (String) keys.next();
                            areaInfo = areaInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(areaResultMap.get(cookieName))) + "#";
                        }

                        Cookie areaCoookie  = new Cookie("areaInfo", areaInfo);
                        response.addCookie(areaCoookie);
                    }
                }else{
                    // 없으면 데이터 쌓고 쿠키 만들 기
                    areaParamMap.put("LOC_INF_ADR", "서울특별시 용산구");
                    areaParamMap.put("CTY_SDO_NM", "서울특별시");
                    areaParamMap.put("CTY_GGU_NM", "용산구");

                    //int areaResult = this.pcCommonService.insertLocationIp(areaParamMap);
                    int areaResult = 0;

                    // 성공 하면 쿠키 생성 합시다.
                    if(areaResult > 0){
                        areaResultMap  = this.pcCommonService.selectIpLocationInfo(areaParamMap);

                        // 없으면 이상???
                        if(areaResultMap.size() > 0){
                            String areaInfo     = "";

                            Iterator keys = areaResultMap.keySet().iterator();
                            while(keys.hasNext()) {
                                String cookieName = (String) keys.next();
                                areaInfo = areaInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(areaResultMap.get(cookieName))) + "#";
                            }
                            
                            Cookie areaCoookie  = new Cookie("areaInfo", areaInfo);
                            response.addCookie(areaCoookie);
                        }
                    }
                }

                request.setAttribute("areaResultMap", areaResultMap);

                logger.debug("########################## [END] FRONT BANNER ####################################");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    // 관리자 권한 체크
    public void adminAuthorityCheck(HttpServletRequest request, HttpServletResponse response, String requestUri, Class<?> thisClass, Method thisMethod) throws Exception{
         // 접근자 디폴트 셋팅

//        HttpSession session = request.getSession();
//        Map<String, String> adminSession = new HashMap<>();
//        
//        adminSession.put("roleAdmin", "administrator");
//        adminSession.put("ADM_MST_REG_DT", "20160412101432");
//        adminSession.put("ADM_MST_HP2", "4621");
//        adminSession.put("ADM_MST_HP3", "8972");
//        adminSession.put("ADM_MST_HP1", "010");
//        adminSession.put("ADM_MST_SUB_IDX", "-1");
//        adminSession.put("AUT_MST_IDX", "1");
//        adminSession.put("ADM_MST_REG_ID", "100058");
//        adminSession.put("ADM_MST_UPD_ID", "admin");
//        adminSession.put("ADM_MST_ERP_NO", "200020");
//        
//        adminSession.put("ADM_MST_TEL3", "1160");
//        adminSession.put("ADM_MST_TEL2", "6925");
//        adminSession.put("ADM_MST_TEL1", "02");
//        adminSession.put("ADM_MST_UPD_DT", "20180420170116");
//        
//        adminSession.put("ADM_MST_REG_IP", "220.71.52.218");
//        adminSession.put("ADM_MST_NM", "슈퍼관리자");
//        adminSession.put("ADM_MST_EMAIL_ID", "smile");
//        
//        adminSession.put("ADM_MST_UPD_IP", "115.94.244.134");
//        adminSession.put("ADM_MST_EMAIL_DOMAIN", "epasscni.com");
//        adminSession.put("ADM_MST_ID", "admin");
//        adminSession.put("ADM_MST_STATE", "Y");
//
//
//        session.setAttribute("__MALL_ADMIN_SESSION_INFO__", adminSession);
        
        ROLEADMIN baseAccessAdminRole = ROLEADMIN.guest;

        try {
            // 접근하고자 하는 Class 또는 Method의 접근 레벨 확인
            if(AnnotationUtils.findAnnotation(thisMethod, AccessLevelAdmin.class) != null ? true : false){
                baseAccessAdminRole = AnnotationUtils.findAnnotation(thisMethod, AccessLevelAdmin.class).value();
            }else if(thisClass.isAnnotationPresent(AccessLevelAdmin.class)){
                baseAccessAdminRole = thisClass.getAnnotation(AccessLevelAdmin.class).value();
            }
        } 
        catch(Exception e){

        }

        // 로그인 세션이 존재 유무에 따른 접근자 레벨 설정 
        ROLEADMIN userAccessAdminRole = SessionsAdmin.isLoginAdmin(request) ? (ROLEADMIN)SessionsAdmin.getSessionRoleAdmin(request) : ROLEADMIN.guest;
        
        int baseAccessAdminRoleCnt = Admin.levels.get(baseAccessAdminRole);
        int userAccessAdminRoleCnt = Admin.levels.get(userAccessAdminRole);
        String basicManagerAuthYn = "N";
        
        // 로그인 세션이 존재하지 않을경우
        if(userAccessAdminRoleCnt < baseAccessAdminRoleCnt){
            throw new AmAuthenticationException();
        }
      
        // 세션이 존재할 경우
        if(SessionsAdmin.isLoginAdmin(request)){
            // ajax, 팝업, json, 시스템 처리 부분을 제외한 경우
            if(requestUri.indexOf("Ajax") < 0 && requestUri.indexOf("Popup") < 0 && requestUri.indexOf("Json") < 0){
                // 세션에 담긴 메뉴 리스트 
                List<Map<String, Object>> menuList = SessionsAdmin.getSessionAdminMenuList(request);
                request.setAttribute("leftMenuList", makeAdminMenuJson(request, response, menuList));

                int authCount = 0;
                int authMenuCount = 0;

                // 접근하고자 하는 메뉴의 권한 체크
                for(int i = 0;i < menuList.size(); i++){
                    Map<String, Object> menuMap = (Map<String, Object>)menuList.get(i);
                    int ADM_MNU_TOP_IDX =  StringUtil.getInt(menuMap.get("ADM_MNU_TOP_IDX"));

                    if(ADM_MNU_TOP_IDX > 0){
                        authMenuCount++;
                        String menuAuthUrl = StringUtil.getString(menuMap.get("ADM_MNU_AUTH_URL"), "").trim();

                        //관리자 관리 메뉴에 대한 권한이 있는 경우 basicManagerAuthYn이 Y
                        if(menuAuthUrl.indexOf("basicManager") > 0){
                            basicManagerAuthYn = "Y";
                        }
                        
                        // index, dashboard, login 페이지를 제외한 메뉴 권한 체크
                        if(requestUri.indexOf("index") < 0 && requestUri.indexOf("dashboard") < 0 && 
                                requestUri.indexOf("login") < 0 && requestUri.indexOf("logout") < 0 &&
                                requestUri.indexOf("common") < 0){
                            if(requestUri.indexOf(menuAuthUrl) < 0){
                                authCount++;
                            }
                        }
                    }
                }

                if(menuList.size() > 0){
                    // 메뉴의 접근 권한이 없을 경우 
                    if(authCount == authMenuCount){
                        throw new AccessException();
                    }
                }else{
                     if(requestUri.indexOf("index") < 0 && requestUri.indexOf("dashboard") < 0 && 
                             requestUri.indexOf("login") < 0 && requestUri.indexOf("logout") < 0 &&
                             requestUri.indexOf("common") < 0){
                         throw new AccessException();
                     }
                }
            }
        }

        String selectMenuCode = StringUtil.getString(request.getParameter("selectMenuCode"), "");
        request.setAttribute("selectMenuCode", selectMenuCode);
        request.setAttribute("requestUrl", requestUri);

        request.setAttribute("isLoginAdmin", SessionsAdmin.isLoginAdmin(request));

        if(SessionsAdmin.getSessionAdmin(request) != null){
            request.setAttribute("sessionAdmin", SessionsAdmin.getSessionAdmin(request));
            request.setAttribute("basicManagerAuthYn", basicManagerAuthYn);
        }
    }

    // 로고 정보
    public String selectlogoUrl (HttpServletRequest request, int logoType) throws Exception{
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("LGO_MST_TYPE", logoType);
        
        return this.logoService.selectLogoUrl(paramMap);
    }
    
    public JSONObject makeAdminMenuJson(HttpServletRequest request, HttpServletResponse response, List<Map<String, Object>> menuList) throws Exception
    {
      JSONObject jsonReturnObj = new JSONObject();

      JSONObject json1DepthObj = new JSONObject();
      JSONObject json2DepthObj = null;
      JSONObject json3DepthObj = null;

      JSONArray Json1DepthArray = new JSONArray();
      JSONArray Json2DepthArray = null;
      JSONArray Json3DepthArray = null;
      String serverDomain = this.propertiesService.getString("server.domain");
      if(UrlTypeUtil.getBaseWildCardUrl().indexOf("scm.")>-1){
          serverDomain = this.propertiesService.getString("scm.domain");
      }
      String requestUri = request.getRequestURI().toString();
      int navi1Depth = 0;
      int navi2Depth = 0;
      int navi3Depth = 0;
      int RANK = 0;

      String ADM_MNU_NM = "";
      String ADM_MNU_URL = "";
      String ADM_MNU_AUTH_URL = "";
      int ADM_MNU_LEVEL = 0;
      int NEXT_ADM_MNU_LEVEL = 0;
      int PREV_ADM_MNU_LEVEL = 0;

      jsonReturnObj.append("name", "");
      jsonReturnObj.append("src", "");

      json1DepthObj.put("name", "대시보드");
      json1DepthObj.put("src", serverDomain + "/am/main/dashboardMain.do");
      Json1DepthArray.put(json1DepthObj);

      for (Map dataMap : menuList) {
        ADM_MNU_NM = StringUtil.getString(dataMap.get("ADM_MNU_NM"));
        ADM_MNU_URL = StringUtil.getString(dataMap.get("ADM_MNU_URL"));
        ADM_MNU_AUTH_URL = StringUtil.getString(dataMap.get("ADM_MNU_AUTH_URL"));
        ADM_MNU_LEVEL = StringUtil.getInt(dataMap.get("ADM_MNU_LEVEL"));
        NEXT_ADM_MNU_LEVEL = StringUtil.getInt(dataMap.get("NEXT_ADM_MNU_LEVEL"));
        PREV_ADM_MNU_LEVEL = StringUtil.getInt(dataMap.get("PREV_ADM_MNU_LEVEL"));
        RANK = StringUtil.getInt(dataMap.get("RANK"));

        switch (ADM_MNU_LEVEL) {
        case 0:
          json1DepthObj = new JSONObject();
          json1DepthObj.put("name", ADM_MNU_NM);
          json1DepthObj.put("src", serverDomain + ADM_MNU_URL);

          navi1Depth = RANK;

          if (requestUri.indexOf(ADM_MNU_AUTH_URL) > -1) {
            request.setAttribute("navi1Depth", Integer.valueOf(navi1Depth));
            request.setAttribute("navi2Depth", "0");
            request.setAttribute("navi3Depth", "0");
          }

          if (NEXT_ADM_MNU_LEVEL == 0) {
            Json1DepthArray.put(json1DepthObj);
          }

          break;
        case 1:
          json2DepthObj = new JSONObject();

          if (PREV_ADM_MNU_LEVEL == 0) {
            Json2DepthArray = new JSONArray();
          }

          json2DepthObj.put("name", ADM_MNU_NM);
          json2DepthObj.put("src", serverDomain + ADM_MNU_URL);

          navi2Depth = RANK;

          if (requestUri.indexOf(ADM_MNU_AUTH_URL) > -1) {
            request.setAttribute("navi1Depth", Integer.valueOf(navi1Depth));
            request.setAttribute("navi2Depth", Integer.valueOf(navi2Depth - 1));
            request.setAttribute("navi3Depth", "0");
          }

          if ((NEXT_ADM_MNU_LEVEL == 0) || (NEXT_ADM_MNU_LEVEL == 1)) {
            Json2DepthArray.put(json2DepthObj);
          }

          if (NEXT_ADM_MNU_LEVEL == 0) {
            json1DepthObj.put("child", Json2DepthArray);
            Json1DepthArray.put(json1DepthObj);
          }

          break;
        case 2:
          json3DepthObj = new JSONObject();

          if (PREV_ADM_MNU_LEVEL == 1) {
            Json3DepthArray = new JSONArray();
          }

          json3DepthObj.put("name", ADM_MNU_NM);
          json3DepthObj.put("src", serverDomain + ADM_MNU_URL);

          navi3Depth = RANK;

          if (requestUri.indexOf(ADM_MNU_AUTH_URL) > -1) {
            request.setAttribute("navi1Depth", Integer.valueOf(navi1Depth));
            request.setAttribute("navi2Depth", Integer.valueOf(navi2Depth - 1));
            request.setAttribute("navi3Depth", Integer.valueOf(navi3Depth - 1));
          }

          Json3DepthArray.put(json3DepthObj);

          if (NEXT_ADM_MNU_LEVEL == 1) {
            json2DepthObj.put("child", Json3DepthArray);
            Json2DepthArray.put(json2DepthObj);
          }

          if (NEXT_ADM_MNU_LEVEL == 0) {
            json2DepthObj.put("child", Json3DepthArray);
            Json2DepthArray.put(json2DepthObj);
            json1DepthObj.put("child", Json2DepthArray);
            Json1DepthArray.put(json1DepthObj);
          }
          break;
        }

      }

      jsonReturnObj.put("child", Json1DepthArray);

      return jsonReturnObj;
    }
    
    // SNS 회원 MyPage 접근 체크
    public void accessMyPageSNSCheck(HttpServletRequest request, String requestUri, String deviceType) throws Exception{
        
        if(SessionsUser.isLogin(request)){
            // 회원 구분값
            int memGbn = StringUtil.getInt(SessionsUser.getSessionUserValue(request, "MEM_MST_MEM_GBN"), 0);
            
            if(requestUri.indexOf("mypage") > 0 && memGbn == Code.MEMBER_TYPE_SNS){
                throw new AccessMypageDeniedException(deviceType);
            }
        }
    }
}