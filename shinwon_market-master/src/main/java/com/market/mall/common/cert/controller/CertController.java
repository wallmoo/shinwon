package com.market.mall.common.cert.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.User.ROLEUSER;

@Controller
@AccessLevelUser(ROLEUSER.guest)
public class CertController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/common/cert/{certType}.do")
    public ModelAndView cert(HttpServletRequest request, @PathVariable String certType) throws Exception
    {
		ModelAndView mv = new ModelAndView();
        mv.setViewName("/common/cert/"+certType); 
        return mv;
    }
	
}
