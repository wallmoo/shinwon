package com.market.mall.am.site.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.site.service.BasicManagerService;
import com.market.mall.am.site.service.BrandManagerService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;


/**
 * @PackageName: com.market.mall.am.site.controller
 * @FileName : VendorManagerController.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 시스템관리 > 입점업체 관리를 처리하는 Controller Class
 * @author DEV_KIMYEONGJUN
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorManagerController {
	
	@Resource(name="vendorManagerService")
	private VendorManagerService vendorManagerService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name="basicManagerService") 
    private BasicManagerService basicManagerService;
	
	@Resource(name="brandManagerService") private BrandManagerService brandManagerService;
	
	/**
	 * 1. MethodName : vendorManagerList
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/vendorManagerList")
	public ModelAndView vendorManagerList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 입점업체 관리 목록 갯수
		int totalCount = this.vendorManagerService.selectVendorManagerListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String,Object>> list = null;
        
        if(totalCount > 0)
        {
        	 // 입점업체 관리 목록
        	 list = this.vendorManagerService.selectVendorManagerList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorManagerForm
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 등록 폼
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/vendorManagerForm")
	public ModelAndView vendorManagerForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// Common Codes
        String[] codes = {"HP_CODE","TEL_CODE","EMAIL_DOMAIN_CODE","KICC_BANK_CD","WORK_DIVISION_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        
        commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);	// MD 관리자 idx
        
        // 권한이 MD인 관리자 목록 
        mv.addObject("managerMDList", this.basicManagerService.selectBasicManagerTypeList(commandMap));
        
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorManagerRegist
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 등록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	/**
     * @api {POST} /am/site/vendorManagerRegist.do
     * @apiName 입점사정보 등록처리
     * @apiGroup SB시스템관리
     * 
     * @apiParam {String} VDR_MST_NM 입점업체명
     * @apiParam {String} VDR_MST_BUSI1 사업자번호1
     * @apiParam {String} VDR_MST_BUSI2 사업자번호2
     * @apiParam {String} VDR_MST_BUSI3 사업자번호3
     * @apiParam {String} VDR_MST_SUB_BUSI_USE_YN 종사업자번호 사용여부 (Y/N)
     * @apiParam {String} VDR_MST_SUB_BUSI 종사업자번호
     * @apiParam {String} VDR_MST_CEO_NM 대표자명
     * @apiParam {String} VDR_MST_BUSI_CDT 업종
     * @apiParam {String} VDR_MST_BUSI_TYPE 업태
     * @apiParam {String} VDR_MST_POST6 사업장 우편번호 6자리
     * @apiParam {String} VDR_MST_POST5 사업장 우편번호 5자리
     * @apiParam {String} VDR_MST_JB_ADDR1 지번_기본주소
     * @apiParam {String} VDR_MST_JB_ADDR2 지번_상세주소
     * @apiParam {String} VDR_MST_DR_ADDR1 도로명_기본주소
     * @apiParam {String} VDR_MST_DR_ADDR2 도로명_상세주소
     * @apiParam {String} VDR_MST_TEL1 사업장 전화번호1
     * @apiParam {String} VDR_MST_TEL2 사업장 전화번호2
     * @apiParam {String} VDR_MST_TEL3 사업장 전화번호3
     * @apiParam {String} VDR_MST_FAX1 사업장 팩스1
     * @apiParam {String} VDR_MST_FAX2 사업장 팩스2
     * @apiParam {String} VDR_MST_FAX3 사업장 팩스3
     * @apiParam {String} VDR_MST_MAIL 대표 이메일
     * @apiParam {String} VDR_MST_MD_ID 담당MD ID
     * @apiParam {String} VDR_MST_USE_YN 상태 Y/N
     * @apiParam {String} VDR_MST_BAL_ACT 정산주기
     * @apiParam {String} VDR_MST_BANK_CD 은행코드
     * @apiParam {String} VDR_MST_ACT_NO 계좌번호
     * @apiParam {String} VDR_MST_ACT_HDR 예금주명
     * @apiParam {String} VDR_MST_CTR_ST_DT 계약기간 시작일
     * @apiParam {String} VDR_MST_CTR_ED_DT 계약기간 종료일
     * @apiParam {String} VDR_MST_CTR_DT 계약일
     * @apiParam {String} VDR_MST_FEE 수수료
     * @apiParam {String} VDR_MST_DLV_PRICE 배송비 무료조건
     * @apiParam {String} VDR_MST_MNG_NM 담당자명
     * @apiParam {String} VDR_MST_MNG_HP1 담당자 휴대폰1
     * @apiParam {String} VDR_MST_MNG_HP2 담당자 휴대폰2
     * @apiParam {String} VDR_MST_MNG_HP3 담당자 휴대폰3
     * @apiParam {String} VDR_MST_MNG_TEL1 담당자 연락처1
     * @apiParam {String} VDR_MST_MNG_TEL2 담당자 연락처2
     * @apiParam {String} VDR_MST_MNG_TEL3 담당자 연락처3
     * @apiParam {String} VDR_MST_MNG_MAIL 담당자 이메일
     * @apiParam {String} VDR_MST_MNG_TYPE 담당자 업무구분
     * 
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 성공/실패시 RETURN URL
     */
	@RequestMapping("/am/site/vendorManagerRegist")
	public ModelAndView vendorManagerRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 입점업체 등록
		int result = this.vendorManagerService.insertVendorManager(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/vendorManagerList.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/vendorManagerList.do");
        }
        mv.setViewName("/am/common/result");
        
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorManagerEdit
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체 수정 폼
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/vendorManagerEdit")
	public ModelAndView vendorManagerEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("VDR_MST_IDX"), "")))
        {
			// Common Codes
	        String[] codes = {"HP_CODE","TEL_CODE","EMAIL_DOMAIN_CODE","KICC_BANK_CD","WORK_DIVISION_CODE"};
	        mv.addObject("codes", this.commonService.selectCodes(codes));	
             
	        commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);		// MD 관리자 idx
	        
	        // 권한이 MD인 관리자 목록 
	        mv.addObject("managerMDList", this.basicManagerService.selectBasicManagerTypeList(commandMap));
             
            // 관리자 상세 정보
            mv.addObject("row", this.vendorManagerService.selectVendorManagerInfo(commandMap));
        }
         
        mv.addObject("commandMap", commandMap);
         
        return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorManagerModify
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체 수정
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/vendorManagerModify")
	public ModelAndView vendorManagerModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		
		
		
		int result = this.vendorManagerService.updateVendorManager(request, commandMap);
		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/vendorManagerEdit.do");
        }
        else  
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/vendorManagerEdit.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : searchVendorPopup
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 입점업체 검색 팝업
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/searchVendorPopup")
	public ModelAndView searchVendorPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		// 입점 신청 업체 목록 갯수
		int totalCount = this.vendorManagerService.selectVendorReqListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0)
        {
        	 // 입점 신청 업체 관리 목록
        	 list = this.vendorManagerService.selectVendorReqList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorManagerNmCheckAjax
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 입점업체 중복 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/vendorManagerNmCheckAjax")
	public JSON vendorManagerNmCheckAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();  

		// 업체명, 사업자 번호 유무확인
		if(!"".equals(StringUtil.getString(commandMap.get("VDR_MST_NM"), "")) && !"".equals(StringUtil.getString(commandMap.get("VDR_MST_BUSI1"), "")) && 
		   !"".equals(StringUtil.getString(commandMap.get("VDR_MST_BUSI2"), "")) && !"".equals(StringUtil.getString(commandMap.get("VDR_MST_BUSI3"), "")))
        {
            // 입점업체 중복 체크
            int vdrNmCount = this.vendorManagerService.selectVendorManagerNmCheckCount(commandMap);
            
            if( vdrNmCount > 0)
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : searchVendorMultiPopup
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 입점업체 다중 검색 팝업
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/searchVendorMultiPopup")
	public ModelAndView searchVendorMultiPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 입점업체 관리 목록 갯수
		int totalCount = this.vendorManagerService.selectVendorManagerListCount(commandMap);
		
		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String,Object>> list = null;
        
        if(totalCount > 0)
        {
        	 // 입점업체 관리 목록
        	 list = this.vendorManagerService.selectVendorManagerList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);

		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : changeFeePopup
	 * 2. ClassName  : VendorManagerController.java
	 * 3. Comment    : 관리자 > 시스템관리 > 입점업체관리 > 수정 > 수수료 변경
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/site/changeFeePopup")
	public ModelAndView changeFeePopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : changeFeePopupRegistAjax
	* 2. ClassName  : VendorManagerController.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체관리 > 수정 > 수수료 변경 > 등록
	* 4. 작성자       : DEV_KIMYEONGJUN
	* 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
//	@RequestMapping("/am/site/changeFeePopupRegistAjax")
//	public JSON changeFeePopupRegistAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
//	{
//		JSON json = new JSON();
//
//		if(!"".equals(StringUtil.getString(commandMap.get("PRD_MST_VDR_IDX"), "")))
//        {
//            // 수수료 변경
//			int result = this.vendorManagerService.updateChangeFee(commandMap);
//            
//            if( result > 0)
//            {
//            	json.put("resultMsg", "수수료가 변경되었습니다.");
//            	json.put("successYn", "Y");
//            }
//            else
//            {
//            	json.put("successYn", "N");
//            }
//            
//        }
//        else 
//        {
//        	json.put("successYn", "N");
//        }
//        
//        return json;
//	}
	
	@RequestMapping("/am/site/vendorManagerPopup")
	public ModelAndView vendorManagerPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception {
	    
	    ModelAndView mv = new ModelAndView();
	    
	    if(!"".equals(StringUtil.getString(commandMap.get("VDR_MST_IDX"), "")))
        {
	        // Common Codes
            String[] codes = {"HP_CODE","TEL_CODE","EMAIL_DOMAIN_CODE","KICC_BANK_CD","WORK_DIVISION_CODE"};
            mv.addObject("codes", this.commonService.selectCodes(codes));   
             
            commandMap.put("MD_ADMINISTRATOR_IDX", Code.MD_ADMINISTRATOR_IDX);      // MD 관리자 idx
            
            // 권한이 MD인 관리자 목록 
            mv.addObject("managerMDList", this.basicManagerService.selectBasicManagerTypeList(commandMap));
            
            // 관리자 상세 정보
            mv.addObject("row", this.vendorManagerService.selectVendorManagerInfo(commandMap));
            
            //입점업체 브랜드 정보
            commandMap.put("VDR_MST_IDX", commandMap.get("VDR_MST_IDX"));
            mv.addObject("brandManagerInfo", this.brandManagerService.selectBrandInfoByVendor(commandMap));
        }
	    
	    return mv;
	}
	
	@RequestMapping("/am/site/searchSellerPopup")
    public ModelAndView searchSellerPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("OST_SEND_END", Code.OST_SEND_END);
        commandMap.put("OST_FIX", Code.OST_FIX);
        
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        
        //셀러
        int totalCount = this.vendorManagerService.selectSellerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if(totalCount > 0)
        {
             //셀러목록
             list = this.vendorManagerService.selectSellerSearchList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
	
	@RequestMapping("/am/site/vendorManagerDeleteList")
	public ModelAndView vendorManagerDeleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		
        String[] array =  StringUtil.getArray(commandMap, "targetVdrList");
        commandMap.put("VDR_LIST", array);
        
		
		int result = this.vendorManagerService.deleteVendorManager(request, commandMap);
		//int result = this.vendorManagerService.updateVendorManager(request, commandMap);
		
		// view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "삭제 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/vendorManagerList.do");
        }
        else  
        {
            mv.addObject("alertMsg", "삭제 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/vendorManagerList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
		return mv;
	}
	
	
}
