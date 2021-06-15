
package com.market.mall.pc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.EmailValidator;
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
import com.epasscni.util.EgovNumberCheckUtil;
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
 * @PackageName: com.market.mall.pc.member.controller
 * @FileName : JoinMemberController.java
 * @Date : 2016. 8. 29.
 * @프로그램 설명 : 프론트 > 회원가입을 처리하는 Controller Class
 * @author DEV_KIMYEONGJUN
 */

@Controller("pcJoinMemberController")
public class JoinMemberController {
	
    @Autowired
    private SirenCert sirenCert;
    
	@Resource(name="propertiesService") 
	protected EgovPropertyService propertiesService;
	
	@Resource(name="pcJoinMemberService") 
	private JoinMemberService pcJoinMemberService;
	
	@Resource(name="pcCommonService") 
	private CommonService pcCommonService;
	
	@Resource(name="pcLoginManagerService")	
	private LoginManagerService pcLoginManagerService;
	
	@Resource(name="snsManagerService")     
	private SnsManagerService snsManagerService; 
	
	@Autowired
	WishTagService wishTagService;
	
	@Autowired
	private AgreementBoardServiceImpl agreementBoardServiceImpl;
	
	@Resource(name="mailSendingService")
	private MailService mailService;
	
	@Autowired
	TagService tagService;
		
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : joinMemType
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 회원분류(통합회원, 이메일간편회원, 기업회원, SNS간편회원)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 29.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/member/joinMemType")
	public ModelAndView joinMemType (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("snsUseList", this.snsManagerService.selectSnsUseList(commandMap));
		if(SessionsUser.isLogin(request))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");
        }
		
		// SNS 로그인 시 미가입 회원 SNS정보 사용
		mv.addObject("commandMap", commandMap);  
		
