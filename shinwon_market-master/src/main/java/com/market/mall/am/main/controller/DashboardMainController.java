package com.market.mall.am.main.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.board.service.CommentBoardService;
import com.market.mall.am.customer.service.InquiryService;
import com.market.mall.am.customer.service.ProductInquiryService;
import com.market.mall.am.main.service.DashboardMainService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.main.controller
 * @FileName : DashboardMainController.java
 * @Date : 2014. 3. 11.
 * @프로그램 설명 : 관리자 메인을 처리하는 Controller Class
 * @author ejpark
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class DashboardMainController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="dashboardMainService")  private DashboardMainService dashboardMainService;
    @Resource(name="orderService") 			private OrderService orderService;
    @Resource(name="basicProductService") 	private BasicProductService basicProductService;
	@Resource(name="inquiryService")		private InquiryService inquiryService;
	@Resource(name="productInquiryService")		private ProductInquiryService productInquiryService;
    @Resource(name="commentBoardService")	private CommentBoardService commentBoardService;

	@Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;
	
	@Resource(name = "velocityEngine") 
	protected VelocityEngine velocityEngine;
	
	/**
     * <pre>
     * 1. MethodName : dashboardMain
     * 2. ClassName  : DashboardMainController.java
     * 3. Comment    : 관리자 메인 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/main/dashboardMain")
    public ModelAndView dashboardMain(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        mv.addObject("AUT_MST_IDX", admin.getAUT_MST_IDX());
        
        int AUT_MST_IDX = StringUtil.getInt(admin.getAUT_MST_IDX());
        
        commandMap.put("searchDate",DateUtil.getToday());
        commandMap.put("searchTime",DateUtil.getTime());
        commandMap.put("searchStartDate",DateUtil.addDay(DateUtil.getToday(),-7));
        commandMap.put("searchEndDate",DateUtil.getToday());
        commandMap.put("searchBeforeDate",DateUtil.addDay(DateUtil.getToday(),-30));
        
        mv.addObject("today", FormatUtil.formatDate(DateUtil.getToday(),"."));
        Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
        String[] week = { "일", "월", "화", "수", "목", "금", "토" };
        mv.addObject("day",week[oCalendar.get(Calendar.DAY_OF_WEEK) - 1]);
        
        
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        	
        	// MarketPlant 공지사항
        	List<Map<String,Object>> scmNoticeList = this.dashboardMainService.selectScmNoticeList(commandMap);
        	
        	// 최근 등록한 상품 Q&A
        	List<Map<String,Object>> scmProductInquiryList = this.dashboardMainService.selectScmProductInquiryList(commandMap);
        	
        	// 최근 등록한 상품후기
        	List<Map<String,Object>> scmProductCommentList = this.dashboardMainService.selectScmProductCommentList(commandMap);
        	
        	// MarketPlant 문의현황
        	List<Map<String,Object>> scmInquiryList = this.dashboardMainService.selectScmInquiryList(commandMap);
        	
        	mv.addObject("scmNoticeTotalCount", scmNoticeList.size());
        	mv.addObject("scmNoticeList", scmNoticeList);
        	mv.addObject("scmProductInquiryList", scmProductInquiryList);
        	mv.addObject("scmProductCommentList", scmProductCommentList);
        	mv.addObject("scmInquiryTotalCount", scmInquiryList.size());
        	mv.addObject("scmInquiryList", scmInquiryList);
        }
        
        if((AUT_MST_IDX == Code.SUPER_ADMINISTRATOR_IDX)||(AUT_MST_IDX == Code.MD_ADMINISTRATOR_IDX)||(AUT_MST_IDX == Code.MKT_ADMINISTRATOR_IDX)){
	        
	        // 주문/배송 현황
	        Map<String, Object> orderSummary = this.dashboardMainService.selectOrderSummary(commandMap);
	       
	        // 클레임 현황
	        Map<String, Object> orderClaim = this.dashboardMainService.selectOrderClaim(commandMap);
	        
	        // 상품 승인 현황
	        List<Map<String, Object>> selectProductApvSummaryList = this.dashboardMainService.selectProductApvSummaryList(commandMap);
	        // 상품 판매 현황
	        List<Map<String, Object>> selectProductSelSummaryList = this.dashboardMainService.selectProductSelSummaryList(commandMap);
	        
	        //견적문의 현황
	        List<Map<String, Object>> selectEstimateManagementSummaryList = this.dashboardMainService.selectEstimateManagementSummaryList(commandMap);
	        
	        //회원현황
	        Map<String,Object> selectMemberSummary = this.dashboardMainService.selectMemberSummary(commandMap);
	        
	        //세금계산서 신청현황
	        Map<String,Object> taxIvcState = this.dashboardMainService.selectTaxIvcState(commandMap);
	        
	        //CS상담 게시물현황
	    	List<Map<String,Object>> selectMemAdvList = this.dashboardMainService.selectMemAdvList(commandMap);
	    	
	    	//이벤트현황
	    	List<Map<String,Object>> selectEventList = this.dashboardMainService.selectEventList(commandMap);
	    	
	    	// 입점상담문의 현황
	    	Map<String,Object> vendorCounselState = this.dashboardMainService.selectVendorCounselState(commandMap);
	        
	    	// 미답변 상품문의
	        Map<String, Object> inqProductMap = new HashMap<String, Object>();
	        inqProductMap.put("BRD_INQ_TYPE",Code.INQUIRY_TYPE_PRODUCT);
	        inqProductMap.put("searchBrdInqReplyCd","N");
	        inqProductMap.put("startNum","1");
	        inqProductMap.put("endNum","5");
	        List<Map<String, Object>> inqProductList = this.productInquiryService.selectProductInquiryList(inqProductMap);
	
	        // 미답변 1:1문의
	        Map<String, Object> inqOntooneMap = new HashMap<String, Object>();
	        inqOntooneMap.put("BRD_INQ_TYPE",Code.INQUIRY_TYPE_ONE_TO_ONE);
	        inqOntooneMap.put("searchBrdInqReplyCd","N");
	        inqOntooneMap.put("startNum","1");
	        inqOntooneMap.put("endNum","5");
	        List<Map<String, Object>> inqOntooneList = this.inquiryService.selectInquiryList(inqOntooneMap);
	        
	        // 최근 등록된 상품평
	        Map<String, Object> commentBoardMap = new HashMap<String, Object>();
	        commentBoardMap.put("searchPrdRevUseYn","Y");
	        commentBoardMap.put("startNum","1");
	        commentBoardMap.put("endNum","5");
	//        List<Map<String, Object>> commentBoardList = this.commentBoardService.selectCommentBoardList(commentBoardMap);
	        
	        // 미상담 단체주문 문의
	//        Map<String, Object> inqGroupMap = new HashMap<String, Object>();
	//        inqGroupMap.put("searchGrpInqReplyYn","N");
	//        inqGroupMap.put("startNum","1");
	//        inqGroupMap.put("endNum","5");
	//        List<Map<String, Object>> inqGroupList = this.groupInquiryService.selectGroupInquiryList(inqGroupMap);
	        
	        //ERP DB 테스트용...
	        //this.dashboardMainService.selectErpDbTest(commandMap);
	        
	        //CRM DB 테스트용...
	        //this.dashboardMainService.selectCrmDbTest(commandMap);        
	        
	        mv.addObject("inqProductList", inqProductList);
	        mv.addObject("inqOntooneList", inqOntooneList);
	        mv.addObject("selectProductApvSummaryList", selectProductApvSummaryList);
	        mv.addObject("selectEstimateManagementSummaryList", selectEstimateManagementSummaryList);
	
	        mv.addObject("orderSummary", orderSummary);
	        mv.addObject("orderClaim", orderClaim);
	        
	        mv.addObject("selectProductSelSummaryList", selectProductSelSummaryList);
	        
	        mv.addObject("memberSummary" , selectMemberSummary);
	        
	        mv.addObject("taxIvcState" , taxIvcState);
	        
	        mv.addObject("selectMemAdvList", selectMemAdvList);
	        mv.addObject("selectEventList", selectEventList);
	        
	        mv.addObject("vendorCounselState", vendorCounselState);
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
}
