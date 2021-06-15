package com.market.mall.mobile.customer.controller;

import java.util.HashMap;
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
import com.market.mall.mobile.customer.service.FaqBoardService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.pc.common.service.CommonService;

/**
 * @PackageName: com.market.mall.mobile.customer.controller
 * @FileName : FaqBoardController.java
 * @Date : 2016. 2. 12.
 * @프로그램 설명 : 모바일 > 고객센터 FAQ를 처리하는 Controller Class
 * @author khcho
 */
@Controller("mobileFaqBoardController")
public class FaqBoardController {
	
	@Resource(name="mobileFaqBoardService")
    private FaqBoardService mobileFaqBoardService;
	
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
	@RequestMapping("/mobile/customer/faqBoardList")
    public ModelAndView faqBoardList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        //String faqCode	= "105";
        String faqCode	= "3156";
        
        //String strCmnComUpIdx 	= StringUtil.getString(commandMap.get("BRD_CMN_COM_UP_IDX"),"");	// 하위 카테고리에서 클릭한 값
        //String strCmnComIdx		= StringUtil.getString(commandMap.get("BRD_CMN_COM_IDX"), ""); 		// 좌측 lnb 에서 클릭한 값
        //String CMN_COM_IDX = StringUtil.getString(commandMap.get("BRD_CMN_COM_IDX"), StringUtil.getString(commandMap.get("BRD_CMN_COM_UP_IDX"),""));
        String strCmnComUpIdx 	= StringUtil.getString(commandMap.get("CMN_COM_UP_IDX"),"");	// 하위 카테고리에서 클릭한 값
        String strCmnComIdx		= StringUtil.getString(commandMap.get("CMN_COM_IDX"), ""); 		// 좌측 lnb 에서 클릭한 값
        commandMap.put("searchBrdCmnComUpIdx", strCmnComUpIdx);
        
        /*commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        commandMap.put("searchBrdCmnComUpIdx", strCmnComUpIdx);
       	commandMap.put("searchBrdCmnComIdx", strCmnComIdx);*/
       	
        // FAQ 하위 코드 목록 
        mv.addObject("fqaCodeList", this.mobileFaqBoardService.selectFaqCodeList(faqCode));
        
        // FAQ 목록 갯수
        commandMap.put("pageSize", "20");
        int totalCount 			= this.mobileFaqBoardService.selectFaqBoardListCount(commandMap);
        Paging paging 			= new Paging(totalCount, commandMap); 
        
        //mv.addObject("cateName", this.mobileFaqBoardService.selectFaqCateNameInfo(strCmnComUpIdx));
        //mv.addObject("smallCateName", this.mobileFaqBoardService.selectFaqCateNameInfo(strCmnComIdx));
        
        mv.addObject("totalCount", totalCount);
        if(totalCount > 0){
        	// FAQ  목록
            mv.addObject("list",  this.mobileFaqBoardService.selectFaqBoardList(commandMap));
        }        
        
        mv.addObject("boardType", "faq");
        mv.setViewName("mobile/customer/faqBoardList");

        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	/**
	 * 
	 * <pre>
	 * 1. MethodName : faqSearchList
	 * 2. ClassName : FaqBoardController.java
	 * 3. Comment : faq 검색리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 12.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/customer/faqSearchList")
    public ModelAndView faqSearchList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String faqCode	= "105";
        
        String strCmnComUpIdx 	= StringUtil.getString(commandMap.get("BRD_CMN_COM_UP_IDX"),"");	// 하위 카테고리에서 클릭한 값
        String strCmnComIdx		= StringUtil.getString(commandMap.get("BRD_CMN_COM_IDX"), ""); 		// 좌측 lnb 에서 클릭한 값
        String CMN_COM_IDX = StringUtil.getString(commandMap.get("BRD_CMN_COM_IDX"), StringUtil.getString(commandMap.get("BRD_CMN_COM_UP_IDX"),""));
        
        commandMap.put("CMN_COM_IDX", CMN_COM_IDX);
        commandMap.put("searchBrdCmnComUpIdx", strCmnComUpIdx);
       	commandMap.put("searchBrdCmnComIdx", strCmnComIdx);
       	
        // FAQ 하위 코드 목록 
        mv.addObject("lowCodeList", this.mobileFaqBoardService.selectFaqCodeList(strCmnComUpIdx));
        
        // FAQ 목록 갯수
        commandMap.put("pageSize", "20");
        int totalCount 			= this.mobileFaqBoardService.selectFaqBoardListCount(commandMap);
        Paging paging 			= new Paging(totalCount, commandMap); 
        
        mv.addObject("cateName", this.mobileFaqBoardService.selectFaqCateNameInfo(strCmnComUpIdx));
        mv.addObject("smallCateName", this.mobileFaqBoardService.selectFaqCateNameInfo(strCmnComIdx));
        
        mv.addObject("totalCount", totalCount);
        if(totalCount > 0){
        	// FAQ  목록
            mv.addObject("list",  this.mobileFaqBoardService.selectFaqBoardList(commandMap));
        }        
        
        mv.addObject("boardType", "faq");
        mv.setViewName("mobile/customer/faqSearchList");

        //RETURN OBJECT
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	/**
	* <pre>
	* 1. MethodName : faqBoardListAjax
	* 2. ClassName  : FaqBoardController.java
	* 3. Comment    : ajax로 조회
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/mobile/customer/faqBoardListAjax.do", method = RequestMethod.POST)
	public JSON faqBoardListAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		 JSON json			= new JSON();
		 Map resultMap		= new HashMap();
		 
		 String strCmnComUpIdx 	= StringUtil.getString(commandMap.get("BRD_CMN_COM_UP_IDX"),"");	// 하위 카테고리에서 클릭한 값
	     String strCmnComIdx		= StringUtil.getString(commandMap.get("BRD_CMN_COM_IDX"), ""); 		// 좌측 lnb 에서 클릭한 값
	     
	     String cPage		= StringUtil.getString(commandMap.get("cPage"), ""); 		// 좌측 lnb 에서 클릭한 값
	     
	     commandMap.put("searchBrdCmnComUpIdx", strCmnComUpIdx);
	   	 commandMap.put("searchBrdCmnComIdx", strCmnComIdx);
	   	
		 commandMap.put("pageSize", 20);
		
		 int totalCount 	= this.mobileFaqBoardService.selectFaqBoardListCount(commandMap);
		 Paging paging 		= new Paging(totalCount, commandMap); 
		 
		 resultMap.put("list", 	this.mobileFaqBoardService.selectFaqBoardList(commandMap));
		 
		 json.addObject("resultMap", 				resultMap);
		   
//		 System.out.println("json start::::::>" + json);
		 return json;
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
	@RequestMapping(value = "/mobile/customer/increaseReadCountAjax.do", method = RequestMethod.POST)
	public JSON increaseReadCountAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		
		this.mobileFaqBoardService.updateFaqBoardReadCount(commandMap);

		return json;
	}
}
