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
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.stats.service.OrderChannelService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName: com.market.mall.am.stats.controller
 * @FileName : OrderChannelController.java
 * @Date : 2014. 8. 14.
 * @프로그램 설명 : 관리자 > 통계 > 회원통계를 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OrderChannelController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="orderChannelService") 
    private OrderChannelService orderChannelService;
    
    @Resource(name="commonService") 
    private CommonService commonService;
    
    @Resource(name ="propertiesService") 
    protected EgovPropertyService propertiesService;

    /**
	* <pre>
	* 1. MethodName : eventSurveyListAjax
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 설문 목록 
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 15.
	* </pre>
	*
	* @param response
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/stats/orderChannelListAjax")
	public JSON orderChannelListAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		List<Map<String,Object>> orderList = new ArrayList<Map<String,Object>>();
        
        	// 덧글 목록
		orderList = this.orderChannelService.selectOrderChannelList(commandMap);
        
        json.put("orderList", orderList);
        
		return json;
	}
    
    
    /**
     * <pre>
     * 1. MethodName	: orderChannelList
     * 2. ClassName		: OrderChannelController.java
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
    @RequestMapping(value="/am/stats/orderChannelList")
    public ModelAndView orderChannelList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
         
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-1),"-")));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        
           
        //commandMap.put("compCd", compCd);	// 법인코드 
        
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        list = this.orderChannelService.selectOrderChannelSumList(commandMap);
        
         
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName	: orderChannelListExcel
     * 2. ClassName		: OrderChannelController.java
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
    @RequestMapping(value="/am/stats/orderChannelListExcel")
    public void orderChannelListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        String compCd  = "003";
        
        //날짜 검색 조건에 - 제거 
        commandMap.put("searchStartDe", StringUtil.getString(commandMap.get("searchStartDate")).replaceAll("-", ""));
        commandMap.put("searchEndDe", StringUtil.getString(commandMap.get("searchEndDate")).replaceAll("-", ""));
         
        // list Info
        List<Map<String, Object>> dataList = this.orderChannelService.selectOrderChannelList(commandMap);
        
		String[] rowTitle = {"NO",     "주문번호", 
        					 "상품유형", "회원명", "상품코드", "상품명", "결제금액", "수량", "기간계상품코드", "결제수단",
        					 "주문일자", "주문상태"};
        String[] cellSize = {"30",   "60",       
        					 "40",   "40",   "30",     "100",	"50",	"30",	"40",	"50",  
        					 "50",   "50"};        
        String[] dataName = {"RNUM",     "ORD_MST_CD", 
        					 "PRD_MST_TYPE", "ORD_MST_ORD_NM", "PRD_MST_CD", "PRD_MST_NM", "ORD_PRD_ORD_PRC", "ORD_PRD_ORD_CNT", "PRD_MST_ERP_CD", "ORD_MST_PAY_TYPE",
        					 "ORD_MST_ORD_DT", "ORD_PRD_ORD_STATE"};
        String[] dataType = {"String",   "Dollar",       
							 "Dollar",   "Dollar",   "Dollar",     "Dollar",	"Dollar",	"Dollar",	"Dollar",	"Dollar",  
							 "Dollar",   "Dollar" };

        
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "orderChannel_"+DateUtil.getToday());
    }

  

}
