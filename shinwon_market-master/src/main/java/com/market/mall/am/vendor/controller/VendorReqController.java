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
import com.market.mall.am.vendor.service.VendorReqService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.vendor.controller
 * @FileName : VendorReqController.java
 * @Date : 2016. 8. 23.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점신청서관리를 처리하는 Controller Class
 * @author DEV_KIMYEONGJUN
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorReqController {

	@Resource(name="vendorReqService")
	private VendorReqService vendorReqService;
	
	@Resource(name="commonService")
    private CommonService commonService;

	
	/**
	 * <pre>
	 * 1. MethodName : vendorReqList
	 * 2. ClassName  : VendorReqController.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 목록
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 23.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
     * @api {POST} /am/vendor/vendorReqList.do
     * @apiName 입점신청서관리 목록 화면(프론트에서 입점신청한 신청서를 관리하는 목록)
     * @apiGroup 입점사관리
     * 
     * @apiParam {String} searchStartDate 검색 신청일
     * @apiParam {String} searchEndDate 검색 종료일
     * @apiParam {String} searchBusiNo 검색 사업자등록번호
     * @apiParam {String} searchVendorNm 검색 업체명
     * @apiParam {String} searchCeoNm 검색 대표자명
     * @apiParam {String} searchGubun 검색 상태(접수중 :Y,확인:N)
     * 
     * @apiSuccess {Object[]} list [{RNUM , VDR_REQ_IDX=입점신청IDX , VDR_REQ_NM = 입점업체명, VDR_REQ_GBN = 상태(접수중 :Y,확인:N) , VDR_REQ_CEO_NM = 대표자명, VDR_REQ_TEL1 = 연락처1, VDR_REQ_TEL2 = 연락처2, VDR_REQ_TEL3 = 연락처3, VDR_REQ_REG_DT = 등록일}]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/vendor/vendorReqList")
	public ModelAndView vendorReqList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();  
		
		int totalCount = this.vendorReqService.selectVendorReqListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
  
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null; 
        
        if (totalCount > 0){
            // 입점신청서 관리 목록
           list = this.vendorReqService.selectVendorReqList(commandMap);
        }
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);  
		
		return mv;
	}  
	
	/**
	* <pre>
	* 1. MethodName : vendorReqEdit
	* 2. ClassName  : VendorReqController.java
	* 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 수정 폼
	* 4. 작성자       : DEV_KIMYEONGJUN
	* 5. 작성일       : 2016. 2. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception  
	*/
	
    /**
     * @api {POST} /am/vendor/vendorReqEdit.do
     * @apiName 입점사 입점신청서관리 상세정보
     * @apiGroup 입점업체관리
     * 
     * @apiParam {String} VDR_REQ_IDX 입점신청IDX
     * 
     * @apiSuccess {Object} row 입점신청서 상세 정보 {VDR_REQ_IDX=74, VDR_REQ_GBN=N(상태), VDR_REQ_URL=사이트URL, VDR_REQ_SHP_NM=쇼핑몰명, VDR_REQ_SHP_GUBUN=쇼핑몰분류, VDR_REQ_TAX_MAIL=세금계산서 이메일, VDR_REQ_SUB_BUSI=종사업자번호, VDR_REQ_NM=업체명, VDR_REQ_BANK_CD=032, VDR_REQ_BUSI3=12345, VDR_REQ_BUSI1=123, VDR_REQ_BUSI2=11, VDR_REQ_FAX3=1234, VDR_REQ_BUSI_CDT=업태, VDR_REQ_BUSI_TYPE=업종, VDR_REQ_REF_TEL1=연락처1, VDR_REQ_REF_TEL2=연락처2 ,VDR_REQ_REF_TEL3=연락처3, VDR_REQ_FAX1=063,  VDR_REQ_FAX2=1234, VDR_REQ_POST5=우편번호, VDR_REQ_CEO_NM=대표자당, VDR_REQ_ACT_HDR=돈주세요, VDR_REQ_DR_ADDR2=123, VDR_REQ_DR_ADDR1=부산 사상구 낙동대로1234번길 3 (삼락동), VDR_REQ_ACT_NO=1234123123, VDR_REQ_MNG_NM=담당자명, VDR_REQ_TEL1=담당자_연락처1, VDR_REQ_TEL2=담당자_연락처2, VDR_REQ_TEL3=담당자_연락처3, VDR_REQ_HP1=담당자_휴대폰1, VDR_REQ_HP2=담당자_휴대폰2, VDR_REQ_HP3=담당자_휴대폰3, VDR_REQ_PATH=입점경로 , VDR_REQ_REG_DT=신청일, VDR_REQ_UPD_DT=수정일, VDR_REQ_CNT=요청사항}
     * @apiSuccess {Object[]} vendorRouteChannel 외부채널 리스트 [{VDR_REQ_CHN_TYPE=브랜디}, {VDR_REQ_CHN_TYPE=지그재그}]
     * @apiSuccess {Object} file 사업자등록증 첨부파일 정보 {CMM_FLE_ATT_EXT=jpeg, CMM_FLE_ATT_SIZE=25086, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/board/2020/04/14/6589705c-9df4-464c-b8c3-3e2b6b7e9f5a.jpeg, CMM_FLE_ATT_PATH=/attach/board/2020/04/14/, CMM_FLE_TB_NM=T_VDR_REQ, CMM_FLE_ORG_NM=품격있냥.jpeg, CMM_FLE_SORT=0, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=59, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5537, CMM_FLE_REG_DT=20200414093909, CMM_FLE_SYS_NM=6589705c-9df4-464c-b8c3-3e2b6b7e9f5a.jpeg}
     * @apiSuccess {Object} codes 공통코드 리스트 {HP_CODE:핸드폰 앞자리 코드, TEL_CODE:국번 코드, EMAIL_DOMAIN_CODE:이메일 도메인 코드, KICC_BANK_CD:KICC 은행 코드}
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/vendor/vendorReqEdit")
	public ModelAndView vendorReqEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("VDR_REQ_IDX"),"")))
		{
			// 입점신청서 상세 정보
			Map<String, Object> resultMap = this.vendorReqService.selectVendorReqInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("vendorRouteChannel", resultMap.get("vendorRouteChannel"));
            mv.addObject("file", resultMap.get("file"));
            mv.addObject("commandMap",commandMap);
		}
		
        // Common Codes
        String[] codes = {"HP_CODE", "TEL_CODE", "EMAIL_DOMAIN_CODE", "KICC_BANK_CD"};
        mv.addObject("codes", this.commonService.selectCodes(codes));	
        
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : vendorReqModify
	* 2. ClassName  : VendorReqController.java
	* 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 수정
	* 4. 작성자       : DEV_KIMYEONGJUN
	* 5. 작성일       : 2016. 2. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return 
	* @throws Exception
	*/
	
    /**
     * @api {POST} /am/vendor/vendorReqModify.do
     * @apiName 입점사 입점신청서관리 수정 처리
     * @apiGroup 입점업체관리
     * 
     * @apiParam {String} VDR_REQ_IDX 입점신청IDX
     * @apiParam {String} VDR_REQ_GBN 구분(Y:확인,N:접수중)
     * @apiParam {String} VDR_REQ_CEO_NM 대표자명
     * @apiParam {String} VDR_REQ_BUSI1 사업자등록번호1
     * @apiParam {String} VDR_REQ_BUSI2 사업자등록번호2 
     * @apiParam {String} VDR_REQ_BUSI3 사업자등록번호3 
     * @apiParam {String} VDR_REQ_SUB_BUSI 종사업자번호
     * @apiParam {String} file 사업자등록증 파일
     * @apiParam {String} VDR_REQ_JB_ADDR1 지번 기본주소
     * @apiParam {String} VDR_REQ_JB_ADDR2 지번 상세주소
     * @apiParam {String} VDR_REQ_DR_ADDR1 도로명 기본주소
     * @apiParam {String} VDR_REQ_DR_ADDR2 도로명 상세주소
     * @apiParam {String} VDR_REQ_POST5 사업장 우편번호
     * @apiParam {String} VDR_REQ_TAX_MAIL 세금계산서이메일
     * @apiParam {String} VDR_REQ_BUSI_TYPE 업종
     * @apiParam {String} VDR_REQ_BUSI_CDT 업태
     * @apiParam {String} VDR_REQ_REF_TEL1 연락처1
     * @apiParam {String} VDR_REQ_REF_TEL2 연락처2
     * @apiParam {String} VDR_REQ_REF_TEL3 연락처3
     * @apiParam {String} VDR_REQ_FAX1 팩스1
     * @apiParam {String} VDR_REQ_FAX2 팩스2
     * @apiParam {String} VDR_REQ_FAX3 팩스3
     * @apiParam {String} VDR_REQ_BANK_CD 은행코드
     * @apiParam {String} VDR_REQ_ACT_NO 계좌번호
     * @apiParam {String} VDR_REQ_ACT_HDR 예금주
     * @apiParam {String} VDR_REQ_SHP_NM 쇼핑몰명
     * @apiParam {String} VDR_REQ_URL 사이트URL
     * @apiParam {String} VDR_REQ_MNG_NM 담당자명
     * @apiParam {String} VDR_REQ_TEL1 담당자 연락처1
     * @apiParam {String} VDR_REQ_TEL2 담당자 연락처2
     * @apiParam {String} VDR_REQ_TEL3 담당자 연락처3
     * @apiParam {String} VDR_REQ_HP1 담당자 휴대폰1
     * @apiParam {String} VDR_REQ_HP2 담당자 휴대폰2
     * @apiParam {String} VDR_REQ_HP3 담당자 휴대폰3
     * 
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
     * @apiSuccess {String} returnUrl 수정 성공/실패시 RETURN URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
	@RequestMapping("/am/vendor/vendorReqModify")
	public ModelAndView vendorReqModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
        if(!"".equals(StringUtil.getString(commandMap.get("VDR_REQ_IDX"), "")))
        {
        	// 입점신청서관리 수정
            int result = this.vendorReqService.updateVendorReq(request, commandMap);
              
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorReqEdit.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/vendor/vendorReqEdit.do");
            }
            mv.addObject("commandMap", commandMap);
                 
            mv.setViewName("/am/common/result");
        }
        return mv;
	}
	
}