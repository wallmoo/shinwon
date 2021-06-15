package com.market.mall.pc.member.controller;

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
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.InfoMemberService;


/**
 * @PackageName: com.market.mall.pc.member.controller
 * @FileName : InfoMemberController.java
 * @Date : 2015. 11. 11.
 * @프로그램 설명 : ***** 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("pcInfoMemberController")
public class InfoMemberController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    
}
