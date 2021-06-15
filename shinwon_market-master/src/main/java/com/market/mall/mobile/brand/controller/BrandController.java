package com.market.mall.mobile.brand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.brand.service.BrandService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.product.service.ProductListService;

/**
 * @PackageName: com.market.mall.pc.brand.controller
 * @FileName : BrandController.java
 * @Date : 2014. 7. 11.
 * @프로그램 설명 : PC 브랜드메인화면을 처리하는 Controller Class
 * @author 이미정
 */
@Controller("mobileBrandController")
@AccessLevelUser(ROLEUSER.guest)
public class BrandController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name="productListService") 	
	private ProductListService productListService;
	
	@Resource(name="brandService") private BrandService brandService;
	@Resource(name = "pcCommonService") private CommonService pcCommonService;
	/**
	 * <pre>
	 * 1. MethodName : brand
	 * 2. ClassName  : BrandController.java
	 * 3. Comment    :  브랜드 메인화면
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 11.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mobile/brand/brand.do")
    public ModelAndView brand(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 전시영역 index map 
        // MARMOT
    	Map<String, Integer> MmMap = new HashMap<String, Integer> ();
    	MmMap.put("BANNER_TOP", 1619);
    	MmMap.put("BANNER_BOTTOM", 1620);
    	
        // banner list
        List<Map<String, Object>> listTopBanner = new ArrayList<Map<String,Object>>();
        List<Map<String, Object>> listBottomBanner = new ArrayList<Map<String,Object>>();
        
        //select banner list
        
        commandMap.put("BANNER_IDX", MmMap.get("BANNER_TOP"));
        listTopBanner = this.productListService.selectBannerDisplayList(commandMap);
        commandMap.put("BANNER_IDX", MmMap.get("BANNER_BOTTOM"));
        listBottomBanner = this.productListService.selectBannerDisplayList(commandMap);
        
        // mv setting 
        mv.addObject("listTopBanner", listTopBanner);
        mv.addObject("listBottomBanner", listBottomBanner);
        mv.setViewName("mobile/brand/brand"); 
        mv.addObject("commandMap", commandMap);
        return mv;
    }
	
	/**
     * @api {GET} /mobile/brand/brandMain.do
     * @apiName 브랜드 메인화면
     * @apiGroup Mobile 브랜드
     * 
     * @apiSuccess {Object[]} topBrandList 탑 브랜드 목록 [{IMG_THUMBNAIL : 브랜드 썸네일 이미지, CMN_FLE_ALT_TXT = 대체텍스트, BND_MST_IDX:브랜드코드, BND_MST_BRAND_NM:브랜드이름 , BND_MST_DTL:브랜드소개, BND_MST_URL:브랜드URL}]
     * @apiSuccess {Object[]} shinwonPickList 신원픽 목록 [{IMG_THUMBNAIL : 브랜드 썸네일 이미지, CMN_FLE_ALT_TXT = 대체텍스트, BND_MST_IDX:브랜드코드, BND_MST_BRAND_NM:브랜드이름 , BND_MST_DTL:브랜드소개, BND_MST_URL:브랜드URL}]
     * @apiSuccess {Object[]} brandList 전체 브랜드 리스트 [{BRAND_TOTAL: 브랜드 상품 총 갯수 , BND_MST_IDX : 브랜드코드, BND_MST_BRAND_NM : 브랜드이름 , BND_MST_URL : 브랜드URL }]
     */
    @RequestMapping("/mobile/brand/brandMain")
    public ModelAndView brandMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
    
        //전체 브랜드 리스트
        commandMap.put("PRD_CTG_ENV", "P");
        
        List<Map<String,Object>> brandList = this.brandService.selectBrandCategoryList(commandMap);
        
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_TOP_BRAND_BANNER);
        commandMap.put("BNR_MST_ENV", "P"); //PC 배너
        List<Map<String,Object>> topBrandList = this.brandService.selectBrandBannerList(commandMap);
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("CMN_COM_IDX", Code.PC_MAIN_SHINWON_PICK_BRAND_BANNER);
        paramMap.put("BNR_MST_ENV", "P");
        List<Map<String,Object>> shinwonPickList = this.brandService.selectBrandBannerList(paramMap);
        
        mv.addObject("topBrandList", topBrandList);
        mv.addObject("shinwonPickList", shinwonPickList);
        mv.addObject("brandList", brandList);
        
        return mv;
    }
    
    /**
     * @api {POST} /mobile/brand/brandView.do
     * @apiName 브랜드 상세화면
     * @apiGroup Mobile 브랜드
     * 
     * @apiParam {String} BND_MST_IDX 브랜드 코드
     * 
     * @apiSuccess {Object[]} sizeList 사이즈 코드 리스트 [{CMN_COM_IDX=2997, CMN_COM_LEVEL=2, CMN_COM_NM=XS, CMN_COM_REG_DT=20200302010708, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=1, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XS, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2998, CMN_COM_LEVEL=2, CMN_COM_NM=S, CMN_COM_REG_DT=20200302010733, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=2, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=S, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2999, CMN_COM_LEVEL=2, CMN_COM_NM=M, CMN_COM_REG_DT=20200302010745, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=3, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=M, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3000, CMN_COM_LEVEL=2, CMN_COM_NM=L, CMN_COM_REG_DT=20200302010755, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=4, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=L, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3001, CMN_COM_LEVEL=2, CMN_COM_NM=XL, CMN_COM_REG_DT=20200302010803, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=5, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XL, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3002, CMN_COM_LEVEL=2, CMN_COM_NM=XXL, CMN_COM_REG_DT=20200302010816, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=6, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XXL, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object[]} colorList 색상 코드 리스트  [{CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1039, CMN_COM_LEVEL=2, CMN_COM_ETC3=946, CMN_COM_NM=BLACK, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054049, CMN_COM_SORT=89, CMN_COM_ETC2=#000000, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=BK}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1142, CMN_COM_LEVEL=2, CMN_COM_ETC3=935, CMN_COM_NM=WHITE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054103, CMN_COM_SORT=192, CMN_COM_ETC2=#ffffff, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=WH}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014424, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3009, CMN_COM_LEVEL=2, CMN_COM_NM=CARNATION, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014817, CMN_COM_SORT=200, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CA}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014505, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3010, CMN_COM_LEVEL=2, CMN_COM_NM=TEXAS ROSE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014829, CMN_COM_SORT=201, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#febf4e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=TR}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014544, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3011, CMN_COM_LEVEL=2, CMN_COM_NM=MUSTARD, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014841, CMN_COM_SORT=202, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fee24e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MU}, {CMN_COM_IDX=3012, CMN_COM_LEVEL=2, CMN_COM_NM=BARLEY WHITE, CMN_COM_REG_DT=20200302014905, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=203, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_ETC1=BA, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3013, CMN_COM_LEVEL=2, CMN_COM_NM=OCEAN GREEN, CMN_COM_REG_DT=20200302014943, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=204, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#40ba87, CMN_COM_ETC1=OC, CMN_COM_REG_ID=admin}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014958, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3014, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015523, CMN_COM_SORT=205, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5ff2f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015016, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3015, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015515, CMN_COM_SORT=206, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5fb1f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015032, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3016, CMN_COM_LEVEL=2, CMN_COM_NM=CORNFLOWER BLUE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015536, CMN_COM_SORT=207, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5f71f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CB}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015046, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3017, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM PURPLE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015502, CMN_COM_SORT=208, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#a55ce9, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MP}, {CMN_COM_IDX=3018, CMN_COM_LEVEL=2, CMN_COM_NM=SILVER CHALICE, CMN_COM_REG_DT=20200302020628, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=209, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#acacac, CMN_COM_ETC1=SC, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3019, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM RED VIOLET, CMN_COM_REG_DT=20200302020915, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=210, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#cc33a3, CMN_COM_ETC1=MV, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object} brandInfo 브랜드 정보 {IMG_THUMBNAIL : 브랜드 썸네일 이미지, CMN_FLE_ALT_TXT : 대체텍스트, BND_MST_BRAND_NM : 브랜드이름 , BND_MST_DTL : 브랜드소개, BND_MST_URL : 브랜드URL}
     * @apiSuccess {Object[]} productList 상품 리스트 [{TAG_MST_TITLE=대표태그, PRD_MST_NM=상품이름, PRD_MST_CD=상품코드, PRD_IMAGE = 상품썸네일, CNT_PRD_COLOR:[{"CNT_PRD_COLOR":"#b8860b",CMN_COM_IDX=3009},{"CNT_PRD_COLOR":"#f4a460",CMN_COM_IDX=1142}], PRD_MST_BRAND_NM = 브랜드이름, PRD_MST_PRICE=일반가, PRD_NOW_DST_PRICE=할인율 적용가, MY_LIKE=좋아요여부}]
     */
    @RequestMapping("/mobile/brand/brandView")
    public ModelAndView brandView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        commandMap.put("BND_MST_IDX", StringUtil.getString(commandMap.get("BND_MST_IDX")));
        
        commandMap.put("PRD_CTG_ENV", "P");//PC환경
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        
        // 페이지 당 기본 출력 갯수
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "30"));
        
        List<Map<String, Object>> productList = this.brandService.selectBrandProductList(commandMap);
        Map<String, Object> brandInfo = this.brandService.selectBrandInfo(commandMap);
        
        int totalCount = 0;
        
        if(productList.size() > 0){
            totalCount = productList.size();
        }
        mv.addObject("sizeList", this.pcCommonService.selectCode("COMMON_PRODUCT_SIZE"));
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));
        mv.addObject("brandInfo", brandInfo);
        mv.addObject("productList", productList);
        
        return mv;
    }
    
    /**
     * @api {POST} /mobile/brand/searchBrandProductAjax.do
     * @apiName 브랜드 상세화면 상품 검색 Ajax
     * @apiGroup Mobile 브랜드
     * 
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} BND_MST_IDX 브랜드 코드
     * 
     * @apiParam {String} searchOptionYN 사이즈 또는 색상 검색시  'Y' 필수 파라미터
     * @apiParam {String[]} arrSearchCategory 검색 카테고리
     * @apiParam {String[]} arrSearchSize 검색 사이즈
     * @apiParam {String[]} arrSearchColor 검색 색상
     * @apiParam {Object[]} arrSearchPrice 검색 가격  [{min:10000,max:30000},{min:50000,max:100000}]
     * @apiParam {String} orderType 정렬  {new : 최근 등록순 , dwn : 가격낮은순 , up: 가격높은순, hit : 판매량 많은순, rev : 리뷰 많은순}
     
     * @apiSuccess {JSON} brandProductList 검색 결과 [{TAG_MST_TITLE=대표태그, PRD_MST_NM:상품이름, PRD_MST_CD=상품코드, CNT_PRD_COLOR:[{"CNT_PRD_COLOR":"#b8860b",CMN_COM_IDX=3009},{"CNT_PRD_COLOR":"#f4a460", CMN_COM_IDX=3009}], PRD_IMAGE = 상품썸네일, PRD_MST_PRICE=일반가, PRD_NOW_DST_PRICE=할인율 적용가, MY_LIKE=좋아요여부, BND_MST_BRAND_NM:브랜드이름, PRD_MST_BRD_IDX:브랜드코드}]
     * @apiSuccess {Integer} totalCount 브랜드 검색 결과 총 갯수
     */
    @RequestMapping("/mobile/brand/searchBrandProductAjax")
    public ModelAndView searchBrandProductAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView("jsonView");
        
        commandMap.put("BND_MST_IDX", StringUtil.getString(commandMap.get("BND_MST_IDX")));
        
        //사이즈 또는 색상 검색 파라미터
        commandMap.put("searchOptionYN", StringUtil.getString(commandMap.get("searchOptionYN"),"N"));
        
        String sJsonArrSearchCategory =  StringUtil.getString(commandMap.get("arrSearchCategory"),"");
        String sJsonArrSearchSize =  StringUtil.getString(commandMap.get("arrSearchSize"),"");
        String sJsonArrSearchColor =  StringUtil.getString(commandMap.get("arrSearchColor"),"");
        String sJsonArrSearchPrice =  StringUtil.getString(commandMap.get("arrSearchPrice"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        
        TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
        TypeReference<List<Map<String, Object>>> typeRefListMap = new TypeReference<List<Map<String, Object>>>(){};
        
        List<String> arrSearchCategory = mapper.readValue(sJsonArrSearchCategory, typeRef);
        List<String> arrSearchSize = mapper.readValue(sJsonArrSearchSize, typeRef);
        List<String> arrSearchColor = mapper.readValue(sJsonArrSearchColor, typeRef);
        List<Map<String, Object>> arrSearchPrice = mapper.readValue(sJsonArrSearchPrice, typeRefListMap);
        
        commandMap.put("arrSearchCategory", arrSearchCategory);
        commandMap.put("arrSearchSize", arrSearchSize);
        commandMap.put("arrSearchColor", arrSearchColor);
        commandMap.put("arrSearchPrice", arrSearchPrice);
        
        commandMap.put("PRD_CTG_ENV", "P");//PC환경
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        
        // 페이지 당 기본 출력 갯수
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "30"));
        
        List<Map<String, Object>> brandProductList = this.brandService.selectBrandProductList(commandMap);
        
        int totalCount = 0;
        
        if(brandProductList.size() > 0){
            totalCount = brandProductList.size();
        }        
        
        Paging paging = new Paging(totalCount, commandMap);
        
        mv.addObject("brandProductList", brandProductList);
        mv.addObject("totalCount",StringUtil.getString(totalCount));
        mv.addObject("paging", paging);
        return mv;
    }
    
    /**
     * @api {POST} /mobile/brand/searchBrandListAjax.do
     * @apiName 브랜드 리스트 검색 Ajax
     * @apiGroup Mobile 브랜드
     * 
     * @apiParam {String[]} arrSEARCH_KOR 검색 한글 초성
     * @apiParam {String[]} arrSEARCH_ENG 검색 영문 알파벳
     * @apiParam {String[]} arrPRD_CTG_IDX 카테고리 인덱스 배열
     
     * @apiSuccess {JSON} brandCategoryList 검색 결과 [{BND_MST_BRAND_NM:브랜드이름, PRD_MST_BRD_IDX:브랜드코드, BRAND_TOTAL:검색 카테고리에 속한 브랜드 상품 총 갯수}]
     * @apiSuccess {Integer} totalCount 브랜드 검색 결과 총 갯수
     */
    @RequestMapping("/mobile/brand/searchBrandListAjax")
    public ModelAndView searchBrandListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView("jsonView");
        
        String sJsonArrSEARCH_KOR =  StringUtil.getString(commandMap.get("arrSEARCH_KOR"),"");
        String sJsonArrSEARCH_ENG =  StringUtil.getString(commandMap.get("arrSEARCH_ENG"),"");
        String sJsonArrPRD_CTG_IDX =  StringUtil.getString(commandMap.get("arrPRD_CTG_IDX"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        
        TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
        
        List<String> arrSEARCH_KOR = mapper.readValue(sJsonArrSEARCH_KOR, typeRef);
        List<String> arrSEARCH_ENG = mapper.readValue(sJsonArrSEARCH_ENG, typeRef);
        List<String> arrPRD_CTG_IDX = mapper.readValue(sJsonArrPRD_CTG_IDX, typeRef);
        
        commandMap.put("arrSEARCH_KOR", arrSEARCH_KOR);
        commandMap.put("arrSEARCH_ENG", arrSEARCH_ENG);
        commandMap.put("arrPRD_CTG_IDX", arrPRD_CTG_IDX);
        
        commandMap.put("PRD_CTG_ENV", "P");//PC환경
        
        List<Map<String, Object>> brandCategoryList = this.brandService.selectBrandCategoryList(commandMap);
        
        int totalCount = 0;
        
        if(brandCategoryList.size() > 0 ){
            totalCount = brandCategoryList.size();
        }
        
        mv.addObject("brandCategoryList", brandCategoryList);
        mv.addObject("totalCount",StringUtil.getString(totalCount));
        
        return mv;
    }
	
}
