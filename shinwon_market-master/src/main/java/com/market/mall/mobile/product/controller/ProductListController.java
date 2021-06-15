package com.market.mall.mobile.product.controller;

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
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.brand.service.BrandService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.product.service.ProductListService;

/**
 * @PackageName: com.market.mall.mobile.product.controller
 * @FileName : ProductListController.java
 * @Date : 2015. 7. 15.
 * @프로그램 설명 : MOBILE 상품 전시 리스트를 처리하는 Controller Class
 * @author DEV_SONGJEONGEUN
 */
@Controller("moblieProductListController")
@AccessLevelUser(ROLEUSER.guest)
public class ProductListController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="productListService") 	
	private ProductListService productListService;
	
	@Resource(name="pcCommonService")		
	private CommonService pcCommonService;
	
	@Resource(name="brandService") 
	private BrandService brandService;
	
	// 리스트에서 보여질 상품의 이미지 사이즈
	 private final static int THUMBNAIL_SIZE = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE;
	
	 @RequestMapping("/mobile/product/productMain")
	 public ModelAndView productMain(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
	            , @RequestParams(value="searchLine") String[] searchLine
	            , @RequestParams(value="searchRepColor") String[] searchRepColor
	            , @RequestParams(value="searchSize") String[] searchSize
	            ) throws Exception
	 {
	     ModelAndView mv = new ModelAndView();
	        
	        
	     return mv;
	 }
	
    /**
     * @api {GET} /mobile/product/productList.do
     * @apiName 상품전시 중_카테고리
     * @apiGroup Mobile 상품전시
     *
     * @apiParam {String} PRD_CTG_IDX 2뎁스 카테고리 인덱스
     * 
     * @apiSuccess {Object[]} brandList 전체 브랜드 리스트 [{BND_MST_IDX : 브랜드코드, BND_MST_BRAND_NM : 브랜드이름 , BND_MST_URL : 브랜드URL }]
     * @apiSuccess {Object[]} sizeList 사이즈 코드 리스트 [{CMN_COM_IDX=2997, CMN_COM_LEVEL=2, CMN_COM_NM=XS, CMN_COM_REG_DT=20200302010708, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=1, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XS, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2998, CMN_COM_LEVEL=2, CMN_COM_NM=S, CMN_COM_REG_DT=20200302010733, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=2, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=S, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2999, CMN_COM_LEVEL=2, CMN_COM_NM=M, CMN_COM_REG_DT=20200302010745, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=3, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=M, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3000, CMN_COM_LEVEL=2, CMN_COM_NM=L, CMN_COM_REG_DT=20200302010755, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=4, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=L, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3001, CMN_COM_LEVEL=2, CMN_COM_NM=XL, CMN_COM_REG_DT=20200302010803, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=5, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XL, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3002, CMN_COM_LEVEL=2, CMN_COM_NM=XXL, CMN_COM_REG_DT=20200302010816, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=6, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XXL, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object[]} colorList 색상 코드 리스트  [{CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1039, CMN_COM_LEVEL=2, CMN_COM_ETC3=946, CMN_COM_NM=BLACK, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054049, CMN_COM_SORT=89, CMN_COM_ETC2=#000000, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=BK}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1142, CMN_COM_LEVEL=2, CMN_COM_ETC3=935, CMN_COM_NM=WHITE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054103, CMN_COM_SORT=192, CMN_COM_ETC2=#ffffff, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=WH}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014424, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3009, CMN_COM_LEVEL=2, CMN_COM_NM=CARNATION, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014817, CMN_COM_SORT=200, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CA}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014505, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3010, CMN_COM_LEVEL=2, CMN_COM_NM=TEXAS ROSE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014829, CMN_COM_SORT=201, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#febf4e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=TR}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014544, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3011, CMN_COM_LEVEL=2, CMN_COM_NM=MUSTARD, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014841, CMN_COM_SORT=202, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fee24e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MU}, {CMN_COM_IDX=3012, CMN_COM_LEVEL=2, CMN_COM_NM=BARLEY WHITE, CMN_COM_REG_DT=20200302014905, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=203, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_ETC1=BA, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3013, CMN_COM_LEVEL=2, CMN_COM_NM=OCEAN GREEN, CMN_COM_REG_DT=20200302014943, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=204, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#40ba87, CMN_COM_ETC1=OC, CMN_COM_REG_ID=admin}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014958, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3014, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015523, CMN_COM_SORT=205, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5ff2f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015016, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3015, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015515, CMN_COM_SORT=206, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5fb1f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015032, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3016, CMN_COM_LEVEL=2, CMN_COM_NM=CORNFLOWER BLUE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015536, CMN_COM_SORT=207, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5f71f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CB}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015046, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3017, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM PURPLE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015502, CMN_COM_SORT=208, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#a55ce9, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MP}, {CMN_COM_IDX=3018, CMN_COM_LEVEL=2, CMN_COM_NM=SILVER CHALICE, CMN_COM_REG_DT=20200302020628, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=209, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#acacac, CMN_COM_ETC1=SC, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3019, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM RED VIOLET, CMN_COM_REG_DT=20200302020915, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=210, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#cc33a3, CMN_COM_ETC1=MV, CMN_COM_REG_ID=admin}]
     */
	@RequestMapping("/mobile/product/productList")
    public ModelAndView productList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();

        //전체 브랜드 리스트
        List<Map<String,Object>> brandList = this.brandService.selectBrandAllList(commandMap);
        
        mv.addObject("brandList", brandList);
        mv.addObject("sizeList", this.pcCommonService.selectCode("COMMON_PRODUCT_SIZE"));
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));
        
        return mv;
    }
	

    /**
     * @api {GET} /mobile/product/productListAjax.do
     * @apiName 상품전시 중_카테고리 상품 목록 Ajax
     * @apiGroup Mobile 상품전시
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
	@RequestMapping(value="/mobile/product/productListAjax")
    public ModelAndView productListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
	    ModelAndView mv = new ModelAndView("jsonView");
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_MOBILE);
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
        if(totalCount > 0){
            productList = this.productListService.selectProductList(commandMap);
        }

        mv.addObject("productList", productList);
        mv.addObject("totalCount", StringUtil.getString(totalCount));
        mv.addObject("paging", paging);
        
        return mv;
    }
	
	
}
