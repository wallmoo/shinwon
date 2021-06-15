package com.market.mall.am.order.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.order.service.OrderErrorService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.am.site.service.BasicManagerService;
import com.market.mall.am.site.service.DelivCompanyService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName: com.market.mall.am.order.controller
 * @FileName : OrderController.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 : 관리자 > 주문관리 > 전체주문을 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OrderController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="orderService") private OrderService orderService;
    @Resource(name="commonService") private CommonService commonService;
	@Resource(name="delivCompanyService") private DelivCompanyService delivCompanyService;
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	@Resource (name="orderErrorService") private OrderErrorService orderErrorService;
	@Resource(name="vendorManagerService") private VendorManagerService vendorManagerService;
	@Resource(name="basicManagerService") private BasicManagerService basicManagerService;
	
    /**
     * 
     * <pre>
     * 1. MethodName	: orderList
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:30:30
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/am/order/order{path}List")
    public ModelAndView orderList(HttpServletRequest request
    		, @RequestParams() Map<String, Object> commandMap
    		, @PathVariable("path") String path) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //주문상태값
        String searchOrdPrdOrderState = StringUtil.getString(commandMap.get("searchOrdPrdOrderState"), "");
        int[] searchOrdPrdOrderStateArr = null;
        
        //주문상태값 이름
        String orderTotal = "전체주문";
        String orderStateNm = orderTotal;
        String title = orderTotal;
        if("PayReady".equals(path)) // 입금대기
        {
        	searchOrdPrdOrderState = String.valueOf(Code.OST_PAY_READY);
        	orderStateNm = "입금대기";
        	title = "입금대기";
        }
        else if("Pay".equals(path)) // 결제완료
        {
        	searchOrdPrdOrderState = String.valueOf(Code.OST_PAY);
        	orderStateNm = "결제완료";
        	title = "결제완료";
        }
        else if("Send".equals(path)) // 배송관리
        {
        	searchOrdPrdOrderStateArr = Code.OST_SEND_ARR;//배송준비중, 배송중, 배송완료
        	orderStateNm = "배송관리";
        	title = "배송관리";
        }
        else if("Fix".equals(path)) // 구매확정
        {
        	searchOrdPrdOrderState = String.valueOf(Code.OST_FIX);
        	orderStateNm = "구매확정";
        	title = "구매확정";
        }
        else if("Cancel".equals(path)) // 취소관리
        {
        	commandMap.put("showDateYn", "Y"); //처리일자 show
        	searchOrdPrdOrderStateArr = Code.OST_CANCEL_ARR;//취소접수, 취소완료, 환불완료
        	orderStateNm = "취소관리";
        	title = "취소관리";
        }
        else if("Swap".equals(path)) // 교환관리
        {
        	commandMap.put("showDateYn", "Y"); //처리일자 show
        	searchOrdPrdOrderStateArr = Code.OST_SWAP_ARR;//교환접수, 교환접수승인, 교환대기중, 교환완료, 교환회수지시, 교환회수완료
        	orderStateNm = "교환관리";
        	title = "교환관리";
        }
        else if("Back".equals(path)) // 반품관리
        {
        	commandMap.put("searchBack", "Y"); 
        	commandMap.put("showDateYn", "Y"); //처리일자 show
        	searchOrdPrdOrderStateArr = Code.OST_BACK_ARR;//반품접수, 반품접수승인(반품대기중), 반품회수완료(반품승인), 반품완료, 반품취소, 반품불가
        	orderStateNm = "반품관리";
        	title = "반품관리";
        }
        else if("Refund".equals(path)) // 환불관리
        {
        	commandMap.put("showDateYn", "Y"); //처리일자 show
        	searchOrdPrdOrderStateArr = Code.OST_REFUND_ARR;//환불접수, 환불완료
        	orderStateNm = "환불관리";
        	title = "환불관리";
        }
        else if("ScmCancel".equals(path)) // 입점업체 취소요청
        {
        	commandMap.put("searchScmCancel", "Y");
        	orderStateNm = "입점업체취소요청";
        	title = "입점업체취소요청";
        }
//        else if("OpenMarket".equals(path)) // 오픈마켓 주문조회 (2020.06.26 미사용)
//        {
//        	orderStateNm = "오픈마켓 주문조회";
//        	title = "오픈마켓주문조회";
//        }
        else if("ScmOrder".equals(path)) // 입점업체 주문조회(통합관리자용)
        {
        	commandMap.put("searchScmOrder", "Y");
        	orderStateNm = "입점업체 주문조회(통합)";
        	title = "입점업체주문조회(통합)";
        }
        else if("OnlyScmOrder".equals(path)) // 입점업체 주문조회(SCM 관리자용)
        {
        	commandMap.put("searchOnlyScmOrder", "Y");
        	orderStateNm = "입점업체 주문조회(SCM)";
        	title = "입점업체주문조회(SCM)";
        }
//        else if("CleanKing".equals(path)) // 클린킹 주문조회 (2020.06.26 미사용)
//        {
//        	commandMap.put("searchDlvType", Code.DLV_TYPE_SERVICE);
//        	searchOrdPrdOrderStateArr = Code.OST_CLEANKING_ARR;//예약신청, 취소, 확정
//        	orderStateNm = "클린킹주문조회";
//        	title = "클린킹주문조회";
//        }
        else if("ShpDelv".equals(path)) { //2020.06.26 수정
        	commandMap.put("searchDlvTypeArr", Code.DLV_TYPE_PARTNER_ARR);
        	searchOrdPrdOrderStateArr = new int[]{Code.OST_PAY, Code.OST_SEND_READY, Code.OST_SEND_HOLD, Code.OST_SEND, Code.OST_SEND_END, Code.OST_FIX};
        	orderStateNm = "매장택배발송";
        	title = "매장택배발송";
        }
        else if("ShpPickup".equals(path)) { //2020.06.26 수정
        	commandMap.put("searchDlvType", Code.DLV_TYPE_GET_IT_NOW);
        	searchOrdPrdOrderStateArr = new int[]{Code.OST_PAY_READY, Code.OST_PAY, Code.OST_SEND_READY, Code.OST_STORE_PICKUP, Code.OST_FIX};
        	orderStateNm = "매장픽업";
        	title = "매장픽업";
        }
        // 기본값 설정 - 검색 시작날짜 (today - 30)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        
        commandMap.put("searchDateType", StringUtil.getString(commandMap.get("searchDateType"), "order"));
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        commandMap.put("searchDetailY", StringUtil.getString(commandMap.get("searchDetailY"), "none"));
        commandMap.put("searchOrdMstCd", StringUtil.getString(commandMap.get("searchOrdMstCd"), "").toUpperCase());
        commandMap.put("searchProductNm", StringUtil.getString(commandMap.get("searchProductNm"), "").toUpperCase());
        commandMap.put("searchOrdDlvNm", StringUtil.getString(commandMap.get("searchOrdDlvNm"), "").toUpperCase());
        commandMap.put("searchOrdPrdOrderState", searchOrdPrdOrderState);
        commandMap.put("searchOrdPrdOrderStateArr", searchOrdPrdOrderStateArr);
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        	commandMap.put("searchOnlyScmOrder", "Y");
        }
        
        // 주문 상태값 리스트
        commandMap.put("OST", Code.OST);
        mv.addObject("orderStateCodeList", this.orderService.selectOrderStateCodeList(commandMap));

        // Common Codes
        String[] codes = new String[]{"DLV_TYPE", "PAY_TYPE"};
        Map<String, Object> codeMap = commonService.selectCodes(codes);
        
        // 매장픽업 주문 관리 메뉴에서는 배송구분에 매장 픽업 항목만 나오도록 수정함 (2020.06.26) 
        if("ShpPickup".equals(path)) {
        	for(Map<String, Object> map : (List<Map<String, Object>>) codeMap.get("DLV_TYPE")) {
        		if(StringUtil.getInt(map.get("CMN_COM_IDX")) == Code.DLV_TYPE_GET_IT_NOW) {
        			Map<String, Object> new_codeMap = new HashMap<String, Object>();
        			new_codeMap.put("PAY_TYPE", codeMap.get("PAY_TYPE"));
        			List<Map<String, Object>> new_list = new ArrayList<Map<String,Object>>();
        			new_list.add(map);
        			new_codeMap.put("DLV_TYPE", new_list);
        			codeMap = new_codeMap;
        			break;
        		}
        	}
        	
        }
        mv.addObject("codes", codeMap);
        
        // 권한이 MD인 관리자 목록 
        commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);		// MD 관리자 idx
        mv.addObject("managerMDList", this.basicManagerService.selectBasicManagerTypeList(commandMap));
        
        // 입점업체 목록
        mv.addObject("vendorList", this.vendorManagerService.selectVendorManagerList(commandMap));
        
        // 동일 상품, 사이즈, 컬러인 경우 병합해서 보여주기(2020.06.26)
        commandMap.put("SAME_IDX_SUM", true);
        
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        // 반품관리가 아닐 경우 
        if(searchOrdPrdOrderStateArr != Code.OST_BACK_ARR) {
	        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "Y").equals("N") ? 0 : this.orderService.selectOrderCount(commandMap);
	        paging = new Paging(totalCount, commandMap);
	
	       	if(totalCount > 0){
	       		// 전체주문일 경우 재고조회 추가(2020.06.19)
	       		if(orderStateNm.equals(orderTotal)) {
	       			commandMap.put("GET_ERP_STOCK", true);
	       		}
	       		list = this.orderService.selectOrderList(commandMap);
	        }
	    // 반품관리일 경우 별도로 리스트를 가져옴(2020.06.16)
        }else {
        	int totalCount = StringUtil.getString(commandMap.get("searchYn"), "Y").equals("N") ? 0 : this.orderService.selectOrderBackListCount(commandMap);
	        paging = new Paging(totalCount, commandMap);
	
	       	if(totalCount > 0){
	       		list = this.orderService.selectOrderBackList(commandMap);
	        }
        }
        
       	//pc -> mobile url 변경
        String isMobileChk = StringUtil.getString(request.getAttribute("isMobileChk"), "N");
        if(isMobileChk.equals("Y")){
        	mv.setViewName("/am/order/orderListMobile");
    	}else{
    		mv.setViewName("/am/order/orderList");
    	}

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("title",title);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        mv.addObject("orderStateNm", orderStateNm);
        mv.addObject("path", path);

        return mv;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: orderListExcel
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문목록 엑셀저장
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오후 7:13:14
     * </pre>
     *
     * @return void
     * @param request
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderListExcel")
    public void orderListExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        // list Info
        commandMap.put("excelDown", "Y");
        
        String[] toExcelDownOrdCds = request.getParameterValues("toExcelDownOrdCds");
   		if(toExcelDownOrdCds != null){
   			commandMap.put("toExcelDownOrdCdArr", Arrays.asList(toExcelDownOrdCds));
   		}
   		
        int totalCount = this.orderService.selectOrderCount(commandMap);
        
        if(totalCount > 0){
       	 	List<Map<String, Object>> dataList = null;
	       	 
       	 String[] rowTitle = {
					       			/*"NO"*/
					       			"주문일"
					       			,"주문번호"
					       			,"주문자명"
					       			,"주문자ID"
					       			,"수령인"
					       			
					       			,"업체"
					       			,"상품코드"
					       			,"기간계코드"
					       			,"상품명"
					       			,"컬러"
					       			,"사이즈"
					       			,"추가옵션"
					       			,"상품가격"
					       			
					       			,"수량"
					       			,"주문금액"
					       			,"할인금액"
					       			,"즉시할인"
					       			,"쿠폰할인"		       			
					       			,"마일리지"
					       			
					       			
					       			,"캐쉬백"
					       			,"배송비"
					       			,"결제금액"
					       			,"결제수단"					       			
					       			,"채널"
					       			
					       			,"배송구분"
					       			,"주문상태"					       			
					       			,"처리일자"
					       			,"SCM 취소 요청일자"					       			
					       			,"SCM 취소 요청사유"
					       		   };
       	String[] cellSize = {
					       			/*"20"*/
					       			"40"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       			,"60"
					       		};
       	String[] dataName = {
					       			/*"RNUM"*/
					       			"ORD_MST_ORD_DT"
					       			,"ORD_MST_CD"
					       			,"ORD_MST_ORD_NM"
					       			,"ORD_MST_ORD_ID"
					       			,"ORD_DLV_NM"
					       			
					       			,"VDR_MST_NM"					       			
					       			,"ORD_PRD_MST_CD"
					       			,"PRD_MST_ERP_CD"
					       			,"PRD_MST_NM"
					       			,"ORD_PRD_COLOR_VAL"
					       			,"ORD_PRD_SIZE_VAL"
					       			,"OPT_DTL_NM"
					       			,"ORD_PRD_PRD_PRC"
					       			
					       			,"ORD_PRD_ORD_CNT"					       			
					       			,"ORD_PRD_ORD_PRC"
					       			,"TOT_DC_AMT"
					       			,"TOT_ORD_IST_CPN_PRC"
					       			,"CALCULATED_DC_COUPON"
					       			,"ORD_MST_DC_MLG"		
					       			
					       			,"ORD_MST_DC_OCB_PIT"					       			
					       			,"TOT_PRD_DLV_CHARGE"
					       			,"CALCULATED_PAYMENT_PRICE"
					       			,"ORD_MST_PAY_TYPE_NM"
					       			,"CHN_DTL_NM"		
					       			
					       			,"ORD_PRD_DLV_TYPE_NM"					       			
					       			,"ORD_PRD_ORD_STATE_NM"					       			
					       			,"RECENT_ORD_PRD_DT"
					       			,"ORD_PRD_SCM_CNL_DT"
					       			,"ORD_PRD_SCM_CNL_DESC"
					       			};
       	String[] dataType = {
					       			/*"String"*/
					       			"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			,"String"
					       			
					       			,"String"
					       			,"String"					       			
					       			,"String"
					       			,"String"
					       			,"String"
					       			};
	          
	        dataList =  this.orderService.selectOrderList(commandMap);
	       	
	       	if(dataList != null){
	               // 엑셀 다운로드
	       		   ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "orderList_"+DateUtil.getToday());
	       	}
       }
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: orderPopup
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 팝업 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 21. 오전 11:37:40
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderPopup")
    public ModelAndView orderPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        //상품 상세 정보
        Map<String, Object> resultMap = this.orderService.selectOrderView(commandMap);
        
    	mv.addObject("erpOrderInfoList", this.orderService.selectErpOrderInfoList(commandMap));
    	mv.addObject("erpOrderAccountingList", this.orderService.selectErpOrderAccountingList(commandMap));
        
        //상담 이력 개수
        //int orderCsCount = this.orderService.selectOrderCstCount(commandMap);
        //mv.addObject("orderCsCount",orderCsCount);
        
        // Common Codes
        String[] codes = {"HP_CODE","TEL_CODE","DLV_TYPE","GET_IT_NOW_RECEIVER_CD"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 배송업체 목록
        List<Map<String, Object>> dlvCpnList = this.delivCompanyService.selectSimpleDelivCompanyList(commandMap);
        mv.addObject("dlvCpnList", dlvCpnList);
        
        // real / test 여부
     	String CST_PLATFORM = this.propertiesService.getString("payment.lg.xpay.CST_PLATFORM");
     	mv.addObject("CST_PLATFORM", CST_PLATFORM);
        
        //RETURN OBJECT
        mv.addAllObjects(resultMap);
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/order/orderPopup2");
        
        return mv;
    }
    

    /**
     * 
     * <pre>
     * 1. MethodName	: orderHistoryPopup
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 > 주문상태이력 팝업 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 28. 오전 9:23:28
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderHistoryPopup")
    public ModelAndView orderHistoryPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //상품 상세 정보
        Map<String, Object> resultMap = this.orderService.selectOrderHistoryView(commandMap);
        
        //RETURN OBJECT
        mv.addAllObjects(resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: orderStateModify
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 > 주문상태변경 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 28. 오전 11:51:56
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * ORD_MST_CD 주문번호
     * ORD_PRD_ORD_STATE 변경할 주문상태값
     * closeYn 창 닫기 여부
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderList/orderStateModify")
    public ModelAndView orderStateModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		Map<String, Object> ordErrMap = new HashMap<String, Object>(); //결제오류시 DB 처리 위한 맵
		String resultCode = "";
		String resultMsg = "";
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_ADMIN);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        commandMap.put("ADM_MST_ERP_NO", admin.getADM_MST_ERP_NO());//관리자 사번(erp 연동시 필요)
        
        //2020.06.15 입점업체 구분값 추가
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        // END 2020.06.15 입점업체 구분값 추가
        
        // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
        String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("ORD_PRD_IDX_ARR"));
        if(!"".equals(ORD_PRD_IDX_ARR)){
        	String[] ordPrdIdxs = ORD_PRD_IDX_ARR.split(",");
        	logger.debug("ordPrdIdxs.length============================="+ordPrdIdxs.length);
        	if(ordPrdIdxs.length == 1){
        		commandMap.put("ORD_PRD_IDX", StringUtil.getString(ordPrdIdxs[0],""));
        	}
        	commandMap.put("ordPrdIdxs", ordPrdIdxs);
        }
    	
		Map<String,Object> resultMap = new HashMap<String,Object>();

		// Modify
        String closeMsg ="처리 중 오류가 발생하였습니다.";
        try
    	{
        	resultMap = this.orderService.updateOrderState(commandMap, request);
        	
        	int orderResult = Integer.valueOf(String.valueOf(resultMap.get("result")));
        	
        	if(orderResult > 0)
            {
            	closeMsg = "정상적으로 처리되었습니다.";
            }
        	else
        	{
        		resultCode = "0";
        		resultMsg = StringUtil.getString(resultMap.get("resultMsg"));
        		closeMsg = resultMsg;
        		if("".equals(resultMsg)){
        			resultMsg = "ORD_PRD_ORD_STATE["+StringUtil.getString(commandMap.get("ORD_PRD_ORD_STATE"))+"] 상태 변경 UPDATE 실패...";
        		}
        		
        		// ERROR LOG INSERT
        		ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
    			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
    			ordErrMap.put("ORD_ERR_CRD", "");
    			ordErrMap.put("ORD_ERR_APV_NO", "");
    			ordErrMap.put("ORD_ERR_PG_NO", "");
    			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
    			ordErrMap.put("ORD_ERR_LSSUER", "");
    			ordErrMap.put("ORD_ERR_BNK_CD", "");
    			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
    			ordErrMap.put("ORD_ERR_REG_ID", "");
    			ordErrMap.put("ORD_ERR_MSG", resultMsg.substring(0, Math.min(resultMsg.length(), 3800)));
    			this.orderErrorService.insertOrdErr(ordErrMap);
        	}
    	}
    	catch(Exception e){
    		String errorMsg = e.getMessage();
    		
    		if("ERR_PG".equals(errorMsg)){
    			ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_PG);
    			
    			resultCode = StringUtil.getString(commandMap.get("resultCode"));
    			resultMsg = StringUtil.getString(commandMap.get("resultMsg"));
    			
    			logger.error("resultCode : "+resultCode);
	    		logger.error("resultMessage : "+resultMsg);
	    		
	    		ordErrMap.put("ORD_ERR_MSG", resultMsg);
			}else{
				logger.error("####### 주문상태 변경 처리중 Exception 발생 ########");
				ordErrMap.put("ORD_ERR_TYPE", Code.ORDER_ERR_TYPE_DB);
				
				resultCode = "9999";
				resultMsg = "주문상태 변경 처리중 Exception 발생";
				
				logger.error("resultCode : "+resultCode);
	    		logger.error("resultMessage : "+resultMsg);
				
				// 에러메시지 DB 기록
				StringWriter errors = new StringWriter();
				e.printStackTrace(new PrintWriter(errors));
				errorMsg = new String(errors.toString());
				errorMsg = errorMsg.substring(0, Math.min(errorMsg.length(), 3800));
    			logger.error("errorMsg : "+errorMsg);
    			
    			ordErrMap.put("ORD_ERR_MSG", errorMsg);
			}
			
			// ERROR LOG INSERT
			ordErrMap.put("ORD_ERR_ORD_CD", ORD_MST_CD);
			ordErrMap.put("ORD_ERR_CRD", "");
			ordErrMap.put("ORD_ERR_APV_NO", "");
			ordErrMap.put("ORD_ERR_PG_NO", "");
			ordErrMap.put("ORD_ERR_REP_CODE", resultCode);
			ordErrMap.put("ORD_ERR_LSSUER", "");
			ordErrMap.put("ORD_ERR_BNK_CD", "");
			ordErrMap.put("ORD_ERR_REG_IP", request.getRemoteAddr());
			ordErrMap.put("ORD_ERR_REG_ID", "");
			this.orderErrorService.insertOrdErr(ordErrMap);
    	}
        
        String closeYn = StringUtil.getString(commandMap.get("closeYn"),"Y"); // 팝업창 닫는게 default
        
        if(closeMsg.length() > 100){
        	closeMsg = "에러가 발생했습니다.";
        }
        
        if("Y".equals(closeYn)){
        	mv.addObject("closeMsg",closeMsg);
            mv.addObject("parentReload","Y");
        }else{
        	mv.addObject("alertMsg",closeMsg);
            mv.addObject("methodType","get");
            mv.addObject("returnUrl", "/am/order/orderPopup.do");
        	
        	//RETURN OBJECT
        	commandMap.clear();
        	commandMap.put("ORD_MST_CD", ORD_MST_CD);
        }
        
        // View page
    	mv.setViewName("am/common/result");
    	
    	return mv.addObject("commandMap", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : changeOrderProductPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 교환 접수 팝업
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 10. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/changeOrderProductPopup")
    public ModelAndView changeOrderProductPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int status = Integer.valueOf((String) commandMap.get("STATE"));
        mv.addObject("title",status == Code.OST_SWAP ? "교환접수" : "교환상세");
        
        // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
        String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("arrORD_PRD_IDXs"));
        if(!"".equals(ORD_PRD_IDX_ARR)){
        	String[] arrOrdPrdIdxs = ORD_PRD_IDX_ARR.split(",");
        	logger.debug("arrOrdPrdIdxs.length============================="+arrOrdPrdIdxs.length);
        	if(arrOrdPrdIdxs.length == 1){
        		commandMap.put("ORD_PRD_IDX", StringUtil.getString(arrOrdPrdIdxs[0],""));
        	}
        	commandMap.put("arrOrdPrdIdxs", arrOrdPrdIdxs);
        }
        
        //주문상품 정보
        Map<String, Object> resultMap = this.orderService.selectChangeOrderProductView(commandMap);
        mv.addAllObjects(resultMap);

        // Common Codes
        String[] codes = {"ORDER_CANCEL_RETURN_REASON", "HP_CODE", "TEL_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        mv.addObject("commandMap", commandMap);
        
        // 교환상세 팝업일 경우는 취소사유를 불러옴
       	if(status != Code.OST_SWAP) {
       		mv.addObject("backInfo", orderService.selectOrderBackInfo(commandMap));
       	}
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : changeOrderProductProc
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 교환접수 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 10. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/changeOrderProductProc")
    public ModelAndView changeOrderProductProc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        String closeMsg = "";
        String resultCode = "";
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_ADMIN);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        
        try{
        	resultCode = this.orderService.insertChangeOrderProduct(request, commandMap);
        }catch(Exception e){
        	e.printStackTrace();
        	logger.info("========================================================================================================");
    		logger.info("Message : 교환접수중 예외 발생");
    		logger.info("========================================================================================================");
        	resultCode = "90";
        }
        
        if("00".equals(resultCode)){
        	closeMsg = "교환접수되었습니다.";       	
        }else{
        	closeMsg = "교환접수중 오류가 발생했습니다.";
        }
        
        mv.setViewName("am/common/result");
        mv.addObject("closeMsg", closeMsg);
        mv.addObject("parentReload", "Y");
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: orderCSPopup
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 팝업  - CS상담내용
     * 4. 작성자			: 이미정
     * 5. 작성일			: 2014. 11. 05.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderCSPopup")
    public ModelAndView orderCSPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // Common Codes
        String[] codes = {"ORDER_CS_TYPE_IDX"};
        mv.addObject("codes", this.commonService.selectCodes(codes));

        int totalCount = this.orderService.selectOrderCstCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
    	List<Map<String, Object>> cstList = null;
       	if(totalCount>0)
       	{
       		cstList = this.orderService.selectOrderCstList(commandMap);
        }
       	
        //RETURN OBJECT
        mv.addObject("cstList", cstList);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: orderCSRegist
     * 2. ClassName		: OrderController.java
     * 3. Comment    	: 관리자 > 주문관리 > 전체주문 > 주문상세 팝업  - CS상담내용 저장
     * 4. 작성자			: 이미정
     * 5. 작성일			: 2014. 11. 05.
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderList/orderCSRegist")
    public ModelAndView orderCSRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_CST_REG_ID", admin.getADM_MST_ID());
        commandMap.put("ORD_CST_REG_IP", request.getRemoteAddr());
                
        String alertMsg = "";
        if( 0 < this.orderService.insertOrderCst(commandMap) )
        {
            alertMsg = "정상적으로 수정되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/order/orderCSPopup.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : editRefBank
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 환불계좌 수정
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 11. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/editRefBank")
    public ModelAndView editRefBank(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	int result = 0;
		// Modify
        String alertMsg ="처리 중 오류가 발생하였습니다.";
        try
    	{
        	result = this.orderService.updateRefBankAccount(request, commandMap);
        	if(result > 0)
            {
        		alertMsg = "정상적으로 처리되었습니다.";
            }
        	else
        	{
        		alertMsg = "오류가 발생했습니다.";
        	}
    	}
    	catch(Exception e){
    		logger.debug("##### 환불계좌 수정 오류:"+e.getMessage());
    	}
        mv.addObject("alertMsg",alertMsg);
        mv.addObject("returnUrl", "/am/order/orderPopup.do");
        
        // View page
    	mv.setViewName("am/common/result");
    	
    	return mv.addObject("commandMap", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : invoiceNoProc
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 관리자 송장번호 입력
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 5. 12.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/invoiceNoProc")
    public ModelAndView invoiceNoProc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
        
        Map<String, Object> resultMap = new HashMap<String, Object>(); 
        String resultMsg = "에러가 발생했습니다.";
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        commandMap.put("ORD_PRD_DSC", "송장번호 수동 입력");
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_ADMIN);
        commandMap.put("ORD_CMN_COM_IDX", "");

        try
    	{
    		resultMap = this.orderService.insertInvoiceNo(request, commandMap);
        	resultMsg = StringUtil.getString(resultMap.get("resultMsg"),"");
    	}
    	catch(Exception e){
    		logger.debug("##### 송장번호 입력 처리 오류:"+e.getMessage());
    	}
        mv.addObject("alertMsg",resultMsg);
        mv.addObject("methodType","get");
        mv.addObject("returnUrl", "/am/order/orderPopup.do");
    	
    	//RETURN OBJECT
    	String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"),"");
    	commandMap.clear();
    	commandMap.put("ORD_MST_CD", ORD_MST_CD);
        
        // View page
    	mv.setViewName("am/common/result");
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderDeliveryModify
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 배송지 저장 
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 10. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/orderDeliveryModify")
    public ModelAndView orderDeliveryModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_DLV_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("ORD_DLV_UPD_IP", request.getRemoteAddr());
        
		// Modify
        String alertMsg ="처리 중 오류가 발생하였습니다.";
        try
    	{
        	int result = this.orderService.updateDeliveryInfo(commandMap, request);
        	if(result > 0)
            {
            	alertMsg = "정상적으로 처리되었습니다.";
            }
    	}
    	catch(Exception e){
    		logger.debug("##### 배송지 변경 오류:"+e.getMessage());
    	}
        mv.addObject("alertMsg",alertMsg);
        mv.addObject("methodType","get");
        mv.addObject("returnUrl", "/am/order/orderPopup.do");
        
        // View page
    	mv.setViewName("am/common/result");
    	
    	//RETURN OBJECT
    	String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"),"");
    	commandMap.clear();
    	commandMap.put("ORD_MST_CD", ORD_MST_CD);
    	
    	return mv.addObject("commandMap", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : orderCancelPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 주문취소/반품접수/반품완료 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 10. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderCancel")
    public ModelAndView orderCancel(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // Common Codes
        String[] codes = {"ORDER_CANCEL_RETURN_REASON","OST"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 입금은행
        commandMap.put("CODE", Code.KICC_BANK_CD);
        commandMap.put("searchCmnComEtc2","Y");//무통장 입금 가능 은행만 가져온다.
        mv.addObject("depositBankList", this.orderService.selectCodeList(commandMap));
        
        String title1 = "";
        String title2 = "";
        String title3 = "";
        
        //주문 상태에 따라 보여줘야할 상품 리스트가 달라진다.
        int STATE = StringUtil.getInt(commandMap.get("STATE"));
        commandMap.put("OST_EACH_CANCEL", Code.OST_EACH_CANCEL);
        if(StringUtil.getString(commandMap.get("STATE")).equals(StringUtil.getString(Code.OST_EACH_CANCEL))){
            String [] arrORD_PRD_IDXs = StringUtil.split(StringUtil.getString(commandMap.get("ORD_PRD_IDXs")),",") ;
            for(int i = 0; i < arrORD_PRD_IDXs.length; i++){
            }
            commandMap.put("arrORD_PRD_IDXs", arrORD_PRD_IDXs);
        }
        
        switch(STATE){
        	case Code.OST_CANCEL :
        		commandMap.put("targetStates", Code.OST_CANCEL_POSSIBLE_ARR);
        		title1 = "주문취소";
                title2 = "취소상품";
                title3 = "취소사유";
        		break;
        	case Code.OST_BACK :	
        		commandMap.put("targetStates", Code.OST_BACK_POSSIBLE_ARR);
        		title1 = "반품접수";
                title2 = "반품상품";
                title3 = "반품사유";
        		break;
        	/* 반품완료는 팝업 띄우지 않고 처리한다.
        	 * case Code.OST_BACK_END :	
        		commandMap.put("targetStates", Code.OST_BACK_END_POSSIBLE_ARR);
        		commandMap.put("OST_REASON", Code.OST_BACK);//반품 접수 사유를 가져오기 위한 파라미터
        		title1 = "반품완료";
                title2 = "반품상품";
                title3 = "반품사유";
        		break;*/
        }

        //Order State Info
        Map<String, Object> resultMap = this.orderService.selectOrderSimpleView(commandMap);
        
        mv.addAllObjects(resultMap);
        mv.addObject("commandMap", commandMap);
        
        mv.addObject("title1", title1);
        mv.addObject("title2", title2);
        mv.addObject("title3", title3);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderCancelEnd
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 취소접수 -> 취소완료 처리
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 11. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderCancelEnd")
    public ModelAndView orderCancelEnd(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_ADMIN);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        
		Map<String,Object> resultMap = new HashMap<String,Object>();

		// Modify
        String alertMsg ="처리 중 오류가 발생하였습니다.";
        try
    	{
        	commandMap.put("ORD_PRD_ORD_STATE", Code.OST_CANCEL_END);
        	resultMap = this.orderService.updateOrderState(commandMap, request);
        	
        	int orderResult = Integer.valueOf(String.valueOf(resultMap.get("result")));
        	
        	if(orderResult > 0)
            {
            	alertMsg = "정상적으로 처리되었습니다.";
            }
        	else
        	{
        		alertMsg = "[오류발생]"+StringUtil.getString(resultMap.get("resultMsg"));
        	}
    	}
    	catch(Exception e){
    		logger.debug("##### 주문상태변경 오류:"+e.getMessage());
    	}
        mv.addObject("alertMsg",alertMsg);
        mv.addObject("methodType","get");
        mv.addObject("returnUrl", "/am/order/orderPopup.do");
        
        // View page
    	mv.setViewName("am/common/result");
    	
    	//RETURN OBJECT
    	String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"),"");
    	commandMap.clear();
    	commandMap.put("ORD_MST_CD", ORD_MST_CD);
    	
    	return mv.addObject("commandMap", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : changeProductOptionPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 옵션 변경 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/changeProductOptionPopup")
    public ModelAndView changeProductOptionPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //상품 상세 정보
        Map<String, Object> resultMap = this.orderService.selectProductAndOptionInfo(request, commandMap);
        
        //RETURN OBJECT
        mv.addAllObjects(resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : changeProductOptionProc
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 옵션 변경
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/changeProductOptionProcAjax")
    public JSON changeProductOptionProcAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	JSON json = new JSON();
        int result = 0;
        String resultMsg = "";
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_ADMIN);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        
        try{
        	result = this.orderService.updateProductOption(commandMap);
        }catch(Exception e){
        	e.printStackTrace();
        	logger.info("========================================================================================================");
    		logger.info("Message : 옵션 변경중 에러 발생");
    		logger.info("========================================================================================================");
    		result = -3;
        }
        
        if(result > 0){
        	resultMsg = "옵션 변경되었습니다.";   
        }else if(result == -1){
        	resultMsg = "동일 옵션이 있으므로 변경이 불가능합니다.";
    	}else if(result == -2){
    		resultMsg = "재고가 부족합니다.";
    	}else{
    		resultMsg = "옵션 변경중 오류가 발생했습니다.";
        }
       
        json.addObject("result", result);
        json.addObject("resultMsg", resultMsg);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : sendExchangeTicketPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 교환권 발송 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/sendExchangeTicketPopup")
    public ModelAndView sendExchangeTicketPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        // Common Codes
        String[] codes = {"HP_CODE","TEL_CODE","DLV_TYPE","GET_IT_NOW_RECEIVER_CD"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        //주문 정보
        Map<String, Object> resultMap = this.orderService.selectOrderSimpleView(commandMap);
        
        //RETURN OBJECT
        mv.addAllObjects(resultMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : sendExchangeTicketProc
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 교환권 발송
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/sendExchangeTicketProc")
    public ModelAndView sendExchangeTicketProc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        String closeMsg = "";
        
        try{
        	Map<String, Object> resultMap = this.orderService.updateOrdGetAfterSend(commandMap);
        	
        	result = StringUtil.getInt(resultMap.get("result"));
        	closeMsg = StringUtil.getString(resultMap.get("resultMsg"));
        }catch(Exception e){
        	e.printStackTrace();
        	logger.info("========================================================================================================");
    		logger.info("Message : 교환권 발송중 에러 발생");
    		logger.info("========================================================================================================");
    		result = -1;
        }
        
        if(result > 0){
        	closeMsg = "교환권 발송되었습니다.";       	
        }else{
        	closeMsg = "교환권 발송중 오류가 발생했습니다.";
        }
        
        mv.setViewName("am/common/result");
        mv.addObject("parentReload","Y");
        mv.addObject("closeMsg", closeMsg);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : exchangeTicketPreviewPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 교환권 발송 미리보기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 12.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/exchangeTicketPreviewPopup")
    public ModelAndView exchangeTicketPreviewPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
		return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : orderGetItNowInfoModify
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 겟잇나우 픽업정보 수정
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/orderGetItNowInfoModify")
    public ModelAndView orderGetItNowInfoModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
		// Modify
        String alertMsg ="처리 중 오류가 발생하였습니다.";
        try
    	{
        	int result = this.orderService.updateOrdGetInfo(commandMap);
        	if(result > 0)
            {
            	alertMsg = "정상적으로 처리되었습니다.";
            }
    	}
    	catch(Exception e){
    		logger.debug("##### 겟잇나우 정보 변경 오류:"+e.getMessage());
    	}
        mv.addObject("alertMsg",alertMsg);
        mv.addObject("methodType","get");
        mv.addObject("returnUrl", "/am/order/orderPopup.do");
        
        // View page
    	mv.setViewName("am/common/result");
    	
    	//RETURN OBJECT
    	String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"),"");
    	commandMap.clear();
    	commandMap.put("ORD_MST_CD", ORD_MST_CD);
    	
    	return mv.addObject("commandMap", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : scmOrderCancelPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : SCM 주문 취소 요청 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/scmOrderCancelPopup")
    public ModelAndView scmOrderCancelPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : scmOrderCancelProc
    * 2. ClassName  : OrderController.java
    * 3. Comment    : SCM 주문 취소/반품확인/교환확인 요청
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/scmOrderCancelProc")
    public ModelAndView scmOrderCancelProc(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        String closeMsg = "";
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	String ORD_PRD_IDX = StringUtil.getString(commandMap.get("ORD_PRD_IDX"));
        	if("0".equals(ORD_PRD_IDX)){//0인경우 전체 주문 상품 대상
        		commandMap.put("ORD_PRD_IDX","");
        	}
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        	
        	result = this.orderService.updateScmCancel(request, commandMap);
        }
        
        if(result > 0){
        	closeMsg = "요청되었습니다.";       	
        }else{
        	closeMsg = "요청중 오류가 발생했습니다.";
        }
        
        mv.setViewName("am/common/result");
        mv.addObject("parentReload","Y");
        mv.addObject("closeMsg", closeMsg);
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : getReleaseDeliveryAjax
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 출고처/배송처 가져오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 5.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/am/order/getReleaseDeliveryAjax.do")
	public JSON getReleaseDeliveryAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		commandMap.put("CMN_COM_ETC1", "R");//출고처 목록
		List<Map<String, Object>> releaseList = this.orderService.selectReleaseDeliveryList(commandMap);
		
		commandMap.put("CMN_COM_ETC1", "D");//배송처 목록
		List<Map<String, Object>> deliveryList = this.orderService.selectReleaseDeliveryList(commandMap);

		json.addObject("releaseList", releaseList);
		json.addObject("deliveryList", deliveryList);
		
		return json;
	}
    
    /**
     * <pre>
     * 1. MethodName : updateDeliveryTypeAjax
     * 2. ClassName  : OrderController.java
     * 3. Comment    : 관리자 > 주문목록 - 매장발송 클릭시 주문상품 테이블의 배송타입을 '입점업체'로 변경
     * 4. 작성자       : 이원중
     * 5. 작성일       : 2020. 06. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping(value = "/am/order/updateDeliveryTypeAjax.do")
     public JSON updateDeliveryTypeAjax(HttpServletRequest request,
 			@RequestParams Map<String, Object> commandMap) throws Exception {
 		JSON json = new JSON();
 		int result = orderService.updateDeliveryTypeAjax(commandMap);
 		json.addObject("result", result > 0 ? "success" : "fail");
 		
 		return json;
 	}
    
    @RequestMapping(value="/am/order/orderCancelPopup")
    public ModelAndView orderCancelPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        /** 2020.06.11 팝업내용 추가 <- 2020.06.23 수정 */                
        int status = Integer.valueOf((String) commandMap.get("STATE"));
        mv.addObject("title", status == Code.OST_CANCEL ? "주문취소" : "취소상세");
        
        // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
        String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("arrORD_PRD_IDXs"));
        if(!"".equals(ORD_PRD_IDX_ARR)){
        	String[] arrOrdPrdIdxs = ORD_PRD_IDX_ARR.split(",");
        	logger.debug("arrOrdPrdIdxs.length============================="+arrOrdPrdIdxs.length);
        	if(arrOrdPrdIdxs.length == 1){
        		commandMap.put("ORD_PRD_IDX", StringUtil.getString(arrOrdPrdIdxs[0],""));
        	}
        	commandMap.put("arrOrdPrdIdxs", arrOrdPrdIdxs);
        }
        
        //주문상태값
        commandMap.put("searchOrdMstCd", StringUtil.getString(commandMap.get("ORD_MST_CD"), "").toUpperCase());
        
        // 주문 상태값 리스트
        commandMap.put("OST", Code.OST);
        mv.addObject("orderStateCodeList", this.orderService.selectOrderStateCodeList(commandMap));

        // Common Codes
        String[] codes = {"DLV_TYPE", "PAY_TYPE","ORDER_CANCEL_RETURN_REASON","KICC_BANK_CD" , "ORDER_CANCEL_REASON"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        int totalCount = this.orderService.selectOrderCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        
    	List<Map<String, Object>> list = null;
       	if(totalCount>0)
       	{
       		list = this.orderService.selectOrderList(commandMap);
        }
       	mv.addObject("deliveryInfo", this.orderService.selectDeliveryInfo(commandMap));
       	//mv.addObject("Info", this.vendorManagerService.se);
       	
       	// orderPayInfo + orderPointInfo
       	mv.addAllObjects(orderService.selectOrderPaySimpleInfo(commandMap));
       	
       	// 취소상세 팝업일 경우는 취소사유를 불러옴
       	if(status != Code.OST_CANCEL) {
       		mv.addObject("backInfo", orderService.selectOrderBackInfo(commandMap));
       	}
       	
        //RETURN OBJECT
        mv.addObject("list", list);
        
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    
    
    /**
     * orderCancelPopup에서 반품관리를 별도로 하기 위해 분할 테스트 중
     * 2020.06.17
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/order/orderBackPopup")
    public ModelAndView orderBackPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        int status = Integer.valueOf((String) commandMap.get("STATE"));
        mv.addObject("title",status == Code.OST_BACK ? "반품접수" : "반품상세");
        
        
        // ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
        String ORD_PRD_IDX_ARR = StringUtil.getString(commandMap.get("arrORD_PRD_IDXs"));
        if(!"".equals(ORD_PRD_IDX_ARR)){
        	String[] arrOrdPrdIdxs = ORD_PRD_IDX_ARR.split(",");
        	logger.debug("arrOrdPrdIdxs.length============================="+arrOrdPrdIdxs.length);
        	if(arrOrdPrdIdxs.length == 1){
        		commandMap.put("ORD_PRD_IDX", StringUtil.getString(arrOrdPrdIdxs[0],""));
        	}
        	commandMap.put("arrOrdPrdIdxs", arrOrdPrdIdxs);
        }
        
        //주문상태값
        commandMap.put("searchOrdMstCd", StringUtil.getString(commandMap.get("ORD_MST_CD"), "").toUpperCase());
        
        // 주문 상태값 리스트
        commandMap.put("OST", Code.OST);
        mv.addObject("orderStateCodeList", this.orderService.selectOrderStateCodeList(commandMap));

        // Common Codes
        String[] codes = {"DLV_TYPE", "PAY_TYPE","ORDER_CANCEL_RETURN_REASON","KICC_BANK_CD" , "ORDER_CANCEL_REASON"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        int totalCount = this.orderService.selectOrderCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        
    	List<Map<String, Object>> list = null;
       	if(totalCount > 0){
       		list = this.orderService.selectOrderList(commandMap);
        }
       	mv.addObject("deliveryInfo", this.orderService.selectDeliveryInfo(commandMap));
       	//mv.addObject("Info", this.vendorManagerService.se);
       	
       	// orderPayInfo + orderPointInfo
       	mv.addAllObjects(orderService.selectOrderPaySimpleInfo(commandMap));
       	
       	// 반품상세 팝업일 경우는 취소사유를 불러옴
       	if(status != Code.OST_BACK) {
       		mv.addObject("backInfo", orderService.selectOrderBackInfo(commandMap));
       	}
       	
        //RETURN OBJECT
        mv.addObject("list", list);
        
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    
    
    /**
    * <pre>
    * 1. MethodName : searchOrderPopup
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 주문 검색 팝업
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/searchOrderPopup.do")
    public ModelAndView searchOrderPopup(HttpServletRequest request	, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //주문상태값
        String searchOrdPrdOrderState = StringUtil.getString(commandMap.get("searchOrdPrdOrderState"), "");
        
        // 기본값 설정 - 검색 시작날짜 (today - 30)
        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
        
        commandMap.put("searchDateType", StringUtil.getString(commandMap.get("searchDateType"), "order"));
        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        commandMap.put("searchOrdMstCd", StringUtil.getString(commandMap.get("searchOrdMstCd"), "").toUpperCase());
        commandMap.put("searchProduct", StringUtil.getString(commandMap.get("searchProduct"), "").toUpperCase());
        commandMap.put("searchOrdPrdOrderState", searchOrdPrdOrderState);
        
        // 주문 상태값 리스트
        commandMap.put("OST", Code.OST);
        mv.addObject("orderStateCodeList", this.orderService.selectOrderStateCodeList(commandMap));

        // Common Codes
        String[] codes = {"DLV_TYPE", "PAY_TYPE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.orderService.selectOrderCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);

    	List<Map<String, Object>> list = null;
       	if(totalCount>0)
       	{
       		list = this.orderService.selectOrderList(commandMap);
        }

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : getSubChannelListAjax
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 채널 리스트
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/am/order/getSubChannelListAjax.do")
	public JSON getSubChannelListAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		// 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	int[] TARGET_CHANNEL_ARR = {Code.CHANNEL_PRICE_COMPARE_CD};//가격비교 채널만 넣는다.
        	commandMap.put("TARGET_CHANNEL_ARR", TARGET_CHANNEL_ARR);
        }else{
        	int[] TARGET_CHANNEL_ARR = {Code.CHANNEL_PARTNERSHIP_CD, Code.CHANNEL_PRICE_COMPARE_CD};//제휴/가격비교 채널 넣는다.
        	commandMap.put("TARGET_CHANNEL_ARR", TARGET_CHANNEL_ARR);
        }
		
		List<Map<String, Object>> list = this.orderService.selectOrderChannelList(commandMap);

		json.addObject("list", list);
		
		return json;
	}
      
    /**
    * <pre>
    * 1. MethodName : ordCnlYnResetProcAjax
    * 2. ClassName  : OrderController.java
    * 3. Comment    : 취소요청 초기화
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 4. 11.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/order/orderList/ordCnlYnResetAjax")
    public JSON ordCnlYnResetAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	JSON json = new JSON();
        int result = 0;
        String resultMsg = "";
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_ADMIN);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        
        try{
        	result = this.orderService.updateOrdCnlYnReset(commandMap);
        }catch(Exception e){
        	e.printStackTrace();
        	logger.info("========================================================================================================");
    		logger.info("Message : 취소요청 초기화중 에러 발생");
    		logger.info("========================================================================================================");
    		result = -3;
        }
        
        if(result > 0){
        	resultMsg = "초기화 되었습니다.";   
        }else{
    		resultMsg = "초기화중 오류가 발생했습니다.";
        }
       
        json.addObject("result", result);
        json.addObject("resultMsg", resultMsg);
        
        return json;
    }
    
    @RequestMapping(value="/am/order/batchRegistrationAjax")
    public JSON batchRegistrationAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	JSON json = new JSON();
    	
    	String result = ""+HttpServletResponse.SC_OK;
    	String resultMsg = "일괄입력되었습니다.";
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
    	
    	commandMap.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_BATCH);
        commandMap.put("REG_ID", admin.getADM_MST_ID());
        commandMap.put("ADM_MST_ERP_NO", admin.getADM_MST_ERP_NO());//관리자 사번(erp 연동시 필요)
        
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String, Object>> list = mapper.readValue(StringUtil.getString(commandMap.get("list")), typeRef);
        
    	Iterator<Map<String,Object>> i = list.iterator();
    	while(i.hasNext()) {
    		Map<String,Object> item =  i.next();
    		Map<String,Object> ordPrdIdxMap = this.orderService.selectOrdPrdIdx(request, item);
    		if(ordPrdIdxMap!=null && !ordPrdIdxMap.isEmpty()) {
    			item.putAll(ordPrdIdxMap);
        		item.putAll(commandMap);
        		this.orderService.insertInvoiceNo(request, commandMap);
    		}
    		else {
    			result=""+HttpServletResponse.SC_NO_CONTENT;
    			resultMsg="가능한 작업은 모두 수행하였으나 몇몇 항목에서 상품을 찾을 수 없습니다.";
    		}
    	}
    	
    	json.addObject("result", result);
        json.addObject("resultMsg", resultMsg);
        return json;
       
    }
    
    /**
     * <pre>
     * 1. MethodName : searchVendorOrderPopup
     * 2. ClassName  : OrderController.java
     * 3. Comment    : 입점사문의시 주문 검색 팝업
     * 4. 작성자       : KIMHYEWON
     * 5. 작성일       : 2020. 6. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping(value="/am/order/searchVendorOrderPopup.do")
     public ModelAndView searchVendorOrderPopup(HttpServletRequest request	, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
    	 ModelAndView mv = new ModelAndView();
         
         //주문상태값
         String searchOrdPrdOrderState = StringUtil.getString(commandMap.get("searchOrdPrdOrderState"), "");
         
         // 기본값 설정 - 검색 시작날짜 (today - 30)
         String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -30);
         searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
         
         commandMap.put("searchDateType", StringUtil.getString(commandMap.get("searchDateType"), "order"));
         commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
         commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
         commandMap.put("searchOrdMstCd", StringUtil.getString(commandMap.get("searchOrdMstCd"), "").toUpperCase());
         commandMap.put("searchProductNm", StringUtil.getString(commandMap.get("searchProductNm"), "").toUpperCase());
         commandMap.put("searchOrdPrdOrderState", searchOrdPrdOrderState);
         
         // 주문 상태값 리스트
         commandMap.put("OST", Code.OST);
         mv.addObject("orderStateCodeList", this.orderService.selectOrderStateCodeList(commandMap));

         // Common Codes
         String[] codes = {"DLV_TYPE", "PAY_TYPE"};
         mv.addObject("codes", this.commonService.selectCodes(codes));
         
         // 관리자 입점업체 IDX(SCM용)
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
         if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
         	commandMap.put("ADM_MST_SUB_IDX", admin.getADM_MST_SUB_IDX()); //입점업체 idx
         }
         
         int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.orderService.selectOrderCount(commandMap);
         Paging paging = new Paging(totalCount, commandMap);

     	List<Map<String, Object>> list = null;
    	if(totalCount>0)
    	{
    		list = this.orderService.selectOrderList(commandMap);
    	}

    	//RETURN OBJECT
    	mv.addObject("list", list);
    	mv.addObject("paging", paging);
    	mv.addObject("commandMap", commandMap);

    	return mv;
     }
    
}
