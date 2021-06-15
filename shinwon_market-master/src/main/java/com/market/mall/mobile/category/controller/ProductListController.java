package com.market.mall.mobile.category.controller;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.product.service.ProductListService;

/**
 * @PackageName: com.market.mall.mobile.category.controller
 * @FileName : MobileProductListController.java
 * @Date : 2014. 7. 30.
 * @프로그램 설명 : 카테고리 상품 목록화면을 처리하는 Controller Class
 * @author 이미정
 */
@Controller("mobileProductListController")
@AccessLevelUser(ROLEUSER.guest)
public class ProductListController {
    @Resource(name="productListService") 
    private ProductListService productListService;
    
    @Resource(name="pcCommonService")       
    private CommonService pcCommonService;
    
    
    private final static int CATEGORY_TOP_SELLER_LIST_CNT = 6;
    private final static int CATEGORY_NEW_ARRIVALS_LIST_CNT = 6;
    private final static int CATEGORY_MDS_CHOICE_LIST_CNT = 6;
    private final static int CATEGORY_PRODUCT_PAGESIZE = 5;
    
    private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST;
    private final static int _TOPSELLER_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST;
    private final static int _NEWARRIVALS_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST;
    private final static int _MDSCHOICE_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST;  

    private final static int _POPUP_VIEW_LOCATION_CODE_ = Code.POPUP_LOCATION_CODE_PRODUCTLIST;
    
    /**
     *  카테고리 - 배너/상품 연관 맵. ( 카테고리 페이지에서만 사용함. )
     */
    private static final Map<Integer, Object> htBannerIdxs;
        static {
            
            // woman
            Map<Integer, Object> aMap = new HashMap<Integer, Object> ();
            
            Map<String, Integer> Map1 = new HashMap<String, Integer> ();
            Map1.put("CATEGORY_CATE_V_A_NEW_IDX", 508);
            Map1.put("CATEGORY_CATE_V_A_MDS_IDX", 509);
            Map1.put("CATEGORY_CATE_B_A_IDX", 495);
            Map1.put("CATEGORY_CATE_B_B_IDX", 496);
            
            Map<String, Integer> Map2 = new HashMap<String, Integer> ();
            Map2.put("CATEGORY_CATE_V_A_NEW_IDX", 510);
            Map2.put("CATEGORY_CATE_V_A_MDS_IDX", 511);
            Map2.put("CATEGORY_CATE_B_A_IDX", 497);
            Map2.put("CATEGORY_CATE_B_B_IDX", 498);
            
            Map<String, Integer> Map3 = new HashMap<String, Integer> ();
            Map3.put("CATEGORY_CATE_V_A_NEW_IDX", 512);
            Map3.put("CATEGORY_CATE_V_A_MDS_IDX", 513);
            Map3.put("CATEGORY_CATE_B_A_IDX", 499);
            Map3.put("CATEGORY_CATE_B_B_IDX", 500);
                        
            Map<String, Integer> Map4 = new HashMap<String, Integer> ();
            Map4.put("CATEGORY_CATE_V_A_NEW_IDX", 514);
            Map4.put("CATEGORY_CATE_V_A_MDS_IDX", 515);
            Map4.put("CATEGORY_CATE_B_A_IDX", 501);
            Map4.put("CATEGORY_CATE_B_B_IDX", 502);
            
            Map<String, Integer> Map5 = new HashMap<String, Integer> ();
            Map5.put("CATEGORY_CATE_V_A_NEW_IDX", 547);
            Map5.put("CATEGORY_CATE_V_A_MDS_IDX", 548);
            Map5.put("CATEGORY_CATE_B_A_IDX", 544);
            Map5.put("CATEGORY_CATE_B_B_IDX", 545);
            
            aMap.put( 275, Map1);   
            aMap.put( 169, Map2);   
            aMap.put( 170, Map3);   
            aMap.put( 171, Map4);   
            aMap.put( 269, Map5);   
            
            htBannerIdxs = Collections.unmodifiableMap(aMap);
        }       

