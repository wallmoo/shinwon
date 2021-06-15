package com.market.mall.am.stats.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.stats.service.StatsRewardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * 
 * @PackageName: com.market.mall.am.stats.controller
 * @FileName : StatsRewardController.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 리워드통계를 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class StatsRewardController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="statsRewardService") private StatsRewardService statsRewardService;
    @Resource(name="commonService") private CommonService commonService;

    /**
     * 
     * <pre>
     * 1. MethodName	: rewardStatsCouponDateList
     * 2. ClassName		: StatsRewardController.java
     * 3. Comment    	: 관리자 > 통계 > 리워드통계 > 쿠폰 통계
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 14. 오후 2:54:30
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/rewardStatsCouponDateList")
    public ModelAndView rewardStatsCouponDateList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        commandMap.put("searchCampaign", StringUtil.upperCase(StringUtil.getString(commandMap.get("searchCampaign"), "")));

    	//List<Map<String, Object>> list = this.statsRewardService.selectRewardStatsCouponDate(commandMap);
    	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        
    	//RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: rewardStatsCouponDateListExcel
     * 2. ClassName		: StatsRewardController.java
     * 3. Comment    	: 관리자 > 통계 > 리워드통계 > 쿠폰 통계 엑셀저장
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 14. 오후 2:55:10
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/rewardStatsCouponDateListExcel")
    public void rewardStatsCouponDateListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsRewardService.selectRewardStatsCouponDate(commandMap);
        
        String[] rowTitle = {"일자",      "캠페인ID","캠페인명","브랜드",   "쿠폰유효기간_FROM","쿠폰유효기간_TO","할인금액(율)","발행수",         "총발행금액",     "받은수",         "사용수",           "총쿠폰할인금액"};
        String[] cellSize = {"40",        "50",     "60",     "50",      "40",              "40",           "40",         "40",            "60",            "40",            "40",              "60"           };
        String[] dataName = {"ORDER_DATE","CMPG_ID","CMPG_NM","BRAND_CD","VALD_TRM_FROM",   "VALD_TRM_TO",  "ADD_DISC",   "CUPO_TOTAL_CNT","CUPO_TOTAL_AMT","CUPO_ISSUE_CNT","ORD_CUPO_USED_CNT","CUPO_DC_AMT" };
        String[] dataType = {"String",    "String", "String", "String",  "String",          "String",       "Dollar",     "Dollar",        "Dollar",        "Dollar",        "Dollar",           "Dollar"      };
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "rewardStatsCouponDateList_"+DateUtil.getToday());
    }

}
