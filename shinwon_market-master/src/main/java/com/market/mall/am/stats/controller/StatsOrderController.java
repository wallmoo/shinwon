package com.market.mall.am.stats.controller;

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
import com.market.mall.am.stats.service.StatsOrderService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * 
 * @PackageName: com.market.mall.am.stats.controller
 * @FileName : StatsOrderController.java
 * @Date : 2014. 8. 12.
 * @프로그램 설명 : 관리자 > 통계 > 매출분석을 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class StatsOrderController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="statsOrderService") private StatsOrderService statsOrderService;
    @Resource(name="commonService") private CommonService commonService;
    
    /**
    * <pre>
    * 1. MethodName : orderStatsSalesList
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 판매실적
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsSalesList")
    public ModelAndView orderStatsSalesList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

    	 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
         	list = this.statsOrderService.selectOrderStatsSales(commandMap);
         }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsSalesListExcel
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 판매실적 엑셀 다운로드
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 17.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsSalesListExcel")
    public void orderStatsSalesListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsOrderService.selectOrderStatsSales(commandMap);
        
        String[] rowTitle = {"브랜드",   "일자",	"주문금액",	"쿠폰",       "포인트",	"OK캐쉬백",	"배송비", 		"일별실적"};
        String[] cellSize = { "60",       "60",        "60",        "60",        "60",           "60",         "60",       "60"};
        String[] dataName = {"ORD_MST_BRAND_NM","ORDER_DT","REMAIN_ORD_MST_ORD_PRC",  "ORD_MST_DC_CPN","REMAIN_ORD_MST_DC_MLG", "ORD_MST_DC_OCB_PIT", "ORD_MST_DLV_CAG","REAL_ORD_MST_ORD_PRC"};
        String[] dataType = {"String",    "String",   "Dollar",       "Dollar",        "Dollar",   "Dollar",    "Dollar",    "Dollar"};
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "OrderStatsSalesList_"+DateUtil.getToday());
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsSalesDetailPopup
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 판매실적 상세 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsSalesDetailPopup")
    public ModelAndView orderStatsSalesDetailPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

    	List<Map<String, Object>> list = this.statsOrderService.selectOrderStatsSalesDetail(commandMap);
        
        //RETURN OBJECT
    	//브랜드 유형 리스트
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsProductList
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 판매상품
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsProductList")
    public ModelAndView orderStatsProductList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

    	 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
         	list = this.statsOrderService.selectOrderStatsProduct(commandMap);
         }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsProductListExcel
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 판매상품 엑셀 다운로드
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 19.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsProductListExcel")
    public void orderStatsProductListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsOrderService.selectOrderStatsProduct(commandMap);
        
        String[] rowTitle = {"판매순위",   "상품코드",	"상품명",		"주문수량",       "주문금액",		"취소수량",		"취소금액", 		"반품수량", 		"반품금액"};
        String[] cellSize = { "60",       "60",        "60",        "60",        "60",           "60",         "60",       "60",		"60"};
        String[] dataName = {"RNUM","PRD_MST_CD","PRD_MST_NM",  "PAY_ORD_PRD_ORD_CNT","PAY_ORD_PRD_ORD_PRC", "CANCEL_ORD_PRD_ORD_CNT", "CANCEL_ORD_PRD_ORD_PRC","RETURN_ORD_PRD_ORD_CNT","RETURN_ORD_PRD_ORD_PRC"};
        String[] dataType = {"String",    "String",   "String",       "Dollar",        "Dollar",   "Dollar",    "Dollar",    "Dollar",    "Dollar"};
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "OrderStatsProductList_"+DateUtil.getToday());
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsCustomerUnitList
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 객단가
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsCustomerUnitList")
    public ModelAndView orderStatsCustomerUnitList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

    	 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
         	list = this.statsOrderService.selectOrderStatsCustomerUnit(commandMap);
         }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsCustomerUnitListExcel
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 객단가 엑셀 다운로드
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsCustomerUnitListExcel")
    public void orderStatsCustomerUnitListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsOrderService.selectOrderStatsCustomerUnit(commandMap);
        
        String[] rowTitle = {"브랜드",   "대분류",		"중분류",		"소분류",       "주문금액",		"객수",	"객단가"};
        String[] cellSize = { "60",       "60",        "60",        "60",        "60",           "60",         "60"};
        String[] dataName = {"ORD_MST_BRAND_NM","TOP_CAT_NM","UP_CAT_NM",  "PRD_CTG_NM","SUM_ORD_PRD_ORD_PRC", "CUSTOMER_CNT", "CUSTOMER_UNIT_PRICE"};
        String[] dataType = {"String",    "String",    "String",	"String",	 "Dollar",    "Dollar",    "Dollar"};
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "OrderStatsCustomerUnitList_"+DateUtil.getToday());
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsRegularStorePopup
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매장별통계 > 배송매장 > 단골매장 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsRegularStorePopup")
    public ModelAndView orderStatsRegularStorePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // 매장 목록 갯수
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.statsOrderService.selectOrderStatsRegularStoreCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
        	// 매장 목록
            list = this.statsOrderService.selectOrderStatsRegularStoreList(commandMap);
        }

        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderMallStatsShopList
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매장별통계 > 배송매장
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderMallStatsShopList")
    public ModelAndView orderMallStatsShopList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

    	 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
         	list = this.statsOrderService.selectOrderStatsShop(commandMap);
         }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/stats/orderStatsShopList");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsShopListExcel
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매장별통계 > 배송매장 엑셀다운로드
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 18.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsShopListExcel")
    public void orderStatsShopListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsOrderService.selectOrderStatsShop(commandMap);
        
        String[] rowTitle = {"브랜드",   "매장명",		"매장코드",		"결제금액",       "결제건수",		"취소/반품금액",		"취소/반품건수"};
        String[] cellSize = { "60",       "60",        "60",        "60",        "60",           "60",         "60"};
        String[] dataName = {"ORD_MST_BRAND_NM","ORD_PRD_BCNC_NM","ORD_MST_BCNC_CD",  "PAY_PAYMENT_PRICE","PAY_ORD_MST_CNT", "CANCEL_PAYMENT_PRICE", "CANCEL_ORD_MST_CNT"};
        String[] dataType = {"String",    "String",    "String",	"Dollar",	 "Dollar",    "Dollar",    "Dollar"};
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "OrderStatsShopList_"+DateUtil.getToday());
    }
    
     
    /**
    * <pre>
    * 1. MethodName : orderStatsAgeSexList
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 성별/연령별
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 19.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsAgeSexList")
    public ModelAndView orderStatsAgeSexList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday(""),-7),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

    	 List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
         	list = this.statsOrderService.selectOrderStatsAgeSex(commandMap);
         }
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderStatsAgeSexListExcel
    * 2. ClassName  : StatsOrderController.java
    * 3. Comment    : 매출통계 > 성별/연령별 엑셀 다운로드
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 8. 19.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @throws Exception
    */
    @RequestMapping(value="/am/stats/orderStatsAgeSexListExcel")
    public void orderStatsAgeSexListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        // list Info
        List<Map<String, Object>> dataList = this.statsOrderService.selectOrderStatsAgeSex(commandMap);
        
        String[] rowTitle = {"성별",   "연령대",	"고객수",		"주문건수",       "주문금액",		"매출건수",	"매출금액", 		"상품단가", 		"주문단가",		"객단가"};
        String[] cellSize = { "60",       "60",        "60",        "60",        "60",           "60",         "60",       "60",       "60",       "60"};
        String[] dataName = {"SEX_DIV_NM","AGE_BOUND_NM","MEMBER_CNT",  "ORDER_CNT","ORDER_PRD_PRICE", "PAY_ORDER_CNT", "PAY_ORDER_PRD_PRICE","PRD_PRICE","ORD_PRICE","MEMBER_PRICE"};
        String[] dataType = {"String",    "String",   "Dollar",       "Dollar",        "Dollar",   "Dollar",    "Dollar",    "Dollar",    "Dollar",    "Dollar"};
        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "OrderStatsAgeSextList_"+DateUtil.getToday());
    }
}
