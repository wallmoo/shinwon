package com.market.mall.am.vendor.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.vendor.service.VendorCounselService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.vendor.controller
 * @FileName : VendorCounselController.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점상담관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorCounselController {

	@Resource(name="vendorCounselService")
	private VendorCounselService vendorCounselService;
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	/**
	 * <pre>
	 * 1. MethodName : vendorCounselList
	 * 2. ClassName  : VendorCounselController.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
     * @api {POST} /am/vendor/vendorCounselList.do
     * @apiName 입점사 입점문의관리 목록
     * @apiGroup 입점업체관리
     * 
     * @apiParam {String} searchStartDate 검색 신청일
     * @apiParam {String} searchEndDate 검색 종료일
     * @apiParam {String} searchBusiNo 검색 사업자등록번호
     * @apiParam {String} searchVendorNm 검색 업체명
     * @apiParam {String} searchManagerNm 검색 담당자명
     * 
     * @apiSuccess {Object[]} list 입점문의 목록 [{RNUM , VDR_CST_NM = 업체명, VDR_CST_IDX = 입점문의IDX , VDR_CST_BUSI1 = 사업자번호1 , VDR_CST_BUSI2 = 사업자번호2, VDR_CST_BUSI3=사업자번호3 , VDR_CST_MNG_NM = 담당자명 , VDR_CST_TEL1=담당자_유선전화1 , VDR_CST_TEL2=담당자_유선전화2, VDR_CST_TEL3=담당자_유선전화3, VDR_CST_HP1=담당자핸드폰1, VDR_CST_HP2=담당자핸드폰2, VDR_CST_HP3=담당자핸드폰3, VDR_CST_REG_DT = 등록일, VDR_CST_USE_YN = 사용여부 }]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/vendor/vendorCounselList")
	public ModelAndView vendorCounselList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		int totalCount = this.vendorCounselService.selectVendorCounselListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if (totalCount > 0){
            // 입점상담 관리 목록
            list = this.vendorCounselService.selectVendorCounselList(commandMap);
        }
        
        // 구분 코드 리스트
        //mv.addObject("codeList", this.commonService.selectCode("STANDINGPOINT_CODE"));
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorCounselEdit
	 * 2. ClassName  : VendorCounselController.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	 /**
     * @api {POST} /am/vendor/vendorCounselEdit.do
     * @apiName 입점사 입점문의관리 상세정보
     * @apiGroup 입점업체관리
     * 
     * @apiParam {String} VDR_CST_IDX 입점문의IDX
     * 
     * @apiSuccess {Object} row 입점문의 상세 정보 { VDR_CST_IDX=67, VDR_CST_NM = 업체명, VDR_CST_BUSI1=사업자번호1, VDR_CST_BUSI2=사업자번호2, VDR_CST_BUSI3=사업자번호3, VDR_CST_TITLE=문의제목22, VDR_CST_TEL1=담당자_유선전화1, VDR_CST_TEL2=담당자_유선전화2, VDR_CST_TEL3=담당자_유선전화3, VDR_CST_MNG_NM=담당자이름, VDR_CST_CTS=문의내용입니다22, VDR_CST_USE_YN=Y, VDR_CST_GUBUN=쇼핑몰_분류, VDR_CST_MAIL=abc@google.com, VDR_CST_HP1=담당자핸드폰1, VDR_CST_HP2=담당자핸드폰2, VDR_CST_HP3=담당자핸드폰3, VDR_CST_URL=www.abc.com, VDR_CST_REG_DT=20200414115157}
     * @apiSuccess {Object[]} fileList 첨부파일리스트  [{CMM_FLE_ATT_EXT=hwp, CMM_FLE_ATT_SIZE=369664, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/upload/attach/board/2020/04/14/876b065c-adda-496e-9538-1bf2d2467434.hwp, CMM_FLE_ATT_PATH=/attach/board/2020/04/14/, CMM_FLE_TB_NM=T_VDR_CST, CMM_FLE_ORG_NM=청년 1. 청년내일채움공제 사업안내확인서_20.01.09.hwp, CMM_FLE_SORT=0, CMM_FLE_SYS_PATH=/mnt/data/tomcat/upload, CMM_FLE_TB_PK=67, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5542, CMM_FLE_REG_DT=20200414115403, CMM_FLE_SYS_NM=876b065c-adda-496e-9538-1bf2d2467434.hwp}]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/vendor/vendorCounselEdit")
	public ModelAndView vendorCounselEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("VDR_CST_IDX"),"")))
		{
			// 입점상담 상세 정보
			Map<String, Object> resultMap = this.vendorCounselService.selectVendorCounselInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
            //mv.addObject("dtbList", resultMap.get("dtbList"));
		}
		
		// 구분 코드 리스트
        //mv.addObject("codeList", this.commonService.selectCode("STANDINGPOINT_CODE"));
        mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : vendorCounselModify
	 * 2. ClassName  : VendorCounselController.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 수정 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
    /**
     * @api {POST} /am/vendor/vendorCounselModify.do
     * @apiName 입점사 입점문의관리 수정 처리
     * @apiGroup 입점업체관리
     * 
     * @apiParam {String} VDR_CST_IDX 입점문의IDX
     * @apiParam {String} VDR_CST_MEMO 관리자 메모
     * 
     * @apiSuccess {String} alertMsg 성공/실패 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/vendor/vendorCounselModify")
	public ModelAndView vendorCounselModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		Admin admin = SessionsAdmin.getSessionAdmin(request);
		
        commandMap.put("VDR_CST_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_CST_UPD_ID", admin.getADM_MST_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("VDR_CST_IDX"), "")))
        {
        	
        	// 입점상담관리 수정
            int result = this.vendorCounselService.updateVendorCounsel(commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorCounselList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorCounselList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
	}
}
