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
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.vendor.service.VendorSellerPickService;

@Controller("mobileVendorSellerPickController")
public class VendorSellerPickController {
	
    
    @Resource(name="pcVendorSellerPickService")
    VendorSellerPickService pcVendorSellerPickService;
    
    @Resource(name = "pcCommonService")
    private CommonService pcCommonService;

	
	 /**
     * @api {POST} /mobile/sellerpick/sellerPickList.do
     * @apiName 셀러픽 메인화면
     * @apiGroup Mobile 셀러픽
     *
     * @apiSuccess {Object[]} toplist 셀러픽 상단 썸네일 목록 [{FILE_NM = /attach/display/2019/12/06/a17f416a-492f-41f7-9e5c-fbb7815ca8c6.jpg, CMN_FLE_ALT_TXT = 대체텍스트, BNR_MST_TITLE=셀러픽 상단 배너 이미지1, BNR_MST_DESC=상세문구1, RNUM = 1},{FILE_NM = /attach/display/2019/12/06/a17f416a-492f-41f7-9e5c-fbb7815ca8c6.jpg, CMN_FLE_ALT_TXT = 대체텍스트2, BNR_MST_TITLE=셀러픽 상단 배너 이미지2, BNR_MST_DESC=상세문구2, RNUM = 2}]
     */
    @RequestMapping("/mobile/sellerpick/sellerPickList")
    public ModelAndView sellerPickList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_SELLER_PICK_BANNER);
        commandMap.put("BNR_MST_ENV", "P");
        // 상단 셀러픽 배너 리스트
        mv.addObject("toplist",  this.pcVendorSellerPickService.selectSellerPickBannerList(commandMap));
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    /**
     * @api {POST} /mobile/sellerpick/sellerpickView.do
     * @apiName 셀러픽 상세화면
     * @apiGroup Mobile 셀러픽
     *
     * @apiParam {String} CNT_MST_IDX 셀러픽 idx
     *
     * @apiSuccess {Object[]} sizeList 사이즈 [{CMN_COM_IDX=2997, CMN_COM_LEVEL=2, CMN_COM_NM=XS, CMN_COM_REG_DT=20200302010708, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=1, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XS, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2998, CMN_COM_LEVEL=2, CMN_COM_NM=S, CMN_COM_REG_DT=20200302010733, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=2, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=S, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=2999, CMN_COM_LEVEL=2, CMN_COM_NM=M, CMN_COM_REG_DT=20200302010745, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=3, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=M, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3000, CMN_COM_LEVEL=2, CMN_COM_NM=L, CMN_COM_REG_DT=20200302010755, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=4, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=L, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3001, CMN_COM_LEVEL=2, CMN_COM_NM=XL, CMN_COM_REG_DT=20200302010803, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=5, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XL, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3002, CMN_COM_LEVEL=2, CMN_COM_NM=XXL, CMN_COM_REG_DT=20200302010816, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=2996, CMN_COM_TOP_IDX=10, CMN_COM_SORT=6, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=XXL, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object[]} colorList 컬러리스트 [{CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1039, CMN_COM_LEVEL=2, CMN_COM_ETC3=946, CMN_COM_NM=BLACK, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054049, CMN_COM_SORT=89, CMN_COM_ETC2=#000000, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=BK}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20150514135525, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=1142, CMN_COM_LEVEL=2, CMN_COM_ETC3=935, CMN_COM_NM=WHITE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302054103, CMN_COM_SORT=192, CMN_COM_ETC2=#ffffff, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=WH}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014424, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3009, CMN_COM_LEVEL=2, CMN_COM_NM=CARNATION, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014817, CMN_COM_SORT=200, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CA}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014505, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3010, CMN_COM_LEVEL=2, CMN_COM_NM=TEXAS ROSE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014829, CMN_COM_SORT=201, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#febf4e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=TR}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014544, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3011, CMN_COM_LEVEL=2, CMN_COM_NM=MUSTARD, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302014841, CMN_COM_SORT=202, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fee24e, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MU}, {CMN_COM_IDX=3012, CMN_COM_LEVEL=2, CMN_COM_NM=BARLEY WHITE, CMN_COM_REG_DT=20200302014905, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=203, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#fff5c7, CMN_COM_ETC1=BA, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3013, CMN_COM_LEVEL=2, CMN_COM_NM=OCEAN GREEN, CMN_COM_REG_DT=20200302014943, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=204, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#40ba87, CMN_COM_ETC1=OC, CMN_COM_REG_ID=admin}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302014958, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3014, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015523, CMN_COM_SORT=205, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5ff2f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015016, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3015, CMN_COM_LEVEL=2, CMN_COM_NM=MALIBU, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015515, CMN_COM_SORT=206, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5fb1f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=ML}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015032, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3016, CMN_COM_LEVEL=2, CMN_COM_NM=CORNFLOWER BLUE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015536, CMN_COM_SORT=207, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#5f71f7, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=CB}, {CMN_COM_UPD_ID=admin, CMN_COM_REG_DT=20200302015046, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_REG_ID=admin, CMN_COM_IDX=3017, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM PURPLE, CMN_COM_USE_YN=Y, CMN_COM_UPD_DT=20200302015502, CMN_COM_SORT=208, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#a55ce9, CMN_COM_UPD_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC1=MP}, {CMN_COM_IDX=3018, CMN_COM_LEVEL=2, CMN_COM_NM=SILVER CHALICE, CMN_COM_REG_DT=20200302020628, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=209, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#acacac, CMN_COM_ETC1=SC, CMN_COM_REG_ID=admin}, {CMN_COM_IDX=3019, CMN_COM_LEVEL=2, CMN_COM_NM=MEDIUM RED VIOLET, CMN_COM_REG_DT=20200302020915, CMN_COM_USE_YN=Y, CMN_COM_UP_IDX=950, CMN_COM_TOP_IDX=10, CMN_COM_SORT=210, CMN_COM_REG_IP=0:0:0:0:0:0:0:1, CMN_COM_ETC2=#cc33a3, CMN_COM_ETC1=MV, CMN_COM_REG_ID=admin}]
     * @apiSuccess {Object} sellerpickInfo 셀러픽 상세 정보  {TOTAL_COUNTS=4, MY_LIKE=N, LIKE_COUNT=1, CNT_MST_DESC=ㅠ, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=나울어, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_PC_BANNER=<p>&nbsp;</p>, CNT_MST_USE_YN=Y, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=ad2abadf-6f9b-47b5-b66f-2ebe16eb8850.jpeg, CMN_FLE_ALT_TXT=ㅠ, CNT_MST_IDX=15, CNT_MST_MOBILE_BANNER=<p>&nbsp;</p>, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_PRD_DPL_YN=Y, CNT_MST_DETAIL_TYPE=I}
     */
    @RequestMapping("/mobile/sellerpick/sellerpickView")
    public ModelAndView sellerpickView (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("CMM_FLE_TB_NM",     "T_CNT_MST");//PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE",   "M"); //PC용 이미지
        commandMap.put("CMM_FLE_SORT",      "2"); //PC용 목록 이미지
        commandMap.put("PRD_CTG_ENV", "P");
        
        commandMap.put("IMG_THUMBNAIL_SIZE",        Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK); //셀러픽 타입
        
        //셀러픽 상세 정보
        Map<String,Object> sellerpickInfo = pcVendorSellerPickService.selectSellerPickInfo(commandMap);
        
        mv.addObject("sizeList", this.pcCommonService.selectCode("COMMON_PRODUCT_SIZE"));
        mv.addObject("colorList", this.pcCommonService.selectCode("COMMON_PRODUCT_COLOR"));
        mv.addObject("sellerpickInfo", sellerpickInfo);
       
        return mv;
    }
    
    /**
     * @api {POST} /mobile/sellerpick/sellerpickProductAjax.do
     * @apiName 셀러픽 상세화면 상품 ajax
     * @apiGroup Mobile 셀러픽
     *
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} CNT_MST_IDX 셀러픽 idx
     * @apiParam {String} orderType ( regDate : 최근등록순, lowPrice:가격낮은순 , highPrice: 가격높은순,  sales : 판매량 많은순, review :리뷰 많은순 )
     * @apiParam {String} searchSize 사이즈 (XS:2997, S:2998 , M:2999, L:3000 , XL:3001 ,XXL:3002) / searchSize = [2997, 2998, 2999]
     * @apiParam {String} searchPrice 가격  (startPrice = 최저가(이상), endPrice = 최고가(이하)) / {startPrice = 10000}, {endPrice = 30000} 
     * @apiParam {String} searchColor 색상  (CARNATION : 3009, TEXAS ROSE : 3010, MUSTARD : 3011, BARLEY WHITE : 3012, OCEAN GREEN : 3013, MALIBU : 3015, MALIBU : 3014, CORNFLOWER BLUE : 3016, MEDIUM PURPLE : 3017,  MEDIUM RED VIOLET : 3019, SILVER CHALICE : 3018, WHITE : 1142, BLACK : 1039) / searchColor = [3018,1142,1039]
     *  
     * @apiSuccess {Object[]} sellerpickProductList 셀러픽 상품 목록[{CNT_PRD_COLOR=[{CNT_PRD_COLOR=#d3d3d3, CMN_COM_NM=검정색(임시)}], TAG_MST_TITLE="#미세먼지", TAG_MST_ID="f41f94a4-09bd-42f4-9438-1637546b6601" , PRD_MST_SEL_CNT=1, IMG_THUMBNAIL_BIG=/mobile/img/second/NoImage_250.jpg, PRD_MST_DSP_PRC=110000000, REP_STAR=0, CNT_DTL_ORDER=0, RNK=1, LIKE_COUNT=1, RNK_NUM=1, IMG_THUMBNAIL=/mobile/img/second/NoImage_250.jpg, REP_POINT_GRD=00, REP_CNT=0, RNK_GB=a, REP_POINT=00, PRD_MST_PRC=110000000, PRD_MST_NM_SUB=[올리브영] 수발이랑놀자, PRD_MST_SEL_STATE=T, PRD_MST_CNL_PC_YN=Y, PRD_MST_NM=수발이랑놀자, RNUM=2, PRD_SALE_RATE=0, CNT_GRP_IDX=10, MY_LIKE=N, CNT_PRD_MST_CD=S0011953, PRD_MST_BRAND_NM=올리브영, PRD_MST_CNL_MB_YN=N, CNT_PRD_PRICE=110000000, PRD_MST_ICON_LIST=<span class="ico_coupon"><span class="ir">쿠폰할인</span></span> ;}, {CNT_PRD_COLOR=[{CNT_PRD_COLOR=#f4a460, CMN_COM_NM=빨간색(임시)}, {CNT_PRD_COLOR=#d3d3d3, CMN_COM_NM=검정색(임시)}], TAG_MST_TITLE="#미세먼지", TAG_MST_ID="f41f94a4-09bd-42f4-9438-1637546b6601" , PRD_MST_SEL_CNT=10, IMG_THUMBNAIL_BIG=/attach/product/2019/12/02/S0011954/S0011954_0_500.jpg, PRD_MST_DSP_PRC=8508, REP_STAR=0, CNT_DTL_ORDER=0, RNK=2, LIKE_COUNT=2, RNK_NUM=2, IMG_THUMBNAIL=/attach/product/2019/12/02/S0011954/S0011954_0_250.jpg, REP_POINT_GRD=00, REP_CNT=0, RNK_GB=b, REP_POINT=00, PRD_MST_PRC=10010, PRD_MST_NM_SUB=[올리브영] [OnlineExclusive] 블랙 벨트포인트 덕다운 패딩 , PRD_MST_SEL_STATE=I, PRD_MST_CNL_PC_YN=Y, PRD_MST_NM=[OnlineExclusive] 블랙 벨트포인트 덕다운 패딩 , RNUM=1, PRD_SALE_RATE=15, CNT_GRP_IDX=10, MY_LIKE=N, CNT_PRD_MST_CD=S0011954, PRD_MST_BRAND_NM=올리브영, PRD_MST_CNL_MB_YN=N, CNT_PRD_PRICE=8508, PRD_MST_ICON_LIST=<span class="ico_sale"><span class="ir">즉시할인</span></span> ;<span class="ico_free"><span class="ir">무료배송</span></span> ;<span class="ico_card"><span class="ir">카드할인</span></span> ;}]
     */
    @RequestMapping("/mobile/sellerpick/sellerpickProductAjax")
    public JSON sellerpickProductAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        JSON json = new JSON();
        
        commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("CMM_FLE_TB_NM",     "T_CNT_MST");//PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE",   "P"); //PC용 이미지
        commandMap.put("CMM_FLE_SORT",      "1"); //PC용 목록 이미지
        commandMap.put("PRD_CTG_ENV", "P");
        
        commandMap.put("IMG_THUMBNAIL_SIZE",        Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK); //셀러픽 타입
        
        
        // 페이지 당 기본 기획전 출력 갯수
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        int totalCount = this.pcVendorSellerPickService.selectContentProductListCount(commandMap);
        Paging paging   = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> sellerpickProductList = null;
        
        if(totalCount > 0){
            sellerpickProductList = this.pcVendorSellerPickService.selectSellerPickProductList(commandMap);
        }
        
        json.put("totalCount", StringUtil.getString(totalCount));
        json.put("sellerpickProductList", sellerpickProductList);

        return json;
    }
    
    /**
     * @api {POST} /mobile/sellerpick/sellerPickListAjax.do
     * @apiName 셀러픽 목록  ajax
     * @apiGroup Mobile 셀러픽
     *
     * @apiParam {Integer} cPage 현재 페이지  
     *  
     * @apiSuccess {Object[]} list 셀러픽 목록 [{CNT_MST_DESC=셀러픽안내문구, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=픽미픽미, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=1, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=de082804-9c7e-4ed8-b709-e46a6c971a03.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225053544, MY_LIKE=N, CNT_MST_IDX=6, CMN_FLE_ALT_TXT=PC목록이미지, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=2, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=fad638b0-6282-483d-b4ac-5717bb92d4c6.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225071649, MY_LIKE=N, CNT_MST_IDX=7, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFYSOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=3, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=c2cb02d4-11bf-49bd-ab09-01d08e1e7c3e.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225072358, MY_LIKE=N, CNT_MST_IDX=8, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=4, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=8830182f-ef44-4824-938f-2c6c52080a58.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225073801, MY_LIKE=N, CNT_MST_IDX=9, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=5, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=b6c4327e-8637-4bfb-8397-f28f74d7b0f5.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225073913, MY_LIKE=N, CNT_MST_IDX=10, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=6, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=c55d374c-8bbd-4e25-830c-3f4d921a15ae.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225074303, MY_LIKE=N, CNT_MST_IDX=11, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=7, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=80f5459b-b61e-43aa-b34d-856d4a03896a.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225080306, MY_LIKE=N, CNT_MST_IDX=12, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=8, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=c0f07f69-a53b-4286-9857-53a03daa6c46.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225080743, MY_LIKE=N, CNT_MST_IDX=13, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=SOFY, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=SOFY, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=9, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=3f57a358-bbf4-414d-b52b-eef11ed25301.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225081807, MY_LIKE=N, CNT_MST_IDX=14, CMN_FLE_ALT_TXT=SOFY, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}, {CNT_MST_DESC=ㅠ, CNT_MST_TYPE=TYPE_SELLER_PICK, CNT_MST_TITLE=나울어, CMM_FLE_ATT_PATH=/attach/default/2020/02/25/, CNT_MST_USE_YN=Y, RNUM=10, CNT_MST_CHANNEL_PC_YN=Y, CMM_FLE_SYS_NM=ad2abadf-6f9b-47b5-b66f-2ebe16eb8850.jpeg, LIKE_COUNTS=0, CNT_MST_REG_DT=20200225084914, MY_LIKE=N, CNT_MST_IDX=15, CMN_FLE_ALT_TXT=ㅠ, CNT_MST_CHANNEL_MOBILE_YN=Y, CNT_MST_DETAIL_TYPE=I}]
     */
    @RequestMapping("/mobile/sellerpick/sellerPickListAjax")
    public JSON sellerPickListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        JSON json = new JSON();
        
        commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("CMM_FLE_TB_NM", "T_CNT_MST");       //PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", "P");             //PC용 이미지
        commandMap.put("CMM_FLE_SORT", "1");             //PC용 목록 이미지
        
        commandMap.put(PARAM_CONST.CNT_MST_TYPE, CONTENTS_TYPE_CODE.TYPE_SELLER_PICK); //셀러픽 타입
        
        // 페이지 당 기본 기획전 출력 갯수
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        int totalCount  = this.pcVendorSellerPickService.selectSellerPickCount(commandMap);
        Paging paging   = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0){
            // 셀러픽 목록
            list = this.pcVendorSellerPickService.selectSellerPickList(commandMap);
        }
        json.put("totalCount", StringUtil.getString(totalCount));
        json.put("list", list);
        
        return json;
    }

}
