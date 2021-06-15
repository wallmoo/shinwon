package com.market.mall.pc.vendor.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
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
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.vendor.service.VendorTopSellerService;

@Controller("pcVendorTopSellerController")
public class VendorTopSellerController {
	
    
    @Resource(name = "pcCommonService")
    private CommonService pcCommonService;
    
    @Resource(name = "pcVendorTopSellerService")
    private VendorTopSellerService pcVendorTopSellerService;
    
   

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG;
	
	 /**
     * @api {GET} /pc/topseller/topsellerMain.do
     * @apiName 탑셀러 메인회면
     * @apiGroup 탑셀러
     *
     * @apiSuccess {Object[]} topBannerList 상단 배너 리스트  [{topProductList=[{PRD_MST_CD = 상품코드1, IMG_THUMBNAIL = 상품썸네일1, CMM_FLE_ALT_TXT = 대체텍스트 },{PRD_MST_CD = 상품코드2, IMG_THUMBNAIL = 상품썸네일2 , CMM_FLE_ALT_TXT = 대체텍스트 }] ,BND_MST_SEL_NM = 셀러이름, BND_MST_SEL_DESC = 셀러안내텍스트, SELLER_IMG=셀러이미지, LIKE_COUNTS = 셀러 좋아요수, MY_LIKE=좋아요여부, BND_MST_IDX=셀러IDX, TAG_LIST=[{TAG_MST_TITLE=태그 타이틀1}, {TAG_MST_TITLE=태그 타이틀2}] }]
     * @apiSuccess {Object[]} bottomBannerList 하단 배너 리스트  [{bottomProductList = [{PRD_MST_CD = 상품코드1, IMG_THUMBNAIL = 상품썸네일1, CMM_FLE_ALT_TXT = 대체텍스트 },{PRD_MST_CD = 상품코드2, IMG_THUMBNAIL = 상품썸네일2, CMM_FLE_ALT_TXT = 대체텍스트 }], BND_MST_SEL_NM = 셀러이름, BND_MST_SEL_DESC = 셀러안내텍스트, SELLER_IMG=셀러이미지, LIKE_COUNTS = 셀러 좋아요수, MY_LIKE=좋아요여부, BND_MST_IDX=셀러IDX, TAG_LIST=[{TAG_MST_TITLE=태그 타이틀1}, {TAG_MST_TITLE=태그 타이틀2}] }]
     */
    @RequestMapping("/pc/topseller/topsellerMain")
    public ModelAndView topsellerMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("BNR_MST_ENV" , Code.USER_ENV_TYPE_PC);
        commandMap.put("THUMBNAIL_SIZE" , Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);
        
        List<Map<String,Object>> topBannerList = pcVendorTopSellerService.selectTopBannerList(commandMap);
        List<Map<String,Object>> bottomBannerList = pcVendorTopSellerService.selectBottomBannerList(commandMap);
        
