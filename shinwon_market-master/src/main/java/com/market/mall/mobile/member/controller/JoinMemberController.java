package com.market.mall.mobile.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.sns.service.SnsManagerService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.common.mail.service.MailService;
import com.market.mall.ifcomm.siren.SirenCert;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.tag.WSH_TAG_MODEL;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.impl.AgreementBoardServiceImpl;
import com.market.mall.pc.manager.service.LoginManagerService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.tag.service.TagService;
import com.market.mall.pc.tag.service.WishTagService;
import com.market.util.ObjectToJsonUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.mobile.member.controller
 * @FileName : JoinMemberController.java
 * @Date : 2016. 2. 12.
 * @프로그램 설명 : 모바일 > 회원가입을 처리하는 Controller Class
 * @author DEV_KIMSOYOUNG
 */
@Controller("mobileJoinMemberController")
public class JoinMemberController {

	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	
	@Autowired
	private SirenCert sirenCert;
	
	@Resource(name="pcJoinMemberService")	 private JoinMemberService pcJoinMemberService;
	
	@Resource(name="pcCommonService") 		 private CommonService pcCommonService;
	
	@Resource(name="pcLoginManagerService")	 private LoginManagerService pcLoginManagerService;
	
	@Resource(name="snsManagerService")		 private SnsManagerService snsManagerService;
	
	@Resource(name="mailSendingService")	 private MailService mailService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AgreementBoardServiceImpl agreementBoardServiceImpl;
	
	@Autowired
	TagService tagService;
	
