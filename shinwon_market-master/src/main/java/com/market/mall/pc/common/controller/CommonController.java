package com.market.mall.pc.common.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.AesCrypto;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.pc.common.service.CommonService;

import NiceID.Check.CPClient;
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
@Controller("pcCommonController")
public class CommonController {

	@Autowired
	private FileUpload fileUpload;
	
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
	@RequestMapping("/pc/common/checkPlusInitAjax")
	public JSON checkPlusInitAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		CPClient client = new CPClient();

		String frontDomain = (String) request.getAttribute("frontDomain");

		/** NICE로부터 부여받은 사이트 코드 */
		String siteCode = StringUtil
				.getString(this.propertiesService
						.getString("namecheck.checkplus.site_cd"), "BR009");
		/** NICE로부터 부여받은 사이트 패스워드 */
		String sitePwd = StringUtil.getString(this.propertiesService
				.getString("namecheck.checkplus.site_passwd"), "NV5x0wFN0I3R");
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
		String rtnSuccessUrl = frontDomain
				+ StringUtil.getString(this.propertiesService
						.getString("namecheck.checkplus.return_success_url"),
						"");
		String rtnErrorUrl = frontDomain
				+ StringUtil.getString(this.propertiesService
						.getString("namecheck.checkplus.return_error_url"), "");

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
		String customize = "";

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
	@RequestMapping("/pc/common/checkPlusSuccess")
	public ModelAndView checkPlusSuccess(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		CPClient client = new CPClient();

		/** NICE로부터 부여받은 사이트 코드 */
		String siteCode = StringUtil.getString(this.propertiesService.getString("namecheck.checkplus.site_cd"), "BR009");
		/** NICE로부터 부여받은 사이트 패스워드 */
		String sitePwd = StringUtil.getString(this.propertiesService.getString("namecheck.checkplus.site_passwd"), "NV5x0wFN0I3R");

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

		String param_r1 = StringUtil.getString( request.getParameter("param_r1"), "");

		if ("join".equals(param_r1)) {
			mv.addObject("closeMsg", closeMsg);
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("frontDomain")+ "/pc/member/infoMemberJoinStep2.do");

		} else if ("findIdPopup".equals(param_r1)) {
			mv.addObject("closeMsg", closeMsg);
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("frontDomain")+ "/pc/member/infoMemberFindIdStep2Popup.do");

		} else if ("findPasswordPopup".equals(param_r1)) {
			mv.addObject("closeMsg", closeMsg);
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("frontDomain")+ "/pc/member/infoMemberFindPasswordStep2Popup.do");

		} else if ("accreditationLogin".equals(param_r1)) {
			mv.addObject("closeMsg", closeMsg);
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("serverSslDomain")+ "/pc/manager/accreditationLoginProc.do");

		}
		// 장바구니 - 비회원주문
		else if ("cart".equals(param_r1)) {
			mv.addObject("closeMsg", closeMsg);
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("serverSslDomain")+ "/pc/cart/cartpayment.do");
		}
		mv.setViewName("pc/common/result");

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
	@RequestMapping("/pc/common/checkPlusError")
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
			mv.addObject("returnUrl", request.getAttribute("frontDomain")
					+ "/pc/member/infoMemberJoinStep1.do");

		} else if ("findIdPopup".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("frontDomain")
					+ "/pc/member/infoMemberFindIdStep1Popup.do");

		} else if ("findPasswordPopup".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("frontDomain")
					+ "/pc/member/infoMemberFindPasswordStep1Popup.do");

		} else if ("accreditationLogin".equals(param_r1)) {
			mv.addObject("closeMsg", "인증에 실패하였습니다.");
			mv.addObject("parentReload", "Y");
			mv.addObject("returnUrl", request.getAttribute("serverSslDomain")
					+ "/pc/manager/accreditationLoginProc.do");

		}
		
		mv.setViewName("pc/common/result");

		return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName		: checkLogin
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
	@RequestMapping(value = "/pc/common/checkLogin", method = RequestMethod.POST)
	public JSON checkLogin(HttpServletRequest request) throws Exception {
		JSON json = new JSON();

		if (SessionsUser.isLogin(request)) {
			json.put("result", "Y");
		} else {
			json.put("result", "N");
		}

		return json;
	}

	/**
	* <pre>
	* 1. MethodName : commonCardEventPopup
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 카드 이벤트 안내 팝업
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/common/commonCardEventPopup")
	public ModelAndView commonCardEventPopup(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("cardInfo", this.pcCommonService.selectCardBoardInfo(commandMap));
		
		mv.addObject("commandMap", commandMap);
		mv.setViewName("pc/card/commonCardEventPopup");
		
		return mv;
	}

	/**
     * @api {POST} /pc/common/commonFileDownload.do
     * @apiName 첨부 파일 다운로드
     * @apiGroup 공통
     * 
     * @apiParam {String} CMM_FLE_IDX 파일IDX
     * @apiParam {String} CMM_FLE_SAVE_PATH 파일경로
     * @apiParam {String} CMM_FLE_ORG_NM 파일명
     * 
     * @apiSuccess {Object} downloadFile 다운로드파일
     * @apiSuccess {String} orgFileName 원본파일이름
     */
	@RequestMapping("/pc/common/commonFileDownload")
	public ModelAndView commonFileDownload(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("downloadView");
		if (!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), ""))) {
			// 파일 다운로드 수 증가
			int result = this.pcCommonService
					.updateCommonFileDownCount(commandMap);

			if (result > 0) {
				String webPath = StringUtil.getString(
						commandMap.get("CMM_FLE_SAVE_PATH"), "");
				String orgFileName = StringUtil.getString(
						commandMap.get("CMM_FLE_ORG_NM"), "");
				File file = new File(webPath);
				mv.addObject("downloadFile", file);
				mv.addObject("orgFileName", orgFileName);
			}
		}

		return mv;
	}
	

	/**
	 * <pre>
	 * 1. MethodName : popup
	 * 2. ClassName  : CommonController.java
	 * 3. Comment    :  PC 팝업화면
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 9. 4.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/common/popup.do")
    public ModelAndView popup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();        
        commandMap.put("POP_MST_IDX",commandMap.get("idx"));
        mv.addObject("popup", this.pcCommonService.selectPopupInfo(commandMap));
        mv.setViewName("pc/common/popup");
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : facebookclose
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 페이스북 팝업 닫기
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 11. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/common/facebookclose.do")
    public ModelAndView facebookclose(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : sampleFileDownload
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 샘플 파일 다운로드
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 28.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/common/sampleFileDownload")
    public ModelAndView sampleFileDownload (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView("downloadView");
        String fileName = StringUtil.getString(commandMap.get("fileName"), "");
        
        if(!"".equals(fileName))
        {
        	String webPath = this.propertiesService.getString("file.docs.uploadPath") + "/samples/" + fileName;
        	
            File file = new File(webPath);
            mv.addObject("downloadFile", file);
            mv.addObject("orgFileName", fileName);
        }
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : commonZipCodePopup
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 우편번호 팝업
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/common/commonZipCodePopup")
	public ModelAndView commonZipCodePopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(!"".equals(StringUtil.getString(commandMap.get("searchSido"),"")))
		{
			// 우편번호 검색 목록 갯수
			int totalCount = StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ? 0 : this.commonService.selectCommonZipCodeListCount(commandMap);
			
//			Paging paging = new Paging(totalCount, commandMap);
//			mv.addObject( "paging", paging );
//
//	        commandMap.put("startNum", paging.getStartNum());
//	        commandMap.put("endNum", paging.getEndNum());
	        
	        List<Map<String, Object>> list = null;
	        
	        if(totalCount > 0)
	        {
	        	// 우편번호 검색 목록
	        	list = this.commonService.selectCommonZipCodeList(commandMap);
	        }

	        mv.addObject("list", list);
	        
		}		
		
		// 지역코드
		mv.addObject("sidoList", this.commonService.selectCode("AREA_CD"));
		
		// 프로토콜 여부 (https : true / http : false)
		boolean secureYn = request.isSecure();
		String domain = "";
		
		if(secureYn)
		{
			domain = StringUtil.getString(request.getAttribute("serverSslDomain"));
		}
		else
		{
			domain = StringUtil.getString(request.getAttribute("frontDomain"));
		}
		
		mv.addObject("domain", domain);
		mv.addObject("protocol", secureYn);
		mv.addObject("commandMap", commandMap);
		
		// 우편번호 검색 tab
		String searchType = StringUtil.getString(commandMap.get("searchType"),"");
		
		// 통합검색
		if("BASIC".equals(searchType))
		{
			mv.setViewName("/pc/common/zipcode/zipCodeBasic");
		}
		// 도로명검색
		if("DORO".equals(searchType))
		{
			mv.setViewName("/pc/common/zipcode/zipCodeDoro");
		}
		// 지번검색
		else if("JIBUN".equals(searchType))
		{
			mv.setViewName("/pc/common/zipcode/zipCodeJibun");
		}
		// 건물명검색
		else if("BUILDING".equals(searchType))
		{
			mv.setViewName("/pc/common/zipcode/zipCodeBuilding");
		}
		else
		{
			mv.setViewName("/pc/common/zipcode/zipCodeBasic"); /*통합검색 개발 완료되면 주석 풀고 다음라인 삭제*/
			//mv.setViewName("/pc/common/zipcode/zipCodeDoro");
		}
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : commonZipCodePopupSigunguAjax
	* 2. ClassName  : CommonController.java
	* 3. Comment    : 시/도 선택에 따른 시/군/구 목록 조회
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/common/commonZipCodePopupSigunguAjax")
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
	 * 
	 * <pre>
	 * 1. MethodName : commonIpCheckAjax
	 * 2. ClassName : CommonController.java
	 * 3. Comment : 날씨 > IP 정보 DB 에 있는 지 체크 및 정보 반환. 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 4.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/common/commonIpCheckAjax")
	public JSON commonIpCheckAjax(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
		JSON json 		= new JSON();
		String resultChk	= "N";
		
		/* 날씨 관련 IP 수집을 위해 추가 2016-02-04  Lee */
		String remoteIp 			= request.getRemoteAddr();
		commandMap.put("remoteIp", remoteIp);
		
		int totalCount			= this.pcCommonService.selectIpCheckCount(commandMap);
		
		if(totalCount > 0){
			resultChk		= "Y";
			Map info			= this.pcCommonService.selectIpLocationInfo(commandMap);
			
			json.addObject("info", info);
		}
		
		json.addObject("resultChk", resultChk);
		
		return json;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : commonIpInsertAjax
	 * 2. ClassName : CommonController.java
	 * 3. Comment : 날씨 > IP 정보 등록 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 2. 4.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/common/commonIpInsertAjax")
	public JSON commonIpInsertAjax(HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
		JSON json 		= new JSON();
		
		String remoteIp 			= request.getRemoteAddr();
		commandMap.put("remoteIp", remoteIp);
		
		int totalCount			= this.pcCommonService.selectIpCheckCount(commandMap);
		
		if(totalCount == 0){
			this.pcCommonService.insertLocationIp(commandMap);
		}
		
		Map info			= this.pcCommonService.selectIpLocationInfo(commandMap);
		json.addObject("info", info);
		return json;
	}
		
	/**
	 * 
	 * <pre>
	 * 1. MethodName : commonFrontIpInsertAjax
	 * 2. ClassName : CommonController.java
	 * 3. Comment : 날씨 > 메인에서 지역 설정
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 14.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/common/commonFrontIpInsertAjax")
	public JSON commonFrontIpInsertAjax(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception{
		JSON json 		= new JSON();
		
		String remoteIp 			= request.getRemoteAddr();
		commandMap.put("remoteIp", remoteIp);
		
		int totalCount			= this.pcCommonService.selectIpCheckCount(commandMap);
		
		Map info				= this.pcCommonService.selectCodeUpInfo(commandMap);
		
		commandMap.put("CTY_GGU_NM", info.get("CMN_COM_NM"));
		commandMap.put("CTY_SDO_NM", info.get("CMN_COM_UP_IDX_NM"));
		commandMap.put("LOC_INF_ADR", info.get("CMN_COM_UP_IDX_NM") + " " + info.get("CMN_COM_NM"));
		
		if(totalCount == 0){
			this.pcCommonService.insertLocationIp(commandMap);
		}else{
			this.pcCommonService.updateLocationIp(commandMap);
		}
		
		Map<String, Object> areaResultMap			= new HashMap<String, Object>();
    	int areaResultMapCount						= this.pcCommonService.selectIpCheckCount(commandMap);
    	
    	// IP 같은 정보가 있다면 정보를 쿠키로 만든다.
    	if(areaResultMapCount > 0){
    		areaResultMap							= this.pcCommonService.selectIpLocationInfo(commandMap);    
    		
    		// 없으면 이상???
    		if(areaResultMap.size() > 0){
    			
    			// 쿠키를 삭제하고 새로 생성한다.
    			Cookie kc = new Cookie("areaInfo", null) ;
        	    kc.setMaxAge(0) ;
        	    response.addCookie(kc) ;
        	    
        	    
    			String areaInfo		= "";
    			
    			Iterator keys = areaResultMap.keySet().iterator();
        		while(keys.hasNext()) {
        			String cookieName = (String) keys.next();
        			areaInfo = areaInfo + cookieName + "=" +AesCrypto.encrypt(StringUtil.getString(areaResultMap.get(cookieName))) + "#";
        		}
        		
    			Cookie areaCoookie	= new Cookie("areaInfo", areaInfo);
    			areaCoookie.setPath("/");
    			response.addCookie(areaCoookie);
    			json.addObject("info", areaResultMap);
    		}
    	}
    	
		return json;
	}
	
    /**
     * <pre>
     * 1. MethodName	: loginDummy
     * 2. ClassName		: CommonController.java.java
     * 3. Commnet		: 프론트 > 로그인 개인화 부분
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 1. 오후 6:17:59
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/global/xtractor/loginDummy")
    public ModelAndView loginDummy (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/global/xtractor/loginDummy");
        return mv;        
    } 	
    
    /**
     * <pre>
     * 1. MethodName	: favoriteDummy
     * 2. ClassName		: CommonController.java.java
     * 3. Commnet		: 프론트 > 장바구니 개인화 부분
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 1. 오후 6:17:59
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/global/xtractor/favoriteDummy")
    public ModelAndView favoriteDummy (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/global/xtractor/favoriteDummy");
        return mv;        
    } 	 
    
    /**
     * <pre>
     * 1. MethodName	: sympathyDummy
     * 2. ClassName		: CommonController.java.java
     * 3. Commnet		: 프론트 > Wla 개인화 부분
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 1. 오후 6:17:59
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/global/xtractor/sympathyDummy")
    public ModelAndView sympathyDummy (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/global/xtractor/sympathyDummy");
        return mv;        
    } 
    
    /**
     * <pre>
     * 1. MethodName	: orderDummy
     * 2. ClassName		: CommonController.java.java
     * 3. Commnet		: 프론트 > 구매완료 개인화 부분
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 1. 오후 6:17:59
     * </pre>
     *
     * @return ModelAndView
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/global/xtractor/orderDummy")
    public ModelAndView orderDummy (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/global/xtractor/orderDummy");
        return mv;        
    } 	
    
    /**
     * <pre>
     * 1. MethodName : StorageAjax
     * 2. ClassName  : CommonController.java
     * 3. Comment    : 결제정보 임시저장 데이터 암호화 공통
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 3.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @FrontBannerSkip()
    @RequestMapping(value="/pc/Storage/StorageAjax.do")
    public JSON StorageAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        String[] StorageStrs = request.getParameterValues("StorageStr[]");         
        String StorageType = StringUtil.getString(commandMap.get("StorageType"),"E");
        String StorageResult = "";
        ArrayList<String> StorageStrArray = new ArrayList<String>();
        if(StorageStrs.length > 0){
            for(String arryStorageStrs : StorageStrs){
                if(!arryStorageStrs.equals("")){
                    if(StorageType.equals("E")){
                        StorageStrArray.add(AesCrypto.encrypt(arryStorageStrs));
                    }else{
                        StorageStrArray.add(AesCrypto.decrypt(arryStorageStrs));
                    }
                }
            }
            StorageResult = "Y";
        }else{
            StorageResult = "N";
        }
        json.put("StorageResult", StorageResult);
        json.put("StorageStrArray", StorageStrArray);
        return json;
    }
    
    @FrontBannerSkip()
    @RequestMapping(value="/pc/common/paramFilterCheckAjax.do")
    public JSON paramFilterCheckAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        Map<String, Object> resultMap = this.commonService.selectBanWrdKeyWord(commandMap);
        
        json.put("banText", StringUtil.getString(resultMap.get("BanKeyWord"),""));

        return json;
    }
    
    /**
     * @api {POST} /upload/userProfileUploadAjax.do
     * @apiName 회원프로필 파일업로드
     * @apiGroup 회원정보
     * 
     * @apiParam {File} upload MultipartRequest File
     * 
     * @apiSuccess {String} CMM_FLE_ATT_EXT": 확장명
     * @apiSuccess {String} CMM_FLE_ATT_SIZE": 파일크기 
     * @apiSuccess {String} CMM_FLE_SYS_NM": 파일명
     * @apiSuccess {String} CMM_FLE_ATT_PATH 업로드 CDN 이후 경로
     * @apiSuccess {String} REG_IP 등록자 IP
     * @apiSuccess {String} CMM_FLE_ORG_NM 원본파일명
     * @apiSuccess {String} CMM_FLE_SYS_PATH 시스템 경로
     * @apiSuccess {String} CMM_FLE_USE_YN" 사용여부

     */
    @FrontBannerSkip
	@RequestMapping(value="/upload/userProfileUploadAjax")
	public JSON userProfileUploadAjax(HttpServletRequest  request,
			HttpServletResponse response, Map<String, Object> commandMap) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("upload");
		JSON responseJson = null;
		if (file != null) {
			Map<String, Object> tempMap = fileUpload.execute(commandMap, file, null, "", "Y");
			tempMap.remove("CMM_FLE_SYS_PATH");
			tempMap.remove("REG_IP");
			tempMap.remove("CMM_FLE_WEB_PATH");
			responseJson = new JSON();
			responseJson.addAllObjects(tempMap);
		}
		return responseJson;
	}
    /**
     * <pre>
     * 1. MethodName : getPostAddrApi
     * 2. ClassName  : CommonController.java
     * 3. Comment    : 우편번호 / 도로명 주소 조회
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 30.
     * </pre>
     *
     * @param req
     * @param response
     * @param commandMap
     * @throws Exception
     */
    @RequestMapping(value="/pc/common/getPostAddrApi")
     public void getPostAddrApi(HttpServletRequest req, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         String currentPage = StringUtil.getString(commandMap.get("currentPage"), "");
         String countPerPage = StringUtil.getString(commandMap.get("countPerPage"), "") ;
         String confmKey = Code.POST_API_KEY;
         String keyword = StringUtil.getString(commandMap.get("keyword"), "");
         String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey;

         HttpURLConnection conn = null;
         URL url = null;
         try{
             String tokenString = "";
             String xmlString = "";
  
             url = new URL(apiUrl);
             conn = (HttpURLConnection)url.openConnection();
             conn.setRequestMethod("GET");
             conn.setRequestProperty("Cache-Control", "no-cache");
             conn.setRequestProperty("Content-Type", "application/xml");
             conn.setDoInput(true);
             conn.setDoOutput(true);
  
             if(conn.getResponseCode() == 200){
                 BufferedReader accessTokenResult = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      
                 while((tokenString = accessTokenResult.readLine()) != null){
                     xmlString += tokenString;
                 }
                 response.setCharacterEncoding("UTF-8");
                 response.setContentType("text/xml");
                 response.getWriter().write(xmlString.toString());
             }
             conn.disconnect();
         }catch(Exception e){
             if(conn!=null)
             {
                 try{
                     conn.disconnect();
                 }catch(Exception ex){}
             }
         }
     }
    
    @RequestMapping({"/pc/common/testImageUploader"})
    public JSON testImageUploader(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception {
      JSON json = new JSON();
      String type = StringUtil.getString(commandMap.get("type"), "");
      String result = "";
      try {
        if ("upload".equals(type)) {
          commandMap = this.pcCommonService.testUploadMultiImage((MultipartHttpServletRequest)request, commandMap);
          json.put("success", "true");
          json.put("data", commandMap);
        } else if ("delete".equals(type)) {
          result = this.pcCommonService.testDeleteMultiImage(commandMap);
          json.put("success", result);
        } 
      } catch (Exception exception) {}
      return json;
    }
}
