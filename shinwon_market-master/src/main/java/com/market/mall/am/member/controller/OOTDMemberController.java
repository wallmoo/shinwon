package com.market.mall.am.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.viewer.JSON;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.am.member.service.OOTDMemberService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OOTDMemberController {
    
    @Resource(name="ootdMemberService") private OOTDMemberService ootdMemberService;
    
    @Autowired
    InfoMemberService infoMemberService;
    /**
     * @api {GET} /am/member/ootdList.do
     * @apiName 관리자 OOTD 목록 화면
     * @apiGroup OOTD
     * 
     * @apiParam {String} MEM_MST_MEM_ID 회원 ID
     * 
     * @apiSuccess {Object} USER_DATA 회원 정보
     * @apiSuccess {Object[]} OOTD_DATA_LIST OOTD 목록 리스트
     */
    @RequestMapping("/am/member/ootdList")
    public ModelAndView ootdList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> userData = null;

        String userId = commandMap.get(PARAM_CONST.MEM_MST_MEM_ID)+"";
//        String userNM = commandMap.get(PARAM_CONST.MEM_MST_MEM_NM)+"";
        
//        userData.put(PARAM_CONST.MEM_MST_MEM_ID, userId);
//        userData.put(PARAM_CONST.MEM_MST_MEM_NM, userNM);
        
        int totalCount = ootdMemberService.selectOOTDListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        commandMap.put(PARAM_CONST.MEM_MST_MEM_ID, userId);
        List<Map<String, Object>> ootdList = ootdMemberService.selectOOTDListByUserId(commandMap);
        
        mv.addObject(RESPONSE_KEY.USER_DATA, userData);
        mv.addObject(RESPONSE_KEY.OOTD_DATA_LIST, ootdList);
        
        mv.setViewName("/pc/admin/member/OOTDList");
        
        return mv;
    }
    
    @RequestMapping("/am/member/selectOotdListAjax")
    public JSON selectOotdListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        return json;
    }
	
}
