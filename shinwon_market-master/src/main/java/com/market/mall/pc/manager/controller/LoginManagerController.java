package com.market.mall.pc.manager.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.sns.service.SnsManagerService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.siren.SirenCert;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.manager.service.LoginManagerService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.util.LoginPasswordCipher;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName		: com.market.mall.pc.manager.controller
 * @FileName 		: LoginManagerController.java
 * @Date 			: 2014. 7. 1.
 * @프로그램 설명 	: 프론트 > 사용자 로그인을 처리하는 Controller Class
 * @author LJH
 */
@Controller("pcLoginManagerController")
@AccessLevelUser(ROLEUSER.guest)
public class LoginManagerController {
  
	@Resource(name="productListService") 	private ProductListService productListService;
    @Resource(name="pcLoginManagerService")	private LoginManagerService pcLoginManagerService;
    @Resource(name="pcJoinMemberService")   private JoinMemberService pcJoinMemberService;
    @Resource(name="pcCommonService")		private CommonService pcCommonService;
    @Resource(name="propertiesService")     protected EgovPropertyService propertiesService;    
    @Resource(name="snsManagerService")     private SnsManagerService snsManagerService;    
    @Resource private CartService cartService;
    
    @Autowired
	private SirenCert sirenCert;
    
//    @Resource(name="pcBannerDisplayService")
//    private BannerDisplayService pcBannerDisplayService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * <pre>
     * 1. MethodName : login
     * 2. ClassName  : LoginManagerController.java
     * 3. Comment    : 프론트 > 로그인
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/manager/login")
    public ModelAndView login (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(SessionsUser.isLogin(request))
        {
			mv.addObject("commandMap", commandMap);
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");
        }
        else
        {
        	// 배너목록 가져오기
        	Map<String, Object> bannerMap = new HashMap<String, Object>();
        	bannerMap.put("BANNER_IDX", Code.PC_LOGIN_BANNER);
        	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
        	bannerMap.put("BNR_MST_ENV", "P");
        	bannerMap.put("RUNM", 2);
        	mv.addObject("loginBannerList", this.productListService.selectBannerDisplayList(bannerMap));
        	
            // SNS 로그인 가져오기  
            commandMap.put("startNum", 1); 
            commandMap.put("endNum", 20);
            mv.addObject("snsUseList", this.snsManagerService.selectSnsUseList(commandMap));
            mv.addObject("commandMap", commandMap);
            
            // ID저장 checkBox Cont(Cookie) 
            Cookie[] cookies = request.getCookies();
            if(cookies != null){
                for (int i = 0; i < cookies.length; i++) {   
                    if(cookies[i].getName().equals("cookieMarketAsaveId")){  // 해당 Cookie Name
                        String[] cookieVal = cookies[i].getValue().split("/");
                        commandMap.put("cookieMarketAsaveId", cookieVal[0]); // 해당 Cookie checkBox
                        commandMap.put("MEM_MST_MEM_ID", cookieVal[1]);      // 해당 MEM_MST_MEM_ID  
                    } 
                }    
            }

    		mv.addObject("commandMap", commandMap);
        }
		  
        return mv;        
    }

    /**
     * <pre>
     * 1. MethodName : loginPopup
     * 2. ClassName  : LoginManagerController.java
     * 3. Comment    : 프론트 > 로그인 팝업
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/loginPopup")
    public ModelAndView loginPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");
        }
        else
        {
            // 배너목록 가져오기 
            Map<String, Object> bannerMap = new HashMap<String, Object>();
            bannerMap.put("BANNER_IDX", Code.PC_LOGIN_BANNER);
            bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
            bannerMap.put("BNR_MST_ENV", "P");
            bannerMap.put("RUNM", 2); 
            mv.addObject("loginBannerList", this.productListService.selectBannerDisplayList(bannerMap));
            
            // SNS 로그인 가져오기  
            commandMap.put("startNum", 1);
            commandMap.put("endNum", 20);
            mv.addObject("snsUseList", this.snsManagerService.selectSnsUseList(commandMap));
            
            // ID저장 checkBox Cont(Cookie) 
            Cookie[] cookies = request.getCookies();
            if(cookies != null){
                for (int i = 0; i < cookies.length; i++) {   
                    if(cookies[i].getName().equals("cookieMarketAsaveId")){  // 해당 Cookie Name
                        String[] cookieVal = cookies[i].getValue().split("/");
                        commandMap.put("cookieMarketAsaveId", cookieVal[0]); // 해당 Cookie checkBox
                        commandMap.put("MEM_MST_MEM_ID", cookieVal[1]);      // 해당 MEM_MST_MEM_ID  
                    } 
                }    
            }
            
            mv.addObject("commandMap", commandMap);
        }
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : loginPopHttp
     * 2. ClassName  : LoginManagerController.java
     * 3. Comment    : 프론트 > 로그인팝업 > https / http 부모창 호출할 경우 
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 12. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @FrontBannerSkip()
     @RequestMapping("/pc/manager/loginPopHttp")
     public ModelAndView loginPopHttp (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
     {
        ModelAndView mv = new ModelAndView();
          
        logger.debug("--> loginPopHttp CHK: " + StringUtil.getString(commandMap.get("linkUrl")));
        // 로그인 팝업의 링크 관련 (비회원)
        String linkUrl = StringUtil.getString(commandMap.get("linkUrl"));
        
        if(!"".equals(linkUrl))
        {
            commandMap.put("url", URLDecoder.decode(linkUrl,"UTF-8")); 
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : nonMemberLogin
      * 2. ClassName  : LoginManagerController.java
      * 3. Comment    : 프론트 > 비회원 구매/주문 조회
      * 4. 작성자       : DEV_KIMYEONGJUN
      * 5. 작성일       : 2016. 8. 31.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
    @RequestMapping("/pc/manager/nonMemberLogin")
    public ModelAndView nonMemberLogin (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
          
        // 회원 로그인 시 강제 이동
        if(SessionsUser.isLogin(request))  
        {  
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");  
        }
        else
        {  
            // 배너목록 가져오기
            Map<String, Object> bannerMap = new HashMap<String, Object>();
            bannerMap.put("BANNER_IDX", Code.PC_NON_LOGIN_BANNER);
            bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
            bannerMap.put("BNR_MST_ENV", "P");
            bannerMap.put("RUNM", 2);
            mv.addObject("nonLoginBannerList", this.productListService.selectBannerDisplayList(bannerMap));
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : naverCallbackUrl
     * 2. ClassName  : LoginManagerController.java
     * 3. Comment    : 프론트 > TOP로그인 버튼 > 로그인 팝업 > naverCallbackUrl
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 19.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @FrontBannerSkip() 
    @RequestMapping("/pc/manager/naverCallbackUrl")  
    public ModelAndView naverCallbackUrl(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {  
        ModelAndView mv = new ModelAndView();      
        List<Map<String,Object>> snsList = this.snsManagerService.selectSnsUseList(commandMap);
        for(int snsIndex=0;snsIndex<snsList.size();snsIndex++) {
        	Map<String,Object> sns = snsList.get(snsIndex);
        	if("네이버".equals(sns.get("SNS_MST_TYPE_NM").toString())) {
        		mv.addObject("naverKey",sns.get("SNS_MST_API_KEY").toString());
        	}
        }
        mv.addObject("commandMap", commandMap); 
        return mv; 
    } 
    
    /**
     * <pre>
     * 1. MethodName : loginProc
     * 2. ClassName  : LoginManagerController.java
     * 3. Comment    : 프론트 > 로그인을 처리한다. 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 19.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param response
     * @return
     * @throws Exception
     */
    
