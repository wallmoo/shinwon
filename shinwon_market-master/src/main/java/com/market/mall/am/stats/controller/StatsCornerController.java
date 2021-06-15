package com.market.mall.am.stats.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.market.mall.am.stats.service.StatsCornerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * 
 * @PackageName: com.market.mall.am.stats.controller
 * @FileName : StatsCornerController.java
 * @Date : 2014. 10. 22.
 * @프로그램 설명 : 관리자 > 통계 > 매장별통계를 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class StatsCornerController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="statsCornerService") private StatsCornerService statsCornerService;
    @Resource(name="commonService") private CommonService commonService;

    /**
     * 
     * <pre>
     * 1. MethodName	: cornerStatsDeliveryList
     * 2. ClassName		: StatsCornerController.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 통계
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 22. 오전 11:54:00
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/cornerStatsDeliveryList")
    public ModelAndView cornerStatsDeliveryList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

    	//List<Map<String, Object>> list = this.statsCornerService.selectCornerStatsDelivery(commandMap);
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: cornerStatsDeliveryListExcel
     * 2. ClassName		: StatsCornerController.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 통계 엑셀저장
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 22. 오전 11:58:36
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/cornerStatsDeliveryListExcel")
    public void cornerStatsDeliveryListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsCornerService.selectCornerStatsDelivery(commandMap);
        
        String[] rowTitle = {"브랜드",   "매장코드", "매장명",    "유통채널",      "배송완료건수","교환완료건수","반품완료건수","배송합계건수","배송거부건수","배송합계상품 예상매출액" };
        String[] cellSize = {"40",      "40",       "50",       "50",           "50",        "50",         "50",        "50",         "50",        "50"                   };
        String[] dataName = {"BRAND_CD","CORNER_CD","CORNER_NM","TRADE_TYPE_NM","DLV_CNT",   "CHG_CNT",    "BCK_CNT",   "TOT_CNT",    "RJT_CNT",   "SALE_PRICE"           };
        String[] dataType = {"String",  "String",   "String",   "String",       "Dollar",    "Dollar",     "Dollar",    "Dollar",     "Dollar",    "Dollar"               };
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "cornerStatsDeliveryList_"+DateUtil.getToday());
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: cornerStatsDeliveryPopup
     * 2. ClassName		: StatsCornerController.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 HISTORY
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 22. 오전 11:54:00
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/cornerStatsDeliveryPopup")
    public ModelAndView cornerStatsDeliveryPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        commandMap.put("searchType", StringUtil.getString(commandMap.get("searchType"), "DeliveryHistory"));

    	List<Map<String, Object>> info = this.statsCornerService.selectCornerStatsDelivery(commandMap);
    	List<Map<String, Object>> list = null;
    	
    	if (StringUtil.getString(commandMap.get("searchType")).equals("SendEnd"))
    	{
    		//list = this.statsCornerService.selectCornerStatsSendEndList(commandMap);
    	}
    	else if (StringUtil.getString(commandMap.get("searchType")).equals("SwapEnd"))
    	{
    		//list = this.statsCornerService.selectCornerStatsSwapEndList(commandMap);
    	}
    	else if (StringUtil.getString(commandMap.get("searchType")).equals("BackEnd"))
    	{
    		//list = this.statsCornerService.selectCornerStatsBackEndList(commandMap);
    	}
    	else
    	{
        	//list = this.statsCornerService.selectCornerStatsDeliveryHistory(commandMap);
    	}
        
        //RETURN OBJECT
        mv.addObject("info", info);
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: cornerStatsDeliveryPopupExcel
     * 2. ClassName		: StatsCornerController.java
     * 3. Comment    	: 관리자 > 통계 > 매장별통계 > 배송완료/거부 통계 엑셀저장
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 10. 22. 오전 11:58:36
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/cornerStatsDeliveryPopupExcel")
    public void cornerStatsDeliveryPopupExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        if (StringUtil.getString(commandMap.get("searchType")).equals("SendEnd"))
    	{
        	List<Map<String, Object>> dataList = this.statsCornerService.selectCornerStatsSendEndList(commandMap);
            String[] rowTitle = {"주문번호",       "상품코드",            "상품명",        "주문수량",          "배송요청시간","송장번호등록시간","배송완료시간",   "예상매출액" };
            String[] cellSize = {"50",            "50",                 "60",            "40",               "60",        "60",            "60",           "60"        };
            String[] dataName = {"ORD_ORD_MST_CD","PRD_OPT_ERP_PROD_CD","PRD_MST_NM","ORD_PRD_ORD_CNT","REQ_DATE",  "INVOICE_DATE",  "SEND_END_DATE","SALE_PRICE"};
            String[] dataType = {"String",        "String",             "String",        "Dollar",           "String",    "String",        "String",       "Dollar"    };
            ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "cornerStatsSendEndList_"+DateUtil.getToday());
    	}
    	else if (StringUtil.getString(commandMap.get("searchType")).equals("SwapEnd"))
    	{
    		List<Map<String, Object>> dataList = this.statsCornerService.selectCornerStatsSwapEndList(commandMap);
            String[] rowTitle = {"주문번호",       "상품코드",            "상품명",        "주문수량",          "배송요청시간","송장번호등록시간","교환완료시간",   "예상매출액" };
            String[] cellSize = {"50",            "50",                 "60",            "40",               "60",        "60",            "60",           "60"        };
            String[] dataName = {"ORD_ORD_MST_CD","PRD_OPT_ERP_PROD_CD","PRD_MST_NM","ORD_PRD_ORD_CNT","REQ_DATE",  "INVOICE_DATE",  "SEND_END_DATE","SALE_PRICE"};
            String[] dataType = {"String",        "String",             "String",        "Dollar",           "String",    "String",        "String",       "Dollar"    };
            ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "cornerStatsSwapEndList_"+DateUtil.getToday());
    	}
    	else if (StringUtil.getString(commandMap.get("searchType")).equals("BackEnd"))
    	{
    		List<Map<String, Object>> dataList = this.statsCornerService.selectCornerStatsBackEndList(commandMap);
            String[] rowTitle = {"주문번호",       "상품코드",            "상품명",        "주문수량",          "배송요청시간","송장번호등록시간","반품완료시간",   "예상매출액" };
            String[] cellSize = {"50",            "50",                 "60",            "40",               "60",        "60",            "60",           "60"        };
            String[] dataName = {"ORD_ORD_MST_CD","PRD_OPT_ERP_PROD_CD","PRD_MST_NM","ORD_PRD_ORD_CNT","REQ_DATE",  "INVOICE_DATE",  "SEND_END_DATE","SALE_PRICE"};
            String[] dataType = {"String",        "String",             "String",        "Dollar",           "String",    "String",        "String",       "Dollar"    };
            ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "cornerStatsBackEndList_"+DateUtil.getToday());
    	}
    	else
    	{
    		List<Map<String, Object>> dataList = this.statsCornerService.selectCornerStatsDeliveryHistory(commandMap);
            String[] rowTitle = {"주문번호",       "상품코드",            "상품명",        "주문수량",          "확인상태",     "배송요청시간","확인/거부시간","송장번호등록시간","배송완료상품 예상매출액" };
            String[] cellSize = {"50",            "50",                 "60",            "40",               "40",          "60",        "60",         "60",            "60"                   };
            String[] dataName = {"ORD_ORD_MST_CD","PRD_OPT_ERP_PROD_CD","PRD_MST_NM","ORD_PRD_ORD_CNT","DLV_TRANS_NM","REQ_DATE",  "RCV_DATE",   "INVOICE_DATE",  "SALE_PRICE"           };
            String[] dataType = {"String",        "String",             "String",        "Dollar",           "String",      "String",    "String",     "String",        "Dollar"               };
            ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "cornerStatsDeliveryHistory_"+DateUtil.getToday());
    	}
        
    }

}
