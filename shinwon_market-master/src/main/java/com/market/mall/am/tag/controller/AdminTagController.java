package com.market.mall.am.tag.controller;

import java.util.ArrayList;
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
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.STATUS_CODE;
import com.market.mall.common.constants.VALIDATE_CODE;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.model.Admin;
import com.market.mall.model.User;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AdminTagController {
    
    @Autowired
    TagService tagService;
    
    @AccessLevelAdmin

    @RequestMapping("/am/tag/adminTagForm")
    public ModelAndView adminTagForm(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> tagList = tagService.selectTagList();
        
        mv.addObject(RESPONSE_KEY.TAG_LIST, tagList);
        
        return mv;
    }
    

    @RequestMapping("/am/tag/adminTagRegistAjax")
    public JSON adminTagRegistAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String adminId = StringUtil.getString(admin.getADM_MST_ID(),"");

        String jsonData = commandMap.get("TAG_TITLE_LIST").toString();
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        List<Map<String, Object>> tagDatalist = mapper.readValue(jsonData, typeRef);
        
        String result = null;
        
        if(tagDatalist == null || tagDatalist.size() == 0){
           return json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.SUCCESS_MSG);
        }
        boolean isChanged = false;
        for(int index = 0; index < tagDatalist.size(); index++){
            
            Map<String, Object> param = new HashMap<String, Object>();
            
            String id = StringUtil.getString(tagDatalist.get(index).get(TAG_MODEL.TAG_MST_ID),"");
            String title = StringUtil.getString(tagDatalist.get(index).get(TAG_MODEL.TAG_MST_TITLE),"");
            String status = StringUtil.getString(tagDatalist.get(index).get(TAG_MODEL.TAG_MST_STATUS),"");
            
            String updateId = null;
            
            if(status.equals("USE") && (id == null || id.equals(""))){
                //insert
                param.put(TAG_MODEL.TAG_MST_TITLE, title);
                param.put(TAG_MODEL.REG_ID, adminId);
                result = tagService.insertTag(param);
                isChanged = true;
                
            } else if(status.equals("DELETE") && id != null && id != ""){
                //update
                param.put(TAG_MODEL.TAG_MST_ID, id);
                param.put(TAG_MODEL.TAG_MST_STATUS, STATUS_CODE.DELETED);
                updateId = tagService.updateTagInfo(param);
                isChanged = true;
            }
        }
        if(isChanged) {
        	json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, "저장이 완료되었습니다.");
        }
        else
        {
        	json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, "변경된 내용이 없습니다.");
        }
        json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);	
        
        return json;
    }
    
    /**
     * @api {GET} /am/tag/searchTagGroupPopup.do 
     * @apiName 관리자 일반태그 설정 공통 팝업
     * @apiGroup Tag 
     * 
     * @apiSuccess {Object[]} TAG_GROUP_LIST 태그 그룹 상세 목록 리스트 [{"TAG_GRP_ID":태그그룹ID, "TAG_GRP_TITLE":태그그룹타이틀, "TAG_GRP_DES":태그그룹설명, "TAG_LIST":[{"TAG_MST_ID" : 태그ID, "TAG_MST_TITLE" : 태그타이틀}, {"TAG_MST_ID" : 태그ID, "TAG_MST_TITLE" : 태그타이틀2}] }]
     */
    @RequestMapping("/am/tag/searchTagGroupPopup")
    public ModelAndView searchTagGroupPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        List<Map<String,Object>> tagGroupList = tagService.selectTagGroup(commandMap);
        
        for(int index=0; index < tagGroupList.size(); index++){
            String tagGrpId = StringUtil.getString(tagGroupList.get(index).get(TAG_MODEL.TAG_GRP_ID),"");
            
            if(!"".equals(tagGrpId)){
                Map<String,Object> param = new HashMap<String,Object>();
                param.put(TAG_MODEL.TAG_GRP_ID, tagGrpId);
                List<Map<String,Object>> tagList = null;
                
                tagList = tagService.selectTagGroupWithTagListById(param);
                
                tagGroupList.get(index).put("TAG_LIST", tagList);
            }
        }
        mv.addObject(RESPONSE_KEY.TAG_GROUP_LIST, tagGroupList);
        
        return mv;
    }
    
    
    
    
}
