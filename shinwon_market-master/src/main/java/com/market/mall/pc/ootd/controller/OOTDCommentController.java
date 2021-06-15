package com.market.mall.pc.ootd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.code.SERVICE_RESULT_CODE;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.ootd.service.OOTDCommentService;

@Controller("pcOOTDCommentController")
public class OOTDCommentController {
    
    @Resource(name="pcOOTDCommentService") private OOTDCommentService pcOOTDCommentService;
    
    /**
     * @api {POST} /pc/ootd/commentRegistAjax
     * @apiName OOTD 댓글 등록Ajax
     * @apiGroup OOTD
     * 
     * @apiParam {String} CNT_MST_IDX OOTD 관리 IDX
     * @apiParam {String} OTD_RPL_REF_ID OOTD 상위 댓글 IDX
     * @apiParam {String} OTD_RPL_CTS 댓글내용
     * 
     * @apiSuccess {JSON} commentIdx 댓글IDX
     * @apiSuccess {JSON} RESULT_CODE 결과 성공=200, 실패=400
     */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/commentRegistAjax")
    public JSON commentRegistAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        User user = SessionsUser.getSessionUser(request);
        
        String commentIdx = "";
        String alertMsg = "";
        
        if(!SessionsUser.isLogin(request))
        {
            alertMsg = "로그인 후 글을 남길 수 있습니다.";
            
            json.put("alertMsg", alertMsg);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
            
            return json;
        }
        commandMap.put("OTD_RPL_REG_IP", request.getRemoteAddr());
        commandMap.put("OTD_RPL_REG_ID", user.getMEM_MST_MEM_ID());
        
        commentIdx = this.pcOOTDCommentService.insertOOTDComment(commandMap);
        
        if (!"".equals(commentIdx))
        {
            json.put("commentIdx", commentIdx);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        }
        else
        {
            alertMsg = "댓글 등록에 실패했습니다.";
            json.put("alertMsg", alertMsg);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
        }
        
