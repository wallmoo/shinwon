package com.market.mall.mobile.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.am.app.service.AppVersionManageService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.event.service.PlanService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName: com.market.mall.mobile.main.controller
 * @FileName : MobileMainController.java
 * @Date : 2014. 7. 22.
 * @프로그램 설명 : MOBILE 메인화면을 처리하는 Controller Class
 * @author LJH
 */
@Controller("mobileMainController")
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
	
	@Resource(name="appVersionManageService")
	private AppVersionManageService appVersionManageService;
	
	@Resource(name="pcPlanService")
	PlanService pcPlanService;
	
	// 리스트에서 보여질 상품의 이미지 사이즈
	private final static int _LIST_THUMBNAIL_LARGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE;
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_MIDDLE;
	
	
	/**
	 * <pre>
	 * 1. MethodName : index
	 * 2. ClassName  : MainController.java
	 * 3. Comment    :  PC 메인화면
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 6. 24.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/main/index.do")
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
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_MOBILE);
        // 온라인 상품만 ...
        commandMap.put("PRD_MST_ONLINE_YN", "Y");
        // 사입이 아닌 상품만 
        //commandMap.put("PRD_MST_PURCHASE_YN", "N");
        
        //이미지 사이즈 
        //commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM);
        
        // 메인페이지 입니다(팝업용)
        commandMap.put("POP_MST_VIEW_LOCATION", Code.POPUP_LOCATION_CODE_MAINPAGE);
        // 메인 팝업 리스트 
        commandMap.put("RNUM", 2);
        List<Map<String, Object>> listPopup = this.pcCommonService.selectPopupList(commandMap);
        
        //메인 프로모션
        Map<String, Object> bannerMap = new HashMap<String, Object>();
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_PROMOTION_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 11);
    	mv.addObject("MainProBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//기획전이벤트 배너
    	bannerMap.put("BANNER_IDX", Code.PC_MANIN_PLAN_EVENT_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_B);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", "");
    	mv.addObject("MainPlenEventBannerList", this.productListService.selectBannerDisplayListTypeB(bannerMap));
    	
    	//원데이특가
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_LARGE_SIZE_);
        Map<String, Object> mainOneDaySaleInfo = this.productService.selectMainOneDayInfo(commandMap);
        mv.addObject("mainOneDaySaleInfo", mainOneDaySaleInfo);
        
        //타임세일 내용
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_LARGE_SIZE_);
        Map<String, Object> mainTimeSaleInfo = this.productService.selectMainTimeSaleInfo(commandMap);
        mv.addObject("mainTimeSaleInfo", mainTimeSaleInfo);
        
    	//트렌드A 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_TREND_A_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandABannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드A 테마 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_TREND_A_THEME_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandAThemeBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드A 상품
    	Map<String, Object> PrdbannerMap = new HashMap<String, Object>();
    	PrdbannerMap.put("CMN_COM_IDX", Code.MB_MANIN_TREND_A_PRODUCT_ITEM);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE);
    	PrdbannerMap.put("RNUM", 6);
    	mv.addObject("MainTrandAPrdBannerList", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//트렌드B 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_TREND_B_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandBBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드B 테마 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_TREND_B_THEME_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainTrandBThemeBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//트렌드B 상품
    	PrdbannerMap.put("CMN_COM_IDX", Code.MB_MANIN_TREND_B_PRODUCT_ITEM);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST_MIDDLE);
    	PrdbannerMap.put("RNUM", 6);
    	mv.addObject("MainTrandBPrdBannerList", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//MD추천1 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_MD_PICK_MD1);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainMdPickBannerList1", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//엠디추천 키워드1 상품
    	PrdbannerMap.put("CMN_COM_IDX", Code.MB_MANIN_MD_PICK_PRODUT_MD1);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	PrdbannerMap.put("RNUM", 4);
    	mv.addObject("MainMdPickProductList1", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//MD추천2 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_MD_PICK_MD2);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainMdPickBannerList2", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//엠디추천 키워드2 상품
    	PrdbannerMap.put("CMN_COM_IDX", Code.MB_MANIN_MD_PICK_PRODUT_MD2);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	PrdbannerMap.put("RNUM", 4);
    	mv.addObject("MainMdPickProductList2", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//MD추천3 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_MD_PICK_MD3);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainMdPickBannerList3", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//엠디추천 키워드3 상품
    	PrdbannerMap.put("CMN_COM_IDX", Code.MB_MANIN_MD_PICK_PRODUT_MD3);
    	PrdbannerMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	PrdbannerMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
    	PrdbannerMap.put("RNUM", 4);
    	mv.addObject("MainMdPickProductList3", this.productListService.selectProductDisplayList(PrdbannerMap));
    	
    	//하단 이벤트 배너
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_PLAN_EVENT_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("MainBottomEventBannerList", this.productListService.selectBannerDisplayList(bannerMap));
        
        //기획전에 필요한 1뎁스 카테고리
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_MOBILE);
        commandMap.put("PRD_CTG_LEVEL", 1);
        List<Map<String, Object>> listMenuCategory = this.productListService.selectMenuCategoryList(commandMap);
        mv.addObject("listMenuCategory", listMenuCategory);
        
        //기획전 리스트 
        commandMap.put("searchPlnMstShopTypeMobile", "Y"); 		//MOBILE용 기획전
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");		//MOBILE용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", Code.USER_ENV_TYPE_MOBILE); 			//MOBILE용 이미지
        commandMap.put("CMM_FLE_SORT", "1"); 				//MOBILE용 목록 이미지
        commandMap.put("searchForTop", "Y");
        commandMap.put("searchPlanMstType","A");
        List<Map<String, Object>> planList = null;
        //기획전 카운트
        int planTotalCnt = this.pcPlanService.selectPlanListCount(commandMap);
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
        
        Paging paging = new Paging(planTotalCnt, commandMap); 
        if(planTotalCnt > 0){
        	planList = this.pcPlanService.selectPlanList(commandMap);
        }
        mv.addObject("totalCount", planTotalCnt );
    	mv.addObject("paging", paging);
    	mv.addObject("planList",  planList);
    	
    	//이벤트 프로모션
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_EVENT_PMTION_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 4);
    	mv.addObject("mainEventPmtionList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//이벤트 카드혜택
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_EVENT_CARD_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("mainEventCardList", this.productListService.selectBannerDisplayList(bannerMap));
    	/*
    	//이벤트 가입혜택
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_EVENT_JOIN_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("mainEventJoinList", this.productListService.selectBannerDisplayList(bannerMap));*/
    	
    	//이벤트 최근이벤트
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_EVENT_NEW_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 3);
    	mv.addObject("mainEventNewList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//이벤트 기타혜택
    	bannerMap.put("BANNER_IDX", Code.MB_MANIN_EVENT_OTHER_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", "");
    	mv.addObject("mainEventOtherList", this.productListService.selectBannerDisplayList(bannerMap));
    	
    	//콘텐츠 리스트
        Map<String, Object> productGuidMap = new HashMap<String, Object>();
        productGuidMap.put("PRD_CTG_ENV", commandMap.get("PRD_CTG_ENV"));
        productGuidMap.put("CMM_FLE_TB_NM","T_MGZ_MST");
        productGuidMap.put("RNUM",5);
        String MGZ_MST_CTS = "";
        List<Map<String, Object>> listProductGuideList = this.productListService.selectMainGuideList(productGuidMap);
        if(!listProductGuideList.equals(null)){
        	for (int i = 0; i < listProductGuideList.size(); i++) {
        		MGZ_MST_CTS = (String)listProductGuideList.get(i).get("MGZ_MST_CTS");
        		MGZ_MST_CTS = StringUtil.replace(MGZ_MST_CTS, "&nbsp;", " ");
        		MGZ_MST_CTS = StringUtil.getEditerHtmlOut(MGZ_MST_CTS);
        		listProductGuideList.get(i).put("MGZ_MST_CTS", MGZ_MST_CTS);
			}
        }
        
        //e메거진
        Map<String, Object> productGuidMap2 = new HashMap<String, Object>();
        productGuidMap2.put("PRD_CTG_ENV", commandMap.get("PRD_CTG_ENV"));
        productGuidMap2.put("CMM_FLE_TB_NM","T_MGZ_MST");
        productGuidMap2.put("RNUM",11);
        productGuidMap2.put("orderType","Y");
        productGuidMap2.put("SEARCHNEW","Y");
        String MGZ_MST_CTS2 = "";
        List<Map<String, Object>> listProductGuideList2 = this.productListService.selectMainGuide2List(productGuidMap2);
        if(!listProductGuideList2.equals(null)){
        	for (int i = 0; i < listProductGuideList2.size(); i++) {
        		MGZ_MST_CTS2 = (String)listProductGuideList2.get(i).get("MGZ_MST_CTS");
        		MGZ_MST_CTS2 = StringUtil.replace(MGZ_MST_CTS2, "&nbsp;", " ");
        		MGZ_MST_CTS2 = StringUtil.getEditerHtmlOut(MGZ_MST_CTS2);
        		listProductGuideList2.get(i).put("MGZ_MST_CTS", MGZ_MST_CTS2);
			}
        }
        
        //베스트아이템(온라인)
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        commandMap.put("orderType","onLineBest");
        commandMap.put("catIdx",StringUtil.getString(commandMap.get("catPrdIdx"), ""));
        commandMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
        commandMap.put("startNum", 1);
    	commandMap.put("endNum", 20);
        List<Map<String, Object>> onLineListProduct = this.productListService.selectProductList(commandMap);
        
        //베스트아이템(오프라인)
        commandMap.put("orderType","offLineBest");
        commandMap.put("catIdx",StringUtil.getString(commandMap.get("catPrdIdx"), ""));
        commandMap.put("startNum", 1);
    	commandMap.put("endNum", 20);
        List<Map<String, Object>> offLineListProduct = this.productListService.selectProductList(commandMap);
        
        //공기청청기 배너
        bannerMap.put("BANNER_IDX", Code.MB_MANIN_CATE_BANNER);
    	bannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_A);
    	bannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	bannerMap.put("RUNM", 2);
    	mv.addObject("mainCateBannerList", this.productListService.selectBannerDisplayList(bannerMap));
    	
        //공기청청기(하드코딩으로 되어있음 해당 카테고리 idx는 수동으로 변경)
        commandMap.put("orderType",StringUtil.getString(commandMap.get("orderPickType"), "onLineBest"));
        commandMap.put("catIdx",Code.MB_MANIN_CATE_IDX);
        commandMap.put("startNum", 1);
    	commandMap.put("endNum", 20);
        List<Map<String, Object>> cateListProduct = this.productListService.selectProductList(commandMap);
        
        mv.addObject("listProductGuideList", listProductGuideList);
        mv.addObject("listProductGuideList2", listProductGuideList2);
        mv.addObject("onLineListProduct", onLineListProduct);
        mv.addObject("offLineListProduct", offLineListProduct);
        mv.addObject("cateListProduct", cateListProduct);
        mv.setViewName("mobile/main/index");
        mv.addObject("listPopup", listPopup);
		mv.addObject("commandMap", commandMap);
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : productDispayMdPickListAjax
	* 2. ClassName : MainController.java
	* 3. Comment : MD PICK 전시 상품 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 5.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/mobile/product/productDispayMdPickListAjax.do")
	public ModelAndView productDispayMdPickListAjax(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		//베스트 상품MD
    	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
    	mv.addObject("MainMdPickList", this.productListService.selectProductDisplayMdPickList(commandMap));
		
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : appIntro
	* 2. ClassName  : MainController.java
	* 3. Comment    : 모바일 > APP > APP INTRO 페이지
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 9.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/mobile/main/appIntro")
	public ModelAndView appIntro (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 최신 앱 버전 조회
		Map<String,Object> latestAppVersionInfoMap = this.appVersionManageService.selectLatestAppVersionInfo(commandMap);
		
		List<Map<String,Object>> appIntroBannerList = this.pcCommonService.selectAppIntroBannerList(commandMap);
		
		JSONObject jsonObj = new JSONObject();
		
		for(int i=0;i<appIntroBannerList.size();i++)
		{
//			Map<String,Object> jsonObjMap = new HashMap<String, Object>();
//			
//			jsonObjMap.put("IMG_SIZE", appIntroBannerList.get(i).get("BANNER_SIZE"));
//			jsonObjMap.put("IMG_URL", StringUtil.getString(request.getAttribute("mobileDomain"), "") + appIntroBannerList.get(i).get("IMG_URL"));
//		
//			jsonObj.put("IMG_MAP" + i, jsonObjMap);
			jsonObj.put("IMG_SIZE" + appIntroBannerList.get(i).get("BANNER_SIZE"), appIntroBannerList.get(i).get("BANNER_SIZE"));
			jsonObj.put("IMG_URL" + appIntroBannerList.get(i).get("BANNER_SIZE"), StringUtil.getString(request.getAttribute("cdnDomain"), "") + appIntroBannerList.get(i).get("IMG_URL"));
			jsonObj.put("SITE_URL" + appIntroBannerList.get(i).get("BANNER_SIZE"), appIntroBannerList.get(i).get("BNR_MST_URL"));
		}
		
    	jsonObj.put("AN_VERSION", latestAppVersionInfoMap.get("AN_VERSION"));
    	jsonObj.put("IOS_VERSION", latestAppVersionInfoMap.get("IOS_VERSION"));
    	
    	mv.addObject("json", jsonObj);
    	mv.setViewName("mobile/main/appIntro");
    	
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : planListAjax
	* 2. ClassName : MainController.java
	* 3. Comment : 메인 기획전리스트 스크롤페이징
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 4. 27.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/mobile/main/planListAjax")
    public ModelAndView planListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
		ModelAndView mv = new ModelAndView();
		
		commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_MOBILE);
		commandMap.put("searchPlnMstShopTypeMobile", "Y"); 		//MOBILE용 기획전
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");		//MOBILE용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", Code.USER_ENV_TYPE_MOBILE); 			//MOBILE용 이미지
        commandMap.put("CMM_FLE_SORT", "1"); 				//MOBILE용 목록 이미지
        commandMap.put("searchForTop", "Y");
        commandMap.put("searchPlanMstType","A");
        
        int totalCount = this.pcPlanService.selectPlanListCount(commandMap);
        
        // 페이지당 기본 출력 갯수는 10개 이다.
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "10"));
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
        Paging paging = new Paging(totalCount, commandMap);
        List<Map<String, Object>> planList = null;
        if(totalCount> 0)
        {
        	planList = this.pcPlanService.selectPlanList(commandMap);
        }
        
        mv.addObject("planList", planList);
        return mv;
    }
}
