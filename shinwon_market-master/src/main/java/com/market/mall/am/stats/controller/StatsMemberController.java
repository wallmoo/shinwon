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
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.stats.service.StatsMemberService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName: com.market.mall.am.stats.controller
 * @FileName : StatsMemberController.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 회원통계를 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class StatsMemberController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="statsMemberService") 
    private StatsMemberService statsMemberService;
    
    @Resource(name="commonService") 
    private CommonService commonService;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;

    
    /**
     * <pre>
     * 1. MethodName	: memberJoinDateList
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 성별/연령별 가입 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberJoinDateList")
    public ModelAndView memberJoinDateList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String compCd  = "003";
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-3),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        commandMap.put("compCd", compCd);	// 법인코드 
        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
        	list = this.statsMemberService.selectMemberJoinDate(commandMap);
        }
         
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName	: memberJoinDateListExcel
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 성별/연령별 가입 통계 엑셀저장
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberJoinDateListExcel")
    public void memberStatsDateListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        String compCd  = "003";
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        commandMap.put("compCd", compCd);	// 법인코드 
        // list Info
        List<Map<String, Object>> dataList = this.statsMemberService.selectMemberJoinDate(commandMap);
        
        String[] rowTitle = {"일자",     "총합계", 
        					 "남성 19세 이하", "남성 20대", "남성 30대", "남성 40대", "남성 50대", "남성 60대 이상", "남성 기타", "남성 합계",
        					 "여성 19세 이하", "여성 20대", "여성 30대", "여성 40대", "여성 50대", "여성 60대 이상", "여성 기타", "여성 합계",
        					 "성별없음"};
        String[] cellSize = {"60",   "40",       
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40",  
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40", 
        					 "40"};        
        String[] dataName = {"MEMB_JOIN_DE",     "TOTAL", 
        					 "M1", "M2", "M3", "M4", "M5", "M6", "M9", "M0",
        					 "W1", "W2", "W3", "W4", "W5", "W6", "W9", "W0",
        					 "ETC"};
        String[] dataType = {"String",   "Dollar",       
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar",  
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar", 
							 "Dollar"};

        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "memberJoinDateList_"+DateUtil.getToday());
    }

    /**
     * <pre>
     * 1. MethodName	: memberJoinPathDateList
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 가입경로 가입 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberJoinPathDateList")
    public ModelAndView memberJoinPathDateList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String compCd  = "003";
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-3),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        
        commandMap.put("compCd", compCd);	// 법인코드 
        

        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
        	list = this.statsMemberService.selectMemberJoinDate(commandMap);
        }
         
        //RETURN OBJECT
        //mv.addObject("joinPathList", this.commonService.selectErpCode(joinPathCode, compCd));
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName	: memberJoinPathDateListExcel
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 가입경로 가입 통계 엑셀저장
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberJoinPathDateListExcel")
    public void memberJoinPathDateListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        String compCd  = "003";
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        
        commandMap.put("compCd", compCd);	// 법인코드 
        // list Info
        List<Map<String, Object>> dataList = this.statsMemberService.selectMemberJoinDate(commandMap);
        
        String[] rowTitle = {"일자",     "총합계", 
        					 "남성 19세 이하", "남성 20대", "남성 30대", "남성 40대", "남성 50대", "남성 60대 이상", "남성 기타", "남성 합계",
        					 "여성 19세 이하", "여성 20대", "여성 30대", "여성 40대", "여성 50대", "여성 60대 이상", "여성 기타", "여성 합계",
        					 "성별없음"};
        String[] cellSize = {"60",   "40",       
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40",  
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40", 
        					 "40"};        
        String[] dataName = {"MEMB_JOIN_DE",     "TOTAL", 
        					 "M1", "M2", "M3", "M4", "M5", "M6", "M9", "M0",
        					 "W1", "W2", "W3", "W4", "W5", "W6", "W9", "W0",
        					 "ETC"};
        String[] dataType = {"String",   "Dollar",       
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar",  
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar", 
							 "Dollar"};

        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "memberJoinPathDateList_"+DateUtil.getToday());
    }
    
    /**
     * <pre>
     * 1. MethodName : joinPathAjax
     * 2. ClassName  : StatsMemberController.java
     * 3. Comment    : 관리자 > 통계 > 회원통계 > 가입경로 가입 통계 > 가입경로 리스트 조회 AJAX
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/joinPathAjax")
    public JSON subCategoryProductAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 법인코드
        String compCd  = "003";
        
        commandMap.put("COMP_CD", compCd);
        
        List<Map<String, Object>> list =  this.statsMemberService.selectErpJoinPath(commandMap);

        json.put("joinPathList", list);
        
        return json;
    }
    
    
    /**
     * <pre>
     * 1. MethodName	: memberOrderAreaList
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 지역별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberOrderAreaList")
    public ModelAndView memberJoinAreaList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String compCd  = "003";
        
        // 공통 erp link명 
        commandMap.put("erpCommonLinkNm", "");
        
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-3),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        
        commandMap.put("compCd", compCd);	// 법인코드
        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
        	list = this.statsMemberService.selectMemberOrderArea(commandMap);
        }
         
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName	: memberOrderAreaListExcel
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 지역별 통계 엑셀저장
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberOrderAreaListExcel")
    public void memberOrderAreaListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        String compCd  = "003";
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        // 공통 erp link명 
        commandMap.put("erpCommonLinkNm", "");
        
        commandMap.put("compCd", compCd);	// 법인코드 
        
        // list Info
        List<Map<String, Object>> dataList = this.statsMemberService.selectMemberOrderArea(commandMap);
        
        String[] rowTitle = {"지역",     "총합계", 
        					 "남성 19세 이하", "남성 20대", "남성 30대", "남성 40대", "남성 50대", "남성 60대 이상", "남성 기타", "남성 합계",
        					 "여성 19세 이하", "여성 20대", "여성 30대", "여성 40대", "여성 50대", "여성 60대 이상", "여성 기타", "여성 합계",
        					 "성별없음"};
        String[] cellSize = {"60",   "40",       
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40",  
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40", 
        					 "40"};        
        String[] dataName = {"AREA_NM",     "TOTAL", 
        					 "M1", "M2", "M3", "M4", "M5", "M6", "M9", "M0",
        					 "W1", "W2", "W3", "W4", "W5", "W6", "W9", "W0",
        					 "ETC"};
        String[] dataType = {"String",   "Dollar",       
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar",  
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar", 
							 "Dollar"};

        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "memberOrderAreaList_"+DateUtil.getToday());
    }
    
    
    /**
     * <pre>
     * 1. MethodName	: memberOrderPriceList
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 주문금액별 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberOrderPriceList")
    public ModelAndView memberOrderPriceList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String compCd  = "003";
                
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-3),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        
        commandMap.put("compCd", compCd);	// 법인코드
        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
        	list = this.statsMemberService.selectMemberOrderPrice(commandMap);
        }
         
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName	: memberOrderPriceListExcel
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 주문금액별 통계 엑셀저장
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberOrderPriceListExcel")
    public void memberOrderPriceListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        String compCd  = "003";
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
            
        
        commandMap.put("compCd", compCd);	// 법인코드 
        
        // list Info
        List<Map<String, Object>> dataList = this.statsMemberService.selectMemberOrderPrice(commandMap);
        
        String[] rowTitle = {"브랜드",     "총합계", 
        					 "남성 19세 이하", "남성 20대", "남성 30대", "남성 40대", "남성 50대", "남성 60대 이상", "남성 기타", "남성 합계",
        					 "여성 19세 이하", "여성 20대", "여성 30대", "여성 40대", "여성 50대", "여성 60대 이상", "여성 기타", "여성 합계",
        					 "성별없음"};
        String[] cellSize = {"60",   "40",       
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40",  
        					 "40",   "40",   "40",     "40",	"40",	"40",	"40",	"40", 
        					 "40"};        
        String[] dataName = {"BRAND_NM",     "TOTAL", 
        					 "M1", "M2", "M3", "M4", "M5", "M6", "M9", "M0",
        					 "W1", "W2", "W3", "W4", "W5", "W6", "W9", "W0",
        					 "ETC"};
        String[] dataType = {"String",   "Dollar",       
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar",  
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar", 
							 "Dollar"};

        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "memberOrderPriceList_"+DateUtil.getToday());
    }
    
    /**
     * <pre>
     * 1. MethodName	: memberOrderRateList
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 구매율 통계
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberOrderRateList")
    public ModelAndView memberOrderRateList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-3),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("Y") ){
        	list = this.statsMemberService.selectMemberOrderRate(commandMap);
        }
         
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName	: memberOrderRateListExcel
     * 2. ClassName		: StatsMemberController.java
     * 3. Comment    	: 관리자 > 통계 > 회원통계 > 구매율 통계 엑셀저장
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 8. 17.
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/stats/memberOrderRateListExcel")
    public void mmemberOrderRateListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
        
        // list Info
        List<Map<String, Object>> dataList = this.statsMemberService.selectMemberOrderRate(commandMap);
        
        String[] rowTitle = {"구분",     "주문고객수", "주문건수",  "고객구성비율(%)", "건수비율(%)",  "주문고객당 평균 주문건수"};
        String[] cellSize = {"40",       "40",         "40",        "60",              "40",           "80" };  
        String[] dataName = {"ORDER_DIV","CUST_CNT",   "ORDER_CNT", "CUST_RATE",       "ORDER_RATE",   "AVG_CNT" };  
        String[] dataType = {"String",   "Dollar",     "Dollar",    "Dollar",          "Dollar",       "Dollar" };  

        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "memberOrderRateList_"+DateUtil.getToday());
    }

}
