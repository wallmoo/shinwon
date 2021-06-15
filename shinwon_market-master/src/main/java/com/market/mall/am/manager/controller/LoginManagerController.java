package com.market.mall.am.manager.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.logo.service.LogoService;
import com.market.mall.am.manager.service.LoginManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.manager.controller
 * @FileName : LoginManagerController.java
 * @Date : 2014. 3. 21.
 * @프로그램 설명 : 관리자 로그인을 처리하는 Controller Class
 * @author jangsin
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.guest)
public class LoginManagerController {

    @Resource(name="loginManagerService")
    LoginManagerService loginManagerService;

    @Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;

    @Resource(name="logoService")
    private LogoService logoService;

    /**
    * <pre>
    * 1. MethodName : login
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 관리자 로그인 페이지로 이동한다.
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/manager/login")
    public ModelAndView login (HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();

        if(SessionsAdmin.isLoginAdmin(request)){
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            mv.setViewName("/am/common/result");
        }

        //SCM인 경우 페이지 다르다.
        if(request.getRequestURL().toString().toLowerCase().indexOf("scm") >= 0){
            mv.setViewName("/am/manager/login_scm");
        }

        // 로그인 로고
        commandMap.put("LGO_MST_TYPE", Code.LOGO_TYPE_ADMIN_LOGIN);
        String adminLoginLogo = this.logoService.selectLogoUrl(commandMap);

        mv.addObject("adminLoginLogo", adminLoginLogo);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : loginProc
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 관리자 로그인을 처리한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/manager/loginProc", method = RequestMethod.POST)
    public ModelAndView loginProc (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = new Admin();
        String loginId = StringUtil.getString(commandMap.get("ADM_MST_ID"), "");
        String loginpw = StringUtil.getString(commandMap.get("ADM_MST_PWD"), "");
        
        boolean loginCheck = false;
        
        if("".equals(loginId)){
            admin.setLoginStateCode(Code.LOGIN_ID_INVALID); 
        }else if("".equals(loginpw)){
            admin.setLoginStateCode(Code.LOGIN_PW_INVALID);
        }else{
            admin.setADM_MST_ID(loginId);
            admin.setADM_MST_PWD(loginpw);
            admin.setRequestUrl(StringUtil.getString(request.getRequestURI(), ""));
            
            // 로그인 처리
            admin = loginManagerService.loginProc(admin, request, response);
            
            // 로그인 성공
            if(admin.getLoginStateCode() == Code.LOGIN_SUCCESS){
                loginCheck = true;
            }
            
            if(!"".equals(StringUtil.getString(admin.getADM_MST_ID(), ""))){
                // 관리자 로그인 이력 저장
                this.loginManagerService.insertLoginManagerHistroy(request, admin);
            }
        }
        // 아이디 저장 유무
        admin.setSaveId(StringUtil.getString(commandMap.get("saveId"), "N"));
        
        mv.addObject("loginCheck", loginCheck);
        mv.addObject("admin", admin);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : logout
    * 2. ClassName  : LoginManagerController.java
    * 3. Comment    : 관리자 로그아웃을 처리한다. 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    */
    @RequestMapping("/am/manager/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap){
        ModelAndView mv = new ModelAndView();
        // 세션을 삭제한다.
        SessionsAdmin.setSessionAdminClear(request);
        
        mv.addObject("returnUrl", request.getAttribute("serverDomain") + "/am/manager/login.do");
        mv.setViewName("/am/common/result");
        
        // 쿠키 삭제
        Cookie authinfo_cookie = new Cookie("authinfo", "");
        authinfo_cookie.setPath("/");
        response.addCookie(authinfo_cookie);
        
        return mv;
    }
}