		return mv;    
	}

	/**
	 * <pre>
	 * 1. MethodName : joinMemBasicStep1
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 통합회원 > 본인인증(STEP1)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 29.
	 * </pre>
	 *
	 * @param request
	 * @param response
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/member/joinMemBasicStep1")
    public ModelAndView joinMemBasicStep1 (HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 세션 확인 > true: 강제로 index 이동 
        if(SessionsUser.isLogin(request))
        {   
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");
        }
        else
        {  
            // joinType : JOIN(회원가입)
            if("JOIN".equals(StringUtil.getString(commandMap.get("gubun"), "")))
            {
                /*---------------------------------------- BIZSIREN 핸드폰 본인인증 세팅 -------------------------------------*/
                // 사이렌 핸드폰 본인인증 정보 생성  
                String reqInfo = sirenCert.getSirenCertReqInfo(request, response, "");

                String retUrl = "32" + StringUtil.getString(request.getAttribute("serverSslDomain"),"") + propertiesService.getString("siren.certReturnUrl");
                mv.addObject("reqInfo", reqInfo);  // 본인인증 정보
                mv.addObject("retUrl", retUrl);    // 결과수신 URL
                mv.addObject("certReqUrl", propertiesService.getString("siren.certReqUrl"));  // certReqUrl > 사이렌 핸드폰 확인서비스 요청 URL
                
                /*---------------------------------------- BIZSIREN 아이핀 본인인증 세팅 ----------------------------------------*/
                // 사이렌 아이핀 본인인증 정보 생성
                String ipinReqInfo = sirenCert.getSirenIpinCertReqInfo(request, response);
                
                String ipinRetUrl = "23" + StringUtil.getString(request.getAttribute("serverSslDomain"),"") + propertiesService.getString("ipin.certReturnUrl");    
                mv.addObject("ipinReqInfo", ipinReqInfo);  // 본인인증 정보
                mv.addObject("ipinRetUrl", ipinRetUrl);    // 결과수신 URL
                mv.addObject("ipinCertReqUrl", propertiesService.getString("ipin.certReqUrl"));  // ipinCertReqUrl > 사이렌 아이핀 확인서비스 요청 URL
            }    
            // joinType : 비정상적인 접근
            else
            {
                mv.addObject("returnUrl", request.getAttribute("serverDomain") + "/pc/member/joinMemType.do"); 
                mv.addObject("alertMsg", "비정상적인 접근입니다. 회원가입 초기페이지로 이동합니다.");
                mv.setViewName("/pc/common/result");
            }
        }

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	
	/**
	 * <pre>
	 * 1. MethodName : sirenResResult
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 본인인증(STEP1) 인증 결과
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 29.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/member/sirenResResult")
	public ModelAndView sirenResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 사이렌 핸드폰 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenInfo = sirenCert.getSirenCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenInfo.get("ci1"));			// CI값
		commandMap.put("MEM_MST_MEM_NM", sirenInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenInfo.get("birYMD"));	// 생년월일
		commandMap.put("gubun", "JOIN");	                        // 구분값
		
		// 인증접근 실패 > 비정상적인 접근
		if("N".equals(sirenInfo.get("msgChk"))) 
		{
			mv.addObject("closeMsg", "비정상적인 접근입니다.");
		}
		// 인증접근 성공
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
		
		mv.setViewName("/pc/member/sirenResResult");
		mv.addObject("commandMap", commandMap);

		return mv; 
	}
	
	/**
	 * <pre>
	 * 1. MethodName : sirenIpinResResult
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 회원가입 > 아이핀 인증 결과 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/member/sirenIpinResResult")
	public ModelAndView sirenIpinResResult (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();

		//사이렌 I-PIN 본인인증 인증결과
		SirenCert sirenCert = new SirenCert();
		Map<String,Object> sirenIpinInfo = sirenCert.getSirenIpinCertResultInfo(request, commandMap);
		
		commandMap.put("MEM_IPN_CI", sirenIpinInfo.get("ciscrHash"));	// CI값
		commandMap.put("MEM_MST_MEM_NM", sirenIpinInfo.get("name"));	// 이름
		commandMap.put("MEM_IPN_BIR_DT", sirenIpinInfo.get("birth"));	// 생년월일
		commandMap.put("gubun", "JOIN");                                // 구분값
		
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
						commandMap.put("MEM_IPN_NO", sirenIpinInfo.get("vDiscrNo"));					// 아이핀 번호
						commandMap.put("MEM_IPN_AGE", sirenIpinInfo.get("age"));						// 연령대
						commandMap.put("MEM_IPN_SEX", sirenIpinInfo.get("sex"));						// 성별(M : 남자 / F : 여자)
						commandMap.put("MEM_IPN_AUT", sirenIpinInfo.get("authInfo"));					// 발급수단정보 ( 0 : 본인 공인인증서 / 1 : 본인 신용카드 / 2 : 본인 핸드폰 / 3 : 본인 대면확인 / 4 : 신원보증인 아이핀 / 5 : 신원보증인 공인인증서 / 6 : 신원보증인 신용카드 / 7 : 신원보증인 핸드폰 / 8 : 신원보증인 대면확인 / 9 : 본인 외국인등록번호 / 10 : 본인 여권번호 )
						commandMap.put("MEM_IPN_FGN", sirenIpinInfo.get("fgn"));						// 내외국인구분(0 : 내국인 / 1 : 외국인)
						commandMap.put("MEM_IPN_DI", sirenIpinInfo.get("discrHash"));					// DI
						commandMap.put("MEM_IPN_CI_VER", sirenIpinInfo.get("ciVersion"));				// CI Version
						commandMap.put("MEM_IPN_AUT_GB", Code.MEMBER_AUTH_IPIN);	                    // 인증수단(I : 아이핀)
						commandMap.put("MEM_IPN_RST", result);	
					}
				}
			}
			// 실패
			else
			{
				mv.addObject("closeMsg", "본인 인증에 실패하였습니다.");
			}
		}
		
		mv.setViewName("/pc/member/sirenIpinResResult");
		mv.addObject("commandMap", commandMap);

		return mv; 
	}
	
	/**
	 * <pre>
	 * 1. MethodName : joinMemBasicStep2
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 통합회원 > 약관동의(STEP2)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
	 * @api {get} /pc/member/joinMemBasicStep2
	 * @apiName  프론트 > 회원가입 > 통합회원 > 약관동의(STEP2)
	 * @apiGroup 회원가입
	 *
	 * @apiSuccess {Object} agreementList
	 */
	@RequestMapping("/pc/member/joinMemBasicStep2")
	public ModelAndView joinMemBasicStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("agreementList", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementIndex(Integer.toString(Code.AGREEMENT_JOINSUS)));
		mv.addObject("commandMap", commandMap);
		return mv;	
	}
	
	/**
	 * <pre>
	 * 1. MethodName : joinMemStep3
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 통합회원,간편회원 > 정보입력(STEP3)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/pc/member/joinMemStep3")
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
     * @api {get} /pc/member/joinMemStep4.do
     * @apiName 회원 태그 등록
     * @apiGroup 회원가입
     * @apiSuccess {OBJECT[]} tagList
     * 
     * @apiError {JSON} RESULT_CODE 400
     */
    @RequestMapping("/pc/member/joinMemStep4")
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
     * <pre>
     * 1. MethodName : checkIdAjax
     * 2. ClassName  : JoinMemberController.java
     * 3. Comment    : 프론트 > 회원가입 > 통합회원,간편회원 > 정보입력(STEP3) > 아이디 중복체크
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {post} /pc/member/checkIdAjax.do
     * @apiName 아이디 중복체크
     * @apiGroup 회원가입
     * @apiParam {String} MEM_MST_MEM_ID 아이디
     * @apiSuccess {String} successYn 성공여부(MEM_ID 미입력시 N)
     * @apiSuccess {String} resultYn 중복여부(중복아님Y 중복됨N)
     * @apiError {String} RESULT_CODE 400
     */
	@FrontBannerSkip()
	@RequestMapping("/pc/member/checkIdAjax")
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
        }
        else 
        {
            json.put("successYn", "N");
        }
        return json;
	}
	
	
	/**
     * @api {post} /pc/member/checkNickNameAjax.do
     * @apiName 닉네임 중복조회
     * @apiGroup 회원가입
     * @apiParam {String} MEM_MST_NCK_NM 닉네임
     * @apiSuccess {String} successYn 성공여부
     * @apiSuccess {String} resultYn 중복여부
     * @apiError {String} RESULT_CODE 400
     */
	@FrontBannerSkip()
	@RequestMapping("/pc/member/checkNickNameAjax")
	public JSON checkNickNameAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_MST_NCK_NM"), "")))
        {
            // 아이디 중복 체크
            int idCount = this.pcJoinMemberService.selectCheckNicknameCount(commandMap);
            
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
	 * 3. Comment    : 프론트 > 회원가입 > 통합회원,간편회원,기업회원 > 정보입력(STEP3) > 등록 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param response
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	/**
     * @api {POST} /pc/member/joinMemberRegist.do
     * @apiName 프론트 > 회원가입 > 통합회원,간편회원,기업회원 > 정보입력(STEP3) > 등록 
     * @apiGroup 회원가입
     *
     * @apiParam {String} MEM_IPN_RST MEM_IPN_RST
     * @apiParam {String} MEM_IPN_AGE 나이
     * @apiParam {String} MEM_IPN_SEX MEM_IPN_SEX
     * @apiParam {String} MEM_IPN_AUT AUTH
     * @apiParam {String} MEM_IPN_BIR_DT 생년월일
     * @apiParam {String} MEM_IPN_FGN 외국인구분
     * @apiParam {String} MEM_IPN_DI DI
     * @apiParam {String} MEM_IPN_CI CI
     * @apiParam {String} MEM_IPN_CI_VER CI VER
     * @apiParam {String} MEM_IPN_ETC1 ETC1
     * @apiParam {String} MEM_IPN_ETC2 ETC2
     * @apiParam {String} MEM_IPN_ETC3 ETC3
     * @apiParam {String} MEM_IPN_AUT_GB AUTH_구분
     * @apiParam {String} MEM_IPN_HP_CRP 이동통신사
     * @apiParam {String} MEM_IPN_CRT_DT 인증시간
     * @apiParam {String} MEM_IPN_CRT_DT 인증시간
     * @apiParam {String} MEM_IPN_BIR_GB 양력음력구분 S양력,L음력
     *  
     * @apiParam {String} double_submit
     * @apiParam {String} joinType 회원타입
     *  
     * @apiParam {String} TRM_YN0001 SMS 수신   
     * @apiParam {String} TRM_YN0002 TM 수신
     * @apiParam {String} TRM_YN0003 DM(알림톡) 수신
     * @apiParam {String} TRM_YN0004 MAIL 수신
     * @apiParam {String} TRM_YN0005 영리목적광고
     * @apiParam {String} TRM_YN0006 카카오 수신
     * @apiParam {String} TRM_YN0007 삼성전자 수신
     * @apiParam {String} TRM_YN0008 LG전자 수신
     
     * @apiParam {String} MEM_CTF_MAIL 간편회원 이메일
     *  
     * 
     * @apiParam {String} MEM_MST_MEM_ID 회원아이디
     * @apiParam {String} MEM_MST_PW 회원비밀번호
     * @apiParam {String} MEM_MST_MEM_NM 회원이름
     * @apiParam {String} MEM_MST_MAIL_ID 이메일 아이디
     * @apiParam {String} MEM_MST_MAIL_DOMAIN 이메일 도메인
     * @apiParam {String} MEM_MST_HP1 휴대폰번호1(010)
     * @apiParam {String} MEM_MST_HP2 휴대폰번호2(1111)
     * @apiParam {String} MEM_MST_HP3 휴대폰번호3(2222)
     * @apiParam {String} MEM_MST_ZIP_CDE6 구, 우편번호 6자리
     * @apiParam {String} MEM_MST_JBN_ADR1 지번 주소 앞
     * @apiParam {String} MEM_MST_JBN_ADR2 지번 주소 뒤
     * @apiParam {String} MEM_MST_ZIP_CDE5 신, 우편번호 5자리
     * @apiParam {String} MEM_MST_DRO_ADR1 도로명 주소 앞
     * @apiParam {String} MEM_MST_DRO_ADR2 도로명 주소 뒤
     * @apiParam {String} MEM_MST_NCK_NM   회원닉네임
     * @apiParam {String} MEM_MST_STY_JOB   회원직업
     * @apiParam {String} MEM_MST_STY_HEIGHT   회원 스타일 키
     * @apiParam {String} MEM_MST_STY_WEIGHT   회원 스타일 체중
     * @apiParam {String} MEM_MST_STY_WEIGHT   회원 스타일 체중
     * @apiParam {String} WSH_TAG_TITLE_LIST   희망태그 문자열
     * @apiParam {String} TAG_LIST 태그선택리스트
     * 
     * @apiSuccess {String} resultMsg
     */
	@RequestMapping("/pc/member/joinMemberRegist")
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
		/*
		Map<String,Object> erpParam = new HashMap<String,Object>();
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
		erpParam.put("AGREE9", "Y");
		erpParam.put("CRYPT_KEY", Code.CRYPT_KEY_TWIN);		
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
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
                mv.setViewName("pc/common/result");
                return mv;
    		}
		}
		*/
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
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemFinish.do");
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
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
        }
		// 일반회원 > CI값 데이터 누락
        else if("F12".equals(resultMsg))
        {
        	mv.addObject("alertMsg", "데이터 누락이 발생하였습니다.\\n회원가입 페이지로 이동합니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
        }
		// 일반회원 > 본인인증으로 이미 가입
    	else if("F13".equals(resultMsg))
    	{
    	    mv.addObject("alertMsg", "이미 본인인증으로 가입되었습니다.\\n로그인 해주세요.");
    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do");
    	}
		// 회원가입 > 회원가입 실패
    	else if("F99".equals(resultMsg))
    	{
    	    mv.addObject("alertMsg", "회원가입에 실패하셨습니다.\\n회원가입 페이지로 이동합니다.");
    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
    	}
		// 회원가입 > 태그바인딩실패
    	else if("T99".equals(resultMsg))
    	{
    	    mv.addObject("alertMsg", "태그정보 입력에 실패했습니다. \\n회원가입 페이지로 이동합니다.");
    	    mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
    	}
		// Excpetion 에러
        else if("E99".equals(resultMsg))
        {
        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
        }
		// 나머지 실패 경우
        else
        {
            mv.addObject("alertMsg", "회원가입에 실패하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
        }
        
        mv.setViewName("/pc/common/result");
        
        
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
	 * 1. MethodName : joinMemFinish
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 통합회원,간편회원,기업회원 >가입완료(STEP4)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/member/joinMemFinish")
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
	 * 3. Comment    : 프론트 > 회원가입 > 간편회원 > 이메일 인증(STEP1) 
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/member/joinMemSimpleStep1")
	public ModelAndView joinMemSimpleStep1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : checkEmailAjax
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > 간편회원 > 이메일 중복체크 및 인증번호 발송
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	/**
	 * @api {get} /pc/member/checkEmailAjax.do
	 * @apiName  이메일중복확인
	 * @apiGroup 회원가입
	 *
	 * @apiParam {String} MEM_CTF_MAIL
	 * @apiSuccess {String} resultYn N False, Y True
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/member/checkEmailAjax")
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
	 * 3. Comment    : 프론트 > 회원가입 > 간편회원 > 인증번호 체크
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@FrontBannerSkip()
	@RequestMapping("/pc/member/checkCertNoAjax")
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
	 * 3. Comment    : 프론트 > 회원가입 > 이메일 간편회원 > 약관 동의(STEP2)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
	 * @api {get} /pc/member/joinMemSimpleStep2.do
	 * @apiName  약관동의
	 * @apiGroup 회원가입
	 *
	 * @apiSuccess {Object} serviceTermAgreement
	 * @apiSuccess {Object} privateInfoAgreement
	 */
	@RequestMapping("/pc/member/joinMemSimpleStep2")
	public ModelAndView joinMemSimpleStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("serviceTermAgreement", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementTypeName("서비스 이용약관"));
		mv.addObject("privateInfoAgreement", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementTypeName("개인정보취급방침"));
		/*if("".equals(StringUtil.getString(commandMap.get("MEM_CTF_MAIL"),"")))
		{
			mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
            mv.setViewName("pc/common/result");
		}*/
		mv.addObject("commandMap", commandMap); 
		
		return mv;
	}
    
    /**
    * <pre>
    * 1. MethodName : joinMemBusinessStep1
    * 2. ClassName  : JoinMemberController.java
    * 3. Comment    : 프론트 > 회원가입 > 기업회원 > 사업자인증(STEP1)
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/member/joinMemBusinessStep1")
    public ModelAndView joinMemBusinessStep1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        return mv;
    }
   
    /**
    * <pre>
    * 1. MethodName : checkBusinessNoAjax
    * 2. ClassName  : JoinMemberController.java
    * 3. Comment    : 프론트 > 회원가입 > 기업회원 > 사업자등록번호 체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip()
    @RequestMapping("/pc/member/checkBusinessNoAjax")
    public JSON checkBusinessNoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        JSON json = new JSON();
       
        String MEM_CPR_NO1 = StringUtil.getString(commandMap.get("MEM_CPR_NO1"),"");
        String MEM_CPR_NO2 = StringUtil.getString(commandMap.get("MEM_CPR_NO2"),"");
        String MEM_CPR_NO3 = StringUtil.getString(commandMap.get("MEM_CPR_NO3"),"");
       
        if(!"".equals(StringUtil.getString(commandMap.get("MEM_CPR_NM"), "")) && !"".equals(MEM_CPR_NO1) && !"".equals(MEM_CPR_NO2) && !"".equals(MEM_CPR_NO3))
        {
            // 사업자등록번호 유효성 체크
            if(EgovNumberCheckUtil.checkCompNumber(MEM_CPR_NO1, MEM_CPR_NO2, MEM_CPR_NO3))
            {
                json.put("successYn", "Y");
               
                // 사업자등록번호 체크
                int BusinessNoCount = this.pcJoinMemberService.selectCheckBusinessNoCount(commandMap);
               
                if( BusinessNoCount == 0)
                {
                    json.put("resultYn", "Y");
                }
                else
                {
                    // 사업자등록번호에 대한 기업의 아이디 목록
                    List<Map<String,Object>> businessList = this.pcJoinMemberService.selectBusinessInfo(commandMap);
                    json.put("resultYn", "N");
                    json.addObject("businessList", businessList);
                }
               
                json.addObject("businessNoCount", BusinessNoCount);
            }
            else
            {
                json.put("successYn", "N");
            }
        }

        return json;
    }
   
    /**
    * <pre>
    * 1. MethodName : joinMemBusinessStep2
    * 2. ClassName  : JoinMemberController.java
    * 3. Comment    : 프론트 > 회원가입 > 기업회원 > 약관동의(STEP2)
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/member/joinMemBusinessStep2")
    public ModelAndView joinMemBusinessStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
       
        // 추가로 가입할 경우
        if(!"".equals(StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NM"), "")) || !"".equals(StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NO1"), "")) ||
           !"".equals(StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NO2"), "")) || !"".equals(StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NO3"), "")))
        {
            commandMap.put("MEM_CPR_NM", StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NM"),""));           
            commandMap.put("MEM_CPR_NO1", StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NO1"),""));
            commandMap.put("MEM_CPR_NO2", StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NO2"),""));
            commandMap.put("MEM_CPR_NO3", StringUtil.getString(commandMap.get("AUTO_MEM_CPR_NO3"),""));
        }
       
        if("".equals(StringUtil.getString(commandMap.get("MEM_CPR_NM"), "")) || "".equals(StringUtil.getString(commandMap.get("MEM_CPR_NO1"), "")) ||
           "".equals(StringUtil.getString(commandMap.get("MEM_CPR_NO2"), "")) || "".equals(StringUtil.getString(commandMap.get("MEM_CPR_NO3"), "")))
        {
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
            mv.setViewName("pc/common/result");
        }
       
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
   
    /**
    * <pre>
    * 1. MethodName : joinMemBusinessStep3
    * 2. ClassName  : JoinMemberController.java
    * 3. Comment    : 프론트 > 회원가입 > 기업회원 > 정보입력(STEP3)
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 30.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/pc/member/joinMemBusinessStep3")
    public ModelAndView joinMemBusinessStep3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
       
        if("".equals(StringUtil.getString(commandMap.get("MEM_CPR_NM"), "")) || "".equals(StringUtil.getString(commandMap.get("MEM_CPR_NO1"),"")) 
            || "".equals(StringUtil.getString(commandMap.get("MEM_CPR_NO2"),"")) || "".equals(StringUtil.getString(commandMap.get("MEM_CPR_NO3"),"")))
        {
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
            // 해당 브랜드로 이동
            mv.setViewName("pc/common/result");
        }
       
        // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE", "TEL_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
       
        mv.addObject("commandMap", commandMap);
       
        return mv;
    }
   
	/**
	 * <pre>
	 * 1. MethodName : joinMemSnsStep2 
	 * 2. ClassName  : JoinMemberController.java
	 * 3. Comment    : 프론트 > 회원가입 > SNS 간편회원 > 약관 동의(STEP2)
	 * 4. 작성자       : DEV_KIMYEONGJUN
	 * 5. 작성일       : 2016. 8. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/pc/member/joinMemSnsStep2")
    public ModelAndView joinMemSnsStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView(); 
        
        
        if("".equals(StringUtil.getString(commandMap.get("MEM_SNS_ID"),"")))
        {
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
            mv.setViewName("pc/common/result");
        }   
        else
        {
            // SNS 아이디(고유 KEY)로 가입여부 확인  
            int snsIdCnt = this.pcJoinMemberService.selectCheckSnsIdCount(commandMap);
            
            if(snsIdCnt > 0)
            {
                mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/manager/login.do");
                mv.addObject("alertMsg", "이미 해당 SNS계정으로 가입된 회원입니다.\\n로그인 해주세요.");
                commandMap.put("url", request.getAttribute("frontDomain") + "/pc/main/index.do");  // SNS인증 창 후 로그인 후 url 강제로 index로 설정
                mv.setViewName("pc/common/result"); 
            }  
            else  
            {
            	
                if(!"".equals(StringUtil.getString(commandMap.get("MEM_SNS_EMAIL"),"")))
                {
                    commandMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_SNS_EMAIL"));
                    
                    // 네이버, 페이스북에서 넘겨주는 이메일 값으로 아이디 중복 확인
                    int checkIdCnt = this.pcJoinMemberService.selectCheckIdCount(commandMap);
     
                    if(checkIdCnt > 0)
                    {
                        mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/manager/login.do");
                        mv.addObject("alertMsg", "해당 SNS인증 이메일이 사용중입니다.\\n로그인 해주세요.");
                        mv.setViewName("pc/common/result"); 
                    }
                }
                else
                {
                    mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/manager/login.do");
                    mv.addObject("alertMsg", "데이터가 누락되었습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
                    mv.setViewName("pc/common/result"); 
                }
            }
            mv.addObject("agreementList", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementIndex(Integer.toString(Code.AGREEMENT_JOINSUS)));
    		mv.addObject("joinType","sns");
    		
        }
          
        mv.addObject("commandMap", commandMap);  
        
        return mv;
    }
      
    /**
     * <pre>
     * 1. MethodName : joinMemSnsStep3
     * 2. ClassName  : JoinMemberController.java
     * 3. Comment    : 프론트 > 회원가입 > SNS 간편회원 > 정보입력(STEP3)
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 19.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/member/joinMemSnsStep3")
    public ModelAndView joinMemSnsStep3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        if("".equals(StringUtil.getString(commandMap.get("MEM_SNS_ID"),"")))
        {    
            mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
            mv.setViewName("pc/common/result");
        }   
        
        // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "HP_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        mv.addObject("commandMap", commandMap);  
        
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : joinSnsTypePopup
     * 2. ClassName  : JoinMemberController.java
     * 3. Comment    : 회원가입 > SNS 간편회원 시 > SNS인증 타입 선택 팝업창
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/pc/member/joinSnsTypePopup")
    public ModelAndView joinSnsTypePopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 강제로 index 이동
        if(!"Y".equals(StringUtil.getString(commandMap.get("popupCont"), "")))
        {
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
            mv.setViewName("pc/common/result");     
        }    
          
        // SNS 로그인 가져오기  
        commandMap.put("startNum", 1);   
        commandMap.put("endNum", 20);
        mv.addObject("snsUseList", this.snsManagerService.selectSnsUseList(commandMap));
        mv.addObject("commandMap", commandMap);
        
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
     @RequestMapping("/pc/member/joinMemberSnsRegist")
     public ModelAndView joinMemberSnsRegist (HttpServletRequest request,HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         
         logger.info("############################## SNS 간편회원 : joinMemberSnsRegist ##########################################");
         
         // 세션 확인 > true: 강제로 index 이동
         if(SessionsUser.isLogin(request))
         {  
             mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do");
             mv.setViewName("pc/common/result");
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
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemFinish.do");
                 }
                 // 아이디 중복 발생  
                 else if("F01".equals(returnMap.get("resultMsg")))  
                 { 
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
                     mv.addObject("alertMsg", "중복된 아이디입니다. 처음부터 다시 가입해주세요.");  
                 }
                 // SNS 아이디로 이미 가입, 아이디 찾기 페이지로 이동
                 else if("F02".equals(returnMap.get("resultMsg")))
                 {
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/main/index.do");
                     
                     mv.addObject("alertMsg", "이미 해당" + StringUtil.getString(commandMap.get("MEM_SNS_TYPE"),"").toUpperCase() + "(으)로 이미 가입된 회원입니다. \\n메인 페이지로 이동합니다.");  
                 } 
                 // 회원가입 실패, 데이터 누락 발생
                 else if("F03".equals(returnMap.get("resultMsg")) || "F04".equals(returnMap.get("resultMsg")) || "F05".equals(returnMap.get("resultMsg")))
                 {
                     mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/member/joinMemType.do");
                     mv.addObject("alertMsg", "회원가입에 실패하였습니다. 처음부터 다시 가입해주세요.");  
                 }  
                 // Excpetion 에러
                 else if("E99".equals(returnMap.get("resultMsg")))   
                 {
                     mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다. \\n문제가 계속 발생하면 관리자에게 문의해주세요.");
                     mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/main/index.do"); 
                 }
             }  
             else    
             {  
                 mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/member/joinMemType.do");
                 mv.addObject("alertMsg", "입력한 정보가 누락되었습니다. 처음부터 다시 가입해주세요.");  
             }
         }
         mv.setViewName("pc/common/result"); 
         mv.addObject("commandMap", commandMap);  
         
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
	@RequestMapping("/pc/member/onlineSimpleAgreement")
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
	@RequestMapping("/pc/member/onlineBusinessAgreement")
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
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/offlineAgreement")
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
	@RequestMapping("/pc/member/beforeOfflineAgreement1")
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
	@RequestMapping("/pc/member/beforeOfflineAgreement2")
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
	@RequestMapping("/pc/member/beforeOfflineAgreement3")
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
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/basicMemInfoPolicy")
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
	@RequestMapping("/pc/member/beforeBasicMemInfoPolicy1")
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
	@RequestMapping("/pc/member/beforeBasicMemInfoPolicy2")
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
	@RequestMapping("/pc/member/beforeBasicMemInfoPolicy3")
	public ModelAndView beforeBasicMemInfoPolicy3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	/**
	 * @api {get} /pc/member/offlineMemStep1
	 * @apiName  프론트 > 회원가입 > 오프라인통합 > 회원조회
	 * @apiGroup 오프라인회원통합
	 *
	 * @apiSuccess {Object} agreementList
	 */
	@RequestMapping("/pc/member/offlineMemStep1")
	public ModelAndView offlineMemStep1 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("joinMemType","offline");
		mv.addObject("agreementList", this.agreementBoardServiceImpl.selectAgreementInfoByAgreementIndex(Integer.toString(Code.AGREEMENT_OFFLINE_JOINSUS)));
		return mv;
	}
	/**
	 * @api {get} /pc/member/offlineMemStep2
	 * @apiName  프론트 > 회원가입 > 오프라인통합 > 약관동의
	 * @apiGroup 오프라인회원통합
	 *
	 * @apiSuccess {Object} commandMap
	 */
	@RequestMapping("/pc/member/offlineMemStep2")
	public ModelAndView offlineMemStep2 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap",commandMap);
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
	@RequestMapping("/pc/member/beforeBasicMemInfoPolicy4")
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
	@RequestMapping("/pc/member/beforeBasicMemInfoPolicy5")
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
	@RequestMapping("/pc/member/beforeBasicMemInfoPolicy6")
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
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/simpleMemInfoPolicy")
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
	@RequestMapping("/pc/member/businessMemInfoPolicy")
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
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/offlineMemInfoPolicy")
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
	@RequestMapping("/pc/member/beforeOfflineMemInfoPolicy1")
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
	@RequestMapping("/pc/member/beforeOfflineMemInfoPolicy2")
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
	@RequestMapping("/pc/member/beforeOfflineMemInfoPolicy3")
	public ModelAndView beforeOfflineMemInfoPolicy3 (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : samsungElecVipInfoPopup
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > 삼성전자 VIP 멤버쉽 회원 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/samsungElecVipInfoPopup")
	public ModelAndView samsungElecVipInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : lgElecVipInfoPopup
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > LG전자 VIP 멤버쉽 회원 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/lgElecVipInfoPopup")
	public ModelAndView lgElecVipInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : okCashServiceInfoPopup
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
	@RequestMapping("/pc/member/okCashServiceInfoPopup")
	public ModelAndView okCashServiceInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : okCashInfoPopup
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > OK캐쉬백 제휴가맹점 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/okCashInfoPopup")
	public ModelAndView okCashInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : samsungCardInfoPopup
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 푸터 > 개인정보취급방침 > 오프라인 개인정보 취급방침 > 삼성카드 마케팅활용 약관
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/member/samsungCardInfoPopup")
	public ModelAndView samsungCardInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : etcInfoPopup
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
	@RequestMapping("/pc/member/etcInfoPopup")
	public ModelAndView etcInfoPopup (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
		
	
}