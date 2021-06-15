package com.market.mall.mobile.mypage.controller;

import java.util.ArrayList;
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
import com.epasscni.common.exception.FileUploadException;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyProductCommentService;
import com.market.mall.pc.product.service.ProductService;

/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : MyProductCommentController.java
 * @Date : 2016. 2. 18.
 * @프로그램 설명 : 모바일 > MY LAND > 쇼핑활동 > 상품후기를 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("mobileMyProductCommentController")
public class MyProductCommentController {
	
	@Resource(name="pcMyProductCommentService")
    private MyProductCommentService pcMyProductCommentService;
	
	@Resource(name="productService") private ProductService productService;
	
	@Resource(name="pcMyPageService") private MyPageService pcMyPageService;
	
	@Resource(name="pcCommonService") private CommonService pcCommonService;
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	/**
	* <pre>
	* 1. MethodName : myWritableProductCommentList
	* 2. ClassName  : MyProductCommentController.java
	* 3. Comment    : 모바일 > MY LAND > 쇼핑활동 > 상품 후기 > 작성 가능한 상품후기 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myWritableProductCommentList")
	public ModelAndView myWritableProductCommentList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("OST_SEND_END", Code.OST_SEND_END);	// 배송완료
            commandMap.put("OST_FIX", Code.OST_FIX);	// 구매확정

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            commandMap.put("pageSize", 10); //페이지당 10개
            
            // 작성 가능한 상품평 갯수
            int writableCount = this.pcMyProductCommentService.selectMyWritableProductCommentListCount(commandMap);
            
            // 작성한 상품평 갯수
            int writtenCount = this.pcMyProductCommentService.selectMyWrittenProductCommentListCount(commandMap);
            
        	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
            Paging paging = new Paging(writableCount, commandMap); 
                
            List<Map<String,Object>> writableList = new ArrayList<Map<String,Object>>();
            
            if(writableCount > 0)
            {
            	// 작성 가능한 상품평 목록
            	writableList = this.pcMyProductCommentService.selectMyWritableProductCommentList(commandMap);
            } 
            
            //RETURN OBJECT
            mv.addObject("paging", paging);
            mv.addObject("writtenCount", writtenCount);		// 작성한 상품평 갯수
            mv.addObject("writableCount", writableCount);	// 작성 가능한 상품평 갯수
            mv.addObject("writableList", writableList);	// 작성 가능한 상품평 목록
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : myWrittenProductCommentList
	* 2. ClassName  : MyProductCommentController.java
	* 3. Comment    : 모바일 > MY LAND > 쇼핑활동 > 상품 후기 > 등록한 상품후기 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myWrittenProductCommentList")
    public ModelAndView myWrittenProductCommentList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("OST_SEND_END", Code.OST_SEND_END);	// 배송완료
            commandMap.put("OST_FIX", Code.OST_FIX);	// 구매확정

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            commandMap.put("pageSize", 3); //페이지당 3개
            
            //작성한 상품후기 개수
            int writtenCount = this.pcMyProductCommentService.selectMyWrittenProductCommentListCount(commandMap);
            
            // 작성 가능한 상품평 갯수
            int writableCount = this.pcMyProductCommentService.selectMyWritableProductCommentListCount(commandMap);
            
        	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        	Paging paging = new Paging(writtenCount, commandMap);
                
            if(writtenCount > 0)
            {
            	// 작성한 상품후기 목록
            	Map<String, Object> dataMap = this.pcMyProductCommentService.selectMyWrittenProductCommentList(commandMap);
                mv.addObject("writtenList", dataMap.get("writtenList"));
            } 

            //RETURN OBJECT
            mv.addObject("paging", paging);
            mv.addObject("writableCount", writableCount);	// 작성 가능한 상품평 갯수
            mv.addObject("writtenCount", writtenCount);		// 작성한 상품평 갯수
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
	
	/**
	* <pre>
	* 1. MethodName : myProductCommentForm
	* 2. ClassName  : MyProductCommentController.java
	* 3. Comment    : 모바일 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 폼
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/myProductCommentForm")
	public ModelAndView myProductCommentForm (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			
			// 본인 주문이 맞는지 체크
			int orderCheckCnt = this.pcMyProductCommentService.selectOrderCount(commandMap);
			
			if(orderCheckCnt > 0)
			{
				// 마이페이지 요약정보
	            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
				
				// 상품 이미지 사이즈
				commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
				
				// 상품관련한 간단한 정보 가져오기(상품이미지, 상품명)
				Map<String,Object> productMap = this.pcMyProductCommentService.selectSimpleProductInfo(commandMap);
						
				// 수정
				if(! "".equals(StringUtil.getString(commandMap.get("PRD_REV_IDX"))))
				{
					// 상품후기 상세정보
					Map<String,Object> resultMap = this.pcMyProductCommentService.selectProductCommentInfo(commandMap);
					
					mv.addObject("fileList", resultMap.get("fileList"));
					mv.addObject("productCommentInfoMap", resultMap.get("productCommentInfoMap"));
				}
					
				mv.addObject("commandMap", commandMap);
				mv.addObject("productMap", productMap);
				mv.addObject("summaryMap", summaryMap);
			}
			else
			{
				throw new MobileAuthenticationException();
			}
			
			return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : insertMyProductComment
	* 2. ClassName  : MyProductCommentController.java
	* 3. Comment    : 모바일 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 폼 > 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@FrontBannerSkip
	@RequestMapping("/mobile/mypage/insertMyProductComment")
	public JSON insertMyProductComment (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		String resultMsg = "";
    	String isSuccessYn = "";
    	
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("PRD_REV_REG_IP", request.getRemoteAddr());
			
			
			// 본인 주문이 맞는지 체크
			int orderCheckCnt = this.pcMyProductCommentService.selectOrderCount(commandMap);
			
			if(orderCheckCnt > 0)
			{
				try
				{
					if(this.pcMyProductCommentService.insertProductComment((MultipartHttpServletRequest) request, commandMap) > 0)
					{
			            isSuccessYn = "Y";
			            resultMsg = "등록 되었습니다";
					}
					else
					{
			            isSuccessYn = "N";
			            resultMsg = "등록 실패하였습니다.";
					}
				}
				catch(FileUploadException e)
				{
					logger.debug("productCommentRegist Error : " + e.getMessage());
					commandMap.remove("PRD_REV_IDX");
					isSuccessYn = "N";
					resultMsg = e.getMessage();
				}
				catch(Exception e)
				{
					logger.debug("productCommentRegist Error : " + e.getMessage());
					commandMap.remove("PRD_REV_IDX");
					isSuccessYn = "N";
		            resultMsg = "등록 실패하였습니다.";			
				}
			}
			else
			{
				isSuccessYn = "N";
	            resultMsg = "잘못된 접근입니다.";
			}
		
			json.addObject("isSuccessYn" , isSuccessYn);
			json.addObject("resultMsg" , resultMsg);
			
	    	return json;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : updateProductComment
	* 2. ClassName  : MyProductCommentController.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 폼 > 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/mobile/mypage/updateProductComment")
	public JSON updateProductComment (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		String resultMsg = "";
    	String isSuccessYn = "";
    	
    	if(SessionsUser.isLogin(request))
        {
	    	JSON json = new JSON();
	    	
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			commandMap.put("PRD_REV_UPD_IP", request.getRemoteAddr());
			
			// 본인 주문이 맞는지 체크
			int orderCheckCnt = this.pcMyProductCommentService.selectOrderCount(commandMap);
			
			if(orderCheckCnt > 0)
			{
				// 상품평 수정
		        try
				{
					if(this.pcMyProductCommentService.updateProductComment((MultipartHttpServletRequest)request, commandMap) > 0)
					{
			            isSuccessYn = "Y";
			            resultMsg = "수정 되었습니다.";
					}
					else
					{
						isSuccessYn = "N";
			            resultMsg = "수정 실패하였습니다.";			
					}
				}
				catch(FileUploadException e)
				{
					logger.debug("productCommentRegist Error : " + e.getMessage());
					isSuccessYn = "N";
		            resultMsg = e.getMessage();
				}
				catch(Exception e)
				{
					logger.debug("productCommentRegist Error : " + e.getMessage());
					isSuccessYn = "N";
		            resultMsg = "수정 실패하였습니다.";			
				}
			}
			else
			{
				isSuccessYn = "N";
	            resultMsg = "잘못된 접근입니다.";
			}
	        
	        json.addObject("isSuccessYn" , isSuccessYn);
			json.addObject("resultMsg" , resultMsg);
	    	
	        return json;
        }
    	else
    	{
    		throw new MobileAuthenticationException();
    	}
	}
	
	/**
	* <pre>
	* 1. MethodName : checkBanWordAjax
	* 2. ClassName  : MyProductCommentController.java
	* 3. Comment    : 모바일 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 내용 금칙어 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/mypage/checkBanWordAjax")
	public JSON checkBanWordAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsUser.isLogin(request))
        {
			JSON json = new JSON();
			
			// 금칙어
			String banWord = this.pcMyProductCommentService.selectBanWord(commandMap);
			
			// 필터링한 상품후기 제목
			String checkTitle = StringUtil.filterText(banWord, StringUtil.getString(commandMap.get("PRD_REV_TITLE")));
			// 필터링한 상품후기 내용
			String checkContents = StringUtil.filterText(banWord, StringUtil.getString(commandMap.get("PRD_REV_CONTENTS")));
			
			if("".equals(checkTitle) && "".equals(checkContents))
			{
				json.put("resultYn","Y");
			}
			else
			{
				json.put("resultYn","N");
			}
			
	    	return json;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
	}
	
}
