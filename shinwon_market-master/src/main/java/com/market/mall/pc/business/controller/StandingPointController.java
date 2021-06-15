package com.market.mall.pc.business.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.FileUploadException;
import com.epasscni.common.exception.PcAuthenticationBusinessException;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsBusiness;
import com.market.mall.common.annotations.AccessLevelBusiness;
import com.market.mall.ifcomm.siren.SirenCert;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Business.ROLEBUSINESS;
import com.market.mall.pc.business.service.LoginBusinessService;
import com.market.mall.pc.business.service.StandingPointService;
import com.market.mall.pc.common.service.CommonService;

import egovframework.rte.fdl.property.EgovPropertyService;


/**
 * @PackageName: com.market.mall.pc.business.controller
 * @FileName : StandingPointController.java
 * @Date : 2016. 2. 11.
 * @프로그램 설명 : 프론트 > 입점신청 > 입점신청 관련 처리
 * @author : DEV_LEEKWANGWOON
 */
@Controller("pcStandingPointController")
public class StandingPointController {
	
	@Resource(name="propertiesService") protected EgovPropertyService propertiesService;
	
	@Autowired
	private SirenCert sirenCert;
	
	@Resource(name="pcLoginBusinessService") private LoginBusinessService pcLoginBusinessService;
	
	@Resource(name="pcStandingPointService") private StandingPointService pcStandingPointService;
	
