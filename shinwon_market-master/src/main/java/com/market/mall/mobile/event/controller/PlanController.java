package com.market.mall.mobile.event.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.mobile.event.service.PlanService;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;

@Controller("mobilePlanController")
public class PlanController {
	
	@Resource(name="mobilePlanService")
	PlanService mobilePlanService;
	
	private final static String [] _PRODUCT_LIST_ORDER_ = 
	{ 
		"", "ORD ASC", "PRD_MST_REG_DT DESC", "PRD_MST_CONSUMER_PRICE DESC", "PRD_MST_CONSUMER_PRICE ASC",
		"REP_POINT DESC", 
    	"FLAT_PRICE_YN DESC, PROD_PERAMT1 DESC",
    	"PRD_MST_CD ASC"			
	};
	
	private final static int _PLAN_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST; 
	private final static int _PLAN_THUMBNAIL_SIZE_BIG = Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG; 
	
	 
	
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
	@RequestMapping("/mobile/event/planProductList")
    public ModelAndView planProductList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
		ModelAndView mv = new ModelAndView();
		
		// 로그인 회원정보
        User user = SessionsUser.getSessionUser(request);
        boolean	pass	= true;
        
        if(SessionsUser.isLogin(request) ){
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}
        commandMap.put("MEM_LOGIN_YN", "M");
        
