package com.market.mall.mobile.manager.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
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
 * @PackageName: com.market.mall.mobile.manager.controller
 * @FileName : LoginManagerController.java
 * @Date : 2014. 7. 22.
 * @프로그램 설명 	: 모바일 > 사용자 로그인을 처리하는 Controller Class
 * @author LJH
 */
@Controller("mobileLoginManagerController")
@AccessLevelUser(ROLEUSER.guest)
public class LoginManagerController {

    @Resource(name="pcLoginManagerService")
    private LoginManagerService pcLoginManagerService;
    
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
    @Resource
	private CartService cartService;
    
    @Resource(name="productListService") 	private ProductListService productListService;
    
    @Resource(name="pcJoinMemberService") private JoinMemberService pcJoinMemberService;
    
    @Resource(name="propertiesService") protected EgovPropertyService propertiesService;    
    
    @Resource(name="snsManagerService")     private SnsManagerService snsManagerService;
    
    
    @Autowired
	private SirenCert sirenCert;
    
//    @Resource(name="mobileBannerDisplayService")
//    private BannerDisplayService mobileBannerDisplayService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * 
     * <pre>
     * 1. MethodName	: login
     * 2. ClassName		: LoginManagerController.java
     * 3. Commnet		: 모바일 > 로그인
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 22. 오후 4:42:00
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
    @RequestMapping("/mobile/manager/login") 
    public ModelAndView login (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
			mv.addObject("commandMap", commandMap);
            mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
        }
        else
        {
        	// 배너목록 가져오기
        	Map<String, Object> bannerMap = new HashMap<String, Object>();
        	bannerMap.put("BANNER_IDX", Code.MOBILE_LOGIN_BANNER);
        	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
        	bannerMap.put("BNR_MST_ENV", "M");
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
        	
    		// 해당 브랜드로 이동
            mv.setViewName("mobile/manager/login");

    		mv.addObject("commandMap", commandMap);
        }
        
        return mv;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: loginProc
     * 2. ClassName		: LoginManagerController.java
     * 3. Comment    	: 모바일 > 로그인을 처리한다. 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 22. 오후 4:42:37
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@FrontBannerSkip()
    @RequestMapping("/mobile/manager/loginProc")
    public ModelAndView loginProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        User user = new User();
        
        String roleUser = StringUtil.getString(commandMap.get("ROLE_USER"), "guest");
        
