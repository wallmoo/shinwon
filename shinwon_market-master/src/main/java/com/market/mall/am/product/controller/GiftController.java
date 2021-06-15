package com.market.mall.am.product.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.product.service.GiftService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Admin;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : GiftController.java
 * @Date : 2015. 5. 3.
 * @프로그램 설명 : 관리자 > 상품관리 > 사은품관리를 처리하는 Controller Class
 * @author jesong
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class GiftController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="giftService") private GiftService giftService;
    @Resource(name="commonService") private CommonService commonService;
    @Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    
    /**
     * <pre>
     * 1. MethodName : giftList
     * 2. ClassName  : GiftController.java
     * 3. Comment    : 관리자 > 상품관리 > 사은품관리목록
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 3.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/product/giftList.do
     * @apiName 사은품 관리 목록 화면
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} searchGftMstName 검색 사은품명
     * @apiParam {String} searchStartDate 검색 시작일
     * @apiParam {String} searchEndDate 검색 종료일
     * @apiParam {String} searchGftMstUseYn 검색 상태
     * 
     * @apiSuccess {Object} commandMap 파라미터 맵
     * @apiSuccess {Object[]} list 진행중인 기획전 리스트 [{GFT_MST_IDX=사은품관리IDX, GFT_MST_NAME=사은품명, GFT_MST_OPTION=사은품옵션, GFT_MST_ST_DT=시작일자, GFT_MST_ED_DT=종료일자, GFT_MST_COND_AMT=조건금액, GFT_MST_USE_YN=사용여부, PRD_CNT=상품수, GFT_MST_REG_DT=최초등록일}]
     */
    @RequestMapping(value="/am/product/giftList")
    public ModelAndView giftList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //기본값 설정
        commandMap.put("searchPrdMstDelFlag", "N");        
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        if( StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ){
        	totalCount = 0 ;
        	paging = new Paging(totalCount, commandMap); 
        }
        else{
        	//페이징
        	totalCount = this.giftService.selectGiftListCount(commandMap);
        	paging = new Paging(totalCount, commandMap); 
        
        	if(totalCount>0)
        	{
        		list = this.giftService.selectGiftList(commandMap);
        	}
        }

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : giftForm
    * 2. ClassName  : GiftController.java
    * 3. Comment    : 관리자 > 상품관리 > 사은품관리 등록 화면 
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return ModelAndView
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/giftForm.do
     * @apiName 사은품 등록 화면
     * @apiGroup SB상품관리
     * 
     * @apiSuccess {Object} commandMap 파라미터 맵
     * @apiSuccess {Object[]} planList 진행중인 기획전 리스트 [{PLN_MST_IDX, PLN_MST_CHANNEL_PC_YN, PLN_MST_CHANNEL_MOBILE_YN, PLN_MST_TITLE}]
     */
    @RequestMapping(value="/am/product/giftForm")
    public ModelAndView giftForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> planList = null;
        
        //기획전 목록 가져오기
        planList = this.giftService.selectPlanList(commandMap);
        
        mv.addObject("commandMap", commandMap);
        mv.addObject("planList", planList);
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : giftRegist
     * 2. ClassName  : GiftController.java
     * 3. Comment    : 관리자 > 상품관리 > 사은품관리 등록
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 3.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/product/giftRegist.do
     * @apiName 사은품 등록 처리
     * @apiGroup SB상품관리
     * 
     * @apiParam {String[]} APPLY_IDXs 적용상품코드배열
     * @apiParam {String} GFT_MST_NAME 사은품명
     * @apiParam {String} GFT_MST_OPTION 사은품_옵션
     * @apiParam {String} GFT_MST_ST_DT 시작일자
     * @apiParam {String} GFT_MST_ED_DT 종료일자
     * @apiParam {String} GFT_MST_COND_AMT 조건금액 
     * @apiParam {String} GFT_MST_USE_YN 사용여부
     * @apiParam {String} GFT_MST_GUBUN 사은품 구분(P 상품 , S 주문금액, D:기획전)
     * @apiParam {String} GFT_MST_STOCK_CNT 재고수량
     * @apiParam {String} GFT_MST_PRD_TYPE 사은품이미지 타입(P 상품 선택, F 파일등록)
     * @apiParam {String} GFT_MST_PRD_CD 사은품 이미지 상품코드
     * @apiParam {String} file 사은품 이미지
     * @apiParam {String} GFT_MST_PLN_IDX 기획전IDX
     * 
     * @apiSuccess {Object} commandMap 파라미터 맵
     * @apiSuccess {String} alertMsg 등록 성공/실패 메세지
     * @apiSuccess {String} returnUrl 등록 성공 이후 돌아가는 URL
     */
    @FrontBannerSkip
    @RequestMapping(value="/am/product/giftRegist")
    public ModelAndView giftRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="APPLY_IDXs") String[] APPLY_IDXs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();

        int result = 0; 
        String alertMsg = "";

        // 적용상품 배열 
        commandMap.put("arrPRD_MST_CD", APPLY_IDXs);
    		
        result = this.giftService.insertGift((MultipartHttpServletRequest) request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 저장되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }

        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/giftList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : giftEdit
     * 2. ClassName  : GiftController.java
     * 3. Comment    : 관리자 > 상품관리 > 사은품관리 수정 화면 
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 3.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/product/giftEdit.do
     * @apiName 사은품 관리 수정 화면
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} searchGftMstName 검색 사은품명
     * @apiParam {String} searchStartDate 검색 시작일
     * @apiParam {String} searchEndDate 검색 종료일
     * @apiParam {String} searchGftMstUseYn 검색 상태
     * 
     * @apiSuccess {Object} giftInfo 사은품 상세 정보 {GFT_MST_REG_DT=20200419081117, GFT_MST_NAME=기획전용사은품테스트, GFT_MST_OPTION=1+1, 옵션있음, 이미지테스트옵션, GFT_MST_PRD_TYPE=P, GFT_MST_REG_NM=슈퍼관리자, GFT_MST_ED_DT=2020-05-19, GFT_MST_PLN_IDX=287, GFT_MST_REG_ID=admin, GFT_MST_IDX=64, GFT_MST_GUBUN=D, GFT_MST_REG_IP=0:0:0:0:0:0:0:1, GFT_MST_PRD_CD=S0012074, GFT_MST_STOCK_CNT=100, GFT_MST_ST_DT=2020-04-01, GFT_MST_USE_YN=Y}
     * @apiSuccess {Object[]} productList 사은품에 등록된 연관 상품 리스트 [{PRD_MST_NM=나이키 에어 포스 1 ‘07, PRD_IMAGE=/attach/product/2020/04/13/S0012073/S0012073_0_84.jpg, PRD_MST_CD=S0012073, PRD_MST_CNL_PC_YN=Y, PRD_MST_PRC=129000, PRD_MST_SEL_STATE=I}, {PRD_MST_NM=[뉴발란스] 뉴발란스 574 스니커즈 ML574EGG, PRD_IMAGE=/attach/product/2020/04/13/S0012074/S0012074_0_84.jpeg, PRD_MST_CD=S0012074, PRD_MST_CNL_PC_YN=Y, PRD_MST_PRC=75800, PRD_MST_SEL_STATE=I}]
     * @apiSuccess {Object[]} planList 진행중 기획전목록 [{PLN_MST_CHANNEL_MOBILE_YN=N, PLN_MST_IDX=186, PLN_MST_TITLE=만나면 좋은친구, PLN_MST_CHANNEL_PC_YN=N}, {PLN_MST_CHANNEL_MOBILE_YN=N, PLN_MST_IDX=286, PLN_MST_TITLE=테스트기획전, PLN_MST_CHANNEL_PC_YN=N}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_IDX=288, PLN_MST_TITLE=립밤, PLN_MST_CHANNEL_PC_YN=Y}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_IDX=287, PLN_MST_TITLE=몽키, PLN_MST_CHANNEL_PC_YN=Y}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_IDX=395, PLN_MST_TITLE=매거진, PLN_MST_CHANNEL_PC_YN=Y}]
     * @apiSuccess {Object[]} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/giftEdit")
    public ModelAndView giftEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //상품 상세 정보
        Map<String, Object> resultMap = this.giftService.selectGiftInfo(commandMap);
        
        List<Map<String, Object>> planList = null;
        
        //기획전 목록 가져오기
        planList = this.giftService.selectPlanList(commandMap);
        
        //RETURN OBJECT
        mv.addObject("giftInfo",    resultMap.get("giftInfo"));   
        mv.addObject("productList", resultMap.get("productList")); 
        mv.addObject("planList",    planList);   
        mv.addObject("commandMap",  commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : giftModify
     * 2. ClassName  : GiftController.java
     * 3. Comment    : 관리자 > 상품관리 > 사은품관리 수정
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 3.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/giftModify")
    public ModelAndView giftModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="APPLY_IDXs") String[] APPLY_IDXs) throws Exception 
    {
        ModelAndView mv = new ModelAndView();

        int result = 0; 
        String alertMsg = "";

        // 적용상품 배열 
        commandMap.put("arrPRD_MST_CD", APPLY_IDXs);

    		
        result = this.giftService.updateGift((MultipartHttpServletRequest) request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 수정되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }

        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/giftList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
}