        if(!"".equals(StringUtil.getString(commandMap.get("PLN_MST_IDX")))){
        	
        	commandMap.put("searchPlnMstShopTypeMobile", "Y");
        	commandMap.put("CMM_FLE_TB_NM", 	"T_PLN_MST");//모바일용 이미지
            commandMap.put("CMM_FLE_TB_TYPE", 	"M"); //모바일용 이미지
            commandMap.put("CMM_FLE_SORT", 		"1"); //모바일용 목록 이미지
            
            commandMap.put("IMG_THUMBNAIL_SIZE", 		Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_LIST);
        	commandMap.put("IMG_THUMBNAIL_SIZE_BIG", 	Code.THUMBNAIL_SIZE_MOBILE_PRODUCT_ITEM_BIG);
        	
            // 기획전 상세 정보
            Map<String, Object> resultMap 	= this.mobilePlanService.selectPlanInfo(commandMap);
            
            Map planInfoMap					= (Map) resultMap.get("planInfo");
            
            String strPlnMstSta				= (String) planInfoMap.get("PLN_MST_STATUS");
            String strPlnMstUseYN			= (String) planInfoMap.get("PLN_MST_USE_YN");
            String secretOk					= "NO";
            
            if("end".equals(strPlnMstSta) || "N".equals(strPlnMstUseYN)){
            	mv.addObject("alertMsg", "종료된 기획전입니다.");
            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do?mainTabIndex=1");
            	mv.setViewName("mobile/common/result");
            }else{
            	
	            // 화면 상품목록 가져오기
	            commandMap.put("PRD_CTG_ENV", "M");
	            
	            Cookie[] cookies	= request.getCookies();
	            for(Cookie cookie : cookies){
            		if(("PLAN_" + commandMap.get("PLN_MST_IDX")).equals(cookie.getName())){
            			secretOk	= "OK";
            		}
	            }
	            // 시크릿일 경우 다른 처리 필요.입력번호 입력.
	            if("S".equals(planInfoMap.get("PLN_MST_TYPE"))){
	            	if(!"OK".equals(secretOk) || "N".equals(commandMap.get("MEM_LOGIN_YN"))){
	            		pass	= false;
	            	}
	            }

	            if(pass){
	            	// 기본정보
	                mv.addObject("planInfo",  		planInfoMap);
	                // 상품구성 그룹 목록
	                mv.addObject("detailGroupList", resultMap.get("detailGroupList"));
	                // 상품구성 목록
	                mv.addObject("detailList", 		resultMap.get("detailList"));
	                
	                mv.setViewName("mobile/event/planProductList");
	            }else{
	            	mv.addObject("alertMsg", "잘못 된 접근입니다.");
	            	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do?mainTabIndex=1");
	            	mv.setViewName("mobile/common/result");
	            }
            }
            
        }else{
        	mv.addObject("alertMsg", "잘못 된 접근입니다.");
        	mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("mobileDomain"), "") + "/mobile/main/index.do?mainTabIndex=1");
        	mv.setViewName("mobile/common/result");
        }
        
        mv.addObject("commandMap", commandMap);
        
        // 해당 브랜드로 이동
                
        return mv;
    }
	
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
     * @api {POST} /mobile/event/planList.do
     * @apiName 모바일 기획전 메인화면
     * @apiGroup Mobile 기획전
     * 
     * @apiParam {String} searchPlnMstStatus 기획전 진행(ing)/종료(end) 상태
     *
     * @apiSuccess {Object[]} toplist 기획전 상단 썸네일 목록 [{BNR_MST_TITLE:제목, BNR_MST_URL:URL, BNR_MST_DESC:상세문구, IMG_THUMBNAIL:썸네일이미지, CMN_FLE_ALT_TXT:대체텍스트 }]
     */
	@RequestMapping("/mobile/event/planList")
    public ModelAndView planList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("searchPlnMstShopTypeMobile", "Y");        //Mobile용 기획전
        commandMap.put("searchPlnMstStatus", StringUtil.getString(commandMap.get("searchPlnMstStatus"),"ing"));
        commandMap.put("BNR_MST_ENV", "M"); //Mobile 배너
        commandMap.put("CMN_COM_IDX", Code.PC_MAIN_PLAN_BANNER);
        
        // 상단 기획전  목록
        mv.addObject("toplist",  this.mobilePlanService.selectPlanTopList(commandMap));
                
        //RETURN OBJECT
        mv.addObject("commandMap", commandMap);
        
        mv.setViewName("mobile/event/planList");
        
        return mv;
    }
	
	/**
     * @api {POST} /mobile/event/planListAjax.do
     * @apiName 모바일 기획전 목록  ajax
     * @apiGroup Mobile 기획전
     *
     * @apiParam {String} searchPlnMstStatus 기획전 진행(ing)/종료(end) 상태
     * @apiParam {String} searchPlanMstType 기획전 일반(A)/매거진(M)
     * @apiParam {Integer} cPage 현재 페이지
     * @apiParam {String} searchPlnMstCtg  카테고리 인덱스  
     *
     * @apiSuccess {Object[]} list 기획전 목록 [{PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=219, PLN_MST_TITLE=청포도, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219171208, RNUM=1, CMM_FLE_SYS_NM=c8ac2255-9675-4741-98f9-8e3624311866.jpeg, PLN_MST_ED_DT=20200320, CMN_FLE_ALT_TXT=청포도, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=218, PLN_MST_TITLE=진저슈가, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219165234, RNUM=2, CMM_FLE_SYS_NM=836dc8ff-cb61-4e30-b57b-d94653e2f2ba.jpeg, PLN_MST_ED_DT=20200320, CMN_FLE_ALT_TXT=진저슈가, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=220, PLN_MST_TITLE=흑당, PLN_MST_ST_DT=20200220, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/20/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_DETAIL_TYPE=I, PLN_MST_REG_DT=20200220002644, RNUM=3, CMM_FLE_SYS_NM=b0101855-0a5f-49cc-b8e0-f63ad9fa10da.jpeg, PLN_MST_ED_DT=20200320, CMN_FLE_ALT_TXT=흑당, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=207, PLN_MST_TITLE=짱귀여움, PLN_MST_ST_DT=20200219, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/19/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219061837, RNUM=4, CMM_FLE_SYS_NM=a3b1bbd4-2978-4be4-8ce9-c4e17f189424.jpeg, PLN_MST_ED_DT=20200319, CMN_FLE_ALT_TXT=짱귀여움, PLN_MST_STATUS=ing, PLN_MST_TYPE=M}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=213, PLN_MST_TITLE=기획전 테스트, PLN_MST_ST_DT=20200219, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/19/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200219070218, RNUM=5, CMM_FLE_SYS_NM=c2b19daf-2ad5-439a-80ee-61c229b3a368.jpeg, PLN_MST_ED_DT=20200319, CMN_FLE_ALT_TXT=기획전 테스트, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=203, PLN_MST_TITLE=짱귀, PLN_MST_ST_DT=20200218, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/18/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200218080903, RNUM=6, CMM_FLE_SYS_NM=6327d245-5d82-48e0-842e-71acba41cbeb.jpeg, PLN_MST_ED_DT=20200318, CMN_FLE_ALT_TXT=오리, PLN_MST_STATUS=ing, PLN_MST_TYPE=M}, {PLN_MST_CHANNEL_MOBILE_YN=Y, PLN_MST_USE_YN=Y, PLN_MST_IDX=194, PLN_MST_TITLE=오리너구리기획전, PLN_MST_ST_DT=20200217, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/17/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200217080830, RNUM=7, CMM_FLE_SYS_NM=255cdbe6-5748-4219-b1bd-709db6f4f82c.jpeg, PLN_MST_ED_DT=20200317, CMN_FLE_ALT_TXT=오리너구리, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}, {PLN_MST_CHANNEL_MOBILE_YN=N, PLN_MST_USE_YN=Y, PLN_MST_IDX=191, PLN_MST_TITLE=기획전 테스트, PLN_MST_ST_DT=20200214, CMM_FLE_ATT_PATH=/attach/marketing/2020/02/14/, PLN_MST_CHANNEL_PC_YN=Y, PLN_MST_REG_DT=20200214040344, RNUM=8, CMM_FLE_SYS_NM=422cef1d-3ec0-4bc2-a2b2-51dc560cffb5.jpeg, PLN_MST_ED_DT=20200314, CMN_FLE_ALT_TXT=오리, PLN_MST_STATUS=ing, PLN_MST_TYPE=A}]
     */
    @RequestMapping("/mobile/event/planListAjax")
    public JSON planListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
        
        JSON json = new JSON();
        
        commandMap.put("searchPlnMstShopTypeMobile", "Y");        //Mobile용 기획전
        
        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");       //Mobile용 이미지
        commandMap.put("CMM_FLE_TB_TYPE", "M");             //Mobile용 이미지
        commandMap.put("CMM_FLE_SORT", "1");                //Mobile용 목록 이미지
        commandMap.put("PRD_CTG_ENV", "M");
        
        commandMap.put("searchPlnMstStatus", StringUtil.getString(commandMap.get("searchPlnMstStatus"), "ing"));
        commandMap.put("searchPlnMstCtg", StringUtil.getString(commandMap.get("searchPlnMstCtg"), ""));
        commandMap.put("searchPlanMstType", StringUtil.getString(commandMap.get("searchPlanMstType"),""));
        
        // 페이지 당 기본 기획전 출력 갯수
        commandMap.put("pageSize", StringUtil.getString(commandMap.get("pageSize"), "20"));
        
        int totalCount  = this.mobilePlanService.selectPlanListCount(commandMap);
        Paging paging   = new Paging(totalCount, commandMap); 
  
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0){
            // 기획전  목록
            list = this.mobilePlanService.selectPlanList(commandMap);
        }
        json.put("totalCount", StringUtil.getString(totalCount));
        json.put("list", list);
        return json;
    }

}
