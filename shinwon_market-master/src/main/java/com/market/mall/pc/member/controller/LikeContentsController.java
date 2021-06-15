package com.market.mall.pc.member.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.member.LIKE_MODEL;
import com.market.mall.pc.member.service.LikeContentsService;

@Controller("pcLikeContentsController")
public class LikeContentsController {
    
    @Resource(name="pcLikeContentsService")    
    LikeContentsService likeContentsService;
    
    
    /**
     * @api {POST} /pc/member/likeContentsAjax
     * @apiName Member 사용자 콘텐츠 좋아요
     * @apiGroup Member
     * @apiParam {String} CNT_MST_TYPE contens 타입  상품=TYPE_PRODUCT, 셀러픽=TYPE_SELLER_PICK, OOTD=TYPE_OOTD, 펀딩=TYPE_FUNDING, 기획전=TYPE_PLAN, 채널ON=TYPE_CHANNEL_ON
     * @apiParam {String} CNT_MST_ID contens 아이디
     * @apiParam {String} MEM_MST_ID 사용자 아이디
     * @apiParam {String} LIKE_YN 좋아요 여부 좋아요=Y, 안좋아요=N
     * 
     * @apiSuccess {String} RESULT_CODE 결과 성공=200, 실패=400
     * @apiSuccess {String} LIKE_TOTAL 3
     */
    @FrontBannerSkip
    @RequestMapping("/pc/member/likeContentsAjax")
    public JSON likeContentsAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        
        if(!SessionsUser.isLogin(request))
        {
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
            return json;
        }
        
        commandMap.put(LIKE_MODEL.MEM_MST_ID, SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID());
        commandMap.put(LIKE_MODEL.LIK_HIS_REG_IP, request.getRemoteAddr());
        
        String serviceResult = SERVICE_RESULT_CODE.SERVICE_FAIL;
        if("Y".equals(commandMap.get(LIKE_MODEL.LIKE_YN))){
            serviceResult = likeContentsService.insertLikeContents(commandMap);
        }
        else{
            serviceResult = likeContentsService.deleteLikeContents(commandMap);
        }
        
        
        if(SERVICE_RESULT_CODE.SERVICE_FAIL.equals(serviceResult)){
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
            return json;
        }
        
        int likeCounts = likeContentsService.selectLikeContentsCount(commandMap);
        
        json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        json.put(RESPONSE_KEY.LIKE_TOTAL, StringUtil.getString(likeCounts));
        
        return json;    
    }
}