        private final static String [] _PRODUCT_LIST_ORDER_ = Code._PRODUCT_LIST_ORDER_;
        
    
    /**
     * <pre>
     * 1. MethodName : productList
     * 2. ClassName  : MobileProductListController.java
     * 3. Comment    : 카테고리 상품 목록화면
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/mobile/category/productList.do")
    public ModelAndView productList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
     // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        
        if(SessionsUser.isLogin(request) ){
            //commandMap.put("MEM_MST_MEMBER_GROUP", user.getMEM_MST_MEMBER_GROUP());
            commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        }
        
        String session_id = StringUtil.getString(commandMap.get("session_id"),"");
        commandMap.put("MEM_CRT_SES_ID", session_id);
        
        commandMap.put("searchPrdCtgEnv", "M");
        commandMap.put("catIdx", commandMap.get("idx"));
        
        // 카테고리 선택 정보. ----------------------------------------------------------------------------------------------------------------
        Map<String, Object> listMenuCategory = new HashMap<String, Object>();

        commandMap.remove("productCategory1");
        commandMap.remove("productCategory2");
        commandMap.remove("productCategory3");
        // 선택 카테고리와 동일 레벨
        int level = 1;
        int prd_idx = Integer.parseInt((String)commandMap.get("idx"));
        do{
            /*
            commandMap.put("PRD_CTG_IDX", prd_idx);
            List<Map<String, Object>> listCategory = this.productListService.selectCategoryList(commandMap);
            level = ((BigDecimal)(listCategory.get(0).get("PRD_CTG_LEVEL"))).intValue();
            prd_idx = ((BigDecimal)(listCategory.get(0).get("PRD_CTG_UP_IDX"))).intValue();;
            listMenuCategory.put(Integer.toString(level), listCategory);
            
            commandMap.put("productCategory"+Integer.toString(level), commandMap.get("PRD_CTG_IDX"));
            */
        }while( level > 1 );
        
        commandMap.put("PRD_CTG_IDX", commandMap.get("idx"));
        List<Map<String, Object>> listMenuSubCategory = this.productListService.selectSubCategoryList(commandMap);
        if( listMenuSubCategory!=null && !listMenuSubCategory.isEmpty() ){
            listMenuCategory.put( Integer.toString(listMenuCategory.size()+1), listMenuSubCategory);
        }
        
        mv.addObject("listMenuCategory", listMenuCategory);
        /*
        System.out.println("*******************************************************************************************************");
        System.out.println(listMenuCategory);
        /*
        try{
//      ((List<Map<String, Object>>) listMenuCategory.get("1")).get(0).get("PRD_CTG_UP_IDX");
            if( listMenuCategory.containsKey("2")){
                commandMap.put("productCategory1", ((List<Map<String, Object>>) listMenuCategory.get("2")).get(0).get("PRD_CTG_UP_IDX"));
            }
            
            if( listMenuCategory.containsKey("3")){
                commandMap.put("productCategory2", ((List<Map<String, Object>>) listMenuCategory.get("3")).get(0).get("PRD_CTG_UP_IDX"));
            }
        }
        catch( Exception e){
            // 없으면 없는대로 아무거나 보여줌.
            commandMap.put("productCategory1", 1 );
            commandMap.put("productCategory2", "" );
        }
        */
        
        // 카테고리 선택 정보. ----------------------------------------------------------------------------------------------------------------
                
        
        // 상단메뉴설정
        commandMap.put("topMenu", "category");
        Map<Integer, Object> map = (Map<Integer, Object>) htBannerIdxs.get(commandMap.get("productCategory1"));
        
        // 화면 상품목록 가져오기
        commandMap.put("searchPrdCtgEnv", "M");
        commandMap.put("catIdx", commandMap.get("idx"));
        //commandMap.put("ICON_TYPE_NEW", Code.PRODUCT_ICON_NEW);
        
        commandMap.put("THUMBNAIL_SIZE", _TOPSELLER_THUMBNAIL_SIZE_);
        commandMap.put("maxListCnt", CATEGORY_TOP_SELLER_LIST_CNT );        
        //List<Map<String, Object>> listTopSeller = this.productListService.selectTopSellerList(commandMap);

        commandMap.put("PD_IDX", map.get("CATEGORY_CATE_V_A_NEW_IDX") );
        commandMap.put("THUMBNAIL_SIZE", _NEWARRIVALS_THUMBNAIL_SIZE_);
        commandMap.put("maxListCnt", CATEGORY_NEW_ARRIVALS_LIST_CNT );
        List<Map<String, Object>> listNewArrivals = this.productListService.selectProductDisplayList(commandMap);
        
        commandMap.put("PD_IDX", map.get("CATEGORY_CATE_V_A_MDS_IDX") );
        commandMap.put("THUMBNAIL_SIZE", _MDSCHOICE_THUMBNAIL_SIZE_);
        commandMap.put("maxListCnt", CATEGORY_MDS_CHOICE_LIST_CNT );
        List<Map<String, Object>> listMdsChoice = this.productListService.selectProductDisplayList(commandMap);
        
        
        if( StringUtil.isNullToString(commandMap.get("productPrice")).contains("|") ){
            String [] price = ((String)commandMap.get("productPrice")).split("\\|");
            if( price[0].length()>0 ){
                commandMap.put("PRICE_START", Integer.parseInt(price[0]));
            }
            if( price.length>1 && price[1].length()>0 ){
                commandMap.put("PRICE_END", Integer.parseInt(price[1]));
            }
        }
        
        int pSort = 1;
        if( !StringUtil.isNullToString(commandMap.get("pSort")).equals("")){
            try{
                pSort = Integer.parseInt((String)commandMap.get("pSort"),10);
            }catch(NumberFormatException e){
                pSort = 1;
            }
        }
        
        commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        commandMap.put("PRODUCT_LIST_ORDER", _PRODUCT_LIST_ORDER_[pSort]);
        int totalCount = this.productListService.selectProductListCount(commandMap);
        commandMap.put("cPage", 1);
        commandMap.put("pageSize", CATEGORY_PRODUCT_PAGESIZE);
        commandMap.put("pagingSize", 5);
        Paging paging = new Paging(totalCount, commandMap);
        List<Map<String, Object>> listProduct = this.productListService.selectProductList(commandMap);


        // 배너목록 가져오기
        commandMap.put("BANNER_IDX", map.get("CATEGORY_CATE_B_A_IDX"));
        Map<String, Object> mapMAIN_B_A= this.productListService.selectBannerDisplayInfoList(commandMap);
        List<Map<String, Object>> listBannerA = (List<Map<String, Object>>) mapMAIN_B_A.get("list");
        
        commandMap.put("BANNER_IDX", map.get("CATEGORY_CATE_B_B_IDX"));
        Map<String, Object> mapMAIN_B_B= this.productListService.selectBannerDisplayInfoList(commandMap);
        List<Map<String, Object>> listBannerB = (List<Map<String, Object>>) mapMAIN_B_B.get("list");
        
        /*
        List<Map<String, Object>> listMenuCategory = this.productListService.selectSubCategoryList(commandMap);
        commandMap.put("catIdx", commandMap.get("brandSubCategory1"));
        List<Map<String, Object>> listMenuSubCategory = this.productListService.selectSubCategoryList(commandMap);
        */
        
        
        // 팝업 목록
        commandMap.put("searchPopMstViewEnv",commandMap.get("searchPrdCtgEnv") );
        commandMap.put("searchViewLocation",_POPUP_VIEW_LOCATION_CODE_);        
        mv.addObject("listPopup", this.pcCommonService.selectPopupList(commandMap));

        mv.addObject("listBannerA", listBannerA);
        mv.addObject("listBannerB", listBannerB);
        
        //mv.addObject("listTopSeller", listTopSeller );
        mv.addObject("listNewArrivals", listNewArrivals );
        mv.addObject("listMdsChoice", listMdsChoice );
        mv.addObject("listProduct", listProduct );
        