        String loginId = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "").trim();
        String loginPwd = StringUtil.getString(commandMap.get("MEM_MST_WEB_PWD"), "");
        loginPwd = LoginPasswordCipher.CipherPassword(loginPwd);
        
        String loginOrdMstCd = StringUtil.upperCase(StringUtil.getString(commandMap.get("ORD_MST_CD"), "").trim());
        String loginNonMemNm = StringUtil.getString(commandMap.get("ORD_MST_ORD_NM"), "").trim();
        
        String pageStatus = StringUtil.getString(commandMap.get("pageStatus"), "");
        
        String returnUrl = URLDecoder.decode(StringUtil.getString(commandMap.get("url"), ""),"UTF-8");
        String url = returnUrl;
        
        Map<String,Object> resultMap = new HashMap<String, Object>();	// 파라미터
        
        boolean loginCheck = false;
        /**
         * 회원 로그인 
         */
        if("user".equals(roleUser))
        {
            if("".equals(loginId)) // 아이디 필요
            {
                user.setLoginStateCode(Code.LOGIN_ID_INVALID);
                user.setROLE_USER(ROLEUSER.user);
            } 
            else if("".equals(loginPwd)) // 비밀번호 필요
            {
                user.setLoginStateCode(Code.LOGIN_PW_INVALID);
                user.setROLE_USER(ROLEUSER.user);
            }
            else  
            {
                user.setMEM_MST_MEM_ID(loginId);
                user.setMEM_MST_WEB_PWD(loginPwd);
                user.setROLE_USER(ROLEUSER.user);
                loginCheck = true;
            }
        }
        /**
         * 비회원 로그인 
         */
        else if ("order_guest".equals(roleUser))
        {
            if("".equals(loginOrdMstCd)) // 비회원 주문번호 필요
            {
                user.setLoginStateCode(Code.LOGIN_ORD_CODE_INVALID);
                user.setROLE_USER(ROLEUSER.order_guest);
            } 
            else if("".equals(loginNonMemNm)) // 비회원 주문자명 필요
            {
                user.setLoginStateCode(Code.LOGIN_NON_MEM_NM_INVALID);
                user.setROLE_USER(ROLEUSER.order_guest);
            }
            else
            {
                user.setORD_MST_CD(loginOrdMstCd);
                user.setORD_MST_ORD_NM(loginNonMemNm);
                user.setROLE_USER(ROLEUSER.order_guest);
                
                loginCheck = true;
                
            }
        }
        
        if(loginCheck)
        {
            // 로그인
            user = this.pcLoginManagerService.loginManagerProc(request, user, response);

            mv.addObject("user", user);
            
            if(user.getLoginStateCode()==Code.LOGIN_SUCCESS)
            {
            	// callback function
//                mv.addObject("parentFunction", request.getSession().getAttribute("_CallFunctionAfterLogin"));
//                request.getSession().setAttribute("_CallFunctionAfterLogin", null);	
                try
                {
                	// 장바구니 정보 변경
                    commandMap.put("user", user);
                    commandMap.put("session_id", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));
                    this.cartService.updateCartOwner(commandMap);
                    // 임시주문 정보 변경
                    this.cartService.updateTempOrderOwner(commandMap);
                    
                    if("Y".equals(user.getLOGIN_PIT_YN()))
                    {
                    	if(StringUtil.getInt(user.getMEM_MST_MEM_GBN()) == Code.COMMON_PRI_MEMBER_GRADE)
                    	{
                    		// 포인트 지급
                            this.pcLoginManagerService.insertLoginPoint(commandMap);
                    	}
                    }
                }
                catch(Exception e)
                {
                	e.printStackTrace();
                	logger.info("###### 에러 발생 #######");
                }
            }
        }
        
        /*************** 로그인 상태에 관한 alert메세지 시작 ***************/
        // 로그인 상태값
        int loginStateCode = user.getLoginStateCode();
        // 메세지
        String alertMsg = "";
        
        logger.info("################loginStateCode : " + loginStateCode );
        
        // 아이디 필요
        if(loginStateCode == Code.LOGIN_ID_INVALID)
        {
        	alertMsg = "아이디를 확인해 주십시오.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 비밀번호 필요
        else if(loginStateCode == Code.LOGIN_PW_INVALID)
        {
        	alertMsg = "비밀번호를 확인해 주십시오.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 아이디가 틀렸을 경우
        else if(loginStateCode == Code.LOGIN_ID_NULL)
        {
        	alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 비밀번호가 틀렸을 경우
        else if(loginStateCode == Code.LOGIN_PW_INCORRECT)
        {
        	alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 블랙리스트 
        else if(loginStateCode == Code.LOGIN_STOP_LOGIN)
        {
        	alertMsg = "일치하는 회원이 없습니다.\\n고객센터로 연락바랍니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 로그인 오류
        else if(loginStateCode == Code.LOGIN_FAIL)
        {
        	alertMsg = "데이터 오류입니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 탈퇴회원
        else if(loginStateCode == Code.LOGIN_SITE_NOT_ACCESS)
        {
        	alertMsg = "일치하는 회원이 없습니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 임시 비밀번호 유효기간이 지난 회원
        else if(loginStateCode == Code.LOGIN_PASS_EFFECTIVE_TIME)
        {
        	alertMsg = "임시 비밀번호 유효시간이 지났습니다.\\n임시 비밀번호를 다시 재발급 받으시길 바랍니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 주문번호 필요
        else if(loginStateCode == Code.LOGIN_ORD_CODE_INVALID)
        {
        	alertMsg = "주문번호를 확인해 주십시오.";
        }
        // 주문자명 필요
        else if(loginStateCode == Code.LOGIN_NON_MEM_NM_INVALID)
        {
        	alertMsg = "주문자명을 확인해 주십시오.";
        }
        // 주문자번호가 틀린경우
        else if(loginStateCode == Code.LOGIN_ORD_CODE_NULL)
        {
        	alertMsg = "주문 정보가 없습니다.\\n주문 정보를 확인 하신 후 입력해 주십시오.";
        }
        // 주문자명이 틀린경우
        else if(loginStateCode == Code.LOGIN_NON_MEM_NM_INCORRECT)
        {
        	alertMsg = "주문하신 주문자명과 일치하지 않습니다.\\n주문자명을 확인해 주십시오.";
        }
        /*************** 로그인 상태에 관한 alert메세지 끝 ***************/
        // 로그인에 성공 했을 경우
        else if(loginStateCode == Code.LOGIN_SUCCESS)
        {
        	logger.info("######################returnUrl : " + returnUrl);
            // 아이디 저장 유무
            user.setSaveId(StringUtil.getString(commandMap.get("saveId"), "N"));
            // 자동로그인 유무
            user.setAutoLoginYn(StringUtil.getString(commandMap.get("autoLoginYn"),"N"));
            resultMap.put("DUMMY_MEM_ID", user.getMEM_MST_MEM_ID());
            
        	/*************** 쿠키에 담기 시작 ********************/
            // 아이디 저장
            if("Y".equals(user.getSaveId()))
        	{
        		Cookie cookieEtlandUserId = new Cookie("cookieEtlandUserId", user.getMEM_MST_MEM_ID());
        		cookieEtlandUserId.setMaxAge(30*24*60*60);
        		response.addCookie(cookieEtlandUserId);
        	}
            else
            {
            	//아이디 저장 삭제
            	Cookie cookieEtlandUserId = new Cookie("cookieEtlandUserId", null);
            	cookieEtlandUserId.setMaxAge(0);
            	response.addCookie(cookieEtlandUserId);
            }
            
        	// 자동로그인
        	if("Y".equals(user.getAutoLoginYn()))
        	{
        		Cookie cookieEtlandUserAutoLogin = new Cookie("cookieEtlandUserAutoLogin", user.getMEM_MST_MEM_ID());
        		cookieEtlandUserAutoLogin.setMaxAge(90*24*60*60);
        		cookieEtlandUserAutoLogin.setPath("/");
        		response.addCookie(cookieEtlandUserAutoLogin);
        	}
        	else
        	{
        		// 자동로그인 삭제
        		Cookie cookieEtlandUserAutoLogin = new Cookie("cookieEtlandUserAutoLogin", null);
        		cookieEtlandUserAutoLogin.setMaxAge(0);
        		response.addCookie(cookieEtlandUserAutoLogin);
        	}
        	/*************** 쿠키에 담기 끝 *******************/
        	
        	int memGbn = StringUtil.getInt(user.getMEM_MST_MEM_GBN());
        			
        	// 휴면회원의 경우
        	if("Y".equals(user.getRST_YN()))
        	{
        		resultMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        		returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/clearRestMember.do";
        	}
        	// 온라인회원, 간편회원인 경우
        	else if((memGbn == Code.COMMON_PRI_MEMBER_GRADE || memGbn == Code.MEMBER_TYPE_SIMPLE) && "Y".equals(user.getVST_PASS_YN()))
        	{
        		resultMap.put("path", true);
        		resultMap.put("MEM_MST_MEM_GBN", memGbn);
        		returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/changeOnlineMem.do";
        	}
        	else
        	{
        		if(!"".equals(returnUrl))
        		{
        			// 이전 페이지로 갈 수 없는 경우
            		if(returnUrl.indexOf("login.do") > 0 || returnUrl.indexOf("changeMemPw.do") > 0 || returnUrl.indexOf("/gest") > 0 || returnUrl.indexOf("myShoppingInfo.do") > 0 || returnUrl.indexOf("Popup") > 0 || returnUrl.indexOf("/pwFindResult.do") > 0 || returnUrl.indexOf("/member/join") > 0 || 
            		  	returnUrl.indexOf("/clearRestMember.do") > 0 || returnUrl.indexOf("/sirenIpinResResult.do") > 0 || returnUrl.indexOf("/sirenResResult.do") > 0 || returnUrl.indexOf("/idFindResult.do") > 0 || returnUrl.indexOf("/nonMemberLogin.do") > 0 ||
            		  		returnUrl.indexOf("/paymentSuccess.do") > 0 || returnUrl.indexOf("/paymentFail.do") > 0 || returnUrl.indexOf("/myInfoEditForm.do") > 0 || returnUrl.indexOf("/changePwd.do") > 0 )
            		{
            			returnUrl = StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do";
            		}	
        		}
        		else
        		{
        			returnUrl = StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do";
        		}
        	}
        }   
        // 비회원으로 로그인 성공하였을 경우
        else if(loginStateCode == Code.LOGIN_NON_MEM_SUCCESS)
        {
        	returnUrl = StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/gestDeliveryList.do";
        }
        
        resultMap.put("url", url != "" ? url : StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
        
        mv.addObject("loginCheck", loginCheck);       
        mv.addObject("pageStatus", pageStatus);
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", returnUrl);
        mv.addObject("resultMap", resultMap);
        
        logger.info("returnUrl================="+returnUrl);
        logger.info("url======================"+url);
        
    	// 해당 브랜드로 이동
        mv.setViewName("mobile/manager/loginProc");

        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : appLoginProc
	* 2. ClassName  : LoginManagerController.java
	* 3. Comment    : 모바일 > APP > 로그인 처리
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @param response
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
    @RequestMapping("/mobile/manager/appLoginProc")
    public ModelAndView appLoginProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        User user = new User();
        
        String roleUser = StringUtil.getString(commandMap.get("ROLE_USER"), "guest");
        
        String loginId = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "").trim();
        String loginPwd = StringUtil.getString(commandMap.get("MEM_MST_WEB_PWD"), "");
        
        String loginOrdMstCd = StringUtil.upperCase(StringUtil.getString(commandMap.get("ORD_MST_CD"), "").trim());
        String loginNonMemNm = StringUtil.getString(commandMap.get("ORD_MST_ORD_NM"), "").trim();
        
        String pageStatus = StringUtil.getString(commandMap.get("pageStatus"), "");
        
        String returnUrl = URLDecoder.decode(StringUtil.getString(commandMap.get("url"), ""),"UTF-8");
        String url = returnUrl;
        
        Map<String,Object> resultMap = new HashMap<String, Object>();	// 파라미터
        
        boolean loginCheck = false;
        /**
         * 회원 로그인 
         */
        if("user".equals(roleUser))
        {
            if("".equals(loginId)) // 아이디 필요
            {
                user.setLoginStateCode(Code.LOGIN_ID_INVALID);
                user.setROLE_USER(ROLEUSER.user);
            } 
            else if("".equals(loginPwd)) // 비밀번호 필요
            {
                user.setLoginStateCode(Code.LOGIN_PW_INVALID);
                user.setROLE_USER(ROLEUSER.user);
            }
            else  
            {
                user.setMEM_MST_MEM_ID(loginId);
                user.setMEM_MST_WEB_PWD(loginPwd);
                user.setROLE_USER(ROLEUSER.user);
                loginCheck = true;
            }
        }
        /**
         * 비회원 로그인 
         */
        else if ("order_guest".equals(roleUser))
        {
            if("".equals(loginOrdMstCd)) // 비회원 주문번호 필요
            {
                user.setLoginStateCode(Code.LOGIN_ORD_CODE_INVALID);
                user.setROLE_USER(ROLEUSER.order_guest);
            } 
            else if("".equals(loginNonMemNm)) // 비회원 주문자명 필요
            {
                user.setLoginStateCode(Code.LOGIN_NON_MEM_NM_INVALID);
                user.setROLE_USER(ROLEUSER.order_guest);
            }
            else
            {
                user.setORD_MST_CD(loginOrdMstCd);
                user.setORD_MST_ORD_NM(loginNonMemNm);
                user.setROLE_USER(ROLEUSER.order_guest);
                
                loginCheck = true;
                
            }
        }
        
        if(loginCheck)
        {
            // 로그인
            user = this.pcLoginManagerService.loginManagerProc(request, user, response);

            mv.addObject("user", user);
            
            if(user.getLoginStateCode()==Code.LOGIN_SUCCESS)
            {
            	// callback function
//                mv.addObject("parentFunction", request.getSession().getAttribute("_CallFunctionAfterLogin"));
//                request.getSession().setAttribute("_CallFunctionAfterLogin", null);	
                try
                {
                	// 장바구니 정보 변경
                    commandMap.put("user", user);
                    commandMap.put("session_id", (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id")));
                    this.cartService.updateCartOwner(commandMap);
                    // 임시주문 정보 변경
                    this.cartService.updateTempOrderOwner(commandMap);
                    
                    if("Y".equals(user.getLOGIN_PIT_YN()))
                    {
                    	if(StringUtil.getInt(user.getMEM_MST_MEM_GBN()) == Code.COMMON_PRI_MEMBER_GRADE)
                    	{
                    		// 포인트 지급
                            this.pcLoginManagerService.insertLoginPoint(commandMap);
                    	}
                    }
                }
                catch(Exception e)
                {
                	e.printStackTrace();
                	logger.info("###### 에러 발생 #######");
                }
            }
        }
        
        /*************** 로그인 상태에 관한 alert메세지 시작 ***************/
        // 로그인 상태값
        int loginStateCode = user.getLoginStateCode();
        // 메세지
        String alertMsg = "";
        
        logger.info("################loginStateCode : " + loginStateCode );
        
        // 아이디 필요
        if(loginStateCode == Code.LOGIN_ID_INVALID)
        {
        	alertMsg = "아이디를 확인해 주십시오.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 비밀번호 필요
        else if(loginStateCode == Code.LOGIN_PW_INVALID)
        {
        	alertMsg = "비밀번호를 확인해 주십시오.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 아이디가 틀렸을 경우
        else if(loginStateCode == Code.LOGIN_ID_NULL)
        {
        	alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 비밀번호가 틀렸을 경우
        else if(loginStateCode == Code.LOGIN_PW_INCORRECT)
        {
        	alertMsg = "아이디 또는 비밀번호가 일치하지 않습니다.\\n아이디와 비밀번호를 다시 입력해주세요.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 블랙리스트 
        else if(loginStateCode == Code.LOGIN_STOP_LOGIN)
        {
        	alertMsg = "일치하는 회원이 없습니다.\\n고객센터로 연락바랍니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 로그인 오류
        else if(loginStateCode == Code.LOGIN_FAIL)
        {
        	alertMsg = "데이터 오류입니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 탈퇴회원
        else if(loginStateCode == Code.LOGIN_SITE_NOT_ACCESS)
        {
        	alertMsg = "일치하는 회원이 없습니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 임시 비밀번호 유효기간이 지난 회원
        else if(loginStateCode == Code.LOGIN_PASS_EFFECTIVE_TIME)
        {
        	alertMsg = "임시 비밀번호 유효시간이 지났습니다.\\n임시 비밀번호를 다시 재발급 받으시길 바랍니다.";
        	returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do";
        }
        // 주문번호 필요
        else if(loginStateCode == Code.LOGIN_ORD_CODE_INVALID)
        {
        	alertMsg = "주문번호를 확인해 주십시오.";
        }
        // 주문자명 필요
        else if(loginStateCode == Code.LOGIN_NON_MEM_NM_INVALID)
        {
        	alertMsg = "주문자명을 확인해 주십시오.";
        }
        // 주문자번호가 틀린경우
        else if(loginStateCode == Code.LOGIN_ORD_CODE_NULL)
        {
        	alertMsg = "주문 정보가 없습니다.\\n주문 정보를 확인 하신 후 입력해 주십시오.";
        }
        // 주문자명이 틀린경우
        else if(loginStateCode == Code.LOGIN_NON_MEM_NM_INCORRECT)
        {
        	alertMsg = "주문하신 주문자명과 일치하지 않습니다.\\n주문자명을 확인해 주십시오.";
        }
        /*************** 로그인 상태에 관한 alert메세지 끝 ***************/
        // 로그인에 성공 했을 경우
        else if(loginStateCode == Code.LOGIN_SUCCESS)
        {
        	logger.info("######################returnUrl : " + returnUrl);
            // 아이디 저장 유무
            user.setSaveId(StringUtil.getString(commandMap.get("saveId"), "N"));
            // 자동로그인 유무
            user.setAutoLoginYn(StringUtil.getString(commandMap.get("autoLoginYn"),"N"));
            
        	/*************** 쿠키에 담기 시작 ********************/
            // 아이디 저장
            if("Y".equals(user.getSaveId()))
        	{
        		Cookie cookieEtlandUserId = new Cookie("cookieEtlandUserId", user.getMEM_MST_MEM_ID());
        		cookieEtlandUserId.setMaxAge(30*24*60*60);
        		response.addCookie(cookieEtlandUserId);
        	}
            else
            {
            	//아이디 저장 삭제
            	Cookie cookieEtlandUserId = new Cookie("cookieEtlandUserId", null);
            	cookieEtlandUserId.setMaxAge(0);
            	response.addCookie(cookieEtlandUserId);
            }
            
        	// 자동로그인
        	if("Y".equals(user.getAutoLoginYn()))
        	{
        		Cookie cookieEtlandUserAutoLogin = new Cookie("cookieEtlandUserAutoLogin", user.getMEM_MST_MEM_ID());
        		cookieEtlandUserAutoLogin.setMaxAge(90*24*60*60);
        		cookieEtlandUserAutoLogin.setPath("/");
        		response.addCookie(cookieEtlandUserAutoLogin);
        	}
        	else
        	{
        		// 자동로그인 삭제
        		Cookie cookieEtlandUserAutoLogin = new Cookie("cookieEtlandUserAutoLogin", null);
        		cookieEtlandUserAutoLogin.setMaxAge(0);
        		response.addCookie(cookieEtlandUserAutoLogin);
        	}
        	/*************** 쿠키에 담기 끝 *******************/
        	
        	int memGbn = StringUtil.getInt(user.getMEM_MST_MEM_GBN());
        			
        	// 휴면회원의 경우
        	if("Y".equals(user.getRST_YN()))
        	{
        		resultMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        		returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/clearRestMember.do";
        	}
        	// 온라인회원, 간편회원인 경우
        	else if((memGbn == Code.COMMON_PRI_MEMBER_GRADE || memGbn == Code.MEMBER_TYPE_SIMPLE) && "Y".equals(user.getVST_PASS_YN()))
        	{
        		resultMap.put("path", true);
        		resultMap.put("MEM_MST_MEM_GBN", memGbn);
        		returnUrl = StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/changeOnlineMem.do";
        	}
        	else
        	{
        		if(!"".equals(returnUrl))
        		{
        			// 이전 페이지로 갈 수 없는 경우
            		if(returnUrl.indexOf("login.do") > 0 || returnUrl.indexOf("changeMemPw.do") > 0 || returnUrl.indexOf("/gest") > 0 || returnUrl.indexOf("myShoppingInfo.do") > 0 || returnUrl.indexOf("Popup") > 0 || returnUrl.indexOf("/pwFindResult.do") > 0 || returnUrl.indexOf("/member/join") > 0 || 
            		  	returnUrl.indexOf("/clearRestMember.do") > 0 || returnUrl.indexOf("/sirenIpinResResult.do") > 0 || returnUrl.indexOf("/sirenResResult.do") > 0 || returnUrl.indexOf("/idFindResult.do") > 0 || returnUrl.indexOf("/nonMemberLogin.do") > 0 ||
            		  		returnUrl.indexOf("/paymentSuccess.do") > 0 || returnUrl.indexOf("/paymentFail.do") > 0 || returnUrl.indexOf("/myInfoEditForm.do") > 0 || returnUrl.indexOf("/changePwd.do") > 0 )
            		{
            			returnUrl = StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do";
            		}	
        		}
        		else
        		{
        			returnUrl = StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do";
        		}
        	}
        }   
        // 비회원으로 로그인 성공하였을 경우
        else if(loginStateCode == Code.LOGIN_NON_MEM_SUCCESS)
        {
        	returnUrl = StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/mypage/gestDeliveryList.do";
        }
        
        resultMap.put("url", url != "" ? url : StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
        
        mv.addObject("loginCheck", loginCheck);       
        mv.addObject("pageStatus", pageStatus);
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", returnUrl);
        mv.addObject("resultMap", resultMap);
        
        logger.info("returnUrl================="+returnUrl);
        logger.info("url======================"+url);
        
    	JSONObject jsonObj = new JSONObject();
    	
    	// 로그인 성공 여부
    	String resultCode = "";
    	
    	jsonObj.put("alertMsg", alertMsg);
    	jsonObj.put("returnUrl", returnUrl);
    	jsonObj.put("resultMap", resultMap);
    	
    	// 로그인 성공했을 경우
    	if(loginStateCode == Code.LOGIN_SUCCESS)
    	{
    		resultCode = "00";
    	}
    	else
    	{
    		resultCode = "01";
    	}
    	
    	jsonObj.put("resultCode", resultCode);
    	mv.addObject("json", jsonObj);
    	mv.setViewName("mobile/manager/appLoginProc");

        return mv;
    }
	
    
    /**
     * 
     * <pre>
     * 1. MethodName	: logout
     * 2. ClassName		: LoginManagerController.java
     * 3. Comment    	: 모바일 > 로그아웃을 처리한다. 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 22. 오후 4:44:09
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/mobile/manager/logout")
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
  		
  		// 자동로그인 삭제
  		Cookie del_autoLogin_cookie = new Cookie("cookieEtlandUserAutoLogin",""); 
  		del_autoLogin_cookie.setMaxAge(0); 
  		del_autoLogin_cookie.setPath("/");
  		response.addCookie(del_autoLogin_cookie);
        
        mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
        // 해당 브랜드로 이동
        mv.setViewName("mobile/common/result");
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : nonMemberLogin
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > 비회원 구매/주문 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/nonMemberLogin")
    public ModelAndView nonMemberLogin (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	// 배너목록 가져오기
    	Map<String, Object> bannerMap = new HashMap<String, Object>();
    	bannerMap.put("BANNER_IDX", Code.MOBILE_NON_LOGIN_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", "M");
    	bannerMap.put("RUNM", 2);
    	mv.addObject("nonLoginBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	mv.addObject("commandMap", commandMap);
    	
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : clearRestMember
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 휴면회원 > 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/clearRestMember")
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
    			logger.info("#################### 프로시져 에러 ###########################");
	        	// 프로시져 에러
	        	//this.pcJoinMemberService.insertErpError(resultMap);
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/manager/logout.do");
	            
	            mv.setViewName("/mobile/common/result");
    		}
    		else if(result == 00)
    		{
    			logger.info("#################### Excpetion 에러 ###########################");
	        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
	        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/manager/logout.do");
	            
	            mv.setViewName("/mobile/common/result");
    		}
    		else
    		{
    			mv.addObject("restMemberInfo", resultMap);	
    		}
    	}
	    else
	    {
	    	throw new MobileAuthenticationException();
	    }
    	
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : idFind
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디 찾기
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/idFind")
    public ModelAndView idFind (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
        }
		/*else
		{
			// BIZSIREN 본인인증 DATA 생성
			String reqInfo = sirenCert.getSirenCertReqInfo(request, response, "");
			// 본인실명확인 결과수신 URL
			String retUrl   = "32" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.siren.idCertReturnUrl");
			
			mv.addObject("reqInfo", reqInfo);
			mv.addObject("retUrl", retUrl);
			mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));
			
			// BIZSIREN IPIN 본인인증 DATA 생성
			String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
			
			// I-PIN 본인실명확인 결과수신 URL
			String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.ipin.idCertReturnUrl") + "?gubun=ID";
			
			mv.addObject("ipinReqInfo", ipinReqInfo);
			mv.addObject("ipinRetUrl", ipinRetUrl);
			mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));
		}*/
		
		mv.addObject("commandMap", commandMap);
    	
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : idSirenResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디찾기 > siren 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/idSirenResResult")
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
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/idFind.do?gubun=ID&type=m.");
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
		
		mv.setViewName("/mobile/member/sirenResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : idSirenIpinResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디찾기 > siren I-PIN 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/idSirenIpinResResult")
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
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/idFind.do?gubun=ID&type=m.");
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
		
		mv.setViewName("/mobile/member/sirenIpinResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv; 
    }
    
    /**
    * <pre>
    * 1. MethodName : idFindResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 아이디찾기 > 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/idFindResult")
    public ModelAndView idFindResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	// 회원 구분(통합,간편,기업)
    	String memType = StringUtil.getString(commandMap.get("memType"),"");
    	
    	// 이메일 간편회원의 경우
    	if("memberSimple".equals(memType))
    	{
    		Map<String,Object> searchSimpleMemInfo = this.pcLoginManagerService.selectSimpleMemInfo(commandMap);
    		
    		if(searchSimpleMemInfo == null)
    		{
    			mv.addObject("alertMsg", "일치하는 회원이 없습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/idFind.do?gubun=ID&type=m.");
				
				mv.setViewName("mobile/common/result");
    		}
    		else
    		{
    			commandMap.put("MEM_MST_MEM_ID", FormatUtil.markingId(StringUtil.getString(searchSimpleMemInfo.get("MEM_MST_MEM_ID"),"")));		
    		}
    	}
    	// 기업회원의 경우
    	else if("memberBusiness".equals(memType))
    	{
    		List<Map<String,Object>> selectBusinessMemIdList = this.pcLoginManagerService.selectBusinessMemIdList(commandMap);
    		
    		if(selectBusinessMemIdList.size() > 0)
    		{
    			for(int i=0;i < selectBusinessMemIdList.size(); i++)
    			{
    				selectBusinessMemIdList.get(i).put("MEM_MST_MEM_ID", FormatUtil.markingId(StringUtil.getString(selectBusinessMemIdList.get(i).get("MEM_MST_MEM_ID"))));
    			}
    			
    			mv.addObject("list", selectBusinessMemIdList);	
    		}
    		else
    		{
    			mv.addObject("alertMsg", "일치하는 회원이 없습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/idFind.do?gubun=ID&type=m.");
				
				mv.setViewName("mobile/common/result");
    		}
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
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/pwFind")
    public ModelAndView pwFind (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
        }
		else
		{
			// BIZSIREN 본인인증 DATA 생성
			String reqInfo = sirenCert.getSirenCertReqInfo(request, response, "");
			// 본인실명확인 결과수신 URL
			String retUrl   = "32" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.siren.pwCertReturnUrl");
			
			mv.addObject("reqInfo", reqInfo);
			mv.addObject("retUrl", retUrl);
			mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));
			
			// BIZSIREN IPIN 본인인증 DATA 생성
			String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
			
			// I-PIN 본인실명확인 결과수신 URL
			String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.ipin.pwCertReturnUrl") + "?gubun=PW";
			
			mv.addObject("ipinReqInfo", ipinReqInfo);
			mv.addObject("ipinRetUrl", ipinRetUrl);
			mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));
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
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/pwSirenResResult")
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
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/pwFind.do?gubun=PW&type=m.");
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
		
		mv.setViewName("/mobile/member/sirenResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : pwSirenIpinResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호찾기 > siren I-PIN 본인인증 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/pwSirenIpinResResult")
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
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/pwFind.do?gubun=PW&type=m.");
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
		
		mv.setViewName("/mobile/member/sirenIpinResResult");
		
		mv.addObject("commandMap", commandMap);

		return mv; 
    }
    
    /**
    * <pre>
    * 1. MethodName : checkMemInfoAjax
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호찾기 > 통합회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/checkMemInfoAjax")
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
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/pwFindResult")
    public ModelAndView pwFindResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
	   	ModelAndView mv = new ModelAndView();
	   	
	   	// 회원구분 (통합,간편,기업)
	   	String memType = StringUtil.getString(commandMap.get("memType"),"");
	   	
	   	Map<String,Object> checkMemInfo = new HashMap<String, Object>();
	   	
	   	// 간편회원의 경우
	   	if("memberSimple".equals(memType))
	   	{
	   		// 간편회원정보 조회
	   		checkMemInfo = this.pcLoginManagerService.selectCheckSimpleMemInfo(commandMap);
	   		
	   		if(checkMemInfo == null)
	   		{
	   			mv.addObject("alertMsg", "일치하는 회원이 없습니다.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/pwFind.do?gubun=PW&type=m.");
					
					mv.setViewName("/mobile/common/result");
	   		}
	   		else
	   		{
	   			commandMap.put("RST_YN", checkMemInfo.get("RST_YN"));	// 휴면 여부
	   			String MEM_MST_MAIL = StringUtil.getString(checkMemInfo.get("MEM_MST_MAIL"),"");
	   			String markingEmail = "";	// 마스킹한 이메일
	   			
	   			if(!"".equals(MEM_MST_MAIL))
	   			{
	   				commandMap.put("MEM_MST_MAIL", checkMemInfo.get("MEM_MST_MAIL"));	// 이메일
	   				
	   				String[] MEM_MST_MAIL_ARR = MEM_MST_MAIL.split("@");
	   				markingEmail = FormatUtil.markingId(MEM_MST_MAIL_ARR[0]) + "@" + MEM_MST_MAIL_ARR[1];
	   			}
	   			
	   			// 임시 비밀번호 발송
	   			this.pcLoginManagerService.updateMemberTempPw(request,commandMap);
	   			
	   			commandMap.put("markingEmail", markingEmail);
	   		}
	   		
	   	}
	   	
	   	// 기업회원의 경우
	   	if("memberBusiness".equals(memType))
	   	{
	   		// 기업회원정보조회
	   		checkMemInfo = this.pcLoginManagerService.selectCheckBusinessMemInfo(commandMap);
	   		
	   		if(checkMemInfo == null)
	   		{
	   			mv.addObject("alertMsg", "일치하는 회원이 없습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/pwFind.do?gubun=PW&type=m.");
					
				mv.setViewName("/mobile/common/result");
	   		}
	   		else
	   		{
					commandMap.put("RST_YN", checkMemInfo.get("RST_YN"));	// 휴면 여부
					String MEM_MST_MAIL = StringUtil.getString(checkMemInfo.get("MEM_MST_MAIL"),"");
					String markingEmail = "";	// 마스킹한 이메일
	   			
					if(!"".equals(MEM_MST_MAIL))
	   			{
	   				commandMap.put("MEM_MST_MAIL", checkMemInfo.get("MEM_MST_MAIL"));	// 이메일
	   				
	   				String[] MEM_MST_MAIL_ARR = MEM_MST_MAIL.split("@");
	   				markingEmail = FormatUtil.markingId(MEM_MST_MAIL_ARR[0]) + "@" + MEM_MST_MAIL_ARR[1];
	   			}
	   			
	   			// 임시 비밀번호 발송
	   			this.pcLoginManagerService.updateMemberTempPw(request,commandMap);	
	   			
	   			commandMap.put("markingEmail", markingEmail);
	   		}
	   	}
	   	
	   	mv.addObject("commandMap", commandMap);
	   	
	   	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : changeMemPw
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 비밀번호 찾기 결과 > 통합회원 > 비밀번호 변경
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping ("/mobile/manager/changeMemPw")
    public ModelAndView changeMemPw (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
	   	ModelAndView mv = new ModelAndView();
			
	   	if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_PW"), "")))
	   	{
	   		// 통합회원 > 비밀번호 변경
	   		int result = this.pcLoginManagerService.updateBasicMemPw(request, commandMap);
	           
	   		// view Page Info
	           if(result > 0)
	           {
	               mv.addObject("alertMsg", "비밀번호가 변경되었습니다.");
	               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do");
	           }
	           else
	           {
	               mv.addObject("alertMsg", "비밀번호 변경에 실패하였습니다.");
	               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
	           }
	   	}
			
	   	mv.addObject("commandMap", commandMap);
        mv.setViewName("/mobile/common/result");
       
		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : changeOnlineMem
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > 로그인 > 온라인회원 전환
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/changeOnlineMem")
    public ModelAndView changeOnlineMem (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	if((SessionsUser.isLogin(request)) && ("true".equals(StringUtil.getString(commandMap.get("path"),""))))
        {
    		ModelAndView mv = new ModelAndView();
    		
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
    * 1. MethodName : changeOnlineMemCert
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > 로그인 > 온라인회원 전환 > 본인인증
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/mobile/manager/changeOnlineMemCert")
    public ModelAndView changeOnlineMemCert (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();

    	if(SessionsUser.isLogin(request))
        {
			// BIZSIREN 본인인증 DATA 생성
			String reqInfo = sirenCert.getSirenCertReqInfo(request, response, "");

			// 본인실명확인 결과수신 URL
			String retUrl   = "32" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.siren.onlineCertReturnUrl");
			
			mv.addObject("reqInfo", reqInfo);
			mv.addObject("retUrl", retUrl);
			mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));
			
			// BIZSIREN IPIN 본인인증 DATA 생성
			String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
			
			// I-PIN 본인실명확인 결과수신 URL
			String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.ipin.onlineCertReturnUrl") + "?gubun=" + commandMap.get("gubun");
			
			mv.addObject("ipinReqInfo", ipinReqInfo);
			mv.addObject("ipinRetUrl", ipinRetUrl);
			mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));
			
			mv.addObject("commandMap", commandMap);
		}
    	else
    	{
    		throw new MobileAuthenticationException();
    	}
		
		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : onlineSirenResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > 로그인 > 온라인회원 전환 > 본인인증 > 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/onlineSirenResResult")
    public ModelAndView onlineSirenResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
		
		// 사이렌 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenInfo = sirenCert.getSirenCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenInfo.get("ci1"));			// CI값
		//commandMap.put("MEM_IPN_CI", "mobileOn1");
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
			
			// 온라인회원 or 간편회원
			String gubun = StringUtil.getString(sirenInfo.get("addVar"),"");		
			
			if(!"".equals(gubun))
			{
				gubun = gubun.substring(6);
			}
			
			// 성공
			if("Y".equals(result))
			{
				// 온라인 회원
				if(StringUtil.getInt(gubun) == Code.COMMON_PRI_MEMBER_GRADE)
				{
					// 가입여부 체크
					Map<String,Object> returnMap = this.pcJoinMemberService.selectJoinCheck(commandMap);
					
					int returnVal = Integer.valueOf(StringUtil.getString(returnMap.get("returnVal"),"0"));
					
					// 온라인회원 -> 통합회원으로 전환 (멤버십 발행 포함)
					if(returnVal == -2)
					{
						commandMap.put("returnVal", returnVal);
						commandMap.put("MEM_IPN_DI", sirenInfo.get("di"));				// DI
						commandMap.put("MEM_IPN_SEX", sirenInfo.get("sex"));			// 성별(M : 남자 / F : 여자)
						commandMap.put("MEM_MST_MEM_ID", returnMap.get("MEM_MST_MEM_ID"));
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", returnMap.get("MEM_MST_ERP_ID"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("AD_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("KAKAO_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("erpInfoYn", returnMap.get("erpInfoYn"));
					}			
					else
					{
						mv.addObject("closeMsg", "회원정보 일부가 맞지 않아 \\n통합회원으로 전환할 수 없습니다.\\n고객센터 또는 1:1 문의를 통해 문의해주시기 바랍니다.");
					}
				}
				// 간편회원
				else if(StringUtil.getInt(gubun) == Code.MEMBER_TYPE_SIMPLE)
				{
					commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
					
					// 전환하려는 회원의 CI가 IPN테이블에 존재하는지 여부, ERP CI조회
					Map<String,Object> checkSimpleMemInfo = this.pcLoginManagerService.checkSimpleMem(commandMap);
					String returnCode = StringUtil.getString(checkSimpleMemInfo.get("returnCode"));
					
					if("E00".equals(returnCode))
					{
						mv.addObject("resultMsg", "이미 통합회원입니다.\\n통합회원으로 로그인 하세요.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
					else if("E01".equals(returnCode))
					{
						mv.addObject("resultMsg", "이미 온라인회원입니다.\\n온라인회원으로 로그인 하세요.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
					else if("E02".equals(returnCode))
					{
						mv.addObject("resultMsg", "이미 가입되어 있는 정보가 존재합니다.\\n회원가입을 통해 통합회원으로 전환해주세요.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
					else if("S00".equals(returnCode))
					{
						// 통합회원으로 전환할 간편회원 정보 조회
						Map<String,Object> returnMap = this.pcLoginManagerService.selectChangeSimpleMemInfo(commandMap);
						
						commandMap.put("MEM_IPN_DI", sirenInfo.get("di"));				// DI
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_SEX", returnMap.get("MEM_MST_SEX"));
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", returnMap.get("MEM_MST_ERP_ID"));
						commandMap.put("MEM_MST_ERP_YN", returnMap.get("MEM_MST_ERP_YN"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("SK_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("S_CARD_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("changeSimpleMem","Y");
					}
					else if("S01".equals(returnCode))
					{
						// 통합회원으로 전환할 간편회원 정보 조회
						Map<String,Object> returnMap = this.pcLoginManagerService.selectChangeSimpleMemInfo(commandMap);
						
						commandMap.put("MEM_IPN_DI", sirenInfo.get("di"));				// DI
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_SEX", returnMap.get("MEM_MST_SEX"));
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", checkSimpleMemInfo.get("P1AN8"));
						commandMap.put("MEM_MST_ERP_YN", returnMap.get("MEM_MST_ERP_YN"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("SK_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("S_CARD_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("changeSimpleMem","Y");
					}
					else
					{
						mv.addObject("resultMsg", "회원정보 일부가 맞지 않아 \\n통합회원으로 전환할 수 없습니다.\\n고객센터 또는 1:1 문의를 통해 문의해주시기 바랍니다.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
				}
				else
				{
					mv.addObject("closeMsg", "회원정보 일부가 맞지 않아 \\n통합회원으로 전환할 수 없습니다.\\n고객센터 또는 1:1 문의를 통해 문의해주시기 바랍니다.");
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
		
		mv.setViewName("/mobile/member/sirenResResult");
		mv.addObject("commandMap", commandMap);

		return mv; 
    }
    
    /**
    * <pre>
    * 1. MethodName : onlineSirenIpinResResult
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > 로그인 > 온라인회원 전환 > 본인인증 > I-PIN 결과
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 15.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/onlineSirenIpinResResult")
    public ModelAndView onlineSirenIpinResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();

		//사이렌 I-PIN 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenIpinInfo = sirenCert.getSirenIpinCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenIpinInfo.get("ciscrHash"));	// CI값
		//commandMap.put("MEM_IPN_CI", "testerp4");
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
			
			// 온라인회원 or 간편회원
			String gubun = request.getParameter("gubun");
			
			if(!"".equals(gubun))
			{
				gubun = gubun.substring(6);
			}
			
			// 성공
			if("1".equals(result))
			{
				// 온라인 회원
				if(StringUtil.getInt(gubun) == Code.COMMON_PRI_MEMBER_GRADE)
				{
					// 가입여부 체크
					Map<String,Object> returnMap = this.pcJoinMemberService.selectJoinCheck(commandMap);

					int returnVal = Integer.valueOf(StringUtil.getString(returnMap.get("returnVal"),"0"));
					
					// 온라인회원 -> 통합회원으로 전환 (멤버십 발행 포함)
					if(returnVal == -2)
					{
						commandMap.put("returnVal", returnVal);
						commandMap.put("MEM_IPN_SEX", sirenIpinInfo.get("sex"));						// 성별(M : 남자 / F : 여자)
						commandMap.put("MEM_IPN_DI", sirenIpinInfo.get("discrHash"));					// DI
						commandMap.put("MEM_MST_MEM_ID", returnMap.get("MEM_MST_MEM_ID"));
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", returnMap.get("MEM_MST_ERP_ID"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("SK_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("S_CARD_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("erpInfoYn", returnMap.get("erpInfoYn"));
					}
					else
					{
						mv.addObject("closeMsg", "회원정보 일부가 맞지 않아 \\n통합회원으로 전환할 수 없습니다.\\n고객센터 또는 1:1 문의를 통해 문의해주시기 바랍니다.");
					}
				}
				// 간편회원
				else if(StringUtil.getInt(gubun) == Code.MEMBER_TYPE_SIMPLE)
				{
					commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
					
					// 전환하려는 회원의 CI가 IPN테이블에 존재하는지 여부, ERP CI조회
					Map<String,Object> checkSimpleMemInfo = this.pcLoginManagerService.checkSimpleMem(commandMap);
					String returnCode = StringUtil.getString(checkSimpleMemInfo.get("returnCode"));
					
					if("E00".equals(returnCode))
					{
						mv.addObject("resultMsg", "이미 통합회원입니다.\\n통합회원으로 로그인 하세요.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
					else if("E01".equals(returnCode))
					{
						mv.addObject("resultMsg", "이미 온라인회원입니다.\\n온라인회원으로 로그인 하세요.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
					else if("E02".equals(returnCode))
					{
						mv.addObject("resultMsg", "이미 가입되어 있는 정보가 존재합니다.\\n회원가입을 통해 통합회원으로 전환해주세요.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
					else if("S00".equals(returnCode))
					{
						// 통합회원으로 전환할 간편회원 정보 조회
						Map<String,Object> returnMap = this.pcLoginManagerService.selectChangeSimpleMemInfo(commandMap);
						
						commandMap.put("MEM_IPN_DI", sirenIpinInfo.get("discrHash"));					// DI
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_SEX", returnMap.get("MEM_MST_SEX"));					
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", returnMap.get("MEM_MST_ERP_ID"));
						commandMap.put("MEM_MST_ERP_YN", returnMap.get("MEM_MST_ERP_YN"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("SK_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("S_CARD_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("changeSimpleMem","Y");
					}
					else if("S01".equals(returnCode))
					{
						// 통합회원으로 전환할 간편회원 정보 조회
						Map<String,Object> returnMap = this.pcLoginManagerService.selectChangeSimpleMemInfo(commandMap);
						
						commandMap.put("MEM_IPN_DI", sirenIpinInfo.get("discrHash"));					// DI
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_SEX", returnMap.get("MEM_MST_SEX"));					
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", checkSimpleMemInfo.get("P1AN8"));
						commandMap.put("MEM_MST_ERP_YN", returnMap.get("MEM_MST_ERP_YN"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("SK_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("S_CARD_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("changeSimpleMem","Y");
					}
					else
					{
						mv.addObject("resultMsg", "회원정보 일부가 맞지 않아 \\n통합회원으로 전환할 수 없습니다.\\n고객센터 또는 1:1 문의를 통해 문의해주시기 바랍니다.");
						mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
					}
				}
				else
				{
					mv.addObject("closeMsg", "회원정보 일부가 맞지 않아 \\n통합회원으로 전환할 수 없습니다.\\n고객센터 또는 1:1 문의를 통해 문의해주시기 바랍니다.");
				}
			}
			// 실패
			else
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
		}
		
		mv.setViewName("/mobile/member/sirenIpinResResult");
		mv.addObject("commandMap", commandMap);

		return mv; 
    }
    
    /**
    * <pre>
    * 1. MethodName : updateToken
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > APP > token ID 추가
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    */
    @RequestMapping("/mobile/manager/updateToken")
    public ModelAndView updateToken (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	// 앱에서 로그인 시 token ID 추가
    	this.pcLoginManagerService.updateToken(commandMap);

    	JSONObject jsonObj = new JSONObject();
    	
    	// 로그인 성공 여부
    	String resultCode = "";

    	mv.addObject("json", jsonObj);
    	mv.setViewName("mobile/manager/appLoginProc");
    	
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : mergeToken
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 모바일 > APP > token ID 추가
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    */
    @RequestMapping("/mobile/manager/mergeToken")
    public ModelAndView mergeToken (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	// 앱에서 로그인 시 token ID 추가
    	this.pcLoginManagerService.mergeToken(commandMap);

    	JSONObject jsonObj = new JSONObject();
    	
    	// 로그인 성공 여부
    	String resultCode = "";

    	mv.addObject("json", jsonObj);
    	mv.setViewName("mobile/manager/appLoginProc");
    	
    	return mv;
    }    
    
    /**
     * @api {GET} /mobile/manager/pwChangeForm
     * @apiName 비밀번호 변경기간에의한 변경
     * @apiGroup 회원 
     */
    @RequestMapping("/mobile/manager/pwChangeForm")
    public ModelAndView pwChangeForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, HttpServletResponse response) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
    
    /**
     * @api {POST} /mobile/manager/pwskip
     * @apiName 비밀번호 다음에 변경
     * @apiGroup 회원 
     */
    @FrontBannerSkip()
    @RequestMapping("/mobile/manager/pwskip")
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
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
        mv.setViewName("/mobile/common/result");
        return mv;
    }
    
}
