package com.market.mall.am.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.am.member.service.SecessionMemberService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.model.Admin;


/**
 * @PackageName: com.market.mall.am.member.controller
 * @FileName : SecessionMemberController.java
 * @Date : 2015. 10. 22.
 * @프로그램 설명 : 관리자 > 회원관리 > 탈퇴회원관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class SecessionMemberController {

	@Resource(name="commonService")
	private CommonService commonService;  
	
	@Resource(name="secessionMemberService")
	private SecessionMemberService secessionMemberService;
	
	@Resource(name="infoMemberService")
	private InfoMemberService infoMemberService;

	
	/**
	 * <pre>
	 * 1. MethodName : secessionMemberList
	 * 2. ClassName  : SecessionMemberController.java
	 * 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 9. 5.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/member/secessionMemberList")
	public ModelAndView secessionMemberList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		/**
		 * 기본적으로 탈퇴회원 목록조회 안함
		 * 검색할 경우에만 해당 조건 목록 출력 
		 */
		
		// 검색 클릭 시 history 저장
        if(StringUtil.getString(commandMap.get("searchYn"), "").equals("Y"))
        {
        	this.infoMemberService.insertSearchHistory(request,commandMap); 
        }
        
        // 탈퇴 사유코드 (일반, 직권)
        String[] codes = {"MEMBER_SEC_REASON"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        // 탈퇴회원관리 목록갯수
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 :this.secessionMemberService.selectSecessionMemberListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount > 0)
        {
            // 탈퇴회원관리 목록
        	list = this.secessionMemberService.selectSecessionMemberList(commandMap);
        	
        	for(int i=0;i < list.size();i++)  
        	{
        	    // 해당 리스트 회원명 Marking 처리
        		list.get(i).put("MEM_MST_MEM_NM", FormatUtil.markingName(StringUtil.getString(list.get(i).get("MEM_MST_MEM_NM"),"")));
        	}
        }        

        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);

        return mv;
	}
	
	//
	/**
	* <pre>
	* 1. MethodName : secessionMemberExcelDownload
	* 2. ClassName  : SecessionMemberController.java
	* 3. Comment    : 관리자 > 회원관리 > 탈퇴회원관리 목록 엑셀다운로드
	* 4. 작성자       : Lee Han YOung
	* 5. 작성일       : 2020. 06. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
    @RequestMapping("/am/member/secessionMemberExcelDownload")
    public ModelAndView secessionMemberExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	 
        commandMap.put("excelDown", "Y");
        int totalCount = this.secessionMemberService.selectSecessionMemberListCount(commandMap);
        
        if(totalCount > 0){
        	List<Map<String, Object>> list = null;
        	 
        	String fileName = "restMemberList_"+DateUtil.getToday();
        	
        	/*								
        	String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","양력음력구분","실명인증여부","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트(잔여기준)","리뷰어회원 여부","이벤트 당첨건수(누적)"};
           String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR","BIR_TYPE", "REAL_NAME_CHECK","MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","LAST_ORD_DT","REAL_ORD_CNT","REAL_ORD_PAY","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT"} ;
           String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50"};
           String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};
           */
           
        	String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","실명인증여부","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","전화번호","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트","리뷰어회원 여부","이벤트 당첨건수" , "탈퇴일" ,"탈퇴사유" ,"탈퇴상세" };
           String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR", "REAL_NAME_CHECK", "MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2","MEM_MST_TEL", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","REAL_ORD_CNT","REAL_ORD_PAY","LAST_ORD_DT","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT" ,"MEM_MST_LEV_DT" ,"MEM_MST_LEV_RSN_CD_NM" , "MEM_MST_LEV_RSN" } ;
           String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50","50","50","100"};
           String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};            
           
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
           

        	list = this.secessionMemberService. selectSecessionMemberListExcel(commandMap);  // 엑셀다운로드         	
        	
        	
        	if(list != null){
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
    
    
    @RequestMapping("/am/member/secessionMemberDelete")
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
        int result = this.secessionMemberService.deleteRestMember(commandMap);
        
        
        mv.addObject("alertMsg", "해당 회원정보를 삭제되었습니다.");
        mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/secessionMemberList.do");
        return mv;
    }
	
    
    
	
}
