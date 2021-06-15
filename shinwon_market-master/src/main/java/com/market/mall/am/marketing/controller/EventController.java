package com.market.mall.am.marketing.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.EventService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : EventController.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 이벤트 관리를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class EventController {

    
    @Resource(name="eventService")
    private EventService eventService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    @Resource private Sms sms;
    
    /**
    * <pre>
    * 1. MethodName : eventList
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 11.
    * </pre>
    *
    * @param request
    * @param commadnMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/eventList")
    public ModelAndView eventList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchEvtMstStDt", StringUtil.getString(commandMap.get("searchEvtMstStDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        commandMap.put("searchEvtMstEdDt", StringUtil.getString(commandMap.get("searchEvtMstEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        // 이벤트 목록 갯수
        int totalCount = this.eventService.selectEventListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 이벤트 목록
            list = this.eventService.selectEventList(commandMap);
            
        }
        
        // 이벤트 형태 리스트
        mv.addObject("eventTypeList", this.commonService.selectCode("COMMON_EVENT_TYPE_GROUP"));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : eventForm
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 등록 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/eventForm")
    public ModelAndView eventForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 이벤트 형태 리스트
        mv.addObject("eventTypeList", this.commonService.selectCode("COMMON_EVENT_TYPE_GROUP"));
        
     // 이벤트 형태 리스트
        mv.addObject("eventMemList", this.commonService.selectCode("COMMON_MEMBER_TYPE"));
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : eventEdit
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 수정 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/eventEdit")
    public ModelAndView eventEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
            Map<String, Object> resultMap = this.eventService.selectEventInfo(commandMap);

            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            
            mv.addObject("dtlList", resultMap.get("dtlList"));
            mv.addObject("dtlImgList", resultMap.get("dtlImgList"));
            mv.addObject("fileList", resultMap.get("fileList"));
            mv.addObject("row", resultMap.get("row"));
            //mv.addObject("detailList", this.eventService.selectEventDetailList(commandMap)); 경품은 제외..
            System.out.println("::::::::::::::::::::::::::::::::::::::");
            System.out.println("" + Code.EVENT_MASTER_TYPE_LUCKYDRAW);
            System.out.println(StringUtil.getString(row.get("EVT_MST_TYPE"), ""));
            System.out.println("::::::::::::::::::::::::::::::::::::::");
            if(("" + Code.EVENT_MASTER_TYPE_LUCKYDRAW).equals(StringUtil.getString(row.get("EVT_MST_TYPE"), "")))
            {
                System.out.println("================================================================================================================");
                System.out.println("럭키드로우");
                System.out.println("================================================================================================================");
            }
        }
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : eventRegist
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/eventRegist")
    public ModelAndView eventRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = this.eventService.insertEvent((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : eventModify
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/eventModify")
    public ModelAndView eventModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        int result = 0;
        if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
            result = this.eventService.updateEvent((MultipartHttpServletRequest)request, commandMap);
        }
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventList.do");
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : eventEntryList
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 응모자 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2014. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/eventEntryList")
    public ModelAndView eventEntryList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
    	ModelAndView mv = new ModelAndView();
        
    	if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
            // 이벤트 응모자 / 당첨자 목록 갯수
            int totalCount = this.eventService.selectEventEntryListCount(commandMap);
            
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
            
            if (totalCount > 0){
                
                Map<String, Object> resultMap = this.eventService.selectEventEntryList(commandMap);
                
                // 이벤트 응모자 / 당첨자 목록
                mv.addObject("list", resultMap.get("list"));
                mv.addObject("info", resultMap.get("info"));
                // 경매형 이벤트 최고금액 응모자 목록
                //mv.addObject("topList", resultMap.get("topList"));
                
                Map<String,Object> basicMap = (Map<String,Object>)resultMap.get("basicRow");
                

                
                // 기본 정보
                mv.addObject("basicRow", basicMap);
                
            }
            
            mv.addObject("totalCount", totalCount);
            mv.addObject("commandMap", commandMap);
            
        }
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : eventEntryList
     * 2. ClassName  : EventController.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 응모자 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/eventEntryWinnerSelect")
     public ModelAndView eventEntryWinnerSelect(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	
     	ModelAndView mv = new ModelAndView();
         
     	if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
     		Map<String, Object> resultMap = this.eventService.selectEventWinnerInfo(commandMap);
        
     		mv.addObject("info", resultMap.get("info"));
            mv.addObject("commandMap", commandMap);
             
         }
         
         return mv;
     }
    
    /**
     * <pre>
     * 1. MethodName : eventEntryReply
     * 2. ClassName  : EventController.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 응모자(댓글형)
     * 4. 작성자       : 
     * 5. 작성일       : 
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/eventEntryReply")
     public ModelAndView eventEntryReply(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
     	
     	ModelAndView mv = new ModelAndView();
         
     	if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
         {
             // 이벤트 응모자 / 당첨자 목록 갯수
             int totalCount = this.eventService.selectEventEntryListCount(commandMap);
             
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
             
             if (totalCount > 0){
                 
                 Map<String, Object> resultMap = this.eventService.selectEventEntryList(commandMap);
                 
                 // 이벤트 응모자 / 당첨자 목록
                 mv.addObject("list", resultMap.get("list"));
                 // 경매형 이벤트 최고금액 응모자 목록
                 mv.addObject("topList", resultMap.get("topList"));
                 
                 Map<String,Object> basicMap = (Map<String,Object>)resultMap.get("basicRow");
                 
                 String EVT_MST_BRAND_CD = (String)basicMap.get("EVT_MST_BRAND_CD");
                 
                 // 기본 정보
                 mv.addObject("basicRow", basicMap);
                 
             }
             
             mv.addObject("totalCount", totalCount);
             mv.addObject("commandMap", commandMap);
             
         }
         
         return mv;
     }
     
     /**
      * <pre>
      * 1. MethodName : eventEntryImage
      * 2. ClassName  : EventController.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 응모자(이미지형)
      * 4. 작성자       : 
      * 5. 작성일       : 
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/eventEntryImage")
      public ModelAndView eventEntryImage(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
      	
      	ModelAndView mv = new ModelAndView();
          
      	if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
          {
              // 이벤트 응모자 / 당첨자 목록 갯수
              int totalCount = this.eventService.selectEventEntryListCount(commandMap);
              
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
              
              if (totalCount > 0){
                  
                  Map<String, Object> resultMap = this.eventService.selectEventEntryList(commandMap);
                  
                  // 이벤트 응모자 / 당첨자 목록
                  mv.addObject("list", resultMap.get("list"));
                  // 경매형 이벤트 최고금액 응모자 목록
                  mv.addObject("topList", resultMap.get("topList"));
                  
                  Map<String,Object> basicMap = (Map<String,Object>)resultMap.get("basicRow");
                   
                  
                  // 기본 정보
                  mv.addObject("basicRow", basicMap);
                  
              }
              
              mv.addObject("totalCount", totalCount);
              mv.addObject("commandMap", commandMap);
              
          }
          
          return mv;
      }
    
    /**
     * <pre>
     * 1. MethodName : eventEntryWinnerList
     * 2. ClassName  : EventController.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 당첨자 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/eventEntryWinnerList")
     public ModelAndView eventEntryWinnerList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         /*
         ModelAndView mv = new ModelAndView();
         
         if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
         {
        	 int evtMstType = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
             // 이벤트 응모자 / 당첨자 목록 갯수
             int totalCount = this.eventService.selectEventWinListCount(commandMap);
             
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
             
             if (totalCount > 0){
            	 
            	 Map<String, Object> resultMap = new HashMap<String, Object>();
            	 
            	 
            	 resultMap = this.eventService.selectEventWinList(commandMap);
            	 
                 // 이벤트 응모자 / 당첨자 목록
                 mv.addObject("list", resultMap.get("list"));
                 // 기본 정보
                 mv.addObject("basicRow", resultMap.get("basicRow"));
             }
             
             Map<String, Object> resultMap = this.eventService.selectEventWinnerInfo(commandMap);
             
      		 mv.addObject("info", resultMap.get("info"));
             
             mv.addObject("totalCount", totalCount);
             mv.addObject("commandMap", commandMap);
         }
         */
         return null;
     }
     /**
      * <pre>
      * 1. MethodName : eventEntryWinnerForm
      * 2. ClassName  : EventController.java
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
      @RequestMapping("/am/marketing/eventEntryWinnerForm")
      public ModelAndView eventEntryWinnerForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
          ModelAndView mv = new ModelAndView();
          
          if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
          {
              Map<String, Object> resultMap = this.eventService.selectEventInfo(commandMap);

              Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
              
              mv.addObject("row", resultMap.get("row"));
              //mv.addObject("detailList", this.eventService.selectEventDetailList(commandMap)); 경품은 제외..
          }
          
          mv.addObject("commandMap", commandMap);
          
          return mv;
      }
      
      /**
       * <pre>
       * 1. MethodName : eventEntryWinnerEdit
       * 2. ClassName  : EventController.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 당첨자발표 수정 폼 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 17.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/eventEntryWinnerEdit")
       public ModelAndView eventEntryWinnerEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
       {
           ModelAndView mv = new ModelAndView();
           
           if(!"".equals(StringUtil.getString(commandMap.get("EVT_WIN_IDX"), "")))
           {
        	   Map<String, Object> resultMap2 = this.eventService.selectEventWinInfo(commandMap);
        	   mv.addObject("fileList", resultMap2.get("fileList"));
               mv.addObject("rowWin", resultMap2.get("rowWin"));
               
           }
           Map<String, Object> resultMap = this.eventService.selectEventInfo(commandMap);
           
           mv.addObject("row", resultMap.get("row"));
           mv.addObject("commandMap", commandMap);
           
           return mv;
       }
      
      /**
       * <pre>
       * 1. MethodName : eventEntryWinnerRegist
       * 2. ClassName  : EventController.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트  등록 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2014. 4. 14.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/eventEntryWinnerRegist")
       public ModelAndView eventEntryWinnerRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
       {
           ModelAndView mv = new ModelAndView();
           
           String [] columName = new String[]{"WIN_INF_NM", "MEM_MST_MEM_ID", "MEM_MST_MEM_NM" };
       	
           MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
           CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
           
           List<Map<String, Object>> eventEntryWinnerList = ExcelUtil.excelRead(file, columName);
           System.out.println("eventEntryWinnerList.size() : "+eventEntryWinnerList.size());
           
           try{
        	   if(eventEntryWinnerList.size() > 0)
               {
            	   boolean	pass	= true;
            	   
                   for(int j=0;j < eventEntryWinnerList.size();j++){
    	               Map<String, Object> dataMap = (Map<String, Object>) eventEntryWinnerList.get(j);
    	               	
    	               commandMap.put("WIN_INF_NM", StringUtil.getString(dataMap.get("WIN_INF_NM"), ""));
    	               commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(dataMap.get("MEM_MST_MEM_ID"), ""));
    	               
    	               int checkCnt	= this.eventService.selectEventWinfInfCnt(commandMap);
    	               	
    	               if(checkCnt == 0){
    	               		pass	= false;
    	               }
                   }
            	   
            	   if(pass){
    	               commandMap.put("eventEntryWinnerList", eventEntryWinnerList);
    	               this.eventService.updateEventEntryWinner(request, commandMap);
    		      
    		           int result = this.eventService.insertEventWin((MultipartHttpServletRequest)request, commandMap);
    		           
    		           // view Page Info
    		           if(result > 0)
    		           {
    		               mv.addObject("alertMsg", "등록 되었습니다.");
    		               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
    		               
    		           }
    		           else
    		           {
    		               mv.addObject("alertMsg", "등록에 실패하였습니다.");
    		               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
    		           }
            	   }else{
            		   mv.addObject("alertMsg", "잘못된 문서입니다.");
    	               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
            	   }
    	           
               }
           }catch(SQLException se){
        	   se.printStackTrace();   
           }catch(Exception e){
        	   e.printStackTrace();
           }

           
           mv.addObject("commandMap", commandMap);
           mv.setViewName("/am/common/result");
           return mv;
      }
       /**
        * <pre>
        * 1. MethodName : eventEntryWinnerModify
        * 2. ClassName  : EventController.java
        * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트  당첨자발표 수정 
        * 4. 작성자       : khcho
        * 5. 작성일       : 2015. 12. 17.
        * </pre>
        *
        * @param request
        * @param commandMap
        * @return
        * @throws Exception
        */
        @RequestMapping("/am/marketing/eventEntryWinnerModify")
        public ModelAndView eventEntryWinnerModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
        {
            ModelAndView mv = new ModelAndView();
           
            String [] columName = new String[]{"WIN_INF_NM", "MEM_MST_MEM_ID", "MEM_MST_MEM_NM" };
        	
        	MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
            try{
	            if(file != null)
	            {
		            List<Map<String, Object>> eventEntryWinnerList = ExcelUtil.excelRead(file, columName);
		            System.out.println("eventEntryWinnerList.size() : "+eventEntryWinnerList.size());
		            if(eventEntryWinnerList.size() > 0)
		            {
		                commandMap.put("eventEntryWinnerList", eventEntryWinnerList);
		                this.eventService.updateEventEntryWinner(request, commandMap);
		            }
	            }
	            int result = this.eventService.updateEventWin((MultipartHttpServletRequest)request, commandMap);
	            
	            // view Page Info
	            if(result > 0)
	            {
	            	
	                mv.addObject("alertMsg", "저장 되었습니다.");
	                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
	                
	            }
	            else
	            {
	                mv.addObject("alertMsg", "저장에 실패하였습니다.");
	                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
	            }
            }catch(SQLException se){
         	   se.printStackTrace();   
         	  mv.addObject("alertMsg", "잘못된 문서 입니다.");
              mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
            }catch(Exception e){
         	   e.printStackTrace();
         	  mv.addObject("alertMsg", "잘못된 문서 입니다.");
              mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/eventEntryWinnerList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
            return mv;
       }
        
        /**
         * <pre>
         * 1. MethodName : eventExceptMemberPopup
         * 2. ClassName  : PlanController.java
         * 3. Comment    : 관리자 > 이벤트당첨자 제외회원 팝업
         * 4. 작성자       : khcho
         * 5. 작성일       : 2015. 12. 18.
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
        @RequestMapping(value="/am/marketing/eventExceptMemberPopup")
        public ModelAndView eventExceptMemberPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
        {
            ModelAndView mv = new ModelAndView();
            //String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
            //commandMap.put("searchPrdMstCd", searchPrdMstCd);

            //페이징
            int totalCount = 0;
            
            totalCount = this.eventService.selectEventExceptMemberCount(commandMap);
            
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
            	list = this.eventService.selectEventExceptMemberList(commandMap);
            }

            
            //RETURN OBJECT
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            
            
            return mv;
        }
        /**
         * <pre>
         * 1. MethodName : eventMemberImagePopup
         * 2. ClassName  : PlanController.java
         * 3. Comment    : 관리자 > 이벤트당첨자 이미지형 조회 팝업
         * 4. 작성자       : khcho
         * 5. 작성일       : 2015. 12. 18.
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
        @RequestMapping(value="/am/marketing/eventMemberImagePopup")
        public ModelAndView eventMemberImagePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
        {
            ModelAndView mv = new ModelAndView();
            
            if(!"".equals(StringUtil.getString(commandMap.get("EVT_IMG_IDX"), "")))
            {
                Map<String, Object> resultMap = this.eventService.selectEventImagePopupInfo(commandMap);

                Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
                
                mv.addObject("fileList", resultMap.get("fileList"));
                mv.addObject("info", resultMap.get("row"));
                //mv.addObject("detailList", this.eventService.selectEventDetailList(commandMap)); 경품은 제외..
            }
            
            //RETURN OBJECT
            
            mv.addObject("commandMap", commandMap);
            
            
            return mv;
        }
    /**
    * <pre>
    * 1. MethodName : eventEntryListExcelDownload
    * 2. ClassName  : EventController.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 이벤트 관리 응모자 / 당첨자 목록 엑셀 다운로드 
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
    @RequestMapping("/am/marketing/eventEntryListExcelDownload")
    public ModelAndView eventEntryListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
    	if(!"".equals(StringUtil.getString(commandMap.get("EVT_MST_IDX"), "")))
        {
        	int evtMstType = StringUtil.getInt(commandMap.get("EVT_MST_TYPE"),0);
        	Map<String, Object> resultMap = new HashMap<String, Object>();
        	
         
        	resultMap = this.eventService.selectEventLotList(commandMap);
        	
        	
        	// 이벤트 응모자 / 당첨자 목록
            List <Map<String, Object>> dataList = (List<Map<String, Object>>)resultMap.get("list");
            
            String [] rowTitle = null;
            String [] cellSize = null;
            String [] dataName = null;
            String [] dataType = null;
            
            
            rowTitle = new String[]{"아이디", "회원이름", "응모일"};
            cellSize = new String[]{"50", "50", "80"};
            dataName = new String[]{"MEM_MST_MEM_ID", "MEM_MST_MEM_NM", "EVT_REG_DT"};
            dataType = new String[]{"String", "String", "Date"};
            
            // 이벤트 유형 - 응모형
//            if(evtMstType == Code.EVENT_MASTER_TYPE_ENTER)
//            {
//            	rowTitle = new String[]{"아이디", "회원이름", "회원등급", "성별", "응모일"};
//                cellSize = new String[]{"50", "50", "50", "50", "80"};
//                dataName = new String[]{"EVT_ETR_REG_ID", "EVT_ETR_NM", "CUST_DIV", "EVT_ETR_GENDER", "EVT_ETR_REG_DT"};
//                dataType = new String[]{"String", "String", "String", "String", "Date"};
//            }
//            // 이벤트 유형 - 덧글형
//            else if(evtMstType == Code.EVENT_MASTER_TYPE_REPLY)
//            {
//            	rowTitle = new String[]{"아이디", "회원이름", "회원등급", "성별", "응모일", "덧글", "전시여부"};
//                cellSize = new String[]{"50", "50", "50", "50", "80","100","50"};
//                dataName = new String[]{"EVT_REPLY_REG_ID", "CUST_NM", "CUST_DIV", "EVT_REPLY_GENDER", "EVT_REPLY_REG_DT", "EVT_REPLY_CONTENTS", "EVT_REPLY_DISPLAY_YN"};
//                dataType = new String[]{"String", "String", "String", "String", "Date", "String", "String"};
//            }
//            // 이벤트 유형 - 이미지형
//            else if(evtMstType == Code.EVENT_MASTER_TYPE_IMAGE)
//            {
//            	rowTitle = new String[]{"아이디", "회원이름", "회원등급", "성별", "응모일", "제목" , "상태"};
//                cellSize = new String[]{"50", "50", "50", "50", "80", "50", "50"};
//                dataName = new String[]{"EVT_BOARD_REG_ID", "CUST_NM", "CUST_DIV", "EVT_BOARD_GENDER", "EVT_BOARD_REG_DT", "EVT_BOARD_TITLE", "EVT_BOARD_USE_YN" };
//                dataType = new String[]{"String", "String", "String", "String", "Date", "String", "String"};
//            }
//            // 이벤트 유형 - 설문형
//            else if(evtMstType == Code.EVENT_MASTER_TYPE_SURVEY)
//            {
//            	rowTitle = new String[]{"아이디", "회원이름", "회원등급", "성별", "응모일", "설문항목번호"};
//                cellSize = new String[]{"50", "50", "50", "50", "80", "50"};
//                dataName = new String[]{"EVT_SURVEY_REG_ID", "CUST_NM", "CUST_DIV", "EVT_SURVEY_GENDER", "EVT_SURVEY_REG_DT", "EVT_SURVEY_CMM_FLE_SORT" };
//                dataType = new String[]{"String", "String", "String", "String", "Date", "String"};
//            }
            	
            String fileName = "eventEntry";
            
            // 당첨자 Info
            if("Y".equals(StringUtil.getString(commandMap.get("EVT_ETR_WIN_YN"), "N")))
            {
                fileName = "eventEntryWinner";
            }
            
            // 당첨자 목록 엑셀 다운로드
            ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
        }
        return null;
    }
    
    /**
    * <pre>
    * 1. MethodName : eventEntryWinnerSampleExcelDownload
    * 2. ClassName  : EventController.java
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
    @RequestMapping("/am/marketing/eventEntryWinnerSampleExcelDownload")
    public ModelAndView eventEntryWinnerSampleExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
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
        ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, "eventEntryWinnerSample");
        return null;
    }
    
    
    /**
	* <pre>
	* 1. MethodName : eventReplyDelAjax
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 선택된 덧글 삭제
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 06.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/marketing/eventReplyDelAjax")
	public JSON eventReplyDelAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.eventService.deleteEventReply(request,commandMap);
		
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
	* 1. MethodName : eventImageDelAjax
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 선택된 이미지 삭제
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/am/marketing/eventImageDelAjax")
	public JSON eventImageDelAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();			
		
		int	result = this.eventService.deleteEventImage(request,commandMap);
		
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
	* 1. MethodName : eventReplyListAjax
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 덧글 목록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 06.
	* </pre>
	*
	* @param response
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/marketing/eventReplyListAjax")
	public JSON eventReplyListAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		List<Map<String,Object>> replyList = new ArrayList<Map<String,Object>>();
        
		
		// 덧글 목록 갯수 
        int replyCount = this.eventService.selectEventReplyListCount(commandMap);
        
        commandMap.put("cPage", StringUtil.getString(commandMap.get("cPage"), "1"));
        commandMap.put("pageSize", 20);
        commandMap.put("orderAscYn", "Y");
        Paging paging = new Paging(replyCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("ADMIN");
        String page = pagingRenderer.renderPagination(paging, "getEventReplyListAjax");
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());		
        
        if(replyCount > 0)
        {
        	// 덧글 목록
        	replyList = this.eventService.selectEventReplyList(commandMap);
        }
        
        json.put("list", replyList);
        json.put("page", page);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : eventImageListAjax
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 이미지 목록 
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 15.
	* </pre>
	*
	* @param response
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/marketing/eventImageListAjax")
	public JSON eventImageListAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		List<Map<String,Object>> imageList = new ArrayList<Map<String,Object>>();
        
		
		// 이미지 목록 갯수 
        int imageCount = this.eventService.selectEventImageListCount(commandMap);
        
        commandMap.put("pageSize", 20);
        commandMap.put("orderAscYn", "Y");
        Paging paging = new Paging(imageCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("ADMIN");
        String page = pagingRenderer.renderPagination(paging, "getEventImageListAjax");
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());		
        
        if(imageCount > 0)
        {
        	// 덧글 목록
        	imageList = this.eventService.selectEventImageList(commandMap);
        }
        
        json.put("list", imageList);
        json.put("page", page);
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : eventSurveyListAjax
	* 2. ClassName : EventController.java
	* 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 상세정보 > 설문 목록 
	* 4. 작성자 : khcho
	* 5. 작성일 : 2015. 12. 15.
	* </pre>
	*
	* @param response
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value="/am/marketing/eventSurveyListAjax")
	public JSON eventSurveyListAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		List<Map<String,Object>> surveyList = new ArrayList<Map<String,Object>>();
        
		
		// 이미지 목록 갯수 
        int imageCount = this.eventService.selectEventSurveyListCount(commandMap);
        
        commandMap.put("pageSize", 20);
        commandMap.put("orderAscYn", "Y");
        Paging paging = new Paging(imageCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("ADMIN");
        String page = pagingRenderer.renderPagination(paging, "getEventSurveyListAjax");
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());		
        
        if(imageCount > 0)
        {
        	// 덧글 목록
        	surveyList = this.eventService.selectEventSurveyList(commandMap);
        }
        
        json.put("surveyList", surveyList);
        json.put("page", page);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : eventWinnerLmsAjax
	 * 2. ClassName : EventController.java
	 * 3. Comment : 관리자 > 마케팅 관리 > 이벤트 관리 > 당첨자 발표 > LMS 발송
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 24.
	 * </pre>
	 *
	 * @param response
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/am/marketing/eventWinnerLmsAjax")
	public JSON eventWinnerLmsAjax(HttpServletResponse response, HttpServletRequest request, @RequestParams() Map<String,Object> commandMap) throws Exception{
		JSON json	= new JSON();
		
		List list	= this.eventService.selectEventWinInfList(commandMap);
		
		Map<String, Object> smsMap = new HashMap<String, Object>();
		
		if(list != null ){
			for(int i=0; i < list.size(); i++){
				HashMap row		= (HashMap) list.get(i);
				
				smsMap.put("TR_PHONE", row.get("MEM_MST_MEM_NM"));  
				smsMap.put("TR_NAME", row.get("TR_PHONE"));  		
				smsMap.put("TR_MSG", StringUtil.getString("LMS"));
				
				Map<String, Object> resultMap = this.sms.sendLongMessage(smsMap);
			}
		}
		return json;
	}
	
    @RequestMapping("/am/marketing/eventWinList")
    public ModelAndView eventWinList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        commandMap.put("searchEvtMstStDt", StringUtil.getString(commandMap.get("searchEvtMstStDt"), FormatUtil.formatDate(DateUtil.addDay(DateUtil.getToday("-"), -7), "-")));/*DateUtil.getToday("-")*/
        commandMap.put("searchEvtMstEdDt", StringUtil.getString(commandMap.get("searchEvtMstEdDt"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
        
        /**
         * PAGEING 처리
         */
        String cPage = StringUtil.getString(commandMap.get("cPage"), StringUtil.getString(commandMap.get("cPage"), "1"));
        String pageSize = StringUtil.getString(commandMap.get("pageSize"), StringUtil.getString(commandMap.get("pageSize"), "20")); 
        
        commandMap.put("cPage", cPage);
        commandMap.put("pageSize", pageSize);

        // 이벤트 응모자 / 당첨자 목록 갯수
        int totalCount = this.eventService.selectEventWinListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        if (totalCount > 0){
            
            Map<String, Object> resultMap = new HashMap<String, Object>();
            
            
            resultMap = this.eventService.selectEventWinList(commandMap);
            
            // 이벤트 응모자 / 당첨자 목록
            mv.addObject("list", resultMap.get("list"));
        }
        
        Map<String, Object> resultMap = this.eventService.selectEventWinnerInfo(commandMap);

        // 이벤트 형태 리스트
        mv.addObject("eventTypeList", this.commonService.selectCode("COMMON_EVENT_TYPE_GROUP"));
        mv.addObject("info", resultMap.get("info"));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
}
