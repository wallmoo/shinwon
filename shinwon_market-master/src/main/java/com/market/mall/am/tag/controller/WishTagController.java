package com.market.mall.am.tag.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.model.Paging;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.pc.tag.service.WishTagService;
import com.market.util.ResponseCodeUtil;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class WishTagController {

    @Autowired
    WishTagService wishTagService;
    
    /**
     * @api {POST} /am/tag/selectWishTagList.do
     * @apiName 희망 태그 목록
     * @apiGroup Tag
     *
     * @apiParam {Number} start 시작 번호
     * @apiParam {Number} end 종료 번호
     * @apiParam {Date} start date 종료 번호
     * @apiSuccess {List} list 희망태그리스트
     */
    @AccessLevelAdmin
    @RequestMapping("/am/tag/wishTagList")
    public ModelAndView wishTagList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //희망태그 목록 갯수
        int totalCount = wishTagService.selectWishTagCount(commandMap);

        List<Map<String, Object>> wishTaglist = null;
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject("paging", paging);
        
        if(totalCount > 0){
            wishTaglist = wishTagService.selectWishTagList(commandMap);
        }
        
        mv.addObject(RESPONSE_KEY.PAGING, paging);
        mv.addObject(RESPONSE_KEY.WISH_TAG_LIST, wishTaglist);
        mv.addObject(RESPONSE_KEY.COMMAND_MAP, commandMap);
        
        return mv;
    }
    

    @RequestMapping("/am/tag/wishTagForm")
    public ModelAndView wishTagListInfo(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        
        return mv;
    }
    
    
    @RequestMapping("/am/tag/getWishTagListAjax")
    public JSON getWishTagListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        
        JSON result = new JSON();
        
        String id = commandMap.get(TAG_MODEL.TAG_MST_ID).toString();
        
        if(id != null && !id.isEmpty()){
            
            commandMap.put(TAG_MODEL.TAG_MST_ID,id);
            Map<String, Object> wishTagList = wishTagService.selectWishTagDataById(commandMap);
            
            if(wishTagList.size()==0 || MapUtils.isEmpty(wishTagList)){
                return ResponseCodeUtil.setFailStatus(result, RESPONSE_MESSAGE.FAIL_MSG);
            } else{
                result.addObject("wishTagList", wishTagList);
            }
            
        } else{
            
            return ResponseCodeUtil.setFailStatus(RESPONSE_MESSAGE.FAIL_MSG);
        }
        
        return result;
    }
    
    
    @RequestMapping("/am/tag/wishTagListGroupByUserIdAjax")
    public JSON wishTagListGroupByUserIdAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception {
        
        JSON result = new JSON();

        List<String> tagList = new ArrayList<String>();        
        List<Map<String, Object>> originDataList = wishTagService.selectWishTagListByUserId(commandMap);
        
        String tempId = originDataList.get(0).get("WSH_TAG_REG_ID").toString();
        JSONObject jsonObject = new JSONObject();
        
        for(int index = 0 ; index < originDataList.size(); index++){
            
            if(!originDataList.get(index).get("WSH_TAG_REG_ID").toString().equals(tempId)){
                tempId = originDataList.get(index).get("WSH_TAG_REG_ID").toString();
            }
            
            tagList.add(originDataList.get(index).get("WSH_TAG_TITLE").toString());
            jsonObject.put(tempId, tagList);
        }
        result.put("TAG_DATA", jsonObject);
        
        return result;
    }
    
    
}
