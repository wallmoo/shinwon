package com.market.mall.pc.tag.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.kicc.common.Util;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.model.User;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.tag.WSH_TAG_MODEL;
import com.market.mall.pc.tag.service.WishTagService;
import com.market.util.ResponseCodeUtil;

@Controller
public class WishTagUserController {

	@Autowired
	WishTagService wishTagService;
	
	/**
	 * @api {POST} /pc/tag/registWishTagAjax.do
	 * @apiName 희망 태그 등록
	 * @apiGroup 희망 태그
	 * 
	 * @apiParam {String[]} WSH_TAG_TITLE_LIST 태그 제목 리스트
	 * 
	 * @apiSuccess {Object} RESULT_CODE 200 JSON
	 * @apiError {Object} RESULT_CODE 400 JSON
	 */
	
	@RequestMapping("/pc/tag/registWishTagAjax.do")
	public JSON registWishTagAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
	{
	    JSON json = new JSON();
	    User user = SessionsUser.getSessionUser(request);
	    
//	    if(!SessionsUser.isLogin(request) ){
//	        result.put(Code.RESULT_CODE, VALIDATE_CODE.REQUIRE_SESSION+"");
//	        return ResponseCodeUtil.setFailStatus(RESPONSE_MESSAGE.FAIL_MSG);
//	    }
	    
//	    int validateResult = WSH_TAG_MODEL.insertValidate(commandMap);
	    
	    //if(validateResult != 200){
	    //    return ResponseCodeUtil.setFailStatus(result, RESPONSE_MESSAGE.FAIL_MSG);
	    //}
	    // List<String> titleList = (List<String>)commandMap.get(PARAM_WSH_TAG_CONST.WHS_TAG_TITLE_LIST);
	    
	    //List<String> tagTitleList = TAG_MODEL.parse(commandMap);
	    commandMap.put(WSH_TAG_MODEL.REG_ID, StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),"guest"));
        
	    List<String> idList =  wishTagService.insertWithTagList(commandMap);
	    if(idList == null || idList.size() == 0) {
	    	json.addObject(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
	    	return json;
	    }
	   
	    json.addObject(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        return json;
	}
	
	
	
}
