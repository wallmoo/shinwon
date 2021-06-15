package com.market.mall.mobile.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.MobileAuthenticationException;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyCouponService;
import com.market.mall.pc.mypage.service.MyPageService;

/**
 * @PackageName: com.market.mall.mobile.mypage.controller
 * @FileName : MyCouponController.java
 * @Date : 2015. 7. 15.
 * @프로그램 설명 : 모바일 > 마이페이지 > 쿠폰을 처리하는 Controller Class
 * @author DEV_SONGJEONGEUN
 */
@Controller("mobileMyCouponController")
public class MyCouponController {
	
	@Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
    @Resource(name="pcMyCouponService")
    private MyCouponService pcMyCouponService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: myCouponUsableList
	 * 2. ClassName		: MyCouponController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 사용가능 쿠폰리스트
	 * 4. 작성자			: DEV_SONGJEONGEUN
	 * 5. 작성일			: 2015. 6. 16. 
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponUsableList")
    public ModelAndView myCouponUsableList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            // 마이페이지 요약정보
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            Map<String, Object> couponCntMap = this.pcMyCouponService.selectCouponUsableTotalCount(request, commandMap);
            
            // 사용가능 쿠폰 목록 갯수
            commandMap.put("CPN_MEM_USE_YN", "N");
            int totalCount = this.pcMyCouponService.selectCouponListCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 사용가능 쿠폰 목록
            	list = this.pcMyCouponService.selectCouponList(commandMap);
            }        

            //RETURN OBJECT
            mv.setViewName("mobile/mypage/myCouponUsableList");
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            mv.addObject("couponCntMap", couponCntMap);
            mv.addObject("totalCount", totalCount);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : insertShpCouponAjax
    * 2. ClassName : MyCouponController.java
    * 3. Comment : 제휴쿠폰 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value="/mobile/mypage/insertShpCouponAjax")
    public JSON insertShpCouponAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        String result = "-1";
        //제휴쿠폰 확인
        if(commandMap.get("CPN_PTN_SHP_NO").equals("")){
        	result = "6";
        }else{
        	//제휴쿠폰 등록 확인
        	commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        	Map<String, Object> shpCpnCnt = null;
        	shpCpnCnt = this.pcMyCouponService.selectShpCouponInfo(commandMap);
        	
        	if(shpCpnCnt != null){
        		//제휴쿠폰 유무
	        	if(StringUtil.getInt(shpCpnCnt.get("USE_CNT")) > 0){
	        		//발급 수량 확인
	        		if(StringUtil.getInt(shpCpnCnt.get("MEM_CPN_CNT")) > 0){
	        			result = "1";	//이미 발급받은 제휴쿠폰
	        		}else{
	        			if(StringUtil.getInt(shpCpnCnt.get("SEND_USER_CPN_CNT")) > 0){
	        				result = "6";
	        			}else{
	        				commandMap.put("CPN_MST_IDX", StringUtil.getString(shpCpnCnt.get("CPN_MST_IDX")));
	        				int insertResult = this.pcMyCouponService.insertShpCoupon(commandMap);
	        				if(insertResult > 0){
	        					result = "0";
	        				}else{
	        					result = "4";
	        				}
	        			}
	        		}
	        	}else{
	        		result = "5";
	        	}
        	}else{
        		result = "5";
        	}
        }
        
        
        json.put("result", result);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : myCouponProductPopup
    * 2. ClassName : MyCouponController.java
    * 3. Comment : 쿠폰 적용상품보기 팝업창
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponProductPopup")
    public ModelAndView myCouponProductPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT);
            commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
            //해당 쿠폰에 적용 된 상품 확인
            int totalCount = this.pcMyCouponService.selectCouponProductCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount > 0){
            	list = this.pcMyCouponService.selectCouponProductList(commandMap);
            }
            
            mv.addObject("list", list);
            mv.addObject("paging", paging);
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
    * 1. MethodName : myCouponBrandPopup
    * 2. ClassName : MyCouponController.java
    * 3. Comment : 쿠폰 적용 브랜드
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponBrandPopup")
    public ModelAndView myCouponBrandPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
            //해당 쿠폰에 적용 된 상품 확인
            int totalCount = this.pcMyCouponService.selectCouponBrandCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount > 0){
            	list = this.pcMyCouponService.selectCouponBrandList(commandMap);
            }
            
            mv.addObject("list", list);
            mv.addObject("paging", paging);
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
    * 1. MethodName : myCouponPlanPopup
    * 2. ClassName : MyCouponController.java
    * 3. Comment : 쿠폰 적용 기획전
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 7.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponPlanPopup")
    public ModelAndView myCouponPlanPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
            //해당 쿠폰에 적용 된 상품 확인
            int totalCount = this.pcMyCouponService.selectCouponPlanCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount > 0){
            	list = this.pcMyCouponService.selectCouponPlanList(commandMap);
            }
            
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: myCouponUsedList
	 * 2. ClassName		: MyCouponController.java
     * 3. Comment    	: 프론트 > 마이페이지 > 쇼핑혜택 > 쿠폰사용내역
	 * 4. 작성자			: DEV_SONGJEONGEUN
	 * 5. 작성일			: 2015. 6. 16. 
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponUsedList")
    public ModelAndView myCouponUsedList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            // 쿠폰사용내역 갯수
            commandMap.put("CPN_MEM_USE_YN", "Y");
            commandMap.put("CPN_MST_YN", "ALL");
            int totalCount = this.pcMyCouponService.selectCouponListCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 쿠폰사용내역 목록
            	list = this.pcMyCouponService.selectCouponList(commandMap);
            }        

            //RETURN OBJECT
            mv.setViewName("mobile/mypage/myCouponUsedList");
            mv.addObject("list", list);
            mv.addObject("paging", paging);
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
    * 1. MethodName : myCouponUsableListAjax
    * 2. ClassName : MyCouponController.java
    * 3. Comment : 쿠폰리스트 로딩 페이징 Ajax
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponUsableListAjax")
    public ModelAndView myCouponUsableListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            // 마이페이지 요약정보
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            
            // 사용가능 쿠폰 목록 갯수
            commandMap.put("CPN_MEM_USE_YN", "N");
            int totalCount = this.pcMyCouponService.selectCouponListCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            Paging paging = new Paging(totalCount, commandMap); 
            
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
                // 사용가능 쿠폰 목록
            	list = this.pcMyCouponService.selectCouponList(commandMap);
            }        

            //RETURN OBJECT
            mv.addObject("list", list);
            mv.addObject("paging", paging);
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
    * 1. MethodName : myCouponGreadeList
    * 2. ClassName : MyCouponController.java
    * 3. Comment : 쿠폰 등급 내용
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 16.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/mobile/mypage/myCouponGradeList")
    public ModelAndView myCouponGreadeList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();

            // 마이페이지 요약정보
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            //RETURN OBJECT
            mv.setViewName("mobile/mypage/myCouponGradeList");
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("commandMap", commandMap);
            return mv;
        }
        else
        {
        	throw new MobileAuthenticationException();
        }
    }
}
