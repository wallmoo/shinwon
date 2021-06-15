package com.market.mall.am.marketing.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.erp.ErpRequest;
import com.ibm.icu.util.Calendar;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class WelfarePointController {

	private static final Logger LOGGER = LoggerFactory.getLogger(WelfarePointController.class);
    
    @Resource(name="pointService")
    private PointService pointService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    @Resource(name="infoMemberService") private InfoMemberService infoMemberService;
    
    @RequestMapping("/am/marketing/welfarePointList")
    public ModelAndView welfarePointList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        ModelAndView mv = new ModelAndView();
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        for(int i = year-5; i <= year; i++) {
        	Map<String, Object> erpParam = new HashMap<String, Object>();
        	erpParam.put("YY", ""+i);
//        	System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++년도"+i);
//        	System.out.println("===================================================================  erpParam : "+erpParam);
        	List<Map<String,Object>> erpResponse = ErpRequest.requestAnnualWelfarePoints(erpParam);
        	for(int j=0;j<erpResponse.size();j++) {
        		Map<String,Object> map = erpResponse.get(j);
        		list.add(map);
        	}
        }
//        System.out.println("-------------------------------------------------------------------------list : "+list);
        Collections.reverse(list);
//        System.out.println("-------------------------------------------------------------------------list 역방향 정렬: "+list);
        mv.addObject("list",list);
        return mv;
    }
    
    
        
}
