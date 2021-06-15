package com.market.mall.am.member.controller;

import java.util.ArrayList;
import java.util.Calendar;
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
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.board.service.CommentBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.customer.service.InquiryService;
import com.market.mall.am.customer.service.ProductInquiryService;
import com.market.mall.am.marketing.service.EcouponService;
import com.market.mall.am.marketing.service.EventService;
import com.market.mall.am.marketing.service.PointService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.am.order.service.TaxIvcService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.cart.service.CartService;

import egovframework.rte.fdl.property.EgovPropertyService;
import oracle.sql.CLOB;

/**
 * 
 * @PackageName: com.market.mall.am.member.controller
 * @FileName : InfoMemberController.java
 * @Date : 2014. 6. 20.
 * @프로그램 설명 : 관리자 > 회원조회 > 회원정보관리를 처리하는 Controller Class
 * @author LJH
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class InfoExecutivesController {

	@Resource(name="commonService")  	private CommonService commonService;
	@Resource(name="infoMemberService") private InfoMemberService infoMemberService;
	@Resource(name="orderService") 		private OrderService orderService;
	@Resource(name="inquiryService") 	private InquiryService inquiryService;
	@Resource(name="taxIvcService")  private TaxIvcService taxIvcService;
	@Resource(name="ecouponService")  private EcouponService ecouponService;
	@Resource(name="pointService")  private PointService pointService;
	@Resource(name="eventService")  private EventService eventService;
	@Resource(name="commentBoardService")  private CommentBoardService commentBoardService;
	@Resource(name="productInquiryService")  private ProductInquiryService productInquiryService;
	
	@Resource	private CartService cartService;
	
    @Resource(name ="propertiesService") protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: infoMemberList
	 * 2. ClassName		: InfoMemberController.java
     * 3. Comment    	: 관리자 > 회원조회 > 회원현황 목록
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 6. 20. 오후 1:38:59
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/am/member/infoExecutivesRegist")
    public ModelAndView infoExecutivesList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String[] codes = {"EMPOYEE_GRADE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/member/infoExecutivesRegistRequest")
    public ModelAndView infoExecutivesRegistRequest(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/am/common/result");
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if(!"admin".equals(admin.getADM_MST_ID())){
        	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            return mv;
        }
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoExecutivesList.do");
        if(!commandMap.containsKey("MEM_MST_SW_ID")) {
        	mv.addObject("alertMsg", "ERP 사번정보가 없습니다.");
        	return mv;
        }
        if(!commandMap.containsKey("MEM_MST_SW_TYPE")) {
        	mv.addObject("alertMsg", "임직원 등급이 없습니다.");
        	return mv;
        }
        if(!commandMap.containsKey("MEM_MST_MEM_ID")) {
        	mv.addObject("alertMsg", "회원정보가 선택되지 않았습니다.");
        	return mv;
        }
        if(!commandMap.containsKey("MEM_MST_MEM_NM")) {
        	mv.addObject("alertMsg", "ERP사번의 이름정보가 없습니다.");
        	return mv;
        }
        int result = this.infoMemberService.changeEmployeeMember(commandMap);
        if(result <=0) {
        	mv.addObject("alertMsg", "회원정보가 일치하지 않습니다.");
        }
        mv.addObject("alertMsg", "임직원으로 전환되었습니다.");
        return mv;
    }
    
    @RequestMapping("/am/member/infoExecutivesList")
    public ModelAndView infoExecutivesRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

		commandMap.put("cPage", StringUtil.getString(commandMap.get("cPage"), "1"));
		commandMap.put("pageSize",  StringUtil.getString(commandMap.get("pageSize"), "20"));
        int totalCount = this.infoMemberService.infoExecutivesCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        List<Map<String, Object>> list = null;
        // 검색 클릭 시 history 저장
        if(totalCount>0){
        	list=this.infoMemberService.infoExecutivesList(request,commandMap); 
        }
        /*
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);

    	Map<String, Object> annualPointParam = new HashMap<String, Object>();
    	annualPointParam.put("YY", year);
    	List<Map<String,Object>> annualErpPointParam = ErpRequest.requestAnnualWelfarePoints(annualPointParam);
		Map<String,Object> baseAnnualPoint = annualErpPointParam.get(0);
		
		Map<String, Object> additionalParam = new HashMap<String, Object>();
		additionalParam.put("BYY", year);
		List<Map<String,Object>> additionalPoint = ErpRequest.requestAddtionalPoint(additionalParam);
		
		for(int i=0;i<list.size();i++) {
			Map<String,Object> user = list.get(i);
			String memMstSwId = StringUtil.getString(user.get("MEM_MST_SW_ID"));
			user.put("MEM_MST_PNT", StringUtil.getInt(baseAnnualPoint.get("LIMIT_AMT")));
			for(int j=0;j<additionalPoint.size();j++) {
				Map<String, Object> additionalPointMap = additionalPoint.get(j);
				if(memMstSwId!=null && !memMstSwId.isEmpty() && memMstSwId.equals(StringUtil.getString(additionalPointMap.get("USER_ID")))) {
					int pointSum = StringUtil.getInt(baseAnnualPoint.get("LIMIT_AMT")) + StringUtil.getInt(additionalPointMap.get("POINT_AMT"));
					user.put("MEM_MST_PNT", pointSum);
					break;
				}
			}
		}
		*/
		
        // Common Codes
        String[] codes = {"COMMON_MEMBER_TYPE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        //mv.addObject("baseAnnualPoint", baseAnnualPoint);
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("totalCount",totalCount);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    @RequestMapping("/am/member/infoExecutivesChangeNormal")
    public ModelAndView employeeChangeNormal(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/am/common/result");
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        if(!"admin".equals(admin.getADM_MST_ID())){
        	mv.addObject("alertMsg", "페이지 접근 권한이 없습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/main/dashboardMain.do");
            return mv;
        }
        
        String[] array =  StringUtil.getArray(commandMap, "targetMemberList");
        commandMap.put("MEMBER_LIST", array);
        int result = this.infoMemberService.changeNormalMember(commandMap);
        
        
        mv.addObject("alertMsg", "일반회원으로 전환되었습니다.");
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/infoExecutivesList.do");
        return mv;
    }
    
    @RequestMapping("/am/member/infoExecutivesErp")
    public JSON infoExecutivesErp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        json.put("data", ErpRequest.requestEmployeeName(commandMap));
        json.put("status", ""+HttpServletResponse.SC_OK);
        json.put("message", "성공적으로 조회했습니다.");
        return json;
        
    }
    

    @RequestMapping("/am/member/infoExecutivesExcelDownload")
    public ModelAndView infoExecutivesListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	 
        commandMap.put("excelDown", "Y");
        int totalCount = this.infoMemberService.infoExecutivesCount(commandMap);
        
        if(totalCount > 0){
        	List<Map<String, Object>> list = null;
        	 
           String fileName = "infoExecutivesList_"+DateUtil.getToday();
           
           String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","실명인증여부","임직원등급","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","전화번호","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트","리뷰어회원 여부","이벤트 당첨건수"};
           String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR", "REAL_NAME_CHECK","MEM_MST_SW_TYPE_NM","MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2","MEM_MST_TEL", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","REAL_ORD_CNT","REAL_ORD_PAY","LAST_ORD_DT","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT"} ;
           String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50"};
           String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};            
           
           ArrayList<String> dataTypeList = new ArrayList<String>();
           ArrayList<String> cellSizeList = new ArrayList<String>();
           /*
           for(int i=0;i<rowTitle.length;i++) {
           	cellSizeList.add("50");
           	dataTypeList.add("String");
           }
           String [] dataType = (String[]) dataTypeList.toArray();
           String [] cellSize = (String[]) cellSizeList.toArray();
           */
           
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
           
            list = this.infoMemberService.selectInfoExecutivesListExcel(commandMap);
        	
        	if(list != null){
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
    
 
}