//          mv.addObject("listMenuCategory", listMenuCategory );
//          mv.addObject("listMenuSubCategory", listMenuSubCategory );
        
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : moreBrandProduct
     * 2. ClassName  : MobileProductListController.java
     * 3. Comment    : 모바일 카테고리 상품 추가 보기
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping("/mobile/category/moreCategoryProduct.do")
    public ModelAndView moreBrandProduct(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        
        if(SessionsUser.isLogin(request) ){
            //commandMap.put("MEM_MST_MEMBER_GROUP", user.getMEM_MST_MEMBER_GROUP());
            commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        }
        
        String session_id = StringUtil.getString(commandMap.get("session_id"),"");
        commandMap.put("MEM_CRT_SES_ID", session_id);
        
        // 화면 상품목록 가져오기
        commandMap.put("searchPrdCtgEnv", "M");
        commandMap.put("catIdx", commandMap.get("idx"));
        //commandMap.put("ICON_TYPE_NEW", Code.PRODUCT_ICON_NEW);

        // 상품 검색
        if( StringUtil.isNullToString(commandMap.get("productPrice")).contains("|") ){
            String [] price = ((String)commandMap.get("productPrice")).split("\\|");
            if( price[0].length()>0 ){
                commandMap.put("PRICE_START", Integer.parseInt(price[0]));
            }
            if( price.length>1 && price[1].length()>0 ){
                commandMap.put("PRICE_END", Integer.parseInt(price[1]));
            }
        }
        
        if( !StringUtil.isEmpty((String)commandMap.get("brandSubCategory1")) ){
            if( !StringUtil.isEmpty((String)commandMap.get("brandSubCategory2")) ){
                commandMap.put("productSubCategory", commandMap.get("brandSubCategory2") );
            }
            else {
                commandMap.put("productSubCategory", commandMap.get("brandSubCategory1") );
            }
        }
        
        int pSort = 1;
        if( !StringUtil.isNullToString(commandMap.get("pSort")).equals("")){
            try{
                pSort = Integer.parseInt((String)commandMap.get("pSort"),10);
            }catch(NumberFormatException e){
                pSort = 1;
            }
        }
        
        commandMap.put("PRODUCT_LIST_ORDER", _PRODUCT_LIST_ORDER_[pSort]);
        int totalCount = this.productListService.selectProductListCount(commandMap);
        commandMap.put("pageSize", CATEGORY_PRODUCT_PAGESIZE);
        commandMap.put("pagingSize", 5);
        Paging paging = new Paging(totalCount, commandMap);
        List<Map<String, Object>> listProduct = this.productListService.selectProductList(commandMap);
        
        mv.addObject("listProduct", listProduct );
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }

}
