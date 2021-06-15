package com.market.mall.am.tag.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class TagGroupController {
    
    @Autowired
    TagService tagService;
    
    @AccessLevelAdmin
    
    @RequestMapping("/am/tag/tagGroupList")
    public ModelAndView tagGroupList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int totalCount = tagService.selectTagGroupListCount(commandMap);
        
        List<Map<String, Object>> tagGroupList = null;
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject(RESPONSE_KEY.PAGING, paging);

        
        if(totalCount > 0 ){
            tagGroupList = tagService.selectTagGroupList(commandMap);
        }
        
        mv.addObject(RESPONSE_KEY.TAG_GROUP_LIST, tagGroupList);
        mv.addObject(RESPONSE_KEY.COMMAND_MAP, commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/tag/tagGroupForm")
    public ModelAndView tagGroupForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> tagList= tagService.selectTagList();
        
        mv.addObject(RESPONSE_KEY.TAG_LIST, tagList);
        
        return mv;
    }
    
    @RequestMapping("/am/tag/tagGroupEdit")
    public ModelAndView tagGroupEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> param = new HashMap<String, Object>();
        
        String tagGroupId = StringUtil.getString(commandMap.get(TAG_MODEL.TAG_GRP_ID), "");
        commandMap.put(TAG_MODEL.TAG_GRP_ID, tagGroupId);
        
        Map<String, Object> resultMap = tagService.selectTagGroupById(commandMap);
        
        param.put(TAG_MODEL.TAG_GRP_ID, tagGroupId);
        List<Map<String, Object>> selectedTagList= tagService.selectTagGroupWithTagListById(param);
   
        List<Map<String, Object>> allTagList = tagService.selectTagList();
        
        mv.addObject(RESPONSE_KEY.TAG_GROUP_DATA, resultMap);
        mv.addObject(RESPONSE_KEY.TAG_LIST, selectedTagList);
        mv.addObject(RESPONSE_KEY.AVAILABLE_TAG_LIST, allTagList);
        mv.addObject(RESPONSE_KEY.COMMAND_MAP, commandMap);

        return mv;
    }
    
    @RequestMapping("/am/tag/tagGroupModify")
    public ModelAndView tagGroupModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("arrTAG_MST_IDs", commandMap.get("TAG_MST_ID"));
        param.put("TAG_GRP_ID", commandMap.get("TAG_GRP_ID"));
        
        String updateResult = tagService.updateTagGroupInfo(commandMap);
        tagService.updateTagGroupBindTag(param);
        
        if(updateResult ==  SERVICE_RESULT_CODE.SERVICE_FAIL){
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/tag/tagGroupList.do");
        }
        else {
        	mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/tag/tagGroupList.do");	
        }
        
        mv.addObject("commandMap", commandMap);
        mv.setViewName("pc/common/result");
        
        return mv;
    }
    
    @RequestMapping("/am/tag/tagGroupRegistAjax")
    public JSON tagGroupRegistAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String adminId = StringUtil.getString(admin.getADM_MST_ID(),"");

        String jsonData = commandMap.get("TAG_ID_LIST").toString();
        
        String title = StringUtil.getString(commandMap.get(PARAM_CONST.TAG_GRP_TITLE),"");
        String desc = StringUtil.getString(commandMap.get(PARAM_CONST.TAG_GRP_DES),"");
        String status = StringUtil.getString(commandMap.get(PARAM_CONST.TAG_GRP_STATUS),"");
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String, Object>> tagDataList = mapper.readValue(jsonData, typeRef);
        
        //해쉬태그 마스터 테이블 등록
        commandMap.put(PARAM_CONST.TAG_GRP_TITLE,title);
        commandMap.put(PARAM_CONST.TAG_GRP_DES,desc);
        commandMap.put(PARAM_CONST.TAG_GRP_STATUS,status);
        commandMap.put(TAG_MODEL.REG_ID,adminId);
        
        String tagGroupId = tagService.insertTagGroup(commandMap);
        
        if(tagDataList == null || tagDataList.size() == 0){
           return json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.SUCCESS_MSG);
        }
        
        //해쉬태그 그룹 바인딩 테이블 등록
        for(int index = 0; index < tagDataList.size(); index++){
         
            Map<String, Object> param = new HashMap<String, Object>();
            
            String tagId = StringUtil.getString(tagDataList.get(index).get(TAG_MODEL.TAG_MST_ID),"");
            param.put(TAG_MODEL.TAG_MST_ID, tagId);
            param.put(TAG_MODEL.TAG_GRP_ID, tagGroupId);
            tagService.insertTagGroupBind(param);
        }
        
        json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.SUCCESS_MSG);
        
        return json;
    }
    

    
    

    
    
}
