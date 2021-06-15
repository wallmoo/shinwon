package com.market.mall.am.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.board.service.CommentBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.board.controller
 * @FileName : CommentBoardController.java
 * @Date : 2014. 6. 8.
 * @프로그램 설명 : 관리자 > 게시판관리 > 상품리뷰관리를 처리하는 Controller Class
 * @author kanghk
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class CommentBoardController {

    @Resource(name="commentBoardService")
    private CommentBoardService commentBoardService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    /**
    * <pre>
    * 1. MethodName : basicManagerList
    * 2. ClassName  : CommentBoardController.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/commentBoardList")
    public ModelAndView commentBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        if(!searchPrdMstCd.isEmpty()) {
        	String[] arrSearchPrdMstCd = searchPrdMstCd.split("\\r?\\n");
        	commandMap.put("arrSearchPrdMstCd", arrSearchPrdMstCd);
        }
        
        // 상품 리뷰 관리 목록 갯수
        int totalCount = this.commentBoardService.selectCommentBoardListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            
            // 상품 리뷰 관리 목록
            list = this.commentBoardService.selectCommentBoardList(commandMap);
        }
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : commentBoardEdit
    * 2. ClassName  : CommentBoardController.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 상세정보 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/commentBoardEdit")
    public ModelAndView commentBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("PRD_REV_IDX"), "")))
        {
            Map<String, Object> resultMap = this.commentBoardService.selectCommentBoardInfo(commandMap);

            // 첨부파일 정보
            mv.addObject("fileList", resultMap.get("fileList"));
            
            //상세정보
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("commandMap", commandMap);
        }
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : commentBoardModify
    * 2. ClassName  : CommentBoardController.java
    * 3. Comment    : 관리자 > 게시판 관리 > 상품리뷰 관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/commentBoardModify")
    public ModelAndView commentBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = 0;
        if(!"".equals(StringUtil.getString(commandMap.get("PRD_REV_IDX"), "")))
        {
            result = this.commentBoardService.updateCommentBoard(request, commandMap);
        }
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/commentBoardList.do");
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/commentBoardList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    @RequestMapping("/am/board/commentBoardListExcelDownload")
    public ModelAndView commentBoardListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

    	// 관리자 입점업체 IDX(SCM용)
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int ADM_MST_SUB_IDX = Integer.valueOf(StringUtil.getString(admin.getADM_MST_SUB_IDX(),"-1"));
        if(ADM_MST_SUB_IDX > 0){ //입점업체 관리자인 경우
        	commandMap.put("searchVdrMstIdx", admin.getADM_MST_SUB_IDX()); //입점업체 idx
        }
        int totalCount = this.commentBoardService.selectCommentBoardListCount(commandMap);

        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
    	String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        
        commandMap.put("excelDown", "Y");
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "productReviewList_"+DateUtil.getToday();

        	 String [] rowTitle = { "상품코드","상품명","작성자","후기내용","상품평점","만족도평가-사이즈","만족도평가-컬러","등록일","상태여부","베스트리뷰여부"};      
             String [] cellSize = { "50","100","50","100","50","50","50","50","50","50"};
           	 String [] dataName = { "PRD_PRD_MST_CD","PRD_MST_NM", "MEM_MST_MEM_NM","PRD_REV_CONTENTS","PRD_REV_STAR", "PRD_REV_SIZE","PRD_REV_CLR","PRD_REV_REG_DT", "PRD_REV_USE_YN","PRD_REV_BST_YN"};
             String [] dataType = { "String","String","String","String","Number","String","String","String","String","String","Date","String","String"};
             
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
        	list = this.commentBoardService.selectCommentBoardList(commandMap);
        	for(int i=0;i<list.size();i++) {
        		if(list.get(i).get("PRD_REV_SIZE") == "A")
        			list.get(i).put("PRD_REV_SIZE", "작아요");
        		else if(list.get(i).get("PRD_REV_SIZE") == "B")
        			list.get(i).put("PRD_REV_SIZE", "정사이즈");
        		else
        			list.get(i).put("PRD_REV_SIZE", "커요");
        		
        		if(list.get(i).get("PRD_REV_CLR") == "A")
        			list.get(i).put("PRD_REV_CLR", "화면과 같아요");
        		else
        			list.get(i).put("PRD_REV_CLR", "화면과 달라요");
        	}
        	if(list != null){
                // 상품후기 목록 엑셀 다운로드
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
}
