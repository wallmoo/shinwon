package com.market.mall.pc.customer.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.FaqBoardService;

/**
 * @PackageName: com.market.mall.pc.customer.controller
 * @FileName : FaqBoardController.java
 * @Date : 2014. 7. 24.
 * @프로그램 설명 : 프론트 > 고객센터 FAQ를 처리하는 Controller Class
 * @author kanghk
 */
@Controller("pcFaqBoardController")
public class FaqBoardController {
	
	@Resource(name="pcFaqBoardService")
    private FaqBoardService pcFaqBoardService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : faqBoardList
	 * 2. ClassName : FaqBoardController.java
	 * 3. Comment : faq 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/customer/faqBoardList")
    public ModelAndView faqBoardList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String faqCode	= "3156";
        
        // FAQ 좌측 하위 카테고리 목록
        mv.addObject("fqaCodeList", this.pcFaqBoardService.selectFaqCodeList(faqCode));
        
        String strCmnComUpIdx 	= StringUtil.getString(commandMap.get("CMN_COM_UP_IDX"),"");	// 하위 카테고리에서 클릭한 값
        String strCmnComIdx		= StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""); 		// 좌측 lnb 에서 클릭한 값
        commandMap.put("searchBrdCmnComUpIdx", strCmnComUpIdx);
        // FAQ 하위 코드 목록 
        //mv.addObject("lowCodeList", this.pcFaqBoardService.selectFaqCodeList(strCmnComIdx));
        /*
        if(!"".equals(strCmnComIdx)){
        	commandMap.put("searchBrdCmnComUpIdx", strCmnComIdx);
        }
        
        if(!"".equals(strCmnComUpIdx)){
        	commandMap.put("searchBrdCmnComIdx", strCmnComUpIdx);
        }
        */
        // FAQ 목록 갯수
        commandMap.put("pageSize", "10");
        int totalCount 			= this.pcFaqBoardService.selectFaqBoardListCount(commandMap);
        Paging paging 			= new Paging(totalCount, commandMap); 
        
        //mv.addObject("cateName", this.pcFaqBoardService.selectFaqCateNameInfo(strCmnComIdx));
        
        if(totalCount > 0){
        	// FAQ  목록
            mv.addObject("list",  this.pcFaqBoardService.selectFaqBoardList(commandMap));
        }        
        
        mv.addObject("boardType", "faq");
        mv.setViewName("pc/customer/faqBoardList");

        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : increaseReadCountAjax
	* 2. ClassName  : FaqBoardController.java
	* 3. Comment    : 조회수 증가
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/pc/customer/increaseReadCountAjax.do", method = RequestMethod.POST)
	public JSON increaseReadCountAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		this.pcFaqBoardService.updateFaqBoardReadCount(commandMap);

		return json;
	}
}
