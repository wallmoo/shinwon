package com.market.mall.am.site.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.CategoryProductService;
import com.market.mall.am.site.service.MyFitManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.util.JsonUtil;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class MyFitManagerController {
    
    @Resource(name="myFitManagerService") private MyFitManagerService myFitManagerService;
    @Resource(name="commonService") private CommonService commonService;
    @Resource(name="categoryProductService") private CategoryProductService categoryProductService;
    
	@RequestMapping("/am/site/myFitManagerList")
    public ModelAndView myFitManagerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int totalCount = this.myFitManagerService.selectMyFitManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        commandMap.put("useYn", "all");
        
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> infoList = null;
        List<Map<String, Object>> allCategory = null;
        allCategory = JsonUtil.getJsonArrayFromList(this.categoryProductService.selectCategoryProductList(commandMap));
        if(totalCount > 0)
        {
            // 마이핏 관리 목록
            list = this.myFitManagerService.selectMyFitManagerList(commandMap);
            infoList = this.myFitManagerService.selectMyFitInputList(commandMap);
            
        }
        
        List<Map<String,Object>> mainCategory = this.commonService.selectCode("PRODUCT_GUBUN");
        mv.addObject("mainCategory", mainCategory); //대분류
        
        mv.addObject("inputList", this.commonService.selectCode("MYFIT_INPUT_INFO"));//입력정보 리스트
        mv.addObject("allCategory", allCategory); //전체 카테고리
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.addObject("infoList", infoList); //마이핏 입력정보 리스트
        
        return mv;
    }
	
   @RequestMapping("/am/site/myFitManagerForm")
   public ModelAndView myFitManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
   {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("useYn", "all");
        List<Map<String, Object>> list = null;
        list = JsonUtil.getJsonArrayFromList(this.categoryProductService.selectCategoryProductList(commandMap));
        
        
        mv.addObject("allCategory", list); //전체 카테고리
        
        List<Map<String,Object>> mainCategory = this.commonService.selectCode("PRODUCT_GUBUN");
        mv.addObject("mainCategory", mainCategory); //대분류

        /*
         * 항목 중분류 
         * */
        mv.addObject("top", this.commonService.selectCode("PRODUCT_GUBUN_TOP"));
        mv.addObject("bottom", this.commonService.selectCode("PRODUCT_GUBUN_BOTTOM"));
        mv.addObject("onepiece", this.commonService.selectCode("PRODUCT_GUBUN_ONEPIECE"));
        mv.addObject("outer", this.commonService.selectCode("PRODUCT_GUBUN_OUTER"));
        mv.addObject("shoes", this.commonService.selectCode("PRODUCT_GUBUN_SHOES"));

        mv.addObject("inputList", this.commonService.selectCode("MYFIT_INPUT_INFO"));//입력정보 리스트
        mv.addObject("commandMap", commandMap);
        
        return mv;
   }
   
   @RequestMapping("/am/site/myFitManagerRegist")
   public ModelAndView myFitManagerRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
   {
      ModelAndView mv = new ModelAndView();
      
      Admin admin = SessionsAdmin.getSessionAdmin(request);
      
      commandMap.put("FIT_MST_REG_IP", request.getRemoteAddr());
      commandMap.put("FIT_MST_REG_ID", admin.getADM_MST_ID());
      
      String jsonData = StringUtil.getString(commandMap.get("jsonData"));
      
      int result = 0;
      
      if(!jsonData.equals("") && jsonData != null){
          // 마이핏 관리 등록
          result = this.myFitManagerService.insertMyFitManager((MultipartHttpServletRequest)request, commandMap);
      }
      
      // view Page Info
      if(result > 0)
      {
          mv.addObject("alertMsg", "등록 되었습니다.");
          mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/myFitManagerList.do");
      }
      else
      {
          mv.addObject("alertMsg", "등록에 실패하였습니다.");
          mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/myFitManagerList.do");
      }
      mv.setViewName("/am/common/result");
      
      return mv;
   }
   
   @RequestMapping("/am/site/myFitManagerEdit")
   public ModelAndView myFitManagerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
   {
       ModelAndView mv = new ModelAndView();
       if(!"".equals(StringUtil.getString(commandMap.get("FIT_MST_IDX"), "")))
       {
           commandMap.put("CMN_COM_UP_IDX", Code.MYFIT_INPUT_INFO);
           
           // 마이핏관리 상세정보
           Map<String, Object> resultMap = this.myFitManagerService.selectMyFitInfo(commandMap);
           
           Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
           
           //등록한 카테고리 IDX로 상위 계층형 리스트 조회
           commandMap.put("PRD_CTG_IDX", row.get("FIT_MST_CTG"));
           List<Map<String, Object>> selectedCategoryList = this.categoryProductService.selectUpperCategoryProductList(commandMap);
           mv.addObject("selectedCategoryList", selectedCategoryList);
           
           mv.addObject("row",resultMap.get("row")); // 기본 정보
           mv.addObject("fileList", resultMap.get("fileList")); // 썸네일, 예시이미지
           mv.addObject("myFitCategoryList", resultMap.get("myFitCategoryList")); //마이핏 카테고리 리스트
           mv.addObject("myFitInputList", resultMap.get("myFitInputList")); //마이핏 입력정보리스트
       }
       commandMap.put("useYn", "all");
       List<Map<String, Object>> list = null;
       
       list = JsonUtil.getJsonArrayFromList(this.categoryProductService.selectCategoryProductList(commandMap));
       
       mv.addObject("allCategory", list); //전체 카테고리
       
       List<Map<String,Object>> mainCategory = this.commonService.selectCode("PRODUCT_GUBUN");
       mv.addObject("mainCategory", mainCategory); //대분류
       /*
        * 항목 중분류 
        * */
       mv.addObject("top", this.commonService.selectCode("PRODUCT_GUBUN_TOP"));
       mv.addObject("bottom", this.commonService.selectCode("PRODUCT_GUBUN_BOTTOM"));
       mv.addObject("onepiece", this.commonService.selectCode("PRODUCT_GUBUN_ONEPIECE"));
       mv.addObject("outer", this.commonService.selectCode("PRODUCT_GUBUN_OUTER"));
       mv.addObject("shoes", this.commonService.selectCode("PRODUCT_GUBUN_SHOES"));
       mv.addObject("inputList", this.commonService.selectCode("MYFIT_INPUT_INFO"));//입력정보 리스트
       mv.addObject("commandMap",commandMap);
       
       return mv;
   }
   
   /**
    * @api {POST} /am/site/myFitManagerModify.do
    * @apiName 마이핏 수정 처리
    * @apiGroup 시스템관리
    * 
    * @apiParam {String} FIT_MST_IDX 마이핏관리 IDX
    * @apiParam {String} CATEGORY 3depth 카테고리 IDX
    * @apiParam {String} FIT_MST_CTG2 중분류 코드값
    * @apiParam {String[]} file_del_idx 마이핏 첨부파일 삭제 IDX
    * @apiParam {File} thumbnailFile 마이핏 썸네일 이미지
    * @apiParam {File} guideFile 마이핏 썸네일 이미지
    * @apiParam {JSON} jsonData 입력정보
    * 
    * @apiSuccess {String} alertMsg 수정 성공/실패 메세지 
    * @apiSuccess {Object} commandMap 파라미터맵
    */
   @RequestMapping("/am/site/myFitManagerModify")
   public ModelAndView myFitManagerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
   {
       ModelAndView mv = new ModelAndView();
       
       Admin admin = SessionsAdmin.getSessionAdmin(request);
       
       commandMap.put("FIT_MST_UPD_IP", request.getRemoteAddr());
       commandMap.put("FIT_MST_UPD_ID", admin.getADM_MST_ID());
       
       if(!"".equals(StringUtil.getString(commandMap.get("FIT_MST_IDX"), "")))
       {
           // 관리자 관리 관리자 수정
           int result = this.myFitManagerService.updateMyFit((MultipartHttpServletRequest)request, commandMap);
           
           // view Page Info
           if(result > 0)
           {
               mv.addObject("alertMsg", "수정 되었습니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/myFitManagerList.do");
           }
           else
           {
               mv.addObject("alertMsg", "수정에 실패하였습니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/myFitManagerList.do");
           }
           mv.addObject("commandMap", commandMap);
           mv.setViewName("/am/common/result");
       }
       return mv;
   }
   
   @RequestMapping("/am/site/myFitManagerListExcelDownload")
   public ModelAndView myFitManagerListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
   {
	   ModelAndView mv = new ModelAndView();
       
       int totalCount = this.myFitManagerService.selectMyFitManagerListCount(commandMap);
       
       Paging paging = new Paging(totalCount, commandMap);
       mv.addObject("paging", paging );

       commandMap.put("startNum", paging.getStartNum());
       commandMap.put("endNum", paging.getEndNum());
       
   		String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
       commandMap.put("searchPrdMstCd", searchPrdMstCd);
       commandMap.put("excelDown", "Y");
       
       if(totalCount > 0){
	       	 List<Map<String, Object>> list = null;
	       	 
	       	 String fileName = "myFitList_"+DateUtil.getToday();
	
	       	 String [] rowTitle = { "대분류","중분류","입력정보","등록일","사용설정",};      
             String [] cellSize = { "50","50","50","50","50"};
          	 String [] dataName = { "MAIN_CTG","SUB_CTG", "FIT_MST_INFO","FIT_MST_REG_DT","FIT_MST_USE_YN"};
             String [] dataType = { "String","String","String","String","String"};
	       	//일정 건수가 넘으면 excel 대신 csv 처리
	         if(totalCount > 30000){
	           	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
	           	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
	           	commandMap.put("rowTitleArr", rowTitle); //필드제목
	           	commandMap.put("dataNameArr", dataName); //필드명
	           	commandMap.put("responseForCsv", response); //response
	         }
	         list = this.myFitManagerService.selectMyFitManagerList(commandMap);
	       	if(list != null){
	               // 안내문구 목록 엑셀 다운로드
	       		ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
	       	}
       }
        
       return null;
    }
   
   @RequestMapping(value="/am/site/myFitSubCategoryAjax")
   public JSON myFitSubCategoryAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
       JSON json = new JSON();

       List<Map<String, Object>> list = this.myFitManagerService.selectMyFitSubCategoryList(commandMap);

       json.put("categoryList", list);
       
       return json;
   }
   
   

}
