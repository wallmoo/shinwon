package com.market.mall.am.product.controller;

import java.net.URLEncoder;
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
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.am.product.service.VendorApprovalService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : VendorProductChangeController.java
 * @Date : 2015. 12. 2.
 * @프로그램 설명 : 입점업체 상품변경요청을 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.guest)
public class VendorProductChangeController {
	
private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="vendorApprovalService") private VendorApprovalService vendorApprovalService;
	@Resource(name="basicProductService") private BasicProductService basicProductService;
    
    /**
    * <pre>
    * 1. MethodName : vendorApprovalList
    * 2. ClassName : VendorApprovalController.java
    * 3. Comment : 입점업체 상품변경요청 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 2.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
	
	/**
     * @api {POST} /am/product/vendorProductChangeList.do
     * @apiName 입점업체 상품변경요청 목록 화면
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} searchPrdMstCd 검색 상품 코드
     * @apiParam {String} searchPrdMstNm 검색 상품명
     * @apiParam {String} searchPrdMstVdrIdx 입점업체 IDX
     * @apiParam {String} searchStartDate 등록 검색 시작일
     * @apiParam {String} searchEndDate 등록 검색 종료일
     * @apiParam {String} searchPrdMstSellState 상태
     * @apiParam {String} searchPrdMstDplState 진열
     * @apiParam {String} searchPrdMstApvState 승인
     * @apiParam {String} searchPrdMstMdId 검색 MD
     * @apiParam {String} searchPrdMstBrand 검색 브랜드
     * @apiParam {String} searchPrdCtgEnv 검색 카테고리 환경(P/M)
     * @apiParam {String} searchPrdCtgIdx 검색 카테고리 마지막 IDX
     * 
     * @apiSuccess {Object} commandMap 파라미터 맵
     * @apiSuccess {Object[]} basicMdList MD 리스트
     * @apiSuccess {Object[]} brandList 브랜드 리스트
     * @apiSuccess {Object[]} vendorList 입점업체 리스트
     * @apiSuccess {Object[]} list 입점업체 상품변경요청 리스트 [{RNUM=1, PRD_IMAGE=/pc/img/second/NoImage_250.jpg, PRD_MST_CD=S0011987, PRD_MST_PRC=99999(상품가격), PRD_MST_SEL_STATE_NM=판매중(판매상태), PRD_MST_REG_DT=2020-04-08, PRD_MST_SEL_CNT=판매가능수량, PRD_MST_DLV_FEE=배송비, PRD_MST_CNL_PC_YN=Y, PRD_MST_APV_STATE_NM=대기, DAUM_USE=YES, PRD_MST_SALE_RATE=할인율/할인액, DSP_PRD_CTG_IDX=3412, PRD_MST_DPL_STATE=Y(진열상태), PRD_MST_NM=상품테스트, PRD_MST_TYPE_NM=일반상품, NAVER_USE=YES, PRD_MST_APV_STATE=승인상태(D:대기,A:승인, C:보류,거절), PRD_MST_CNL_MB_YN=Y, PRD_MST_UNT_NM=정율(%)/정액, PRD_MST_SEL_STATE=판매상태(I:판매중,T:품절,S미판매), BND_MST_BRAND_NM=브랜드이름, PRD_MST_VDR_NM=입점업체이름}]
     */
    @RequestMapping(value="/am/product/vendorProductChangeList")
    public ModelAndView vendorProductChangeList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //기본값 설정
        commandMap.put("searchPrdMstDelFlag", "N");        
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }

        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        commandMap.put("searchVdrApvType", "Y");
        commandMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC); //PC 카테고리
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ){
        	totalCount = 0 ;
        	paging = new Paging(totalCount, commandMap); 
        }
        else{
        	//페이징
        	totalCount = this.vendorApprovalService.selectBasicProductCount(commandMap);
        	paging = new Paging(totalCount, commandMap); 
        	
        	if(totalCount>0)
        	{
        		list = this.vendorApprovalService.selectBasicProductList(commandMap);
        	}
        }
        
        //화면상단 상품요약
        //Map<String, Object> productSum = this.vendorApprovalService.selectProductSumList(commandMap);
        
        // MD리스트
        commandMap.put("AUT_MST_IDX", 26);
        List<Map<String, Object>> basicMdList = this.vendorApprovalService.selectBasicMdList(commandMap);
        
        //브랜드 리스트
        List<Map<String, Object>> brandList = this.vendorApprovalService.selectBrandList(commandMap);
        
        //입점업체 리스트
        List<Map<String, Object>> vendorList = this.basicProductService.selectVendorList(commandMap);


        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        //mv.addObject("summary",productSum);
        mv.addObject("commandMap", commandMap);
        
        mv.addObject("basicMdList", basicMdList);
        mv.addObject("brandList", brandList);
        mv.addObject("vendorList", vendorList);
        
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorProductChangeEdit
    * 2. ClassName : VendorProductChangeController.java
    * 3. Comment : 입점업체 수정요청 내용 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/vendorProductChangeEdit.do
     * @apiName 입점업체 상품변경요청 상품상세 화면
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} PRD_MST_CD 상품 코드
     * 
     * @apiSuccess {Object} productChangeInfo 상품 상세 정보 {VDR_APV_IDX = 입점업체_변경요청IDX , PRD_MST_CD = 상품코드, PRD_MST_NM = 기존상품명, PM_PRD_MST_PRC=기존판매가, PM_PRD_MST_SEL_CNT=기존 판매가능 수량 , PM_PRD_MST_UNT_NM = 기존 정율/정액 , PM_PRD_MST_SALE = 기존 할인율/할인금액 , PM_PRD_MST_SEL_STATE_NM = 기존 판매여부 상태, VAV_PRD_MST_CD = 변경정보 상품코드, VAV_PRD_MST_NM = 변경정보 상품이름, VAV_PRD_MST_PRC = 변겨정보 판매가, VAV_PRD_MST_SEL_CNT=변경정보 판매가능 수량 , VAV_PRD_MST_UNT= 정율:R/정액:S ,VAV_PRD_MST_UNT_NM = 변경정보 정율/정액 구분 , VAV_PRD_MST_SALE=변경정보 할인율/할인금액  , VAV_PRD_MST_SEL_STATE=변경정보 판매상태, VAV_PRD_MST_SEL_STATE_NM=변경정보 판매여부 상태}
     * @apiSuccess {Object[]} productHoldOffDetail 보류 사유 내용 [{VDR_HLD_IDX = 입점업체_변경요청IDX, VDR_HLD_DESC= 보류사유내용, VDR_HLD_APV_STATE=(승인:Y,보류:N), VDR_HLD_PRC_YN = 판매가 체크여부, VDR_HLD_NM_YN= 상품명 체크여부, VDR_HLD_CTG_YN= 카테고리 체크여부, VDR_HLD_CNT_YN= 영상/이미지 체크여부, VDR_HLD_NFI_YN= 고시정보 체크여부 , VDR_HLD_ETC_YN= 기타 체크여부 }]
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/vendorProductChangeEdit")
    public ModelAndView vendorProductChangeEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
    	ModelAndView mv = new ModelAndView();
    	
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
    	
    	//변경 상품 정보
        Map<String, Object> resultMap = this.vendorApprovalService.selectVendorProductChangeView(commandMap);
    	
        mv.addObject("productChangeInfo", resultMap.get("productChangeInfo"));
        mv.addObject("productHoldOffDetail", resultMap.get("productHoldOffDetail"));
        mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorProductDelete
    * 2. ClassName : VendorProductChangeController.java
    * 3. Comment : 수정요청 미승인 처리
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/vendorProductChangeDelete.do
     * @apiName 입점업체 상품변경요청 수정요청 보류 처리
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} VDR_APV_IDX 입점업체 변경요청 IDX
     * @apiParam {String} PRD_MST_CD 상품코드
     * @apiParam {String} VDR_HLD_APV_STATE 승인여부(Y:승인,N:보류)
     * @apiParam {String} VDR_HLD_PRC_YN 판매가 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_NM_YN 상품명 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_CTG_YN 카테고리 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_CNT_YN 영상/이미지 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_NFI_YN 고시정보 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_ETC_YN 기타 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_DESC 상세 사유 내용
     * 
     * @apiSuccess {String} alertMsg 보류 성공/실패 메세지
     * @apiSuccess {String} returnUrl 보류 성공/실패시 RETURN URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/vendorProductChangeDelete")
    public ModelAndView vendorProductChangeDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        commandMap.put("VDR_APV_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_APV_UPD_ID", admin.getADM_MST_ID());
        
        commandMap.put("VDR_HLD_REG_IP", request.getRemoteAddr());
        commandMap.put("VDR_HLD_REG_ID", admin.getADM_MST_ID());
        
        result = this.vendorApprovalService.deleteVendorProductList(request, commandMap);
        
        if(result > 0)
        {
            alertMsg = "승인거절이 정상적으로 처리되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/vendorProductChangeList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorProductChange
    * 2. ClassName : VendorProductChangeController.java
    * 3. Comment : 입점업체 상품수정요청 승인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/vendorProductChange.do
     * @apiName 입점업체 상품변경요청 수정요청 승인 처리
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} VDR_APV_IDX 입점업체 변경요청 IDX
     * @apiParam {String} PRD_MST_CD 상품코드
     * @apiParam {String} VAV_PRD_MST_PRC 변경정보 판매가
     * @apiParam {String} VAV_PRD_MST_SEL_CNT 변경정보 판매가능수량
     * @apiParam {String} VAV_PRD_MST_UNT 변경정보 할인구분 (정율:R/정액:S)
     * @apiParam {String} VAV_PRD_MST_SALE 변경정보 할인율/할인금액
     * @apiParam {String} VAV_PRD_MST_SEL_STATE 변경정보 판매 상태
     * 
     * @apiSuccess {String} alertMsg 승인 성공/실패 메세지
     * @apiSuccess {String} returnUrl 승인 성공/실패시 RETURN URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/vendorProductChange")
    public ModelAndView vendorProductChange(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        commandMap.put("VDR_APV_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_APV_UPD_ID", admin.getADM_MST_ID());
        
        result = this.vendorApprovalService.updateVendorProductChange(request, commandMap);
        
        if(result > 0)
        {
            alertMsg = "승인이 정상적으로 처리되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/vendorProductChangeList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorProductMulitChange
    * 2. ClassName : VendorProductChangeController.java
    * 3. Comment : 입점업체 상품변경요청 멀티
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 4. 5.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/vendorProductChangeMulit")
    public ModelAndView vendorProductChangeMulit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        commandMap.put("VDR_APV_UPD_IP", request.getRemoteAddr());
        commandMap.put("VDR_APV_UPD_ID", admin.getADM_MST_ID());
        
        //상품 옵션 
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//상품코드
        
        result = this.vendorApprovalService.updateVendorProductMulitChange(request, commandMap);
        
        if(result > 0)
        {
            alertMsg = "승인이 정상적으로 처리되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/vendorProductChangeList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorProductChangeListExcelDownload
    * 2. ClassName : VendorProductChangeController.java
    * 3. Comment : 입점업체 상품 수정요청 변경 엑셀 다운로드
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 1.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/vendorProductChangeListExcelDownload")
    public ModelAndView vendorProductChangeListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        String searchPrdMstErpCd = StringUtil.getString(commandMap.get("searchPrdMstErpCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstErpCd", searchPrdMstErpCd);
        commandMap.put("searchVdrApvType", "Y");
        
        commandMap.put("excelDown", "Y");
        int totalCount = this.vendorApprovalService.selectBasicProductCount(commandMap);
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "vendorApprovalList_"+DateUtil.getToday();

        	 String [] rowTitle = { "카테고리","상품코드","상품명","입점업체","ERP상품등급", "판매가","검색가","배송비","진열여부","판매상태(I=판매중/T=품절상품/S=미판매/O=일부품절)","승인여부(D=대기/S=승인)","판매가능수량","쇼핑채널PC","쇼핑채널MOBILE"};      
             String [] cellSize = { "50","50","50","50","50","50","50","50","50","50","50","50","50","50"};
           	 String [] dataName = { "PRD_CTG_LVL_NM","PRD_MST_CD", "PRD_MST_NM","PRD_MST_VDR_NM","ERP_MST_GRB", "PRD_MST_PRC", "PRD_MST_SCH_PRC","PRD_MST_DLV_FEE","PRD_MST_DPL_STATE", "PRD_MST_SEL_STATE","PRD_MST_APV_STATE","PRD_MST_SEL_CNT", "PRD_MST_CNL_PC_YN","PRD_MST_CNL_MB_YN"};
             String [] dataType = { "String","String","String","String","String","Number","Number","Number","String","String","String","Number","String","String"};
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
           
        	list = this.vendorApprovalService.selectBasicProductList(commandMap);
        	
        	if(list != null){
                // 안내문구 목록 엑셀 다운로드
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }

}
