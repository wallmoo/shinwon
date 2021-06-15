package com.market.mall.am.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.CsvUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.ProductUploadService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.pc.product.service.ProductService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : ProductUplaodController.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품일괄업로드를 처리하는 Controller Class
 * @author 조광희
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.guest)
public class ProductUploadController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="fileUpload") private FileUpload fileUpload;
    @Resource(name="productUploadService") private ProductUploadService productUploadService;
    @Resource(name="commonService") private CommonService commonService;
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    @Resource(name="productService") private ProductService productService;
        
    /**
     * <pre>
     * 1. MethodName : productUploadList
     * 2. ClassName  : ProductUploadController.java
     * 3. Comment    : 관리자 > 상품관리 > 상품+이미지일괄업로드
     * 4. 작성자       : Dhseo
     * 5. 작성일       : 2020. 05. 29.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/product/productUploadList")
    public ModelAndView productUploadList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
   	
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String adminId = StringUtil.getString(admin.getADM_MST_ID(),"");
        /*
        if(adminId==null || adminId.isEmpty()){
        	mv.addObject("alertMsg", "권한이 없습니다");
	    	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadList.do");
	    	return mv;
        }
        */
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<CommonsMultipartFile> fileList = (List) multipartRequest.getFiles("file");
   	 
        if(fileList.size()<=0) {
       	mv.addObject("alertMsg", "파을을 읽을 수 없습니다. 재업로드 바랍니다.");
	    	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadList.do");
	    	return mv;
        }
        
        if("scm".equals(commandMap.get("UPLOAD_TYPE"))) {
       	 //타사
        	mv.addObject("alertMsg", "타사 상품 일괄등록 기능은 준비 중 입니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/basicProductList.do");
        }
        else {
        	try {
        		productService.insertProductByFile(fileList.get(0));
        		mv.addObject("alertMsg", "입력 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/basicProductList.do");
        	}catch (Exception e) {
        		e.printStackTrace();
        		mv.addObject("alertMsg", "입력 중 오류가 발생되었습니다.");	
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/basicProductList.do");
			}
        	
        }
        
        mv.setViewName("/am/common/result");
        return mv;
    }
    
   
     
    
     
     
     /**
      * <pre>
      * 1. MethodName : productUploadRegist
      * 2. ClassName  : ProductUploadController.java
      * 3. Comment    : 관리자 > 상품관리 > 상품+이미지일괄업로드 저장
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 07.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/product/productUploadRegist")
      public ModelAndView productUploadRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
     	
    	  ModelAndView mv = new ModelAndView();
          List<Map<String, Object>> list = new  ArrayList<Map<String, Object>>();
          
          String pathType = StringUtil.getString(commandMap.get("pathType"),"default");
 	      String Allow = StringUtil.getString(commandMap.get("Allow"),"image");
 	      String dateFolderFlag = StringUtil.getString(commandMap.get("dateFolderFlag"),"");
 	     
          commandMap.put("makeThumbnail", "Y");
 	
 	      
 	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 	      CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");
 	      CommonsMultipartFile file2 = (CommonsMultipartFile) multipartRequest.getFile("file2");
 	      
 	      
 	      String fName = file.getOriginalFilename();
 	    	      
 	      String [] columName = {"PRD_EXC_SEQ", "PRD_EXC_NM", "PRD_EXC_NM_SUB", "PRD_EXC_DLV_FEE","PRD_EXC_SEL_CNT","PRD_EXC_PRC","PRD_EXC_CNL","PRD_EXC_SEL_STATE","PRD_EXC_DPL_STATE","PRD_EXC_CTG_PC","PRD_EXC_CTG_MB",
 	    		  			"PRD_EXC_MD_ID","PRD_EXC_COST","PRD_EXC_IMG","PRD_EXC_NFI_IDX","PRD_EXC_NFI_INF1","PRD_EXC_NFI_INF2","PRD_EXC_NFI_INF3","PRD_EXC_NFI_INF4","PRD_EXC_NFI_INF5","PRD_EXC_NFI_INF6"
 	    		  			,"PRD_EXC_NFI_INF7","PRD_EXC_NFI_INF8","PRD_EXC_NFI_INF9","PRD_EXC_NFI_INF10","PRD_EXC_NFI_INF11","PRD_EXC_NFI_INF12","PRD_EXC_NFI_INF13","PRD_EXC_NFI_INF14"};
 	      
 	      List<Map<String, Object>> productList = ExcelUtil.excelRead(file, columName);
 	      
 	      int result = 0;
 	      int PRD_EXC_FILE_IDX = 0;
 	      int errorCount = 0;
 	      int listCnt = productList.size();
 	      
 	      for(int i=0;i<listCnt;i++)
    	  {
 	    	 Map<String, Object> productData = productList.get(i);
 	    	 
 	    	 String PRD_EXC_SEQ = StringUtil.getString(productData.get("PRD_EXC_SEQ"),"");
	 	     String PRD_EXC_NM = StringUtil.getString(productData.get("PRD_EXC_NM"),"");
			 String PRD_EXC_NM_SUB = StringUtil.getString(productData.get("PRD_EXC_NM_SUB"),"");
			 String PRD_EXC_DLV_FEE = StringUtil.getString(productData.get("PRD_EXC_DLV_FEE"),"");
			 String PRD_EXC_SEL_CNT = StringUtil.getString(productData.get("PRD_EXC_SEL_CNT"),"");
			 String PRD_EXC_PRC = StringUtil.getString(productData.get("PRD_EXC_PRC"),"");
			 String PRD_EXC_CNL = StringUtil.getString(productData.get("PRD_EXC_CNL"),"");
			 String PRD_EXC_SEL_STATE = StringUtil.getString(productData.get("PRD_EXC_SEL_STATE"),"");
			 String PRD_EXC_DPL_STATE = StringUtil.getString(productData.get("PRD_EXC_DPL_STATE"),"");
			 String PRD_EXC_CTG_PC = StringUtil.getString(productData.get("PRD_EXC_CTG_PC"),"");
			 String PRD_EXC_CTG_MB = StringUtil.getString(productData.get("PRD_EXC_CTG_MB"),"");
			 String PRD_EXC_MD_ID = StringUtil.getString(productData.get("PRD_EXC_MD_ID"),"");
			 String PRD_EXC_COST = StringUtil.getString(productData.get("PRD_EXC_COST"),"");
			 String PRD_EXC_IMG = StringUtil.getString(productData.get("PRD_EXC_IMG"),"");
			 String PRD_EXC_NFI_IDX = StringUtil.getString(productData.get("PRD_EXC_NFI_IDX"),"");
			 String PRD_EXC_NFI_INF1 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF1"),"");
			 String PRD_EXC_NFI_INF2 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF2"),"");
			 String PRD_EXC_NFI_INF3 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF3"),"");
			 String PRD_EXC_NFI_INF4 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF4"),"");
			 String PRD_EXC_NFI_INF5 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF5"),"");
			 String PRD_EXC_NFI_INF6 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF6"),"");
			 String PRD_EXC_NFI_INF7 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF7"),"");
			 String PRD_EXC_NFI_INF8 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF8"),"");
			 String PRD_EXC_NFI_INF9 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF9"),"");
			 String PRD_EXC_NFI_INF10 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF10"),"");
			 String PRD_EXC_NFI_INF11 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF11"),"");
			 String PRD_EXC_NFI_INF12 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF12"),"");
			 String PRD_EXC_NFI_INF13 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF13"),"");
			 String PRD_EXC_NFI_INF14 = StringUtil.getString(productData.get("PRD_EXC_NFI_INF14"),"");
			  
			 if(!isStringDouble(PRD_EXC_SEQ))errorCount++;
			 byte[] temp = PRD_EXC_NM.getBytes();
			 if(temp.length>300)errorCount++;
			 temp = PRD_EXC_NM_SUB.getBytes();
			 if(temp.length>300)errorCount++;
			 if(!isStringDouble(PRD_EXC_DLV_FEE))errorCount++;
			 if(!isStringDouble(PRD_EXC_SEL_CNT))errorCount++;
			 if(!isStringDouble(PRD_EXC_PRC))errorCount++;
			 temp = PRD_EXC_CNL.getBytes();
			 if(temp.length>1)errorCount++;
			 temp = PRD_EXC_SEL_STATE.getBytes();
			 if(temp.length>1)errorCount++;
			 temp = PRD_EXC_DPL_STATE.getBytes();
			 if(temp.length>1)errorCount++;
			 if(!isStringDouble(PRD_EXC_CTG_PC))errorCount++;
			 if(!isStringDouble(PRD_EXC_CTG_MB))errorCount++;
			 temp = PRD_EXC_MD_ID.getBytes();
			 if(temp.length>20)errorCount++;
			 if(!isStringDouble(PRD_EXC_COST))errorCount++;
			 temp = PRD_EXC_IMG.getBytes();
			 if(temp.length>100)errorCount++;
			 if(!isStringDouble(PRD_EXC_NFI_IDX))errorCount++;
			 temp = PRD_EXC_NFI_INF1.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF2.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF3.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF4.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF5.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF6.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF7.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF8.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF9.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF10.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF11.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF12.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF13.getBytes();
			 if(temp.length>200)errorCount++;
			 temp = PRD_EXC_NFI_INF14.getBytes();
			 if(temp.length>200)errorCount++;
    	  }
 	      
 	      System.out.println("################errorCount : "+errorCount);
 	    
 	      if(errorCount == 0)
 	      {
 	        if(productList !=null&&productList.size() > 0)
	 	      {
	 	    	 result = productUploadService.productUploadRegist((MultipartHttpServletRequest) request, productList, fName);
	 	      }
	 	      
	 	     if(result > 0)
	 	     {
	 	    	  PRD_EXC_FILE_IDX = result;
	 	    	  result = productUploadService.productUploadRegistProc(result);
	 	    	  
	 	 	      if (file2!=null){
	 	 	    	  
	 	 	    	  
	 	 	    	  
	 	 	    	  commandMap = productUploadService.productImageUpload(commandMap, file2, "zip", "zip", dateFolderFlag, PRD_EXC_FILE_IDX);
	 	 	      }
	 	    	  
	 	     }
 	      }

// 	      list = (List<Map<String, Object>>)commandMap.get("imgList");
// 	      mv.addObject("list", list);
         
 	     if(errorCount ==0)
 	     {
 	    	 mv.addObject("alertMsg", "등록 되었습니다.");
 	    	 
 	    	 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadList.do?PRD_EXC_FILE_IDX="+PRD_EXC_FILE_IDX);
 	    	 
 	     }else
 	     {
 	    	mv.addObject("alertMsg", "엑셀자료에 오류가 있습니다. 확인 후 재업로드 바랍니다.");
	    	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadList.do");
 	     }
          
          mv.setViewName("/am/common/result");
          
          return mv;
      }
      
      public static boolean isStringDouble(String s) {
     	 try {
     		 Double.parseDouble(s);
     		 return true;
     	 } catch (NumberFormatException e) {
     	    return false;
     	 }
      }
     
     /**
      * <pre>
      * 1. MethodName : productUploadImgList
      * 2. ClassName  : ProductUploadController.java
      * 3. Comment    : 관리자 > 상품관리 > 이미지일괄업로드
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 10. 15.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/product/productUploadImgList")
      public ModelAndView productUploadImgList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
     	
          ModelAndView mv = new ModelAndView();
          List<Map<String, Object>> list = new  ArrayList<Map<String, Object>>();
          
          //System.out.println("commandMap.get(listGb); : "+commandMap.get("listGb"));
          
          String listGb = (String)commandMap.get("listGb");;
          if(listGb==null)listGb=" ";
          
          if("select".equals(listGb))
          {
 	         
 	         String pathType = StringUtil.getString(commandMap.get("pathType"),"default");
 	         String Allow = StringUtil.getString(commandMap.get("Allow"),"image");
 	         String dateFolderFlag = StringUtil.getString(commandMap.get("dateFolderFlag"),"");
 	         commandMap.put("makeThumbnail", "Y");
 	
 	         MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 	         CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");
 	         
 	         if (file!=null){
 	             commandMap = productUploadService.productImageExecuteZip(commandMap, file, "zip", "zip", dateFolderFlag);
 	         }
 	         list = (List<Map<String, Object>>)commandMap.get("imgList");
 	         
          }
         
          mv.addObject("list", list);
         
          return mv;
      }
    
}
