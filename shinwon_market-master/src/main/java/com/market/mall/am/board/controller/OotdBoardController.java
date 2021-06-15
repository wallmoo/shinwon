package com.market.mall.am.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.board.service.OotdBoardCommentService;
import com.market.mall.am.board.service.OotdBoardService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.pc.tag.service.TagService;
import com.market.mall.pc.tag.service.WishTagService;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class OotdBoardController {
	
    @Resource(name="ootdBoardService") private OotdBoardService ootdBoardService;
    
    @Resource(name="ootdBoardCommentService") private OotdBoardCommentService ootdBoardCommentService;
    
    @Resource(name="wishTagService") private WishTagService wishTagService;
    
    @Autowired
    TagService tagService;
    
    /**
     * @api {POST} /am/board/ootdBoardList.do
     * @apiName OOTD 관리 목록
     * @apiGroup 고객센터 
     * 
     * @apiParam {String} searchMemNm OOTD 작성자
     * @apiParam {String} searchMemID OOTD 작성자 ID
     * @apiParam {String} searchKeyword OOTD 검색 키워드
     * @apiParam {String} searchStatus OOTD 전시 상태
     * @apiParam {String} searchStartDate 검색 시작일
     * @apiParam {String} searchEndDate 검색 종료일
     * 
     * @apiSuccess {Object[]} OOTD_DATA_LIST OOTD 목록 리스트
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping("/am/board/ootdBoardList")
    public ModelAndView ootdBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();
        
        int totalCount = this.ootdBoardService.selectOOTDBoardListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject(RESPONSE_KEY.PAGING, paging);
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> ootdBoardList = null;
        if(totalCount > 0)
        {
            ootdBoardList = ootdBoardService.selectOOTDBoardList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject(RESPONSE_KEY.OOTD_DATA_LIST, ootdBoardList);
        mv.addObject(RESPONSE_KEY.COMMAND_MAP, commandMap);
        
        return mv;
    }
    
    @RequestMapping("/am/board/ootdBoardEdit")
    public ModelAndView ootdBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView();
        commandMap.put("cPage", StringUtil.getString(commandMap.get("cPage"), "1"));
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            Map<String, Object> resultMap = this.ootdBoardService.selectOOTDBoardInfo(commandMap);  // OOTD 관리 상세정보
            
            mv.addObject("row",resultMap.get("row")); // 기본 정보
            mv.addObject("fileList", resultMap.get("fileList"));  // 첨부파일 목록
            mv.addObject("ootdProductList", resultMap.get("ootdProductList")); // 상품구성 목록
            mv.addObject("tagList", resultMap.get("tagList")); //OOTD 등록 태그 리스트
            mv.addObject("wishTagList", resultMap.get("wishTagList")); //OOTD 등록 희망태그 리스트
            
            int totalCount = this.ootdBoardCommentService.selectOOTDCommentListCount(commandMap);
            Paging paging = new Paging(totalCount, commandMap);
            mv.addObject("paging", paging);
            if(totalCount>0) {
            	mv.addObject("commentList", this.ootdBoardCommentService.selectOOTDCommentList(commandMap));
            }
        }
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * @api {POST} /am/board/ootdModify.do
     * @apiName OOTD 수정 처리
     * @apiGroup 고객센터 
     * 
     * @apiParam {String} CNT_MST_IDX OOTD 관리 IDX
     * @apiParam {String} CNT_MST_TITLE OOTD 제목
     * @apiParam {String} CNT_MST_DESC OOTD 내용
     * @apiParam {String[]} file_del_idx OOTD 첨부파일 삭제 IDX
     * @apiParam {File} file OOTD 새로 추가된 첨부 파일리스트
     * @apiParam {String[]} PRD_MST_CD OOTD 등록 상품코드 배열
     * @apiParam {JSON} tagData  OOTD태그  [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}]
     * @apiParam {String} WSH_TAG_TITLE_LIST  희망태그 문자열
     * 
     * @apiSuccess {String} alertMsg 수정 성공/실패 메세지 
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping("/am/board/ootdBoardModify")
    public ModelAndView ootdModify(MultipartHttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        commandMap.put("CNT_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("CNT_MST_UPD_ID", admin.getADM_MST_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
            // 관리자 수정
            int result = this.ootdBoardService.updateOOTD(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/ootdBoardList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/ootdBoardList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
}
