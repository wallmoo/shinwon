package com.market.mall.pc.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyPointService;

/**
 * 
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyPointController.java
 * @Date : 2014. 7. 10.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 포인트를 처리하는 Controller Class
 * @author LJH
 */
@Controller("pcMyPointController")
public class MyPointController {

    @Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
    @Resource(name="pcMyPointService")
    private MyPointService pcMyPointService;

    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: myPointList
	 * 2. ClassName		: MyPointController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 나의 포인트 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 7. 10. 오후 4:08:09
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPointList")
    public ModelAndView myPointList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request,commandMap);
            
            // 포인트 거래내역 갯수
            int totalCount = this.pcMyPointService.selectMyPointListCount(request,commandMap);
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount > 0)
            {
                // 포인트 거래내역
            	list = this.pcMyPointService.selectMyPointList(request,commandMap);
            }  
            
            //RETURN OBJECT
            mv.addObject("list", list);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
    
    /*
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myMileageList")
    public ModelAndView myMileageList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
     // 마이페이지 요약정보
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request,commandMap);
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    */
    
    /**
     * 2020.06.16 마이페이지 포인트 출력
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myMileageList")
    public ModelAndView myMileageList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
    	    	
    	if(SessionsUser.isLogin(request)) {
    		ModelAndView mv = new ModelAndView();
    		//2020.06.16 마이페이지 포인트 출력
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            commandMap.put("cPage",StringUtil.getString(commandMap.get("cPage"), "1"));
            
            Map<String, Object> myInfo = pcMyPointService.selectMyInfo(commandMap);
            int memSwId = 0;        
            if(myInfo.get("TMM.MEM_MST_SW_ID") != null) {        	
            	memSwId = Integer.valueOf(StringUtil.getString(myInfo.get("TMM.MEM_MST_SW_ID"),"-1"));
            	List<Map<String, Object>> memSwOne = pcMyPointService.selectMyPointSwOne(commandMap);
            	mv.addObject("memSwOne",memSwOne);
            }
            
            String formType = StringUtil.getString(commandMap.get("formType"), "tpnForm");
            
            commandMap.put("formType",formType);
            
            Map<String, Object> myEpointMap = pcMyPointService.selectMyEpoint(commandMap);
            
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH,  -1);
                    
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            String fromDate = StringUtil.getString(commandMap.get("fromDate"), sdf.format(cal.getTime()));
            String toDate = StringUtil.getString(commandMap.get("toDate"), sdf.format(new Date()));      
            
            commandMap.put("fromDate", fromDate);
            commandMap.put("toDate", toDate);
            
            int count = 0;
            int totalCount = 0;
            
            if(formType.equals("epointForm")) {
            	count = pcMyPointService.selectMyPointListCount(request, commandMap);           
                if(count > 0) {
                	List<Map<String, Object>> pointList = pcMyPointService.selectMyPointList(request, commandMap);
                	mv.addObject("pointList",pointList);
                	totalCount = count;
                }            
            }else { //통합포인트 사용조회 
            	List<Map<String, Object>> tpnMapList = pcMyPointService.selectMyTotPointList(request, commandMap);        	
            	if(tpnMapList != null && tpnMapList.size() > 0) {
            		totalCount = Integer.valueOf((String) tpnMapList.get(0).get("TOTAL_COUNT"));
            		mv.addObject("tpnMapList",tpnMapList);
            	}        	        	
            }
            
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "9"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            mv.addObject("formType",formType);
            mv.addObject("paging", paging);
            mv.addObject("memSwId",memSwId);
            mv.addObject("myEpointMap",myEpointMap);
            mv.addObject("commandMap", commandMap);
            
            return mv;
    	}else {
    		throw new PcAuthenticationException();
    	}                          
    }
}
