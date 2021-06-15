package com.market.mall.am.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.board.service.NoticeBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.board.controller
 * @FileName : NoticeBoardController.java
 * @Date : 2014. 6. 7.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 공지사항을 처리하는 Controller Class
 * @author kanghk
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class NoticeBoardController {

    @Resource(name="noticeBoardService") 
    private NoticeBoardService noticeBoardService;    
    
    @Resource(name="commonService")
    private CommonService commonService;
        
    
    /**
    * <pre>
    * 1. MethodName : noticeBoardList
    * 2. ClassName  : NoticeBoardController.java
    * 3. Comment    : 관리자 > 게시판 관리 > 공지사항 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/noticeBoardList")
    public ModelAndView noticeBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //상단공지 리스트 먼저 가져오기
        commandMap.put("BRD_NTS_TOP_YN", "Y");
        List<Map<String, Object>> topList = this.noticeBoardService.selectNoticeBoardList(commandMap);
        
        // 공지사항 목록 갯수
        commandMap.put("BRD_NTS_TOP_YN", "N");
        int totalCount = this.noticeBoardService.selectNoticeBoardListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        if (totalCount > 0){
            // 공지사항 목록
            list = this.noticeBoardService.selectNoticeBoardList(commandMap);
        }
        
        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("COMMON_NOTICE_TYPE"));
        
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("topList", topList);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : noticeBoardForm
    * 2. ClassName  : NoticeBoardController.java
    * 3. Comment    : 설명추가부분관리자 > 게시판 관리 > 공지사항 등록 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/noticeBoardForm")
    public ModelAndView noticeBoardForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("COMMON_NOTICE_TYPE"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
            
    /**
    * <pre>
    * 1. MethodName : noticeBoardEdit
    * 2. ClassName  : NoticeBoardController.java
    * 3. Comment    : 설명추가부분관리자 > 게시판 관리 > 공지사항 수정 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/noticeBoardEdit")
    public ModelAndView noticeBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_NTS_IDX"), "")))
        {
            // 공지사항 상세정보
        	Map<String, Object> resultMap = this.noticeBoardService.selectNoticeBoardInfo(commandMap);
            mv.addObject("row", resultMap.get("row"));
            mv.addObject("fileList", resultMap.get("fileList"));
        }

        // 구분 코드 리스트
        mv.addObject("codeList", this.commonService.selectCode("COMMON_NOTICE_TYPE"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : noticeBoardRegist
    * 2. ClassName  : NoticeBoardController.java
    * 3. Comment    : 설명추가부분관리자 > 게시판 관리 > 공지사항 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/noticeBoardRegist")
    public ModelAndView noticeBoardRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 공지사항 등록
        int result = this.noticeBoardService.insertNoticeBoard((MultipartHttpServletRequest)request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/noticeBoardList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/noticeBoardList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : noticeBoardModify
    * 2. ClassName  : NoticeBoardController.java
    * 3. Comment    : 설명추가부분관리자 > 게시판 관리 > 공지사항 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/noticeBoardModify")
    public ModelAndView noticeBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_NTS_IDX"), "")))
        {
         // 공지사항 수정
            int result = this.noticeBoardService.updateNoticeBoard((MultipartHttpServletRequest)request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/noticeBoardList.do");
                
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/noticeBoardList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : noticeBoardTopCountAjax
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 관리자 > 게시판 관리 > 상단공지 사용 가능 유무
     * 4. 작성자       : kimsy
     * 5. 작성일       : 2015. 3. 16.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/board/noticeBoardTopCountAjax")
     public JSON noticeBoardTopCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         JSON json = new JSON();
         
         int result = this.noticeBoardService.selectNoticeBoardTopCount(commandMap);
         
         if(result > 5)
         {
             json.put("resultYn", "N");           
         }
         else if(result == 5)
         {
        	 json.put("resultYn", "F");		//FULL
         }
         else 
         {
             json.put("resultYn", "Y");	
         }
         return json;
     }
     
     
}
