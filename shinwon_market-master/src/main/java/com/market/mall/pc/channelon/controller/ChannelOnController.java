package com.market.mall.pc.channelon.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.channelon.service.ChannelOnService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.tag.service.TagService;

@Controller("pcChannelOnController")
public class ChannelOnController {
	
    @Resource(name="productListService")    
    private ProductListService productListService;

    @Resource(name="pcChannelOnService")
    private ChannelOnService pcChannelOnService;
    
    @Resource(name = "pcCommonService")
    private CommonService pcCommonService;
    
    @Autowired
    TagService tagService;
	
	private final static int _PLAN_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST; 
	private final static int _PLAN_THUMBNAIL_SIZE_BIG = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG; 
	
	
	/**
	 * @api {POST} /pc/channelon/channelonList.do 
	 * @apiName 채널온 메인화면
	 * @apiGroup 채널온
	 * 
	 * @apiParam {Integer} cPage 현재 페이지
	 * 
	 * @apiSuccess {Object[]} toplist 채널온 상단 영상 목록 [{BNR_MST_URL = https://youtu.be/OxDF2uhgSKg , FILE_NM = /attach/display/2019/12/06/a17f416a-492f-41f7-9e5c-fbb7815ca8c6.jpg, CMN_FLE_ALT_TXT = 대체텍스트, BNR_MST_TITLE=채널온상단배너영상, BNR_MST_DESC=상세문구, RNUM = 1}]
	 */
	@RequestMapping("/pc/channelon/channelonList")
    public ModelAndView channelonList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_CHANNEL_ON_BANNER);
        commandMap.put("BNR_MST_ENV", Code.USER_ENV_TYPE_PC);// PC 배너
        
        // 상단 채널온 배너 리스트
        mv.addObject("toplist",  this.pcChannelOnService.selectChannelOnBannerList(commandMap));
        
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        mv.addObject("listGnbMenu",  this.pcChannelOnService.selectUpCategoryList(commandMap));
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
	
    /**
     * @api {POST} /pc/channelon/channelonListAjax.do
     * @apiName 채널온 목록  ajax
     * @apiGroup 채널온
     *
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} PRD_CTG_IDX 탭 카테고리 idx
     * @apiParam {String} orderType (최신등록 : CNT_MST_REG_DT, 시즌별: CNT_MST_SEASON, 조회수 : CNT_MST_HIT_CNT) / {orderType = CNT_MST_REG_DT} 
     *
     * @apiSuccess {Object[]} list 채널온 목록 [{RNUM=1, CNT_MST_DESC=채널ON영상 안내문구, CNT_MST_URL=https://www.youtube.com/watch?v=9ju58Kmy-zw, LIKE_COUNTS=0, CNT_MST_TITLE=채널ON영상, MY_LIKE=N, CNT_MST_IDX=20, CNT_MST_DETAIL_TYPE=I}, {RNUM=2, CNT_MST_DESC=안내문구, CNT_MST_URL=https://www.youtube.com/watch?v=F9Ex1ESEWN4, LIKE_COUNTS=0, CNT_MST_TITLE=채널ON, MY_LIKE=N, CNT_MST_IDX=21, CNT_MST_DETAIL_TYPE=I}, {RNUM=3, CNT_MST_DESC=유형추가, CNT_MST_URL=https://www.youtube.com/watch?v=yni45ID2qCc, LIKE_COUNTS=0, CNT_MST_TITLE=채널ON유형, MY_LIKE=N, CNT_MST_IDX=24, CNT_MST_DETAIL_TYPE=I}, {RNUM=4, CNT_MST_DESC=ㅠㅠ, CNT_MST_URL=https://www.youtube.com/watch?v=yni45ID2qCc, LIKE_COUNTS=0, CNT_MST_TITLE=여성, MY_LIKE=N, CNT_MST_IDX=25, CNT_MST_DETAIL_TYPE=I}, {RNUM=5, CNT_MST_DESC=여성, CNT_MST_URL=https://www.youtube.com/watch?v=yni45ID2qCc, LIKE_COUNTS=0, CNT_MST_TITLE=여성카테고리, MY_LIKE=N, CNT_MST_IDX=26, CNT_MST_DETAIL_TYPE=I}, {RNUM=6, CNT_MST_DESC=여성여성, CNT_MST_URL=https://www.youtube.com/watch?v=yni45ID2qCc, LIKE_COUNTS=0, CNT_MST_TITLE=여성여성, MY_LIKE=N, CNT_MST_IDX=27, CNT_MST_DETAIL_TYPE=I}]
     */
	@FrontBannerSkip()
    @RequestMapping("/pc/channelon/channelonListAjax")
    public JSON channelonListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        JSON json = new JSON();

        commandMap.put("ENV_TYPE", "P");//PC 채널
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //채널온 타입
        
 
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        // 페이지 당 기본 기획전 출력 갯수
        //commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        //int totalCount  = this.pcChannelOnService.selectChannelOnCount(commandMap);
        //Paging paging   = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = this.pcChannelOnService.selectChannelOnList(commandMap);

        //if(totalCount > 0){
            // 채널온 목록
        //    list = this.pcChannelOnService.selectChannelOnList(commandMap);
        //}
        //json.put("totalCount", StringUtil.getString(totalCount));
        json.put("list", list);
        
        return json;
    }
	
	
    /**
     * @api {POST} /pc/channelon/channelonView.do
     * @apiName 채널온 상세화면
     * @apiGroup 채널온
     * 
     * @apiParam {String} CNT_MST_IDX 채널온 idx
     * 
     * @apiSuccess {Object[]} colorList 컬러리스트 [{CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1039, CMN_COM_LEVEL=2, CMN_COM_ETC3=946, CMN_COM_NM=BLACK, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054049, CMN_COM_SORT=89, CMN_COM_ETC2=#000000, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=BK}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1142, CMN_COM_LEVEL=2, CMN_COM_ETC3=935, CMN_COM_NM=WHITE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054103, CMN_COM_SORT=192, CMN_COM_ETC2=#ffffff, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=WH}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014424, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3009, CMN_COM_LEVEL=2, CMN_COM_NM=CARNATION, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014817, CMN_COM_SORT=200, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CA}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014505, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3010, CMN_COM_LEVEL=2, CMN_COM_NM=TEXAS ROSE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014829, CMN_COM_SORT=201, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#febf4e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=TR}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014544, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3011, CMN_COM_LEVEL=2, CMN_COM_NM=MUSTARD, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014841, CMN_COM_SORT=202, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fee24e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MU}, {CMN_COM_IDX=3012, CMN_COM_LEVEL=2, CMN_COM_NM=BARLEY WHITE, CMN_COM_REG_DT=20200302014905, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=203, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_ETC1=BA, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3013, CMN_COM_LEVEL=2, CMN_COM_NM=OCEAN GREEN, CMN_COM_REG_DT=20200302014943, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=204, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#40ba87, CMN_COM_ETC1=OC, CMN_COM_REG_ID=admin}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014958, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3014, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015523, CMN_COM_SORT=205, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5ff2f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015016, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3015, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015515, CMN_COM_SORT=206, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5fb1f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015032, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3016, CMN_COM_LEVEL=2, CMN_COM_NM=CORNFLOWER BLUE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015536, CMN_COM_SORT=207, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5f71f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CB}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015046, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3017, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM PURPLE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015502, CMN_COM_SORT=208, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#a55ce9, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MP}, {CMN_COM_IDX=3018, CMN_COM_LEVEL=2, CMN_COM_NM=SILVER CHALICE, CMN_COM_REG_DT=20200302020628, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=209, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#acacac, CMN_COM_ETC1=SC, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3019, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM RED VIOLET, CMN_COM_REG_DT=20200302020915, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=210, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#cc33a3, CMN_COM_ETC1=MV, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object[]} tagList 태그 리스트 [{TAG_MST_TITLE = #카디건}, {TAG_MST_TITLE = #오버핏}]
     * @apiSuccess {Object[]} channelOnInfo 채널온 기본 정보 {CNT_MST_DESC=안내문구, CNT_MST_TYPE=TYPE_CHANNEL_ON, CNT_MST_TITLE=채널ON, CMM_FLE_ATT_PATH=/attach/default/2020/02/26/, CNT_MST_ST_DT=20200227, CNT_MST_ED_DT=20200326, CNT_MST_PC_BANNER=<p>&nbsp;</p>, CNT_MST_USE_YN=Y, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=4dc3e228-51c4-4f9b-99c6-c5d6c1fa37bf.jpeg, CNT_MST_IDX=21, CNT_MST_MOBILE_BANNER=<p>&nbsp;</p>, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_PRD_DPL_YN=Y, CNT_MST_DETAIL_TYPE=I}
     */
    @RequestMapping("/pc/channelon/channelonView")
    public ModelAndView channelonView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("CMM_FLE_TB_NM",     "T_CNT_MST");//PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE",   "P"); //PC용 이미지
        commandMap.put("CMM_FLE_SORT",      "1"); //PC용 목록 이미지
        commandMap.put("PRD_CTG_ENV", "P");
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //채널온 타입
        commandMap.put(TAG_MODEL.TAG_BND_ID,  StringUtil.getString(commandMap.get("CNT_MST_IDX"), ""));
        commandMap.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON);
        
        List<Map<String,Object>> tagList = tagService.selectTagListById(commandMap);
        
        Map<String, Object> channelOnInfo = this.pcChannelOnService.selectChannelOnInfo(commandMap);
        
        mv.addObject("tagList", tagList);
        mv.addObject("channelOnInfo", channelOnInfo);
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));
        return mv;
    }
    
    /**
     * @api {POST} /pc/channelon/channelonProductAjax.do  
     * @apiName 채널온 상세화면 상품 ajax
     * @apiGroup 채널온
     * 
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} CNT_MST_IDX 채널온 idx
     * 
     * @apiSuccess {Object[]} channelOnProductList 채널온 상품 목록 [{"CNT_PRD_COLOR":[{"CNT_PRD_COLOR":"#b8860b","CMN_COM_NM":"노란색(임시)"},{"CNT_PRD_COLOR":"#f4a460","CMN_COM_NM":"빨간색(임시)"},{"CNT_PRD_COLOR":"#faf080","CMN_COM_NM":"라임색(임시)"}],"PRD_MST_SEL_CNT":1,"IMG_THUMBNAIL_BIG":"/pc/img/second/NoImage_250.jpg","PRD_MST_DSP_PRC":110000000,"REP_STAR":0,"CNT_DTL_ORDER":0,"RNK":1,"LIKE_COUNT":1,"RNK_NUM":1,"IMG_THUMBNAIL":"/pc/img/second/NoImage_250.jpg","REP_POINT_GRD":"00","REP_CNT":0,"RNK_GB":"a","REP_POINT":"00","PRD_MST_PRC":110000000,"PRD_MST_NM_SUB":"[올리브영] 수발이랑놀자","PRD_MST_SEL_STATE":"T","PRD_MST_CNL_PC_YN":"Y","PRD_MST_NM":"수발이랑놀자","RNUM":1,"PRD_SALE_RATE":0,"CNT_GRP_IDX":14,"MY_LIKE":"N","CNT_PRD_MST_CD":"S0011953","PRD_MST_BRAND_NM":"올리브영","PRD_MST_CNL_MB_YN":"N","CNT_PRD_PRICE":110000000,"PRD_MST_ICON_LIST":"<span class=\"ico_coupon\"><span class=\"ir\">쿠폰할인<\/span><\/span> ;"},{"CNT_PRD_COLOR":[{"CNT_PRD_COLOR":"#facf0e","CMN_COM_NM":"오렌지색(임시)"},{"CNT_PRD_COLOR":"#d3d3d3","CMN_COM_NM":"검정색(임시)"},{"CNT_PRD_COLOR":"#f4a460","CMN_COM_NM":"빨간색(임시)"}],"PRD_MST_SEL_CNT":222,"IMG_THUMBNAIL_BIG":"/pc/img/second/NoImage_250.jpg","PRD_MST_DSP_PRC":1000000,"REP_STAR":0,"CNT_DTL_ORDER":0,"RNK":2,"LIKE_COUNT":0,"RNK_NUM":2,"IMG_THUMBNAIL":"/pc/img/second/NoImage_250.jpg","REP_POINT_GRD":"00","REP_CNT":0,"RNK_GB":"b","REP_POINT":"00","PRD_MST_PRC":1000000,"PRD_MST_NM_SUB":"[올리브영] 패키지 테스트1","PRD_MST_SEL_STATE":"I","PRD_MST_CNL_PC_YN":"Y","PRD_MST_NM":"패키지 테스트1","RNUM":3,"PRD_SALE_RATE":0,"CNT_GRP_IDX":14,"MY_LIKE":"N","CNT_PRD_MST_CD":"S0011951","PRD_MST_BRAND_NM":"올리브영","PRD_MST_CNL_MB_YN":"Y","CNT_PRD_PRICE":1000000},{"CNT_PRD_COLOR":[{"CNT_PRD_COLOR":"#f4a460","CMN_COM_NM":"빨간색(임시)"},{"CNT_PRD_COLOR":"#ffffff","CMN_COM_NM":"하얀색(임시)"},{"CNT_PRD_COLOR":"#f4a460","CMN_COM_NM":"빨간색(임시)"}],"PRD_MST_SEL_CNT":22222,"IMG_THUMBNAIL_BIG":"/pc/img/second/NoImage_250.jpg","PRD_MST_DSP_PRC":99999999,"REP_STAR":0,"CNT_DTL_ORDER":0,"RNK":3,"LIKE_COUNT":0,"RNK_NUM":3,"IMG_THUMBNAIL":"/pc/img/second/NoImage_250.jpg","REP_POINT_GRD":"00","REP_CNT":0,"RNK_GB":"a","REP_POINT":"00","PRD_MST_PRC":99999999,"PRD_MST_NM_SUB":"[올리브영] 묶음상품 테스트 1","PRD_MST_SEL_STATE":"O","PRD_MST_CNL_PC_YN":"Y","PRD_MST_NM":"묶음상품 테스트 1","RNUM":2,"PRD_SALE_RATE":0,"CNT_GRP_IDX":14,"MY_LIKE":"N","CNT_PRD_MST_CD":"S0011952","PRD_MST_BRAND_NM":"올리브영","PRD_MST_CNL_MB_YN":"N","CNT_PRD_PRICE":99999999}]}
     */
    @FrontBannerSkip()
    @RequestMapping("/pc/channelon/channelonProductAjax")
    public JSON channelonProductAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        JSON json = new JSON();

        commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");       //PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", "P");             //PC용 이미지
        commandMap.put("CMM_FLE_SORT", "1");
        commandMap.put("ENV_TYPE", "P");                //PC 채널
        
        commandMap.put("IMG_THUMBNAIL_SIZE",        Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_CHANNEL_ON); //채널온 타입
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
        
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "16"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 
        
        // 페이지 당 기본 기획전 출력 갯수
        //commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));

        //int totalCount  = this.pcChannelOnService.selectChannelOnCount(commandMap);
        //Paging paging   = new Paging(totalCount, commandMap); 

        List<Map<String, Object>> channelOnProductList = this.pcChannelOnService.selectChannelOnProductList(commandMap);
        //if(totalCount > 0){
            // 채널온 상품 목록
        //    channelOnProductList = this.pcChannelOnService.selectChannelOnProductList(commandMap);
        //}
        //json.put("totalCount", StringUtil.getString(totalCount));
        json.put("list", channelOnProductList);
        
        return json;
    }

}
