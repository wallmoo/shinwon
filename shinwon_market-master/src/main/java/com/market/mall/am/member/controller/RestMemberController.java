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
import com.market.mall.am.member.service.RestMemberService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.member.controller
 * @FileName : RestMemberController.java
 * @Date : 2015. 10. 22.
 * @프로그램 설명 : 관리자 > 회원관리 > 휴면회원관리를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class RestMemberController {
	
	@Resource(name="commonService")  	private CommonService commonService;
	@Resource(name="restMemberService") private RestMemberService restMemberService;
	@Resource(name="infoMemberService") private InfoMemberService infoMemberService;
	
	/**
	* <pre>
	* 1. MethodName : restMemberList
	* 2. ClassName  : RestMemberController.java
	* 3. Comment    : 관리자 > 회원관리 > 휴면회원관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/member/restMemberList")
	public ModelAndView restMemberList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 검색 클릭 시 history 저장
        if(StringUtil.getString(commandMap.get("searchYn"), "").equals("Y"))
        {
        	this.infoMemberService.insertSearchHistory(request,commandMap); 
        }
        
        // Common Codes
        String[] codes = {"COMMON_MEMBER_TYPE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        
        String[] previlege = {"MEMBER_PREVILEGE"}; //특정권한
        mv.addObject("previlege", this.commonService.selectCodes(previlege));
        
        // 휴면회원관리 목록 갯수
        int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 :this.restMemberService.selectRestMemberListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount > 0)
        {
            // 휴면회원관리 목록
        	list = this.restMemberService.selectRestMemberList(commandMap);
        	
        	for(int i=0;i < list.size();i++)
        	{
        		// 이름 마스킹처리  
        		list.get(i).put("MEM_MST_MEM_NM", FormatUtil.markingName(StringUtil.getString(list.get(i).get("MEM_MST_MEM_NM"),"")));
        		
        		// 전화번호 중간자리 마스킹처리
        		int hp2Len = StringUtil.getString(list.get(i).get("MEM_MST_HP2"),"").length();
        		
        		if(hp2Len > 0)
        		{
        			if(hp2Len == 3)
            		{
            			list.get(i).put("MEM_MST_HP2", "***");		
            		}
            		else
            		{
            			list.get(i).put("MEM_MST_HP2", "****");
            		}
        		}
        	}
        }        

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	
	
	//
	/**
	* <pre>
	* 1. MethodName : restMemberExcelDownload
	* 2. ClassName  : RestMemberController.java
	* 3. Comment    : 관리자 > 회원관리 > 휴면회원관리 엑셀다운로드
	* 4. 작성자       : Lee Han YOung
	* 5. 작성일       : 2020. 06. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
    @RequestMapping("/am/member/restMemberExcelDownload")
    public ModelAndView basicProductListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	 
        commandMap.put("excelDown", "Y");
        int totalCount = this.restMemberService.selectRestMemberListCount(commandMap);
        
        if(totalCount > 0){
        	List<Map<String, Object>> list = null;
        	 
        	String fileName = "restMemberList_"+DateUtil.getToday();
        	
        	/*								
        	String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","양력음력구분","실명인증여부","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트(잔여기준)","리뷰어회원 여부","이벤트 당첨건수(누적)"};
           String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR","BIR_TYPE", "REAL_NAME_CHECK","MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","LAST_ORD_DT","REAL_ORD_CNT","REAL_ORD_PAY","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT"} ;
           String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50"};
           String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};
           */
           
        	String [] rowTitle = { "아이디","ESHOP아이디","이름","성별","생년월일","실명인증여부","회원등급","회원등급코드","우편번호","주소(동/읍/면)","주소(번지 미만)","전화번호","휴대폰번호","이메일","SMS 수신여부","e메일 수신여부","카카오톡 수신여부","통합포인트","E포인트","회원 가입일","가입시간","누적주문건수","실결제금액","총 실주문건수","총 구매금액","최종 주문일","접속 IP","임직원포인트","리뷰어회원 여부","이벤트 당첨건수"};
           String [] dataName = { "MEM_MST_MEM_ID" ,"MEM_MST_ERP_ID"    ,"MEM_MST_MEM_NM" , "MEM_IPN_SEX_NM","MEM_IPN_BIR", "REAL_NAME_CHECK", "MEM_MST_MEM_GBN_NM","MEM_MST_MEM_GRD", "MEM_MST_ZIP_CDE5","MEM_MST_DRO_ADR1","MEM_MST_DRO_ADR2","MEM_MST_TEL", "MEM_MST_HP","MEM_MST_MAIL","SMS_YN", "EMAIL_YN","KAKAO_YN","MEM_TOT_POINT", "MEM_E_POINT","MEM_REG_DT","MEM_REG_TM", "TOT_ORD_CNT","TOT_ORD_PAY","REAL_ORD_CNT","REAL_ORD_PAY","LAST_ORD_DT","MEM_MST_UPD_IP", "MEM_SW_POINT","REVIEWER_TYPE","TOT_EVT_WIN_COUNT"} ;
           String [] cellSize = {"50" , "50", "50","50","50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50" , "50", "50","50","50","50","50","50","50","50"};
           String [] dataType = {"String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String","String"};            
           
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
           

        	list = this.restMemberService.selectRestMemberListExcel(commandMap);  // 엑셀다운로드         	
        	
        	
        	if(list != null){
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
	
	
}
