package com.market.mall.am.accounting.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.accounting.service.CompanyAccountingService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.vendor.controller
 * @FileName : VendorInqController.java
 * @Date : 2016. 2. 11.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점업체문의사항을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CompanyAccountingController {
	
	@Resource(name="companyAccountingService") 
	private CompanyAccountingService companyAccountingService;

	@Resource(name="commonService")
    private CommonService commonService;
	
	/**
	* <pre>
	* 1. MethodName : companyAccountingList
	* 2. ClassName  : CompanyAccountingController.java
	* 3. Comment    : 관리자 > 정산관리 >  목록
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 2. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/accounting/companyAccountingList")
    public ModelAndView companyAccountingList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  {
        ModelAndView mv = new ModelAndView();
                
        List<Map<String, Object>> list = this.companyAccountingService.selectCompanyAccountingList(commandMap);
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("searchAdmMstSubIdx", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        
        
        // 문의 유형 코드 목록
        mv.addObject("vdrMstList", this.companyAccountingService.selectVdrMstList(commandMap));
        mv.addObject("admMstList", this.companyAccountingService.selectAdmMstList(commandMap));
        mv.addObject("yearList", this.companyAccountingService.selectJungsanYearList(commandMap));
        mv.addObject("monthList", this.companyAccountingService.selectJungsanMonthList(commandMap));
                
        mv.setViewName("/am/accounting/companyAccountingList");
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
        
    }
	/**
	* <pre>
	* 1. MethodName : companyAccountingList
	* 2. ClassName  : CompanyAccountingController.java
	* 3. Comment    : 관리자 > 정산관리 >  목록
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 2. 11.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/accounting/companyAccountingDetail")
    public ModelAndView companyAccountingDetail(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("searchAdmMstSubIdx", admin.getADM_MST_SUB_IDX()); //입점업체 idx
                
        List<Map<String, Object>> list = this.companyAccountingService.selectCompanyAccountingDetail(commandMap);
        
        // 문의 유형 코드 목록
        mv.addObject("vdrMstList", this.companyAccountingService.selectVdrMstList(commandMap));
        mv.addObject("admMstList", this.companyAccountingService.selectAdmMstList(commandMap));
        mv.addObject("yearList", this.companyAccountingService.selectJungsanYearList(commandMap));
        mv.addObject("monthList", this.companyAccountingService.selectJungsanMonthList(commandMap));
                
        mv.setViewName("/am/accounting/companyAccountingDetail");
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
        
    }
	
	/**
	* <pre>
	* 1. MethodName : companyAccountingUpdateAjax
	* 2. ClassName : CompanyAccountingController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 고객체험단관리 > 당첨자업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/accounting/companyAccountingUpdateAjax")
	public JSON companyAccountingUpdateAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.companyAccountingService.insertAccountingRequest(request,commandMap);
		
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}
        
        return json;
	}
	/**
	* <pre>
	* 1. MethodName : companyAccountingUpdateAjax
	* 2. ClassName : CompanyAccountingController.java
	* 3. Comment : 관리자 > 정산관리 > 정산확정업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2016. 5. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/accounting/companyAccountingCnfmUpdateAjax")
	public JSON companyAccountingCnfmUpdateAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.companyAccountingService.updateAccountingRequestCnfm(request,commandMap);
		
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}
        
        return json;
	}
	
    /**
    * <pre>
    * 1. MethodName : companyAccountingExcel
    * 2. ClassName  : CompanyAccountingController.java
    * 3. Comment    : 관리자 > 정산 관리 > 정산 목록 엑셀 다운로드 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2016. 5. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/accounting/companyAccountingExcel")
    public ModelAndView companyAccountingExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
      	List<Map<String, Object>> dataList = this.companyAccountingService.selectCompanyAccountingList(commandMap);
           
        	
        String [] rowTitle = null;
        String [] cellSize = null;
        String [] dataName = null;
        String [] dataType = null;
            
            
        rowTitle = new String[]{"NO", "업체명", "정산일자", "구매확정건수","상품가격","공급가","즉시할인가","배송비","정산대상금액","MD명","SCM확인여부"};
        cellSize = new String[]{"20",  "50",    "40",    "40",     "70",   "70",   "70",  "70",    "70",   "50",     "80"};
        dataName = new String[]{"RNUM", "VDR_MST_NM", "VDR_MST_BAL_ACT","ORD_CNT","PRD_MST_PRC","PRD_MST_ORD_PRC","PRD_MST_BUY_PRC","ORD_PRD_DLV_CAG","JUNGSAN_AMT","VDR_MST_IDX", "ACC_REQ_STATUS_EXCEL"};
        dataType = new String[]{"String","String", "String", "String","String","String","String","String","String","String","String"};
                       	
        String fileName = "AccountingList";
             
            // 당첨자 목록 엑셀 다운로드
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
     
        return null;
    }
    /**
     * <pre>
     * 1. MethodName : companyAccountingDetailExcel
     * 2. ClassName  : CompanyAccountingController.java
     * 3. Comment    : 관리자 > 정산 관리 > 업체별상세 엑셀 다운로드 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2016. 5. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/accounting/companyAccountingDetailExcel")
     public ModelAndView companyAccountingDetailExcel(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	
       	List<Map<String, Object>> dataList = this.companyAccountingService.selectCompanyAccountingDetail(commandMap);
            
         	
         String [] rowTitle = null;
         String [] cellSize = null;
         String [] dataName = null;
         String [] dataType = null;
 
         rowTitle = new String[]{"주문일시", "주문번호", "결제방법", "상품코드","상품명","상품가격","수량","공급가","즉시할인가","배송비","정산대상금액","배송완료일","구매확정일"};
         cellSize = new String[]{"40",     "50",    "40",    "40",   "100",   "40", "20", "40",  "40",   "40",     "40",     "50",    "50"};
         dataName = new String[]{"ORD_MST_PAY_DT", "ORD_MST_CD", "ORD_MST_PAY_TYPE","ORD_PRD_MST_CD","PRD_MST_NM","PRD_MST_PRC","ORD_PRD_ORD_CNT","PRD_MST_BUY_PRC","PRD_MST_ORD_PRC","ORD_PRD_DLV_CAG", "JUNGSAN_AMT","DLV_DTS","CNFM_DTS"};
         dataType = new String[]{"String","String", "String", "String","String","String","String","String","String","String","String","String","String"};
                        	
         String fileName = "AccountingDetail";
              
             // 당첨자 목록 엑셀 다운로드
         ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
      
         return null;
     }
	
}