    /**
     * @api {post} /pc/manager/loginProc.do
     * @apiName 로그인
     * @apiGroup 로그인
     * @apiParam {String} pageType 페이지 타입(main,pop,nonMain)
     * @apiParam {String} ROLE_USER 로그인종류(guest,user,order_guest,sns)
     * @apiParam {String} MEM_MST_MEM_ID 아이디
     * @apiParam {String} MEM_MST_WEB_PWD 비밀번호
     * @apiParam {String} saveId 아이디저장 YN
     * @apiParam {String} MEM_SNS_ID SNS고유번호 
     * @apiSuccess {Number} 10 로그인 아이디 필요
     * @apiSuccess {Number} 20 로그인 비밀번호 필요
     * @apiSuccess {Number} 30 아이디가 존재하지 않음
     * @apiSuccess {Number} 40 비밀번호와 로그인 비밀번호가 일치하지 않음
     * @apiSuccess {Number} 60 계정이 중지됨
     * @apiSuccess {Number} 80 로그인 실패
     * @apiSuccess {Number} 90 로그인 성공
     * @apiSuccess {Number} 100 비회원 로그인 성공
     * @apiSuccess {Number} 110 접속 권한이 없음
     * @apiSuccess {Number} 120 비회원 로그인 주문번호 필요
     * @apiSuccess {Number} 130 비회원 로그인 주문자명 필요
     * @apiSuccess {Number} 170 비회원 로그인 일치하는 주문정보가 없음
     * @apiSuccess {Number} 180 비회원 로그인 주문자명이 일치하지 않음
     * @apiSuccess {Number} 190 유효시간이 지남
     * @apiSuccess {Number} 210 SNS 고유 아이디 필요
     * @apiSuccess {Number} 220 SNS으로 간편로그인 성공 
     * @apiSuccess {String} returnUrl 로그인 성공 이후 돌아가는 페이지 
     * @apiSuccess {String} alertMsg 로그인 메세지
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@FrontBannerSkip()
    @RequestMapping("/pc/manager/loginProc")
    public ModelAndView loginProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
		String frontDomain = propertiesService.getString("front.domain");
        ModelAndView mv = new ModelAndView();
        User user = new User();
        
        // 세션 확인 > 중복 로그인 방지
        if(SessionsUser.isLogin(request))
        {   
            String pageType = StringUtil.getString(commandMap.get("pageType"), "");     
            
            // 페이지로 로그인 시
            if("main".equals(pageType))
            {
                mv.addObject("returnUrl", frontDomain + "/pc/main/index.do");
                mv.addObject("alertMsg", "이미 로그인 상태입니다.");
            } 
            // 팝업으로 로그인 시
            else if("pop".equals(pageType))
            {
                mv.addObject("closeMsg", "이미 로그인 상태입니다.");
            }
            // 비회원 페이지로 로그인 시
            else if("nonMain".equals(pageType))
            {   
                mv.addObject("returnUrl", frontDomain + "/pc/main/index.do");
                mv.addObject("alertMsg", "이미 로그인 상태입니다.");
            }
            else {
            	mv.addObject("returnUrl", frontDomain + "/pc/main/index.do");
                mv.addObject("alertMsg", "이미 로그인 상태입니다.");
            }
                
            mv.setViewName("pc/common/result");  
        }  
        else
        {  
            String roleUser = StringUtil.getString(commandMap.get("ROLE_USER"), "guest");                   // 회원 로그인 종류
            String returnUrl = URLDecoder.decode(StringUtil.getString(commandMap.get("url"), ""),"UTF-8");  // 로그인 성공 시 returnUrl
            String encodingUrl = StringUtil.getString(frontDomain+"/pc/manager/login.do")+"?url="+StringUtil.getString(commandMap.get("url"));                  // 로그인 실패 시 encoding된 returnUrl
            String pageType = StringUtil.getString(commandMap.get("pageType"), "");                         // 로그인페이지 타입(메인, 팝업)
            
            boolean loginCheck = false;  
            int loginStateCode = 0;      // 로그인 상태 값  
            String alertMsg   = ""; 
            
            logger.debug("--> returnUrl: " + returnUrl); 
            logger.debug("--> locationProtocol: " + StringUtil.getString(commandMap.get("locationProtocol"), ""));
            logger.debug("--> roleUser: " + roleUser);   
            logger.debug("--> linkUrl: " + StringUtil.getString(commandMap.get("linkUrl"), ""));   
            
            /* ************************************************************************************************************************************************ */
            /* ********************************************************************** 회원 ******************************************************************** */
            if("user".equals(roleUser)) 
            { 
                logger.info("############################################# 회원 로그인 시작 #############################################");
                String loginId  = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "");   // 회원 아이디
                String loginPwd = StringUtil.getString(commandMap.get("MEM_MST_WEB_PWD"), "");  // 회원 비밀번호
                loginPwd = LoginPasswordCipher.CipherPassword(loginPwd);
                String saveId   = StringUtil.getString(commandMap.get("saveId"), "N");          // ID저장 checkBox(cookie) 
                String serverSslDomain = propertiesService.getString("server.ssl.domain");
                String locationProtocol = StringUtil.getString(commandMap.get("locationProtocol"),"http");
                mv.addObject("locationProtocol",locationProtocol);
                String locationDomain = "https".equals(locationProtocol) ? serverSslDomain : frontDomain;
                mv.addObject("locationDomain", locationDomain);
                
                
                Map<String,Object> resultMap = new HashMap<String, Object>();  // 파라미터
                
