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
            // ????????? ?????? ??????
            list = this.myFitManagerService.selectMyFitManagerList(commandMap);
            infoList = this.myFitManagerService.selectMyFitInputList(commandMap);
            
        }
        
        List<Map<String,Object>> mainCategory = this.commonService.selectCode("PRODUCT_GUBUN");
        mv.addObject("mainCategory", mainCategory); //?????????
        
        mv.addObject("inputList", this.commonService.selectCode("MYFIT_INPUT_INFO"));//???????????? ?????????
        mv.addObject("allCategory", allCategory); //?????? ????????????
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        mv.addObject("infoList", infoList); //????????? ???????????? ?????????
        
        return mv;
    }
	
   @RequestMapping("/am/site/myFitManagerForm")
   public ModelAndView myFitManagerForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
   {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("useYn", "all");
        List<Map<String, Object>> list = null;
        list = JsonUtil.getJsonArrayFromList(this.categoryProductService.selectCategoryProductList(commandMap));
        
        
        mv.addObject("allCategory", list); //?????? ????????????
        
        List<Map<String,Object>> mainCategory = this.commonService.selectCode("PRODUCT_GUBUN");
        mv.addObject("mainCategory", mainCategory); //?????????

        /*
         * ?????? ????????? 
         * */
        mv.addObject("top", this.commonService.selectCode("PRODUCT_GUBUN_TOP"));
        mv.addObject("bottom", this.commonService.selectCode("PRODUCT_GUBUN_BOTTOM"));
        mv.addObject("onepiece", this.commonService.selectCode("PRODUCT_GUBUN_ONEPIECE"));
        mv.addObject("outer", this.commonService.selectCode("PRODUCT_GUBUN_OUTER"));
        mv.addObject("shoes", this.commonService.selectCode("PRODUCT_GUBUN_SHOES"));

        mv.addObject("inputList", this.commonService.selectCode("MYFIT_INPUT_INFO"));//???????????? ?????????
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
          // ????????? ?????? ??????
          result = this.myFitManagerService.insertMyFitManager((MultipartHttpServletRequest)request, commandMap);
      }
      
      // view Page Info
      if(result > 0)
      {
          mv.addObject("alertMsg", "?????? ???????????????.");
          mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/myFitManagerList.do");
      }
      else
      {
          mv.addObject("alertMsg", "????????? ?????????????????????.");
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
           
           // ??????????????? ????????????
           Map<String, Object> resultMap = this.myFitManagerService.selectMyFitInfo(commandMap);
           
           Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
           
           //????????? ???????????? IDX??? ?????? ????????? ????????? ??????
           commandMap.put("PRD_CTG_IDX", row.get("FIT_MST_CTG"));
           List<Map<String, Object>> selectedCategoryList = this.categoryProductService.selectUpperCategoryProductList(commandMap);
           mv.addObject("selectedCategoryList", selectedCategoryList);
           
           mv.addObject("row",resultMap.get("row")); // ?????? ??????
           mv.addObject("fileList", resultMap.get("fileList")); // ?????????, ???????????????
           mv.addObject("myFitCategoryList", resultMap.get("myFitCategoryList")); //????????? ???????????? ?????????
           mv.addObject("myFitInputList", resultMap.get("myFitInputList")); //????????? ?????????????????????
       }
       commandMap.put("useYn", "all");
       List<Map<String, Object>> list = null;
       
       list = JsonUtil.getJsonArrayFromList(this.categoryProductService.selectCategoryProductList(commandMap));
       
       mv.addObject("allCategory", list); //?????? ????????????
       
       List<Map<String,Object>> mainCategory = this.commonService.selectCode("PRODUCT_GUBUN");
       mv.addObject("mainCategory", mainCategory); //?????????
       /*
        * ?????? ????????? 
        * */
       mv.addObject("top", this.commonService.selectCode("PRODUCT_GUBUN_TOP"));
       mv.addObject("bottom", this.commonService.selectCode("PRODUCT_GUBUN_BOTTOM"));
       mv.addObject("onepiece", this.commonService.selectCode("PRODUCT_GUBUN_ONEPIECE"));
       mv.addObject("outer", this.commonService.selectCode("PRODUCT_GUBUN_OUTER"));
       mv.addObject("shoes", this.commonService.selectCode("PRODUCT_GUBUN_SHOES"));
       mv.addObject("inputList", this.commonService.selectCode("MYFIT_INPUT_INFO"));//???????????? ?????????
       mv.addObject("commandMap",commandMap);
       
       return mv;
   }
   
   /**
    * @api {POST} /am/site/myFitManagerModify.do
    * @apiName ????????? ?????? ??????
    * @apiGroup ???????????????
    * 
    * @apiParam {String} FIT_MST_IDX ??????????????? IDX
    * @apiParam {String} CATEGORY 3depth ???????????? IDX
    * @apiParam {String} FIT_MST_CTG2 ????????? ?????????
    * @apiParam {String[]} file_del_idx ????????? ???????????? ?????? IDX
    * @apiParam {File} thumbnailFile ????????? ????????? ?????????
    * @apiParam {File} guideFile ????????? ????????? ?????????
    * @apiParam {JSON} jsonData ????????????
    * 
    * @apiSuccess {String} alertMsg ?????? ??????/?????? ????????? 
    * @apiSuccess {Object} commandMap ???????????????
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
           // ????????? ?????? ????????? ??????
           int result = this.myFitManagerService.updateMyFit((MultipartHttpServletRequest)request, commandMap);
           
           // view Page Info
           if(result > 0)
           {
               mv.addObject("alertMsg", "?????? ???????????????.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/site/myFitManagerList.do");
           }
           else
           {
               mv.addObject("alertMsg", "????????? ?????????????????????.");
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
	
	       	 String [] rowTitle = { "?????????","?????????","????????????","?????????","????????????",};      
             String [] cellSize = { "50","50","50","50","50"};
          	 String [] dataName = { "MAIN_CTG","SUB_CTG", "FIT_MST_INFO","FIT_MST_REG_DT","FIT_MST_USE_YN"};
             String [] dataType = { "String","String","String","String","String"};
	       	//?????? ????????? ????????? excel ?????? csv ??????
	         if(totalCount > 30000){
	           	commandMap.put("csvDown", "Y"); //csv ???????????? ??????
	           	commandMap.put("dnFileName", fileName); //???????????? ?????? ??????
	           	commandMap.put("rowTitleArr", rowTitle); //????????????
	           	commandMap.put("dataNameArr", dataName); //?????????
	           	commandMap.put("responseForCsv", response); //response
	         }
	         list = this.myFitManagerService.selectMyFitManagerList(commandMap);
	       	if(list != null){
	               // ???????????? ?????? ?????? ????????????
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
