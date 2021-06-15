package com.market.mall.am.sms.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.sms.service.SmsService;
import com.market.mall.model.Paging;

@Controller
public class SmsController {
	
	@Resource(name="smsService") private SmsService smsService;
	
	/**
	* <pre>
	* 1. MethodName : smsLogList
	* 2. ClassName  : SmsController.java
	* 3. Comment    : sms 발송내역 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2015. 2. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/sms/smsLogList")
	public ModelAndView smsLogList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// 기본값 설정 - 검색 날짜
        commandMap.put("searchSendYear", StringUtil.getString(commandMap.get("searchSendYear"), String.valueOf(DateUtil.getCurrentYear())));//현재 년이 default
        commandMap.put("END_SEARCH_SEND_YEAR", String.valueOf(DateUtil.getCurrentYear()));//현재 년까지.
        
        // 검색 연월
    	String searchYear = StringUtil.getString(commandMap.get("searchSendYear"),"");
    	String searchMonth = StringUtil.getString(commandMap.get("searchSendMonth"),"");
    	String searchDay = StringUtil.getString(commandMap.get("searchSendDay"),"");
    	
    	// 검색 일자(day가 있는 경우에만 검색)
    	String searchDate = "";
    	if(!("").equals(searchDay)){
    		searchDate = searchYear + searchMonth + searchDay;
    	}
    	commandMap.put("searchDate", searchDate);
    	
    	// 발송형태
        String searchSendType = StringUtil.getString(commandMap.get("searchSendType"),"");
        
        // log 테이블 명
        String tableName = "";
        if("lms".equals(searchSendType)){
        	tableName = "MMS_LOG_" + searchYear + searchMonth;
        }else{
        	tableName = "SC_LOG_" + searchYear + searchMonth;
        }
        
        commandMap.put("TABLE_NAME", tableName);
        
        // sms log 목록 갯수
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.smsService.selectSmsLogListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
            // sms log 관리 목록
        	list = this.smsService.selectSmsLogList(commandMap);
        }        

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
		
		
		return mv;
	}
}