                // 회원 아이디 필요    
                if("".equals(loginId)) 
                {
                    user.setLoginStateCode(Code.LOGIN_ID_INVALID);
                    user.setROLE_USER(ROLEUSER.user);
                } 
                // 회원 비밀번호 필요
                else if("".equals(loginPwd))
                {
                    user.setLoginStateCode(Code.LOGIN_PW_INVALID);
                    user.setROLE_USER(ROLEUSER.user);
                }
                else  
                {  
                    user.setMEM_MST_MEM_ID(loginId);
                    user.setMEM_MST_WEB_PWD(loginPwd);
                    user.setSaveId(saveId);  
                    user.setROLE_USER(ROLEUSER.user);
                    loginCheck = true;
                }
                
                if(loginCheck)
                {
                    // 로그인  
                    user = this.pcLoginManagerService.loginManagerProc(request, user, response);
                    
                    if(user.getLoginStateCode()==Code.LOGIN_SUCCESS)
                    {
                        try
                        {
                            // 장바구니 정보 변경
                            commandMap.put("user", user);
                            commandMap.put("session_id", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));
                            this.cartService.updateCartOwner(commandMap);
                            
                            // 임시주문 정보 변경
                            this.cartService.updateTempOrderOwner(commandMap);
                            
                            /*
                            if("Y".equals(user.getLOGIN_PIT_YN()))
                            {
                                if(StringUtil.getInt(user.getMEM_MST_MEM_GBN()) == Code.COMMON_PRI_MEMBER_GRADE)
                                {
                                    // 포인트 지급
                                    this.pcLoginManagerService.insertLoginPoint(commandMap);    
                                }
                            }
                            */
                        }
                        catch(Exception e)
                        {
                            // 로그인 세션 삭제
                            SessionsUser.setSessionClear(request);  
                            // Excpetion 에러 loginStateCode 99 설정
                            loginStateCode = 99;
                            
                            e.printStackTrace();  
                            logger.info("############################## 회원 로그인 Excpetion 에러 ###############################");
                        }
                    }            
                }
                
                /*------------------------------------------------------------------------------------------------------------*/
                /* ------------------------------------ 회원 loginStateCode : 코드 시작 ------------------------------------- */
                // 회원 로그인 상태 값     
                loginStateCode = user.getLoginStateCode();  
                logger.info("--> 회원 로그인 상태 값 > loginStateCode : " + loginStateCode );
                // 회원 > 로그인에 성공
                if(loginStateCode != Code.LOGIN_SUCCESS) {
                	commandMap.put("url", returnUrl);
                }
                if(loginStateCode == Code.LOGIN_SUCCESS)
                {   
                	if("Y".equals(saveId)) {
                		Cookie cookie = new Cookie("cookieMarketPlantUserId", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
                		cookie.setPath("/");
                		cookie.setMaxAge(60*60*24*30);
                		response.addCookie(cookie);
                	}
                    // 휴면회원의 경우
                    if("Y".equals(user.getRST_YN()))
                    {
                        resultMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
                        returnUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/clearRestMember.do";
                    }
                    // 휴면회원이 아닐 경우
                    else  
                    {
                        if(!"".equals(returnUrl))
                        {
                            // 이전 페이지로 갈 수 없는 경우 설정
                            if( returnUrl.indexOf("/login.do") > 0 || returnUrl.indexOf("/changeMemPw.do") > 0 || returnUrl.indexOf("/gest") > 0 || returnUrl.indexOf("/myShoppingInfo.do") > 0 || returnUrl.indexOf("/Popup") > 0 || returnUrl.indexOf("/pwFindResult.do") > 0 || returnUrl.indexOf("/member/join") > 0 || 
                                returnUrl.indexOf("/clearRestMember.do") > 0 || returnUrl.indexOf("/sirenIpinResResult.do") > 0 || returnUrl.indexOf("/sirenResResult.do") > 0 || returnUrl.indexOf("/idFindResult.do") > 0 || returnUrl.indexOf("/nonMemberLogin.do") > 0 || returnUrl.indexOf("/paymentSuccess.do") > 0 || 
                                returnUrl.indexOf("/paymentFail.do") > 0 || returnUrl.indexOf("/myInfoEditForm.do") > 0 || returnUrl.indexOf("/changePwd.do") > 0 || returnUrl.indexOf("joinMemType.do") > 0 ||returnUrl.indexOf("joinMemFinish.do") > 0 )
                            {
                                returnUrl = StringUtil.getString(frontDomain, "") + "/pc/main/index.do";
                            }
                        }  
                        else
                        {
                            returnUrl = StringUtil.getString(frontDomain, "") + "/pc/main/index.do";
                        }
                        
                    }
                }
                
                // 회원 > 아이디 필요
                else if(loginStateCode == Code.LOGIN_ID_INVALID)
                {
                    alertMsg = "아이디를 확인해 주십시오.";
                    returnUrl = encodingUrl;
                }
                // 회원 > 비밀번호 필요   
                else if(loginStateCode == Code.LOGIN_PW_INVALID)
                {
                    alertMsg = "비밀번호를 확인해 주십시오.";
                    returnUrl = encodingUrl;
                }
                // 회원 > 해당 로그인 정보가 없을 경우
                else if(loginStateCode == Code.LOGIN_ID_NULL)
                {
                    alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
                    returnUrl = encodingUrl;
                }  
                // 회원 > 탈퇴회원
                else if(loginStateCode == Code.LOGIN_STOP_LOGIN)
                {
                    alertMsg = "이미 탈퇴한 회원입니다.";  
                    returnUrl = encodingUrl;
                }
                // 회원 > 임시 비밀번호 유효기간이 지난 회원
                else if(loginStateCode == Code.LOGIN_PASS_EFFECTIVE_TIME)
                {
                    alertMsg = "임시 비밀번호 유효시간이 지났습니다.\\n임시 비밀번호를 다시 재발급 받으시길 바랍니다.";
                    returnUrl = encodingUrl;
                }
                // 회원 > Excpetion 에러
                else if(loginStateCode == 99)  
                {    
                    alertMsg = "회원 로그인 도중 알 수 없는 에러가 발생했습니다.\\n문제가 계속 되면 관리자에게 문의해주세요.";
                    returnUrl = encodingUrl;
                }
                // 회원 > 데이터 누락  
                else   
                {   
                    alertMsg = "데이터 누락으로 회원 로그인에 실패하셨습니다.\\n문제가 계속 되면 관리자에게 문의해주세요.";
                    returnUrl = encodingUrl;
                }
                
                mv.addObject("resultMap", resultMap);
            }
            /* ************************************************************************************************************************************************ */
            /* ********************************************************** 비회원 로그인 시작 ****************************************************************** */
            else if ("order_guest".equals(roleUser))
            {
                logger.info("############################################ 비회원 로그인 시작 ############################################");
                String nonloginOrdCd = StringUtil.upperCase(StringUtil.getString(commandMap.get("ORD_MST_CD"), ""));      // 비회원 주문번호
                String nonloginOrdNm = StringUtil.getString(StringUtil.getString(commandMap.get("ORD_MST_ORD_NM"), ""));  // 비회원 주문자명
                  
                // 비회원 주문번호 필요
                if("".equals(nonloginOrdCd)) 
                {
                    user.setLoginStateCode(Code.LOGIN_ORD_CODE_INVALID);
                    user.setROLE_USER(ROLEUSER.order_guest);
                } 
                // 비회원 주문자명 필요
                else if("".equals(nonloginOrdNm)) 
                {
                    user.setLoginStateCode(Code.LOGIN_NON_MEM_NM_INVALID);
                    user.setROLE_USER(ROLEUSER.order_guest);
                }
                else
                {
                    user.setORD_MST_CD(nonloginOrdCd); 
                    user.setORD_MST_ORD_NM(nonloginOrdNm);
                    user.setROLE_USER(ROLEUSER.order_guest);
                    loginCheck = true;
                }
                  
                if(loginCheck)
                {
                    try
                    {
                        // 로그인
                        user = this.pcLoginManagerService.loginManagerProc(request, user, response);
                    }
                    catch(Exception e)
                    {
                        // 로그인 세션 삭제
                        SessionsUser.setSessionClear(request);  
                        // Excpetion 에러 loginStateCode 99 설정
                        loginStateCode = 99;
                        
                        e.printStackTrace();  
                        logger.info("############################## 비회원 로그인 Excpetion 에러 ##############################");
                    }
                }
                
                /*------------------------------------------------------------------------------------------------------------*/
                /* ---------------------------------- 비회원 loginStateCode : 코드 시작 ------------------------------------- */
                // 비회원 로그인 상태 값     
                loginStateCode = user.getLoginStateCode();  
                logger.info("--> 비회원 로그인 상태 값 > loginStateCode : " + loginStateCode );
                
                // 비회원 > 로그인 성공
                if(loginStateCode == Code.LOGIN_NON_MEM_SUCCESS) 
                {
                    // 비회원은 로그인 성공시 URL이 고정으로 설정되었기 때문에 returnUrl 필요없음
                    returnUrl = StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/nonMember/gestDeliveryList.do";
                }       
                // 비회원 > 주문번호 필요
                else if(loginStateCode == Code.LOGIN_ORD_CODE_INVALID)
                {
                    alertMsg = "주문번호를 확인해 주십시오.";
                }
                // 비회원 > 주문자명 필요
                else if(loginStateCode == Code.LOGIN_NON_MEM_NM_INVALID)
                {
                    alertMsg = "주문자명을 확인해 주십시오.";
                }
                // 비회원 > 주문자번호가 틀린경우
                else if(loginStateCode == Code.LOGIN_ORD_CODE_NULL)
                {
                    alertMsg = "주문 정보가 없습니다.\\n주문 정보를 확인 하신 후 입력해 주십시오.";
                }
                // 비회원 > 주문자명이 틀린경우
                else if(loginStateCode == Code.LOGIN_NON_MEM_NM_INCORRECT)
                {
                    alertMsg = "주문하신 주문자명과 일치하지 않습니다.\\n주문자명을 확인해 주십시오.";
                }
                // 비회원 > Excpetion 에러
                else if(loginStateCode == 99)  
                {    
                    alertMsg = "비회원 로그인 도중 알 수 없는 에러가 발생했습니다.\\n문제가 계속 되면 관리자에게 문의해주세요.";
                }
                // 비회원 > 데이터 누락  
                else   
                {   
                    alertMsg = "데이터 누락으로 비회원 로그인에 실패하셨습니다.\\n문제가 계속 되면 관리자에게 문의해주세요.";
                }  
                
            }
            /* ************************************************************************************************************************************************ */
            /* *********************************************************** SNS 로그인 시작 ******************************************************************** */
            else if ("sns".equals(roleUser))
            {
                logger.info("############################################# SNS 로그인 시작 #############################################");
                String snsLoginId = StringUtil.getString(commandMap.get("MEM_SNS_ID"), "");  // SNS 아이디(고유 KEY)
                  
                String snsLoginMsg = "";    
                
                // SNS 아이디(고유 KEY) 필요
                if("".equals(snsLoginId)) 
                {
                    user.setLoginStateCode(Code.LOGIN_SNS_ID_INVALID);
                    user.setROLE_USER(ROLEUSER.user);  
                }    
                else     
                {
                    user.setMEM_SNS_ID(snsLoginId);
                    user.setROLE_USER(ROLEUSER.user);
                    loginCheck = true; 
                }
              
                if(loginCheck)
                {
                    try
                    { 
                        // SNS 로그인
                        user = this.pcLoginManagerService.loginSnsManagerProc(request, user, response);
                    }    
                    catch(Exception e)
                    {
                        // 로그인 세션 삭제
                        SessionsUser.setSessionClear(request);  
                        // Excpetion 에러 loginStateCode 99 설정
                        loginStateCode = 99;
                        
                        e.printStackTrace();  
                        logger.info("############################## SNS 로그인 Excpetion 에러 ##############################");
                    }
                }
                
                /*------------------------------------------------------------------------------------------------------------*/
                /* ----------------------------------- SNS loginStateCode : 코드 시작 --------------------------------------- */
                // SNS 로그인 상태 값  
                loginStateCode = user.getLoginStateCode();    
                logger.info("--> SNS 로그인 상태 값 > loginStateCode : " + loginStateCode );
               
                // SNS > 로그인 성공
                if(loginStateCode == Code.LOGIN_SNS_SUCCESS) 
                {   
                    //snsLoginMsg = StringUtil.getString("MEM_SNS_TYPE").toUpperCase() + "(으)로 로그인 하셨습니다.";    
                }             
                // SNS > 아이디(고유 KEY) 필요  
                else if(loginStateCode == Code.LOGIN_SNS_ID_INVALID)  
                { 
                    alertMsg = "SNS 로그인 인증에 실패하셨습니다.\\n다시 한번 로그인해주세요.";
                    returnUrl = encodingUrl;
                }
                // SNS > 미가입 상태 > 회원가입 페이지로 처리
                else if(loginStateCode == Code.LOGIN_ID_NULL)  
                {       
                    snsLoginMsg = "해당 SNS 인증으로 미가입 상태입니다.\\n회원가입 페이지로 이동합니다.";
                    returnUrl = StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/member/joinMemType.do";  
                }                   
                // SNS > Excpetion 에러
                else if(loginStateCode == 99)  
                {    
                    alertMsg = "SNS 로그인 도중 알 수 없는 에러가 발생했습니다.\\n문제가 계속 되면 관리자에게 문의해주세요.";
                    returnUrl = encodingUrl;
                }
                // SNS > 데이터 누락
                else   
                { 
                    alertMsg = "데이터 누락으로 SNS 로그인에 실패하셨습니다.\\n문제가 계속 되면 관리자에게 문의해주세요.";
                    returnUrl = encodingUrl;
                }  

                mv.addObject("snsLoginMsg", snsLoginMsg);    
            }  
            
            /* ------------------ 공통 ------------------ */
            mv.addObject("commandMap", commandMap);     
            mv.addObject("returnUrl", returnUrl);     
            mv.addObject("alertMsg", alertMsg);  
            mv.addObject("pageType", pageType);
            //mv.setViewName("pc/common/result");
            mv.setViewName("pc/manager/loginProc");
            /* ------------------ 공통 ------------------ */
        }
        
        return mv;
    }
	  
    /**
     * <pre>
     * 1. MethodName	: logout
     * 2. ClassName		: LoginManagerController.java
     * 3. Comment    	: 프론트 > 로그아웃을 처리한다. 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 1. 오후 5:17:31
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	/**
     * @api {post} /pc/manager/logout
     * @apiName 로그아웃
     * @apiGroup 로그아웃
     * @apiSuccess {String} returnUrl 로그인 성공 이후 돌아가는 페이지 
     */
	@FrontBannerSkip()
    @RequestMapping("/pc/manager/logout")
    public ModelAndView logout (HttpServletRequest request, Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        // 로그인 세션 삭제
        SessionsUser.setSessionClear(request);
        
        // 쿠키 삭제 
        Cookie del_cookie = new Cookie("front_user_cookie", "");
        del_cookie.setMaxAge(0); 
        del_cookie.setPath("/");
  		response.addCookie(del_cookie);
  		
        mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
        // 해당 브랜드로 이동
        mv.setViewName("pc/common/result");
        
        return mv;
    }

    /**
    * <pre>
    * 1. MethodName : clearRestMember
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 휴면회원 > 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/manager/clearRestMember")
    public ModelAndView clearRestMember (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
    		// 휴면회원정보
    		Map<String,Object> resultMap = this.pcLoginManagerService.selectRestMemberInfo(request,commandMap);
    		// 결과 값
			int result = Integer.valueOf(StringUtil.getString(resultMap.get("result"),""));
    		 
    		if(result == -99)
    		{
	            
	            mv.setViewName("/pc/common/result");
    		}
    		else if(result == 00)
    		{
    			logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/manager/logout.do");
	            
	            mv.setViewName("/pc/common/result");
    		}
    		else
    		{
    			mv.addObject("restMemberInfo", resultMap);	
    		}
    	}
	    else
	    {
	    	throw new PcAuthenticationException();
	    }
    	
    	return mv;
    }
    
    @RequestMapping("/pc/manager/myInfoSearch")
    public ModelAndView myInfoSearch (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");
        }		
		mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : idFind
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디 찾기
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/manager/idFind")
    public ModelAndView idFind (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("pc/common/result");
        }
		/*
    	else
		{
			// BIZSIREN 본인인증 DATA 생성
			String reqInfo = sirenCert.getSirenCertReqInfo(request, response, "");
			// 본인실명확인 결과수신 URL
			String retUrl   = "32" + StringUtil.getString(request.getAttribute("serverSslDomain"),"") + propertiesService.getString("siren.idCertReturnUrl");
			
			mv.addObject("reqInfo", reqInfo);
			mv.addObject("retUrl", retUrl);
			mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));
			
			// BIZSIREN IPIN 본인인증 DATA 생성
			String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
			
			// I-PIN 본인실명확인 결과수신 URL
			String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("serverSslDomain"),"") + propertiesService.getString("ipin.idCertReturnUrl") + "?gubun=ID";
			
			mv.addObject("ipinReqInfo", ipinReqInfo);
			mv.addObject("ipinRetUrl", ipinRetUrl);
			mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));
		}
		*/
		
		mv.addObject("commandMap", commandMap);
    	
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : idSirenResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디찾기 > siren 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/idSirenResResult")
    public ModelAndView idSirenResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
		
		// 사이렌 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenInfo = sirenCert.getSirenCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenInfo.get("ci1"));			// CI값
		commandMap.put("MEM_MST_MEM_NM", sirenInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenInfo.get("birYMD"));	// 생년월일
		
		// 인증 접근 실패
		if("N".equals(sirenInfo.get("msgChk")))
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증 접근 성공
		else
		{
			// 인증성공여부 (Y: 성공 / N : 실패 / F : 3회오류)
			String result = StringUtil.getString(sirenInfo.get("result"),"");	
			
			// 성공
			if("Y".equals(result))
			{
				// 회원 정보 조회(CI값으로)
				Map<String,Object> searchSirenMemberInfo = this.pcLoginManagerService.selectCertifyInfo(commandMap);
				
				if(searchSirenMemberInfo == null)
				{
					mv.addObject("resultMsg", "일치하는 회원이 없습니다.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/idFind.do?gubun=ID");
				}
				else
				{
					mv.addObject("resultMsg", "본인 인증 처리되었습니다.");
					commandMap.put("gubun", sirenInfo.get("addVar"));				// 본인인증 페이지 구분값(아이디찾기 - ID)
					commandMap.put("MEM_MST_MEM_ID", FormatUtil.markingId(StringUtil.getString(searchSirenMemberInfo.get("MEM_MST_MEM_ID"),"")));
					mv.addObject("commandMap", commandMap);
					
				}
				
			}
			// 실패
			else if("N".equals(result))
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
			// 3회오류
			else if("F".equals(result))
			{
				mv.addObject("closeMsg", "본인 인증 3회 오류가 발생하였습니다.");
			}
			else
			{
				mv.addObject("closeMsg", "알수 없는 오류가 발생하였습니다.");
			}
		}
		
		mv.setViewName("/pc/member/sirenResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : idSirenIpinResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디찾기 > siren I-PIN 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/idSirenIpinResResult")
    public ModelAndView idSirenIpinResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();

		//사이렌 I-PIN 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenIpinInfo = sirenCert.getSirenIpinCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenIpinInfo.get("ciscrHash"));	// CI값
		commandMap.put("MEM_MST_MEM_NM", sirenIpinInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenIpinInfo.get("birth"));	// 생년월일
		
		// 인증 접근 실패
		if("N".equals(sirenIpinInfo.get("msgChk")))
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증 접근 성공
		else
		{
			// 인증성공여부 (1:성공)
			String result = StringUtil.getString(sirenIpinInfo.get("result"),"");	

			// 성공
			if("1".equals(result))
			{
				// 회원 정보 조회(CI값으로)
				Map<String,Object> searchSirenIpinMemberInfo = this.pcLoginManagerService.selectCertifyInfo(commandMap);
				
				if(searchSirenIpinMemberInfo == null)
				{
					mv.addObject("resultMsg", "일치하는 회원이 없습니다.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/idFind.do?gubun=ID");
				}
				else
				{
					mv.addObject("resultMsg", "본인 인증 처리되었습니다.");
					commandMap.put("gubun", request.getParameter("gubun"));		// 본인인증 페이지 구분값(아이디찾기 - ID)
					commandMap.put("MEM_MST_MEM_ID", FormatUtil.markingId(StringUtil.getString(searchSirenIpinMemberInfo.get("MEM_MST_MEM_ID"),"")));
					mv.addObject("commandMap", commandMap);
				}
			}
			// 실패
			else
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
		}
		
		mv.setViewName("/pc/member/sirenIpinResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv; 
    }
    
    /**
    * <pre>
    * 1. MethodName : idFindResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디찾기 > 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/manager/idFindResult")
    public ModelAndView idFindResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
		Map<String,Object> searchSimpleMemInfo = this.pcLoginManagerService.selectCertifyIntegrationUserInfo(commandMap);
		
		if(searchSimpleMemInfo==null) {
			mv.addObject("confirmMsg", "귀하는 아이디가 존재하지 않습니다. 지금 회원가입 하시겠습니까?");
			mv.addObject("noReturnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/myInfoSearch.do");
			mv.addObject("yesReturnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
			mv.setViewName("/pc/common/result_confirm");
			return mv;
		}
		
		commandMap.clear();
		commandMap.put("MEM_MST_MEM_NM", StringUtil.getString(searchSimpleMemInfo.get("MEM_MST_MEM_NM"),""));
		commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(searchSimpleMemInfo.get("MEM_MST_MEM_ID"),""));
		
		if(searchSimpleMemInfo.get("MEM_CPR_MEM_ID")!=null) {
			commandMap.put("memType","memberBusiness");
		}
		else if(searchSimpleMemInfo.get("MEM_SNS_ID")!=null) {
			commandMap.put("memType","memberSns");
			commandMap.put("snsType", StringUtil.getString(searchSimpleMemInfo.get("MEM_SNS_TYPE"),""));
		}
		mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : pwFind
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호 찾기
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/manager/pwFind")
    public ModelAndView pwFind (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("pc/common/result");
        }
		else
		{
			/*
			// BIZSIREN 본인인증 DATA 생성
			String reqInfo; = commandMap.getString() //sirenCert.getSirenCertReqInfo(request, response, "");
			// 본인실명확인 결과수신 URL
			String retUrl   = "32" + StringUtil.getString(request.getAttribute("serverSslDomain"),"") + propertiesService.getString("siren.pwCertReturnUrl");
			
			mv.addObject("reqInfo", reqInfo);
			mv.addObject("retUrl", retUrl);
			mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));
			
			// BIZSIREN IPIN 본인인증 DATA 생성
			String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
			
			// I-PIN 본인실명확인 결과수신 URL
			String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("serverSslDomain"),"") + propertiesService.getString("ipin.pwCertReturnUrl") + "?gubun=PW";
			
			mv.addObject("ipinReqInfo", ipinReqInfo);
			mv.addObject("ipinRetUrl", ipinRetUrl);
			mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));
			*/
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : pwSirenResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호찾기 > siren 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/pwSirenResResult")
    public ModelAndView pwSirenResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
		
		// 사이렌 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenInfo = sirenCert.getSirenCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenInfo.get("ci1"));			// CI값
		commandMap.put("MEM_MST_MEM_NM", sirenInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenInfo.get("birYMD"));	// 생년월일
		
		// 인증 접근 실패
		if("N".equals(sirenInfo.get("msgChk")))
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증 접근 성공
		else 
		{
			// 인증성공여부 (Y: 성공 / N : 실패 / F : 3회오류)
			String result = StringUtil.getString(sirenInfo.get("result"),"");	
			
			// 성공
			if("Y".equals(result))
			{
				// 회원 정보 조회(CI값으로)
				Map<String,Object> searchSirenMemberInfo = this.pcLoginManagerService.selectCertifyInfo(commandMap);
				
				if(searchSirenMemberInfo == null)
				{
					mv.addObject("resultMsg", "일치하는 회원이 없습니다.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/pwFind.do?gubun=PW");
				}
				else
				{
					mv.addObject("resultMsg", "본인 인증 처리되었습니다.");
					commandMap.put("gubun", sirenInfo.get("addVar"));				// 본인인증 페이지 구분값(비밀번호찾기 - PW)
					commandMap.put("RST_YN", searchSirenMemberInfo.get("RST_YN"));	// 휴면여부
					mv.addObject("commandMap", commandMap);
				}
				
			}
			// 실패
			else if("N".equals(result))
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
			// 3회오류
			else if("F".equals(result))
			{
				mv.addObject("closeMsg", "본인 인증 3회 오류가 발생하였습니다.");
			}
			else
			{
				mv.addObject("closeMsg", "알수 없는 오류가 발생하였습니다.");
			}
		}
		
		mv.setViewName("/pc/member/sirenResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : pwSirenIpinResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호찾기 > siren I-PIN 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/pwSirenIpinResResult")
    public ModelAndView pwSirenIpinResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();

		//사이렌 I-PIN 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenIpinInfo = sirenCert.getSirenIpinCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenIpinInfo.get("ciscrHash"));	// CI값
		commandMap.put("MEM_MST_MEM_NM", sirenIpinInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenIpinInfo.get("birth"));	// 생년월일
		
		// 인증 접근 실패
		if("N".equals(sirenIpinInfo.get("msgChk")))
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증 접근 성공
		else
		{
			// 인증성공여부 (1:성공)
			String result = StringUtil.getString(sirenIpinInfo.get("result"),"");	

			// 성공
			if("1".equals(result))
			{
				// 회원 정보 조회(CI값으로)
				Map<String,Object> searchSirenIpinMemberInfo = this.pcLoginManagerService.selectCertifyInfo(commandMap);
				
				if(searchSirenIpinMemberInfo == null)
				{
					mv.addObject("resultMsg", "일치하는 회원이 없습니다.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/pwFind.do?gubun=PW");
				}
				else
				{
					mv.addObject("resultMsg", "본인 인증 처리되었습니다.");
					commandMap.put("gubun", request.getParameter("gubun"));		// 본인인증 페이지 구분값(비밀번호찾기 - PW)
					commandMap.put("RST_YN", searchSirenIpinMemberInfo.get("RST_YN"));	// 휴면여부
					mv.addObject("commandMap", commandMap);
				}
				
			}
			// 실패
			else
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
		}
		
		mv.setViewName("/pc/member/sirenIpinResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv; 
    }
   
    /**
    * <pre>
    * 1. MethodName : checkMemInfoAjax
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호찾기 > 통합회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/checkMemInfoAjax")
    public JSON checkMemInfoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "")) && !"".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_NM"), "")))
        {
            // 비밀번호 찾기 통합회원정보 검색
            int memInfoCount = this.pcLoginManagerService.selectCheckBasicMemInfoCount(commandMap);
            
            if( memInfoCount > 0)
            {
                json.put("resultYn", "Y");
            }
            else
            {
                json.put("resultYn", "N");
            }
            
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
    }
    /**
    * <pre>
    * 1. MethodName : pwFindResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호 찾기 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    /**
     * @api {POST} /pc/manager/pwFindResult
     * @apiName 비밀번호찾기
     * @apiGroup 회원 
     * @apiParam {String} MEM_MST_MEM_ID 회원아이디
     * @apiParam {String} MEM_MST_MEM_NM 회원명
     * @apiParam {String} MEM_IPN_CI 본인인증결과
     * @apiParam {String} memType 회원유형 ex."memberSimple" 
     */
    
    @RequestMapping("/pc/manager/pwFindResult")
     public ModelAndView pwFindResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
     {
    	ModelAndView mv = new ModelAndView();
    	
    	// 회원구분 (통합,간편,기업)
    	String memType = StringUtil.getString(commandMap.get("memType"),"");
    	
    	Map<String,Object> checkMemInfo = new HashMap<String, Object>();
    	
    	int result = 0;
    	
    	// 간편회원의 경우
    	if("memberSimple".equals(memType))
    	{
    		// 간편회원정보 조회
    		checkMemInfo = this.pcLoginManagerService.selectCheckSimpleMemInfo(commandMap);
    	}
    	// 기업회원의 경우
    	else if("memberBusiness".equals(memType))
    	{
    		// 기업회원정보조회
    		checkMemInfo = this.pcLoginManagerService.selectCheckBusinessMemInfo(commandMap);
    	}
    	else {
    		checkMemInfo = this.pcLoginManagerService.selectCheckSimpleMemInfoByCertInfo(commandMap);
    	}
    	
    	if(checkMemInfo == null)
		{
			mv.addObject("confirmMsg", "귀하는 아이디가 존재하지 않습니다. 지금 회원가입 하시겠습니까?");
			mv.addObject("noReturnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/myInfoSearch.do?gubun=PW");
			mv.addObject("yesReturnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
			mv.setViewName("/pc/common/result_confirm");
			return mv;
		}
    	String snsType = StringUtil.getString(checkMemInfo.get("MEM_SNS_TYPE"));
    	if(!StringUtil.isEmpty(snsType)) {
    		String MEM_MST_MEM_NM = StringUtil.getString(checkMemInfo.get("MEM_MST_MEM_NM"));
    		String alertMsg = MEM_MST_MEM_NM+"님은 "+snsType+" 회원으로 비밀번호를 찾을 수 없습니다.";
    		mv.addObject("alertMsg", alertMsg);
			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/myInfoSearch.do?gubun=PW");
			mv.setViewName("/pc/common/result");
    		return mv;
    	}
		commandMap.put("checkMemInfo", checkMemInfo);
    	HttpSession session = request.getSession();
    	session.removeAttribute(Code.PW_FIND_SESSION_KEY);
    	session.setAttribute(Code.PW_FIND_SESSION_KEY, commandMap);
    	return mv;
    	
    	
     }
    
     /**
    * <pre>
    * 1. MethodName : changeMemPw
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호 찾기 결과 > 통합회원 > 비밀번호 변경
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    /**
     * @api {POST} /pc/manager/pwFindResult
     * @apiName 비밀번호변경
     * @apiGroup 회원 
     * @apiParam {String} MEM_MST_PW 회원아이디
     */
    @RequestMapping ("/pc/manager/changeMemPw")
     public ModelAndView changeMemPw (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
     {
    	ModelAndView mv = new ModelAndView();
		
    	HttpSession session = request.getSession();
    	Map<String,Object> pwSessionMap = (Map<String,Object>)session.getAttribute(Code.PW_FIND_SESSION_KEY);
    	
    	Iterator i = pwSessionMap.keySet().iterator();
    	while(i.hasNext()) {
    		String sessionkey = (String)i.next();
    		commandMap.put(sessionkey, pwSessionMap.get(sessionkey));
    	}
    	
    	if(pwSessionMap!=null && !pwSessionMap.isEmpty()) {
    		String MEM_MST_PW = StringUtil.getString(commandMap.get("MEM_MST_PW"), "");
    		if(!"".equals(MEM_MST_PW))  
        	{
    			//비밀번호 암호화
    			commandMap.put("MEM_MST_PW", LoginPasswordCipher.CipherPassword(MEM_MST_PW));
        		// 통합회원 > 비밀번호 변경
        		int result = this.pcLoginManagerService.updateBasicMemPw(request, commandMap);
                
        		// view Page Info
                if(result > 0)
                {
                    mv.addObject("alertMsg", "비밀번호가 변경되었습니다.");
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
                }
                else
                {
                	if(result == -1)
                	{
                		mv.addObject("alertMsg", "회신할 수 있는 이메일정보가 없습니다.\n 고객센터에 문의해주시기 바랍니다.");
                	}
                	else
                	{
                		mv.addObject("alertMsg", "비밀번호 변경에 실패하였습니다.");
                	}
                	
                    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
                }
        	}
    	} 
    	else {
    		mv.addObject("alertMsg", "잘못된 접근입니다.");
    		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
    	}
		
    	mv.addObject("commandMap", commandMap);
        mv.setViewName("/pc/common/result");
        
		return mv;
     }
    
    /**
     * @api {POST} /pc/manager/memberPasswordChange
     * @apiName 비밀번호변경
     * @apiGroup 회원 
     * @apiParam {String} MEM_MST_PW 회원아이디
     */
    @RequestMapping ("/pc/manager/memberPasswordChange")
     public ModelAndView memberPasswordChange (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
     {
    	ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
    	User user = SessionsUser.getSessionUser(request);
    	commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		if(SessionsUser.isLogin(request) && !"".equals(StringUtil.getString(commandMap.get("MEM_MST_PW_OLD"), "")))  
    	{
			String passwordOld = LoginPasswordCipher.CipherPassword(StringUtil.getString(commandMap.get("MEM_MST_PW_OLD")));
			String passwordRe = LoginPasswordCipher.CipherPassword(StringUtil.getString(commandMap.get("MEM_MST_PW_RE")));
			String password = LoginPasswordCipher.CipherPassword(StringUtil.getString(commandMap.get("MEM_MST_PW")));
			commandMap.put("MEM_MST_PW", password);
			commandMap.put("MEM_MST_PW_OLD", passwordOld);
			commandMap.put("MEM_MST_PW_RE", passwordRe);
    		// 통합회원 > 비밀번호 변경
    		int result = this.pcLoginManagerService.updateMemberRegularPasswordChange(request, commandMap);
            
    		// view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "비밀번호가 변경되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
            }
            else
            {
            	if(result == -1)
            	{
            		mv.addObject("alertMsg", "회신할 수 있는 이메일정보가 없습니다.\n 고객센터에 문의해주시기 바랍니다.");
            	}
            	else
            	{
            		mv.addObject("alertMsg", "비밀번호 변경에 실패하였습니다.");
            	}
            	
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
            }
    	}
    	else {
    		mv.addObject("alertMsg", "잘못된 접근입니다.");
    		mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
    	}
		
    	mv.addObject("commandMap", commandMap);
        mv.setViewName("/pc/common/result");
        
		return mv;
     }
    
    
    /**
     * @api {POST} /pc/manager/pwskip
     * @apiName 비밀번호 다음에 변경
     * @apiGroup 회원 
     */
    @FrontBannerSkip()
    @RequestMapping("/pc/manager/pwskip")
    public ModelAndView pwChangeSkip (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!SessionsUser.isLogin(request)) { 
        	mv.addObject("alertMsg", "잘못된 접근입니다.");
    		return mv;
        }
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        pcLoginManagerService.checkPwSkip(commandMap);
        mv.addObject("alertMsg", "다음에 변경하기를 선택하셨습니다.");
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
        mv.setViewName("/pc/common/result");
        return mv;
    }
    
    /**
     * @api {GET} /pc/manager/offline
     * @apiName 통합회원전환
     * @apiGroup 회원 
     */
    @RequestMapping("/pc/manager/offline")
    public ModelAndView offline (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
    
    /**
     * @api {GET} /pc/manager/pwChangeForm
     * @apiName 비밀번호 변경기간에의한 변경
     * @apiGroup 회원 
     */
    @RequestMapping("/pc/manager/pwChangeForm")
    public ModelAndView pwChangeForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
    
}
 