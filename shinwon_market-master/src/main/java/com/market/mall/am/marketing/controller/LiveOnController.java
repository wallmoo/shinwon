package com.market.mall.am.marketing.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.marketing.service.LiveOnService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;


@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class LiveOnController {
    
	@Resource(name="LiveOnService")
	private LiveOnService liveOnService;
    
    @RequestMapping(value="/am/marketing/liveOnList")
    public ModelAndView liveOnList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	int totalCount = liveOnService.selectLiveOnListCount(commandMap);
		Paging paging = new Paging(totalCount, commandMap);
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
    	
    	List<Map<String, Object>> list = null;
    	if(totalCount > 0) {
    		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
    		list = liveOnService.selectLiveOnList(commandMap);
    	}

        mv.addObject( "paging", paging );
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }


    /**
    * <pre>
    * 1. MethodName : liveOnModify
    * 2. ClassName  : liveOnController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 라이브ON 수정 
    * 4. 작성자       : hjkim
    * 5. 작성일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/liveOnListModify")
    public ModelAndView kingerListModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String prdMstData = StringUtil.getString(commandMap.get("selectedPrdMstList"),"");
        List<Map<String, Object>> selectedPrdMstList = mapper.readValue(prdMstData, typeRef);
        
        commandMap.put("selectedPrdMstList", selectedPrdMstList);


        if(selectedPrdMstList != null && selectedPrdMstList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                // 관리자 수정
                this.liveOnService.updateLiveOnList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/liveOnList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/liveOnList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
}
