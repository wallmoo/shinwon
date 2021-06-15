package com.market.mall.am.marketing.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.epasscni.util.DateUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.CardEventService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : CardEventController.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 기획전관리를 처리하는 Controller Class
 * @author kanghk
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CardEventController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="cardEventService")
    private CardEventService cardEventService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    /**
    * <pre>
    * 1. MethodName : cardEventList
    * 2. ClassName  : CardEventController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 11.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/cardEventList")
    public ModelAndView cardEventList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기획전관리 목록 갯수
        int totalCount = this.cardEventService.selectCardEventListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
//        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
//        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
                
//        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
//        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
                

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 기획전관리 목록
            list = this.cardEventService.selectCardEventList(commandMap);

            for(Map<String,Object> preCardEventInfo : list){
            	String preCardEventBrandCd = StringUtil.getString(preCardEventInfo.get("PLN_MST_BRAND_CD"),"").toLowerCase();
            	preCardEventInfo.put("preCardEventServerDomain",propertiesService.getString("server.domain." + preCardEventBrandCd));
            }
        }
        mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    
    /**
    * <pre>
    * 1. MethodName : cardEventForm
    * 2. ClassName  : CardEventController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2011. 11. 11.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/cardEventForm")
    public ModelAndView cardEventForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	commandMap.put("CRD_PMT_ST_DT", StringUtil.getString(commandMap.get("CRD_PMT_ST_DT"), DateUtil.getToday("-")));
        commandMap.put("CRD_PMT_ED_DT", StringUtil.getString(commandMap.get("CRD_PMT_ED_DT"), DateUtil.getToday("-")));
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
        //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
        mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : cardEventDcForm
     * 2. ClassName  : CardEventController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 카드행사_포인트선할인관리 등록 폼 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2011. 11. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/cardEventDcForm")
     public ModelAndView cardEventDcForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
         //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
         mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
         
         mv.addObject("commandMap", commandMap);
         return mv;
     }
     /**
      * <pre>
      * 1. MethodName : cardEventSaveForm
      * 2. ClassName  : CardEventController.java
      * 3. Comment    : 관리자 > 마케팅관리 > 카드행사_적립관리 등록 폼 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2011. 11. 17.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/cardEventSaveForm")
      public ModelAndView cardEventSaveForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
          ModelAndView mv = new ModelAndView();
          mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
          //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
          mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
          mv.addObject("commandMap", commandMap);
          return mv;
      }
      
      /**
       * <pre>
       * 1. MethodName : cardEventCashForm
       * 2. ClassName  : CardEventController.java
       * 3. Comment    : 관리자 > 마케팅관리 > 카드행사_현금캐시백관리 등록 폼 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2011. 11. 17.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/cardEventCashForm")
       public ModelAndView cardEventCashForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
       {
           ModelAndView mv = new ModelAndView();
           mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
           //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
           mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
           mv.addObject("commandMap", commandMap);
           return mv;
       }
    
    /**
    * <pre>
    * 1. MethodName : cardEventEdit
    * 2. ClassName  : CardEventController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 포인트행사 청구할인 수정 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 18.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/cardEventEdit")
    public ModelAndView cardEventEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("CRD_PMT_IDX"), "")))
        {
            // 기획전관리 상세정보
            Map<String, Object> resultMap = this.cardEventService.selectCardEventInfo(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            // 기본 정보
            mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
            //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
            mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
            mv.addObject("row",resultMap.get("row"));
            
            
            // 카드구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
        }
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    /**
     * <pre>
     * 1. MethodName : cardEventDcEdit
     * 2. ClassName  : CardEventController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 포인트선할인 수정 폼 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/cardEventDcEdit")
     public ModelAndView cardEventDcEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         if(!"".equals(StringUtil.getString(commandMap.get("CRD_PMT_IDX"), "")))
         {
             // 기획전관리 상세정보
             Map<String, Object> resultMap = this.cardEventService.selectCardEventInfo(commandMap);
             Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
             // 기본 정보
             mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
             //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
             mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
             mv.addObject("row",resultMap.get("row"));
             
             
             // 카드구성 목록
             mv.addObject("detailList", resultMap.get("detailList"));
         }
         
         mv.addObject("commandMap",commandMap);
         
         return mv;
     }
     /**
      * <pre>
      * 1. MethodName : cardEventSaveEdit
      * 2. ClassName  : CardEventController.java
      * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 포인트적립 수정 폼 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 11. 18.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/cardEventSaveEdit")
      public ModelAndView cardEventSaveEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
      {
          ModelAndView mv = new ModelAndView();
          if(!"".equals(StringUtil.getString(commandMap.get("CRD_PMT_IDX"), "")))
          {
              // 기획전관리 상세정보
              Map<String, Object> resultMap = this.cardEventService.selectCardEventInfo(commandMap);
              Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
              // 기본 정보
              mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
              //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
              mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
              mv.addObject("row",resultMap.get("row"));
              
              
              // 카드구성 목록
              mv.addObject("detailList", resultMap.get("detailList"));
          }
          
          mv.addObject("commandMap",commandMap);
          
          return mv;
      }
      /**
       * <pre>
       * 1. MethodName : cardEventCashEdit
       * 2. ClassName  : CardEventController.java
       * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 현금캐시백 수정 폼 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 11. 18.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/cardEventCashEdit")
       public ModelAndView cardEventCashEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
       {
           ModelAndView mv = new ModelAndView();
           if(!"".equals(StringUtil.getString(commandMap.get("CRD_PMT_IDX"), "")))
           {
               // 기획전관리 상세정보
               Map<String, Object> resultMap = this.cardEventService.selectCardEventInfo(commandMap);
               Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
               // 기본 정보
               mv.addObject("cardEventCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
               //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
               mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
               mv.addObject("row",resultMap.get("row"));
               
               
               // 카드구성 목록
               mv.addObject("detailList", resultMap.get("detailList"));
               // 구성상품목록
               mv.addObject("productList", resultMap.get("productList"));
           }
           
           mv.addObject("commandMap",commandMap);
           
           return mv;
       }
    /**
     * <pre>
     * 1. MethodName : cardEventModify
     * 2. ClassName  : CardEventController.java
     * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 수정 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 11. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/cardEventMod")
     public ModelAndView cardEventMod(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         if(!"".equals(StringUtil.getString(commandMap.get("CRD_PMT_IDX"), "")))
         {
             // 관리자 관리 관리자 수정
             int result = this.cardEventService.updateCardEvent(request, commandMap);
             
             // view Page Info
             if(result > 0)
             {
                 mv.addObject("alertMsg", "수정 되었습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardEventList.do");
             }
             else
             {
                 mv.addObject("alertMsg", "수정에 실패하였습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardEventList.do");
             }
             mv.addObject("commandMap", commandMap);
             mv.setViewName("/am/common/result");
         }
         return mv;
     }
    /**
    * <pre>
    * 1. MethodName : cardEventRegist
    * 2. ClassName  : CardEventController.java
    * 3. Comment    : 관리자 > 마케팅관리 > 기획전관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 4. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/cardEventRegist")
    public ModelAndView cardEventRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기획전관리 관리자 등록
        int result = this.cardEventService.insertCardEvent(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardEventList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardEventList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
   
    
}
