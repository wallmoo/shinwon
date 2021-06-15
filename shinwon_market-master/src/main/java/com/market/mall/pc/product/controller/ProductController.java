package com.market.mall.pc.product.controller;

import java.io.FileNotFoundException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.sns.service.SnsManagerService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.mypage.service.MyCouponService;
import com.market.mall.pc.mypage.service.MyInfoService;
import com.market.mall.pc.mypage.service.MyProductCommentService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.product.service.ProductService;

import egovframework.rte.fdl.property.EgovPropertyService;
import oracle.sql.CLOB;

/**
 * @PackageName: com.market.mall.pc.product.controller
 * @FileName : ProductController.java
 * @Date : 2014. 7. 11.
 * @프로그램 설명 : PC 상품 상세화면을 처리하는 Controller Class
 * @author 이미정
 */
@Controller("pcProductController")
@AccessLevelUser(ROLEUSER.guest)
public class ProductController {
	
	@Resource(name="productService") 
	private ProductService productService;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
	@Resource(name="productListService") 
	private ProductListService productListService;

	@Resource(name="cartService") 
	private CartService cartService;
	
	@Resource(name="pcMyProductCommentService")
    private MyProductCommentService pcMyProductCommentService;
	
	@Resource(name="pcCommonService")
    private CommonService pcCommonService;
	
	@Resource(name="pcMyInfoService")
	private MyInfoService pcMyInfoService;
	
	@Resource(name="pcMyCouponService")
    private MyCouponService pcMyCouponService;
	
	@Resource(name="snsManagerService")   
	private SnsManagerService snsManagerService;    
	
	private static final int CTG_BRAND_IDX = Code.CATEGORY_BRAND_TOP_IDX;
	private static final int COMMON_QNA_PRODUCT = Code.COMMON_QNA_PRODUCT;
	private static final String PRD_CTG_ENV = "P";
	private static final String COMMON_QNA_TYPE = "Q";
	
	private static final int _DETAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG;
	private static final int _THUMBNAIL_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE;
	private final static int _RELATED_PRODUCT_IMAGE_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST;
	 
	
	/**
	 * <pre>
	 * 1. MethodName : product
	 * 2. ClassName  : ProductController.java
	 * 3. Comment    :  상품 상세화면
	 * 4. 작성자       : DEV_SONGJEONGEUN
	 * 5. 작성일       : 2015. 5. 18.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
	 * @api {GET} /pc/product/productView.do
	 * @apiName 일반상품 상세
	 * @apiGroup 상품전시
	 *
	 * @apiParam {String} PRD_CTG_IDX 2뎁스 카테고리 인덱스
	 * @apiParam {String} PRD_MST_CD 상품 코드
	 *
	 * @apiSuccess {Object[]} productInfo 상품정보  {PRD_MST_CD=상품코드, PRD_MST_PRC=할인전가격, PRD_MST_PRICE=할인적용가격, PRD_MST_URL=상품동영상URL, PRD_MST_PC_DTL_DSC = Pc상품상세, PRD_MST_NM=상품이름, PRD_MST_SEASON=시즌정보, LIKE_COUNTS=좋아요 수, MY_LIKE=좋아요여부, PRD_MST_NM_SUB = 상품 SUB제목, BND_MST_NM=브랜드이름, TAG_MST_TITLE=대표태그타이틀, DLV_FEE=배송비 무료조건 가격, PRD_NOW_DST_PRICE=즉시할인가, PRD_MST_EMP_USE_YN = 임직원 할인 여부, PRD_MST_PRT_USE_YN = 제휴사 할인 여부, PRD_MST_EMP_PRICE = 임직원 할인 적용 가격 , PRD_MST_PRT_PRICE = 제휴사 할인 여부 가격, BNR_MST_URL = 상품 배너 URL, PRD_IMAGE = 상품 썸네일, PRD_IMAGE_ALT = 상품 대체 텍스트, RLT_PRD_IMAGE1=매치상품1, RLT_PRD_IMAGE2=매치상품2, RLT_PRD_IMAGE3=매치상품3, RLT_PRD_IMAGE_ALT1=매치상품대체텍스트1, RLT_PRD_IMAGE_ALT2=매치상품대체텍스트2, RLT_PRD_IMAGE_ALT3=매치상품대체텍스트3 }
	 * @apiSuccess {Object[]} listProductImages 상품 이미지 리스트 [{small=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/21/S0012093/S0012093_0_84.jpg, large=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/21/S0012093/S0012093_0_500.jpg, alt=elsa, desc=elsa}, {small=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/21/S0012093/S0012093_1_84.jpeg, large=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/21/S0012093/S0012093_1_500.jpeg, alt=null, desc=null}, {small=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/21/S0012093/S0012093_2_84.jpeg, large=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/21/S0012093/S0012093_2_500.jpeg, alt=null, desc=null}]
	 * @apiSuccess {Object[]} defalutOptionList 필수옵션  {COLOR_IDX=컬러 공통코드값, COLOR_VALUE=컬러값, COLOR_CODE=컬러코드, SIZE_IDX=사이즈 공통코드값, SIZE_NM=사이즈 이름, OPT_STK_CNT=재고}
	 * @apiSuccess {Object[]} addOptionList 추가옵션 {PRD_OPT_IDX = 옵션 인덱스, PRD_OPT_NM = 옵션 이름}
	 * @apiSuccess {Object} productReputation 상품 요약 평점 {REP_POINT = 요약평점, REP_CNT = 상품 리뷰 총갯수, SIZE_RATE = 70, COLOR_RATE = 70}
	 * @apiSuccess {Object} productBannerInfo 상품 배너 정보 {BNR_MST_IDX = 배너IDX, BNR_MST_TITLE=배너타이틀, IMG_THUMBNAIL=이미지, CMN_FLE_ALT_TXT=대체텍스트, PRD_CTG_IDX = 카테고리IDX, PRD_CTG_NM = 카테고리 명}
	 * @apiSuccess {Object[]} benefitList 추가혜택 리스트 [{detailList=[{BNF_DTL_DESC=연두해요, BNF_DTL_IDX=7, BNF_DTL_NM=연두해요}, {BNF_DTL_DESC=연두해요, BNF_DTL_IDX=8, BNF_DTL_NM=우리같이}], BNF_MST_NM=혜원쓰추가혜택~, BNF_MST_IDX=16}]
	 * @apiSuccess {Object[]} myFitInfolist 마이핏 리스트 [{CMN_COM_NM:마이핏 항목 입력정보 ,SECTION:중분류 코드값, MEM_FIT_VAL:회원입력사이즈값}]
	 * @apiSuccess {Object} couponInfo 쿠폰혜택 {CPN_MST_GBN=A, CPN_MST_IDX=ETLKWZ814, CPN_MST_SAL_PRC=1000, RESULT_CPN_PRICE=44000, CPN_MST_MXM_PRC=0, SALE_PRICE=45000, CPN_MST_SML_PRC=1000, CPN_MST_TITLE=남성전용 쿠폰, CPN_MST_USE_ED_DT=2016.08.31, CPN_MST_USE_ST_DT=2016.08.01, CPN_MST_GBN_TYPE=price, CPN_PRICE=44000, CPN_MST_SAL_GBN=B}
	 * @apiSuccess {Object[]} productGroupInfoList 묶음/세트 상품일 경우 상품상세정보 리스트 [{mustOptionList=[{COLOR_IDX=컬러 공통코드값, COLOR_VALUE=컬러값, COLOR_CODE=컬러코드, SIZE_IDX=사이즈 공통코드값, SIZE_NM=사이즈 이름, OPT_STK_CNT=재고}], addOptionList=[{PRD_OPT_IDX = 옵션 인덱스, PRD_OPT_NM = 옵션 이름}], productGroupInfo={PRD_MST_NM=BIODERMA 스킨로션, PRD_MST_CD=S0011886, PRD_MST_SEL_CNT=8886, PRD_NOW_DST_PRICE=0}}]
	 */
	@RequestMapping("/pc/product/productView")
    public ModelAndView productView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        Map<String,Object> stockParam = new HashMap<String,Object>();
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
		
