package com.market.mall.am.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.board.service.FaqBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class FaqBoardController {

    @Resource(name="faqBoardService")
    private FaqBoardService faqBoardService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
    * <pre>
    * 1. MethodName : faqBoardList
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/faqBoardList")
    public ModelAndView faqBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // faq 관리 목록 갯수
        int totalCount = this.faqBoardService.selectFaqBoardListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
        mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        
        List<Map<String, Object>> list = null;
        
        if (totalCount > 0){
            list = this.faqBoardService.selectFaqBoardList(commandMap);
        }
                
        // 브랜드 유형 리스트
        String[] codes = {"FAQ_INQUIRY_TYPE_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        mv.addObject("totalCount", totalCount);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : faqBoardForm
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 등록 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/faqBoardForm")
    public ModelAndView faqBoardForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 브랜드 유형 리스트
        String[] codes = {"FAQ_INQUIRY_TYPE_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : faqBoardEdit
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 수정 폼 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/faqBoardEdit")
    public ModelAndView faqBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_FAQ_IDX"), "")))
        {
        	// faq 유형 관련 idx값 가져오기 위해
        	commandMap.put("CMN_COM_TOP_IDX", Code.FAQ_INQUIRY_TYPE_CODE);

            // faq 관리 상세정보
            mv.addObject("row", this.faqBoardService.selectFaqBoardInfo(commandMap));
        }
        
        // 브랜드 유형 리스트
        String[] codes = {"FAQ_INQUIRY_TYPE_CODE"};
        mv.addObject("codes", this.commonService.selectCodes(codes));
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : faqBoardOftenTopCountAjax
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 자주사용하는 FAQ 사용 가능 유무 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/faqBoardOftenTopCountAjax")
    public JSON faqBoardOftenTopCountAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        int result = this.faqBoardService.selectFaqBoardOftenTopCount(commandMap);
        
        if(result > 5)
        {
            json.put("resultYn", "N");
        }
        else if(result == 5)
        {
        	json.put("resultYn", "F");
        }
        else 
        {
            json.put("resultYn", "Y");
        }
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : faqBoardRegist
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 등록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/faqBoardRegist")
    public ModelAndView faqBoardRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 관리자 관리 관리자 등록
        int result = this.faqBoardService.insertFaqBoard(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/faqBoardList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/faqBoardList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : faqBoardModify
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : 관리자 >  게시판 관리 > FAQ 관리 수정 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 6. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/faqBoardModify")
    public ModelAndView faqBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_FAQ_IDX"), "")))
        {        	
            // 관리자 관리 관리자 수정
            int result = this.faqBoardService.updateFaqBoard(request, commandMap);
            
            // view Page Info
            if(result > 0)
            {
                mv.addObject("alertMsg", "수정 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/faqBoardList.do");
            }
            else
            {
                mv.addObject("alertMsg", "수정에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/faqBoardList.do");
            }
            mv.addObject("commandMap", commandMap);
            mv.setViewName("/am/common/result");
        }
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : getFaqCategoryListAjax
    * 2. ClassName  : FaqBoardController.java
    * 3. Comment    : FAQ 카테고리 리스트 불러오기
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 3. 26.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/board/getFaqCategoryListAjax")
    public JSON getFaqCategoryListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
    	
    	List<Map<String, Object>> categoryList = this.faqBoardService.selectFaqCategoryList(commandMap);
    	
    	json.addObject("categoryList", categoryList);
    	
    	return json;
    }
}
