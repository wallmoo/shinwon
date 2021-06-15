package com.market.mall.pc.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.event.service.PlanService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.tag.service.TagService;

@Controller("pcPlanController")
public class PlanController {
	
	@Resource(name="pcPlanService")
	PlanService pcPlanService;
	
	@Resource(name="productListService")    
    private ProductListService productListService;

   
    @Autowired
    TagService tagService;
	
	private final static String [] _PRODUCT_LIST_ORDER_ = 
	{ 
		"", "ORD ASC", "PRD_MST_REG_DT DESC", "PRD_MST_CONSUM ER_PRICE DESC", "PRD_MST_CONSUMER_PRICE ASC",
		"REP_POINT DESC", 
    	"FLAT_PRICE_YN DESC, PROD_PERAMT1 DESC",
    	"PRD_MST_CD ASC"			
	};
	
	private final static int _PLAN_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : planList
	 * 2. ClassName : PlanController.java
	 * 3. Comment : 쇼핑 기획전  
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	/**
	 * @api {POST} /pc/event/planList.do
	 * @apiName 기획전 메인화면
	 * @apiGroup 기획전
	 * 
	 * @apiParam {String} searchPlnMstStatus 기획전 진행(ing)/종료(end) 상태
	 *
	 * @apiSuccess {Object[]} toplist 기획전 상단 썸네일 목록 [{BNR_MST_TITLE:제목, BNR_MST_URL:URL, BNR_MST_DESC:상세문구, IMG_THUMBNAIL:썸네일이미지, CMN_FLE_ALT_TXT:대체텍스트 }]
	 */
	@RequestMapping("/pc/event/planList")
    public ModelAndView planList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchPlnMstShopType", "Y"); 		//PC용 기획전
        commandMap.put("searchPlnMstStatus", StringUtil.getString(commandMap.get("searchPlnMstStatus"),"ing"));
        commandMap.put("BNR_MST_ENV", "P"); //PC 배너
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_PLAN_BANNER);
        
        // 상단 기획전  목록
        mv.addObject("toplist",  this.pcPlanService.selectPlanTopList(commandMap));
             
        commandMap.put("PRD_CTG_ENV", Code.USER_ENV_TYPE_PC);
        mv.addObject("listGnbMenu",  this.pcPlanService.selectPlanCategoryList(commandMap));
        
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        
        
        // 해당 브랜드로 이동
        mv.setViewName("pc/event/planList");
        
        return mv;
    }

    /**
     * @api {POST} /pc/event/planMagazine
     * @apiName 기획전 상세(매거진)
     * @apiGroup 기획전
     *
     * @apiParam {String} PLN_MST_IDX 기획전 idx
     *
     * @apiSuccess {Object} planInfo 기획전 기본 정보 { TAG_MST_TITLE = 대표태그, PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_PRD_DPL_YN=Y, PLN_MST_IDX=192, PLN_MST_TITLE=품격있개, PLN_MST_ST_DT=20200214, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/14/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_PC_BANNER=<p>&nbsp;</p>, PLN_MST_DESC=1, CMM_FLE_SYS_NM=759f42fc-23ad-462e-97e2-f1fe01bebd86.jpeg, PLN_MST_ED_DT=20200314, PLN_MST_STATUS=ing, PLN_MST_TYPE=M}
     * @apiSuccess {Object[]} detailGroupList 상품구성 그룹 목록 [{PLN_MST_IDX=192, PLN_GRP_DESC = 기획전_상품그룹_설명 , PLN_GRP_COL=4, PLN_GRP_SORT=기획전_상품_그룹_전시순서, PLN_GRP_TITLE=웰시코르키, PLN_GRP_IDX=기획전 상품그룹 인덱스, FILE_NM=대표이미지, CMM_FLE_ALT_TXT=대체텍스트, TAG_LIST = [{TAG_MST_TITLE:태그타이틀1},{TAG_MST_TITLE:태그타이틀2}] }]
     * @apiSuccess {Object[]} detailList 상품구성 목록 [{PRD_MST_SEL_CNT=96, PRD_MST_DSP_PRC=17600, TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6602, TAG_MST_TITLE=#꾸안꾸, PLN_PRD_MST_CD=S0011945, PLN_PRD_PRICE=17600, RNK=1, LIKE_COUNT=0, RNK_NUM=1, PRD_MST_NM=비욘드 커버 크림, IMG_THUMBNAIL=/attach/product/2017/11/24/S0011945/S0011945_0_450.jpg, PRD_CMM_OPT=[], PRD_SALE_RATE=0, MY_LIKE=N, RNK_GB=a, PLN_DTL_ORDER=1, PRD_MST_PRC=17600, PLN_GRP_IDX=376, PRD_MST_NM_SUB=[이니스프리] 비욘드 커버 크림, PRD_MST_SEL_STATE=I}]
     */
    @RequestMapping("/pc/event/planMagazine")
    public ModelAndView planMagazine (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView();
        
//      로그인 회원정보
       User user = SessionsUser.getSessionUser(request);
       boolean pass    = true;
       
       if(SessionsUser.isLogin(request) ){
           commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
           commandMap.put("MEM_LOGIN_YN", "Y");
       }else{
           commandMap.put("MEM_LOGIN_YN", "N");
       }
       
       String planIndex = StringUtil.getString(commandMap.get("PLN_MST_IDX"));
       
       if(!"".equals(planIndex)){
           
           commandMap.put("searchPlnMstShopType", "Y");        //PC용 기획전
           commandMap.put("CMM_FLE_TB_NM",     "T_PLN_MST");//PC용 이미지
           commandMap.put("CMM_FLE_TB_TYPE",   "P"); //PC용 이미지
           commandMap.put("CMM_FLE_SORT",      "1"); //PC용 목록 이미지
           commandMap.put("PRD_CTG_ENV", "P");
           commandMap.put("PLN_MST_TYPE","M"); //기획전 매거진 타입
           
           commandMap.put("IMG_THUMBNAIL_SIZE", _PLAN_THUMBNAIL_SIZE_);
           
           //기획전 해시태그
           Map<String, Object> tagParam = new HashMap<String, Object>();
           tagParam.put(TAG_MODEL.TAG_BND_ID, planIndex);
           tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PLAN);
           List<Map<String, Object>> tagList = tagService.selectTagListById(tagParam);
           mv.addObject(PARAM_CONST.TAG_LIST, tagList);
           
           // 기획전 상세 정보
           Map<String, Object> resultMap = this.pcPlanService.selectPlanInfo(commandMap);
           
           Map planInfoMap                 = (Map) resultMap.get("planInfo");
           
           if(planInfoMap == null){
               mv.addObject("alertMsg", "잘못 된 접근입니다.");
               mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/event/planList.do");
               mv.setViewName("pc/marketing/popup/result");
           }else{
               String strPlnMstSta             = (String) planInfoMap.get("PLN_MST_STATUS");
               String strPlnMstUseYN           = (String) planInfoMap.get("PLN_MST_USE_YN");

               // 기본정보
               mv.addObject("planInfo",        planInfoMap);
               // 상품구성 그룹 목록
               mv.addObject("detailGroupList", resultMap.get("detailGroupList"));
               // 상품구성 목록
               mv.addObject("detailList",      resultMap.get("detailList"));
               
           }
           
       }else{
           mv.addObject("alertMsg", "잘못 된 접근입니다.");
           mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/event/planList.do");
           mv.setViewName("pc/marketing/popup/result");
       }
       
       mv.addObject("commandMap", commandMap);
       
       // 해당 브랜드로 이동
               
       return mv;
    }
    
	
	/**
     * @api {POST} /pc/event/planListAjax.do
     * @apiName 기획전 목록  ajax
     * @apiGroup 기획전
     *
     * @apiParam {String} searchPlnMstStatus 기획전 진행(ing)/종료(end) 상태
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} searchPlnMstCtg  카테고리 인덱스  
     *
     * @apiSuccess {Object[]} list 기획전 목록 [{PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=219, PLN_MST_TITLE=청포도, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219171208, RNUM=1, CMM_FLE_SYS_NM=c8ac2255-9675-4741-98f9-8e3624311866.jpeg, PLN_MST_ED_DT=20200320, CMN_FLE_ALT_TXT=청포도, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=218, PLN_MST_TITLE=진저슈가, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219165234, RNUM=2, CMM_FLE_SYS_NM=836dc8ff-cb61-4e30-b57b-d94653e2f2ba.jpeg, PLN_MST_ED_DT=20200320, CMN_FLE_ALT_TXT=진저슈가, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=220, PLN_MST_TITLE=흑당, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_DETAIL_TYPE=I, PLN_MST_REG_DT=20200220002644, RNUM=3, CMM_FLE_SYS_NM=b0101855-0a5f-49cc-b8e0-f63ad9fa10da.jpeg, PLN_MST_ED_DT=20200320, CMN_FLE_ALT_TXT=흑당, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=207, PLN_MST_TITLE=짱귀여움, PLN_MST_ST_DT=20200219, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/19/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219061837, RNUM=4, CMM_FLE_SYS_NM=a3b1bbd4-2978-4be4-8ce9-c4e17f189424.jpeg, PLN_MST_ED_DT=20200319, CMN_FLE_ALT_TXT=짱귀여움, PLN_MST_STATUS=ing, PLN_MST_TYPE=M}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=213, PLN_MST_TITLE=기획전 테스트, PLN_MST_ST_DT=20200219, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/19/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219070218, RNUM=5, CMM_FLE_SYS_NM=c2b19daf-2ad5-439a-80ee-61c229b3a368.jpeg, PLN_MST_ED_DT=20200319, CMN_FLE_ALT_TXT=기획전 테스트, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=203, PLN_MST_TITLE=짱귀, PLN_MST_ST_DT=20200218, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/18/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200218080903, RNUM=6, CMM_FLE_SYS_NM=6327d245-5d82-48e0-842e-71acba41cbeb.jpeg, PLN_MST_ED_DT=20200318, CMN_FLE_ALT_TXT=오리, PLN_MST_STATUS=ing, PLN_MST_TYPE=M}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=194, PLN_MST_TITLE=오리너구리기획전, PLN_MST_ST_DT=20200217, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/17/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200217080830, RNUM=7, CMM_FLE_SYS_NM=255cdbe6-5748-4219-b1bd-709db6f4f82c.jpeg, PLN_MST_ED_DT=20200317, CMN_FLE_ALT_TXT=오리너구리, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=N, PLN_MST_USE_YN=Y, PLN_MST_IDX=191, PLN_MST_TITLE=기획전 테스트, PLN_MST_ST_DT=20200214, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/14/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200214040344, RNUM=8, CMM_FLE_SYS_NM=422cef1d-3ec0-4bc2-a2b2-51dc560cffb5.jpeg, PLN_MST_ED_DT=20200314, CMN_FLE_ALT_TXT=오리, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}]
     */
	@RequestMapping("/pc/event/planListAjax")
	public JSON planListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
	    JSON json = new JSON();
	    
        commandMap.put("searchPlnMstShopType", "Y");        //PC용 기획전
        
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");       //PC용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", "P");             //PC용 이미지
        commandMap.put("CMM_FLE_SORT", "1");                //PC용 목록 이미지
        commandMap.put("PRD_CTG_ENV", "P");
        
        commandMap.put("searchPlnMstStatus", StringUtil.getString(commandMap.get("searchPlnMstStatus"), "ing"));
        commandMap.put("searchPlnMstCtg", StringUtil.getString(commandMap.get("searchPlnMstCtg"), ""));
        
        int offset = Integer.parseInt(StringUtil.getString(commandMap.get("cPage"), "1"));
        int pageSize = Integer.parseInt(StringUtil.getString(commandMap.get("pageSize"), "18"));
        
        commandMap.put("startNum", offset); 
        commandMap.put("endNum", offset + pageSize - 1); 

        // 페이지 당 기본 기획전 출력 갯수
        //commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "18"));
        

        //int totalCount  = this.pcPlanService.selectPlanListCount(commandMap);
        //Paging paging   = new Paging(totalCount, commandMap); 
  
        List<Map<String, Object>> list = this.pcPlanService.selectPlanList(commandMap);
        
        //if(totalCount > 0){
            // 기획전  목록
        //    list = this.pcPlanService.selectPlanList(commandMap);
        //}
        //json.put("totalCount", StringUtil.getString(totalCount));
        
        json.put("list", list);
        return json;
    }
	/**
	 * 
	 * <pre>
	 * 1. MethodName : planProductList
	 * 2. ClassName : PlanController.java
	 * 3. Comment : 기획전 상세 상품 리스트 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 19.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
    /**
     * @api {POST} /pc/event/planProductList
     * @apiName 기획전 상세(일반)
     * @apiGroup 기획전
     *
     * @apiParam {String} PLN_MST_IDX 기획전 idx
     *
     * @apiSuccess {Object[]} planInfo 기획전 기본 정보 {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_PRD_DPL_YN=Y, PLN_MST_IDX=220, PLN_MST_TITLE=흑당, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_PC_BANNER=<p>&nbsp;</p>, TAG_MST_TITLE=#미세먼지, PLN_MST_MOBILE_BANNER=<p>&nbsp;</p>, PLN_MST_DETAIL_TYPE=I, PLN_MST_DESC=1, CMM_FLE_SYS_NM=b0101855-0a5f-49cc-b8e0-f63ad9fa10da.jpeg, PLN_MST_ED_DT=20200320, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}
     * @apiSuccess {Object[]} detailGroupList 상품구성 그룹 목록 [{PLN_GRP_IDX = 기획전그룹IDX, PLN_MST_IDX = 기획전IDX,  PLN_GRP_TITLE = 기획전그룹타이틀,  PLN_GRP_COL = 진열개수, PLN_GRP_SORT = 전시순서 , PLN_GRP_DESC=그룹 설명, FILE_NM = 파일경로,  CMM_FLE_ALT_TXT=대체텍스트}]
     * @apiSuccess {Object[]} detailList 기획전 상품 목록 [{PRD_MST_SEL_CNT=0, PRD_MST_DSP_PRC=24000, TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6602, TAG_MST_TITLE=#꾸안꾸, PLN_PRD_MST_CD=S0011949, PLN_PRD_PRICE=24000, RNK=1, LIKE_COUNT=0, RNK_NUM=1, PRD_MST_NM=옴므 이노팩트 스킨1, IMG_THUMBNAIL=/attach/product/2017/11/24/S0011949/S0011949_0_450.jpg, PRD_CMM_OPT=[], PRD_ROLL_OVER_IMG=/attach/product/2018/02/20/S0011949/S0011949_1_450.jpg, PRD_SALE_RATE=4, MY_LIKE=N, RNK_GB=a, PLN_DTL_ORDER=1, PRD_MST_PRC=25000, PLN_GRP_IDX=378, PRD_MST_NM_SUB=[올리브영] 옴므 이노팩트 스킨1, PRD_MST_SEL_STATE=I}, {PRD_MST_SEL_CNT=100, PRD_MST_DSP_PRC=30000, TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6602, TAG_MST_TITLE=#꾸안꾸, PLN_PRD_MST_CD=S0011948, PLN_PRD_PRICE=30000, RNK=2, LIKE_COUNT=0, RNK_NUM=2, PRD_MST_NM=옴므 리체인지 스페셜2, IMG_THUMBNAIL=/attach/product/2017/11/24/S0011948/S0011948_0_450.jpg, PRD_CMM_OPT=[], PRD_SALE_RATE=0, MY_LIKE=N, RNK_GB=b, PLN_DTL_ORDER=2, PRD_MST_PRC=30000, PLN_GRP_IDX=378, PRD_MST_NM_SUB=[훌리카훌리카] 옴므 리체인지 스페셜2, PRD_MST_SEL_STATE=I}, {PRD_MST_SEL_CNT=100, PRD_MST_DSP_PRC=30000, TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6602, TAG_MST_TITLE=#꾸안꾸, PLN_PRD_MST_CD=S0011948, PLN_PRD_PRICE=30000, RNK=1, LIKE_COUNT=0, RNK_NUM=1, PRD_MST_NM=옴므 리체인지 스페셜2, IMG_THUMBNAIL=/attach/product/2017/11/24/S0011948/S0011948_0_450.jpg, PRD_CMM_OPT=[], PRD_SALE_RATE=0, MY_LIKE=N, RNK_GB=a, PLN_DTL_ORDER=1, PRD_MST_PRC=30000, PLN_GRP_IDX=379, PRD_MST_NM_SUB=[훌리카훌리카] 옴므 리체인지 스페셜2, PRD_MST_SEL_STATE=I}, {PRD_MST_SEL_CNT=97, PRD_MST_DSP_PRC=4500, TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6602, TAG_MST_TITLE=#꾸안꾸, PLN_PRD_MST_CD=S0011947, PLN_PRD_PRICE=4500, RNK=2, LIKE_COUNT=0, RNK_NUM=2, PRD_MST_NM=다슈 썬크림2, IMG_THUMBNAIL=/attach/product/2017/11/24/S0011947/S0011947_0_450.jpg, PRD_CMM_OPT=[], PRD_SALE_RATE=0, MY_LIKE=N, RNK_GB=b, PLN_DTL_ORDER=2, PRD_MST_PRC=4500, PLN_GRP_IDX=379, PRD_MST_NM_SUB=[네이쳐리퍼블릭] 다슈 썬크림2, PRD_MST_SEL_STATE=I}]
     */
	@RequestMapping("/pc/event/planProductList")
    public ModelAndView planProductList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		ModelAndView mv = new ModelAndView();
		
