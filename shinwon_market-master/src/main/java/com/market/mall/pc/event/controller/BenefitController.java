package com.market.mall.pc.event.controller;

import java.util.Calendar;
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
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.event.service.BenefitService;
import com.market.mall.pc.mypage.service.MyCouponService;
import com.market.mall.pc.mypage.service.MyPageService;

@Controller
public class BenefitController {
	
	@Resource(name="benefitService")
	private BenefitService benefitService;
	
	@Resource(name="cartService") 
	private CartService cartService;
	
	@Resource(name="pcMyCouponService")
    private MyCouponService pcMyCouponService;
	
	@Resource(name="pcMyPageService") private MyPageService pcMyPageService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : memberBenefit
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 이벤트 > 회원혜택 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 26.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/memberBenefit")
	public ModelAndView memberBenefit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv	= new ModelAndView();
		Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
		
		// 로그인한 사용자의 경우 오늘 본 상품으로 등록  
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			// 사용자정보 전달
			commandMap.put("user", user);
			
			// 사용자 아이피
			String remote_addr = request.getRemoteAddr();
			commandMap.put("remote_addr", remote_addr);
			commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());
		}
				
		mv.addObject("menu", "member");
		mv.addObject("commandMap", commandMap);
		mv.addObject("summaryMap", summaryMap);
		mv.setViewName("/pc/event/memberBenefit");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : couponBenefit
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 27.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/couponBenefit")
	public ModelAndView couponBenefit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		 User user = SessionsUser.getSessionUser(request);
		 
		// 로그인한 사용자의 경우 오늘 본 상품으로 등록  
		if(SessionsUser.isLogin(request) ){
			// 사용자정보 전달
			commandMap.put("user", user);
			
			// 사용자 아이피
			String remote_addr = request.getRemoteAddr();
			commandMap.put("remote_addr", remote_addr);
			commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());
		}
		
		commandMap.put("CPN_MST_PC_YN", "P");
		
		// TODO 로그인한 경우 사용자 정보 가져온다.
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			mv.addObject("userInfo", userInfo);
			
			commandMap.put("MEM_LOGIN_YN", "Y");
			commandMap.put("MEM_MST_MEM_GRD", userInfo.get("MEM_MST_MEM_GRD"));		// 회원등급코드 
			commandMap.put("MEM_MST_MEM_GBN", userInfo.get("MEM_MST_MEM_GBN"));		// 회원구분상세
			
			//commandMap.put("MEM_MST_MEM_GRD", "1839");		// 회원등급코드 
			//commandMap.put("MEM_MST_MEM_GBN", "683");			// 회원구분상세
			
			String strMemGbn	= StringUtil.getString("MEM_MST_MEM_GBN");
			
			// 회원 별  
			if(!"".equals(strMemGbn)){
				//commandMap.put("CPN_MST_GBN", "D");
//				List list		= this.benefitService.selectMemberCouponList(commandMap);
				int totalCount	= this.benefitService.selectMyCouponListCount(commandMap);
				commandMap.put("pageSize", "8");
				Paging topPaging			= new Paging(totalCount, commandMap);
				
				if(totalCount > 0){
					List list		= this.benefitService.selectMyCouponList(commandMap);
					mv.addObject("topList", list);
				}
				mv.addObject("topPaging",  topPaging);
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int totCouponList			= this.benefitService.selectCouponListCount(commandMap);
		commandMap.put("pageSize", "20");
		Paging paging				= new Paging(totCouponList, commandMap);
		
		if(totCouponList > 0){
			List list 			= this.benefitService.selectCouponList(commandMap);
			mv.addObject("list", list);
		}
		
		mv.addObject("menu", "coupon");
		mv.addObject("paging", paging);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/pc/event/couponBenefit");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : cardBenefit
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 이벤트 > 카드혜택  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 27.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/cardBenefit")
	public ModelAndView cardBenefit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv				= new ModelAndView();
		
		Calendar calendar			= Calendar.getInstance();
		
		mv.addObject("year", 		DateUtil.getCurrentYear());
		mv.addObject("month", 		DateUtil.getCurrentMonth());
		mv.addObject("lastDay", 	calendar.getMaximum(Calendar.DAY_OF_MONTH));
		
		String strCardEv			= StringUtil.getString(commandMap.get("cardEv"));
		String strCardCode			= StringUtil.getString(commandMap.get("cardCode"));
		String strPrc				= StringUtil.getString(commandMap.get("prc"));
		
//		System.out.println("strCardEv:::::::::>" + strCardEv);
//		System.out.println("strCardCode:::::::::>" + strCardCode);
//		System.out.println("strPrc:::::::::>" + strPrc);
		
		if(!"".equals(strCardCode)){
			commandMap.put("strCardCode", strCardCode);
		}
		
		if(!"".equals(strPrc)){
			commandMap.put("strPrc", strPrc);
		}
		
		commandMap.put("CMM_FLE_TB_TYPE", "P");
		commandMap.put("CMN_COM_IDX", "2766");
		
		// 카드 혜택 배너 
		Map cardBannerInfo			= this.benefitService.selectCardBannerInfo(commandMap);
		mv.addObject("cardBannerInfo", cardBannerInfo);
		
//		// 카드 행사 
//		commandMap.put("CODE", "2030");
		String code					= "2030";
		List cardEventCodeList		= this.benefitService.selectCommonCodeList(code);
		mv.addObject("cardEventCodeList", 	cardEventCodeList);
		
		// 카드사 
//		commandMap.put("CODE", "532");
//		List cardCodeList			= this.benefitService.selectCommonCodeList(commandMap);
		List cardCodeList			= this.benefitService.selectCardCodeList(commandMap);
		mv.addObject("cardCodeList", 		cardCodeList);
		
		if("".equals(strCardEv) || "2333".equals(strCardEv)){
			// 카드 할부 리스트 
			List cardDivList			= this.benefitService.selectCardDivList(commandMap);
			mv.addObject("cardDivList", 		cardDivList);
		}
		
		if("".equals(strCardEv) || "2031".equals(strCardEv)){
			// 카드 청구할인 리스트
			commandMap.put("CRD_PMT_GBN", "2031");
			List chargeList				= this.benefitService.selectCardEventList(commandMap);
			mv.addObject("chargeList", 			chargeList);
		}	
		
		if("".equals(strCardEv) || "2032".equals(strCardEv)){
			// 포인트선할인 리스트
			commandMap.put("CRD_PMT_GBN", "2032");
			List pointSaleList			= this.benefitService.selectCardEventList(commandMap);
			mv.addObject("pointSaleList", 		pointSaleList);
		}
		
		if("".equals(strCardEv) || "2034".equals(strCardEv)){
			// 현금캐시백 
			commandMap.put("CRD_PMT_GBN", "2034");
			List cashList				= this.benefitService.selectCardEventList(commandMap);
			mv.addObject("cashList", 			cashList);
		}
		
		if("".equals(strCardEv) || "2033".equals(strCardEv)){
			// 카드포인트적립
			commandMap.put("CRD_PMT_GBN", "2033");
			List pointSaveList			= this.benefitService.selectCardEventList(commandMap);
			mv.addObject("pointSaveList", 		pointSaveList);
		}
		
		
		List cardOptList				= this.benefitService.selectCardOptList(commandMap);
		mv.addObject("cardOptList", cardOptList);
		
		mv.addObject("commandMap", commandMap);
		mv.addObject("menu", "card");
		mv.setViewName("/pc/event/cardBenefit");
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : searchProductCpnPopup
	* 2. ClassName : ProductController.java
	* 3. Comment : 1:1쿠폰 다운로드 팝업
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/event/searchProductCpnPopup")
	public ModelAndView searchProductCpnPopup(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			List<Map<String, Object>> list = null;
			
			list = this.benefitService.selectProductCouponList(request,commandMap);	//쿠폰 다운로드 가능 목록
			
			mv.addObject("list", list);
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
	 * 1. MethodName : couponTopBenefitListAjax
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 > 탑 쿠폰 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 5.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/couponTopBenefitListAjax")
	public JSON couponTopBenefitListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json	= new JSON();
		
		User user = SessionsUser.getSessionUser(request);
		
		int totalCount	= 0;
		
		// 로그인한 사용자의 경우 오늘 본 상품으로 등록  
		if(SessionsUser.isLogin(request) ){
			// 사용자정보 전달
			commandMap.put("user", user);
			
			// 사용자 아이피
			String remote_addr = request.getRemoteAddr();
			commandMap.put("remote_addr", remote_addr);
			commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("CPN_MST_PC_YN", "P");
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			
			commandMap.put("MEM_MST_MEM_GRD", userInfo.get("MEM_MST_MEM_GRD"));		// 회원등급코드 
			commandMap.put("MEM_MST_MEM_GBN", userInfo.get("MEM_MST_MEM_GBN"));		// 회원구분상세
			
			String strMemGbn	= StringUtil.getString("MEM_MST_MEM_GBN");
			
			totalCount	= this.benefitService.selectMyCouponListCount(commandMap);
			commandMap.put("pageSize", "8");
			Paging paging			= new Paging(totalCount, commandMap);
			
			List list		= this.benefitService.selectMyCouponList(commandMap);
			
			json.addObject("list", list);
			json.addObject("firstpageno", 				paging.getFirstPageNo());
			json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
			json.addObject("totalPageCount",  			paging.getTotalPageCount());
			json.addObject("lastPageNoOnPageList", 		paging.getLastPageNoOnPageList());	
			json.addObject("cPage", 					paging.getcPage());
			json.addObject("lastPageNo", 				paging.getLastPageNo());
			json.addObject("pageSize",  				paging.getPageSize());
			json.addObject("pagingSize", 				paging.getPagingSize());
			json.addObject("listNum",					paging.getListNum());
			json.addObject("totalRecordCount",			paging.getTotalRecordCount());
			
		}
		
		json.addObject("totalCount", 				totalCount);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : couponBenefitListAjax
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 > 쿠폰 리스트 ajax
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 5.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/couponBenefitListAjax")
	public JSON couponBenefitListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json	= new JSON();
		
		commandMap.put("CPN_MST_PC_YN", "P");
		
		int totCouponList			= this.benefitService.selectCouponListCount(commandMap);
		commandMap.put("pageSize", "20");

		Paging paging				= new Paging(totCouponList, commandMap);
		
		if(totCouponList > 0){
			
			List list 			= this.benefitService.selectCouponList(commandMap);
			
			json.addObject("list", list);
			json.addObject("firstpageno", 				paging.getFirstPageNo());
			json.addObject("firstPageNoOnPageList", 	paging.getFirstPageNoOnPageList());
			json.addObject("totalPageCount",  			paging.getTotalPageCount());
			json.addObject("lastPageNoOnPageList", 		paging.getLastPageNoOnPageList());	
			json.addObject("cPage", 					paging.getcPage());
			json.addObject("lastPageNo", 				paging.getLastPageNo());
			json.addObject("pageSize",  				paging.getPageSize());
			json.addObject("pagingSize", 				paging.getPagingSize());
			json.addObject("listNum",					paging.getListNum());
			json.addObject("totalRecordCount",			paging.getTotalRecordCount());
			
		}
		
		json.addObject("totalCount", 				totCouponList);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : couponCheckAjax
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 이벤트 > 쿠폰혜택 > 쿠폰 다운로드 권한 체크
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 4. 6.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/couponCheckAjax")
	public JSON couponCheckAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json		= new JSON();
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){

			commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("CPN_MST_PC_YN", "P");
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			
			commandMap.put("MEM_MST_MEM_GRD", userInfo.get("MEM_MST_MEM_GRD"));		// 회원등급코드 
			commandMap.put("MEM_MST_MEM_GBN", userInfo.get("MEM_MST_MEM_GBN"));		// 회원구분상세
			
			Map info	= this.benefitService.selectCouponInfo(commandMap);
			
			if(info == null){
				json.addObject("result", 90);
				json.addObject("returnMsg", "잘못된 쿠폰 입니다.");
			}else{
				
				String strCpnMstNmlYN	= (String) info.get("CPN_MST_NML_YN");
				String strCpnMstMemGrd	= String.valueOf(info.get("CPN_MST_MEM_GRD"));
				String strCpnMstSmpYN	= (String) info.get("CPN_MST_SMP_YN");
				String strMemMstMemGrd	= String.valueOf(userInfo.get("MEM_MST_MEM_GRD"));
				String strMemMstMemGbn	= String.valueOf(userInfo.get("MEM_MST_MEM_GBN"));
				
				if("683".equals(strMemMstMemGbn.trim())){			// 기업회원
					json.addObject("result", 31);
					json.addObject("returnMsg", "쿠폰 다운로드 대상이 아닙니다.");
				}else if("1961".equals(strMemMstMemGbn.trim())){	// 간편회원
					if("Y".equals(strCpnMstSmpYN)){
						json.addObject("result", 1);
					}else{
						json.addObject("result", 21);
					}
				}else if("682".equals(strMemMstMemGbn.trim())){
					if("Y".equals(strCpnMstNmlYN)){
			
						if("999".equals(strCpnMstMemGrd)){
							json.addObject("result", 1);
							System.out.println("ok");
						}else{
							if(strCpnMstMemGrd.equals(strMemMstMemGrd.trim())){
								json.addObject("result", 1);
								System.out.println("ok2");
							}else{
								json.addObject("result", 12);
								json.addObject("returnMsg", "쿠폰 다운로드 대상이 아닙니다.");
			
							}
						}
					}else{
						json.addObject("result", 11);
						json.addObject("returnMsg", "쿠폰 다운로드 대상이 아닙니다.");
					}
				}
			}
		}else{
			json.addObject("result", 99);
			json.addObject("returnMsg", "로그인 후 이용 가능한 서비스입니다.");
		}
	
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : ProductCouponRegist
	* 2. ClassName : ProductController.java
	* 3. Comment : 쿠폰 다운로드
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/event/ProductCouponRegist.do")
	public ModelAndView ProductCouponRegist(HttpServletRequest request,@RequestParams Map<String, Object> commandMap
			, @RequestParams(value="CPN_MST_IDXs") String[] CPN_MST_IDXs ) throws Exception {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("arrCPN_MST_IDX", CPN_MST_IDXs);	//쿠폰 IDX
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			
			Map<String, Object> resultMap = null;
			
        	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
	        // 등록
        	resultMap = this.pcMyCouponService.insertDwnCoupon(commandMap);
	        
	        if(StringUtil.getInt(resultMap.get("result")) > 0 && StringUtil.getString(resultMap.get("returnState")) == "Y"){
	        	if(StringUtil.getString(resultMap.get("returnState")) == "Y"){
	        		if(StringUtil.getInt(resultMap.get("result")) > 1){
	        			mv.addObject("closeMsg", "이미 발급받으신 쿠폰을 제외 한 나머지 쿠폰이 정상적으로 완료 되었습니다.");
	        		}else{
	        			mv.addObject("closeMsg", "해당 쿠폰은 이미 발급 받으셨습니다.");
	        		}
	        	}else{
	        		mv.addObject("closeMsg", "쿠폰 다운로드가 정상적으로 완료 되었습니다.");
	        		mv.addObject("parentFunction", "goTopPage");
	        		mv.addObject("parentFunctionParam1", 1);
	        	}
	        }else{
	        	if(StringUtil.getInt(resultMap.get("result")) > 0){
	        		mv.addObject("closeMsg", "쿠폰 다운로드가 정상적으로 완료 되었습니다.");
	        		mv.addObject("parentFunction", "goTopPage");
	        		mv.addObject("parentFunctionParam1", 1);
	        	}else{
	        		mv.addObject("closeMsg", "쿠폰 다운로드에 실패 하였습니다.");
	        	}
	        }
	        mv.addObject("commandMap", commandMap);
	        mv.setViewName("/pc/common/result");
			
			mv.addObject("commandMap", commandMap);
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
}
