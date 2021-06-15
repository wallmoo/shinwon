package com.market.mall.pc.business.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.market.mall.common.SessionsBusiness;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.ifcomm.siren.SirenCert;
import com.market.mall.pc.business.service.JoinBusinessService;
import com.market.mall.pc.business.service.StandingPointService;
import com.market.mall.pc.common.service.CommonService;

import egovframework.rte.fdl.property.EgovPropertyService;




/**
 * @PackageName: com.market.mall.pc.business.controller
 * @FileName : JoinBusinessController.java
 * @Date : 2016. 2. 4.
 * @프로그램 설명 : 
 * @author : DEV_LEEKWANGWOON
 */
@Controller("pcJoinBusinessController")
public class JoinBusinessController {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	
	@Autowired
	private SirenCert sirenCert;
	
	@Resource(name="pcJoinBusinessService") private JoinBusinessService pcJoinBusinessService;
	
	@Resource(name="pcCommonService") private CommonService pcCommonService;
	
	@Resource(name="pcStandingPointService") private StandingPointService pcStandingPointService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	
	/**
	 * <pre>
	 * 1. MethodName : businessMain
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    : 프론트 > 입점센터 > 메인
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 4.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/business/businessMain")
	public ModelAndView businessMain (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(SessionsBusiness.isLoginBusiness(request))
        {
			//입점센터 공통 정보 가져오기
			commandMap.put("VDR_LGN_IDX", StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")));
			Map<String,Object> basicInfo = this.pcStandingPointService.selectBussinessCommonInfo(commandMap);
			mv.addAllObjects(basicInfo);
        }
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : joinMemType
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    : 프론트 > 회원가입 > 신규 회원가입(약관동의)
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 4.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	*/
	@RequestMapping("/pc/business/joinVdrAgree")
	public ModelAndView joinVdrAgree (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		if(SessionsBusiness.isLoginBusiness(request))
        {
			mv.addObject("commandMap", commandMap);
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/business/businessMain.do");
            mv.setViewName("pc/common/result");
        }
		
		return mv;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : joinVdrBusiness
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    : 프론트 > 회원가입 > 신규 회원가입(가입 폼)
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 4.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/business/joinVdrBusiness")
	public ModelAndView joinVdrBusiness (HttpServletRequest request, @RequestParams Map<String,Object> commandMap ) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// commandMap 확인
		if("".equals(StringUtil.getString(commandMap.get("VDR_AGREE"), ""))  ){
			
			mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/business/joinVdrAgree.do");
            mv.setViewName("pc/common/result");
			
		}
		
		// Session 확인
		if(SessionsBusiness.isLoginBusiness(request))
        {
			mv.addObject("commandMap", commandMap);
            mv.addObject("returnUrl", request.getAttribute("frontDomain") + "/pc/business/businessMain.do");
            mv.setViewName("pc/common/result");
        }
		
		// Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE","BUSINESS_CODE"};
        mv.addObject("codes", this.pcCommonService.selectCodes(codes));		
        
		mv.addObject("commandMap", commandMap);        
		
		return mv;
	}	
	
	/**
	* <pre>
	* 1. MethodName : checkBusinessNoAjax
	* 2. ClassName  : JoinMemberController.java
	* 3. Comment    : 프론트 > 회원가입 > 기업회원 > 사업자등록번호 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 11. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/business/checkBusinessNoAjax")
	public JSON checkBusinessNoAjax (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		JSON json = new JSON();
		
		String VDR_LGN_BUSI1 = StringUtil.getString(commandMap.get("TEMP_VDR_LGN_BUSI1"),"");
		String VDR_LGN_BUSI2 = StringUtil.getString(commandMap.get("TEMP_VDR_LGN_BUSI2"),"");
		String VDR_LGN_BUSI3 = StringUtil.getString(commandMap.get("TEMP_VDR_LGN_BUSI3"),"");
		
		if(!"".equals(VDR_LGN_BUSI1) && !"".equals(VDR_LGN_BUSI2) && !"".equals(VDR_LGN_BUSI3))
        {
			// 사업자등록번호 유효성 체크
			if(EgovNumberCheckUtil.checkCompNumber(VDR_LGN_BUSI1, VDR_LGN_BUSI2, VDR_LGN_BUSI3))
			{
				json.put("successYn", "Y");
				
				// 사업자등록번호 체크
	            int BusinessNoCount = this.pcJoinBusinessService.selectCheckBusinessNoCount(commandMap);
	            
	            if( BusinessNoCount == 0)
	            {
	                json.put("resultYn", "Y");
	            }
	            else
	            {
	                json.put("resultYn", "N");
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
	 * 1. MethodName : joinBusinessRegist
	 * 2. ClassName  : JoinBusinessController.java
	 * 3. Comment    : 프론트 > 회원가입 > 등록
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 5.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/business/joinBusinessRegist")
	public ModelAndView joinBusinessRegist (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 회원 등록
		Map<String,Object> returnMap = this.pcJoinBusinessService.insertBusiness(request, commandMap);
		// 결과 값
		int result = Integer.valueOf(StringUtil.getString(returnMap.get("result"),""));
		
        // view Page Info
		if(result > 0)
		{
			mv.addObject("alertMsg", "등록 되었습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
		}
		else if(result == -1)
        {
        	mv.addObject("alertMsg", "이미 가입된 회원입니다.\\n로그인 해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
        }
        else if(result == 00)
        {
        	logger.info("#################### Excpetion 에러 ###########################");
        	mv.addObject("alertMsg", "알수 없는 오류가 발생하였습니다.\\n");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
        }
        else
        {
            mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
        }
        
        mv.setViewName("/pc/common/result");
        
        commandMap.clear();
        mv.addObject("commandMap", commandMap);
        
		return mv;
	}	

}