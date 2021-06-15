package com.market.mall.am.marketing.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.KingerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : KingerController.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 이벤트 관리를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class KingerController {

    
    @Resource(name="kingerService")
    private KingerService kingerService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    @Resource
	protected Mail mail;
	
    
    /**
    * <pre>
    * 1. MethodName : kingerList
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commadnMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerList")
    public ModelAndView kingerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //commandMap.put("searchExpMstStDt", StringUtil.getString(commandMap.get("searchExpMstStDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        //commandMap.put("searchExpMstEdDt", StringUtil.getString(commandMap.get("searchExpMstEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        // 이벤트 목록 갯수
        int totalCount = this.kingerService.selectKingerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            list = this.kingerService.selectKingerList(commandMap);
        }
        
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : kingerForm
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerForm")
    public ModelAndView kingerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 상단노출 갯수
        int topDspCount = this.kingerService.selectKingerTopDspCount(commandMap);
        mv.addObject("topDspCount", topDspCount);
        
        // 이벤트 형태 리스트
        mv.addObject("kingerMemList", this.commonService.selectCode("COMMON_MEMBER_TYPE"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : kingerEdit
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerEdit")
    public ModelAndView kingerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
        {

            // 상단노출 갯수
            int topDspCount = this.kingerService.selectKingerTopDspCount(commandMap);
            mv.addObject("topDspCount", topDspCount);

            Map<String, Object> resultMap = this.kingerService.selectKingerInfo(commandMap);
            //Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            
            mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("row", resultMap.get("row"));
            //mv.addObject("detailList", this.kingerService.selectKingerDetailList(commandMap)); 경품은 제외..
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : kingerRegist
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 21.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerRegist")
    public ModelAndView kingerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = this.kingerService.insertKinger((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : kingerModify
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * 6. 수정일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerModify")
    public ModelAndView kingerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
        {
            result = this.kingerService.updateKinger((MultipartHttpServletRequest)request, commandMap);
        }
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerList.do");
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }

    /**
    * <pre>
    * 1. MethodName : kingerListModify
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 프로모션 관리 > 리뷰어모집 수정 
    * 4. 작성자       : hjkim
    * 5. 작성일       : 2020. 06. 08
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerListModify")
    public ModelAndView kingerListModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //기본값 설정 - 수정자 ID, IP
        commandMap.put("TIM_SAL_UPD_IP", request.getRemoteAddr());
        commandMap.put("TIM_SAL_UPD_ID", admin.getADM_MST_ID());

        

        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String expMstData = StringUtil.getString(commandMap.get("selectedExpMstList"),"");
        List<Map<String, Object>> selectedExpMstList = mapper.readValue(expMstData, typeRef);
        
        commandMap.put("selectedExpMstList", selectedExpMstList);


        if(selectedExpMstList != null && selectedExpMstList.size() > 0)
        {
        	if("admin".equals(admin.getADM_MST_ID()))
        	{
                // 관리자 수정
                this.kingerService.updateKingerList(commandMap);
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerList.do");
        	}
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : kingerEntryList
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 응모자 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 22.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerEntryList")
    public ModelAndView kingerEntryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
    	ModelAndView mv = new ModelAndView();
        
    	if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
        {
            // 이벤트 응모자 / 당첨자 목록 갯수
            int totalCount = this.kingerService.selectKingerEntryListCount(commandMap);
            
            String cPageBasic = StringUtil.getString(commandMap.get("cPage"), StringUtil.getString(commandMap.get("cPageBasic"), "1"));
            String pageSizeBasic = StringUtil.getString(commandMap.get("pageSize"), StringUtil.getString(commandMap.get("pageSizeBasic"), "20")); 
            commandMap.put("cPageBasic", cPageBasic);
            commandMap.put("pageSizeBasic", pageSizeBasic);
            commandMap.put("cPage", StringUtil.getString(commandMap.get("cPageEntry"), "1"));
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSizeEntry"), "20"));
            
            Paging paging = new Paging(totalCount, commandMap);
            mv.addObject( "paging", paging );

            commandMap.put("startNum", paging.getStartNum());
            commandMap.put("endNum", paging.getEndNum());
            
            Map<String, Object> resultMap = this.kingerService.selectKingerEntryList(commandMap);
            
            //이벤트 응모자 / 당첨자 > 참고 URL 목록
            List<Map<String, Object>> urlList = this.kingerService.selectKingerEntryUrlList(commandMap);
            mv.addObject("urlList", urlList);
            
            // 이벤트 응모자 / 당첨자 목록
            mv.addObject("list", resultMap.get("list"));
            mv.addObject("info", resultMap.get("info"));
              
            mv.addObject("totalCount", totalCount);
            mv.addObject("commandMap", commandMap);
            
        }
        
        return mv;
    }
   
    
     
    
    /**
     * <pre>
     * 1. MethodName : kingerWinList
     * 2. ClassName  : KingerController.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/kingerWinList")
     public ModelAndView kingerWinList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
         {
        	 int totalCount = this.kingerService.selectKingerWinListCount(commandMap);
             
             String cPageBasic = StringUtil.getString(commandMap.get("cPage"), StringUtil.getString(commandMap.get("cPageBasic"), "1"));
             String pageSizeBasic = StringUtil.getString(commandMap.get("pageSize"), StringUtil.getString(commandMap.get("pageSizeBasic"), "20")); 
             
             commandMap.put("cPageBasic", cPageBasic);
             commandMap.put("pageSizeBasic", pageSizeBasic);
             commandMap.put("cPage", StringUtil.getString(commandMap.get("cPageEntry"), "1"));
             commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSizeEntry"), "20"));
             
             Paging paging = new Paging(totalCount, commandMap);
             mv.addObject( "paging", paging );

             commandMap.put("startNum", paging.getStartNum());
             commandMap.put("endNum", paging.getEndNum());
             
             Map<String, Object> resultMap = new HashMap<String, Object>();
            	 
            	 
             resultMap = this.kingerService.selectKingerWinList(commandMap);
            	 
             // 이벤트 응모자 / 당첨자 목록
             mv.addObject("list", resultMap.get("list"));
             // 기본 정보
             mv.addObject("basicRow", resultMap.get("basicRow"));
             
             Map<String, Object> resultMap2 = this.kingerService.selectKingerInfo(commandMap);
             
      		 mv.addObject("info", resultMap2.get("row"));
             
             mv.addObject("totalCount", totalCount);
             mv.addObject("commandMap", commandMap);
         }
         
         return mv;
     }
     /**
      * <pre>
      * 1. MethodName : kingerWinForm
      * 2. ClassName  : KingerController.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 당첨자발표 등록 폼 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 17.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/kingerWinForm")
      public ModelAndView kingerWinForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
          ModelAndView mv = new ModelAndView();
          
          if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
          {
              Map<String, Object> resultMap = this.kingerService.selectKingerInfo(commandMap);

              Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
              
              mv.addObject("row", resultMap.get("row"));
              //mv.addObject("detailList", this.kingerService.selectKingerDetailList(commandMap)); 경품은 제외..
          }
          
          mv.addObject("commandMap", commandMap);
          
          return mv;
      }
      
      /**
       * <pre>
       * 1. MethodName : kingerWinEdit
       * 2. ClassName  : KingerController.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자발표 수정 폼 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 23
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/kingerWinEdit")
       public ModelAndView kingerWinEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
       {
           ModelAndView mv = new ModelAndView();
           
           if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
           {
        	   Map<String, Object> resultMap2 = this.kingerService.selectKingerWinInfo(commandMap);
        	   mv.addObject("fileList", resultMap2.get("fileList"));
               mv.addObject("rowWin", resultMap2.get("rowWin"));
               
           }
           Map<String, Object> resultMap = this.kingerService.selectKingerInfo(commandMap);
           
           mv.addObject("row", resultMap.get("row"));
           mv.addObject("commandMap", commandMap);
           
           return mv;
       }
      
      /**
       * <pre>
       * 1. MethodName : kingerWinRegist
       * 2. ClassName  : KingerController.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자발표 등록 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 22.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/kingerWinRegist")
       public ModelAndView kingerWinRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
       {
           ModelAndView mv = new ModelAndView();
           
           String [] columName = new String[]{"KINGER_ID", "MEM_NM" };
       	
       	   MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
           CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
           
           if(file != null)
           {
	           List<Map<String, Object>> kingerEntryWinnerList = ExcelUtil.excelRead(file, columName);
	           //System.out.println("kingerEntryWinnerList.size() : "+kingerEntryWinnerList.size());
	           if(kingerEntryWinnerList != null)
	           {
		           if(kingerEntryWinnerList.size() > 0)
		           {
		        	   commandMap.put("kingerEntryWinnerList", kingerEntryWinnerList);
		               this.kingerService.updateKingerEntryWinner(request, commandMap);
		               
		           }
	           }
           }
           
           int result = this.kingerService.insertKingerWin((MultipartHttpServletRequest)request, commandMap);
           
           // view Page Info
           if(result > 0)
           {
               mv.addObject("alertMsg", "등록 되었습니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerWinList.do");
               
           }
           else
           {
               mv.addObject("alertMsg", "등록에 실패하였습니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerWinList.do");
           }
           mv.addObject("commandMap", commandMap);
           mv.setViewName("/am/common/result");
           return mv;
      }
       /**
        * <pre>
        * 1. MethodName : kingerWinModify
        * 2. ClassName  : KingerController.java
        * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단  당첨자발표 수정 
        * 4. 작성자       : khcho
        * 5. 작성일       : 2015. 12. 23.
        * </pre>
        *
        * @param request
        * @param commandMap
        * @return
        * @throws Exception
        */
        @RequestMapping("/am/marketing/kingerWinModify")
        public ModelAndView kingerEntryWinnerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
        {
            ModelAndView mv = new ModelAndView();
           
            String [] columName = new String[]{"KINGER_ID", "MEM_NM" };
           	
        	MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
            
            if(file != null)
            {
 	           List<Map<String, Object>> kingerEntryWinnerList = ExcelUtil.excelRead(file, columName);
 	           //System.out.println("kingerEntryWinnerList.size() : "+kingerEntryWinnerList.size());
 	           if(kingerEntryWinnerList != null)
 	           {
 		           if(kingerEntryWinnerList.size() > 0)
 		           {
 		        	   commandMap.put("kingerEntryWinnerList", kingerEntryWinnerList);
 		               this.kingerService.updateKingerEntryWinner(request, commandMap);
 		               
 		           }
 	           }
            }
         
            
            int result = this.kingerService.updateKingerWinMst((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
            	
                mv.addObject("alertMsg", "저장 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerWinList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "저장에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerWinList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
            return mv;
       }
        
        /**
         * <pre>
         * 1. MethodName : kingerWinRegist
         * 2. ClassName  : KingerController.java
         * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자발표 등록 
         * 4. 작성자       : khcho
         * 5. 작성일       : 2015. 12. 22.
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
         @RequestMapping("/am/marketing/kingerWinMailSend")
         public ModelAndView kingerWinMailSend(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
         {
             ModelAndView mv = new ModelAndView();
             
             commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
             List<Map<String, Object>> kingerWinnerMailList = this.kingerService.selectKingerMailInfo(commandMap);
             
             for(int i=0;i < kingerWinnerMailList.size();i++)
             {
            	 Map<String, Object> mailMap = kingerWinnerMailList.get(i);
            	 
              	 String MEM_MST_MAIL = StringUtil.getString(mailMap.get("MEM_MST_MAIL"),"");
              	
                	
               	 if(!"".equals(MEM_MST_MAIL))
 	             {
              		//기본정보
 	            	String MAIL_CODE = "27";
 	            	String MEMBER_NAME = StringUtil.getString(mailMap.get("MEM_MST_MEM_NM"),"");
 	             	String EMAIL_TITLE = StringUtil.getString(propertiesService.getString("app.name"),"")+MEMBER_NAME+"님,  고객체험단 KINGER 당첨을 축하드립니다.";
 	            	String GB = "$T$";
 	            	String EMAIL_CONTENTS1 = "";
 	            	//메일내용
 	            	
 	            	String EXP_MST_CD = StringUtil.getString(mailMap.get("EXP_MST_CD"),"");
 	            	String EXP_MST_NM = StringUtil.getString(mailMap.get("EXP_MST_NM"),"");
 	            	String PRD_MST_ERP_CD = StringUtil.getString(mailMap.get("PRD_MST_ERP_CD"),"");
 	            	String URL = StringUtil.getString(request.getAttribute("serverDomain"), "")+"/pc/marketing/kingerView.do?EXP_MST_CD="+EXP_MST_CD;
 	            	String PRD_IMG_URL = StringUtil.getString(request.getAttribute("cdnDomain"), "")+StringUtil.getString(mailMap.get("EXP_PRD_IMG"),"");
 	            	String PDF_URL = StringUtil.getString(request.getAttribute("serverDomain"), "")+"/nas/upload"+StringUtil.getString(mailMap.get("EXP_DOWNLOAD"),"");
 	            	String EXP_MST_BNF = StringUtil.getString(mailMap.get("EXP_MST_BNF"),"-");
 	            	String EXP_MST_ATV_ST_DT = StringUtil.getString(mailMap.get("EXP_MST_ATV_ST_DT"),"");
 	            	String EXP_MST_ATV_ED_DT = StringUtil.getString(mailMap.get("EXP_MST_ATV_ED_DT"),"-");
 	            	
 	            	String PDF_BUTTON = PDF_URL;
 	            	String TITLE = "NO."+EXP_MST_CD+" "+EXP_MST_NM+" "+PRD_MST_ERP_CD;
 	            	String EXP_MST_ATV = EXP_MST_ATV_ST_DT+"~"+EXP_MST_ATV_ED_DT;
 	            	String CROWN = "1000";
 	            	
 	             	EMAIL_CONTENTS1 = MEMBER_NAME+GB+TITLE+GB+PRD_IMG_URL+GB+PRD_IMG_URL+GB+PDF_BUTTON+GB+CROWN+GB+EXP_MST_ATV+GB+EXP_MST_BNF+GB+URL;
 	             		
 	             	mailMap.put("MAIL_CODE",MAIL_CODE);
 	             	mailMap.put("MEMBER_EMAIL",MEM_MST_MAIL);
 	             	mailMap.put("MEMBER_NAME",MEMBER_NAME);
 	             	mailMap.put("EMAIL_TITLE",EMAIL_TITLE);
 	             	mailMap.put("EMAIL_CONTENTS1",EMAIL_CONTENTS1);
 	             		
 	             	//System.out.println("cont : "+EMAIL_CONTENTS1);
 	             	
 	             	Map<String, Object> mailResult = this.mail.mailSendForm(mailMap);
 	             	
 	             	String resultMsg = StringUtil.getString(mailResult.get("mailResult"),"");
 	             	String resultCode = StringUtil.getString(mailResult.get("resultCode"),"");
            	 
                }
             
             }
             mv.addObject("alertMsg", "발송 되었습니다.");
             mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerWinEdit.do");
             mv.addObject("commandMap", commandMap);
             mv.setViewName("/am/common/result");
             return mv;
        }
        
         /**
          * <pre>
          * 1. MethodName : kingerWinRegist
          * 2. ClassName  : KingerController.java
          * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 당첨자발표 등록 
          * 4. 작성자       : khcho
          * 5. 작성일       : 2015. 12. 22.
          * </pre>
          *
          * @param request
          * @param commandMap
          * @return
          * @throws Exception
          */
          @RequestMapping("/am/marketing/kingerReviewMailSend")
          public ModelAndView kingerReviewMailSend(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
          {
              ModelAndView mv = new ModelAndView();
              
              commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
              List<Map<String, Object>> kingerWinnerMailList = this.kingerService.selectKingerReviewMailInfo(commandMap);
              
              for(int i=0;i < kingerWinnerMailList.size();i++)
              {
             	 Map<String, Object> mailMap = kingerWinnerMailList.get(i);
             	 
               	 String MEM_MST_MAIL = StringUtil.getString(mailMap.get("MEM_MST_MAIL"),"");
               	 	
                 if(!"".equals(MEM_MST_MAIL))
  	             {
               		//기본정보
  	            	String MAIL_CODE = "28";
  	            	String MEMBER_NAME = StringUtil.getString(mailMap.get("MEM_MST_MEM_NM"),"");
  	             	String EMAIL_TITLE = StringUtil.getString(propertiesService.getString("app.name")+" ","")+MEMBER_NAME+"님,  KINGER 미션을 수행해주세요.";
  	            	String GB = "$T$";
  	            	String EMAIL_CONTENTS1 = "";
  	            	//메일내용
  	            	
  	            	String EXP_MST_CD = StringUtil.getString(mailMap.get("EXP_MST_CD"),"");
  	            	String EXP_MST_NM = StringUtil.getString(mailMap.get("EXP_MST_NM"),"");
  	            	String EXP_MST_SUB_NM =StringUtil.getString(mailMap.get("EXP_MST_SUB_NM"),"");
  	            	String PRD_IMG_URL = StringUtil.getString(request.getAttribute("cdnDomain"), "")+StringUtil.getString(mailMap.get("EXP_PRD_IMG"),"");
  	            	String EXP_MST_ATV_ST_DT = StringUtil.getString(mailMap.get("EXP_MST_ATV_ST_DT"),"");
  	            	String EXP_MST_ATV_ED_DT = StringUtil.getString(mailMap.get("EXP_MST_ATV_ED_DT"),"-");
  	            	  	            	
  	            	String TITLE = "KINGER 모집 _"+EXP_MST_CD;
  	            	String EXP_MST_ATV = EXP_MST_ATV_ST_DT+"~"+EXP_MST_ATV_ED_DT;
  	            	
  	            	
  	             	EMAIL_CONTENTS1 =  TITLE+GB+EXP_MST_NM+GB+EXP_MST_SUB_NM+GB+PRD_IMG_URL+GB+PRD_IMG_URL+GB+EXP_MST_ATV;
  	             		
  	             	mailMap.put("MAIL_CODE",MAIL_CODE);
  	             	mailMap.put("MEMBER_EMAIL",MEM_MST_MAIL);
  	             	mailMap.put("MEMBER_NAME",MEMBER_NAME);
  	             	mailMap.put("EMAIL_TITLE",EMAIL_TITLE);
  	             	mailMap.put("EMAIL_CONTENTS1",EMAIL_CONTENTS1);
  	             		
  	             	//System.out.println("cont : "+EMAIL_CONTENTS1);
  	             	
  	             	Map<String, Object> mailResult = this.mail.mailSendForm(mailMap);
  	             	
  	             	String resultMsg = StringUtil.getString(mailResult.get("mailResult"),"");
  	             	String resultCode = StringUtil.getString(mailResult.get("resultCode"),"");
             	 
                 }
              
              }
              mv.addObject("alertMsg", "발송 되었습니다.");
              mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/kingerReviewList.do");
              mv.addObject("commandMap", commandMap);
              mv.setViewName("/am/common/result");
              return mv;
         }
         
        /**
         * <pre>
         * 1. MethodName : kingerReviewList
         * 2. ClassName  : KingerController.java
         * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 리뷰 목록 
         * 4. 작성자       : khcho
         * 5. 작성일       : 2015. 12. 23.
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
         @RequestMapping("/am/marketing/kingerReviewList")
         public ModelAndView kingerReviewList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
         {
         	
         	ModelAndView mv = new ModelAndView();
             
         	if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
             {
                 // 이벤트 응모자 / 당첨자 목록 갯수
                 int totalCount = this.kingerService.selectKingerReviewListCount(commandMap);
                 
                 String cPageBasic = StringUtil.getString(commandMap.get("cPage"), StringUtil.getString(commandMap.get("cPageBasic"), "1"));
                 String pageSizeBasic = StringUtil.getString(commandMap.get("pageSize"), StringUtil.getString(commandMap.get("pageSizeBasic"), "20")); 
                 commandMap.put("cPageBasic", cPageBasic);
                 commandMap.put("pageSizeBasic", pageSizeBasic);
                 commandMap.put("cPage", StringUtil.getString(commandMap.get("cPageEntry"), "1"));
                 commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSizeEntry"), "20"));
                 
                 Paging paging = new Paging(totalCount, commandMap);
                 mv.addObject( "paging", paging );

                 commandMap.put("startNum", paging.getStartNum());
                 commandMap.put("endNum", paging.getEndNum());
                 
                 Map<String, Object> resultMap = this.kingerService.selectKingerReviewList(commandMap);
                 
                 mv.addObject("totalCount", totalCount);
                 
                 // 이벤트 응모자 / 당첨자 목록
                 mv.addObject("list", resultMap.get("list"));
                 mv.addObject("info", resultMap.get("info"));
                 
                 mv.addObject("commandMap", commandMap);
                 
             }
             
             return mv;
         }
        
  
        /**
         * <pre>
         * 1. MethodName : kingerActivePopup
         * 2. ClassName  : KingerController.java
         * 3. Comment    : 관리자 > 고객체험단 활동내역 팝업
         * 4. 작성자       : khcho
         * 5. 작성일       : 2015. 12. 23.
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
        @RequestMapping(value="/am/marketing/kingerActivePopup")
        public ModelAndView kingerActivePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
        {
        	ModelAndView mv = new ModelAndView();
        	 
        	//페이징
        	int totalCount = 0;
        
        	totalCount = this.kingerService.selectKingerActivePopupListCount(commandMap);
        
        	Paging paging = new Paging(totalCount, commandMap); 
        
        	List<Map<String, Object>> list = null;
        	if(totalCount>0)
        	{
        		list = this.kingerService.selectKingerActivePopupList(commandMap);
        	}

        
        	//RETURN OBJECT
        	mv.addObject("list", list);
        	mv.addObject("paging", paging);
        	mv.addObject("commandMap", commandMap);
	        
        	return mv;
        }
    /**
    * <pre>
    * 1. MethodName : kingerEntryListExcelDownload
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 고객체험단 응모자 / 당첨자 목록 엑셀 다운로드 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    @RequestMapping("/am/marketing/kingerEntryListExcelDownload")
    public ModelAndView kingerEntryListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
    	if(!"".equals(StringUtil.getString(commandMap.get("EXP_MST_CD"), "")))
        {
         	
        	Map<String, Object> resultMap = this.kingerService.selectKingerEntryList(commandMap);
           
        	// 이벤트 응모자 / 당첨자 목록
            List <Map<String, Object>> dataList = (List<Map<String, Object>>)resultMap.get("list");
            
            String [] rowTitle = null;
            String [] cellSize = null;
            String [] dataName = null;
            String [] dataType = null;
            
            rowTitle = new String[]{"NO", "등록일", "신청회수", "아이디","회원이름","URL","휴대폰번호","집주소","이메일","등록리뷰수","담첨여부"};
            cellSize = new String[]{"20", "50", "30", "40", "40", "70", "40", "100", "60", "40", "30", "30"};
            dataName = new String[]{"RNUM", "EXP_ETR_REG_DT", "REV_CNT","MEM_MST_MEM_ID","MEM_MST_MEM_NM","URL_LIST","TEL_NO","ADDR","MEM_MST_MAIL","REV_CNT","EXP_ETR_WIN_YN"};
            dataType = new String[]{"String","Date", "String", "String","String","String","String","String","String","String","String"};
                       	
            String fileName = "kingerEntry";
             
            // 당첨자 목록 엑셀 다운로드
            ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
        }
        return null;
    }
    
    /**
    * <pre>
    * 1. MethodName : kingerEntryWinnerSampleExcelDownload
    * 2. ClassName  : KingerController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 당첨자 목록 샘플 엑셀 다운로드  
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/kingerEntryWinnerSampleExcelDownload")
    public ModelAndView kingerEntryWinnerSampleExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        
        List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
        
        String [] rowTitle= {"경품정보", "응모자 아이디"};
        String [] cellSize = {"200", "50"};
        String [] dataName = {"EVT_ETR_WIN_TXT", "EVT_ETR_REG_ID"};
        String [] dataType = {"String", "String"};
        
        for(int i = 0;i < 5;i++)
        {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("EVT_ETR_WIN_TXT", "적립금 1000원");
            map.put("EVT_ETR_REG_ID", "louisclubUser");
            dataList.add(map);
        }
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "kingerEntryWinnerSample");
        return null;
    }
    
   	
	/**
	* <pre>
	* 1. MethodName : kingerWinUpdateAjax
	* 2. ClassName : KingerController.java
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
	@RequestMapping("/am/marketing/kingerWinUpdateAjax")
	public JSON kingerWinUpdateAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.kingerService.updateKingerWin(request,commandMap);
		
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
	* 1. MethodName : kingerBestUpdateAjax
	* 2. ClassName : KingerController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 고객체험단관리 > 리부 데스트 업데이트
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 23.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/marketing/kingerBestUpdateAjax")
	public JSON kingerBestUpdateAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.kingerService.updateKingerReviewBest(request,commandMap);
		
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
	    * 1. MethodName : kingerFileDownload
	    * 2. ClassName  : CommonController.java
	    * 3. Comment    : 첨부파일 다운로드 
	    * 4. 작성자       : khcho
	    * 5. 작성일       : 2016. 2. 23.
	    * </pre>
	    *
	    * @param request
	    * @param commandMap
	    * @return
	    * @throws Exception
	    */
	    @RequestMapping("/am/marketing/kingerFileDownload")
	    public ModelAndView kingerFileDownload (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	    {
	        ModelAndView mv = new ModelAndView("downloadView");
	        if(!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "")))
	        {
	             
	        	String webPath = StringUtil.getString(commandMap.get("CMM_FLE_SAVE_PATH"), "");
	            String orgFileName = StringUtil.getString(commandMap.get("CMM_FLE_ORG_NM"), "");
	            File file = new File(webPath);
	            mv.addObject("downloadFile", file);
	            mv.addObject("orgFileName", orgFileName);
	           
	        }
	        
	        return mv;
	    }
	    
	 
}
