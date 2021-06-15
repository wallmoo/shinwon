package com.market.mall.mobile.vendor.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.vendor.service.VendorTopSellerService;

@Controller("mobileTopSellerController")
public class VendorTopSellerController {
	
    
    @Resource(name = "pcCommonService")
    private CommonService pcCommonService;
    
    @Resource(name = "pcVendorTopSellerService")
    private VendorTopSellerService pcVendorTopSellerService;

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG;
	
	 /**
     * @api {GET} /mobile/topseller/topsellerMain.do
     * @apiName 탑셀러 메인회면
     * @apiGroup Mobile 탑셀러
     *
     * @apiSuccess {Object[]} topBannerList 상단 배너 리스트  [{topProductList=[{PRD_MST_CD = 상품코드1, IMG_THUMBNAIL = 상품썸네일1, CMM_FLE_ALT_TXT = 대체텍스트 },{PRD_MST_CD = 상품코드2, IMG_THUMBNAIL = 상품썸네일2 , CMM_FLE_ALT_TXT = 대체텍스트 }] ,BND_MST_SEL_NM = 셀러이름, BND_MST_SEL_DESC = 셀러안내텍스트, SELLER_IMG=셀러이미지, LIKE_COUNTS = 셀러 좋아요수, MY_LIKE=좋아요여부, BND_MST_IDX=셀러IDX, TAG_LIST=[{TAG_MST_TITLE=태그 타이틀1}, {TAG_MST_TITLE=태그 타이틀2}] }]
     * @apiSuccess {Object[]} bottomBannerList 하단 배너 리스트  [{bottomProductList = [{PRD_MST_CD = 상품코드1, IMG_THUMBNAIL = 상품썸네일1, CMM_FLE_ALT_TXT = 대체텍스트 },{PRD_MST_CD = 상품코드2, IMG_THUMBNAIL = 상품썸네일2, CMM_FLE_ALT_TXT = 대체텍스트 }], BND_MST_SEL_NM = 셀러이름, BND_MST_SEL_DESC = 셀러안내텍스트, SELLER_IMG=셀러이미지, LIKE_COUNTS = 셀러 좋아요수, MY_LIKE=좋아요여부, BND_MST_IDX=셀러IDX, TAG_LIST=[{TAG_MST_TITLE=태그 타이틀1}, {TAG_MST_TITLE=태그 타이틀2}] }]
     */
    @RequestMapping("/mobile/topseller/topsellerMain")
    public ModelAndView topsellerMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_TOP_SELLER_BANNER_UP);
        
        List<Map<String,Object>> topBannerList = pcVendorTopSellerService.selectTopBannerList(commandMap);
        List<Map<String,Object>> bottomBannerList = pcVendorTopSellerService.selectBottomBannerList(commandMap);
        
        mv.addObject("topBannerList", topBannerList);
        mv.addObject("bottomBannerList", bottomBannerList);
        return mv;
    }
    
    /**
    * @api {POST} /mobile/topseller/topsellerProductAjax.do
    * @apiName 탑셀러 상품 Ajax
    * @apiGroup Mobile 탑셀러
    *
    * @apiParam {Integer} cPage 현재페이지
    *
    * @apiSuccess {Object[]} sellerProductList 탑셀러 상품 목록  [{PRD_IMAGE = 셀러등록최신상품이미지, PRD_IMAGE_ALT=대체텍스트,  PRD_MST_CD=셀러상품코드, BND_MST_SEL_NM = 셀러이름, BND_MST_SEL_DESC = 셀러소개, SELLER_IMG=셀러이미지, LIKE_COUNTS = 셀러 좋아요수, MY_LIKE=좋아요여부, BND_MST_IDX=셀러IDX } ]
    */
    @RequestMapping("/mobile/topseller/topsellerProductAjax")
    public JSON topsellerProductAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
       
        JSON json = new JSON();
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        commandMap.put("THUMBNAIL_SIZE", _DETAIL_IMAGE_SIZE_); // 썸네일 사이즈
        commandMap.put("CNT_MST_TYPE", CONTENTS_TYPE_CODE.TYPE_SELLER_ROOM); // 좋아요 타입
        
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        int totalCount = this.pcVendorTopSellerService.selectSellerProductListCount(commandMap);
        Paging paging   = new Paging(totalCount, commandMap);
        
        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0){
            list = this.pcVendorTopSellerService.selectSellerProductList(commandMap);
        }

        json.put("sellerProductList", list);
        
        return json;
    }
    
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomHome")
    public ModelAndView sellerroomHome (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        return mv;
    }
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomShop")
    public ModelAndView sellerroomShop (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	return mv;
    }
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomSellerPickList")
    public ModelAndView sellerroomSellerPickList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	return mv;
    }
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomLookBook")
    public ModelAndView sellerroomLookBook (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	return mv;
    }
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomMedia")
    public ModelAndView sellerroomMedia (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	return mv;
    }
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomBrandInfo")
    public ModelAndView sellerroomBrandInfo (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	return mv;
    }
    
    @RequestMapping("/mobile/topseller/sellerroom/sellerroomQna")
    public ModelAndView sellerroomQna (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	
    	ModelAndView mv = new ModelAndView();
    	return mv;
    }
    
    
}
