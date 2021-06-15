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
import com.market.mall.am.marketing.service.CardDivService;
import com.market.mall.am.marketing.service.CardEventService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : CardDivController.java
 * @Date : 2015. 12. 02.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 카드할부관리를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CardDivController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="cardDivService")
    private CardDivService cardDivService;
    
    @Resource(name="cardEventService")
    private CardEventService cardEventService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    /**
    * <pre>
    * 1. MethodName : cardDivList
    * 2. ClassName  : CardDivController.java
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
    @RequestMapping("/am/marketing/cardDivList")
    public ModelAndView cardDivList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기획전관리 목록 갯수
        int totalCount = this.cardDivService.selectCardDivListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );
        
//        String searchStartDate = DateUtil.addDay(DateUtil.getToday(), -7);
//        searchStartDate = searchStartDate.substring(0,4) + "-" + searchStartDate.substring(4,6) + "-" + searchStartDate.substring(6,8);
//                
//        commandMap.put("searchStartDate", StringUtil.getString(commandMap.get("searchStartDate"), searchStartDate));/*DateUtil.getToday("-")*/
//        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));/*DateUtil.getToday("-")*/
                

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            list = this.cardDivService.selectCardDivList(commandMap);

             
        }
        mv.addObject("cardDivCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_TYPE"));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    
    /**
    * <pre>
    * 1. MethodName : cardDivForm
    * 2. ClassName  : CardDivController.java
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
    @RequestMapping("/am/marketing/cardDivForm")
    public ModelAndView cardDivForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("cardDivCodeList", this.commonService.selectCode("COMMON_CARD_DIV_TYPE"));
        //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
        mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
     
    /**
    * <pre>
    * 1. MethodName : cardDivEdit
    * 2. ClassName  : CardDivController.java
    * 3. Comment    : 관리자 > 프로모션관리 >  카드할부 수정 폼 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/cardDivEdit")
    public ModelAndView cardDivEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!"".equals(StringUtil.getString(commandMap.get("CRD_DIV_IDX"), "")))
        {
            Map<String, Object> resultMap = this.cardDivService.selectCardDivInfo(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            // 기본 정보
            
            mv.addObject("cardDivCodeList", this.commonService.selectCode("COMMON_CARD_DIV_TYPE"));
            //mv.addObject("cardCodeList", this.commonService.selectCode("COMMON_CARD_EVENT_CODE"));
            mv.addObject("cardCodeList", this.cardEventService.selectCardCodeList());
            mv.addObject("row",resultMap.get("row"));
            
            
            // 카드구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
            mv.addObject("detailInfo", resultMap.get("detailInfo"));
        }
        
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
   
    /**
     * <pre>
     * 1. MethodName : cardDivModify
     * 2. ClassName  : CardDivController.java
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
     @RequestMapping("/am/marketing/cardDivMod")
     public ModelAndView cardDivMod(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         
         
         if(!"".equals(StringUtil.getString(commandMap.get("CRD_DIV_IDX"), "")))
         {
             // 관리자 관리 관리자 수정
             int result = this.cardDivService.updateCardDiv(request, commandMap);
             
             // view Page Info
             if(result > 0)
             {
                 mv.addObject("alertMsg", "수정 되었습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardDivList.do");
             }
             else
             {
                 mv.addObject("alertMsg", "수정에 실패하였습니다.");
                 mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardDivList.do");
             }
             mv.addObject("commandMap", commandMap);
             mv.setViewName("/am/common/result");
         }
         return mv;
     }
    /**
    * <pre>
    * 1. MethodName : cardDivRegist
    * 2. ClassName  : CardDivController.java
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
    @RequestMapping("/am/marketing/cardDivRegist")
    public ModelAndView cardDivRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 기획전관리 관리자 등록
        int result = this.cardDivService.insertCardDiv(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardDivList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/cardDivList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
   
    
}