        mv.addObject("topBannerList", topBannerList);
        mv.addObject("bottomBannerList", bottomBannerList);
        return mv;
    }
    
    /**
    * @api {POST} /pc/topseller/topsellerProductAjax.do
    * @apiName 탑셀러 상품 Ajax
    * @apiGroup 탑셀러
    *
    * @apiParam {Integer} cPage 현재페이지
    *
    * @apiSuccess {Object[]} sellerProductList 탑셀러 상품 목록  [{PRD_IMAGE = 셀러등록최신상품이미지, PRD_IMAGE_ALT=대체텍스트,  PRD_MST_CD=셀러상품코드, BND_MST_SEL_NM = 셀러이름, BND_MST_SEL_DESC = 셀러소개, SELLER_IMG=셀러이미지, LIKE_COUNTS = 셀러 좋아요수, MY_LIKE=좋아요여부, BND_MST_IDX=셀러IDX } ]
    */
    @RequestMapping("/pc/topseller/topsellerProductAjax")
    public JSON topsellerProductAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
       
        JSON json = new JSON();
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("THUMBNAIL_SIZE", _DETAIL_IMAGE_SIZE_); // 썸네일 사이즈
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_TOP_SELLER); // 좋아요 타입
        
        
        
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        //commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        //int totalCount = this.pcVendorTopSellerService.selectSellerProductListCount(commandMap);
        //Paging paging   = new Paging(totalCount, commandMap);
        
        //commandMap.put("startNum", paging.getStartNum());
        //commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = this.pcVendorTopSellerService.selectSellerProductList(commandMap);
        
        //if(totalCount > 0){
        //    list = this.pcVendorTopSellerService.selectSellerProductList(commandMap);
        //}

        json.put("sellerProductList", list);
        
        return json;
    }
    
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomHome")
    public ModelAndView sellerroomHome (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        

        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("BNR_MST_ENV"   , Code.USER_ENV_TYPE_PC);
        commandMap.put("USER_ENV_TYPE" , Code.USER_ENV_TYPE_PC);
        commandMap.put("DSP_MST_GBN"   , Code.USER_ENV_TYPE_PC);
        
        commandMap.put("THUMBNAIL_SIZE" , Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);        
        
        String VDR_MST_IDX = StringUtil.getString(commandMap.get("VDR_MST_IDX"), "");
        if(!StringUtil.isEmpty(VDR_MST_IDX)) {
            Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);

            commandMap.put("BNR_MST_GBN" , sellerInfo.get("BND_MST_LAY_TPY")); 
            commandMap.put("DSP_MST_ENV" , sellerInfo.get("BND_MST_LAY_TPY"));
     
            commandMap.put("CMN_COM_IDX" , "3611");
           
            List<Map<String, Object>> topBanner = this.pcVendorTopSellerService.selectRoomHomeBannerLIst(commandMap);
            
            commandMap.put("CMN_COM_IDX" , "3612"); 
            List<Map<String, Object>> planBanner = this.pcVendorTopSellerService.selectRoomHomeBannerWithProductLIst(commandMap);
            
            
            commandMap.put("CMN_COM_IDX"   , "3613");
            commandMap.put("CNT_MST_TYPE"  , CONTENTS_TYPE_CODE.TYPE_SELLER_PICK);
            commandMap.put("CMM_FLE_TB_NM" , "T_CNT_MST");
            commandMap.put("CMM_FLE_SORT"  , "1");
            commandMap.put("CMM_FLE_TB_TYPE"  ,  Code.USER_ENV_TYPE_PC);
            commandMap.put("TAG_BND_TYPE"     , CONTENTS_TYPE_CODE.TYPE_PRODUCT);
            
            
            List<Map<String, Object>> sellerpickBanner = this.pcVendorTopSellerService.selectRoomHomeMainSellerPickLIst(commandMap);
            
            
            
            commandMap.put("CMN_COM_IDX" , "3614");
            
            List<Map<String, Object>> bytrendBanner = this.pcVendorTopSellerService.selectRoomHomeBannerLIst(commandMap);
            
            commandMap.put("CMN_COM_IDX" , "3615");
            List<Map<String, Object>> strBanner = this.pcVendorTopSellerService.selectRoomHomeBannerLIst(commandMap);
            

            commandMap.put("BNR_MST_IDX", commandMap.get("VDR_MST_IDX"));
            
            List<Map<String, Object>> tagList = this.pcVendorTopSellerService.selectTopBannerTagLIst(commandMap);

            
            commandMap.put("CMN_COM_IDX", "3807");
            List<Map<String, Object>> bytrendProds = this.pcVendorTopSellerService.selectRoomHomeProductList(commandMap);
            
            commandMap.put("CMN_COM_IDX", "3808");
            List<Map<String, Object>> newProds = this.pcVendorTopSellerService.selectRoomHomeProductList(commandMap);
            
            commandMap.put("CMN_COM_IDX", "3809");
            List<Map<String, Object>> bestProds = this.pcVendorTopSellerService.selectRoomHomeProductList(commandMap);
            
            
            mv.addObject("sellerInfo", sellerInfo);
            mv.addObject("topBanner", topBanner);
            mv.addObject("planBanner", planBanner);
            mv.addObject("sellerpickBanner", sellerpickBanner);
            if(bytrendBanner != null && bytrendBanner.size() > 0)
            	mv.addObject("bytrendBanner", bytrendBanner.get(0));
            mv.addObject("strBanner", strBanner);
            mv.addObject("tagList", tagList);
            mv.addObject("bytrendProds", bytrendProds);
            mv.addObject("newProds", newProds);
            mv.addObject("bestProds", bestProds);
            
            mv.addObject("commandMap", commandMap);
        	
        }
        
        
 
        
        return mv;
    }
    
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomInfo")
    public ModelAndView sellerroomInfo (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        

        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("BNR_MST_ENV" , Code.USER_ENV_TYPE_PC);
        commandMap.put("USER_ENV_TYPE" , Code.USER_ENV_TYPE_PC);
        
        String VDR_MST_IDX = StringUtil.getString(commandMap.get("VDR_MST_IDX"), "");
        if(!StringUtil.isEmpty(VDR_MST_IDX)) {
            Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);

            commandMap.put("BNR_MST_GBN" , sellerInfo.get("BND_MST_LAY_TPY")); 
     
            commandMap.put("CMN_COM_IDX" , "3617");
           
            List<Map<String, Object>> bannerInfo = this.pcVendorTopSellerService.selectRoomHomeBannerLIst(commandMap);
            
   
            
            mv.addObject("sellerInfo", sellerInfo);
            
            if(bannerInfo != null && bannerInfo.size() > 0)
            	mv.addObject("bannerInfo", bannerInfo.get(0));
            
            mv.addObject("commandMap", commandMap);
        	
        }
 
        return mv;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomShop")
    public ModelAndView sellerroomShop (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
        //전체 브랜드 리스트
        //List<Map<String,Object>> brandList = this.pcVendorTopSellerService.selectSellerBrandList(commandMap);
        
    	Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);
    	mv.addObject("sellerInfo", sellerInfo);
        //mv.addObject("brandList", brandList);
        mv.addObject("sizeList", this.pcCommonService.selectCode("COMMON_PRODUCT_SIZE"));
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));
        
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    
	@FrontBannerSkip()
	@RequestMapping(value="/pc/topseller/sellerroom/sellerroomProductListAjax")
    public ModelAndView sellerroomProductListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
	    ModelAndView mv = new ModelAndView("jsonView");
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        
        //사이즈 또는 색상 검색 파라미터
        commandMap.put("searchOptionYN", StringUtil.getString(commandMap.get("searchOptionYN"),"Y"));

        String sJsonArrSearchSize =  StringUtil.getString(commandMap.get("arrSearchSize"),"");
        String sJsonArrSearchColor =  StringUtil.getString(commandMap.get("arrSearchColor"),"");
        String sJsonArrSearchPrice =  StringUtil.getString(commandMap.get("arrSearchPrice"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        
        TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
        TypeReference<List<Map<String, Object>>> typeRefListMap = new TypeReference<List<Map<String, Object>>>(){};
        
        List<String> arrSearchSize = mapper.readValue(sJsonArrSearchSize, typeRef);
        List<String> arrSearchColor = mapper.readValue(sJsonArrSearchColor, typeRef);
        List<Map<String, Object>> arrSearchPrice = mapper.readValue(sJsonArrSearchPrice, typeRefListMap);
        
        commandMap.put("arrSearchSize", arrSearchSize);
        commandMap.put("arrSearchColor", arrSearchColor);
        commandMap.put("arrSearchPrice", arrSearchPrice);
        
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);
        
        //조회 정렬 조건이 없으면 기본값 최근 등록순
        if(StringUtil.isNullToString(commandMap.get("orderType")).equals(""))
        {
            commandMap.put("orderType","new");
        }
        
        
        
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        int totalCount = this.pcVendorTopSellerService.selectSellerShopProductListCount(commandMap);
        
        // 페이지 당 기본 기획전 출력 갯수
        //commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        //Paging paging = new Paging(totalCount, commandMap);
        
        commandMap.put("MEM_MST_ID", user.getMEM_MST_MEM_ID());
        List<Map<String,Object>> productList = this.pcVendorTopSellerService.selectSellerShopProductList(commandMap);
        
        
        //if(totalCount > 0){
        //    productList = this.pcVendorTopSellerService.selectSellerShopProductList(commandMap);
        //}

        mv.addObject("productList", productList);
        mv.addObject("totalCount", StringUtil.getString(totalCount));
        //mv.addObject("paging", paging);
        
        return mv;
    }
	
    
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomSellerPickList")
    public ModelAndView sellerroomSellerPickList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("BNR_MST_ENV" , Code.USER_ENV_TYPE_PC);
        commandMap.put("USER_ENV_TYPE" , Code.USER_ENV_TYPE_PC);
        commandMap.put("CMM_FLE_TB_TYPE" , Code.USER_ENV_TYPE_PC);

        
        Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);

        commandMap.put("BNR_MST_GBN" , sellerInfo.get("BND_MST_LAY_TPY")); 
        
        commandMap.put("CMN_COM_IDX" , "3616");
        commandMap.put("startNum" , 1);
        commandMap.put("endNum" , 3);

        List<Map<String, Object>> sellerpickBanner = this.pcVendorTopSellerService.selectRoomHomeBannerLIst(commandMap);
    	
        List<Map<String, Object>> sellerpickList = this.pcVendorTopSellerService.selectSellerpickList(commandMap);
        
    	mv.addObject("sellerInfo", sellerInfo);
    	mv.addObject("sellerpickList", sellerpickList);
        mv.addObject("sellerpickBanner", sellerpickBanner);
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomSellerPickView")
    public ModelAndView sellerroomSellerPickView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
    	
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("BNR_MST_ENV" , Code.USER_ENV_TYPE_PC);
        commandMap.put("USER_ENV_TYPE" , Code.USER_ENV_TYPE_PC);
        commandMap.put("CMM_FLE_TB_TYPE" , Code.USER_ENV_TYPE_PC);

        
        Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);

        Map<String, Object> sellerpickInfo = this.pcVendorTopSellerService.selectSellerpickInfo(commandMap);
        
        
    	mv.addObject("sellerInfo", sellerInfo);
    	mv.addObject("sellerpickInfo", sellerpickInfo);

    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
	@FrontBannerSkip()
	@RequestMapping(value="/pc/topseller/sellerroom/sellerroomSellerPickProductListAjax")
    public ModelAndView sellerroomSellerPickProductListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
	    ModelAndView mv = new ModelAndView("jsonView");
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        
        //사이즈 또는 색상 검색 파라미터
        commandMap.put("searchOptionYN", StringUtil.getString(commandMap.get("searchOptionYN"),"Y"));

        String sJsonArrSearchSize =  StringUtil.getString(commandMap.get("arrSearchSize"),"");
        String sJsonArrSearchColor =  StringUtil.getString(commandMap.get("arrSearchColor"),"");
        String sJsonArrSearchPrice =  StringUtil.getString(commandMap.get("arrSearchPrice"),"");
        
        ObjectMapper mapper = new ObjectMapper();
        
        TypeReference<List<String>> typeRef = new TypeReference<List<String>>(){};
        TypeReference<List<Map<String, Object>>> typeRefListMap = new TypeReference<List<Map<String, Object>>>(){};
        
        List<String> arrSearchSize = mapper.readValue(sJsonArrSearchSize, typeRef);
        List<String> arrSearchColor = mapper.readValue(sJsonArrSearchColor, typeRef);
        List<Map<String, Object>> arrSearchPrice = mapper.readValue(sJsonArrSearchPrice, typeRefListMap);
        
        commandMap.put("arrSearchSize", arrSearchSize);
        commandMap.put("arrSearchColor", arrSearchColor);
        commandMap.put("arrSearchPrice", arrSearchPrice);
        
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);
        

        if(StringUtil.isNullToString(commandMap.get("orderType")).equals(""))
        {
            commandMap.put("orderType","new");
        }
    
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        int totalCount = this.pcVendorTopSellerService.selectSellerpickProductListCount(commandMap);
        
        commandMap.put("MEM_MST_ID", user.getMEM_MST_MEM_ID());
        List<Map<String,Object>> productList = this.pcVendorTopSellerService.selectSellerpickProductList(commandMap);

        mv.addObject("productList", productList);
        mv.addObject("totalCount", StringUtil.getString(totalCount));
        
        return mv;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomLookBook")
    public ModelAndView sellerroomLookBook (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
    	List<Map<String, Object>> seasonList = this.pcVendorTopSellerService.selectSellerSeasonList(commandMap);
    	
    	Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);
    	mv.addObject("sellerInfo", sellerInfo);
    	
    	mv.addObject("seasonList", seasonList);
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomLookBookListAjax")
    public JSON sellerroomLookBookListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	   JSON json = new JSON();
           
           User user = SessionsUser.getSessionUser(request);
           commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
           commandMap.put("THUMBNAIL_SIZE", _DETAIL_IMAGE_SIZE_); // 썸네일 사이즈
           commandMap.put("CMM_FLE_TB_TYPE", Code.USER_ENV_TYPE_PC); //
           
           
           int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
           int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
           
           commandMap.put("startNum", offset); 
           commandMap.put("endNum", offset + pageSize - 1); 
           

           List<Map<String, Object>> list = this.pcVendorTopSellerService.selectSellerLookBookList(commandMap);
           
           json.put("list", list);
           
           return json;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomMedia")
    public ModelAndView sellerroomMedia (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
    	Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);
    	mv.addObject("sellerInfo", sellerInfo);
    	
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomMediaListAjax")
    public JSON sellerroomMediaListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	   JSON json = new JSON();
           
           User user = SessionsUser.getSessionUser(request);
           commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
           commandMap.put("THUMBNAIL_SIZE", _DETAIL_IMAGE_SIZE_); // 썸네일 사이즈
           commandMap.put("CMM_FLE_TB_TYPE", Code.USER_ENV_TYPE_PC); //
           
           
           int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
           int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
           
           commandMap.put("startNum", offset); 
           commandMap.put("endNum", offset + pageSize - 1); 
           
           
           List<Map<String, Object>> list = this.pcVendorTopSellerService.selectSellerMediaList(commandMap);
           
           json.put("list", list);
           
           return json;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomBrandInfo")
    public ModelAndView sellerroomBrandInfo (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
  

    	Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);
    	mv.addObject("sellerInfo", sellerInfo);    	

    	// 입점업체 매장 조회 리스트  : 입력값 - 도시코드, 이름 like 조회 필요
        List<Map<String, Object>> selShpList = this.pcVendorTopSellerService.selectSelShpList(commandMap);
    	
    	// 도시코드 콤보 조회 
    	commandMap.put("CMN_COM_IDX", Code.AREA_CD ); 
        mv.addObject("areaCode", this.pcVendorTopSellerService.selectSearchArea(commandMap) );
        mv.addObject("sel_shp_list", selShpList );
    	
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    @RequestMapping("/pc/topseller/sellerroom/sellerroomQna")
    public ModelAndView sellerroomQna (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	
    	Map<String, Object> sellerInfo = this.pcVendorTopSellerService.selectSellerInfo(commandMap);
    	mv.addObject("sellerInfo", sellerInfo);
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
    
    
    
	@FrontBannerSkip()
	@RequestMapping(value="/pc/topseller/sellerroom/sellerroomQnaListAjax.do")
    public JSON sellerroomQnaListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);
     	

		commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());
        int totalCount = this.pcVendorTopSellerService.selectSellerQnaListCount(commandMap);
        
        
		int pageSize = 5;
		int startNum = commandMap.containsKey("offset") ? Integer.parseInt(commandMap.get("offset").toString()) : 1;
		int endNum = startNum + pageSize - 1;
		
        commandMap.put("startNum", startNum);
        commandMap.put("endNum", endNum);

        List<Map<String, Object>> listProductQna = this.pcVendorTopSellerService.selectSellerQnaList(commandMap);
        
 
        
        json.put("list", listProductQna);
        json.put("tot_count", totalCount + "");
        
        return json;
    }
	
	@FrontBannerSkip()
	@RequestMapping(value="/pc/topseller/sellerroom/sellerroomQnaDeleteAjax.do")
    public JSON sellerroomQnaDeleteAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);
     	
        // 상품 리뷰 관리 목록 갯수
        commandMap.put("BRD_INQ_IDX",commandMap.get("brdInqIdx"));
		
        int delQnaCnt = this.pcVendorTopSellerService.deleteSellerQna(commandMap);
        
        if( delQnaCnt > 0)
        {
            json.put("resultYn", "Y");
        }
        else
        {
            json.put("resultYn", "N");
        }
        
        return json;
    }
	
	@FrontBannerSkip()
	@RequestMapping(value="/pc/topseller/sellerroom/sellerroomQnaInfoAjax.do")
    public JSON sellerroomQnaInfoAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);

		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());

        json.put("info", this.pcVendorTopSellerService.selectSellerQnaInfo(commandMap));
        
        return json;
    }
	
	
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/topseller/sellerroom/sellerroomQnaRegistAjax.do")
	public JSON sellerroomQnaRegistAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{

 		JSON json = new JSON();
 		User user = SessionsUser.getSessionUser(request);
 		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
 		commandMap.put("BRD_INQ_REG_NM",SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
 		
    	commandMap.put("BRD_INQ_TYPE","S");
    	
    	commandMap.put("BRD_INQ_PUB_YN", StringUtil.getString(commandMap.get("BRD_INQ_PUB_YN"), "Y"));
    	String BRD_INQ_IDX = StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "");
    	String VDR_MST_IDX = StringUtil.getString(commandMap.get("VDR_MST_IDX"), "");
    	
    	String contents = commandMap.get("BRD_INQ_CONTENTS").toString();
    	contents = contents.replaceAll("\r\n", "<br>");
    	commandMap.put("BRD_INQ_CONTENTS", contents);
    	
    	if(StringUtils.isNotEmpty(VDR_MST_IDX)) {
        	int result = 0;
        	if(BRD_INQ_IDX != ""){
        		result = this.pcVendorTopSellerService.updateSellerQna(commandMap);
        	}else{
        		// 상품평 작성.
                result = this.pcVendorTopSellerService.insertSellerQna(commandMap);
        	}
            
            // view Page Info

            if(result > 0)
            {
            	json.put("result", "SUCCESS");

            }
            else
            {
            	json.put("result", "FAIL");
            }
    	} else {
    		json.put("result", "FAIL");
    	}

        
        return json;
      
	}	
}
