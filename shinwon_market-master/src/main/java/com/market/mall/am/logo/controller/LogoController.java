package com.market.mall.am.logo.controller;

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
import com.market.mall.am.logo.service.LogoService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.am.logo.controller
 * @FileName : LogoController.java
 * @Date : 2016. 8. 8.
 * @프로그램 설명 : Logo관리를 처리하는 Controller Class
 * @author DEV_KIMHYOJOONG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class LogoController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="propertiesService")
    private EgovPropertyService propertiesService;

    @Resource(name="logoService")
    private LogoService logoService;


    /**
     * <pre>
     * 1. MethodName : logoList
     * 2. ClassName  : LogoController.java
     * 3. Comment    : 로고 목록
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/logo/logoList")
    public ModelAndView logoList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();

        // 로고 타입
        commandMap.put("LOGO_TYPE", Code.LOGO_TYPE);

        // 로고 목록
        mv.addObject("logoList", this.logoService.selectLogoList(commandMap));

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : logoRegist
     * 2. ClassName  : LogoController.java
     * 3. Comment    : 로고 등록 처리
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 9.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/logo/logoRegist", method=RequestMethod.POST)
    public ModelAndView logoRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();

        // multiPartRequest
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        String alertMsg = "처리중 오류가 발생하였습니다.";

        try{
            // 로고파일 등록
            commandMap.put("REG_ID", SessionsAdmin.getSessionAdminValue(request, "ADM_MST_ID"));
            alertMsg = this.logoService.insertLogo(multipartRequest, commandMap);
        }catch(Exception e){
            this.logger.error("::::::::::: 로고 등록 처리 Error : " + e.toString());
            e.printStackTrace();
        }

        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", this.propertiesService.getString("server.domain") + "/am/logo/logoList.do");
        mv.setViewName("am/common/result");
        
        return mv;
    }
}

