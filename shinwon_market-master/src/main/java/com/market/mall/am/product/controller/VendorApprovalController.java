package com.market.mall.am.product.controller;

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
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Paging;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : VendorApprovalController.java
 * @Date : 2015. 12. 2.
 * @프로그램 설명 : 입점업체 승인요청을 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class VendorApprovalController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="vendorApprovalService") private VendorApprovalService vendorApprovalService;
	@Resource(name="basicProductService") private BasicProductService basicProductService;
	@Resource(name="commonService") private CommonService commonService;
	
    /**
    * <pre>
    * 1. MethodName : vendorApprovalList
    * 2. ClassName : VendorApprovalController.java
    * 3. Comment : 입점업체 승인요청 리스트
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
     * @api {POST} /am/product/vendorApprovalList.do
     * @apiName 입점업체 승인요청 목록 화면
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
     * @apiSuccess {Object[]} list 입점업체 승인요청 리스트 [{RNUM=1, PRD_IMAGE=/pc/img/second/NoImage_250.jpg, PRD_MST_CD=S0011987, PRD_MST_PRC=99999(상품가격), PRD_MST_SEL_STATE_NM=판매중(판매상태), PRD_MST_REG_DT=2020-04-08, PRD_MST_SEL_CNT=판매가능수량, PRD_MST_DLV_FEE=배송비, PRD_MST_CNL_PC_YN=Y, PRD_MST_APV_STATE_NM=대기, DAUM_USE=YES, PRD_MST_SALE_RATE=할인율/할인액, DSP_PRD_CTG_IDX=3412, PRD_MST_DPL_STATE=Y(진열상태), PRD_MST_NM=상품테스트, PRD_MST_TYPE_NM=일반상품, NAVER_USE=YES, PRD_MST_APV_STATE=승인상태(D:대기,A:승인, C:보류,거절), PRD_MST_CNL_MB_YN=Y, PRD_MST_UNT_NM=정율(%)/정액, PRD_MST_SEL_STATE=판매상태(I:판매중,T:품절,S미판매), BND_MST_BRAND_NM=브랜드이름, PRD_MST_VDR_NM=입점업체이름}]
     */
    @RequestMapping(value="/am/product/vendorApprovalList")
    public ModelAndView vendorApprovalList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
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

        commandMap.put("searchPrdMstApvState", StringUtil.getString(commandMap.get("searchPrdMstApvState"),"D"));
        
        commandMap.put("searchPrdCtgEnv", "P");
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
    	//페이징
    	totalCount = this.vendorApprovalService.selectBasicProductCount(commandMap);
    	paging = new Paging(totalCount, commandMap); 
    	
    	if(totalCount>0)
    	{
    		list = this.vendorApprovalService.selectBasicProductList(commandMap);
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
     * 1. MethodName : basicProductDetail
     * 2. ClassName : BasicProductController.java
     * 3. Comment : 상품 상세 팝업
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 11. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping(value="/am/product/vendorApprovalDetailPopup")
     public ModelAndView vendorApprovalDetailPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
         ModelAndView mv = new ModelAndView();
         
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         
         //상품 상세 정보
         Map<String, Object> resultMap = this.vendorApprovalService.selectBasicProductView(commandMap);

         //RETURN OBJECT
         mv.addObject("productInfo", resultMap.get("productInfo"));
         mv.addObject("productGroupList", resultMap.get("productGroupList"));
         mv.addObject("categoryListP", resultMap.get("categoryListP")); 
         mv.addObject("categoryListM", resultMap.get("categoryListM"));
         mv.addObject("mustOptionList", resultMap.get("mustOptionList"));
         mv.addObject("addOptionList", resultMap.get("addOptionList"));
         mv.addObject("specListP", resultMap.get("specListP"));
         mv.addObject("imageList", resultMap.get("imageList"));
         mv.addObject("productNfiList", resultMap.get("productNfiList"));
         
         mv.addObject("commandMap", commandMap);
         
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : basicProductListModify
      * 2. ClassName : BasicProductController.java
      * 3. Comment : 상품리스트에서 상품 다중 수정
      * 4. 작성자 : DEV_KIMMINHO
      * 5. 작성일 : 2015. 11. 20.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @param PRD_MST_CDs
      * @return
      * @throws Exception
      */
      @RequestMapping(value="/am/product/vendorApprovalListModify")
      public ModelAndView vendorApprovalListModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
      		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception  
      {
          ModelAndView mv = new ModelAndView();
         
          Admin admin = SessionsAdmin.getSessionAdmin(request);
          int result = 0; 
          String alertMsg = "";
          
          //기본값 설정 - 등록자/수정자 ID, IP
          commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
          commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

          //상품 옵션 
          commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//상품코드
      		
          result = this.vendorApprovalService.updateBasicProductList(request, commandMap);
          if(result > 0)
          {
              alertMsg = "정상적으로 수정되었습니다.";
          } 
          else 
          {
              alertMsg = "처리 중 오류가 발생하였습니다.";
          }
          
          //RETURN OBJECT
          mv.addObject("alertMsg", alertMsg);
          mv.addObject("returnUrl", "/am/product/vendorApprovalList.do");
          mv.addObject("commandMap", commandMap);

      	//VIEW NAME
          mv.setViewName("am/common/result");

          return mv;
      }
      
      /**
    * <pre>
    * 1. MethodName : vendorApprovalDelete
    * 2. ClassName : VendorApprovalController.java
    * 3. Comment : 입점업체 승인요청 상품 삭제
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @param PRD_MST_CDs
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/vendorApprovalDelete")
      public ModelAndView vendorApprovalDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
      		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception  
      {
          ModelAndView mv = new ModelAndView();
         
          Admin admin = SessionsAdmin.getSessionAdmin(request);
          int result = 0; 
          String alertMsg = "";
          
          //기본값 설정 - 등록자/수정자 ID, IP
          commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
          commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

          //상품 옵션 
          commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//상품코드
      		
          result = this.basicProductService.deleteBasicProductList(request, commandMap);
          if(result > 0)
          {
              alertMsg = "정상적으로 삭제되었습니다.";
          } 
          else 
          {
              alertMsg = "처리 중 오류가 발생하였습니다.";
          }
          
          //RETURN OBJECT
          mv.addObject("alertMsg", alertMsg);
          mv.addObject("returnUrl", "/am/product/vendorApprovalList.do");
          mv.addObject("commandMap", commandMap);

      	  //VIEW NAME
          mv.setViewName("am/common/result");

          return mv;
      }
    
    /**
    * <pre>
    * 1. MethodName : vendorApprovalProductApvModify
    * 2. ClassName : VendorApprovalController.java
    * 3. Comment : 입점업체 상품 승인 처리
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @param PRD_MST_CDs
    * @return
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/vendorApprovalProductApvModify.do
     * @apiName 입점업체 상품 목록 다건 승인 처리
     * @apiGroup SB상품관리
     * 
     * @apiParam {String[]} PRD_MST_CDs 상품코드 [S0123456 , S000000]
     * 
     * @apiSuccess {String} alertMsg 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/vendorApprovalProductApvModify")
    public ModelAndView vendorApprovalProductApvModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //상품 옵션 
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//상품코드
    		
        result = this.basicProductService.updateBasicProductApv(request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 처리 되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/vendorApprovalList.do");
        mv.addObject("commandMap", commandMap);

    	  //VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : vendorApprovalListExcelDownload
    * 2. ClassName : VendorApprovalController.java
    * 3. Comment : 입점업체 승인요청 엑셀 다운로드
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
    @RequestMapping("/am/product/vendorApprovalListExcelDownload")
    public ModelAndView vendorApprovalListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        String searchPrdMstErpCd = StringUtil.getString(commandMap.get("searchPrdMstErpCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstErpCd", searchPrdMstErpCd);
        
        commandMap.put("excelDown", "Y");
        int totalCount = this.vendorApprovalService.selectBasicProductCount(commandMap);
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "vendorApprovalList_"+DateUtil.getToday();

        	 String [] rowTitle = { "카테고리","상품코드","상품명","입점업체","ERP상품등급", "판매가","검색가","배송비","진열여부","판매상태(I=판매중/T=품절상품/S=미판매/O=일부품절)","승인여부(D=대기/S=승인/C=보류)","판매가능수량","쇼핑채널PC","쇼핑채널MOBILE"};      
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
    
    /**
     * @api {POST} /am/product/vendorApprovalProductHoldPopup.do
     * @apiName 입점업체 상품 보류 등록 팝업
     * @apiGroup SB상품관리
     * 
     * @apiParam {Object} commandMap 파라미터맵
     * 
     * @apiSuccess {Object} commandMap 파라미터맵
     * @apiSuccess {Object[]} vendorHoldOffList 보류사유 리스트
     */
    @RequestMapping(value="/am/product/vendorApprovalProductHoldPopup")
    public ModelAndView vendorApprovalProductHoldPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("vendorHoldOffList", this.commonService.selectCode("VENDOR_APPROVAL_HOLD_OFF")); // 보류사유 리스트
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * @api {POST} /am/product/vendorApprovalProductHoldModify.do
     * @apiName 입점업체 상품 목록 다건 보류 처리
     * @apiGroup SB상품관리
     * 
     * @apiParam {JSON} productCodeList 상품코드 [{"PRD_MST_CD":"S0123456"},{"PRD_MST_CD":"S000000"}]
     * @apiParam {String} VDR_HLD_APV_STATE 승인여부(Y:승인,N:보류)
     * @apiParam {String} VDR_HLD_PRC_YN 판매가 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_NM_YN 상품명 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_CTG_YN 카테고리 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_CNT_YN 영상/이미지 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_NFI_YN 고시정보 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_ETC_YN 기타 체크여부(Y/N)
     * @apiParam {String} VDR_HLD_DESC 상세 사유 내용
     * 
     * @apiSuccess {String} alertMsg 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
     @RequestMapping(value="/am/product/vendorApprovalProductHoldModify")
     public ModelAndView vendorApprovalProductHoldModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {
         ModelAndView mv = new ModelAndView();
        
         Admin admin = SessionsAdmin.getSessionAdmin(request);
         int result = 0; 
         String alertMsg = "";
         
         //기본값 설정 - 등록자 ID, IP
         commandMap.put("VDR_HLD_REG_IP", request.getRemoteAddr());
         commandMap.put("VDR_HLD_REG_ID", admin.getADM_MST_ID());
         
         //기본값 설정 - 수정자 ID, IP
         commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
         commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());
         
         result = this.vendorApprovalService.insertBasicProductHold(request, commandMap);
         
         if(result > 0)
         {
             alertMsg = "정상적으로 처리 되었습니다.";
         } 
         else 
         {
             alertMsg = "처리 중 오류가 발생하였습니다.";
         }
         
         //RETURN OBJECT
         mv.addObject("alertMsg", alertMsg);
         mv.addObject("returnUrl", "/am/product/vendorApprovalList.do");
         mv.addObject("commandMap", commandMap);

           //VIEW NAME
         mv.setViewName("am/common/result");

         return mv;
     }
     
}