	@Autowired
	WishTagService wishTagService;
	
	
	/**
	* <pre>
	* 1. MethodName : joinMemType
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 회원분류(통합회원, 간편회원, 기업회원)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemType")
	public ModelAndView joinMemType (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("snsUseList", this.snsManagerService.selectSnsUseList(commandMap));
		if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
        }
		// SNS 로그인 시 미가입 회원 SNS정보 사용
			mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : joinMemBasicStep1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 통합회원 > 본인인증(STEP1)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param response
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemBasicStep1")
	public ModelAndView joinMemBasicStep1 (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

		if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
        }
		else if("".equals(StringUtil.getString(commandMap.get("gubun"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		else
		{
			// BIZSIREN 본인인증 DATA 생성
			String reqInfo = sirenCert.getSirenCertReqInfo(request, response, "");

			// 본인실명확인 결과수신 URL
			String retUrl   = "32" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.siren.certReturnUrl");
			
			mv.addObject("reqInfo", reqInfo);
			mv.addObject("retUrl", retUrl);
			mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));
			
			// BIZSIREN IPIN 본인인증 DATA 생성
			String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
			
			// I-PIN 본인실명확인 결과수신 URL
			String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("mobileSslDomain"),"") + propertiesService.getString("m.ipin.certReturnUrl") + "?gubun=JOIN";
			
			mv.addObject("ipinReqInfo", ipinReqInfo);
			mv.addObject("ipinRetUrl", ipinRetUrl);
			mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : sirenResResult
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 본인인증(STEP1) 인증 결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	//@SuppressWarnings("unchecked")
	@RequestMapping("/mobile/member/sirenResResult")
	public ModelAndView sirenResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 사이렌 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenInfo = sirenCert.getSirenCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenInfo.get("ci1"));			// CI값
		//commandMap.put("MEM_IPN_CI", "+pzpqszpKtvCWviM8I8C2FO7rTGMQAo/GnRkW7lI515BeCX8M8FTmOQtCh+K3/Vs3MAo7UDPFGC0QGf8MiWmwA==");
		commandMap.put("MEM_MST_MEM_NM", sirenInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenInfo.get("birYMD"));	// 생년월일
		commandMap.put("gubun", "JOIN");	                        // 구분값
		
		// 인증 접근 실패
		if("N".equals(sirenInfo.get("msgChk"))) 
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증 접근 성공
		else
		{
			// 인증성공여부 (Y: 성공 / N : 실패 / F : 3회오류)
			String result = StringUtil.getString(sirenInfo.get("result"),"");	
			
			// 성공
			if("Y".equals(result))
			{
				// 가입여부 체크
				Map<String,Object> returnMap = this.pcJoinMemberService.selectJoinCheck(commandMap);
				
				String resultMsg = (String) returnMap.get("resultMsg"); 
				
				logger.info("############################## 회원가입 본인인증 결과 값 ##########################################");
				logger.info("--> resultMsg : " + resultMsg);
				
				// 이미 본인인증로 가입된 회원
				if("F01".equals(resultMsg))
				{
					mv.addObject("resultMsg", "이미 본인인증로 가입된 회원입니다.\\n로그인 해주세요.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
				}
				else
				{
					// 신규 회원가입
					if("S01".equals(resultMsg))
					{ 
					    commandMap.put("MEM_IPN_SEX", sirenInfo.get("sex"));            // 성별(M : 남자 / F : 여자)
                        commandMap.put("MEM_IPN_FGN", sirenInfo.get("fgnGbn"));         // 내외국인구분(1 : 내국인 / 2 : 외국인)
                        commandMap.put("MEM_IPN_DI", sirenInfo.get("di"));              // DI
                        commandMap.put("MEM_IPN_CI_VER", sirenInfo.get("civersion"));   // CI Version
                        commandMap.put("MEM_IPN_AUT_GB", Code.MEMBER_AUTH_HP);          // 인증수단(H : 휴대폰)
                        commandMap.put("MEM_IPN_RST", result);                          // 인증성공(Y)
                        commandMap.put("MEM_IPN_HP_CRP", sirenInfo.get("cellCorp"));    // 이동통신사
                        commandMap.put("MEM_IPN_CRT_DT", sirenInfo.get("certDate"));    // 인증요청시간 
					}
				}
			}
			// 실패
			else if("N".equals(result))
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
			// 3회오류
			else if("F".equals(result))
			{
				mv.addObject("closeMsg", "본인 인증 3회 오류가 발생하였습니다.");
			}
			else
			{
				mv.addObject("closeMsg", "알수 없는 오류가 발생하였습니다.");
			}
		}
		
		mv.setViewName("/mobile/member/sirenResResult");
		mv.addObject("commandMap", commandMap);

		return mv; 
	}
	
	/**
	* <pre>
	* 1. MethodName : sirenIpinResResult
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > I-PIN 인증 결과
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@SuppressWarnings("unchecked")
	@RequestMapping("/mobile/member/sirenIpinResResult")
	public ModelAndView sirenIpinResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

		//사이렌 I-PIN 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenIpinInfo = sirenCert.getSirenIpinCertResultInfo(request, commandMap);
		
		//commandMap.put("MEM_IPN_CI", sirenIpinInfo.get("ciscrHash"));	// CI값
		commandMap.put("MEM_IPN_CI", "mobile7");
		commandMap.put("MEM_MST_MEM_NM", sirenIpinInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenIpinInfo.get("birth"));	// 생년월일
		
		// 인증 접근 실패
		if("N".equals(sirenIpinInfo.get("msgChk")))
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증 접근 성공
		else
		{
			// 인증성공여부 (1:성공)
			String result = StringUtil.getString(sirenIpinInfo.get("result"),"");	

			// 성공
			if("1".equals(result))
			{
				// 가입여부 체크
				Map<String,Object> returnMap = this.pcJoinMemberService.selectJoinCheck(commandMap);

				int returnVal = Integer.valueOf(StringUtil.getString(returnMap.get("returnVal"),"0"));
				
				Map<String,Object> erpMemberInfo = new HashMap<String, Object>();
				
				System.out.println("returnVal : " + returnVal);
				
				// 이미 통합회원
				if(returnVal == -5)
				{
					mv.addObject("resultMsg", "이미 가입된 회원입니다.\\n로그인 해주세요.");
					mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do");
				}
				else
				{
					
					// 신규 회원가입
					if(returnVal == -1)
					{
						commandMap.put("MEM_IPN_NO", sirenIpinInfo.get("vDiscrNo"));					// 아이핀 번호
						commandMap.put("MEM_IPN_AGE", sirenIpinInfo.get("age"));						// 연령대
						commandMap.put("MEM_IPN_SEX", sirenIpinInfo.get("sex"));						// 성별(M : 남자 / F : 여자)
						commandMap.put("MEM_IPN_AUT", sirenIpinInfo.get("authInfo"));					// 발급수단정보 ( 0 : 본인 공인인증서 / 1 : 본인 신용카드 / 2 : 본인 핸드폰 / 3 : 본인 대면확인 / 4 : 신원보증인 아이핀 / 5 : 신원보증인 공인인증서 / 6 : 신원보증인 신용카드 / 7 : 신원보증인 핸드폰 / 8 : 신원보증인 대면확인 / 9 : 본인 외국인등록번호 / 10 : 본인 여권번호 )
						commandMap.put("MEM_IPN_FGN", sirenIpinInfo.get("fgn"));						// 내외국인구분(0 : 내국인 / 1 : 외국인)
						commandMap.put("MEM_IPN_DI", sirenIpinInfo.get("discrHash"));					// DI
						commandMap.put("MEM_IPN_CI_VER", sirenIpinInfo.get("ciVersion"));				// CI Version
						commandMap.put("MEM_IPN_AUT_GB", propertiesService.getString("ipin.certGb"));	// 인증수단(I : 아이핀)
						commandMap.put("MEM_IPN_RST", result);	
						
						mv.addObject("resultMsg", "본인 인증 처리되었습니다.");
						commandMap.put("gubun", request.getParameter("gubun"));							// 본인인증 페이지 구분값(회원가입 - JOIN)
					}
					// 온라인회원 -> 통합회원으로 전환 (멤버십 발행 포함)
					else if(returnVal == -2)
					{
						commandMap.put("returnVal", returnVal);
						commandMap.put("MEM_IPN_SEX", sirenIpinInfo.get("sex"));						// 성별(M : 남자 / F : 여자)
						commandMap.put("MEM_IPN_DI", sirenIpinInfo.get("discrHash"));					// DI
						commandMap.put("MEM_MST_MEM_ID", returnMap.get("MEM_MST_MEM_ID"));
						commandMap.put("MEM_MST_MEM_NM", returnMap.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_MAIL", returnMap.get("MEM_MST_MAIL"));
						commandMap.put("MEM_MST_RCM_ID", returnMap.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_TEL1", returnMap.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", returnMap.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", returnMap.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_HP1", returnMap.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", returnMap.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", returnMap.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_BIR_DT", returnMap.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_ZIP_CDE5", returnMap.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("MEM_MST_DRO_ADR1", returnMap.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", returnMap.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_JBN_ADR1", returnMap.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", returnMap.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_REG_DT", returnMap.get("MEM_MST_REG_DT"));
						commandMap.put("MEM_MST_ERP_ID", returnMap.get("MEM_MST_ERP_ID"));
						commandMap.put("TRM_YN0001", returnMap.get("SMS_YN"));
						commandMap.put("TRM_YN0002", returnMap.get("TM_YN"));
						commandMap.put("TRM_YN0003", returnMap.get("DM_YN"));
						commandMap.put("TRM_YN0004", returnMap.get("EMAIL_YN"));
						commandMap.put("TRM_YN0005", returnMap.get("SK_YN"));
						commandMap.put("TRM_YN0006", returnMap.get("S_CARD_YN"));
						commandMap.put("TRM_YN0007", returnMap.get("S_ELEC_YN"));
						commandMap.put("TRM_YN0008", returnMap.get("LG_YN"));
						commandMap.put("erpInfoYn", returnMap.get("erpInfoYn"));
						commandMap.put("membershipYn", returnMap.get("membershipYn"));
					}
					// 오프라인회원 -> 통합회원으로 전환 
					else if(returnVal == -3 || returnVal == -4)
					{
						erpMemberInfo = (Map<String,Object>)returnMap.get("erpMemberInfo");
						
						commandMap.put("returnVal", returnVal);
						commandMap.put("MEM_IPN_SEX", sirenIpinInfo.get("sex"));						// 성별(M : 남자 / F : 여자)
						commandMap.put("membershipYn", returnMap.get("membershipYn"));
						commandMap.put("MEM_IPN_DI", erpMemberInfo.get("MEM_IPN_DI"));
						commandMap.put("MEM_MST_ERP_ID", erpMemberInfo.get("MEM_MST_ERP_ID"));
						commandMap.put("MEM_MST_OCB_NO", erpMemberInfo.get("MEM_MST_OCB_NO"));
						commandMap.put("MEM_MST_MEM_NM", erpMemberInfo.get("MEM_MST_MEM_NM"));
						commandMap.put("MEM_MST_JBN_ADR1", erpMemberInfo.get("MEM_MST_JBN_ADR1"));
						commandMap.put("MEM_MST_JBN_ADR2", erpMemberInfo.get("MEM_MST_JBN_ADR2"));
						commandMap.put("MEM_MST_DRO_ADR1", erpMemberInfo.get("MEM_MST_DRO_ADR1"));
						commandMap.put("MEM_MST_DRO_ADR2", erpMemberInfo.get("MEM_MST_DRO_ADR2"));
						commandMap.put("MEM_MST_ZIP_CDE6", erpMemberInfo.get("MEM_MST_ZIP_CDE6"));
						commandMap.put("MEM_MST_ZIP_CDE5", erpMemberInfo.get("MEM_MST_ZIP_CDE5"));
						commandMap.put("TRM_YN0001", erpMemberInfo.get("TRM_YN0001"));
						commandMap.put("TRM_YN0002", erpMemberInfo.get("TRM_YN0002"));
						commandMap.put("TRM_YN0003", erpMemberInfo.get("TRM_YN0003"));
						commandMap.put("TRM_YN0004", erpMemberInfo.get("TRM_YN0004"));
						commandMap.put("MEM_MST_HP1", erpMemberInfo.get("MEM_MST_HP1"));
						commandMap.put("MEM_MST_HP2", erpMemberInfo.get("MEM_MST_HP2"));
						commandMap.put("MEM_MST_HP3", erpMemberInfo.get("MEM_MST_HP3"));
						commandMap.put("MEM_MST_TEL1", erpMemberInfo.get("MEM_MST_TEL1"));
						commandMap.put("MEM_MST_TEL2", erpMemberInfo.get("MEM_MST_TEL2"));
						commandMap.put("MEM_MST_TEL3", erpMemberInfo.get("MEM_MST_TEL3"));
						commandMap.put("MEM_MST_BIR_DT", erpMemberInfo.get("MEM_MST_BIR_DT"));
						commandMap.put("MEM_MST_RCM_ID", erpMemberInfo.get("MEM_MST_RCM_ID"));
						commandMap.put("MEM_MST_MAIL", erpMemberInfo.get("MEM_MST_MAIL"));
						commandMap.put("offRegDt", erpMemberInfo.get("MEM_MST_REG_DT"));
						commandMap.put("EXMILEGE", returnMap.get("EXMILEGE"));
						commandMap.put("P8E1CTDG", erpMemberInfo.get("P8E1CTDG"));
						commandMap.put("SOLUBLE_MILEAGE", returnMap.get("SOLUBLE_MILEAGE"));
					}
					else
					{
						mv.addObject("closeMsg", "회원가입 도중 오류가 발생하였습니다.");
					}
				}
			}
			// 실패
			else
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
		}
		
		mv.setViewName("/mobile/member/sirenIpinResResult");
		mv.addObject("commandMap", commandMap);

		return mv; 
	}
	
	/**
	* <pre>
	* 1. MethodName : joinMemBasicStep2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 통합회원 > 약관동의(STEP2)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	/*@RequestMapping("/mobile/member/joinMemBasicStep2")
	public ModelAndView joinMemBasicStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		
		ModelAndView mv = new ModelAndView();
		
		if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;	
	}*/
	