	@Resource(name="pcCommonService") private CommonService pcCommonService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	/**
	 * <pre>
	 * 1. MethodName : standingPointCounselForm
	 * 2. ClassName  : StandingPointController.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점상당 등록폼
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 11.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    
    @RequestMapping("/pc/business/standingPointCounselForm")
    public ModelAndView standingPointCounselForm (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
		if(SessionsBusiness.isLoginBusiness(request))
        {
			//입점센터 공통 정보 가져오기  
			commandMap.put("VDR_LGN_IDX", StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")));
			Map<String,Object> basicInfo = this.pcStandingPointService.selectBussinessCommonInfo(commandMap);
			mv.addAllObjects(basicInfo);
			 
			mv.setViewName("pc/business/standingPointCounselForm");
			mv.addObject("commandMap", commandMap);
			
    		// Common Codes (이메일, 국번, 핸드폰, 판매희망채널, 현재유통방법)
            String[] codes = {"EMAIL_DOMAIN_CODE","TEL_CODE","HP_CODE","HOPESALE_TYPE","NOWDISTRIBUTION_TYPE"}; 
            mv.addObject("codes", this.pcCommonService.selectCodes(codes));			
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}		
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : standingPointCounselRegist
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점상당 등록처리
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 12.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    /**
     * @api {POST} /pc/business/standingPointCounselRegist.do
     * @apiName 입점사 입점문의 등록처리
     * @apiGroup 고객센터
     * 
     * @apiParam {String} VDR_CST_GUBUN 쇼핑몰분류
     * @apiParam {String} VDR_CST_TITLE 제목
     * @apiParam {String} VDR_CST_CTS 내용
     * @apiParam {String} VDR_CST_NM 업체명
     * @apiParam {String} VDR_CST_BUSI1 사업자번호1
     * @apiParam {String} VDR_CST_BUSI2 사업자번호2
     * @apiParam {String} VDR_CST_BUSI3 사업자번호3
     * @apiParam {String} VDR_CST_SUB_BUSI 종사업자번호
     * @apiParam {String} VDR_CST_MNG_NM 담당자명
     * @apiParam {String} VDR_CST_HP1 담당자 휴대폰1
     * @apiParam {String} VDR_CST_HP2 담당자 휴대폰2
     * @apiParam {String} VDR_CST_HP3 담당자 휴대폰3
     * @apiParam {String} VDR_CST_TEL1 담당자 유선전화1
     * @apiParam {String} VDR_CST_TEL2 담당자 유선전화2
     * @apiParam {String} VDR_CST_TEL3 담당자 유선전화3
     * @apiParam {String} VDR_CST_MAIL 담당자 이메일
     * @apiParam {String} VDR_CST_AGR_YN 개인정보수집및동의여부 
     * @apiParam {String} VDR_CST_URL 사이트URL
     * @apiParam {String} file 첨부파일
     * 
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 실패시 RETURN URL
     */
    @RequestMapping("/pc/business/standingPointCounselRegist")
    @SuppressWarnings("unchecked")
	public ModelAndView standingPointCounselRegist (MultipartHttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		try
		{
			if(this.pcStandingPointService.insertStandingPointCounsel((MultipartHttpServletRequest)request,commandMap) > 0)
			{
	            mv.addObject("alertMsg", "입점문의가 완료되었습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
			}
			else
			{
	            mv.addObject("alertMsg", "입점문의 등록에 실패하였습니다.");
	            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");		            
			}
		}
		catch(FileUploadException e)
		{
			logger.debug("productCommentRegist Error : " + e.getMessage());
			mv.addObject("alertMsg", e.getMessage());
			//mv.addObject("script", "history.back();return;");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");				
		}
		catch(Exception e)
		{
			logger.debug("productCommentRegist Error : " + e.getMessage());
			mv.addObject("alertMsg", "입점문의 등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
		}
        
        mv.setViewName("/pc/common/result");
        
        commandMap.clear();
        mv.addObject("commandMap", commandMap);			
		
		return mv;	

        		
	}	
	
    /**
     * <pre>
     * 1. MethodName : standingPointCounselList
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점상당 리스트
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 15.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    @RequestMapping("/pc/business/standingPointCounselList")
	public ModelAndView standingPointCounselList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
    	
		ModelAndView mv = new ModelAndView();    	
		
		if(SessionsBusiness.isLoginBusiness(request))
		{
			commandMap.put("VDR_LGN_IDX", StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")));
			
			//입점센터 공통 정보 가져오기
			Map<String,Object> basicInfo = this.pcStandingPointService.selectBussinessCommonInfo(commandMap);
			mv.addAllObjects(basicInfo);
			
			// 입점신청 등록갯수
            int totalCount = this.pcStandingPointService.selectStandingPointCounselListCount(commandMap);
            commandMap.put("pageSize", 16);
            Paging paging = new Paging(totalCount, commandMap); 
            List<Map<String, Object>> list = null;
            if(totalCount>0)
            {
            	// 입점신청 목록
            	list = this.pcStandingPointService.selectStandingPointCounselList(commandMap);

            }        
            //RETURN OBJECT
            mv.addObject("paging", paging);
            mv.addObject("list", list);
            mv.addObject("totalCount", totalCount);
            mv.addObject("commandMap", commandMap);
            return mv;            
			
		}
		else
		{
			throw new PcAuthenticationBusinessException();			
		}
	
    }
    
    /**
     * <pre>
     * 1. MethodName : standingPointCounselView
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점상당 뷰페이지
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 15.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    
    /**
     * @api {GET} /pc/business/standingPointCounselView.do
     * @apiName 입점사 입점문의 작성화면
     * @apiGroup 고객센터
     * 
     * @apiSuccess {Object} codes 공통 코드 리스트 (이메일 도메인 코드, 국번 코드, 은행코드, 핸드폰 앞자리 코드)
     */
    @SuppressWarnings({ "unchecked", "unused" })
    @RequestMapping("/pc/business/standingPointCounselView")
	public ModelAndView standingPointCounselView (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
    	
		ModelAndView mv = new ModelAndView();    	
		
	    // Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "TEL_CODE", "KICC_BANK_CD", "HP_CODE"};
        Map<String,Object> returnMap = this.pcCommonService.selectCodes(codes);
        
        mv.addObject("codes", returnMap);         
        
        return mv;
		
    }    
    
    
    /**
     * <pre>
     * 1. MethodName : standingPointCounselRemove
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점상당 삭제처리
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 16.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessLevelBusiness(ROLEBUSINESS.business)
	@RequestMapping("/pc/business/standingPointCounselRemove")
	public ModelAndView standingPointCounselRemove (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		if(SessionsBusiness.isLoginBusiness(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("VDR_LGN_IDX", StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")));
			
			int result = this.pcStandingPointService.deleteStandingPointCounsel(commandMap);
			
			// view Page Info
			if(result > 0)
			{
				mv.addObject("alertMsg", "삭제되었습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/standingPointCounselList.do");
				
			}
			else
			{
				mv.addObject("alertMsg", "삭제 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/standingPointCounselList.do");
			}
			
			mv.addObject("commandMap", commandMap);
			
			// 해당 브랜드로 이동
	        mv.setViewName("pc/common/result");
	        
			return mv;
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}
	}    

    /**
     * <pre>
     * 1. MethodName : standingPointCounselEdit
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점상당 수정폼
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 16.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	@AccessLevelBusiness(ROLEBUSINESS.business)
	@RequestMapping("/pc/business/standingPointCounselEdit")
	public ModelAndView standingPointCounselEdit (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
    	
    	if(SessionsBusiness.isLoginBusiness(request))
        {
			ModelAndView mv = new ModelAndView();
			
			
			commandMap.put("VDR_CST_IDX", StringUtil.getString(commandMap.get("VDR_CST_IDX"), ""));

           	// 입점신청 상세정보
           	Map<String, Object> resultMap = this.pcStandingPointService.selectStandingPointCounselView(commandMap);
           	Map<String, String> returnDtlMap = (Map<String, String>) resultMap.get("row");
           	if(returnDtlMap != null){
           		
           		// 현재 세션정보와 디비값 비교
           		if( StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")) != StringUtil.getInt(returnDtlMap.get("VDR_LGN_IDX")) ){
           			mv.addObject("alertMsg", "올바른 접근이 아닙니다.");
           			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
           			mv.setViewName("/pc/common/result");
           		}
           		
           		/////////// 			현재 유통방법 한글명 가져오기 시작             		///////////
           		String strVdrCstDtb =  StringUtil.getString(returnDtlMap.get("VDR_CST_DTB"), "");
           		String[] tempDtb =  StringUtil.split(strVdrCstDtb, "|");
           		
        		// Common Codes (현재유통방법, 이메일, 국번, 핸드폰, 판매희망채널)
                String[] codes = {"NOWDISTRIBUTION_TYPE","EMAIL_DOMAIN_CODE","TEL_CODE","HP_CODE","HOPESALE_TYPE","STANDINGPOINT_CODE"}; 
            	Map<String,Object> returnMap = this.pcCommonService.selectCodes(codes);
            	mv.addObject("codes", this.pcCommonService.selectCodes(codes));
        		List<Map<String, Object>> returnDtlList = (List<Map<String,Object>>)returnMap.get(codes[0]);
        		List<Map<String, Object>> standingPointCodeList = (List<Map<String,Object>>)returnMap.get(codes[5]);
        		Map<String,Object> standingPointMap = (Map<String,Object>)standingPointCodeList.get(0);
        		
        		
           		// 현재 상태값이 접수중인지 확인        		
        		if( StringUtil.getInt(returnDtlMap.get("VDR_CST_GBN")) !=  StringUtil.getInt(standingPointMap.get("CMN_COM_IDX"))){
         			mv.addObject("alertMsg", "수정은 접수중일때만 가능합니다.");
           			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/standingPointCounselList.do");
           			mv.setViewName("/pc/common/result");     			
        		}
        		
        		if(returnDtlList != null && returnDtlList.size() > 0){
        			
        			String resultDtbNm = "";
        			Map<String, Object> detailMap = null;
        			for(int i=0; i<returnDtlList.size(); i++){
        				detailMap = returnDtlList.get(i);
    					
        				for(int v=0; v<tempDtb.length; v++){
        					if(StringUtil.getInt(detailMap.get("CMN_COM_IDX")) == StringUtil.getInt(tempDtb[v])){
        						resultDtbNm += "";
        		       			if(!"".equals(resultDtbNm)) resultDtbNm += ',';
        		       			resultDtbNm += StringUtil.getString(detailMap.get("CMN_COM_NM"), "");
        					}
        				}
        			}
        			// 현재 유통방법 한글명
    	           	mv.addObject("resultDtbNm", resultDtbNm);
        		}
           		/////////// 			현재 유통방법 한글명 가져오기 종료             		///////////        		
        
	           	mv.addObject("row", resultMap.get("row"));
	            mv.addObject("fileList", resultMap.get("fileList"));
	            mv.addObject("commandMap", commandMap);
      
           	}else{
         		// 등록된 정보가 없을때
     			mv.addObject("alertMsg", "등록된 정보가 없습니다.");
       			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
       			mv.setViewName("/pc/common/result");     		
           	}
	
			return mv;
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}    	
    	
    }
    
    
    /**
     * <pre>
     * 1. MethodName : standingPointCounselModify
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점상당 수정처리
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 16.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@AccessLevelBusiness(ROLEBUSINESS.business)
	@RequestMapping("/pc/business/standingPointCounselModify")
	public ModelAndView standingPointCounselModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		
		
    	if(SessionsBusiness.isLoginBusiness(request))
        {
			ModelAndView mv = new ModelAndView();
			
			
			commandMap.put("VDR_CST_IDX", StringUtil.getString(commandMap.get("VDR_CST_IDX"), ""));

           	// 입점신청 상세정보
           	Map<String, Object> resultMap = this.pcStandingPointService.selectStandingPointCounselView(commandMap);
           	Map<String, String> returnDtlMap = (Map<String, String>) resultMap.get("row");
           	if(returnDtlMap != null){
           		
           		// 현재 세션정보와 디비값 비교
           		if( StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")) != StringUtil.getInt(returnDtlMap.get("VDR_LGN_IDX")) ){
           			mv.addObject("alertMsg", "올바른 접근이 아닙니다.");
           			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
           			mv.setViewName("/pc/common/result");
           		}
           		
           		int result = this.pcStandingPointService.updateStandingPointCounsel((MultipartHttpServletRequest)request,commandMap);
    			
    			if(result > 0)
    			{
    				mv.addObject("alertMsg", "수정되었습니다.");
    				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/standingPointCounselView.do");
    				
    			}
    			else
    			{
    				mv.addObject("alertMsg", "수정실패하였습니다.");
    				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/standingPointCounselView.do");
    			}
    			mv.addObject("commandMap", commandMap);
    			// 해당 브랜드로 이동
    	        mv.setViewName("pc/common/result");
    			return mv;           		

      
           	}else{
         		// 등록된 정보가 없을때
     			mv.addObject("alertMsg", "등록된 정보가 없습니다.");
       			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
       			mv.setViewName("/pc/common/result");     		
           	}
	
			return mv;
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}		
	}
	
	/**
	 * <pre>
	 * 1. MethodName : standingPointCounselApplication
	 * 2. ClassName  : StandingPointController.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 관리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
    /**
     * @api {GET} /pc/business/standingPointApplication.do
     * @apiName 입점사 입점신청 작성화면
     * @apiGroup 고객센터
     * 
     * @apiSuccess {Object} codes 공통코드리스트 {EMAIL_DOMAIN_CODE=[{CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=55, CMN_COM_LEVEL=1, CMN_COM_NM=naver.com, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20140911165642, CMN_COM_SORT=1, CMN_COM_REG_IP=127.0.0.4, CMN_COM_UPD_IP=211.50.237.222, CMN_COM_ETC1=네이버}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=56, CMN_COM_LEVEL=1, CMN_COM_NM=daum.net, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20140911165642, CMN_COM_SORT=3, CMN_COM_REG_IP=127.0.0.5, CMN_COM_UPD_IP=211.50.237.222, CMN_COM_ETC1=다음메일}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=69, CMN_COM_LEVEL=1, CMN_COM_NM=gmail.com, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20140911165642, CMN_COM_SORT=4, CMN_COM_REG_IP=127.0.0.19, CMN_COM_UPD_IP=211.50.237.222, CMN_COM_ETC1=지메일}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=59, CMN_COM_LEVEL=1, CMN_COM_NM=nate.com, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20140911165642, CMN_COM_SORT=5, CMN_COM_REG_IP=127.0.0.9, CMN_COM_UPD_IP=211.50.237.222, CMN_COM_ETC1=네이트}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=52, CMN_COM_LEVEL=1, CMN_COM_NM=hotmail.net, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200324044451, CMN_COM_SORT=6, CMN_COM_REG_IP=127.0.0.1, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=msn}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=54, CMN_COM_LEVEL=1, CMN_COM_NM=yahoo.com, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20140911165642, CMN_COM_SORT=8, CMN_COM_REG_IP=127.0.0.3, CMN_COM_UPD_IP=211.50.237.222, CMN_COM_ETC1=야후}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20140327093500, CMN_COM_UP_IDX=51, CMN_COM_TOP_IDX=51, CMN_COM_REG_ID=admin, CMN_COM_IDX=60, CMN_COM_LEVEL=1, CMN_COM_NM=dreamwiz.com, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20140911165642, CMN_COM_SORT=9, CMN_COM_REG_IP=127.0.0.10, CMN_COM_UPD_IP=211.50.237.222, CMN_COM_ETC1=드림위즈}], TEL_CODE=[{CMN_COM_IDX=22, CMN_COM_LEVEL=1, CMN_COM_NM=02, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=1, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=서울, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=23, CMN_COM_LEVEL=1, CMN_COM_NM=031, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=2, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=인천, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=24, CMN_COM_LEVEL=1, CMN_COM_NM=042, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=3, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=대전, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=25, CMN_COM_LEVEL=1, CMN_COM_NM=053, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=4, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=대구, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=26, CMN_COM_LEVEL=1, CMN_COM_NM=062, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=5, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=광주, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=27, CMN_COM_LEVEL=1, CMN_COM_NM=053, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=6, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=울산, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=28, CMN_COM_LEVEL=1, CMN_COM_NM=051, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=7, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=부산, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=29, CMN_COM_LEVEL=1, CMN_COM_NM=033, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=8, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=강원도, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=30, CMN_COM_LEVEL=1, CMN_COM_NM=032, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=9, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=경기도, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=31, CMN_COM_LEVEL=1, CMN_COM_NM=064, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=10, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=제주도, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=32, CMN_COM_LEVEL=1, CMN_COM_NM=041, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=11, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=충남, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=33, CMN_COM_LEVEL=1, CMN_COM_NM=043, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=12, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=충북, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=34, CMN_COM_LEVEL=1, CMN_COM_NM=054, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=13, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=경북, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=35, CMN_COM_LEVEL=1, CMN_COM_NM=055, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=14, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=경남, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=36, CMN_COM_LEVEL=1, CMN_COM_NM=063, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=15, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=전북, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=37, CMN_COM_LEVEL=1, CMN_COM_NM=061, CMN_COM_REG_DT=20140327093500, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=16, CMN_COM_REG_IP=127.0.0.1, CMN_COM_ETC1=전남, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3083, CMN_COM_LEVEL=1, CMN_COM_NM=044, CMN_COM_REG_DT=20200324044241, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=17, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3084, CMN_COM_LEVEL=1, CMN_COM_NM=052, CMN_COM_REG_DT=20200324044257, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=18, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3085, CMN_COM_LEVEL=1, CMN_COM_NM=070, CMN_COM_REG_DT=20200324044327, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=21, CMN_COM_TOP_IDX=21, CMN_COM_SORT=19, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_REG_ID=admin}]}
     */
	@SuppressWarnings("unchecked")
	@RequestMapping("/pc/business/standingPointApplication")
	public ModelAndView standingPointApplication (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception{
	
		ModelAndView mv = new ModelAndView();

		// Common Codes
        String[] codes = {"EMAIL_DOMAIN_CODE", "TEL_CODE", "KICC_BANK_CD", "HP_CODE"};
        Map<String,Object> returnMap = this.pcCommonService.selectCodes(codes);
        
        mv.addObject("codes", returnMap);
	
		mv.setViewName("pc/business/standingPointApplicationForm");
		return mv;

	}
	
	/**
	 * <pre>
	 * 1. MethodName : standingPointApplicationRegist
	 * 2. ClassName  : StandingPointController.java
	 * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 등록처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 2. 16.
	 * </pre>
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
    /**
     * @api {POST} /pc/business/standingPointApplicationRegist.do
     * @apiName 입점사 입점신청 등록처리
     * @apiGroup 고객센터
     * 
     * @apiParam {String} VDR_REQ_NM 입점업체명
     * @apiParam {String} VDR_REQ_CEO_NM 대표자명
     * @apiParam {String} VDR_REQ_BUSI1 사업자등록번호1 
     * @apiParam {String} VDR_REQ_BUSI2 사업자등록번호2 
     * @apiParam {String} VDR_REQ_BUSI3 사업자등록번호3 
     * @apiParam {String} VDR_REQ_SUB_BUSI 종사업자번호
     * @apiParam {String} file 사업자등록증 파일
     * @apiParam {String} address 사업장 기본주소
     * @apiParam {String} subAddress 사업장 상세주소
     * @apiParam {String} VDR_REQ_POST5 사업장 우편번호
     * @apiParam {String} VDR_REQ_TAX_MAIL 세금계산서이메일
     * @apiParam {String} VDR_REQ_BUSI_TYPE 업종
     * @apiParam {String} VDR_REQ_BUSI_CDT 업태
     * @apiParam {String} VDR_REQ_REF_TEL1 연락처1
     * @apiParam {String} VDR_REQ_REF_TEL2 연락처2
     * @apiParam {String} VDR_REQ_REF_TEL3 연락처3
     * @apiParam {String} VDR_REQ_FAX1 팩스1
     * @apiParam {String} VDR_REQ_FAX2 팩스2
     * @apiParam {String} VDR_REQ_FAX3 팩스3
     * @apiParam {String} VDR_REQ_BANK_CD 은행코드
     * @apiParam {String} VDR_REQ_ACT_NO 계좌번호
     * @apiParam {String} VDR_REQ_ACT_HDR 예금주
     * @apiParam {String} VDR_REQ_SHP_NM 쇼핑몰명
     * @apiParam {String} VDR_REQ_URL 사이트URL
     * @apiParam {String} VDR_REQ_SHP_GUBUN 쇼핑몰분류
     * @apiParam {String[]} channelList 외부채널 ( ["지그재그","블로그"] )
     * @apiParam {String} VDR_REQ_MNG_NM 담당자명
     * @apiParam {String} VDR_REQ_TEL1 담당자 연락처1
     * @apiParam {String} VDR_REQ_TEL2 담당자 연락처2
     * @apiParam {String} VDR_REQ_TEL3 담당자 연락처3
     * @apiParam {String} VDR_REQ_HP1 담당자 휴대폰1
     * @apiParam {String} VDR_REQ_HP2 담당자 휴대폰2
     * @apiParam {String} VDR_REQ_HP3 담당자 휴대폰3
     * @apiParam {String} VDR_REQ_PATH 입점경로
     * @apiParam {String} VDR_REQ_CNT 요청사항
     * 
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 실패시 RETURN URL
     */
    @RequestMapping("/pc/business/standingPointApplicationRegist")
    @SuppressWarnings("unchecked")
	public ModelAndView standingPointApplicationRegist (MultipartHttpServletRequest request, @RequestParams Map<String,Object> commandMap
	        , @RequestParams(value="channelList") String[] channelList) throws Exception
	{

		ModelAndView mv = new ModelAndView();
		commandMap.put("channelList", channelList);
		try
		{
            if(this.pcStandingPointService.insertStandingPointApplication(request,commandMap) > 0)
            {
                mv.addObject("alertMsg", "등록 되었습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
            }
            else
            {
                mv.addObject("alertMsg", "등록에 실패하였습니다.");
                mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");                  
            }
		}
		catch(Exception e)
		{
			logger.debug("productCommentRegist Error : " + e.getMessage());
			mv.addObject("alertMsg", "등록에 실패하였습니다.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
		}
        
        mv.setViewName("/pc/common/result");
        
        commandMap.clear();
        mv.addObject("commandMap", commandMap);			
		
		return mv;	

        		
	}		
 
    /**
     * <pre>
     * 1. MethodName : standingPointApplicationModify
     * 2. ClassName  : StandingPointController.java
     * 3. Comment    : 프론트 > 입점신청 > 입점 신청서 수정처리
     * 4. 작성자       : DEV_LEEKWANGWOON
     * 5. 작성일       : 2016. 2. 17.
     * </pre>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@SuppressWarnings("unchecked")
	@RequestMapping("/pc/business/standingPointApplicationModify")
	public ModelAndView standingPointApplicationModify (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		
    	if(SessionsBusiness.isLoginBusiness(request))
        {
			ModelAndView mv = new ModelAndView();
			
			// 입점 신청서
			commandMap.put("VDR_LGN_IDX", StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")));
			commandMap.put("KICC_BANK_CD", Code.KICC_BANK_CD);
           	Map<String, Object> resultMap = this.pcStandingPointService.selectStandingPointApplication(commandMap);
           	Map<String, String> returnDtlMap = (Map<String, String>) resultMap.get("row");
           	
           	if(returnDtlMap != null){
           		
           		// 현재 세션정보와 디비값 비교
           		if( StringUtil.getInt(SessionsBusiness.getSessionBusinessValue("VDR_LGN_IDX")) != StringUtil.getInt(returnDtlMap.get("VDR_LGN_IDX")) ){
           			mv.addObject("alertMsg", "올바른 접근이 아닙니다.");
           			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
           			mv.setViewName("/pc/common/result");
           		}
           		
           		int result = this.pcStandingPointService.updateStandingPointApplication(request,commandMap);
    			
    			if(result > 0)
    			{
    				mv.addObject("alertMsg", "수정되었습니다.");
    				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do");
    				
    			}
    			else
    			{
    				mv.addObject("alertMsg", "수정실패하였습니다.");
    				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/business/businessMain.do");
    			}
    			mv.addObject("commandMap", commandMap);
    			// 해당 브랜드로 이동
    	        mv.setViewName("pc/common/result");
    			return mv;           		

      
           	}else{
         		// 등록된 정보가 없을때
     			mv.addObject("alertMsg", "등록된 정보가 없습니다.");
       			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/business/businessMain.do");
       			mv.setViewName("/pc/common/result");     		
           	}
	
			return mv;
        }
		else
		{
			throw new PcAuthenticationBusinessException();
		}			
		
	}
	
}



