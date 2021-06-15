package com.market.mall.am.member.controller;

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
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.member.service.MemberGradeService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class MemberGradeController {
    
	@Resource(name="memberGradeService")
	private MemberGradeService memberGradeService;
	
	@Resource(name="commonService")
    private CommonService commonService;
    
	@RequestMapping("/am/member/memberGradeList")
	public ModelAndView memberGradeList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
        // Common Codes
		mv.addObject("MEMBER_TYPE_BASIC", Code.COMMON_PRI_MEMBER_GRADE);
		
		int totalCount = this.memberGradeService.selectMemberGradeListCount(commandMap);
		
    	Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
		
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
		List<Map<String, Object>> list = null;
		
		if(totalCount > 0) {
			list = this.memberGradeService.selectMemberGradeList(commandMap);
		}
		
		mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/am/member/memberGradeForm")
	public ModelAndView memberGradeForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

		mv.addObject("MemGradeList", this.commonService.selectCode("COMMON_PRI_MEMBER_GRADE"));
        mv.addObject("commandMap", commandMap);
        
		return mv;
	}
	
    @RequestMapping("/am/member/memberGradeRegist")
    public ModelAndView memberGradeRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("MEM_GRD_REG_IP", request.getRemoteAddr());
        commandMap.put("MEM_GRD_REG_ID", admin.getADM_MST_ID());
        
        // 관리자 등록
        int result = this.memberGradeService.insertMemberGrade(commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/memberGradeList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/memberGradeList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    @RequestMapping("/am/member/memberGradeEdit")
    public ModelAndView memberGradeEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_GRD_CD"), "")))
        {
            // 회원등급 관리 상세정보
            mv.addObject("row", this.memberGradeService.selectMemberGradeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    @RequestMapping("/am/member/memberGradeModify")
    public ModelAndView memberGradeModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("MEM_GRD_UPD_IP", request.getRemoteAddr());
        commandMap.put("MEM_GRD_UPD_ID", admin.getADM_MST_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_GRD_CD"), "")))
        {        	
            //관리자 수정
            int result = this.memberGradeService.updateMemberGrade(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/memberGradeList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/member/memberGradeList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/member/memberGradeListExcelDownload")
    public ModelAndView memberGradeListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	int totalCount = this.memberGradeService.selectMemberGradeListCount(commandMap);
    	
    	Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
    	commandMap.put("excelDown", "Y");
    	
    	if(totalCount > 0)
        {
    		List<Map<String, Object>> dataList = null;
            
            String fileName = "memberGradeList_"+DateUtil.getToday();
            
            String [] rowTitle = null;
            String [] cellSize = null;
            String [] dataName = null;
            String [] dataType = null;
            
            rowTitle = new String[]{"NO", "등급", "등급설명", "최소구매조건", "최대구매조건", "구매금액조건 설명" ,"E포인트","App전용 E포인트","생일기념 E포인트", "추가적립포인트", "회원 수"};
            cellSize = new String[]{"20", "50", "100", "70", "70", "70", "70", "70", "70", "70", "70"};
            dataName = new String[]{"RNUM", "MEM_GRD_NM", "MEM_GRD_DESC","MEM_AMT_CDT_MIN","MEM_AMT_CDT_MAX", "MEM_AMT_CDT_DESC", "MEM_GRD_E_PIT", "MEM_GRD_APP_PIT","MEM_GRD_BRT_PIT","MEM_GRD_ADD_PIT" ,"MEMBER_COUNTS"};
            dataType = new String[]{"String","String", "String", "String","String", "String", "String", "String", "String" , "String", "String"};

        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
            dataList = this.memberGradeService.selectMemberGradeList(commandMap);
            
            if(dataList != null) {
            	//회원사 등급 목록 엑셀 다운로드
            	ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
            }
            
        }
        return null;
    }
}
