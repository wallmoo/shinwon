package com.market.mall.am.marketing.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DataConvertUtil;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.ChannelService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : ChannelController.java
 * @Date : 2015. 12. 01.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 채널관리를 처리하는 Controller Class
 * @author khcho
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ChannelController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="channelService")
    private ChannelService channelService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="propertiesService") 
    protected EgovPropertyService propertiesService;
    
    /**
    * <pre>
    * 1. MethodName : channelView
    * 2. ClassName  : ChannelController.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/channelView")
    public ModelAndView channelView(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
       
       // pc/mobile 구분
       String searchGubun = StringUtil.getString(commandMap.get("searchGubun"),"PC");
       
       int PRD_CTG_ENV = Code.COMMON_BANNER_DISPLAY_PC;//default는 MarketPlant pc
       
        commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV);
    	
        ModelAndView mv = new ModelAndView();
        
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/marketing/channelView");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : channelAjax
    * 2. ClassName  : ChannelController.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 트리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/channelAjax")
    public JSON channelAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        //commandMap.put("CODE", commandMap.get("BANNER_DISPLAY_ENV" ) );
        List<Map<String, Object>> list = this.channelService.selectChannelCodeList(commandMap);
        DataConvertUtil dataConvertUtil = new DataConvertUtil();
        ArrayList<Map<String, Object>> result = dataConvertUtil.convertTreeData(list, true, "CHN_MST_IDX", "CHN_MST_UP_IDX", "CHN_MST_NM", "CHN_MST_LEVEL");

        //RETURN OBJECT
        json.put("data", result);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : channelList
    * 2. ClassName  : ChannelController.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 목록  
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/channelList")
    public ModelAndView channelList(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CHN_MST_IDX"), "")))
        {
        	Map<String, Object> mst = this.channelService.selectChannelMst(commandMap);
            List<Map<String, Object>> list = this.channelService.selectChannelList(commandMap);
            
            // 카테고리명
            mv.addObject("commandMap", commandMap);
            mv.addObject("row", mst);
            mv.addObject("list", list);
        }
        return mv;
    }
    
   
    /**
     * <pre>
     * 1. MethodName : registChannelDtlPopup
     * 2. ClassName  : ChannelController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 하위채널관리 등록 팜업 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 01.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/registChannelDtlPopup")
     public ModelAndView registChannelDtlPopup(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
     	commandMap.put("CHN_DTL_ST_DT", StringUtil.getString(commandMap.get("CHN_DTL_ST_DT"), DateUtil.getToday("-")));
        commandMap.put("CHN_DTL_ED_DT", StringUtil.getString(commandMap.get("CHN_DTL_ED_DT"), DateUtil.getToday("-")));
    

         String[] codes = {"HP_CODE", "EMAIL_DOMAIN_CODE"};
         mv.addObject("codes", this.commonService.selectCodes(codes));
         mv.addObject("commandMap", commandMap);
         return mv;
     }

     /**
      * <pre>
      * 1. MethodName : registChannelPopup
      * 2. ClassName  : ChannelController.java
      * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 등록 팜업 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 01.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/registChannelPopup")
      public ModelAndView registChannelPopup(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
      {
          ModelAndView mv = new ModelAndView();
          mv.addObject("commandMap", commandMap);
          return mv;
      }
     
    /**
    * <pre>
    * 1. MethodName : modifyChannelDtlPopup
    * 2. ClassName  : ChannelController.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널정보수정 팝업 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/marketing/modifyChannelDtlPopup")
    public ModelAndView modifyChannelDtlPopup(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        String CHN_DTL_CD = StringUtil.getString(commandMap.get("CHN_DTL_CD"), "");
        
        if(!"".equals(CHN_DTL_CD) )
        {
            mv.addObject("row", this.channelService.selectChannelInfo(commandMap));
        }
        String[] codes = {"HP_CODE", "EMAIL_DOMAIN_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : channelMstRegist
     * 2. ClassName  : ChannelController.java
     * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 등록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 01.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/marketing/channelMstRegist")
     public JSON channelMstRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
    	 JSON json = new JSON();
         
    	 commandMap.put("CHN_MST_LEVEL", "3");
        	 
         int result = this.channelService.insertChannelMst(request, commandMap);
         json.put("data", result+"");
            
         
         return json;
     }
     
     /**
      * <pre>
      * 1. MethodName : channelDtlRegist
      * 2. ClassName  : ChannelController.java
      * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 등록 
      * 4. 작성자       : khcho
      * 5. 작성일       : 2015. 12. 01.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      @RequestMapping("/am/marketing/channelDtlRegist")
      public JSON channelDtlRegist(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
      {
     	  JSON json = new JSON();
          	 
          int result = this.channelService.insertChannel(request, commandMap);
          json.put("data", result+"");
             
          
          return json;
      }
      
      /**
       * <pre>
       * 1. MethodName : channelDtlRegist
       * 2. ClassName  : ChannelController.java
       * 3. Comment    : 관리자 > 프로모션관리 > 채널정보수정 
       * 4. 작성자       : khcho
       * 5. 작성일       : 2015. 12. 01.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @RequestMapping("/am/marketing/channelDtlModify")
       public JSON channelDtlModify(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
       {
      	 JSON json = new JSON();
           //String CHN_MST_UP_IDX = StringUtil.getString(commandMap.get("CHN_MST_UP_IDX"), "");
           // 관리자 관리 관리자 등록
      	 //commandMap.put("CHN_MST_LEVEL", "3");
          	 
           int result = this.channelService.updateChannel(request, commandMap);
           json.put("data", result+"");
              
           
           return json;
       }
 
}