//		 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
		boolean	pass	= true;
		
        if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
        
        if(!"".equals(StringUtil.getString(commandMap.get("PLN_MST_IDX")))){
        	
        	commandMap.put("searchPlnMstShopType", "Y"); 		//PC용 기획전
        	commandMap.put("CMM_FLE_TB_NM", 	"T_PLN_MST");//PC용 이미지
            commandMap.put("CMM_FLE_TB_TYPE", 	"P"); //PC용 이미지
            commandMap.put("CMM_FLE_SORT", 		"1"); //PC용 목록 이미지
            commandMap.put("PRD_CTG_ENV", "P");
            commandMap.put("PLN_MST_TYPE","A");//기획전 일반 타입
            
            commandMap.put("IMG_THUMBNAIL_SIZE", _PLAN_THUMBNAIL_SIZE_);
        	
            // 기획전 상세 정보
            Map<String, Object> resultMap = this.pcPlanService.selectPlanInfo(commandMap);
            
            Map planInfoMap					= (Map) resultMap.get("planInfo");
            
            if(planInfoMap == null){
            	mv.addObject("alertMsg", "잘못 된 접근입니다.");
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/event/planList.do");
            	mv.setViewName("pc/marketing/popup/result");
            }else{
	            String strPlnMstSta				= (String) planInfoMap.get("PLN_MST_STATUS");
	            String strPlnMstUseYN			= (String) planInfoMap.get("PLN_MST_USE_YN");
	            
	            if("end".equals(strPlnMstSta) || "N".equals(strPlnMstUseYN)){
	            	mv.addObject("alertMsg", "종료된 기획전입니다.");
	            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/event/planList.do");
	            	mv.setViewName("pc/common/result");
	            }else{
                	// 기본정보
                    mv.addObject("planInfo",  		planInfoMap);
                    // 상품구성 그룹 목록
                    mv.addObject("detailGroupList", resultMap.get("detailGroupList"));
                    // 상품구성 목록
                    mv.addObject("detailList",      resultMap.get("detailList"));
                    
                    mv.setViewName("pc/event/planProductList");
	            }
            }
            
        }else{
        	mv.addObject("alertMsg", "잘못 된 접근입니다.");
        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("frontDomain"), "") + "/pc/event/planList.do");
        	mv.setViewName("pc/marketing/popup/result");
        }
        
        mv.addObject("commandMap", commandMap);
                
        return mv;
    }
	
	/**
	* <pre>
	* 1. MethodName : prePlanProductList
	* 2. ClassName : PlanController.java
	* 3. Comment : 관리자에서 기획전 상세 미리보기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 7. 1.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@RequestMapping("/pc/event/prePlanProductList")
	public ModelAndView prePlanProductList (HttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		
		// 브랜드 코드 가져오기
        commandMap.put("BRAND_CD", request.getAttribute("serverBrandCd"));
		
		// 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
		
        if(SessionsUser.isLogin(request) ){
			//commandMap.put("MEM_MST_MEMBER_GROUP", user.getMEM_MST_MEMBER_GROUP());
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}
		else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
        
        if(!"".equals(StringUtil.getString(commandMap.get("PLN_MST_IDX"))))
        {
        	commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");//PC용 이미지
            commandMap.put("CMM_FLE_TB_TYPE", "P"); //PC용 이미지
            commandMap.put("CMM_FLE_SORT", "1"); //PC용 목록 이미지
            commandMap.put("prePlan", "Y");	// 미리보기
            
            commandMap.put("IMG_THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
            
            // 기획전 상세 정보
            Map<String, Object> resultMap = this.pcPlanService.selectPlanInfo(commandMap);
            
            Map<String, Object> planInfo	= (Map<String, Object>) resultMap.get("planInfo");
            
            String strPlnMstSta				= (String) planInfo.get("PLN_MST_STATUS");
            String strPlnMstUseYN			= (String) planInfo.get("PLN_MST_USE_YN");
            
           
            // 기본정보
            mv.addObject("planInfo",  planInfo);
            // 상품구성 그룹 목록
            mv.addObject("detailGroupList", resultMap.get("detailGroupList"));
            // 상품구성 목록
            mv.addObject("detailList", resultMap.get("detailList"));
        
			// 화면 상품목록 가져오기
	        commandMap.put("PRD_CTG_ENV", "P");
	        
			// 동일 브랜드 다른 기획전  목록
	        commandMap.put("searchPlnMstShopType", "Y"); //PC용 기획전
	        mv.addObject("ingPlanList",  this.pcPlanService.selectOtherPlanList(commandMap));
			
	        int pSort = 1;
	        if( !StringUtil.isNullToString(commandMap.get("pSort")).equals("")){
	        	try{
	        		pSort = Integer.parseInt((String)commandMap.get("pSort"),10);
	        	}catch(NumberFormatException e){
	        		pSort = 1;
	        	}
	        }       
	        commandMap.put("PRODUCT_LIST_ORDER", _PRODUCT_LIST_ORDER_[pSort]);
	        
	        if( StringUtil.isNullToString(commandMap.get("productPrice")).contains("|") ){
	        	String [] price = ((String)commandMap.get("productPrice")).split("\\|");
	        	if( price[0].length()>0 ){
	        		commandMap.put("PRICE_START", Integer.parseInt(price[0]));
	        	}
	        	if( price.length>1 && price[1].length()>0 ){
	        		commandMap.put("PRICE_END", Integer.parseInt(price[1]));
	        	}
			}
	        
	        int totalCount = this.pcPlanService.selectPlanProductListCount(commandMap);
	        Paging paging = new Paging(totalCount, commandMap);
	
	        //기획전 상품 리스트
	        commandMap.put("THUMBNAIL_SIZE", _PLAN_THUMBNAIL_SIZE_);
			List<Map<String, Object>> planProductList = this.pcPlanService.selectPlanProductList(commandMap);
			
			 //기획전 메인 배너 목록
	        commandMap.put("mainYn", "N"); //메인/디테일 화면 여부
			mv.addObject("planBannerList", this.pcPlanService.selectPlanBannerList(commandMap));
	
			// 상당 카테고리 단계표시
			List<Map<String, Object>> listMenuCategory = this.pcPlanService.selectSubCategoryList(commandMap);
			
			// 브랜드 이미지
	//		mv.addObject("BI", BI);
			
			mv.addObject("planProductList", planProductList );
	      	mv.addObject("listMenuCategory", listMenuCategory );
	      	
	      	mv.addObject("paging", paging);
	        mv.addObject("commandMap", commandMap);
	        
	        // 해당 브랜드로 이동
	        mv.setViewName("pc/event/prePlanProductList");
        }
  
        return mv;
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName : planSecretSale
	 * 2. ClassName : PlanController.java
	 * 3. Comment : 프론트 > 기획전 > 시크릿 입장권 번호 페이지 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/planSecretSale")
	public ModelAndView planSecretSale(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		User user = SessionsUser.getSessionUser(request);
		
		if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			commandMap.put("MEM_LOGIN_YN", "Y");
		}else{
			commandMap.put("MEM_LOGIN_YN", "N");
		}
		
		Cookie del_cookie = new Cookie("PLAN_" + commandMap.get("PLN_MST_IDX"), "");
        del_cookie.setMaxAge(0); 
        del_cookie.setPath("/");
 		response.addCookie(del_cookie);
 		
		mv.addObject("commandMap", commandMap);
		mv.setViewName("pc/event/planSecretSale");
		
		return mv;
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : planSecretSaleCheck
	 * 2. ClassName : PlanController.java
	 * 3. Comment : 프론트 > 기획전 > 시크릿 입장권 번호 체크 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 3. 17.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pc/event/planSecretSaleCheck")
	public JSON planSecretSaleCheck(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String,Object> commandMap) throws Exception{
		JSON json		= new JSON();
		
		commandMap.put("searchPlnMstShopType", "Y");
		
		User user = SessionsUser.getSessionUser(request);
		
        if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			
			int result	= this.pcPlanService.planSecretSaleCheck(commandMap);
			
			if(result > 0){
				json.addObject("url", request.getAttribute("frontDomain") + "/pc/event/planProductList.do?PLN_MST_IDX=" + commandMap.get("PLN_MST_IDX"));

    			Cookie secretCookie = new Cookie("PLAN_" + commandMap.get("PLN_MST_IDX"), "OK");
    			secretCookie.setPath("/");
        		response.addCookie(secretCookie);
        		
			}else{
				json.addObject("resultMsg", "잘못된 입장권 번호입니다.");
			}
			json.addObject("result", result);
		}else{
			json.addObject("result", 0);
			json.addObject("resultMsg", "로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		}
        
		return json;
	}
}
