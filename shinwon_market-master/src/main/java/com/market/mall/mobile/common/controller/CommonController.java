package com.market.mall.mobile.common.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import NiceID.Check.CPClient;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Paging;
import com.market.mall.pc.common.service.CommonService;

import egovframework.rte.fdl.property.EgovPropertyService;

//import Kisinfo.Check.IPINClient;

/**
 * 
 * @PackageName: com.market.mall.pc.common.controller
 * @FileName : CommonController.java
 * @Date : 2014. 6. 23.
 * @프로그램 설명 : 프론트 > 공통로직을 처리하는 Controller
 * @author LJH
 */
@Controller("mobileCommonController")
public class CommonController {

	@Resource(name = "pcCommonService")
	private CommonService pcCommonService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="commonService")
    private com.market.mall.am.common.service.CommonService commonService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: checkPlusInitAjax
	 * 2. ClassName		: CommonController.java
	 * 3. Comment    	: 회원가입시 NICE 신용평가원 CHECK PLUS 인증 준비에 필요한 정보 호출 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 6. 23. 오후 3:32:51
	 * </pre>
	 * 
	 * @return JSON
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/common/checkPlusInitAjax")
	public JSON checkPlusInitAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		CPClient client = new CPClient();

		String mobileDomain = (String) request.getAttribute("mobileDomain");

		/** NICE로부터 부여받은 사이트 코드 */
		String siteCode = StringUtil
				.getString(this.propertiesService
						.getString("namecheck.checkplus.site_cd"), "G6268");
		/** NICE로부터 부여받은 사이트 패스워드 */
		String sitePwd = StringUtil.getString(this.propertiesService
				.getString("namecheck.checkplus.site_passwd"), "QIWQJT0OOF5O");
		/**
		 * ┌─[rtnSuccessUrl] 변수에 대한
		 * 설명───────────────────────────────────────────────────────── NICE
		 * 신용평가정보 팝업에서 인증받은 사용자 정보를 암호화하여 귀사로 리턴합니다. 따라서 암호화된 결과 데이타를 리턴받으실 URL
		 * 정의해 주세요.
		 * 
		 * * URL 은 http 부터 입력해 주셔야하며, 외부에서도 접속이 유효한 정보여야 합니다. * 당사에서 배포해드린 샘플페이지
		 * 중, ipin_process.jsp 페이지가 사용자 정보를 리턴받는 예제 페이지입니다.
		 * 
		 * 아래는 URL 예제이며, 귀사의 서비스 도메인과 서버에 업로드 된 샘플페이지 위치에 따라 경로를 설정하시기 바랍니다. 예 -
		 * http://www.test.co.kr/ipin_process.jsp,
		 * https://www.test.co.kr/ipin_process.jsp,
		 * https://test.co.kr/ipin_process.jsp
		 * └─────────────────────────────────
		 * ───────────────────────────────────────────────────────
		 */
		String rtnSuccessUrl = mobileDomain
				+ StringUtil.getString(this.propertiesService
						.getString("namecheck.checkplus.mobile_return_success_url"),
						"");
		String rtnErrorUrl = mobileDomain
				+ StringUtil.getString(this.propertiesService
						.getString("namecheck.checkplus.mobile_return_error_url"), "");

		/**
		 * ┌──[requestNo] 변수에 대한
		 * 설명────────────────────────────────────────────────────── CP 요청번호로
		 * 귀사에서 데이타를 임의로 정의하거나, 당사에서 배포된 모듈로 데이타를 생성할 수 있습니다. CP 요청번호는 인증 완료 후,
		 * 암호화된 결과 데이타에 함께 제공되며 데이타 위변조 방지 및 특정 사용자가 요청한 것임을 확인하기 위한 목적으로 이용하실 수
		 * 있습니다.
		 * 
		 * 따라서 귀사의 프로세스에 응용하여 이용할 수 있는 데이타이기에, 필수값은 아닙니다.
		 * └──────────────────────
		 * ───────────────────────────────────────────────────────────────
		 */
		String requestNo = client.getRequestNO(siteCode);

		/** M: 핸드폰, C: 신용카드, X: 공인인증서, default: "" */
		String authType = "M";

		/** Y : 취소버튼 있음 / N : 취소버튼 없음 */
		String popupGubun = "N";

		/** "":(기본 웹페이지) / "Mobile":(모바일페이지) */
		String customize = "Mobile";

		/** 입력될 plain 데이타를 만든다. */
		String plainData = "7:REQ_SEQ" + requestNo.getBytes().length + ":"
				+ requestNo + "8:SITECODE" + siteCode.getBytes().length + ":"
				+ siteCode + "9:AUTH_TYPE" + authType.getBytes().length + ":"
				+ authType + "7:RTN_URL" + rtnSuccessUrl.getBytes().length
				+ ":" + rtnSuccessUrl + "7:ERR_URL"
				+ rtnErrorUrl.getBytes().length + ":" + rtnErrorUrl
				+ "11:POPUP_GUBUN" + popupGubun.getBytes().length + ":"
				+ popupGubun + "9:CUSTOMIZE" + customize.getBytes().length
				+ ":" + customize;

		/**
		 * Method 결과값(resultCode)에 따라, 프로세스 진행여부를 파악합니다.
		 */
		int resultCode = client.fnEncode(siteCode, sitePwd, plainData);

		String checkPlusChipherData = "";
		if (resultCode == 0) {
			checkPlusChipherData = StringUtil.getString(client.getCipherData(),
					"");
		} else if (resultCode == -1) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 암호화 시스템 에러입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -2) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 암호화 처리오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -3) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 암호화 데이터 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -9) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 암호화 데이터 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 알수 없는 에러 입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		}

		json.put("checkPlusResultCode", Integer.toString(resultCode));
		json.put("checkPlusRequestNo", requestNo);
		json.put("checkPlusCipherData", checkPlusChipherData);
		System.out.println("checkPlusInitAjax.json : " + json);
		return json;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: checkPlusSuccess
	 * 2. ClassName		: CommonController.java
	 * 3. Comment    	: 회원가입시 NICE 신용평가원 CHECK PLUS 인증 성공 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 6. 23. 오후 3:33:32
	 * </pre>
	 * 
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/mobile/common/checkPlusSuccess")
	public ModelAndView checkPlusSuccess(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		CPClient client = new CPClient();

		/** NICE로부터 부여받은 사이트 코드 */
		String siteCode = StringUtil
				.getString(this.propertiesService
						.getString("namecheck.checkplus.site_cd"), "G6268");
		/** NICE로부터 부여받은 사이트 패스워드 */
		String sitePwd = StringUtil.getString(this.propertiesService
				.getString("namecheck.checkplus.site_passwd"), "QIWQJT0OOF5O");

		String responseData = request.getParameter("EncodeData");

		int resultCode = client.fnDecode(siteCode, sitePwd, responseData);
		String closeMsg = "인증에 실패하였습니다.";

		Map<String, Object> accreditationMap = new HashMap<String, Object>();
		if (resultCode == 0) {
			String painData = client.getPlainData();

			Map<String, Object> resultData = (Map<String, Object>) client.fnParse(painData);

			System.out.println(resultData);
			
			String MOBILE_NO = StringUtil.getString(resultData.get("MOBILE_NO"),"01000000000");
			String MOBILE_NO1 = MOBILE_NO.substring(0,3);
			String MOBILE_NO2 = MOBILE_NO.length()==11? MOBILE_NO.substring(3,7):MOBILE_NO.substring(3,6);
			String MOBILE_NO3 = MOBILE_NO.length()==11? MOBILE_NO.substring(7,11):MOBILE_NO.substring(6,10);

			accreditationMap.put("name",StringUtil.getString(resultData.get("NAME"), "")); // 이름
			accreditationMap.put("di",StringUtil.getString(resultData.get("DI"), "")); // 중복가입 확인값 (DI -64byte고유값)
			accreditationMap.put("ci",StringUtil.getString(resultData.get("CI"), "")); // 주민등록번호와 1:1로 매칭되는 고유키 (CI - 88 byte 고유값)
			accreditationMap.put("gender", "0".equals(StringUtil.getString(resultData.get("GENDER"), "")) ? "F" : "M"); // 성별 코드 (개발 가이드 참조)
			accreditationMap.put("birthdate",StringUtil.getString(resultData.get("BIRTHDATE"), "")); // 생년월일 (YYYYMMDD)
			accreditationMap.put("ageCode", "");
			accreditationMap.put("nationalInfo",StringUtil.getString(resultData.get("NATIONALINFO"), "")); // 국적 정보 (0: 내국인, 1: 외국인)
			accreditationMap.put("mobileNo", MOBILE_NO); // 핸드폰 번호
			accreditationMap.put("mobileNo1", MOBILE_NO1); // 핸드폰 번호
			accreditationMap.put("mobileNo2", MOBILE_NO2); // 핸드폰 번호
			accreditationMap.put("mobileNo3", MOBILE_NO3); // 핸드폰 번호
			if (StringUtil.getString(resultData.get("MOBILE_CO"), "").indexOf("SK") >= 0) {
				accreditationMap.put("mobileCo", "01"); // 핸드폰 통신사(01:SKT, 02:KT, 03:LGT, 99:기타)
			} else if (StringUtil.getString(resultData.get("MOBILE_CO"), "").indexOf("KT") >= 0) {
				accreditationMap.put("mobileCo", "02"); // 핸드폰 통신사(01:SKT, 02:KT, 03:LGT, 99:기타)
			} else if (StringUtil.getString(resultData.get("MOBILE_CO"), "").indexOf("LG") >= 0) {
				accreditationMap.put("mobileCo", "03"); // 핸드폰 통신사(01:SKT, 02:KT, 03:LGU+, 99:기타)
			} else {
				accreditationMap.put("mobileCo", "99"); // 핸드폰 통신사(01:SKT, 02:KT, 03:LGU+, 99:기타)
			}
			accreditationMap.put("authType", "H");
			accreditationMap.put("param_r2",StringUtil.getString(request.getParameter("param_r2"), ""));
			accreditationMap.put("param_r3",StringUtil.getString(request.getParameter("param_r3"), ""));

			// 세션에 정보 저장
			SessionsUser.setAccreditationInfo(request, accreditationMap);
			closeMsg = "인증에 성공하였습니다.";
		} else if (resultCode == -1) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 시스템 에러입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -4) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 처리오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -5) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 해쉬 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -6) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 데이터 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -9) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 입력 데이터 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -12) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 사이트 패스워드 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 알수 없는 에러 입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		}

		String param_r1 = StringUtil.getString(
				request.getParameter("param_r1"), "");
		
		System.out.println("param_r1=========================================="+param_r1);
		
		// 장바구니 - 비회원주문
		if ("cart".equals(param_r1)) {
			mv.addObject("alertMsg", closeMsg);
			mv.addObject("returnUrl",  request.getAttribute("mobileDomain") + "/mobile/cart/cartpayment.do");
			mv.setViewName("/mobile/common/result");
		}

		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: checkPlusError
	 * 2. ClassName	: CommonController.java
	 * 3. Comment    	: 회원가입시 NICE 신용평가원 CHECK PLUS 인증 실패 
	 * 4. 작성자		: LeeJongHo
	 * 5. 작성일		: 2014. 6. 23. 오후 3:33:58
	 * </pre>
	 * 
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/mobile/common/checkPlusError")
	public ModelAndView checkPlusError(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		CPClient client = new CPClient();

		/** NICE로부터 부여받은 사이트 코드 */
		String siteCode = StringUtil
				.getString(this.propertiesService
						.getString("namecheck.checkplus.site_cd"), "G6268");
		/** NICE로부터 부여받은 사이트 패스워드 */
		String sitePwd = StringUtil.getString(this.propertiesService
				.getString("namecheck.checkplus.site_passwd"), "QIWQJT0OOF5O");

		String responseData = request.getParameter("EncodeData");

		int resultCode = client.fnDecode(siteCode, sitePwd, responseData);

		if (resultCode == 0) {
			String painData = client.getPlainData();

			Map<String, Object> resultData = (Map<String, Object>) client
					.fnParse(painData);

			Map<String, Object> accreditationMap = new HashMap<String, Object>();
			accreditationMap.put("name",
					StringUtil.getString(resultData.get("NAME"), "")); // 이름
			accreditationMap.put("di",
					StringUtil.getString(resultData.get("DI"), "")); // 중복가입 확인값
																		// (DI -
																		// 64
																		// byte
																		// 고유값)
			accreditationMap.put("gender", "0".equals(StringUtil.getString(
					resultData.get("GENDER"), "")) ? "F" : "M"); // 성별 코드 (개발
																	// 가이드 참조)
			accreditationMap.put("birthdate",
					StringUtil.getString(resultData.get("BIRTHDATE"), "")); // 생년월일
																			// (YYYYMMDD)
			accreditationMap.put("ageCode", "");
			accreditationMap.put("nationalInfo",
					StringUtil.getString(resultData.get("NATIONALINFO"), "")); // 국적
																				// 정보
																				// (0:
																				// 내국인,
																				// 1:
																				// 외국인)
			accreditationMap.put("mobileNo",
					StringUtil.getString(resultData.get("MOBILE_NO"), "")); // 핸드폰
																			// 번호
			accreditationMap.put("mobileCo",
					StringUtil.getString(resultData.get("MOBILE_CO"), "")); // 핸드폰
																			// 통신사
			accreditationMap.put("authType", "H");

			// 세션에 정보 저장
			SessionsUser.setAccreditationInfo(request, accreditationMap);

		} else if (resultCode == -1) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 시스템 에러입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -4) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 처리오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -5) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 해쉬 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -6) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 복호화 데이터 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -9) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 입력 데이터 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else if (resultCode == -12) {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 사이트 패스워드 오류입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		} else {
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			logger.info("checkPlusResultCode : " + resultCode
					+ ", message : 알수 없는 에러 입니다.");
			logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		}

		String param_r1 = StringUtil.getString(
				request.getParameter("param_r1"), "");
		if ("join".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("mobileDomain")
					+ "/mobile/member/infoMemberJoinStep1.do");
			mv.setViewName("/mobile/common/result");
		
		} else if ("findIdPopup".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("mobileDomain")
					+ "/mobile/member/infoMemberFindIdStep1Popup.do");
			mv.setViewName("/mobile/common/result");
		
		} else if ("findPasswordPopup".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("mobileDomain")
					+ "/mobile/member/infoMemberFindPasswordStep1Popup.do");
			mv.setViewName("/mobile/common/result");
		
		} else if ("accreditationLogin".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("mobileDomain")
					+ "/mobile/manager/accreditationLoginProc.do");
			mv.setViewName("/mobile/common/result");

		} 
		
		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: checkLogin
	 * 2. ClassName		: CommonController.java
	 * 3. Comment    	: 로그인 여부체크 
	 * 4. 작성자			: LeeJongHo
	 * 5. 작성일			: 2014. 6. 23. 오후 3:34:53
	 * </pre>
	 * 
	 * @return JSON
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mobile/common/checkLogin", method = RequestMethod.POST)
	public JSON checkLogin(HttpServletRequest request) throws Exception {
		JSON json = new JSON();

		if (SessionsUser.isLogin(request)) {
			json.put("result", "Y");
		} else {
			json.put("result", "N");
		}

		return json;
	}

	@RequestMapping("/mobile/common/commonFileDownload")
    public ModelAndView commonFileDownload (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView("downloadView");
        if(!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "")))
        {
            // 파일 다운로드 수 증가
            int result = this.pcCommonService.updateCommonFileDownCount(commandMap);
            
            if(result > 0)
            {
                String webPath = StringUtil.getString(commandMap.get("CMM_FLE_SAVE_PATH"), "");
                String orgFileName = StringUtil.getString(commandMap.get("CMM_FLE_ORG_NM"), "");
                File file = new File(webPath);
                mv.addObject("downloadFile", file);
                mv.addObject("orgFileName", orgFileName);
            }
        }
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : commonZipCodePopup
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 모바일 > 우편번호 찾기(통합검색) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/common/commonZipCodePopup")
	public ModelAndView commonZipCodePopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 프로토콜 여부 (https : true / http : false)
		boolean secureYn = request.isSecure();
		String domain = "";
		
		if(secureYn)
		{
			domain = StringUtil.getString(request.getAttribute("mobileSslDomain"));
		}
		else
		{
			domain = StringUtil.getString(request.getAttribute("mobileDomain"));
		}
		
		mv.addObject("domain", domain);
		mv.addObject("protocol", secureYn);
		mv.addObject("commandMap", commandMap);
		
		mv.setViewName("/mobile/common/zipcode/commonZipCodePopup");
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : commonZipCodePopupSigunguAjax
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 시/도 선택에 따른 시/군/구 목록 조회
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 26.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/common/commonZipCodePopupSigunguAjax")
    public JSON commonZipCodePopupSigunguAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	JSON json = new JSON();
        
    	if(!"".equals(StringUtil.getString(commandMap.get("SIDO"), "")))
        {
    		// 시/군/구 목록 조회
    		json.put("list", this.commonService.selectZipcodeSigunguList(commandMap));
        }
        
        return json;
    }
	
	/**
	* <pre>
	* 1. MethodName : zipcodeListAjax
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 우편번호 검색 결과 리스트
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 26.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/common/zipcode/zipcodeListAjax")
	public ModelAndView zipcodeListAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		Iterator<String> keys = commandMap.keySet().iterator();
        while( keys.hasNext() ){
            String key = keys.next();
            String v = (String) commandMap.get(key);
            v = URLDecoder.decode(v,"UTF-8");
            commandMap.put(key, v);
        }
		
		if(!"".equals(StringUtil.getString(commandMap.get("searchSido"),"")))
  		{
			commandMap.put("searchType", StringUtil.getString(commandMap.get("zipCodeType"),""));

			// 우편번호 검색 목록 갯수
  			int totalCount = StringUtil.getString(commandMap.get("searchZipYn"), "N").equals("N") ? 0 : this.commonService.selectCommonZipCodeListCount(commandMap);
  			
//  			Paging paging = new Paging(totalCount, commandMap);
//  			mv.addObject( "paging", paging );
  //
//  	        commandMap.put("startNum", paging.getStartNum());
//  	        commandMap.put("endNum", paging.getEndNum());
  	        
  	        List<Map<String, Object>> list = null;
  	        
  	        if(totalCount > 0)
  	        {
  	        	// 우편번호 검색 목록
  	        	list = this.commonService.selectCommonZipCodeList(commandMap);
  	        }

  	        mv.addObject("list", list);
  	        mv.addObject("commandMap",commandMap);
  	        
  		}
		  
		return mv;
	}
	/**
	* <pre>
	* 1. MethodName : searchZipCodeAjax
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 사용자 > 모바일 우편번호 검색 결과 Ajax
	* 4. 작성자       : 조준철
	* 5. 작성일       : 2016. 4. 26.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/search/searchZipCodeAjax")
	public ModelAndView searchZipCodeAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	
}
