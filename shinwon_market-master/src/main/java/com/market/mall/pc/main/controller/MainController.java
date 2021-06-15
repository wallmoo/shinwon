package com.market.mall.pc.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.TagDisplayService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.customer.service.NoticeBoardService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.tag.service.TagService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.main.controller
 * @FileName : MainController.java
 * @Date : 2014. 6. 24.
 * @프로그램 설명 : PC 메인화면을 처리하는 Controller Class
 * @author 이상준  
 */
@Controller
@AccessLevelUser(ROLEUSER.guest)
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="productListService") 
	private ProductListService productListService;
	@Resource(name="pcCommonService")		
	private CommonService pcCommonService;	
	
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;	
	
	@Resource(name="productService") 
	private ProductService productService;
	
	@Resource(name="pcNoticeBoardService")
    private NoticeBoardService pcNoticeBoardService;
	
	@Resource(name="TagService")
	private TagService pcTagService;
	
	@Resource(name="tagDisplayService")
	private TagDisplayService tagDisplayService;
	
	// 리스트에서 보여질 상품의 이미지 사이즈
	private final static int _LIST_THUMBNAIL_LARGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE;
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST;
	

	/**
	 * @api {get} /pc/main/index.do
	 * @apiName  PC 메인
	 * @apiGroup 메인
	 * @apiSuccess {Object} MainProBannerList
	 * @apiSuccess {Object} MainReNewBannerList
	 * @apiSuccess {Object} MainPlenEventBannerList
	 * @apiSuccess {Object} mainOneDaySaleInfo
	 * @apiSuccess {Object} MainTrandAThemeBannerList
	 * @apiSuccess {Object} MainReNewBannerList
	 * @apiSuccess {Object} MainTrandALeftBannerList
	 * @apiSuccess {Object} MainTrandARightBannerList
	 * @apiSuccess {Object} MainTrandBBannerList
	 * @apiSuccess {Object} MainTrandBThemeBannerList
	 * @apiSuccess {Object} MainTrandBPrdBannerList
	 * @apiSuccess {Object} MainTrandBLeftBannerList
	 * @apiSuccess {Object} MainTrandBRightBannerList
	 * @apiSuccess {Object} MainBestItmList
	 * @apiSuccess {Object} MainCleanProductList
	 * @apiSuccess {Object} MainMdPickIconList
	 * @apiSuccess {Object} MainMdPickProductList
	 * @apiSuccess {Object} noticeList
	 * @apiSuccess {Object} listProductGuideList
	 * @apiSuccess {Object} mainTimeSaleInfo
	 * @apiSuccess {Object} TAG_LIST
	 * @apiSuccess {Object} listPopup
	 * @apiSuccess {Object} commandMap
	 * @apiSuccess {Object} areaCheck
	 */
	@RequestMapping("/pc/main/index.do")
    public ModelAndView index(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
        ModelAndView mv = new ModelAndView();
        
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        
        // 접근한 서버의 브랜드 코드 설정
        String brandCd = StringUtil.getString(request.getAttribute("serverBrandCd"));
        commandMap.put("BRAND_CD", brandCd);
        // 접근한 서버의 회사코드 설정
        String compCd = StringUtil.getString(request.getAttribute("serverCompCd"));
        commandMap.put("COMP_CD", compCd);
        // 로그인 여부 확인 
        if(SessionsUser.isLogin(request) )
        {
			commandMap.put("LOGIN_YN", "Y");
		}
		else
		{
			commandMap.put("LOGIN_YN", "N");
		}
        // PC 환경에서 접속 
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        // 온라인 상품만 ...
        commandMap.put("PRD_MST_ONLINE_YN", "Y");
        
        // 로그인 회원정보
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        // 사입이 아닌 상품만 
        //commandMap.put("PRD_MST_PURCHASE_YN", "N");
        
        //이미지 사이즈 
        //commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM);
        
        // 메인페이지 입니다(팝업용)
        commandMap.put("POP_MST_VIEW_LOCATION", Code.POPUP_LOCATION_CODE_MAINPAGE);
        // 메인 팝업 리스트 
        List<Map<String, Object>> listPopup = this.pcCommonService.selectPopupList(commandMap);
        
        //메인 프로모션
        Map<String, Object> bannerMap = new HashMap<String, Object>();
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_PROMOTION_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	mv.addObject("MainProBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//메인 연장배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_RENEW_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainReNewBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//기획전이벤트 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_PLAN_EVENT_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_B);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", "");
    	mv.addObject("MainPlenEventBannerList", this.productListService.selectBannerDisplayListTypeB(bannerMap));
    	
    	//기획전이벤트 원데이특가 배너
    	//원데이특가 내용
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_LARGE_SIZE_);
        Map<String, Object> mainOneDaySaleInfo = this.productService.selectMainOneDayInfo(commandMap);
        mv.addObject("mainOneDaySaleInfo", mainOneDaySaleInfo);
        
    	//트렌드A 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_A_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandABannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드A 테마 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_A_THEME_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandAThemeBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드A 상품
    	Map<String, Object> PrdbannerMap = new HashMap<String, Object>();
    	PrdbannerMap.put("CMN_COM_IDX", Code.PC_MANIN_TREND_A_PRODUCT_ITEM);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE);
    	PrdbannerMap.put("RNUM", 6);
    	mv.addObject("MainTrandAPrdBannerList", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//트렌드A 왼쪽 BG 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_A_LEFT_BG_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandALeftBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드A 오른쪽 BG 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_A_RIGHT_BG_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandARightBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드B 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_B_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandBBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드B 테마 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_B_THEME_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandBThemeBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드B 상품
    	PrdbannerMap.put("CMN_COM_IDX", Code.PC_MANIN_TREND_B_PRODUCT_ITEM);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE);
    	PrdbannerMap.put("RNUM", 6);
    	mv.addObject("MainTrandBPrdBannerList", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//트렌드B 왼쪽 BG 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_B_LEFT_BG_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandBLeftBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드B 오른쪽 BG 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_TREND_B_RIGHT_BG_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandBRightBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//베스트 상품MD
    	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
    	mv.addObject("MainBestItmList", this.productListService.selectBestProductDisplayList(commandMap));
    	
    	//프라이스킹 서비스 > 클린킹
    	PrdbannerMap.put("CMN_COM_IDX", Code.PC_MANIN_THEME_CLEAN_BANNER);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE);
    	PrdbannerMap.put("MEM_CRT_SES_ID", commandMap.get("MEM_CRT_SES_ID"));
    	PrdbannerMap.put("RNUM", 4);
    	mv.addObject("MainCleanProductList", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//엠디 추천 아이콘 리스트
    	mv.addObject("MainMdPickIconList", this.productListService.selectMdPickBannerDisplayList(commandMap));
    	
    	//엠디추천 키워드1 상품
    	PrdbannerMap.put("CMN_COM_IDX", Code.PC_MANIN_MD_PICK_PRODUT_MD1);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE);
    	PrdbannerMap.put("RNUM", 5);
    	mv.addObject("MainMdPickProductList", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//하단 이벤트 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_BOTTOM_EVENT_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainBottomEventBannerList", this.productListService.selectBannerDisplayList(bannerMap));
        
        //콘텐츠 리스트
        Map<String, Object> productGuidMap = new HashMap<String, Object>();
        productGuidMap.put("PRD_CTG_ENV", commandMap.get("PRD_CTG_ENV"));
        productGuidMap.put("CMM_FLE_TB_NM","T_MGZ_MST");
        productGuidMap.put("RNUM","6");
        List<Map<String, Object>> listProductGuideList = this.productListService.selectMainGuideList(productGuidMap);
        
        //타임세일 내용
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_LARGE_SIZE_);
        Map<String, Object> mainTimeSaleInfo = this.productService.selectMainTimeSaleInfo(commandMap);
        
        // 공지사항 목록 갯수
        commandMap.put("BRD_NTS_TOP_YN", "N");
        commandMap.put("pageSize", "4");
        int totalCount = this.pcNoticeBoardService.selectNoticeBoardListCount(commandMap);
        Paging paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0){
        	// 공지사항  목록
            mv.addObject("noticeList",  this.pcNoticeBoardService.selectNoticeBoardList(commandMap));
        }
        
        Cookie[] cookies	= request.getCookies();
        
        boolean areaCheck	= false;
        
        if(cookies != null){
    		for(Cookie cookie : cookies){
        		if("areaInfo".equals(cookie.getName())){
        			areaCheck	= true;
        		}
        	}
		}
        mv.addObject(RESPONSE_KEY.TAG_LIST, this.pcTagService.selectTagList());
        
        
        Map<String, Object> tagParamMap = new HashMap<>();
        if(StringUtils.isEmpty(user.getMEM_MST_MEM_ID())) {
        	tagParamMap.put("CMN_COM_IDX", "3721");
        	tagParamMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
        } else {
        	tagParamMap.put("CMN_COM_IDX", user.getMEM_MST_MEM_ID());
            tagParamMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_MEMBER);	
        }
        
        
        mv.addObject("feedTagList", this.tagDisplayService.selectTagDisplayList(tagParamMap));
        
        tagParamMap.put("CMN_COM_IDX", "3725");
        mv.addObject("searchTagList", this.tagDisplayService.selectTagDisplayList(tagParamMap));
        
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));
        
        mv.addObject("listProductGuideList", listProductGuideList);
        mv.addObject("mainTimeSaleInfo", mainTimeSaleInfo);
        mv.setViewName("pc/main/index");
        mv.addObject("listPopup", listPopup);
		mv.addObject("commandMap", commandMap);
		mv.addObject("areaCheck", areaCheck);
        return mv;
    }
	
	
	/**
	* <pre>
	* 1. MethodName : mainProductDisplayListAjax
	* 2. ClassName : MainController.java
	* 3. Comment : 메인 전시상품 리스트 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 3. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/main/mainProductDisplayListAjax.do")
	public ModelAndView mainProductDisplayListAjax(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("CMN_COM_IDX", commandMap.get("cmmIdx"));
		commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("RNUM", commandMap.get("rnum"));
    	mv.addObject("MainProductDisplayList", this.productListService.selectProductDisplayList(commandMap));
		
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : mainPopupInfo
	* 2. ClassName : MainController.java
	* 3. Comment : 메인 일반 팝업
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 3. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/main/mainPopupInfo.do")
	public ModelAndView mainPopupInfo(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		// PC 환경에서 접속 
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        //메인 팝업
        Map<String, Object> popupInfo = this.pcCommonService.selectPopupInfo(commandMap);
		
		mv.addObject("commandMap", commandMap);
		mv.addObject("popupInfo", popupInfo);
		return mv;
	}
	
}
