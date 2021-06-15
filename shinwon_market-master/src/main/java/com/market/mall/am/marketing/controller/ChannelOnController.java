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
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.ChannelOnService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.product.service.ProductListService;

import egovframework.rte.fdl.property.EgovPropertyService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class ChannelOnController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="channelOnService") private ChannelOnService channelOnService;
    @Resource(name="commonService") private CommonService commonService;
    @Resource(name="productListService") private ProductListService productListService;
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    @RequestMapping("/am/marketing/channelOnList")
    public ModelAndView channelOnList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 채널온관리 목록 갯수
        int totalCount = this.channelOnService.selectChannelOnListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging );
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0){
            list = this.channelOnService.selectChannelOnList(commandMap);
        }
        //1뎁스 카테고리 가져오기
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        commandMap.put("PRD_CTG_LEVEL", 1);
        
        List<Map<String, Object>> listMenuCategory = this.productListService.selectMenuCategoryList(commandMap);
        mv.addObject("listMenuCategory", listMenuCategory); // 유형 (1뎁스 카테고리)
        
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); // 시즌 공통코드
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    @RequestMapping("/am/marketing/channelOnForm")
    public ModelAndView channelOnForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //1뎁스 카테고리 가져오기
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        commandMap.put("PRD_CTG_LEVEL", 1);
        
        List<Map<String, Object>> listMenuCategory = this.productListService.selectMenuCategoryList(commandMap);
        
        mv.addObject("listMenuCategory", listMenuCategory);
        
        //시즌 공통 코드
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON"));
        
        return mv;
    }
    
    @RequestMapping("/am/marketing/channelOnRegist")
    public ModelAndView channelOnRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //채널온관리 관리자 등록
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //채널온 타입
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //채널온 타입        
        
        int result = this.channelOnService.insertChannelOn((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/channelOnList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/channelOnList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    @RequestMapping("/am/marketing/channelOnEdit")
    public ModelAndView channelOnEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 채널ON 관리 상세정보
            Map<String, Object> resultMap = this.channelOnService.selectChannelOnInfo(commandMap);
            Map<String, Object> row = (Map<String, Object>)resultMap.get("row");
            
            // 기본 정보
            mv.addObject("row", resultMap.get("row"));
            
            // 첨부파일 목록
            mv.addObject("fileList", resultMap.get("fileList"));
            
            //썸네일파일 리스트
            mv.addObject("thumbnailFileList",resultMap.get("thumbnailFileList"));
            
            // 상품구성 그룹 목록
            mv.addObject("detailGroupList", resultMap.get("detailGroupList"));
            
            // 상품구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
            
            // 태그 리스트
            mv.addObject("tagList", resultMap.get("tagList"));
        }
        
        //1뎁스 카테고리 가져오기
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        commandMap.put("PRD_CTG_LEVEL", 1);
        
        List<Map<String, Object>> listMenuCategory = this.productListService.selectMenuCategoryList(commandMap);
        
        //시즌 공통 코드
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON"));
        mv.addObject("listMenuCategory", listMenuCategory);
        mv.addObject("commandMap",commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/marketing/channelOnModify")
    public ModelAndView channelOnModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //채널온 타입
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //태그 바인딩 채널온 타입
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 관리자 관리 관리자 수정
            int result = this.channelOnService.updateChannelOn((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/channelOnList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/marketing/channelOnList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    @RequestMapping("/am/marketing/channelOnListStatusChangeAjax")
    public JSON channelOnListStatusChangeAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap
            , @RequestParams String jsonData) throws Exception 
    {
        JSON json = new JSON();
        int result = 0;
        
        commandMap.put("jsonData", jsonData);
        
        if(jsonData != null)
        {
            result = this.channelOnService.updateChannelOnStatus(request, commandMap);
        }
        else
        {
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        if(result > 0)
        {
            json.put("message", "저장에 성공하였습니다.");
        }
        else
        {
            json.put("message", "오류가 발생하였습니다.\n다시 시도 해 주십시오.");
        }
        return json;
    }
 
}
