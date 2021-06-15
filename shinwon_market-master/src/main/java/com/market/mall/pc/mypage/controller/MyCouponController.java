package com.market.mall.pc.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DateTimeException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.axis.utils.SessionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
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
 * 
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyCouponController.java
 * @Date : 2014. 7. 10.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 쿠폰함을 처리하는 Controller Class
 * @author LJH
 */
@Controller("pcMyCouponController")
public class MyCouponController {

    @Resource(name="pcMyPageService")
    private MyPageService pcMyPageService;
    
    @Resource(name="pcMyCouponService")
    private MyCouponService pcMyCouponService;
    
    @Resource(name="pcCommonService") 
	private CommonService pcCommonService;

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
    @RequestMapping("/pc/mypage/myCouponUsableList")
    public ModelAndView myCouponUsableList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
            // 마이페이지 요약정보
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
            commandMap.put("CMN_COM_IDX", SessionsUser.getSessionUserValue("MEM_MST_MEM_GRD"));
            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
            
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH,  -1);
            
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
            
            String startDt1 = StringUtil.getString(commandMap.get("startDt1"), sdf2.format(cal.getTime()));
            String endDt1 = StringUtil.getString(commandMap.get("endDt1"), sdf2.format(new Date()));
            String startDt2 = StringUtil.getString(commandMap.get("startDt2"), sdf2.format(cal.getTime()));
            String endDt2 = StringUtil.getString(commandMap.get("endDt2"), sdf2.format(new Date()));
            
            commandMap.put("startDt", startDt1);
            commandMap.put("endDt", endDt1);
            
            commandMap.put("coupon_tab", StringUtil.getString(commandMap.get("coupon_tab"), "0"));
            
            Map<String, Object> couponCntMap = this.pcMyCouponService.selectCouponUsableTotalCount(request, commandMap);
            
            // 사용가능 쿠폰 목록 갯수
            commandMap.put("CPN_MEM_USE_YN", "N");
            commandMap.put("GET_USABLE", "Y");
            int totalCount = this.pcMyCouponService.selectCouponListCount(commandMap);
            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
            
            commandMap.put("cPage", StringUtil.getInt(commandMap.get("cPage1"), 1));
            Paging paging = new Paging(totalCount, commandMap); 
            
            // 사용 가능 쿠폰 목록
            List<Map<String, Object>> list = null;
            if(totalCount>0){ 
            	list = this.pcMyCouponService.selectCouponList(commandMap);
            }
            
            commandMap.put("startDt", startDt2);
            commandMap.put("endDt", endDt2);
            // 지난 쿠폰 목록 갯수
            commandMap.put("CPN_MEM_USE_YN", "ALL");
            commandMap.put("CPN_MST_YN", "ALL");
            commandMap.remove("GET_USABLE");
            int totalCount2 = this.pcMyCouponService.selectCouponListCount(commandMap);
            commandMap.put("cPage", StringUtil.getInt(commandMap.get("cPage2"), 1));
            Paging paging2 = new Paging(totalCount2, commandMap); 
            
            // 지난 쿠폰 목록
            List<Map<String, Object>> list2 = null;
            if(totalCount2>0){
            	list2 = this.pcMyCouponService.selectCouponList(commandMap);
            }  

            //RETURN OBJECT
            mv.setViewName("pc/mypage/myCouponUsableList");
            mv.addObject("list", list);
            mv.addObject("paging", paging);
            
            try {
            	if(sdf2.parse(startDt1).compareTo(sdf2.parse(endDt1)) > 0 || sdf2.parse(startDt2).compareTo(sdf2.parse(endDt2)) > 0) {
            		throw new DateTimeException("시작 날짜는 종료 날짜보다 빨라야 합니다.");
            	}
				mv.addObject("startDt1", sdf2.format(sdf2.parse(startDt1)));
				mv.addObject("endDt1", sdf2.format(sdf2.parse(endDt1)));
				mv.addObject("startDt2", sdf2.format(sdf2.parse(startDt2)));
				mv.addObject("endDt2", sdf2.format(sdf2.parse(endDt2)));
			} catch (Exception e) {
				mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/mypage/myCouponUsableList.do");
                mv.setViewName("pc/common/result");
                mv.addObject("alertMsg", "날짜 입력이 올바르지 않습니다.");
                return mv;
			}
			mv.addObject("list2", list2);
            mv.addObject("paging2", paging2);
            
            mv.addObject("summaryMap", summaryMap);
            mv.addObject("couponCntMap", couponCntMap);
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
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
	@RequestMapping(value="/pc/mypage/insertShpCouponAjax")
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
     * 1. MethodName : dwnCoupon
     * 2. ClassName : MyCouponController.java
     * 3. Comment : 쿠폰 등록(다운로드)
     * 4. 작성자 : 이원중
     * 5. 작성일 : 2020. 6. 10.
     * </pre>
     * @param mav
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value="/pc/mypage/dwnCoupon")
	public ModelAndView dwnCoupon(ModelAndView mav, HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  {
    	mav.setViewName("pc/common/result");
    	if(issueCoupon(commandMap)) {
    		mav.addObject("closeMsg", "쿠폰이 발급되었습니다.");
//    		mav.addObject("returnUrl", "pc/mypage/myCouponUsableList.do");
    	}else {
    		mav.addObject("closeMsg", "이미 발급받았거나 발급이 불가능한 쿠폰입니다.");
    	}
		return mav;
	}
    
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping(value="/pc/mypage/dwnCouponAjax")
    public JSON dwnCouponAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  {
    	JSON json = new JSON();
    	Map<String, String> map = pcMyCouponService.registPaperCoupon(request, commandMap);
    	json.put("result", map.get("result"));
    	json.put("msg", map.get("msg"));
    	
    	return json;
    }
     
     /**
      * <pre>
      * 1. MethodName : issueCoupon
      * 2. ClassName : MyCouponController.java
      * 3. Comment : 쿠폰 등록 서비스
      * 4. 작성자 : 이원중
      * 5. 작성일 : 2020. 6. 10.
      * </pre>
      *
      * @param commandMap
      * @return boolean
      * @throws Exception
      */
     public boolean issueCoupon(@RequestParams() Map<String, Object> commandMap) throws Exception{
    	 commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
    	 commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
	
    	 // comma(,)로 구분된 쿠폰번호를 배열로 변환
    	 String CPN_MST_IDXs = StringUtil.getString(commandMap.get("CPN_MST_IDXs"));
    	 if(!"".equals(CPN_MST_IDXs)){
    		 String[] arrCPN_MST_IDX = CPN_MST_IDXs.split(",");
    		 commandMap.put("arrCPN_MST_IDX", arrCPN_MST_IDX);
    		 Map<String, Object> resultMap = (Map<String, Object>) pcMyCouponService.insertDwnCoupon(commandMap);
    		 return (int) resultMap.get("result") == 1 ? true : false;
    	 }
    	 return false;
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
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myCouponProductPopup")
    public ModelAndView myCouponProductPopup (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            ModelAndView mv = new ModelAndView();
            commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT);
            commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
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
        	throw new PcAuthenticationException();
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
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myCouponBrandPopup")
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
        	throw new PcAuthenticationException();
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
    @FrontBannerSkip()
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myCouponPlanPopup")
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
        	throw new PcAuthenticationException();
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
//    @AccessLevelUser(ROLEUSER.user)
//    @RequestMapping("/pc/mypage/myCouponUsedList")
//    public ModelAndView myCouponUsedList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
//    {
//        if(SessionsUser.isLogin(request))
//        {
//            ModelAndView mv = new ModelAndView();
//
//            // 마이페이지 요약정보
//            Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
//            
//            // 쿠폰사용내역 갯수
//            int totalCount = this.pcMyCouponService.selectCouponUsedListCount(commandMap);
//            commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
//            Paging paging = new Paging(totalCount, commandMap); 
//            
//            List<Map<String, Object>> list = null;
//            if(totalCount>0)
//            {
//                // 쿠폰사용내역 목록
//            	list = this.pcMyCouponService.selectCouponUsedList(commandMap);
//            }        
//
//            //RETURN OBJECT
//            mv.setViewName("pc/mypage/myCouponUsedList");
//            mv.addObject("list", list);
//            mv.addObject("paging", paging);
//            mv.addObject("summaryMap", summaryMap);
//            mv.addObject("commandMap", commandMap);
//            return mv;
//        }
//        else
//        {
//        	throw new PcAuthenticationException();
//        }
//    }

}
