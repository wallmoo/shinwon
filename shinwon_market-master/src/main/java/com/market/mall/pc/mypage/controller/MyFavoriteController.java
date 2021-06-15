package com.market.mall.pc.mypage.controller;

import java.util.ArrayList;
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
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyFavoriteService;
import com.market.mall.pc.mypage.service.MyPageService;



@Controller("pcMyFavoriteController")
public class MyFavoriteController {
	
	@Resource(name="pcMyPageService")
	private MyPageService pcMyPageService;
	    
	@Resource(name="pcMyFavoriteService") 
	private MyFavoriteService pcMyFavoriteService;
	    
	@Resource(name="pcCommonService") 
	private CommonService pcCommonService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myFavoriteList")
	public ModelAndView myFavoriteList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		if(SessionsUser.isLogin(request)){
			ModelAndView mv = new ModelAndView();
		   
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

			List<String> firstDepthCtg = new ArrayList<String>();
			firstDepthCtg = this.pcMyFavoriteService.selectFirstDepthCtg(commandMap);
			Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
	        List<Map<String,Object>> myFavorite = this.pcMyFavoriteService.selectMyFavoriteList(commandMap); 
		    mv.addObject("summaryMap", summaryMap);
		    mv.addObject("commandMap", commandMap);
		    mv.addObject("firstDepthCtg", firstDepthCtg);
		    mv.addObject("myFavorite", myFavorite);
		    mv.addObject("myFavoritecnt", myFavorite.size());
		    
		    return mv;
		}else{
			   throw new PcAuthenticationException();
		}
		
	}

	@RequestMapping("/pc/mypage/myFavoriteListAjax")
	public JSON myFavoriteListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			
			List<String> secondDepthCtg = new ArrayList<String>();
			secondDepthCtg = this.pcMyFavoriteService.selectSecondDepthCtg(commandMap);
			Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
			
		    json.addObject("summaryMap", summaryMap);
		    json.addObject("commandMap", commandMap);
		    json.addObject("secondDepthCtg", secondDepthCtg);
			if(secondDepthCtg.size() > 0)
	        {
	            json.put("result", "success");
	        }     
			else
			{
				json.put("result", "error");
			}    
		    return json;
		
	}
	
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPageInertCtgAjax")
    public JSON myPageInertCtgAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, String PRD_MST_CD) throws Exception
    {
		JSON json = new JSON();			
        int result=0;
        String prdCtgCd1 = StringUtil.getString(commandMap.get("PRD_CTG_IDX1"), null); 
        String prdCtgCd2 = StringUtil.getString(commandMap.get("PRD_CTG_IDX2"), null); 
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        commandMap.put("PRD_CTG_IDX_L1", prdCtgCd1);
        commandMap.put("PRD_CTG_IDX_L2", prdCtgCd2);
        
        
        
        
        
        System.out.println("================================>>>"+prdCtgCd1);
        System.out.println("================================>>>"+prdCtgCd2);
        result=this.pcMyFavoriteService.myPageInertCtgAjax(commandMap);
		
		  if(result > 0) { 
			  json.put("result", "success"); 
			  } 
		  else { json.put("result","error"); 
		     }
		         
        return json;
    }
	
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPageDelCtgAjax")
    public JSON myPageDelCtgAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, String PRD_MST_CD) throws Exception
    {
		JSON json = new JSON();			
        int result=0;
        String prdCtgCd1 = StringUtil.getString(commandMap.get("MEM_CTG_IDX"), null); 
        commandMap.put("MEM_CTG_IDX", prdCtgCd1);
        
        System.out.println("================================>>>"+prdCtgCd1);
        result=this.pcMyFavoriteService.myPageDelCtgAjax(commandMap);
		
		  if(result > 0) { 
			  json.put("result", "success"); 
			  } 
		  else { json.put("result","error"); 
		     }
		         
        return json;
    }
	
}
