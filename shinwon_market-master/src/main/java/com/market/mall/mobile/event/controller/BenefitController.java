package com.market.mall.mobile.event.controller;

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
import com.epasscni.util.DateUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.mobile.event.service.BenefitService;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;

@Controller("mBenefitController")
public class BenefitController {
	
	@Resource(name="mBenefitService")
	private BenefitService mBenefitService;
	
	@Resource(name="cartService") 
	private CartService cartService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : memberBenefit
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 모바일 > 이벤트 > 회원혜택
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/memberBenefit")
	public ModelAndView memberBenefit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
		ModelAndView mv			= new ModelAndView();
		
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
		mv.setViewName("/mobile/event/memberBenefit");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : couponBenefit
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 모바일 > 이벤트 > 쿠폰혜택 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/couponBenefit")
	public ModelAndView couponBenefit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv			= new ModelAndView();
		
		// 로그인 회원정보
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
			
			String strMemGbn	= StringUtil.getString("MEM_MST_MEM_GBN");
			
			// 회원 별  
			if(!"".equals(strMemGbn)){
				
				int totalCount	= this.mBenefitService.selectMyCouponListCount(commandMap);
				
				if(totalCount > 0){
					List list		= this.mBenefitService.selectMyCouponList(commandMap);
					mv.addObject("topList", list);
				}
			}
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		int totCouponList			= this.mBenefitService.selectCouponListCount(commandMap);
		commandMap.put("pageSize", "10");
		Paging paging				= new Paging(totCouponList, commandMap);
		
		if(totCouponList > 0){
			List list 			= this.mBenefitService.selectCouponList(commandMap);
			mv.addObject("list", list);
		}
		
		mv.addObject("menu", "coupon");
		mv.addObject("paging", paging);
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/mobile/event/couponBenefit");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : cardBenefit
	 * 2. ClassName : BenefitController.java
	 * 3. Comment : 모바일 > 이벤트 > 카드혜택  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 16.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/event/cardBenefit")
	public ModelAndView cardBenefit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		ModelAndView mv				= new ModelAndView();
		
		Calendar calendar			= Calendar.getInstance();
		
		mv.addObject("year", 		DateUtil.getCurrentYear());
		mv.addObject("month", 		DateUtil.getCurrentMonth());
		mv.addObject("lastDay", 	calendar.getMaximum(Calendar.DAY_OF_MONTH));
		
		String strCardEv			= StringUtil.getString(commandMap.get("cardEv"));
		String strCardCode			= StringUtil.getString(commandMap.get("cardCode"));
		String strPrc				= StringUtil.getString(commandMap.get("prc"));
		
		if(!"".equals(strCardCode)){
			commandMap.put("strCardCode", strCardCode);
		}
		
		if(!"".equals(strPrc)){
			commandMap.put("strPrc", strPrc);
		}

		String code					= "2030";
		List cardEventCodeList		= this.mBenefitService.selectCommonCodeList(code);
		mv.addObject("cardEventCodeList", 	cardEventCodeList);
		
		List cardCodeList			= this.mBenefitService.selectCardCodeList(commandMap);
		mv.addObject("cardCodeList", 		cardCodeList);
		
		if("".equals(strCardEv) || "2333".equals(strCardEv)){
			// 카드 할부 리스트 
			List cardDivList			= this.mBenefitService.selectCardDivList(commandMap);
			mv.addObject("cardDivList", 		cardDivList);
		}
		
		if("".equals(strCardEv) || "2031".equals(strCardEv)){
			// 카드 청구할인 리스트
			commandMap.put("CRD_PMT_GBN", "2031");
			List chargeList				= this.mBenefitService.selectCardEventList(commandMap);
			mv.addObject("chargeList", 			chargeList);
		}	
		
		if("".equals(strCardEv) || "2032".equals(strCardEv)){
			// 포인트선할인 리스트
			commandMap.put("CRD_PMT_GBN", "2032");
			List pointSaleList			= this.mBenefitService.selectCardEventList(commandMap);
			mv.addObject("pointSaleList", 		pointSaleList);
		}
		
		if("".equals(strCardEv) || "2033".equals(strCardEv)){
			// 현금캐시백 
			commandMap.put("CRD_PMT_GBN", "2033");
			List cashList				= this.mBenefitService.selectCardEventList(commandMap);
			mv.addObject("cashList", 			cashList);
		}
		
		if("".equals(strCardEv) || "2034".equals(strCardEv)){
			// 카드포인트적립
			commandMap.put("CRD_PMT_GBN", "2034");
			List pointSaveList			= this.mBenefitService.selectCardEventList(commandMap);
			mv.addObject("pointSaveList", 		pointSaveList);
		}
		
		List cardOptList				= this.mBenefitService.selectCardOptList(commandMap);
		mv.addObject("cardOptList", cardOptList);
		
		mv.addObject("commandMap", commandMap);
		mv.addObject("menu", "card");
		mv.setViewName("/mobile/event/cardBenefit");
		
		return mv;
	}
	
}