		// 카테고리 및 환경정보
        commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV ); // P는 웹, M은 모바일 
        
        
        // 상품 코드 
         String prdMstCd = StringUtil.getString(StringUtil.getString(commandMap.get("PRD_MST_CD"), null)); 
        //prdMstCd = "S0011886";
        commandMap.put("PRD_MST_CD", prdMstCd); // 상품코드
        commandMap.put("CTG_TOP_IDX", CTG_BRAND_IDX);	// 브랜드 카테고리로 한정 
        
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_PRW_IP", request.getRemoteAddr());
        
        //최근본상품등록
        this.productService.insertPrw(commandMap);
        
        //상품 배너 정보
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_PRODUCT_BANNER);
        Map<String, Object> productBannerInfo = this.productService.selectProductBannerInfo(commandMap);        
        
        // 상품 평점 - 평균
        Map<String, Object> productReputation = this.productService.selectProductReputation(commandMap);
        
        //채널정보
        String chlCode = StringUtil.getString(commandMap.get("chlCode"));
        if("".equals(chlCode)){
        	chlCode = StringUtil.getString(request.getAttribute("cookieChlCode"));
        }
        commandMap.put("chlCode", chlCode);
        commandMap.put("PRD_CHL_TYPE", StringUtil.getString(commandMap.get("chlCode"), ""));
        // 상품정보
        commandMap.put("THUMBNAIL_SIZE", _DETAIL_IMAGE_SIZE_);
        
        commandMap.put("RTL_THUMBNAIL_SIZE", _THUMBNAIL_IMAGE_SIZE_); //매치상품 썸네일 사이즈
        
        Map<String, Object> productInfo = this.productService.selectProduct(commandMap);
        
        List<Map<String, Object>> togetherProdustList = this.productService.selectTogetherProduct(commandMap);
        
        // select 에 실패하면 오류 페이지 이동.
        if( productInfo==null || StringUtil.isEmpty(prdMstCd) ){ 
        	mv.addObject("alertMsg", "잘못된 상품 정보입니다.\\n다시 확인해주세요.");
        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/pc/main/index.do");
        	mv.setViewName("/pc/common/result");
        	return mv;
        }
        
        stockParam.putAll(productInfo);
        
        if(!commandMap.containsKey("PRD_CTG_IDX")) {
        	productInfo.put("PRD_CTG_IDX", productInfo.get("PRD_MST_RLT_CAT3"));
        }
        
        String pcDescription = StringUtil.getString(productInfo.get("PRD_MST_PC_DTL_DSC"),"");
        if(!"".equals(pcDescription)){
           if(productInfo.get("PRD_MST_PC_DTL_DSC") instanceof CLOB) {
               productInfo.put("PRD_MST_PC_DTL_DSC", StringUtil.clobToStr((CLOB)productInfo.get("PRD_MST_PC_DTL_DSC")));
           }
        }
        
        if(StringUtil.getInt(productInfo.get("PRD_MST_SEL_CNT"),0) == 0){
        	productInfo.put("PRD_MST_SEL_STATE", "O");
        }
        
        //매판매 상품이면 팅겨냄
        if(productInfo.get("PRD_MST_SEL_STATE").equals(Code.PRODUCT_SELL_STATE_STOP)){
        	mv.addObject("alertMsg", "판매불가 상품입니다.");
        	//mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/pc/product/productList.do?idx="+topCateIdx);
        	mv.setViewName("/pc/common/result");
        }
        else{
            String prdType = StringUtil.getString(productInfo.get("PRD_MST_TYPE"),"");
            
            List<Map<String,Object>> productGroupInfoList = null;
            if(prdType.equals("S") || prdType.equals("B")){
            	productGroupInfoList = this.productService.selectProductGroupInfo(commandMap);
                mv.addObject("productGroupInfoList", productGroupInfoList);   
                
                for(int i = 0 ; i < productGroupInfoList.size(); i ++) {
                	
                	Map<String, Object> curData = productGroupInfoList.get(i);
                	if(curData.get("mustOptionList") != null) {
                		List<Map<String, Object>> mustOptionList = 
                				(List<Map<String, Object>>)curData.get("mustOptionList");
                		
                		Map<String,  List<Map<String, Object>>> mustSizeList = new HashMap<String, List<Map<String,Object>>>();
                		
        			    for(int k = 0; k < mustOptionList.size(); k++) {
        			    	if("S".equals(mustOptionList.get(k).get("PRD_CMM_TYPE").toString())) {
        			    		
        			    		String curUpOptIdx = mustOptionList.get(k).get("UP_COM_OPT_IDX").toString();
        			    		if(!mustSizeList.containsKey(curUpOptIdx)) {
        			    			
        			    			mustSizeList.put(curUpOptIdx,new ArrayList<Map<String,Object>>());
        			    		}
        			    		
        			    		mustSizeList.get(curUpOptIdx).add(mustOptionList.get(k));
        			    	}
        			    }
        			    curData.put("mustSizeList", mustSizeList);
                	}
                	
                }
            }
            if(StringUtil.getString(productInfo.get("PRD_MST_URL"),"").indexOf("https://vimeo.com/") >= 0)
            {
            	mv.addObject("movieType","vimeo");
            }else if(StringUtil.getString(productInfo.get("PRD_MST_URL"),"").indexOf("https://youtu.be/") >= 0)
            {
            	mv.addObject("movieType","youtube");
            }
            
            //상품가격정의
            int mstPrice = Integer.parseInt(StringUtil.getString(productInfo.get("PRD_MST_PRC"), "0"));
            int disPercent = Integer.parseInt(StringUtil.getString(productInfo.get("PRD_NOW_DST_POINT"), "0"));
            int disPrice = Integer.parseInt(StringUtil.getString(productInfo.get("PRD_NOW_DST_PRICE"), "0"));
            
            try {
                if(prdType.equals("B")) {
                	if(productGroupInfoList != null) {
                		
                		for(int i = 0; i < productGroupInfoList.size(); i++) {
                			Map<String, Object> curMapInfo = productGroupInfoList.get(i);
                            int curMstPrice = Integer.parseInt(StringUtil.getString(curMapInfo.get("PRD_MST_PRC"), "0"));
                            int curDisPercent = Integer.parseInt(StringUtil.getString(curMapInfo.get("PRD_NOW_DST_POINT"), "0"));
                            int curDisPrice = Integer.parseInt(StringUtil.getString(curMapInfo.get("PRD_NOW_DST_PRICE"), "0"));
                            
                            if(curDisPrice < disPrice) {
                            	mstPrice = curMstPrice;
                            	disPercent = curDisPercent;
                            	disPrice = curDisPrice;
                            }
                		}
                	}
                }
            } catch(Exception e) {}

            
            mv.addObject("PRC_MASTER", mstPrice);
            mv.addObject("PRC_PERCENT", disPercent);
            mv.addObject("PRC_DSICOUNT", disPrice);
            
	        //상품 이미지 불러오기
	        commandMap.put("DETAIL_IMAGE_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG);
	        commandMap.put("THUMBNAIL_IMAGE_SIZE",Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
	        commandMap.put("IMAGEPATH",request.getAttribute("cdnDomain"));
	        List<Map<String, Object>> listProductImages = this.productService.selectProductImageList(commandMap);
	        
	        // 상품 이미지가 없는 경우는 no image 추가 
	        if(listProductImages == null || listProductImages.size() == 0)
	        {
	        	Map<String, Object> noImageMap = new HashMap<String, Object>();
	        	noImageMap.put("large", request.getAttribute("cdnDomain") + Code._NO_IMAGE_PC_DETAIL_);
	        	noImageMap.put("middle", request.getAttribute("cdnDomain") + Code._NO_IMAGE_PC_DETAIL_);
	        	noImageMap.put("small", request.getAttribute("cdnDomain") + Code._NO_IMAGE_PC_DETAIL_);
	        	listProductImages.add(noImageMap);
	        }
	        
	        // 조회수 증가 
	        this.productService.updateProductReadCnt(commandMap);
	        
			// TODO 로그인한 경우 사용자 정보 가져온다.
			if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
				commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
				Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
				mv.addObject("userInfo", userInfo);
			}
	        
	        // 배송형태 사용여부 - MarketPlant/온라인상품/회원서비스인 경우에만 사용 
	        if("Y".equals(StringUtil.getString(productInfo.get("PRD_MST_ONLINE_YN"), "")))
	        {
	        	mv.addObject("usePickupYn", "Y");
	        }
	        else
	        {
	        	mv.addObject("usePickupYn", "N");
	        }
	        
	        // 고객체험단 상품리뷰 목록(사용안한다해서 잠시 주석)
	        commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
	        commandMap.put("BRD_INQ_TYPE",COMMON_QNA_TYPE);
	        
	        //List<Map<String, Object>> listProductKinger = this.productService.selectProductKingerList(commandMap);
	
	    	commandMap.put("onlineOnly", "Y");
	    	
	    	//쿠폰혜택
	    	Map<String, Object> couponInfo = this.pcMyCouponService.selectProductDetailCoupon(commandMap);
	    	mv.addObject("couponInfo", couponInfo.get("couponInfo"));
	    	
	    	//마이핏 리스트
            List<Map<String, Object>> myFitInfolist = this.productService.selectMyFitInfo(commandMap);
            String myFitSampleImg = this.productService.selectMyFitSampleImage(commandMap);
            
	    	mv.addObject("myFitInfolist", myFitInfolist);
	    	String myFitInfoYN = "N";
	    	
	    	if(myFitInfolist != null) {
	    		for(int i = 0 ; i < myFitInfolist.size(); i++) {
	    			
	    			if(myFitInfolist.get(i).get("MEM_FIT_VAL") != null &&
	    					!myFitInfolist.get(i).get("MEM_FIT_VAL").toString().equals("0")) {
	    				
	    				myFitInfoYN = "Y";
	    				break;
	    			}
	    		}
	    	}
	    	
	    	mv.addObject("myFitInfoYN", myFitInfoYN);
	    	mv.addObject("myFitSampleImg", myFitSampleImg);
	    	
	    	
	    	//상품리뷰 
	    	//commandMap.put("MGZ_MST_CTG", "2016");
	    	//commandMap.put("ROW_NUM", 5);
	    	//List<Map<String, Object>> productEmagazineRevList = this.productService.selectProductEmagazineRevList(commandMap);
	        
	    	
	    	//상품 포토리뷰 목록
	    	List<Map<String, Object>> productPhotoRevList = this.productService.selectPhotoRevLimitList(commandMap);
	        
	    	
	        // 상품 연관상품 정보        
	        commandMap.put("THUMBNAIL_SIZE", _RELATED_PRODUCT_IMAGE_SIZE_);
	        //List<Map<String, Object>> listProductRelated = this.productService.selectProductRelatedList(commandMap);
	
	        // 상품정보 - 고시정보
	        commandMap.put("PRD_NFI_IDX", productInfo.get("PRD_MST_NFI_IDX"));
	        List<Map<String, Object>> productNfiInfo = this.productService.selectProductNfiInfoList(commandMap);
	        
	        //상품속성 고시정보 배열로 담기
	    	if(productInfo != null){
	    		String [] PRD_MST_NFI_INF_ARY = {StringUtil.getString(productInfo.get("PRD_MST_NFI_INF1")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF2")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF3")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF4")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF5")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF6")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF7")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF8")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF9")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF10")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF11")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF12")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF13")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF14"))};
	    		
	    		StringBuffer PRD_MST_NFI_INF=new StringBuffer();
	    		for(int i=0;i<PRD_MST_NFI_INF_ARY.length;i++)
	    		{
	    			PRD_MST_NFI_INF.append(PRD_MST_NFI_INF_ARY[i]);
	    			if(i<PRD_MST_NFI_INF_ARY.length-1)//배열의 끝이 아니라면 문자사이에 , 구분자를 추가
	    			{
	    				PRD_MST_NFI_INF.append(",");
	    			}
	    		}
	    		mv.addObject("PRD_MST_NFI_INF_ARY", PRD_MST_NFI_INF_ARY);
	    	}
	        
	        
	        //내가 쓴 상품 후기 / 상품QNA 갯수
			int repCount = 0;
			int qnaCount = 0;
			
			if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
				commandMap.put("searchMemId", "Y");
				commandMap.put("MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
				repCount = this.productService.selectReputationListCount(commandMap);
				
				commandMap.put("searchQnaMemId", "Y");
				commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
		        commandMap.put("BRD_INQ_TYPE",COMMON_QNA_TYPE);
		        qnaCount = this.productService.selectQnaListCount(commandMap);
			}
            mv.addObject("productBannerInfo", productBannerInfo);
            mv.addObject("productReputation", productReputation);
            float mstPrc = Float.parseFloat(productInfo.get("PRD_MST_PRC").toString());
            float dstPrc = Float.parseFloat(productInfo.get("PRD_NOW_DST_PRICE").toString());
            
            productInfo.put("PRD_MST_DISCOUNT", ( mstPrc - dstPrc) / mstPrc );
            
            mv.addObject("productInfo", productInfo); 
            mv.addObject("togetherProductList", togetherProdustList); 
            
            mv.addObject("productNfiInfo", productNfiInfo);        
            //mv.addObject("productEmagazineRevList", productEmagazineRevList);
            
            mv.addObject("productPhotoRevList", productPhotoRevList);
            mv.addObject("listProductImages", listProductImages);
            mv.addObject("repCount", repCount);
            mv.addObject("qnaCount", qnaCount);
            mv.addObject("commandMap", commandMap);
       
            
            //추가혜택정보
            mv.addObject("benefitList", this.productService.selectBenefitList(commandMap));

			if(prdType.equals("G")){ //일반상품
				
			    List<Map<String, Object>> defalutOptionList = this.productService.selectProductMustOptionList(commandMap);
			    
			    Map<String,  List<Map<String, Object>>> defaultSizeList = new HashMap<String, List<Map<String,Object>>>();
			    for(int i = 0; i < defalutOptionList.size(); i++) {
			    	if("S".equals(defalutOptionList.get(i).get("PRD_CMM_TYPE").toString())) {
			    		
			    		String curUpOptIdx = StringUtil.getString(defalutOptionList.get(i).get("UP_COM_OPT_IDX"));
			    		if(!defaultSizeList.containsKey(curUpOptIdx)) {
			    			
			    			defaultSizeList.put(curUpOptIdx,new ArrayList<Map<String,Object>>());
			    		}
			    		
			    		defaultSizeList.get(curUpOptIdx).add(defalutOptionList.get(i));
			    	}
			    }
	            List<Map<String, Object>> addOptionList = this.productService.selectProductAddOptionList(commandMap);
	            
	            stockParam.put("defalutOptionList", defalutOptionList);
	            stockParam.put("defaultSizeList", defaultSizeList);
	            mv.addObject("defalutOptionList",defalutOptionList);
	            mv.addObject("defalutSizeList", defaultSizeList);
	            mv.addObject("addOptionList", addOptionList);
	            
			    //mv.setViewName("/pc/product/productViewNormal");
			    //return mv;
            
	        } 
			else if(prdType.equals("B")){ //묶음상품
	            //mv.setViewName("/pc/product/productViewBundlel");
	            //return mv;
	            
	        } 
			else if(prdType.equals("S")) { //세트상품
	            //mv.setViewName("/pc/product/productViewSet");
	            //return mv;
	        }
			
			stockParam.put("BND_MST_BRAND_TYPE", StringUtil.getString(productInfo.get("BND_MST_BRAND_TYPE")));
			stockParam.put("PRD_MST_ERP_CD", StringUtil.getString(productInfo.get("PRD_MST_ERP_CD")));
			cartService.selectPrdStockAll(stockParam, request);
	        
			mv.addObject("snsUseList", this.snsManagerService.selectSnsUseList(commandMap));
			mv.setViewName("/pc/product/productViewNormal");
			return mv;
        }
        
        
        stockParam.put("BND_MST_BRAND_TYPE", StringUtil.getString(productInfo.get("BND_MST_BRAND_TYPE")));
        stockParam.put("PRD_MST_ERP_CD", StringUtil.getString(productInfo.get("PRD_MST_ERP_CD")));
        cartService.selectPrdStockAll(stockParam, request);
        
    
        
	    mv.addObject("commandMap", commandMap);
        return mv;
    }
	
	@RequestMapping("/pc/test/Storage.do")
    public ModelAndView Storage(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
	    ModelAndView mv = new ModelAndView();
	    
	    return mv;
    }

	
	/**
	* <pre>
	* 1. MethodName : productRevListAjax
	* 2. ClassName : ProductController.java
	* 3. Comment : 상품평 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 24.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	/**
	 * @api {POST} /pc/product/productRevListAjax.do
	 * @apiName 상품평 리스트
	 * @apiGroup 상품평
	 *
	 * @apiParam {String} PRD_MST_CD 상품코드 
	 *
	 * @apiSuccess {Object[]} RevList 리뷰리스트 [{PRD_REV_CHN_GBN=P, PRD_REV_REG_ID=sosoworld2, RNUM=1, PRD_REV_TITLE=가격대비 좋아요가격대비 좋아요가격대비 좋아요가격대비 좋아요가격대비 좋아요가격대비 좋아요가격, PRD_REV_BST_YN = 베스트 리뷰 여부, REV_COLOR=화면과 같아요, REV_SIZE=작아요, fileList=포토리뷰리스트, PRD_REV_REG_DT_2=2016-09-29, PRD_REV_IDX=104, PRD_REV_SCORE_STAR = 평점}]	 * @apiSuccess {String} page 총 포토 리뷰 갯수
	 */
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/productRevListAjax")
    public JSON productRevListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);
     	//"V0011865"
     	//commandMap.get("PRD_MST_CD")
        // 상품 리뷰 관리 목록 갯수
        commandMap.put("PRD_PRD_MST_CD", commandMap.get("PRD_MST_CD"));
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
		//Map<String, Object> productReputation = this.productService.selectProductReputation(commandMap);
		
		int repCount = this.productService.selectProductRevListCount(commandMap);

		int pageSize = 5;
		int startNum = commandMap.containsKey("offset") ? Integer.parseInt(commandMap.get("offset").toString()) : 1;
		int endNum = startNum + pageSize - 1;
		
        commandMap.put("startNum", startNum);
        commandMap.put("endNum", endNum);
		
        /*
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "5"));
        Paging paging = new Paging(repCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("FRONT");
        String page = pagingRenderer.renderPagination(paging, "goPage");

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        */
        
        List<Map<String, Object>> listProductRev = this.productService.selectProductRevList(commandMap);
        
        //json.put("RevList", listProductRev);
        //json.put("page", page);
        
        json.put("list", listProductRev);
        json.put("tot_count", repCount + "");
        
        return json;
    }
	
	/**
     * @api {POST} /pc/product/productPhotoRevListAjax.do
     * @apiName 포토리뷰 모아보기
     * @apiGroup 상품평
     *
     * @apiParam {String} PRD_MST_CD 상품코드 
     *
     * @apiSuccess {Object[]} photoRevList 리뷰리스트 [{PRD_REV_IDX = 리뷰IDX, FILE_NM = 파일경로, CMM_FLE_ATT_EXT=대체텍스트}]
     */
    @FrontBannerSkip()
    @RequestMapping(value="/pc/product/productPhotoRevListAjax")
    public JSON productPhotoRevListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);

        // 포토 리뷰 목록 갯수
        commandMap.put("PRD_MST_CD", "V0011865");
        commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());

        int repCount = this.productService.selectPhotoRevListCount(commandMap);
        
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "4"));
        Paging paging = new Paging(repCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("FRONT");
        String page = pagingRenderer.renderPagination(paging, "goPage");

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> listPhotoRev = null;
        if (repCount > 0){
            
            // 포토 리뷰 관리 목록
            listPhotoRev = this.productService.selectPhotoRevList(commandMap);
            if(listPhotoRev != null){
                for(int i=0; i < listPhotoRev.size(); i++){
                    listPhotoRev.get(i).put("ListNum", paging.getListNum() - i);
                }
            }
        }
        json.put("photoRevList", listPhotoRev);
        json.put("page", page);
        return json;
    }
	
    
    @RequestMapping(value="/pc/product/productPhotoRevLimitListAjax")
    public JSON productPhotoRevLimitListAjax(HttpServletRequest request, 
    		@RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        json.put("list", this.productService.selectPhotoRevLimitAllList(commandMap));
        return json;
    }
    
    @RequestMapping(value="/pc/product/productRevDeleteAjax")
    public JSON productRevDeleteAjax(HttpServletRequest request, 
    		@RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        User user = SessionsUser.getSessionUser(request);
        commandMap.put("PRD_REV_REG_ID", user.getMEM_MST_MEM_ID());
        
        this.productService.deleteProductRevInfo(commandMap);
        return json;
    }
    
	/**
	* <pre>
	* 1. MethodName : productQnaListAjax
	* 2. ClassName : ProductController.java
	* 3. Comment : 상품 QNA 리스트
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 28.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/productQnaListAjax.do")
    public JSON productQnaListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);
     	
        // 상품 리뷰 관리 목록 갯수
        commandMap.put("PRD_MST_CD",commandMap.get("PRD_MST_CD"));
		commandMap.put("MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
        commandMap.put("BRD_INQ_TYPE",COMMON_QNA_TYPE);
        int totalCount = this.productService.selectQnaListCount(commandMap);
        
        /*
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "5"));
        Paging paging = new Paging(totalCount, commandMap);
        PagingRenderer pagingRenderer = new PagingRenderer("FRONT");
        String page = pagingRenderer.renderPagination(paging, "goPageQna");

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        */
        
		int pageSize = 5;
		int startNum = commandMap.containsKey("offset") ? Integer.parseInt(commandMap.get("offset").toString()) : 1;
		int endNum = startNum + pageSize - 1;
		
        commandMap.put("startNum", startNum);
        commandMap.put("endNum", endNum);

        List<Map<String, Object>> listProductQna = this.productService.selectQnaList(commandMap);
        
        /*
        if (totalCount > 0){
            
            // 상품 리뷰 관리 목록
        	listProductQna = 
        	if(listProductQna != null){
    	    	for(int i=0; i < listProductQna.size(); i++){
    	    		listProductQna.get(i).put("ListNum", paging.getListNum() - i);
    	    	}
    	    }
        }*/
        
        json.put("list", listProductQna);
        json.put("tot_count", totalCount + "");
        
        return json;
    }
	
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/productQnaInfoAjax.do")
    public JSON productQnaInfoAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);

		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());

        json.put("info", this.productService.selectQnaSimpleInfo(commandMap));
        
        return json;
    }
	
	/**
	* <pre>
	* 1. MethodName : productQnaDeleteAjax
	* 2. ClassName : ProductController.java
	* 3. Comment : 상품 QNA삭제
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 12. 28.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/productQnaDeleteAjax.do")
    public JSON productQnaDeleteAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);
     	
        // 상품 리뷰 관리 목록 갯수
        commandMap.put("BRD_INQ_IDX",commandMap.get("brdInqIdx"));
		
        int delQnaCnt = this.productService.deleteQna(commandMap);
        
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
	
    /**
     * <pre>
     * 1. MethodName : productImageAjax
     * 2. ClassName  : ProductController.java
     * 3. Comment    : 상품 상세 이미지 ajax
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/pc/product/productImageAjax.do")
    public JSON productImageAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();
        
        commandMap.put("DETAIL_IMAGE_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_BIG);
        commandMap.put("THUMBNAIL_IMAGE_SIZE",Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
        commandMap.put("IMAGEPATH",request.getAttribute("cdnDomain"));
        List<Map<String, Object>> listProductImages = this.productService.selectProductImageList(commandMap);
        
        // 상품 이미지가 없는 경우는 no image 추가 
        if(listProductImages == null || listProductImages.size() == 0)
        {
        	Map<String, Object> noImageMap = new HashMap<String, Object>();

        	noImageMap.put("large", request.getAttribute("cdnDomain") + Code._NO_IMAGE_PC_DETAIL_);
        	noImageMap.put("middle", request.getAttribute("cdnDomain") + Code._NO_IMAGE_PC_DETAIL_);
        	noImageMap.put("small", request.getAttribute("cdnDomain") + Code._NO_IMAGE_PC_DETAIL_);
        	listProductImages.add(noImageMap);
        	
        }
        
        json.put("items", listProductImages);
        
        return json;
    } 

    /**
    * <pre>
    * 1. MethodName : productQnaFormPopup
    * 2. ClassName : ProductController.java
    * 3. Comment : 상품 QNA 등록 팝업
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/product/productQnaFormPopup.do")
    public ModelAndView productQnaFormPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	
    	Map<String, Object> selectQnaInfo = null;
    			
    	if(commandMap.get("BRD_INQ_IDX") != ""){//상품Q&A수정
    		commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
            commandMap.put("BRD_INQ_TYPE",COMMON_QNA_TYPE);
            commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
    		selectQnaInfo = this.productService.selectQnaInfo(commandMap);
    	}
    	
    	mv.setViewName("pc/product/productQnaForm");
    	mv.addObject("selectQnaInfo", selectQnaInfo);
    	mv.addObject("commandMap", commandMap);
    	return mv;
    }
	/**
	 * <pre>
	 * 1. MethodName : productQnaRegist
	 * 2. ClassName  : ProductController.java
	 * 3. Comment    : 상품 상세화면 상품문의작성
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/product/productQnaRegist.do")
	public ModelAndView productQnaRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{

		ModelAndView mv = new ModelAndView();
		commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV );
        commandMap.put("PRD_MST_CD", commandMap.get("prdMstCd") );
        commandMap.put("MEM_MST_WEB_IP", request.getRemoteAddr());
        // 로그인 회원정보
     	User user = SessionsUser.getSessionUser(request);
     	int result = -1;
     	if(SessionsUser.isLogin(request) && !"".equals(commandMap.get("prdMstCd")) ){
     		
     		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
     		commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
     		commandMap.put("BRD_INQ_REG_NM",SessionsUser.getSessionUserValue("MEM_MST_MEM_NM"));
     		
        	//commandMap.put("BRD_INQ_CONTENTS",commandMap.get("comment"));
        	commandMap.put("BRD_INQ_TYPE",COMMON_QNA_TYPE);
        	
        	commandMap.put("BRD_INQ_PUB_YN", StringUtil.getString(commandMap.get("BRD_INQ_PUB_YN"), "Y"));
        	String BRD_INQ_IDX = StringUtil.getString(commandMap.get("BRD_INQ_IDX"), "");
        	if(BRD_INQ_IDX != ""){
        		result = this.productService.updateQna(commandMap);
        	}else{
        		// 상품평 작성.
                result = this.productService.insertQna(commandMap);
        	}
            
            // view Page Info

            if(result > 0)
            {
            	if(BRD_INQ_IDX != ""){
            		mv.addObject("closeMsg", "수정 되었습니다.");
            	}
            	else{
            		mv.addObject("closeMsg", "등록 되었습니다.");
            	}
                mv.addObject("parentReload", "parentReload");
                mv.addObject("openerReload", "Y");
                
            }
            else
            {
            	if(BRD_INQ_IDX != ""){
            		mv.addObject("closeMsg", "수정에 실패하였습니다.");
            	}
            	else{
            		mv.addObject("closeMsg", "등록에 실패하였습니다.");
            	}
                mv.addObject("parentReload", "parentReload");
                mv.addObject("openerReload", "Y");
            }
            
            // commandMap 등록 안함. ( 상품코드 하나만 GET param으로 전달 )
            mv.setViewName("pc/common/result");
        }
     	else{
            mv.addObject("alertMsg", "정상적인 요청이 아닙니다.");
            // 마이페이지 상품Q&A
            if("myPage".equals(StringUtil.getString(commandMap.get("type"))))
            {
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/mypage/myProductInquiryList.do");
            }
            else
            {
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/product/product.do?prdMstCd="+commandMap.get("prdMstCd"));
            }
            
            mv.setViewName("pc/common/result");
     	}
        return mv;
	}	
	


	/**
	 * <pre>
	 * 1. MethodName : productSimpleView
	 * 2. ClassName  : ProductController.java
	 * 3. Comment    : 상품 상세화면 미리보기
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 22.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/product/productSimpleView.do")
    public ModelAndView productSimpleView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		ModelAndView mv = new ModelAndView();
        
        // 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
		
		commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        
		// 카테고리 및 환경정보
        commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV ); // P는 웹, M은 모바일 
        
        // 상품 코드 
        String prdMstCd = StringUtil.getString(commandMap.get("prdMstCd"), StringUtil.getString(commandMap.get("prdCd"), null)); 
        commandMap.put("PRD_MST_CD", prdMstCd); // 상품코드
        commandMap.put("CTG_TOP_IDX", CTG_BRAND_IDX);	// 브랜드 카테고리로 한정 
        
		
        // 카테고리 정보
        // 이전 선택 카테고리 정보
        List<Map<String, Object>> listCategoryPath = null;
        if ( commandMap.get("cateIdx") != null ){
	        commandMap.put("CATEGORY_IDX", commandMap.get("cateIdx"));
	        listCategoryPath = this.productService.selectCategoryPath(commandMap);
        }else{//카테고리 정보가 없다면 상품에 속한 카테고리 정보를 불러온다
        	Map<String, Object> listLastCategoryPath = this.productService.selectProductLastCategoryPath(commandMap);
        	commandMap.put("CATEGORY_IDX", listLastCategoryPath.get("DSP_PRD_CTG_IDX"));
	        listCategoryPath = this.productService.selectCategoryPath(commandMap);
        }
        //상품의 속한 카테고리 중 LEVEL 1 CTG_IDX
        String topCateIdx =  StringUtil.getString(listCategoryPath.get(0).get("PRD_CTG_IDX"));
        
        Map<String, Object> productCategory = this.productService.selectProductCategoryInfo(commandMap);
        
        // 상품 평점 - 평균
        Map<String, Object> productReputation = this.productService.selectProductReputation(commandMap);
        
        // 상품 평점 - 기능/가격/만족도 
        Map<String, Object> productRevStar = this.productService.selectProductRevStar(commandMap);
        
        // 상품정보
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
        Map<String, Object> productInfo = this.productService.selectProduct(commandMap);
        
        // select 에 실패하면 오류 페이지 이동.
        if( productInfo==null || StringUtil.isEmpty(prdMstCd) ){        	
        	throw new FileNotFoundException();
        }
        
        //타임세일 상품 확인 및 타임세일 속성 가져오기
        Map<String, Object> productTimeSaleInfo = null;
        if(commandMap.get("salIdx") != null || !StringUtil.isEmpty(StringUtil.getString(commandMap.get("salIdx"))) ){
	        productTimeSaleInfo = this.productService.selectProductTimeSaleInfo(commandMap);
        }
        
        //원데이 특가 상품 확인 및 원데 특가 속성 가져오기
        Map<String, Object> productOneDayInfo = null;
        if(commandMap.get("oneDayIdx") != null || !StringUtil.isEmpty(StringUtil.getString(commandMap.get("oneDayIdx"))) ){
        	productOneDayInfo = this.productService.selectProductOneDayInfo(commandMap);
        }
        
        //카테고리 베스트 상품
        commandMap.put("catIdx", commandMap.get("cateIdx"));
        int cateBestTotalCount = this.productListService.selectProductListCount(commandMap);
        List<Map<String, Object>> listProductCateBest = null;
        commandMap.put("orderType","cateHit");
        commandMap.put("startNum",1);
        commandMap.put("endNum",5);
        if(cateBestTotalCount > 0){
        	listProductCateBest = this.productListService.selectProductList(commandMap);
        }
        
        //상품에 속한 카드할인 아이콘
        if(StringUtil.getString(productInfo.get("PRD_MST_CRD_ICON")) !=null && productInfo.get("PRD_MST_CRD_ICON") != ""){
        	String[] arrPRD_MST_CRD_ICON = StringUtil.getString(productInfo.get("PRD_MST_CRD_ICON")).split("&nbsp;");
        	String newPRD_MST_CRD_ICON = "";
        	if(arrPRD_MST_CRD_ICON.length > 4){
        		for(int i = 0; i < arrPRD_MST_CRD_ICON.length; i++){
        			if(i == 0){
        				newPRD_MST_CRD_ICON = arrPRD_MST_CRD_ICON[i];
        			}else{
        				if(i == 4){
        					newPRD_MST_CRD_ICON = newPRD_MST_CRD_ICON + arrPRD_MST_CRD_ICON[i];
        				}else{
        					newPRD_MST_CRD_ICON = newPRD_MST_CRD_ICON + "&nbsp;" + arrPRD_MST_CRD_ICON[i];
        				}
        			}
        		}
        		productInfo.put("PRD_MST_CRD_ICON", newPRD_MST_CRD_ICON);
        	}
        }
        
        //제휴카드 혜택사 가격정의
        int samCardPrice = 0;
        int samPriceDct = 0;
        int samPointDct = 0;
        int prdMstPrice = StringUtil.getInt(productInfo.get("PRD_MST_PRICE"));
        //삼성카드 예상청구할인 금액 계산
        if(prdMstPrice >= 1000000){
        	samPriceDct = 50000;
        }else if(prdMstPrice >= 500000 && prdMstPrice < 1000000){
        	if((int)Math.round(prdMstPrice*0.02) > 20000){
        		samPriceDct = (int)Math.round(prdMstPrice*0.05) + 20000;
        	}else{
        		samPriceDct = (int)Math.round(prdMstPrice*0.05) + (int)Math.round(prdMstPrice*0.02);
        	}
        }else{
        	samPriceDct = (int)Math.round(prdMstPrice*0.05);
        }
        //삼성카드 예상포인트 적립 계산
        samPointDct = (int)Math.round(prdMstPrice*0.03);
        if((int)Math.round(prdMstPrice*0.03) > 100000){
        	samPointDct = 100000;
        }else{
        	samPointDct = (int)Math.round(prdMstPrice*0.03);
        }
        
        //삼성카드 최종 혜택가
        samCardPrice = prdMstPrice - (samPriceDct + samPointDct);

        int rotCardPrice = 0;
        int rotPriceDct = 0;
        int rotPointDct = 0;
        //롯데카드 예상청구할인 금액 계산
        if(prdMstPrice>=10000000){
			rotPriceDct = 200000;
		}else if(prdMstPrice>=5000000){
			rotPriceDct = 100000;
		}else if(prdMstPrice>=3000000){
			rotPriceDct = 80000;
		}else if(prdMstPrice>=2000000){
			rotPriceDct = 60000;
		}else if(prdMstPrice>=1000000){
			rotPriceDct = 30000;
		}else{
			rotPriceDct = (int)Math.round(prdMstPrice * 0.03);
		}
		//롯데카드 예상포인트 적립 계산
        if((int)Math.round((prdMstPrice - rotPriceDct) * 0.05) > 600000){
        	rotPointDct = 600000;
        }else{
        	rotPointDct = (int)Math.round((prdMstPrice - rotPriceDct) * 0.05);
        }
		//롯데카드 최종 혜택가
		rotCardPrice = prdMstPrice - (rotPriceDct + rotPointDct);
		
		mv.addObject("samCardPrice", samCardPrice);
		mv.addObject("rotCardPrice", rotCardPrice);
        
        // 조회수 증가 
        this.productService.updateProductReadCnt(commandMap);
        
		// TODO 로그인한 경우 사용자 정보 가져온다.
		if((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			Map<String, Object> userInfo = this.cartService.selectUserInfo(commandMap);
			mv.addObject("userInfo", userInfo);
		}
        
        // 배송형태 사용여부 - MarketPlant/온라인상품/회원서비스인 경우에만 사용 
        if("Y".equals(StringUtil.getString(productInfo.get("PRD_MST_ONLINE_YN"), "")))
        {
        	mv.addObject("usePickupYn", "Y");
        }
        else
        {
        	mv.addObject("usePickupYn", "N");
        }
        
        // 고객체험단 상품리뷰 목록(사용안한다해서 잠시 주석)
        commandMap.put("BRD_CMN_COM_IDX",COMMON_QNA_PRODUCT);
        commandMap.put("BRD_INQ_TYPE",COMMON_QNA_TYPE);
        
        //List<Map<String, Object>> listProductKinger = this.productService.selectProductKingerList(commandMap);

        
    	// 진행중인 기획전 리스트 
        commandMap.put("ctgIdx", commandMap.get("cateIdx"));
        List<Map<String, Object>> listPlan = this.productService.selectProductPlanList(commandMap);
        
        // 상품 옵션 정보 리스트
        int optionMstEstCount = this.productService.selectProductOptionMstEstCount(commandMap);
        
        commandMap.put("optionMstEstCount", optionMstEstCount);
        
    	List<Map<String, Object>> optionMstList = this.productService.selectProductOptionMstList(commandMap);
    	
    	List<Map<String, Object>> optionDtlList = this.productService.selectProductOptionDtlList(commandMap);

    	commandMap.put("onlineOnly", "Y");
    	
    	//상품뉴스
    	commandMap.put("CMM_FLE_TB_NM", "T_MGZ_MST");
    	commandMap.put("MGZ_MST_CTG", "2017");
    	commandMap.put("MGZ_MST_CTG_TYPE", "N");
    	commandMap.put("ROW_NUM", 4);
    	commandMap.put("PRD_CTG_IDX", topCateIdx);
    	List<Map<String, Object>> productNewList = this.productService.selectProductEmagazineList(commandMap);
    	
    	//상품구매가이드
    	commandMap.put("ROW_NUM", 7);
    	commandMap.put("PRD_CTG_IDX", topCateIdx);
    	commandMap.put("MGZ_MST_CTG_TYPE", "Y");
    	List<Map<String, Object>> productBuyGuideList = this.productService.selectProductEmagazineList(commandMap);
    	
    	//상품리뷰 
    	commandMap.put("MGZ_MST_CTG", "2016");
    	commandMap.put("ROW_NUM", 5);
    	List<Map<String, Object>> productEmagazineRevList = this.productService.selectProductEmagazineRevList(commandMap);
        
        // 상품 연관상품 정보        
        commandMap.put("THUMBNAIL_SIZE", _RELATED_PRODUCT_IMAGE_SIZE_);
        //List<Map<String, Object>> listProductRelated = this.productService.selectProductRelatedList(commandMap);

        // 상품정보 - 고시정보
        commandMap.put("PRD_NFI_IDX", productInfo.get("PRD_MST_NFI_IDX"));
        List<Map<String, Object>> productNfiInfo = this.productService.selectProductNfiInfoList(commandMap);
        
        //상품속성 고시정보 배열로 담기
    	if(productInfo != null){
    		String [] PRD_MST_NFI_INF_ARY = {StringUtil.getString(productInfo.get("PRD_MST_NFI_INF1")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF2")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF3")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF4")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF5")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF6")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF7")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF8")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF9")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF10")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF11")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF12")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF13")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF14"))};
    		
    		StringBuffer PRD_MST_NFI_INF=new StringBuffer();
    		for(int i=0;i<PRD_MST_NFI_INF_ARY.length;i++)
    		{
    			PRD_MST_NFI_INF.append(PRD_MST_NFI_INF_ARY[i]);
    			if(i<PRD_MST_NFI_INF_ARY.length-1)//배열의 끝이 아니라면 문자사이에 , 구분자를 추가
    			{
    				PRD_MST_NFI_INF.append(",");
    			}
    		}
    		mv.addObject("PRD_MST_NFI_INF_ARY", PRD_MST_NFI_INF_ARY);
    	}

    	//카드혜택 무이자/부분무이자
    	mv.addObject("cardEvenFreetList", this.cartService.selectCardEventFreeList(commandMap));
    	
    	// 카드 행사 목록
        //mv.addObject("cardPromotionList", this.cartService.selectCardPromotionList(commandMap));
        
        //장기할부 24,36개월 할부안내
		Map<String,Object> lngDivCardMap = new HashMap<String, Object>();
		Map<String,Object> lngDivCardNms24 = new HashMap<String, Object>();
		Map<String,Object> lngDivCardNms36 = new HashMap<String, Object>();

		if(StringUtil.getString(productInfo.get("PRD_MST_LNG_DIV_YN")).equals("Y")){
			if(StringUtil.getInt(productInfo.get("PRD_MST_LNG_DIV_MNT1")) != 0){//24개월 할부안내
				lngDivCardMap.put("ORD_TMP_LNG_DIV", 24);
				lngDivCardMap.put("CARD_DIV_TYPE_FREE_INTEREST", Code.CARD_DIV_TYPE_FREE_INTEREST);
				lngDivCardMap.put("cart_total", StringUtil.getInt(productInfo.get("PRD_MST_DISCNT_PRICE")));
				lngDivCardNms24 = this.productService.selectProductLngDivCardNm(lngDivCardMap);
			}
			if(StringUtil.getInt(productInfo.get("PRD_MST_LNG_DIV_MNT2")) != 0){//24개월 할부안내
				lngDivCardMap.put("ORD_TMP_LNG_DIV", 36);
				lngDivCardMap.put("CARD_DIV_TYPE_FREE_INTEREST", Code.CARD_DIV_TYPE_FREE_INTEREST);
				lngDivCardMap.put("cart_total", StringUtil.getInt(productInfo.get("PRD_MST_DISCNT_PRICE")));
				lngDivCardNms36 = this.productService.selectProductLngDivCardNm(lngDivCardMap);
			}
		}
        

        mv.setViewName("pc/product/productSimpleView");
        mv.addObject("productCategory", productCategory);
        mv.addObject("listCategoryPath", listCategoryPath);
        mv.addObject("productReputation", productReputation);
        mv.addObject("productRevStar", productRevStar);
        mv.addObject("listPlan", listPlan);
        mv.addObject("productInfo", productInfo);       
        mv.addObject("productNewList", productNewList);
        mv.addObject("productBuyGuideList", productBuyGuideList);
        mv.addObject("productNfiInfo", productNfiInfo);
        mv.addObject("listProductCateBest", listProductCateBest);        
        mv.addObject("productEmagazineRevList", productEmagazineRevList);
        mv.addObject("productTimeSaleInfo", productTimeSaleInfo);
        mv.addObject("productOneDayInfo", productOneDayInfo);
        mv.addObject("optionMstList", optionMstList);
        mv.addObject("optionDtlList", optionDtlList);
        mv.addObject("lngDivCardNms24", lngDivCardNms24);
        mv.addObject("lngDivCardNms36", lngDivCardNms36);
        //mv.addObject("productAsGuide", productAsGuide);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
	

	/**
	* <pre>
	* 1. MethodName : searchProductPopup
	* 2. ClassName : ProductController.java
	* 3. Comment : 상품검색 팝업
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
	@RequestMapping("/pc/product/searchProductPopup.do")
    public ModelAndView searchProductPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        String searchPrdMstErpCd = StringUtil.getString(commandMap.get("searchPrdMstErpCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstErpCd", searchPrdMstErpCd);

        //페이징
        int totalCount = 0;
        if( !StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ){
        	totalCount = this.productService.selectSearchProductCount(commandMap);
        }
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "5"));
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	list = this.productService.selectSearchProductList(commandMap);
        }

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
        
    }
	
	/**
	* <pre>
	* 1. MethodName : searchProductStorePopup
	* 2. ClassName : ProductController.java
	* 3. Comment : 겟잇나우 매장 검색 팝업
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 18.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/product/searchProductStorePopup.do")
	public ModelAndView searchProductStorePopup(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {

		ModelAndView mv = new ModelAndView();
		
		//상품정보조회
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
        Map<String, Object> productInfo = this.productService.selectProduct(commandMap);
        
        //해당 상품이 겟잇나우 상품인지 확인
        if(productInfo != null){
	        if(!productInfo.get("PRD_MST_O2O_YN").equals("Y")){
	        	mv.addObject("closeMsg", "해당 상품은 겟잇나우 상품이 아닙니다.\\n다시 확인해주세요.");
	        	mv.setViewName("pc/common/result");
	        }
        }
        
     	String[] TEMP_OPT_DTL_IDXs = request.getParameterValues("OPT_DTL_IDXs");	// 상품 옵션 idx
     	List<Map<String,Object>> addOptDtlList = new ArrayList<Map<String, Object>>();
     	ArrayList<String> optDtlErpCds = new ArrayList<String>();
     	List<String> OPT_DTL_IDXs = Arrays.asList(TEMP_OPT_DTL_IDXs);
     	
        //해당 옵션 정보 가져오기
        List<Map<String, Object>> optDtlList = null;
        for(String OPT_DTL_IDX : OPT_DTL_IDXs){
        	if(StringUtil.getInt(OPT_DTL_IDX) > 0){
	        	commandMap.put("OPT_DTL_IDX", OPT_DTL_IDX);
	        	optDtlList = this.productService.selectOptionDetailInfo(commandMap);
	        	optDtlList.get(0).put("OPT_DTL_REQ_CNT", StringUtil.getString(commandMap.get("REQUEST_CNT_"+OPT_DTL_IDX),""));
	        	
	        	//옵션의 erp코드 담기
	        	optDtlErpCds.add(StringUtil.getString(optDtlList.get(0).get("OPT_DTL_ERP_CD")).trim());
	        	addOptDtlList.add(optDtlList.get(0));
        	}else{
        		//상품의 기간계 코드 담기
         		optDtlErpCds.add(StringUtil.getString(productInfo.get("PRD_MST_ERP_CD")).trim());
        	}
        }
        int totalCount = 0;
        List<Map<String, Object>> StoreList = null;
        List<Map<String, Object>> GetItNowShopInfo = null;
        Paging paging = null;
        
        if(optDtlErpCds != null){
        	
        	HashMap<String, ArrayList<String>> optDtlErpCdsMap = new HashMap<String, ArrayList<String>>() ;
        	//ERP실시간 재고 체크 상품의 옵션 중 재고가 하나라도 없을 시 팅겨냄
        	for(int erpNo = 0; erpNo < optDtlErpCds.size(); erpNo++){
        		commandMap.put("searchOptDtlErp_Cd", optDtlErpCds.get(erpNo));
        		int erpShpCodeCnt = this.productService.selectErpShpCodeCount(commandMap);
        		
        		if(erpShpCodeCnt < 1){ //재고 없음
        			mv.addObject("closeMsg", "선택가능한 매장이 없습니다.");
    	        	mv.setViewName("pc/common/result");
        		}
        	}
        	
        	optDtlErpCdsMap.put("searchOptDtlErp_Cds", optDtlErpCds);
        	//옵션 기간계코드로 재고 있는 매장 코드
        	commandMap.put("searchOptDtlErp_Cds", optDtlErpCdsMap.get("searchOptDtlErp_Cds"));
            List<Map<String, Object>> erpShpCodeList = this.productService.selectErpShpCodeList(commandMap);
            
            //erp에서 가져온 매장코드로 지점 검색
            if(erpShpCodeList != null && erpShpCodeList.size() > 0){
            	commandMap.put("searchErpShpCodeList", erpShpCodeList);
            	if(commandMap.get("searchYn") == null || commandMap.get("searchYn").equals("")){
            		commandMap.put("searchShpMstArea", "2395");
            	}
            	totalCount = this.productService.selectStoreCount(commandMap);
            	commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "5"));
            	paging = new Paging(totalCount, commandMap); 
            	if(totalCount > 0){
            		StoreList = this.productService.selectStoreList(commandMap);
            	}
            	//매장 받는 시간 리스트
            	if(StoreList != null){
            		
            		//매장 받는 시간 셋팅
            		if(StoreList != null){
            			for(int i = 0; i < StoreList.size(); i++){
    			    		//겟잇나우 시작 시간
            				String inhour   = new java.text.SimpleDateFormat("HH").format(new java.util.Date());
            				
    						String SHP_MST_O2O_ST_HH_STR = StringUtil.getString(StringUtil.getInt(StoreList.get(i).get("SHP_MST_O2O_ST_HH"))+1, "00");
    						String SHP_MST_O2O_ST_MM_STR = StringUtil.getString(StoreList.get(i).get("SHP_MST_O2O_ST_MM"), "00");
    						
    						String SHP_MST_O2O_ST_HH_STR2 = StringUtil.getString(StringUtil.getInt(StoreList.get(i).get("SHP_MST_O2O_ST_HH"))+1, "00");
    						String SHP_MST_O2O_ST_MM_STR2 = StringUtil.getString(StoreList.get(i).get("SHP_MST_O2O_ST_MM"), "00");
    						
    						//겟잇나우 구매 시간 확인
    						/*if(StringUtil.getInt(inhour, 0) > StringUtil.getInt(SHP_MST_O2O_ST_HH_STR, 0)){
    							SHP_MST_O2O_ST_HH_STR = inhour;
    						}*/

    						//겟잇나우 종료 시간
    						String SHP_MST_O2O_ED_HH_STR = StringUtil.getString(StringUtil.getInt(StoreList.get(i).get("SHP_MST_O2O_ED_HH"))-2, "23");
    						String SHP_MST_O2O_ED_MM_STR = StringUtil.getString(StoreList.get(i).get("SHP_MST_O2O_ED_MM"), "59");
    						
    						int SHP_MST_O2O_ST_HH = Integer.valueOf(SHP_MST_O2O_ST_HH_STR);
    						int SHP_MST_O2O_ED_HH = Integer.valueOf(SHP_MST_O2O_ED_HH_STR);
    						
    						int SHP_MST_O2O_ST_HH2 = Integer.valueOf(SHP_MST_O2O_ST_HH_STR2);
    						
    						List<String> timeList = new ArrayList<String>();
    						for(int time=SHP_MST_O2O_ST_HH; time<SHP_MST_O2O_ED_HH; time++){
    							String visitHour1 = String.format("%02d", time); //시작시간1
    							String visitHour2 = String.format("%02d", time+1); //시작시간2
    							String visitMinute = SHP_MST_O2O_ST_MM_STR; //시작분
    							String visitMinute2 = SHP_MST_O2O_ST_MM_STR; //시작분
    							
    							// 방문가능시간 마지막은 종료시간 분을 가져와야 한다.
    							if(time+1 == SHP_MST_O2O_ED_HH){
    								visitMinute2 = SHP_MST_O2O_ED_MM_STR;
    							}
    							
    							String timeStr = visitHour1 + ":" + visitMinute + "~" + visitHour2 + ":" + visitMinute2;
    							timeList.add(timeStr);
    							//logger.debug(timeStr);
    							
    						}
    						List<String> timeList2 = new ArrayList<String>();
    						for(int time=SHP_MST_O2O_ST_HH2; time<SHP_MST_O2O_ED_HH; time++){
    							String visitHour1 = String.format("%02d", time); //시작시간1
    							String visitHour2 = String.format("%02d", time+1); //시작시간2
    							String visitMinute = SHP_MST_O2O_ST_MM_STR; //시작분
    							String visitMinute2 = SHP_MST_O2O_ST_MM_STR; //시작분
    							
    							// 방문가능시간 마지막은 종료시간 분을 가져와야 한다.
    							if(time+1 == SHP_MST_O2O_ED_HH){
    								visitMinute2 = SHP_MST_O2O_ED_MM_STR;
    							}
    							
    							String timeStr = visitHour1 + ":" + visitMinute + "~" + visitHour2 + ":" + visitMinute2;
    							timeList2.add(timeStr);
    							//logger.debug(timeStr);
    							
    						}
    						StoreList.get(i).put("TIMESTR", timeList);
    						StoreList.get(i).put("TIMESTR2", timeList2);
            			}
            			mv.addObject("GetItNowShopInfo", GetItNowShopInfo);
            		}
            	}
            	
            }
            
        }
        
        mv.addObject("productInfo", productInfo);
        mv.addObject("addOptDtlList", addOptDtlList);
        mv.addObject("paging", paging);
        mv.addObject("StoreList", StoreList);
        mv.addObject("areaCodeList", this.pcCommonService.selectCode("COMMON_INFOSITE_AREA_GB"));	//지역
        mv.addObject("commandMap", commandMap);
		return mv;
	}
	
	/**
	* <pre>
	* 1. MethodName : searchProductEsmPopup
	* 2. ClassName : ProductController.java
	* 3. Comment : 가격흥정 팝업
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/product/searchProductEsmPopup.do")
	public ModelAndView searchProductEsmPopup(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			//상품정보조회
			commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
			// 카테고리 및 환경정보
	        commandMap.put("PRD_CTG_ENV", PRD_CTG_ENV ); // P는 웹, M은 모바일 
	        Map<String, Object> productInfo = this.productService.selectProduct(commandMap);
	        
	        
	     	String[] TEMP_OPT_DTL_IDXs = request.getParameterValues("OPT_DTL_IDXs");	// 상품 옵션 idx
	     	if(TEMP_OPT_DTL_IDXs != null){
		     	List<String> OPT_DTL_IDXs = Arrays.asList(TEMP_OPT_DTL_IDXs);
		     	
		        //해당 옵션 정보 가져오기
		        List<Map<String, Object>> optDtlList = null;
		        List<Map<String,Object>> addOptDtlList = new ArrayList<Map<String, Object>>();
		        ArrayList<String> optDtlErpCds = new ArrayList<String>();
		        
		        for(String OPT_DTL_IDX : OPT_DTL_IDXs){
		        	if(StringUtil.getInt(OPT_DTL_IDX) > 0){
			        	commandMap.put("OPT_DTL_IDX", OPT_DTL_IDX);
			        	optDtlList = this.productService.selectOptionDetailInfo(commandMap);
			        	optDtlList.get(0).put("OPT_DTL_REQ_CNT", StringUtil.getString(commandMap.get("REQUEST_CNT_"+OPT_DTL_IDX),""));
			        	
			        	//옵션의 erp코드 담기
			        	optDtlErpCds.add(StringUtil.getString(optDtlList.get(0).get("OPT_DTL_ERP_CD")).trim());
			        	addOptDtlList.add(optDtlList.get(0));
		        	}
		        }
		        mv.addObject("addOptDtlList", addOptDtlList);
	     	}
	     	
	     	commandMap.put("MEM_MST_MEM_ID",SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	     	
	     	// 회원타입(일반,간편,기업)
	        int memType = StringUtil.getInt(commandMap.get("memType"),0);
	        
	        // 회원 상세 정보
	        Map<String, Object> resultMap = new HashMap<String, Object>(); 
	        
	    	if(memType == Code.COMMON_COMP_MEMBER_GRADE)		// 기업회원
	    	{
	    		resultMap = this.pcMyInfoService.selectCompMemberInfo(commandMap);
	    	}
	    	else	// 기업회원 제외(일반,간편)
	    	{
	    		resultMap = this.pcMyInfoService.selectMemberInfo(commandMap);
	    	}
	        
	     	// Common Codes
	        String codes = "HP_CODE";
	        mv.addObject("codes", this.pcCommonService.selectCode(codes));
	        mv.addObject("productInfo", productInfo);
	        mv.addObject("memberInfo", resultMap);
	        mv.addObject("commandMap", commandMap);
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : esmProductRegist
	* 2. ClassName : ProductController.java
	* 3. Comment : 가격흥정 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/product/esmProductRegist.do")
	public ModelAndView esmProductRegist(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
	     	commandMap.put("ESM_MST_MEM_ID",SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	     	
	     	commandMap.put("ESM_MST_REG_IP", request.getRemoteAddr());
	        commandMap.put("ESM_MST_REG_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
	        
	        int result = 0;
	        
	        // 등록
	        result = this.productService.insertEstProduct(commandMap);
	        
	        if(result > 0){
	        	mv.addObject("closeMsg", "정상적으로 신청되었습니다.");
	        }else{
	        	mv.addObject("closeMsg", "신청에 실패하였습니다.");
	        }
	        mv.addObject("commandMap", commandMap);
	        mv.setViewName("/pc/common/result");
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : searchProductCpnPopup
	* 2. ClassName : ProductController.java
	* 3. Comment : 1:1쿠폰 다운로드 팝업
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	
	/**
     * @api {POST} /pc/product/searchProductCpnPopup.do
     * @apiName 쿠폰모두받기 팝업
     * @apiGroup 쿠폰
     * 
     * @apiParam {String} PRD_MST_CD 상품코드
     * 
     * @apiSuccess {Object[]} list 쿠폰 리스트 [{CPN_MST_MXM_PRC=최대할인금액, CPN_MST_GBN=쿠폰종류, CPN_MST_SML_PRC=최소구매금액, CPN_MST_TITLE=쿠폰명, CPN_MST_TGT_GBN=쿠폰적용상품구분(개별상품:A,전체상품:B,브랜드:C), CPN_MST_USE_ED_DT=2016.08.31, CPN_MST_USE_ST_DT=2016.08.01, CPN_MST_GBN_TYPE=price, CPN_MST_IDX=쿠폰번호, CPN_MST_USE_DAY=사용가능일수, CPN_MST_SAL_PRC=할인금액/율, CPN_MST_SAL_GBN=할인구분(정율:A/정액:B)}]
     */
	
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/product/searchProductCpnPopup.do")
	public ModelAndView searchProductCpnPopup(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			List<Map<String, Object>> list = null;
			
			// 로그인 회원정보
	        User user = SessionsUser.getSessionUser(request);
	        
	        commandMap.put("MEM_MST_MEM_GBN", user.getMEM_MST_MEM_GBN());
	        commandMap.put("MEM_MST_MEM_GRD", user.getMEM_MST_MEM_GRD());
	        
			list = this.pcMyCouponService.selectProductCouponList(request,commandMap);	//쿠폰 다운로드 가능 목록
			
			mv.addObject("list", list);
			mv.addObject("commandMap", commandMap);
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : ProductCouponRegist
	* 2. ClassName : ProductController.java
	* 3. Comment : 쿠폰 다운로드
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 21.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/product/ProductCouponRegist.do")
	public ModelAndView ProductCouponRegist(HttpServletRequest request,@RequestParams Map<String, Object> commandMap
			, @RequestParams(value="CPN_MST_IDXs") String[] CPN_MST_IDXs ) throws Exception {
		if(SessionsUser.isLogin(request))
        {
			ModelAndView mv = new ModelAndView();
			
			commandMap.put("arrCPN_MST_IDX", CPN_MST_IDXs);	//쿠폰 IDX
			commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			
			Map<String, Object> resultMap = null;
			
        	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
	        // 등록
        	resultMap = this.pcMyCouponService.insertDwnCoupon(commandMap);
	        
	        if(StringUtil.getInt(resultMap.get("result")) > 0 && StringUtil.getString(resultMap.get("returnState")) == "Y"){
	        	if(StringUtil.getString(resultMap.get("returnState")) == "Y"){
	        		if(StringUtil.getInt(resultMap.get("totCnt")) != StringUtil.getInt(resultMap.get("returnCouCnt"))){
	        			mv.addObject("closeMsg", "이미 발급받으신 쿠폰을 제외 한 나머지 쿠폰이 정상적으로 완료 되었습니다.");
	        		}else{
	        			mv.addObject("closeMsg", "해당 쿠폰은 이미 발급 받으셨습니다.");
	        		}
	        	}else{
	        		mv.addObject("closeMsg", "쿠폰 다운로드가 정상적으로 완료 되었습니다.");
	        	}
	        }else{
	        	if(StringUtil.getInt(resultMap.get("result")) > 0){
	        		mv.addObject("closeMsg", "쿠폰 다운로드가 정상적으로 완료 되었습니다.");
	        	}else{
	        		mv.addObject("closeMsg", "쿠폰 다운로드에 실패 하였습니다.");
	        	}
	        }
	        mv.addObject("commandMap", commandMap);
	        mv.setViewName("/pc/common/result");
			
			mv.addObject("commandMap", commandMap);
			return mv;
        }
		else
        {
        	throw new PcAuthenticationException();
        }
	}
	
	/**
	* <pre>
	* 1. MethodName : productCategoryBestListAjax
	* 2. ClassName : ProductController.java
	* 3. Comment : 카테고리 베스트 상품
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 22.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @param CPN_MST_IDXs
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping("/pc/product/productCategoryBestListAjax.do")
	public ModelAndView productCategoryBestListAjax(HttpServletRequest request,@RequestParams Map<String, Object> commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int cateBestTotalCount = this.productListService.selectProductListCount(commandMap);
		
        List<Map<String, Object>> listProductCateBest = null;
        
        commandMap.put("orderType","cateHit");
        commandMap.put("startNum",1);
        commandMap.put("endNum",5);
        if(cateBestTotalCount > 0){
        	listProductCateBest = this.productListService.selectProductList(commandMap);
        }
		
        mv.addObject("listProductCateBest", listProductCateBest);
		mv.addObject("commandMap", commandMap);
		return mv;
	}
	
}
