package com.market.mall.am.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import com.market.mall.am.board.service.OotdBoardCommentService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.pc.tag.service.TagService;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OotdBoardCommentController {
	
    @Resource(name="ootdBoardCommentService") private OotdBoardCommentService ootdBoardCommentService;
    
    @Autowired
    TagService tagService;
    
    /**
     * @api {POST} /am/board/commentListAjax
     * @apiName OOTD 댓글 리스트 Ajax
     * @apiGroup 고객센터
     * 
     * @apiParam {String} CNT_MST_IDX OOTD관리IDX
     * 
     * @apiSuccess {JSON} resultMap   {commentList=[{OTD_RPL_USE_YN=Y, CNT_OTD_ID=145, OTD_RPL_REG_DT=2020-05-05 06:51:05, OTD_RPL_REG_IP=0:0:0:0:0:0:0:1, OTD_RPL_ID=1, OTD_RPL_REG_ID=pure0311}, {OTD_RPL_USE_YN=Y, OTD_RPL_REF_ID=2, CNT_OTD_ID=145, OTD_RPL_REG_DT=2020-05-05 06:56:53, OTD_RPL_REG_IP=0:0:0:0:0:0:0:1, OTD_RPL_ID=3, OTD_RPL_REG_ID=pure0311}, {OTD_RPL_USE_YN=Y, CNT_OTD_ID=145, OTD_RPL_REG_DT=2020-05-05 06:54:31, OTD_RPL_REG_IP=0:0:0:0:0:0:0:1, OTD_RPL_ID=2, OTD_RPL_REG_ID=wowjr}], reqPaging=com.market.mall.model.Paging@2b20e1cf}
     */
    @RequestMapping("/am/board/commentListAjax")
    public ModelAndView commentListAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
    	ModelAndView mv = new ModelAndView();        
        
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        int totalCount = this.ootdBoardCommentService.selectOOTDCommentListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap);
        
        List<Map<String, Object>> commentList = this.ootdBoardCommentService.selectOOTDCommentList(commandMap);
        mv.addObject("commentList", commentList);        
        mv.addObject("paging", paging);
        mv.setViewName("/am/board/ootdBoardCommentList");
        return mv;
    }
    
    /**
     * @api {POST} /am/board/commentRegistAjax
     * @apiName OOTD 댓글 등록Ajax
     * @apiGroup 고객센터
     * 
     * @apiParam {String} CNT_MST_IDX OOTD 관리 IDX
     * @apiParam {String} OTD_RPL_REF_ID OOTD 상위 댓글 IDX
     * @apiParam {String} OTD_RPL_CTS 댓글내용
     * 
     * @apiSuccess {JSON} OTD_RPL_ID 댓글ID
     * @apiSuccess {JSON} RESULT_CODE 결과 성공=200, 실패=400
     */
    @RequestMapping("/am/board/commentRegistAjax")
    public JSON commentRegistAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        String commentIdx = "";
        String alertMsg = "";
        
        commandMap.put("OTD_RPL_REG_IP", request.getRemoteAddr());
        commandMap.put("OTD_RPL_REG_ID", admin.getADM_MST_ID());

        commentIdx = this.ootdBoardCommentService.insertOOTDComment(commandMap);
        
        if (!"".equals(commentIdx))
        {
            alertMsg = "댓글이 등록되었습니다.";
            json.put("OTD_RPL_ID", commentIdx);
            json.put("alertMsg", alertMsg);
            json.put("MEM_MST_NCK_NM", admin.getADM_MST_NM());
            json.put("OTD_RPL_REG_ID", admin.getADM_MST_ID());
            json.put("OTD_RPL_USE_YN", "Y");
            json.put("OTD_RPL_CTS", StringUtil.getString(commandMap.get("OTD_RPL_CTS")));
            json.put("OTD_RPL_REF_ID",StringUtil.getString(commandMap.get("OTD_RPL_REF_ID")));
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
     * @api {POST} /am/board/commentUpdateAjax
     * @apiName OOTD 댓글 수정 Ajax
     * @apiGroup 고객센터
     * 
     * @apiParam {String} OTD_RPL_ID OOTD 댓글 IDX
     * @apiParam {String} CNT_MST_IDX OOTD 관리 IDX
     * @apiParam {String} OTD_RPL_CTS OOTD 댓글 내용
     * @apiParam {String} OTD_RPL_REF_ID OOTD 상위 댓글 ID
     * 
     * @apiSuccess {JSON} RESULT_CODE 결과 성공=200, 실패=400
     */
    
    @RequestMapping("/am/board/commentUpdateAjax")
    public JSON commentUpdateAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
    {
        JSON json = new JSON();
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0;
        String alertMsg = "";
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
        commandMap.put("arrOTD_RPL_ID", mapper.readValue(commandMap.get("arrOTD_RPL_ID").toString(),typeRef));
        commandMap.put("OTD_RPL_UPD_IP", request.getRemoteAddr());
        commandMap.put("OTD_RPL_UPD_ID", admin.getADM_MST_ID());
        
        
        //OOTD 댓글 미사용 처리
        result = this.ootdBoardCommentService.updateOOTDCommentStatus(commandMap);
        
        if(result > 0)
        {
            alertMsg = "미사용 처리 되었습니다.";
            json.put("alertMsg", alertMsg);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        }
        else
        {
            alertMsg = "수정 실패하였습니다.";
            json.put("alertMsg", alertMsg);
            json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
        }

        return json;    
    }
    
}
