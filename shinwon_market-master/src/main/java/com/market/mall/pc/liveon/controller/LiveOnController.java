package com.market.mall.pc.liveon.controller;

import java.util.ArrayList;
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
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.pc.liveon.service.LiveOnService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.tag.service.TagService;

@Controller("pcLiveOnController")
public class LiveOnController {
    
    @Resource(name="pcLiveOnService")
    LiveOnService pcLiveOnService;
    
    @Resource(name="productService") 
    private ProductService productService;
	
    @Autowired
    TagService tagService;

    private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_CHANNEL_ON_PRODUCT;
	
    /**
     * @api {GET} /pc/liveon/liveonList.do 
     * @apiName 라이브온 메인화면
     * @apiGroup 라이브온
     * 
     * @apiSuccess {Integer} totalCount 라이브온 상품 총 개수
     */
    @RequestMapping("/pc/liveon/liveonList")
    public ModelAndView liveonList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        //commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        int totalCount = pcLiveOnService.selectLiveOnProductListCount(commandMap);
        
        mv.addObject("totalCount", totalCount);
        
        return mv;
    }
    
	/**
     * @api {POST} /pc/liveon/liveonListAjax.do 
     * @apiName 라이브온 메인화면 목록 Ajax
     * @apiGroup 라이브온
     * 
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} orderType ( regDate : 최근등록순, lowPrice:가격낮은순 , highPrice: 가격높은순,  sales : 판매량 많은순) / {orderType = regDate}
     * 
     * @apiSuccess {Object[]} liveonProductList 라이브온 상품 목록 [{TAG_MST_TITLE=대표태그, PRD_MST_NM=[OnlineExclusive] 블랙 벨트포인트 덕다운 패딩 , RNUM=1, PRD_MST_CD=S0011954, PRD_MST_DSP_PRC=8508, PRD_MST_URL=https://www.youtube.com/watch?v=bqizaW-YXfM, PRD_MST_BRAND_NM=올리브영, PRD_MST_PRC=10010, PRD_MST_NM_SUB=[올리브영] [OnlineExclusive] 블랙 벨트포인트 덕다운 패딩 , PRD_MST_PRICE=8508}]
     */
	@RequestMapping("/pc/liveon/liveonListAjax")
    public JSON liveonListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
	    JSON json = new JSON();

        //commandMap.put("searchCntMstShopType", "Y");        //PC용 컨텐츠
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_MEM_ID" , user.getMEM_MST_MEM_ID()); // 로그인 회원정보
 
        // 페이지 당 기본 기획전 출력 갯수
        //commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        // 페이지 당 기본 출력 갯수
        int curSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "8"));
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        
        int startNum = offset;
        int endNum = offset + curSize - 1;
        commandMap.put("startNum", startNum);
        commandMap.put("endNum", endNum);
        
        
        //int totalCount = pcLiveOnService.selectLiveOnProductListCount(commandMap);
        //Paging paging   = new Paging(totalCount, commandMap);
        
        List<Map<String, Object>> liveonProductList = pcLiveOnService.selectLiveOnProductList(commandMap);
        
        //if(totalCount > 0){
        //    liveonProductList = pcLiveOnService.selectLiveOnProductList(commandMap);
        //}

        json.put("list", liveonProductList);
        
        return json;
    }       
	
	 /**
     * @api {POST} /pc/liveon/liveonProductAjax.do 
     * @apiName 라이브온 상품 (일반/묶음/세트 상품)
     * @apiGroup 라이브온
     * 
     * @apiParam {String} PRD_MST_CD 상품코드
     * 
     * @apiSuccess {Object[]} productInfo 상품상세정보 [{PRD_IMAGE=상품이미지, PRD_IMAGE_ALT=대체텍스트, PRD_MST_NM=상품이름,PRD_MST_CD=상품코드, PRD_MST_BRAND_NM=브랜드이름, PRD_MST_PRICE = 할인전 가격, PRD_NOW_DST_PRICE : 할인된 가격, PRD_MST_PC_CPN_UNT : 정율/정액 단위, PRD_NOW_DST_POINT : 정율, PRD_MST_PC_CPN_PRC : 정액, TAG_MST_TITLE=대표태그}]
     * @apiSuccess {Integer} optionMstEstCount 필수옵션 등록 카운트
     * @apiSuccess {Object[]} optionMustList 옵션 필수 리스트 [{CMN_COM_IDX=사이즈IDX /색상IDX, PRD_CMM_TYPE=색상(C)/사이즈(S)타입, PRD_MST_CD = 상품코드, UP_COM_OPT_IDX = 상위 옵션IDX, OPT_STK_CNT=재고, CMN_COM_ETC2=색상/사이즈 코드값}]
     * @apiSuccess {Object[]} addOptionList 추가 옵션 리스트 [{PRD_MST_CD=상품코드, PRD_OPT_NM=추가옵션명}]
     * @apiSuccess {Object} vendorInfo 매장 정보  {} 
     */
    @RequestMapping("/pc/liveon/liveonProductAjax")
    public ModelAndView liveonProductAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        String prdMstCd = StringUtil.getString(commandMap.get("PRD_MST_CD"), "");
        
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        commandMap.put("PRD_MST_CD", prdMstCd);
        
		// 카테고리 및 환경정보
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC ); // P는 웹, M은 모바일 
        
        // 상품정보
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG);
        commandMap.put("RTL_THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE); //매치상품 썸네일 사이즈
        
        Map<String, Object> productInfo = this.productService.selectProduct(commandMap);
        
        if(!commandMap.containsKey("PRD_CTG_IDX")) {
        	productInfo.put("PRD_CTG_IDX", productInfo.get("PRD_MST_RLT_CAT3"));
        }
        
        
        // select 에 실패하면 오류 페이지 이동.
        if( productInfo==null || StringUtil.isEmpty(prdMstCd) ){            
            mv.addObject("alertMsg", "잘못된 상품 정보입니다.\\n다시 확인해주세요.");
            mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/pc/liveon/liveonList.do");
            mv.setViewName("/pc/common/result");
            return mv;
        }
        
        if(StringUtil.getInt(productInfo.get("PRD_MST_SEL_CNT"),0) == 0){
            productInfo.put("PRD_MST_SEL_STATE", "O"); //일시품절
        }
        
        //상품타입
        String prdType = StringUtil.getString(productInfo.get("PRD_MST_TYPE"),"");
        
        if(prdType.equals("S") || prdType.equals("B")){
            List<Map<String,Object>> productGroupInfoList = this.productService.selectProductGroupInfo(commandMap);
            mv.addObject("productGroupInfoList", productGroupInfoList);     
        }
        
        mv.addObject("productInfo", productInfo);
        
        if(prdType.equals("G")){//일반상품

		    List<Map<String, Object>> defalutOptionList = new ArrayList<Map<String, Object>>();
		    defalutOptionList = this.productService.selectProductMustOptionList(commandMap);
		    
            List<Map<String, Object>> addOptionList = new ArrayList<Map<String, Object>>();
            addOptionList = this.productService.selectProductAddOptionList(commandMap);
            
            mv.addObject("defalutOptionList", defalutOptionList);
            mv.addObject("addOptionList", addOptionList);
            
            /*
          int optionMstEstCount = this.productService.selectProductOptionMstEstCount(commandMap);
          
          // 옵션 필수 리스트
          List<Map<String, Object>> optionMustList = this.productService.selectProductOptionMustList(commandMap);
          
          // 추가 옵션 리스트
          List<Map<String, Object>> addOptionList = this.productService.selectProductOptionMstList(commandMap);
          
          mv.addObject("productInfo", productInfo);
          mv.addObject("optionMstEstCount", optionMstEstCount);
          mv.addObject("optionMustList", optionMustList);
          mv.addObject("addOptionList", addOptionList);
          
          mv.setViewName("/pc/liveon/normalProductPopup");
          return mv;
          */
            
        } else if(prdType.equals("P")){ //묶음상품
            
            //mv.addObject("productInfo", productInfo);
            
            //mv.setViewName("/pc/liveon/bundlelProductPopup");
            //return mv;
        } else if(prdType.equals("S")){//세트상품
            
            //mv.addObject("productInfo", productInfo);
            
            //mv.setViewName("/pc/liveon/setProductPopup");
            //return mv;
        }
        mv.setViewName("/pc/liveon/normalProductPopup");
        mv.addObject("commandMap", commandMap);
        return mv;
        
    }
	

}