        return json;    
    }
    
    /**
     * @api {POST} /pc/ootd/commentListAjax
     * @apiName OOTD 댓글 리스트 Ajax
     * @apiGroup OOTD
     * 
     * @apiParam {String} CNT_MST_IDX OOTD관리IDX
     * 
     * @apiSuccess {JSON} resultMap   {commentList=[{OTD_RPL_USE_YN=Y, CNT_OTD_ID=145, OTD_RPL_REG_DT=2020-05-05 06:51:05, OTD_RPL_REG_IP=0:0:0:0:0:0:0:1, OTD_RPL_ID=1, OTD_RPL_REG_ID=pure0311}, {OTD_RPL_USE_YN=Y, OTD_RPL_REF_ID=2, CNT_OTD_ID=145, OTD_RPL_REG_DT=2020-05-05 06:56:53, OTD_RPL_REG_IP=0:0:0:0:0:0:0:1, OTD_RPL_ID=3, OTD_RPL_REG_ID=pure0311}, {OTD_RPL_USE_YN=Y, CNT_OTD_ID=145, OTD_RPL_REG_DT=2020-05-05 06:54:31, OTD_RPL_REG_IP=0:0:0:0:0:0:0:1, OTD_RPL_ID=2, OTD_RPL_REG_ID=wowjr}], reqPaging=com.market.mall.model.Paging@2b20e1cf}
     */
    @RequestMapping("/pc/ootd/commentListAjax")
    public JSON commentListAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        Map resultMap       = new HashMap();
        
        commandMap.put("pageSize", 10);
        
        int totalCount = this.pcOOTDCommentService.selectOOTDCommentListCount(commandMap);
        Paging paging       = new Paging(totalCount, commandMap);
        
        resultMap.put("commentList", this.pcOOTDCommentService.selectOOTDCommentList(commandMap));
        
        resultMap.put("reqPaging",      paging);
        
        json.addObject("resultMap",                resultMap);
        json.addObject("firstpageno",              paging.getFirstPageNo());
        json.addObject("firstPageNoOnPageList",    paging.getFirstPageNoOnPageList()); // 페이지 리스트의 첫 페이지번호
        json.addObject("totalPageCount",           paging.getTotalPageCount());
        json.addObject("lastPageNoOnPageList",     paging.getLastPageNoOnPageList()); // 페이지 리스트의 마지막 페이지번호
        json.addObject("cPage",                    paging.getcPage());
        json.addObject("lastPageNo",               paging.getLastPageNo());
        json.addObject("pageSize",                 paging.getPageSize()); // 페이지 리스트에 표시할 레코드 개수
        json.addObject("pagingSize",               paging.getPagingSize()); // 페이지 영역에 표시할 페이지 개수
        json.addObject("listNum",                  paging.getListNum());
        json.addObject("totalRecordCount",         paging.getTotalRecordCount());
        
        return json;    
    }
    
    
    /**
     * @api {POST} /pc/ootd/commentDeleteAjax
     * @apiName OOTD 댓글 삭제 Ajax
     * @apiGroup OOTD
     * 
     * @apiParam {String} OTD_RPL_ID OOTD 댓글 IDX
     * @apiParam {String} CNT_MST_IDX OOTD 관리 IDX
     * 
     * @apiSuccess {JSON} RESULT_CODE 결과 성공=200, 실패=400
     */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/commentDeleteAjax")
    public JSON commentDeleteAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        User user = SessionsUser.getSessionUser(request);
        int result = 0;
        String alertMsg = "";
        
        if(!SessionsUser.isLogin(request))
        {
            alertMsg = "로그인 후 글을 삭제 할  있습니다.";
            
            json.put("alertMsg", alertMsg);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
            
            return json;
        }
        commandMap.put("OTD_RPL_REG_IP", request.getRemoteAddr());
        commandMap.put("OTD_RPL_REG_ID", user.getMEM_MST_MEM_ID());
        
        //본인 댓글이 맞는지 체크
        int commentCheckCnt = this.pcOOTDCommentService.selectOOTDCount(commandMap);
        if(commentCheckCnt > 0)
        {
            //OOTD 댓글 삭제
            result = this.pcOOTDCommentService.deleteOOTDComment(commandMap);
            
            if(result > 0)
            {
                json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
            }
        }

        
        return json;    
    }
    
    /**
     * @api {POST} /pc/ootd/commentUpdateAjax
     * @apiName OOTD 댓글 수정 Ajax
     * @apiGroup OOTD
     * 
     * @apiParam {String} OTD_RPL_ID OOTD 댓글 IDX
     * @apiParam {String} CNT_MST_IDX OOTD 관리 IDX
     * @apiParam {String} OTD_RPL_CTS OOTD 댓글 내용
     * @apiParam {String} OTD_RPL_REF_ID OOTD 상위 댓글 ID
     * 
     * @apiSuccess {JSON} RESULT_CODE 결과 성공=200, 실패=400
     */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/commentUpdateAjax")
    public JSON commentUpdateAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        User user = SessionsUser.getSessionUser(request);
        int result = 0;
        String alertMsg = "";
        
        if(!SessionsUser.isLogin(request))
        {
            alertMsg = "로그인 후 글을 수정 할  있습니다.";
            
            json.put("alertMsg", alertMsg);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
            
            return json;
        }
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        commandMap.put("CNT_OTD_ID", commandMap.get("CNT_MST_IDX"));
        
        commandMap.put("OTD_RPL_UPD_IP", request.getRemoteAddr());
        commandMap.put("OTD_RPL_UPD_ID", user.getMEM_MST_MEM_ID());
        
        //본인 댓글이 맞는지 체크
        int commentCheckCnt = this.pcOOTDCommentService.selectOOTDCount(commandMap);
        
        if(commentCheckCnt > 0)
        {
            //OOTD 댓글 수정
            result = this.pcOOTDCommentService.updateOOTDComment(commandMap);
            
            if(result > 0)
            {
                json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
            }
        }

        return json;    
    }
}
