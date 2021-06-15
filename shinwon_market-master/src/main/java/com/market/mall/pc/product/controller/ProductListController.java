package com.market.mall.pc.product.controller;

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
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.DSP_BAN_CODE;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.brand.service.BrandService;
import com.market.mall.pc.category.service.MainCategoryService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.tag.service.TagService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.product.controller
 * @FileName : ProductListController.java
 * @Date : 2014. 7. 11.
 * @프로그램 설명 : PC 브랜드메인화면을 처리하는 Controller Class
 * @author 이미정
 */
@Controller
@AccessLevelUser(ROLEUSER.guest)
public class ProductListController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@Resource(name="productListService") private ProductListService productListService;
	@Resource(name="pcCommonService") private CommonService pcCommonService;
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="productService") private ProductService productService;
    @Resource(name="brandService") private BrandService brandService;
    @Resource(name="mainCategoryService") private MainCategoryService mainCategoryService;
    @Resource(name="") private TagService tagService;

    // 리스트에서 보여질 상품의 이미지 사이즈
    private final static int THUMBNAIL_SIZE = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE;

    
	@RequestMapping("/pc/product/productMain")
    public ModelAndView productMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        if(!commandMap.containsKey("idx")) { 
        	
        	return null; 
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("CMN_COM_IDX", commandMap.get("idx"));
        
        List<Map<String, Object>> bannerCatgoryCodeList = productListService.selectBannerDisplayCatCodeList(param);
        
        for(int index = 0; index < bannerCatgoryCodeList.size(); index++) {
        	mv.addObject("CMN_COM_NM", bannerCatgoryCodeList.get(index).get("CMN_COM_NM"));
        	String type = bannerCatgoryCodeList.get(index).get("CMN_COM_ETC1").toString();
        	String CMN_COM_IDX = bannerCatgoryCodeList.get(index).get("CMN_COM_IDX").toString();
        	param.put("CMN_COM_IDX", CMN_COM_IDX);
        	switch(type) {
	        	case DSP_BAN_CODE.DSP_BAN_TOP:{
	        		List<Map<String, Object>> list = productListService.selectBannerDisplayListShinwon(param);
	                mv.addObject("topBannerList", list);
	        		break;
	        	}
	        	case DSP_BAN_CODE.DSP_BAN_2DEP:{
	        		List<Map<String, Object>> list = productListService.selectBannerDisplayListShinwon(param);
	                mv.addObject("categoryList", list);
	        		break;
	        	}
	        	case DSP_BAN_CODE.DSP_BAN_EVENT_MOV:{
	        		List<Map<String, Object>> list = productListService.selectBannerDisplayListShinwon(param);
	        		if(list != null && list.size()>0) {
	        			mv.addObject("movie", list.get(0));	
	        			if(StringUtil.getString(list.get(0).get("BNR_MST_URL")).indexOf("https://vimeo.com/")>=0)
	        			{
	        				mv.addObject("movieType","vimeo");
	        			}
	        			else if(StringUtil.getString(list.get(0).get("BNR_MST_URL")).indexOf("https://youtu.be/")>=0)
	        			{
	        				mv.addObject("movieType","youtube");
	        			}
	        		}
	        		break;
	        	}
	        	case DSP_BAN_CODE.DSP_BAN_EVENT_BAN:{
	        		List<Map<String, Object>> list = productListService.selectBannerDisplayListShinwon(param);
	                mv.addObject("bannerList", list);
	        		break;
	        	}
	        	case DSP_BAN_CODE.DSP_BAN_TAG:{
	        		List<Map<String, Object>> list = productListService.selectBannerDisplayListShinwon(param);
	        		if(list != null && list.size()>0) {
	        			mv.addObject("tagBanner", list.get(0));	
	        		}
	        		break;
	        	}
        	}
        }
        
        param.clear();
        param.put("PRD_CTG_IDX", commandMap.get("idx"));
        List<Map<String, Object>> tabList = productListService.selectCategoryTabList(param);
        mv.addObject("tabList", tabList);
        /*
        param.clear();
        param.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        param.put("ctgIdx", commandMap.get("idx"));
        List<Map<String, Object>> listPlan = this.productListService.selectProductPlanList(param);        
        mv.addObject("planList", listPlan);
        */
        param.clear();
        param.put("PRD_CTG_IDX", commandMap.get("idx"));
        param.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG);
        param.put("USER_ENV_TYPE",  Code.USER_ENV_TYPE_PC);
        param.put("MEM_MST_ID", SessionsUser.getSessionUser(request).getMEM_MST_MEM_ID());
        param.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_PRODUCT); 
        List<Map<String, Object>> catProductList = productListService.selectCatTabProductList(param);
        mv.addObject("catProductList", catProductList);
        
        int curDisplayCode = convertCategoryToTagCode(Integer.parseInt(commandMap.get("idx").toString()));
        param.clear();
        param.put("TAG_BND_ID", curDisplayCode);
        param.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
        List<Map<String, Object>> tagList = tagService.selectTagListById(param);
        mv.addObject("tagList", tagList);
        
        /** RANK LIST (BRAND, CATEGORY) */
        param.clear();
        param.put("PRD_CTG_IDX", commandMap.get("idx"));
        mv.addObject("rankCategory", productListService.selectRank10CategoryList(param));
        mv.addObject("rankBrand", productListService.selectRank10BrandList(param));
        
        
        mv.addObject("PRD_CTG_IDX", commandMap.get("idx"));
        mv.addObject("TAG_DSP_IDX", curDisplayCode);
        
        
        return mv;
    }
	
	private int convertCategoryToTagCode(int categoryIdx) {
		if(categoryIdx == Code.CATEGORY_WOMEN_CD) return Code.TAG_DISPLAY_WOMEN_PC;
		else if (categoryIdx == Code.CATEGORY_MEN_CD)  return Code.TAG_DISPLAY_MEN_PC;
		else if (categoryIdx == Code.CATEGORY_LIFE_CD)  return Code.TAG_DISPLAY_LIFE_PC;
		else if (categoryIdx == Code.CATEGORY_BEAUTY_CD)  return Code.TAG_DISPLAY_BEAUTY_PC;
		else return 0;
	}
	/**
	* <pre>
	* 1. MethodName : productList
	* 2. ClassName : ProductListController.java
	* 3. Comment : 상품 중 카테고리 페이지
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @param searchLine
	* @param searchRepColor
	* @param searchSize
	* @return
	* @throws Exception
	*/
	
    /**
     * @api {GET} /pc/product/productList.do
     * @apiName 상품전시 중_카테고리
     * @apiGroup 상품전시
     *
     * @apiParam {String} PRD_CTG_IDX 2뎁스 카테고리 인덱스
     * 
     * @apiSuccess {Object[]} brandList 전체 브랜드 리스트 [{BND_MST_IDX : 브랜드코드, BND_MST_BRAND_NM : 브랜드이름 , BND_MST_URL : 브랜드URL }]
     * @apiSuccess {Object[]} sizeList 사이즈 코드 리스트 [{CMN_COM_IDX=2997, CMN_COM_LEVEL=2, CMN_COM_NM=XS, CMN_COM_REG_DT=20200302010708, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=1, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XS, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2998, CMN_COM_LEVEL=2, CMN_COM_NM=S, CMN_COM_REG_DT=20200302010733, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=2, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=S, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2999, CMN_COM_LEVEL=2, CMN_COM_NM=M, CMN_COM_REG_DT=20200302010745, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=3, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=M, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3000, CMN_COM_LEVEL=2, CMN_COM_NM=L, CMN_COM_REG_DT=20200302010755, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=4, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=L, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3001, CMN_COM_LEVEL=2, CMN_COM_NM=XL, CMN_COM_REG_DT=20200302010803, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=5, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XL, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3002, CMN_COM_LEVEL=2, CMN_COM_NM=XXL, CMN_COM_REG_DT=20200302010816, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=6, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XXL, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object[]} colorList 색상 코드 리스트  [{CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1039, CMN_COM_LEVEL=2, CMN_COM_ETC3=946, CMN_COM_NM=BLACK, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054049, CMN_COM_SORT=89, CMN_COM_ETC2=#000000, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=BK}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1142, CMN_COM_LEVEL=2, CMN_COM_ETC3=935, CMN_COM_NM=WHITE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054103, CMN_COM_SORT=192, CMN_COM_ETC2=#ffffff, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=WH}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014424, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3009, CMN_COM_LEVEL=2, CMN_COM_NM=CARNATION, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014817, CMN_COM_SORT=200, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CA}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014505, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3010, CMN_COM_LEVEL=2, CMN_COM_NM=TEXAS ROSE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014829, CMN_COM_SORT=201, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#febf4e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=TR}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014544, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3011, CMN_COM_LEVEL=2, CMN_COM_NM=MUSTARD, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014841, CMN_COM_SORT=202, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fee24e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MU}, {CMN_COM_IDX=3012, CMN_COM_LEVEL=2, CMN_COM_NM=BARLEY WHITE, CMN_COM_REG_DT=20200302014905, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=203, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_ETC1=BA, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3013, CMN_COM_LEVEL=2, CMN_COM_NM=OCEAN GREEN, CMN_COM_REG_DT=20200302014943, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=204, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#40ba87, CMN_COM_ETC1=OC, CMN_COM_REG_ID=admin}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014958, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3014, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015523, CMN_COM_SORT=205, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5ff2f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015016, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3015, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015515, CMN_COM_SORT=206, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5fb1f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015032, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3016, CMN_COM_LEVEL=2, CMN_COM_NM=CORNFLOWER BLUE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015536, CMN_COM_SORT=207, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5f71f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CB}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015046, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3017, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM PURPLE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015502, CMN_COM_SORT=208, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#a55ce9, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MP}, {CMN_COM_IDX=3018, CMN_COM_LEVEL=2, CMN_COM_NM=SILVER CHALICE, CMN_COM_REG_DT=20200302020628, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=209, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#acacac, CMN_COM_ETC1=SC, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3019, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM RED VIOLET, CMN_COM_REG_DT=20200302020915, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=210, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#cc33a3, CMN_COM_ETC1=MV, CMN_COM_REG_ID=admin}]
     * @apiSuccess {String} NOW_CATEGORY_NAME 선택한 카테고리 명
     */
	@RequestMapping("/pc/product/productList")
    public ModelAndView productList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        //전체 브랜드 리스트
        List<Map<String,Object>> brandList = this.brandService.selectBrandAllList(commandMap);
        
        mv.addObject("brandList", brandList);
        mv.addObject("sizeList", this.pcCommonService.selectCode("COMMON_PRODUCT_SIZE"));
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));

        commandMap.put("PRD_CTG_IDX", commandMap.get("idx"));
        Map<String, Object> categoryInfo = this.mainCategoryService.selectCategoryDetailByIdx(commandMap);
        mv.addObject("NOW_CATEGORY_NAME", categoryInfo.get("PRD_CTG_NM"));
        
        this.mainCategoryService.updateCategoryReadCount(commandMap);
        
        return mv;
    }
	
    /**
     * @api {GET} /pc/product/productListAjax.do
     * @apiName 상품전시 중_카테고리 상품 목록 Ajax
     * @apiGroup 상품전시
     *
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} PRD_CTG_IDX 2뎁스 카테고리 인덱스
     * 
     * @apiParam {String[]} arrSearchBrand 검색 브랜드 인덱스 [1818,1698,1738]
     * @apiParam {String} searchOptionYN 사이즈 또는 색상 검색시  'Y' 필수 파라미터
     * @apiParam {String[]} arrSearchSize 검색 사이즈
     * @apiParam {String[]} arrSearchColor 검색 색상
     * @apiParam {Object[]} arrSearchPrice 검색 가격  [{min:10000,max:30000},{min:50000,max:100000}]
     * @apiParam {String} orderType 정렬조건  {new : 최근 등록순 , dwn : 가격낮은순 , up: 가격높은순, hit : 판매량 많은순}
     * 
     * @apiSuccess {Integer} totalCount 상품 검색 결과 총 갯수
     * @apiSuccess {JSON} productList 상품 리스트 [{TAG_MST_TITLE=대표태그, PRD_MST_NM=상품이름, PRD_MST_CD=상품코드, PRD_MST_TYPE = 상품타입(일반:G,세트:S,묶음:B ), PRD_IMAGE = 상품썸네일, PRD_ROLL_OVER_IMG = 롤오버시 전환 이미지 , PRD_MST_URL = 상품동영상, CNT_PRD_COLOR:[{"CNT_PRD_COLOR":"#b8860b",CMN_COM_IDX=3009},{"CNT_PRD_COLOR":"#f4a460",CMN_COM_IDX=1142}], PRD_MST_BRAND_NM = 브랜드이름, PRD_MST_PRICE=일반가, PRD_NOW_DST_PRICE=할인율 적용가, PRD_MST_SEL_STATE=판매상태(I:판매중,T:품절,S미판매,O:일시품절), MY_LIKE=좋아요여부, LIKE_COUNTS=상품 좋아요수 }]
     */
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/productListAjax")
    public ModelAndView productListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
	    ModelAndView mv = new ModelAndView("jsonView");
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        
        
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        commandMap.put("catIdx", StringUtil.getString(commandMap.get("PRD_CTG_IDX")));
        
        //사이즈 또는 색상 검색 파라미터
        commandMap.put("searchOptionYN", StringUtil.getString(commandMap.get("searchOptionYN"),"Y"));

        String sJsonArrSearchBrand =  StringUtil.getString(commandMap.get("arrSearchBrand"),"");
        String sJsonArrSearchSize =  StringUtil.getString(commandMap.get("arrSearchSize"),"");
        String sJsonArrSearchColor =  StringUtil.getString(commandMap.get("arrSearchColor"),"");
        String sJsonArrSearchPrice =  StringUtil.getString(commandMap.get("arrSearchPrice"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        
        TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
        TypeReference<List<Map<String, Object>>> typeRefListMap = new TypeReference<List<Map<String, Object>>>(){};
        
        List<String> arrSearchBrand = mapper.readValue(sJsonArrSearchBrand, typeRef);
        List<String> arrSearchSize = mapper.readValue(sJsonArrSearchSize, typeRef);
        List<String> arrSearchColor = mapper.readValue(sJsonArrSearchColor, typeRef);
        List<Map<String, Object>> arrSearchPrice = mapper.readValue(sJsonArrSearchPrice, typeRefListMap);
        
        commandMap.put("arrSearchBrand", arrSearchBrand);
        commandMap.put("arrSearchSize", arrSearchSize);
        commandMap.put("arrSearchColor", arrSearchColor);
        commandMap.put("arrSearchPrice", arrSearchPrice);
        
        commandMap.put("THUMBNAIL_SIZE", THUMBNAIL_SIZE);
        
        //조회 정렬 조건이 없으면 기본값 최근 등록순
        if(StringUtil.isNullToString(commandMap.get("orderType")).equals(""))
        {
            commandMap.put("orderType","new");
        }
        int totalCount = this.productListService.selectProductListCount(commandMap);
        
        // 페이지 당 기본 기획전 출력 갯수
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        Paging paging = new Paging(totalCount, commandMap);
        List<Map<String,Object>> productList = null;
        
        commandMap.put("MEM_MST_ID", user.getMEM_MST_MEM_ID());
        if(totalCount > 0){
            productList = this.productListService.selectProductList(commandMap);
        }

        mv.addObject("productList", productList);
        mv.addObject("totalCount", StringUtil.getString(totalCount));
        mv.addObject("paging", paging);
        
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : productMainListAjax
	* 2. ClassName : ProductListController.java
	* 3. Comment : 메인 상품 리스트 Ajax
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/productMainListAjax")
    public JSON productMainListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

//        // 상품 리스트 -- 마지막 category index 기준으로 조회
//        commandMap.put("catIdx",commandMap.get("cateIdx"));
//        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
//        
//        // 로그인 회원정보
//        User user = SessionsUser.getSessionUser(request);
//        
//        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
//
//        //조회 정렬 조건이 없으면 기본값은 hit로 주자  
//		if(StringUtil.isNullToString(commandMap.get("orderType")).equals(""))
//		{
//			commandMap.put("orderType","new");
//		}
//        int totalCount = this.productListService.selectProductListCount(commandMap);
//        
//        // 페이지당 기본 출력 갯수는 12개 이다.
//        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "16"));
//        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
//        Paging paging = new Paging(totalCount, commandMap);
//        PagingRenderer pagingRenderer = new PagingRenderer("FRONT");
//        String page = pagingRenderer.renderPagination(paging, "goPage");
//        List<Map<String, Object>> listProduct = null;
//        if(totalCount> 0)
//        {
//        	listProduct = this.productListService.selectProductList(commandMap);
//        }
//        
//        json.put("listProduct", listProduct);
//        json.put("page", page);
        
        return json;
    }
	
	

}
