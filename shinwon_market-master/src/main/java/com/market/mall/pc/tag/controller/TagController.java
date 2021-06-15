package com.market.mall.pc.tag.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.epasscni.common.annotations.RequestParams;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.VALIDATE_CODE;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.User;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;
import com.market.util.ResponseCodeUtil;

@Controller
public class TagController {

    @Autowired
    TagService tagService;

    /**
     * @api {post} /pc/tag/registTagAjax.do
     * @apiName 태그 등록
     * @apiGroup Tag
     *
     * @apiParam {String} TAG_TITLE 태그 제목
     * @apiParam {String} TAG_STATUS 태그 사용 여부
     *
     * @apiSuccess {JSON} RESULT_CODE 200
     * @apiSuccess {JSON} RESULT_MESSAGE 성공했습니다
     * 
     * @apiError {JSON} RESULT_CODE 400
     */
    @RequestMapping("/pc/tag/registTagAjax")
    public JSON registTagAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        User user = SessionsUser.getSessionUser(request);
        
//        if(!SessionsUser.isLogin(request)){
//            return json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
//        }
        int validateResult = TAG_MODEL.insertValidate(commandMap);
        
        if(validateResult != VALIDATE_CODE.SUCCESS){
            return json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
        }
        
        String title = commandMap.get(TAG_MODEL.TAG_MST_TITLE).toString();
        String status = commandMap.get(TAG_MODEL.TAG_MST_STATUS).toString();
        
        commandMap.put(TAG_MODEL.TAG_MST_TITLE, title);
        commandMap.put(TAG_MODEL.REG_ID, user.getMEM_MST_MEM_ID());
        commandMap.put(TAG_MODEL.UPDATE_ID, user.getMEM_MST_MEM_ID());
        commandMap.put(TAG_MODEL.TAG_MST_STATUS, status);
        
        String result = tagService.insertTag(commandMap);
        
        if(result == SERVICE_RESULT_CODE.SERVICE_FAIL ){
            return json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
        }
        json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.SUCCESS_MSG);
        
        return json;
    }

    /**
     * @api {post} /pc/tag/selectTagListAjax
     * @apiName 전체 태그 조회
     * @apiGroup Tag
     *
     * @apiSuccess {JSON} TAG_LIST 전체 태그 리스트
     * @apiError {JSON} RESULT_CODE 400
     */
    @RequestMapping("/pc/tag/selectTagListAjax")
    public JSON selectTagListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        List<Map<String, Object>> tagList = tagService.selectTagList();
        
        if(tagList.isEmpty() || tagList == null){
            return json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
        }
        
        json.put(PARAM_CONST.TAG_LIST, tagList);
        
        return json;
    }
    
    /**
     * @api {post} /pc/tag/tagModifyAjax
     * @apiName 태그 수정
     * @apiGroup Tag
     *
     * @apiParam TAG_ID 태그 아이디
     * @apiParam TAG_STATUS 태그 사용 여부
     *
     * @apiSuccess {JSON} RESULT_CODE 200
     * @apiSuccess {JSON} RESULT_MESSAGE 성공했습니다
     * 
     * @apiError {JSON} RESULT_CODE 400
     */
    @RequestMapping("/pc/tag/tagModifyAjax")
    public JSON tagModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        String id = commandMap.get(TAG_MODEL.TAG_MST_ID).toString();
        String status = commandMap.get(TAG_MODEL.TAG_MST_STATUS).toString();
        
        commandMap.put(TAG_MODEL.TAG_MST_ID, id);
        commandMap.put(TAG_MODEL.TAG_MST_STATUS, status);
        
        String result = tagService.updateTagInfo(commandMap);
        
        if(result == SERVICE_RESULT_CODE.SERVICE_FAIL){
        	json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
        	json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.FAIL_MSG);
            return json;
        }
        
        json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.SUCCESS_MSG);
        
        return json;
    }

}
