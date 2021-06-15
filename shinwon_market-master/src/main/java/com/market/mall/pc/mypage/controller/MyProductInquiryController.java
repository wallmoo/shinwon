package com.market.mall.pc.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyProductInquiryService;

/**
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyProductInquiryController.java
 * @Date : 2015. 5. 29.
 * @프로그램 설명 : 사용자 > MYPAGE > 쇼핑컨텐츠 > 상품 Q&A 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */

@Controller("pcMyProductInquiryController")
public class MyProductInquiryController 
{
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
	@Resource(name="pcMyProductInquiryService")
	private MyProductInquiryService pcMyProductInquiryService;
	 
    @Resource(name="pcCommonService")
    private CommonService pcCommonService;
    
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL;

	
	/**
	* <pre>
	* 1. MethodName : myProductInquiryList
	* 2. ClassName : MyProductInquiryController.java
	* 3. Comment : 사용자 > mypage > 쇼핑컨텐츠 > 상품 QnA 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 5. 29.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myProductInquiryCompleteList")
	public ModelAndView myProductInquiryCompleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
	//	commandMap.put("BRD_INQ_RET_YN", "Y");
		commandMap.put("BRD_INQ_REPLY_CD", "Y");
		return this.myProductInquiryList(request,commandMap);
	}
	
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myProductInquiryIncompleteList")
	public ModelAndView myProductInquiryIncompleteList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
	//	commandMap.put("BRD_INQ_RET_YN", "N");
		commandMap.put("BRD_INQ_REPLY_CD", "N");
		return this.myProductInquiryList(request,commandMap);
	}
	
	
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myProductInquiryList")
    public ModelAndView myProductInquiryList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("BRD_INQ_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("BRD_INQ_TYPE", Code.INQUIRY_TYPE_PRODUCT);
            
            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            //날짜 계산
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH,  -1);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            String startDt = StringUtil.getString(commandMap.get("startDt"), sdf.format(cal.getTime()));
            String endDt = StringUtil.getString(commandMap.get("endDt"), sdf.format(new Date()));
            
            commandMap.put("startDt", startDt);
            commandMap.put("endDt", endDt);
            
            // 상품 QnA 목록 갯수
            int totalCount = this.pcMyProductInquiryService.selectMyProductInquiryListCount(commandMap);
            commandMap.put("pageSize", 10);
            commandMap.put("cPage", StringUtil.getString(commandMap.get("cPage"), "1"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            if(totalCount>0)
            {
            	// 상품 QnA 목록
            	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            	List<Map<String,Object>> list = this.pcMyProductInquiryService.selectMyProductInquiryList(commandMap);


                // 상품 QnA 목록
                mv.addObject("list", list);
            }        
            
            // 해당 브랜드로 이동
            mv.setViewName("pc/mypage/myProductInquiryList");
            
            //RETURN OBJECT
            mv.addObject("paging", paging);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
	
	 @AccessLevelUser(ROLEUSER.user)
	 @RequestMapping("/pc/mypage/myProductInquiryPopup.do")
	 public ModelAndView myProductInquiryPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
	    	
		 if(SessionsUser.isLogin(request)){
			 ModelAndView mv = new ModelAndView();
		    	
		    	Map<String, Object> selectMyQnaInfo = null;
		    			
		    	if(commandMap.get("BRD_INQ_IDX") != ""){//상품Q&A수정
		    	//	commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
		            commandMap.put("BRD_INQ_TYPE",Code.INQUIRY_TYPE_PRODUCT);
		            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		            selectMyQnaInfo = this.pcMyProductInquiryService.selectMyQnaInfo(commandMap);
		    	}
		    	
		    	mv.setViewName("pc/mypage/myProductInquiryPopup");
		    	mv.addObject("selectMyQnaInfo", selectMyQnaInfo);
		    	mv.addObject("commandMap", commandMap);
		    	return mv;
		 }else{
	        throw new PcAuthenticationException();
	     }
	}
	
	 @RequestMapping(value="/pc/mypage/productQnaDeleteAjax.do")
	    public JSON productQnaDeleteAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
	    {
	        JSON json = new JSON();
	        
	        // 로그인 회원정보
	     	User user = SessionsUser.getSessionUser(request);
	     	
	        // 상품 리뷰 관리 목록 갯수
	        commandMap.put("BRD_INQ_IDX",commandMap.get("brdInqIdx"));
			
	        int delQnaCnt = this.pcMyProductInquiryService.deleteMyQna(commandMap);
	        
	        if( delQnaCnt > 0)
	        {
	            json.put("resultYn", "Y");
	        }
	        else
	        {
	            json.put("resultYn", "N");
	        }
	        
	        return json;
	    }
		
	
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myProductInquiryProc.do")
    public ModelAndView myProductInquiryProc (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            int result = 0;
            
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("MEM_MST_WEB_IP", request.getRemoteAddr());
      
           String inqPubYn = StringUtil.getString(commandMap.get("BRD_INQ_PUB_YN"));
          
           if(inqPubYn == null || inqPubYn == "") {
        	   commandMap.put("BRD_INQ_PUB_YN", "Y");
           }
          
           result = this.pcMyProductInquiryService.updateMyQna(commandMap);
            	
            if(result > 0){
            	mv.addObject("alertMsg", "수정되었습니다.");
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myProductInquiryIncompleteList.do");
            }else{
            	mv.addObject("alertMsg", "수정중 오류가 발생했습니다.");
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myProductInquiryIncompleteList.do");
            }
           
            mv.addObject("commandMap", commandMap);            
      
            mv.setViewName("/pc/common/result");
            return mv;
        }
        else
        {
        	throw new PcAuthenticationException();
        }
    }
}