	@RequestMapping("/mobile/member/joinMemBasicStep2")
	public ModelAndView joinMemBasicStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		//mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
		
		mv.addObject("agreementList", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementIndex(Integer.toString(Code.AGREEMENT_JOINSUS)));
		mv.addObject("commandMap", commandMap);
		return mv;	
	}
	/**
	* <pre>
	* 1. MethodName : joinMemStep3
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 통합회원,간편회원 > 정보입력(STEP3)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemStep3")
	public ModelAndView joinMemStep3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
	       /* if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")) && "".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"),"")))
	        {
	            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
	            // 해당 브랜드로 이동
	            mv.setViewName("pc/common/result");
	        }*/
	        
	        // Common Codes
	        Map<String,Object> dupCheckByDi = pcJoinMemberService.selectJoinCheck(commandMap);
	        if(!"S01".equals(StringUtil.getString(dupCheckByDi.get("resultMsg"),""))) {
	        	mv.addObject("alertMsg", "이미 본인인증으로 가입되었습니다.\\n로그인 해주세요.");
	    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
	    	    mv.setViewName("pc/common/result");
	    	    return mv;
	        }
	        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE", "TEL_CODE"};
	        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
	        mv.addObject("commandMap", commandMap);
	        
	        
	        if(commandMap.containsKey("MEM_MST_HP") && (StringUtil.getString(commandMap.get("MEM_MST_HP")).length()==10 || StringUtil.getString(commandMap.get("MEM_MST_HP")).length()==11)) {
				String MEM_MST_HP = StringUtil.getString(commandMap.get("MEM_MST_HP"));
				int cellphoneNumberLength = MEM_MST_HP.length();
				String MEM_MST_HP1 = MEM_MST_HP.substring(0,3);
				String MEM_MST_HP2 = MEM_MST_HP.substring(3,cellphoneNumberLength-4);
				String MEM_MST_HP3 = MEM_MST_HP.substring(cellphoneNumberLength-4,cellphoneNumberLength);
				commandMap.put("MEM_MST_HP1", MEM_MST_HP1);
				commandMap.put("MEM_MST_HP2", MEM_MST_HP2);
				commandMap.put("MEM_MST_HP3", MEM_MST_HP3);
			}
	        return mv;
	    }
	
	 /**
     * @api {get} /mobile/member/joinMemStep4.do
     * @apiName 회원 태그 등록
     * @apiGroup 회원가입
     * @apiSuccess {OBJECT[]} tagList
     * 
     * @apiError {JSON} RESULT_CODE 400
     */
    @RequestMapping("/mobile/member/joinMemStep4")
    public ModelAndView joinMemStep4 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
        commandMap.put("TAG_BND_ID", "3720");
        commandMap.put("TAG_BND_TYPE", "TYPE_DISPLAY");
        mv.addObject("tagList", tagService.selectTagListById(commandMap));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * @api {get} /mobile/member/joinMemStep5.do
     * @apiName 회원 태그 입력
     * @apiGroup 회원가입
     * @apiSuccess {OBJECT[]} tagList
     * 
     * @apiError {JSON} RESULT_CODE 400
     */
   @RequestMapping("/mobile/member/joinMemStep5")
    public ModelAndView joinMemStep5 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
	   ModelAndView mv = new ModelAndView();
       commandMap.put("TAG_BND_ID", "3720");
       commandMap.put("TAG_BND_TYPE", "TYPE_DISPLAY");
       mv.addObject("tagList", tagService.selectTagListById(commandMap));
       mv.addObject("commandMap", commandMap);
       return mv;
    }
   
   @RequestMapping("/mobile/member/joinMemStep6")
   public ModelAndView joinMemStep6 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
   {
	   ModelAndView mv = new ModelAndView();
       commandMap.put("TAG_BND_ID", "3720");
       commandMap.put("TAG_BND_TYPE", "TYPE_DISPLAY");
       mv.addObject("tagList", tagService.selectTagListById(commandMap));
       mv.addObject("commandMap", commandMap);
       return mv;
   }
	
	/**
	* <pre>
	* 1. MethodName : checkIdAjax
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 통합회원,간편회원 > 정보입력(STEP3) > 아이디 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/member/checkIdAjax")
	public JSON checkIdAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "")))
        {
            // 아이디 중복 체크
            int idCount = this.pcJoinMemberService.selectCheckIdCount(commandMap);
            
            if( idCount > 0)
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
        
        return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : joinMemberRegist
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 통합회원,간편회원 > 정보입력(STEP3) > 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemberRegist")
	public ModelAndView joinMemberRegist (HttpServletRequest request,HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		logger.debug("commandMap"+commandMap);
		ModelAndView mv = new ModelAndView();
		
		String MEM_MST_MEM_ID = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),"");
		String MEM_CTF_MAIL = StringUtil.getString(commandMap.get("MEM_CTF_MAIL"),"");
		String MEM_CPR_NM = StringUtil.getString(commandMap.get("MEM_CPR_NM"),"");
		String joinType = StringUtil.getString(commandMap.get("joinType"),"");
		String MEM_SNS_TYPE = StringUtil.getString(commandMap.get("MEM_SNS_TYPE"),"");
		commandMap.put("MEM_MST_BIR_DT", StringUtil.getString(commandMap.get("MEM_IPN_BIR_DT")));
		commandMap.put("MEM_MST_SEX", StringUtil.getString(commandMap.get("MEM_IPN_SEX")));
		commandMap.put("MEM_IPN_BIR_GB", "Y".equals(StringUtil.getString(commandMap.get("MEM_IPN_BIR_SOLAR")))?"S":"L");
		
        /*------------------------------------------------------------------------------------------------------------*/
		/*Map<String,Object> erpParam = new HashMap<String,Object>();
		erpParam.put("ESHOP_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
		erpParam.put("CUST_NAME", StringUtil.getString(commandMap.get("MEM_MST_MEM_NM")));
		erpParam.put("BIRTHDAY", StringUtil.getString(commandMap.get("MEM_IPN_BIR_DT")));
		erpParam.put("BIRTH_GB", "Y".equals(StringUtil.getString(commandMap.get("MEM_IPN_BIR_SOLAR")))?"1":"2");
		erpParam.put("CELL_PHONE_NO1", StringUtil.getString(commandMap.get("MEM_MST_HP1")));
		erpParam.put("CELL_PHONE_NO2", StringUtil.getString(commandMap.get("MEM_MST_HP2")));
		erpParam.put("CELL_PHONE_NO3", StringUtil.getString(commandMap.get("MEM_MST_HP3")));
		erpParam.put("SEX_GB", StringUtil.getString(commandMap.get("MEM_IPN_SEX").equals("M")?"1":"2"));
		erpParam.put("SMS_YN", StringUtil.getString(commandMap.get("TRM_YN0001")));
		erpParam.put("TM_YN", StringUtil.getString(commandMap.get("TRM_YN0002")));
		erpParam.put("DM_YN", StringUtil.getString(commandMap.get("TRM_YN0003")));
		erpParam.put("EMAIL_YN", StringUtil.getString(commandMap.get("TRM_YN0004")));
		erpParam.put("AD_YN", StringUtil.getString(commandMap.get("TRM_YN0005")));
		erpParam.put("KKO_YN", StringUtil.getString(commandMap.get("TRM_YN0006")));
		erpParam.put("EMAIL1", StringUtil.getString(commandMap.get("MEM_MST_MAIL_ID")));
		erpParam.put("EMAIL2", StringUtil.getString(commandMap.get("MEM_MST_MAIL_DOMAIN")));
		erpParam.put("CI_CODE", StringUtil.getString(commandMap.get("MEM_IPN_CI")));
		erpParam.put("FOREIGNER_YN", "0".equals(StringUtil.getString(commandMap.get("MEM_IPN_FGN")))?"N":"Y");
		erpParam.put("AGREE1", "Y");
		erpParam.put("AGREE2", "Y");
		erpParam.put("AGREE3", "Y");
		erpParam.put("AGREE4", "Y");
		erpParam.put("AGREE8", "Y");
		erpParam.put("AGREE9", "Y");*/
		
		/*
		erpParam.put("HP_CHK", "Y");
		erpParam.put("ID_CHK", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
		erpParam.put("HP_COMP", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
		erpParam.put("FOREIGNER_YN", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
		*/
		
		/*erpParam.put("CRYPT_KEY", Code.CRYPT_KEY_TWIN); //SNS
		
		List<Map<String, Object>> list =  ErpRequest.requestJoinMember(erpParam);
		int erpResultCode = 400;
		if(list!=null && list.size()>0 && list.get(0).containsKey("resultCode")) {
			Map<String,Object> erpResponse = list.get(0);
			commandMap.put("MEM_MST_ERP_ID", StringUtil.getString(erpResponse.get("resultMemberID")));
			String MEM_OFF_MEM_YN = StringUtil.getString(erpResponse.get("resultCombineYn"),"N");
			commandMap.put("MEM_OFF_MEM_YN", MEM_OFF_MEM_YN);
			erpResultCode = StringUtil.getInt(erpResponse.get("resultCode"),400);
			if(erpResultCode!=200&erpResultCode!=401) {
    			mv.addObject("alertMsg", StringUtil.getString(erpResponse.get("resultText")));
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do");
                mv.setViewName("mobile/common/result");
                return mv;
    		}
		}*/
		
		
        /*----------------------------------------------- 회원정보 ---------------------------------------------------*/
		if(!"".equals(MEM_CTF_MAIL))
		{
		    commandMap.put("MEM_MST_MAIL", MEM_CTF_MAIL);
		}
		// 일반회원 가입 시
		else
		{ 
	        // 전체 이메일 형식 설정
	        String totalEmail = commandMap.get("MEM_MST_MAIL_ID") + "@" + commandMap.get("MEM_MST_MAIL_DOMAIN");
	        commandMap.put("MEM_MST_MAIL", totalEmail);
		}
		if(!"".equals(MEM_SNS_TYPE)) {
			return this.joinMemberSnsRegist(request, response, commandMap);    	
        }

		Map<String,Object> returnMap = this.pcJoinMemberService.insertMember(request,commandMap);
		
		
        
		// 결과 값
		String resultMsg = StringUtil.getString(returnMap.get("resultMsg"), "");
		/*------------------------------------------------------------------------------------------------------------*/
        /*---------------------------------------- resultMsg :] 코드 시작 ---------------------------------------------*/
		logger.info("############################## 회원가입 resultMsg : 코드 시작 ###################################");
		logger.info("--> resultMsg : " + resultMsg);
		
		if("S01".equals(resultMsg))  
		{			
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemFinish.do");
            //mailService.sendJoinusComplete(commandMap);
            // 가입채널에 대한 쿠키 삭제 
            Cookie del_join_code_cookie = new Cookie("join_code_cookie", "");
            del_join_code_cookie.setMaxAge(0); 
            del_join_code_cookie.setPath("/");
    		response.addCookie(del_join_code_cookie);
    		// 가입채널에 대한 세션 삭제
    		request.getSession().removeAttribute("join_code_cookie");
    		//int erpResultCode = 200;
    		
    		
    		
		}
		// 회원가입 > 아이디 중복
		else if("F11".equals(resultMsg) || "F21".equals(resultMsg) || "F31".equals(resultMsg))
        {
        	mv.addObject("alertMsg", "이미 가입된 아이디입니다.\\n로그인 해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do");
        }
		// 일반회원 > CI값 데이터 누락
        else if("F12".equals(resultMsg))
        {
        	mv.addObject("alertMsg", "데이터 누락이 발생하였습니다.\\n회원가입 페이지로 이동합니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
        }
		// 일반회원 > 본인인증으로 이미 가입
    	else if("F13".equals(resultMsg))
    	{
    	    mv.addObject("alertMsg", "이미 본인인증으로 가입되었습니다.\\n로그인 해주세요.");
    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/manager/login.do");
    	}
		// 회원가입 > 회원가입 실패
    	else if("F99".equals(resultMsg))
    	{
    	    mv.addObject("alertMsg", "회원가입에 실패하셨습니다.\\n회원가입 페이지로 이동합니다.");
    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
    	}
		// 회원가입 > 태그바인딩실패
    	else if("T99".equals(resultMsg))
    	{
    	    mv.addObject("alertMsg", "태그정보 입력에 실패했습니다. \\n회원가입 페이지로 이동합니다.");
    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
    	}
		// Excpetion 에러
        else if("E99".equals(resultMsg))
        {
        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
        }
		// 나머지 실패 경우
        else
        {
            mv.addObject("alertMsg", "회원가입에 실패하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
        }
        
        mv.setViewName("/mobile/common/result");
        
        
        commandMap.clear();
        commandMap.put("MEM_MST_MEM_ID", MEM_MST_MEM_ID);
        commandMap.put("MEM_MST_MAIL", MEM_CTF_MAIL);
        commandMap.put("MEM_CPR_NM",MEM_CPR_NM);
        commandMap.put("joinType", joinType);
        
        mv.addObject("commandMap", commandMap);
        
		return mv;
	}
	
	
	/**
     * <pre>
     * 1. MethodName : joinMemberSnsRegist
     * 2. ClassName  : JoinMemberController.java
     * 3. Comment    : SNS 계정으로 회원등록
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 19.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @return
     * @throws Exception
     */   
     @RequestMapping("/mobile/member/joinMemberSnsRegist")
     public ModelAndView joinMemberSnsRegist (HttpServletRequest request,HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         logger.info("############################## SNS 간편회원 : joinMemberSnsRegist ##########################################");
         
         // 세션 확인 > true: 강제로 index 이동
         if(SessionsUser.isLogin(request))
         {  
             mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
             mv.setViewName("mobile/common/result");
         }
         else
         {
             // 필수 값 유무 확인 
             if(!"".equals(StringUtil.getString(commandMap.get("MEM_SNS_ID"),"")))
             {         
                
                 commandMap.put("MEM_MST_MEM_GBN", Code.MEMBER_TYPE_SNS);                              // 회원구분 상세, SNS회원     
                 commandMap.put("MEM_MST_PW", StringUtil.getString(commandMap.get("MEM_SNS_ID"),""));  // 회원 비밀번호는 SNS 아이디(고유 KEY)로 한다.  
                  
                 // snsType 이 카카오톡 시
                 if(Integer.toString(Code.SNS_MEMBER_KAKAOTALK_GRADE).equals(StringUtil.getString(commandMap.get("MEM_SNS_TYPE"),"")))
                 {
                     //commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(commandMap.get("MEM_MST_MAIL"),""));  
                 }
                 // 네이버, 페이스북 시
                 else
                 {
                     //commandMap.put("MEM_MST_MEM_ID", StringUtil.getString(commandMap.get("MEM_SNS_EMAIL"),""));   // SNS 회원은 이메일로 ID 사용
                     commandMap.put("MEM_MST_MAIL", StringUtil.getString(commandMap.get("MEM_SNS_EMAIL"),""));     // 이메일 
                 }
                 commandMap.put("MEM_MST_MEM_GRD", commandMap.get("MEM_SNS_TYPE"));     // 이메일
                 // 회원 등록
                 Map<String,Object> returnMap = this.pcJoinMemberService.insertSnsMember(request, commandMap);
                   
                 
                 /* *************************************** 코드 에러 *************************************** */
                 
                 // SNS 회원가입 성공  
                 if("S01".equals(returnMap.get("resultMsg")))
                 {
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemFinish.do");
                 }
                 // 아이디 중복 발생  
                 else if("F01".equals(returnMap.get("resultMsg")))  
                 { 
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
                     mv.addObject("alertMsg", "중복된 아이디입니다. 처음부터 다시 가입해주세요.");  
                 }
                 // SNS 아이디로 이미 가입, 아이디 찾기 페이지로 이동
                 else if("F02".equals(returnMap.get("resultMsg")))
                 {
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do");
                     
                     mv.addObject("alertMsg", "이미 해당" + StringUtil.getString(commandMap.get("MEM_SNS_TYPE"),"").toUpperCase() + "(으)로 이미 가입된 회원입니다. \\n메인 페이지로 이동합니다.");  
                 } 
                 // 회원가입 실패, 데이터 누락 발생
                 else if("F03".equals(returnMap.get("resultMsg")) || "F04".equals(returnMap.get("resultMsg")) || "F05".equals(returnMap.get("resultMsg")))
                 {
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileSslDomain"), "") + "/mobile/member/joinMemType.do");
                     mv.addObject("alertMsg", "회원가입에 실패하였습니다. 처음부터 다시 가입해주세요.");  
                 }  
                 // Excpetion 에러
                 else if("E99".equals(returnMap.get("resultMsg")))   
                 {
                     mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다. \\n문제가 계속 발생하면 관리자에게 문의해주세요.");
                     mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do"); 
                 }
             }  
             else    
             {  
                 mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
                 mv.addObject("alertMsg", "입력한 정보가 누락되었습니다. 처음부터 다시 가입해주세요.");  
             }
         }
         mv.setViewName("mobile/common/result"); 
         mv.addObject("commandMap", commandMap);  
         
         return mv;
     }
	
	/**
	* <pre>
	* 1. MethodName : joinMemFinish
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 프론트 > 회원가입 > 통합회원,간편회원 >가입완료(STEP4)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemFinish")
	public ModelAndView joinMemFinish (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

		/*
		if("".equals(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
            mv.setViewName("pc/common/result");
		}
		*/
		if(commandMap.containsKey("MEM_MST_MEM_ID")) {
			commandMap.put("MEM_AGR_REG_ID", commandMap.get("MEM_MST_MEM_ID"));
			List<Map<String,Object>> agreementHistory = agreementBoardServiceImpl.selectAgreementInfoByMemberId(commandMap);
			mv.addObject("agreementHistory", agreementHistory);
		}
		
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : joinMemSimpleStep1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 간편회원 > 이메일 인증(STEP1)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemSimpleStep1")
	public ModelAndView joinMemSimpleStep1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : checkEmailAjax
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 간편회원 > 이메일 중복체크 및 인증번호 발송
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/member/checkEmailAjax")
	public JSON checkEmailAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		String email = StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "");
		if(!"".equals(email) && org.apache.commons.validator.routines.EmailValidator.getInstance().isValid(email))
        {
			String[] emailSplit = email.split("@");
			Map<String,Object> erpParam = new HashMap<String,Object>();
			erpParam.put("EMAIL1", emailSplit[0]);
			erpParam.put("EMAIL2", emailSplit[1]);
			Map<String,Object> erpResponse = ErpRequest.requestEmailDupInfo(erpParam);
			
            // 이메일 중복 체크
		    Map<String,Object> returnMap = this.pcJoinMemberService.selectCheckEmailCount(commandMap);
            
		    int result = (int) returnMap.get("result");  
		    int erpResult = StringUtil.getString(erpResponse.get("MemberEmailCheckResult")).equals("Y")?1:0;
            if(result > 0 || erpResult > 0 )  
            {
                json.put("resultYn", "N");
            }
            else
            {
                json.put("resultYn", "Y");
            }  
              
            json.put("successYn", "Y");
        }
        else 
        {
            json.put("successYn", "N");
        }
		
		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : checkCertNoAjax
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 간편회원 > 인증번호 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/member/checkCertNoAjax")
	public JSON checkCertNoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		if(!"".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"), "")) && !"".equals(StringUtil.getString(commandMap.get("MEM_CTF_NO"), "")))
        {
            // 인증번호 체크
            int certNoCount = this.pcJoinMemberService.selectCheckCertNoCount(commandMap);
            
            if( certNoCount > 0)
            {
                json.put("resultYn", "Y");
            }
            // 유효시간이 지난경우
            else if (certNoCount == -1)
            {
            	json.put("resultYn","O");
            }
            // 이메일이 없는 경우
            else if(certNoCount == -2)
            {
            	json.put("resultYn","N");
            }
            // 인증번호가 같지 않은경우
            else
            {
                json.put("resultYn", "E");
            }
        }

		return json;
	}
	
	/**
	* <pre>
	* 1. MethodName : joinMemSimpleStep2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 간편회원 > 약관 동의(STEP2)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 12.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/joinMemSimpleStep2")
	public ModelAndView joinMemSimpleStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if("".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : onlineMemStep1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 온라인 회원 전환 > 가입정보 확인
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/onlineMemStep1")
	public ModelAndView onlineMemStep1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		String maskingId = FormatUtil.markingId(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"),""));	// 아이디 마스킹처리
		commandMap.put("maskingId", maskingId);
		
		if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : onlineMemStep2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 온라인 회원 전환 > 전환 약관동의
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/onlineMemStep2")
	public ModelAndView onlineMemStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : onlineMemStep3
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 온라인 회원, 오프라인회원 전환 > 가입정보 재입력
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/changeMemStep3")
	public ModelAndView onlineMemStep3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		
		// Common Codes
        String[] codes = {"HP_CODE", "TEL_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
		
        /******************** 우편번호 추가 시작 ********************/
		// 지역코드
		mv.addObject("sidoList", this.pcCommonService.selectCode("AREA_CD"));
		
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
		/******************** 우편번호 추가 끝 ********************/
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	
	/**
	* <pre>
	* 1. MethodName : offlineMemStep1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 오프라인 회원 전환 > 가입정보 확인
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/offlineMemStep1")
	public ModelAndView offlineMemStep1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("joinMemType","offline");
		mv.addObject("agreementList", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementIndex(Integer.toString(Code.AGREEMENT_OFFLINE_JOINSUS)));
		/*if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}*/
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : offlineMemStep2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 오프라인 회원 전환 > 전환 약관동의
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/offlineMemStep2")
	public ModelAndView offlineMemStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("agreementList", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementIndex(Integer.toString(Code.AGREEMENT_JOINSUS)));
		
		/*if("".equals(StringUtil.getString(commandMap.get("MEM_IPN_CI"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileSslDomain") + "/mobile/member/joinMemType.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}*/
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : changeMemberFinish
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 모바일 > 회원가입 > 온라인 회원 전환 > 전환 완료
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 15.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/changeMemberFinish")
	public ModelAndView changeMemberFinish (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if("".equals(StringUtil.getString(commandMap.get("MEM_MST_OCB_NO"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("mobileDomain") + "/mobile/main/index.do");
            // 해당 브랜드로 이동
            mv.setViewName("mobile/common/result");
		}
		
		mv.addObject("commandMap", commandMap);
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : onlineAgreement
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 온라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/onlineAgreement")
	public ModelAndView onlineAgreement (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOnlineAgreement1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 온라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOnlineAgreement1")
	public ModelAndView beforeOnlineAgreement1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOnlineAgreement2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 온라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOnlineAgreement2")
	public ModelAndView beforeOnlineAgreement2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOnlineAgreement3
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 온라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOnlineAgreement3")
	public ModelAndView beforeOnlineAgreement3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOnlineAgreement4
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 온라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOnlineAgreement4")
	public ModelAndView beforeOnlineAgreement4 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOnlineAgreement5
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 온라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOnlineAgreement5")
	public ModelAndView beforeOnlineAgreement5 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : onlineSimpleAgreement
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 간편회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/onlineSimpleAgreement")
	public ModelAndView onlineSimpleAgreement (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : onlineBusinessAgreement
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 기업회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/onlineBusinessAgreement")
	public ModelAndView onlineBusinessAgreement (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : offlineAgreement
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 오프라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/offlineAgreement")
	public ModelAndView offlineAgreement (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOfflineAgreement1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 오프라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOfflineAgreement1")
	public ModelAndView beforeOfflineAgreement1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOfflineAgreement2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 오프라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOfflineAgreement2")
	public ModelAndView beforeOfflineAgreement2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOfflineAgreement3
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 이용약관 > 이전 오프라인 회원 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 3.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOfflineAgreement3")
	public ModelAndView beforeOfflineAgreement3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : basicMemInfoPolicy
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 온라인 개인정보 취급방침(통합회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/basicMemInfoPolicy")
	public ModelAndView basicMemInfoPolicy (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeBasicMemInfoPolicy1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 온라인 개인정보 취급방침(통합회원)  
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeBasicMemInfoPolicy1")
	public ModelAndView beforeBasicMemInfoPolicy1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeBasicMemInfoPolicy2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 온라인 개인정보 취급방침(통합회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeBasicMemInfoPolicy2")
	public ModelAndView beforeBasicMemInfoPolicy2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeBasicMemInfoPolicy3
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 온라인 개인정보 취급방침(통합회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeBasicMemInfoPolicy3")
	public ModelAndView beforeBasicMemInfoPolicy3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeBasicMemInfoPolicy4
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 온라인 개인정보 취급방침(통합회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeBasicMemInfoPolicy4")
	public ModelAndView beforeBasicMemInfoPolicy4 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeBasicMemInfoPolicy5
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 온라인 개인정보 취급방침(통합회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeBasicMemInfoPolicy5")
	public ModelAndView beforeBasicMemInfoPolicy5 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeBasicMemInfoPolicy6
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 온라인 개인정보 취급방침(통합회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeBasicMemInfoPolicy6")
	public ModelAndView beforeBasicMemInfoPolicy6 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : simpleMemInfoPolicy
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 온라인 개인정보 취급방침(간편회원) 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/simpleMemInfoPolicy")
	public ModelAndView simpleMemInfoPolicy (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : businessMemInfoPolicy
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 온라인 개인정보 취급방침(기업회원)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 4. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/businessMemInfoPolicy")
	public ModelAndView businessMemInfoPolicy (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : offlineMemInfoPolicy
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침  
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/offlineMemInfoPolicy")
	public ModelAndView offlineMemInfoPolicy (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOfflineMemInfoPolicy1
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 오프라인 개인정보 취급방침 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOfflineMemInfoPolicy1")
	public ModelAndView beforeOfflineMemInfoPolicy1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOfflineMemInfoPolicy2
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 오프라인 개인정보 취급방침 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOfflineMemInfoPolicy2")
	public ModelAndView beforeOfflineMemInfoPolicy2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : beforeOfflineMemInfoPolicy3
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 이전 오프라인 개인정보 취급방침 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/beforeOfflineMemInfoPolicy3")
	public ModelAndView beforeOfflineMemInfoPolicy3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : samsungElecVipInfo
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > 삼성전자 VIP 멤버쉽 회원 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/samsungElecVipInfo")
	public ModelAndView samsungElecVipInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : lgElecVipInfo
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > LG전자 VIP 멤버쉽 회원 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/lgElecVipInfo")
	public ModelAndView lgElecVipInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : okCashServiceInfo
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > OK캐쉬백 서비스 이용약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/okCashServiceInfo")
	public ModelAndView okCashServiceInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : okCashInfo
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > OK캐쉬백 제휴가맹점 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/okCashInfo")
	public ModelAndView okCashInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : samsungCardInfo
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > 삼성카드 마케팅활용 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/samsungCardInfo")
	public ModelAndView samsungCardInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : etcInfo
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > 기타 위탁업체 보기
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/member/etcInfo")
	public ModelAndView etcInfo (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	private void memberTagInfoInsert (Map<String,Object> commandMap,String MEM_MST_MEM_ID) throws Exception {
		//희망태그 등록
        String wishTagListString = commandMap.get(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST).toString().trim();
        if(wishTagListString!=null && !wishTagListString.isEmpty() && !wishTagListString.contains("#")) {
        	List<String> tagList = StringUtil.tagListStringToList(wishTagListString);
            if(!tagList.isEmpty()) {
            	commandMap.put(WSH_TAG_MODEL.REG_ID, MEM_MST_MEM_ID);
            	commandMap.put(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST, tagList);
            	this.wishTagService.insertWithTagList(commandMap);
            }
        }
        String tagList = commandMap.get("TAG_LIST").toString();
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        List<Map<String, Object>> tagDataList = mapper.readValue(tagList, typeRef);
        
        if(tagDataList!=null && !tagDataList.isEmpty()) {
        	Map<String,Object> param = new HashMap<String,Object>();
        	JSONArray jsonArray = new JSONArray();
        	for(int i=0;i<tagDataList.size();i++) {
        		Map<String,Object> map = tagDataList.get(i);
            	map.put(TAG_MODEL.TAG_BND_ID, MEM_MST_MEM_ID);
            	JSONObject object = ObjectToJsonUtil.objectToJson(map);
            	jsonArray.add(object);
            }
        	param.put(TAG_MODEL.TAG_ID_LIST, jsonArray.toString());
        	param.put(TAG_MODEL.TAG_BND_ID, MEM_MST_MEM_ID);
        	this.tagService.insertTagBind(param);
        }
	}
	
}
