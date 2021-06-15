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
import com.market.mall.am.board.service.AgreementBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Admin.ROLEADMIN;

/**
 * @PackageName: com.market.mall.am.board.controller
 * @FileName : AgreementBoardController.java
 * @Date : 2016. 8. 17.
 * @프로그램 설명 : 이용약관 관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class AgreementBoardController {
	
	 @Resource(name="agreementBoardService")
	    private AgreementBoardService agreementBoardService;
	 
	    @Resource(name="commonService")
	    private CommonService commonService;
	
	    /**
	 * <pre>
	 * 1. MethodName : agreementBoardList
	 * 2. ClassName  : AgreementBoardController.java
	 * 3. Comment    : 이용약관 리시트
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/board/agreementBoardList")
    public ModelAndView agreementBoardList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //이용약관 리스트
        List<Map<String, Object>> list =  this.agreementBoardService.selectAgreementList(commandMap);
        
        //이용약관 구분 리스트
        mv.addObject("codeList", this.commonService.selectCode("AGREEMENT_BOARD_TYPE_CODE"));
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        return mv;
    }
	
	/**
	 * <pre>
	 * 1. MethodName : agreementBoardForm
	 * 2. ClassName  : AgreementBoardController.java
	 * 3. Comment    : 이용약관 등록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/board/agreementBoardForm")
    public ModelAndView agreementBoardForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //이용약관 구분 리스트
        mv.addObject("codeList", this.commonService.selectCode("AGREEMENT_BOARD_TYPE_CODE"));
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
	
	/**
	 * <pre>
	 * 1. MethodName : agreementBoardEdit
	 * 2. ClassName  : AgreementBoardController.java
	 * 3. Comment    : 이용약관 수정 폼
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/board/agreementBoardEdit")
    public ModelAndView agreementBoardEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Map<String, Object> resultMap = this.agreementBoardService.selectAgreementInfo(commandMap);
        
        //이용약관 정보
        mv.addObject("info", resultMap.get("info"));
        
        //해당 이용약관 정보에 대한 히스토리 리스트
        mv.addObject("historyList", resultMap.get("historyList"));
        
        //이용약관 구분(TYPE) 리스트
        mv.addObject("codeList", this.commonService.selectCode("AGREEMENT_BOARD_TYPE_CODE"));
        
        mv.addObject("commandMap", commandMap);
        return mv;
    }
	

	/**
	 * <pre>
	 * 1. MethodName : agreementBoardRegist
	 * 2. ClassName  : AgreementBoardController.java
	 * 3. Comment    : 이용약관 등록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/board/agreementBoardRegist")
    public ModelAndView agreementBoardRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //이용약관 등록
        int result = this.agreementBoardService.insertAgreementBoard(request, commandMap);
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/agreementBoardList.do");
            
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/agreementBoardList.do");
        }
        mv.setViewName("/am/common/result");
        return mv;
    }
	
    /**
     * <pre>
     * 1. MethodName : agreementBoardModify
     * 2. ClassName  : AgreementBoardController.java
     * 3. Comment    : 이용약관 수정
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/board/agreementBoardModify")
    public ModelAndView agreementBoardModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        int result = 0;
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_AGR_IDX"), "")))
        {
            result = this.agreementBoardService.updateAgreementBoard(request, commandMap);
        }
        
        // view Page Info
        if(result > 0)
        {
            mv.addObject("alertMsg", "수정 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/agreementBoardList.do");
        }
        else
        {
            mv.addObject("alertMsg", "수정에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/board/agreementBoardList.do");
        }
        mv.addObject("commandMap", commandMap);
        mv.setViewName("/am/common/result");
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : agreementBoardTypeAjax
     * 2. ClassName  : AgreementBoardController.java
     * 3. Comment    : 유형선택시 이미 등록된 유형인지 체크
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/am/board/agreementBoardTypeAjax")
    public JSON agreementBoardTypeAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("BRD_AGR_TYPE"), "")))
        {
        	Map<String, Object> resultMap = this.agreementBoardService.selectAgreementBoardTypeCnt(commandMap);
    		if ( resultMap != null )
    		{
        		json.put("cnt", StringUtil.getString(resultMap.get("cnt")));
    		}
        }
        return json;
    }

}
