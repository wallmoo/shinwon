package com.market.mall.pc.mypage.controller;

import java.text.SimpleDateFormat;
import java.time.DateTimeException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.erp.ErpRequest;
import com.market.mall.am.board.service.OotdBoardService;
import com.market.mall.am.display.service.TagDisplayService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.contents.service.ContentListService;
import com.market.mall.pc.mypage.service.MyBuyShoppingService;
import com.market.mall.pc.mypage.service.MyEventService;
import com.market.mall.pc.mypage.service.MyInquiryService;
import com.market.mall.pc.mypage.service.MyKeepService;
import com.market.mall.pc.mypage.service.MyPageService;
import com.market.mall.pc.mypage.service.MyPointService;
import com.market.mall.pc.mypage.service.MyProductCommentService;
import com.market.mall.pc.mypage.service.MyProductInquiryService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.ootd.service.OOTDCommentService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.tag.service.TagService;

/**
 * 
 * @PackageName: com.market.mall.pc.mypage.controller
 * @FileName : MyPageController.java
 * @Date : 2014. 7. 14.
 * @???????????? ?????? : ????????? > ??????????????? > ????????? ???????????? Controller Class
 * @author LJH
 */
@Controller("pcMyPageController")
public class MyPageController {
	
	@Resource(name="infoMemberService") private InfoMemberService infoMemberService;
	@Resource(name="productListService") 	private ProductListService productListService;
    @Resource(name="pcMyPageService")		private MyPageService pcMyPageService;
    @Resource(name="pcCommonService")		private CommonService pcCommonService;
    @Resource(name="pcMyEventService")      private MyEventService pcMyEventService;
    @Resource(name="pcMyBuyShoppingService") private MyBuyShoppingService pcMyBuyShoppingService;
    @Resource(name="pcMyInquiryService")	private MyInquiryService pcMyInquiryService;
    @Resource(name="pcMyKeepService") private MyKeepService pcMyKeepService;
    @Resource(name="pcMyProductCommentService") private MyProductCommentService pcMyProductCommentService;
    @Resource(name="pcMyProductInquiryService") private MyProductInquiryService pcMyProductInquiryService;
    @Resource(name="ootdBoardService") private OotdBoardService ootdBoardService;
    @Resource(name="TagService")	private TagService pcTagService;
    @Resource(name="tagDisplayService") 	private TagDisplayService tagDisplayService;
    
	 @Resource(name="contentListService")
	 private ContentListService contentListService;

    @Resource(name="pcMyShoppingService")
	 private MyShoppingService pcMyShoppingService;

	 @Resource(name="pcOOTDCommentService")
	 private OOTDCommentService ootdCommentService;
	 
	@Resource(name="pcMyPointService")
	private MyPointService pcMyPointService;	 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	private final static int MYPAGE_B_A_IDX = 214;
	
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST;
	private ErpRequest erpRequest;

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: myPageMain
	 * 2. ClassName		: MyPageController.java
     * 3. Comment    	: ????????? > ??????????????? > ?????? 
	 * 4. ?????????			: LeeJongHo
	 * 5. ?????????			: 2014. 7. 14. ?????? 1:56:12
	 * </pre>
	 *
	 * @return ModelAndView
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPageMain")
    
    public ModelAndView myPageMain (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
    	ModelAndView mv = new ModelAndView();

        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        
        // ?????? ?????? ??????
        Map<String,Object> memberInfo = this.infoMemberService.selectMemberInfo(commandMap);
        
        // ?????? ?????? ??????
        commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC???
        
        // ??????????????? ????????????
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
        // ????????????
        Map<String, Object> myPageOrderInfo = this.pcMyPageService.selectMyPageOrderInfo(commandMap);
        // ?????? ????????????
        List<Map<String, Object>> inquiryList = this.pcMyPageService.selectMyPageInquiryList(commandMap);      
        // ??????Q&A ??????
        List<Map<String, Object>> productInquiryList = this.pcMyPageService.selectProductInquiryList(commandMap);
        // ????????????
        commandMap.put("THUMBNAIL_SIZE",  Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL);
        List<Map<String, Object>> cartList = this.pcMyPageService.selectMyPageCartList(request, commandMap);

        commandMap.put("BANNER_IDX", MYPAGE_B_A_IDX );
        List<Map<String, Object>> listMYPAGE_B_A = this.productListService.selectBannerDisplayList(commandMap);

        mv.addObject("listMYPAGE_B_A", listMYPAGE_B_A);
        
        //????????? ?????????
        int evtTotalCnt = this.pcMyEventService.selectMyEventListCount(commandMap);
        //????????? ?????????
        commandMap.put("EVT_JOIN_WIN_YN", "Y");
        int evtWinTotalCnt = this.pcMyEventService.selectMyEventListCount(commandMap);
        
        // ?????? ?????????
        commandMap.put("myPageMainKeep", "Y");
        commandMap.put("CHN_GBN","P");
        List<Map<String,Object>> keepContentsList =this.pcMyKeepService.selectKeepContentsList(commandMap);
        
        // ?????? ??????
        // ?????? ????????? ????????? ??????
        int writableCount = this.pcMyProductCommentService.selectMyWritableProductCommentListCount(commandMap);
        // ????????? ????????? ??????
        int writtenCount = this.pcMyProductCommentService.selectMyWrittenProductCommentListCount(commandMap); 
        
        // ?????? ??????
        commandMap.put("THUMBNAIL_SIZE",  Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
        List<Map<String,Object>> keepProductList = this.pcMyKeepService.selectKeepProductList(commandMap);
        
        // ?????? Q&A
        Map<String,Object> productInquiryReplyCountMap = this.pcMyProductInquiryService.selectMyProductInquiryRplCountMap(commandMap);
        
        // ?????? ??????
        int kingerCount = this.pcMyPageService.selectKingerCount(commandMap);
              
        if(kingerCount > 0)
        {
            // ????????? ???????????? ?????? ??? IDX
            List<Map<String,Object>> kingerProductCommentList = this.pcMyPageService.selectkingerProductCommentList(commandMap);
            
            mv.addObject("kingerProductCommentList", kingerProductCommentList);
        }
        
        // ?????? ???????????? ??????
        mv.setViewName("pc/mypage/myPageMain");
        
        //?????? ????????? ??????
        // ????????? ?????? - ?????? ??????(-6?????? ??????)
        commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));
        commandMap.put("searchMaxDate", DateUtil.getToday("-"));
        commandMap.put("searchMinDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL);
        commandMap.put("startNum", 1);
        commandMap.put("endNum", 2);
        
        List<Map<String, Object>> listProduct = null;
        
        listProduct = this.pcMyBuyShoppingService.selectProductList(commandMap);
        
        //1:1?????? ??????/????????? ?????????
        commandMap.put("MEM_ADV_TYPE", "2238");
        Map<String, Object> inquiryRplCount = this.pcMyInquiryService.selectMyInquiryRplCount(commandMap);
        Map<String, Object> myPageCount = this.pcMyInquiryService.selectMyPageCount(commandMap);
 
        
        
        //?????????
        List<Map<String,Object>> myPageLike = this.pcMyPageService.selectMyPageLikList(commandMap);       
        
        //Ootd
        List<Map<String,Object>> myOotdList = this.pcMyPageService.selectMyPageOotdList(commandMap);       
        
        //RETURN OBJECT
        mv.addObject("myOotdList", myOotdList);
        mv.addObject("myPageLike", myPageLike);
        mv.addObject("memberInfo", memberInfo);
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("myPageCount", myPageCount);
        mv.addObject("myPageOrderInfo", myPageOrderInfo);
        mv.addObject("inquiryList", inquiryList);
        mv.addObject("productInquiryList",productInquiryList);
        mv.addObject("cartList", cartList);
        mv.addObject("evtTotalCnt", evtTotalCnt);
        mv.addObject("evtWinTotalCnt", evtWinTotalCnt);
        mv.addObject("listProduct", listProduct);
        mv.addObject("inquiryRplCount", inquiryRplCount);
        mv.addObject("keepContentsList", keepContentsList);
        mv.addObject("writableCount", writableCount);
        mv.addObject("writtenCount", writtenCount);
        mv.addObject("keepProductList", keepProductList);
        mv.addObject("productInquiryReplyCountMap", productInquiryReplyCountMap);
        mv.addObject("kingerCount", kingerCount);

        mv.addObject("commandMap", commandMap);
        return mv;
    }
    /*?????????*/
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/insertLike")
    public JSON myPageinsertLike (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, String PRD_MST_CD) throws Exception
    {
		JSON json = new JSON();			

        String prdMstCd = StringUtil.getString(StringUtil.getString(commandMap.get("PRD_MST_CD"), null)); 

        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        commandMap.put("LIK_HIS_REG_IP", request.getRemoteHost());
        commandMap.put("PRD_MST_CD", prdMstCd);
        System.out.println("================================>>>"+prdMstCd);
        System.out.println("================================>>>"+prdMstCd);
        System.out.println("================================>>>"+prdMstCd);
        int	result =this.pcMyShoppingService.insertLike(commandMap);
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}       
        return json;
    }

    /*???????????????*/
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/reInputAjax")
    public JSON myPageReInputAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, String PRD_MST_CD) throws Exception
    {
		JSON json = new JSON();			

		String param [] = StringUtil.getString(StringUtil.getString(commandMap.get("PRD_MST_CD"), null)).split(",");
        String prdMstCd = param[0]; 
        String prdMstCtx = param[1]; 

        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        commandMap.put("LIK_RIP_REG_IP", request.getRemoteHost());
        commandMap.put("PRD_MST_CD", prdMstCd);
        commandMap.put("PRD_CTG_IDX", Integer.parseInt(prdMstCtx));
        System.out.println("================================>>>"+prdMstCd);
        System.out.println("================================>>>"+prdMstCtx);
        System.out.println("================================>>>"+prdMstCd);
        int	result =this.pcMyShoppingService.insertReInputAjax(commandMap);
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}       
        return json;
    }
    
    /*??????????????? ??????*/
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPageReInputDelAjax")
    public JSON myPageReInputDelAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap, String PRD_MST_CD) throws Exception
    {
		JSON json = new JSON();			

        String prdMstCd = StringUtil.getString(commandMap.get("PRD_MST_CD"), null); 
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        commandMap.put("PRD_MST_CD", prdMstCd);
        System.out.println("================================>>>"+prdMstCd);
        int	result =this.pcMyShoppingService.myPageReInputDelAjax(commandMap);
		if(result > 0)
        {
            json.put("result", "success");
        }     
		else
		{
			json.put("result", "error");
		}       
        return json;
    }

    
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPageMainShopping")
    public ModelAndView myPageMainShopping (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	ModelAndView mv = new ModelAndView();
    	
    	
    	
    	// ??????????????? ????????????
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);

        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        // ?????? ?????? ??????
    	Map<String,Object> memberInfo = this.infoMemberService.selectMemberInfo(commandMap);
        // ?????? ?????? ?????? ??????
    	Map<String,Object> memberTotCnt = this.pcMyPageService.selectMyPageTotCnt(request, commandMap);
        
        // ??????????????? erp
    	commandMap.put("ESHOP_ID",SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
    	Map<String, Object> myEpointMap = erpRequest.requestMemberPointCheck(commandMap);
    	
        // ?????? ???????????? ?????? ??????
        int totalCount = pcMyShoppingService.selectMyShoppingListCount(commandMap);
        commandMap.put("pageSize", 10);
        commandMap.put("cPage", StringUtil.getString(commandMap.get("cPage"), "1"));        
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
            // ?????? ???????????? ??????
        	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        	list = this.pcMyShoppingService.selectMyShoppingList(commandMap);
        } 
        
        //???????????????
        List<Map<String, Object>> listPrw = this.pcMyShoppingService.selectMyShoppingPrwList(commandMap);
        
        mv.addObject("paging", paging);
        mv.addObject("myEpointMap", myEpointMap.get("MemberPointCheckResult"));
        mv.addObject("memberInfo", memberInfo);
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);
        mv.addObject("memberTotCnt", memberTotCnt);
        mv.addObject("list", list);
        mv.addObject("listPrw", listPrw);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : myPageOrderListAjax
    * 2. ClassName  : MyPageController.java
    * 3. Comment    : ??????????????? ?????? ?????? ???????????? ajax
    * 4. ?????????       : DEV_KANGHYUNKYU
    * 5. ?????????       : 2016. 1. 8.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myPageOrderListAjax")
    public ModelAndView myPageOrderListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        
        // ?????? ?????? ??????
     	commandMap.put("PRD_MST_CNL_PC_YN", "Y"); //PC???
     	
        // ?????? ???????????? ?????? ??????
     	commandMap.put("ORD_MST_ORD_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        int totalOrderCount = this.pcMyPageService.selectMyPageOrderListCount(commandMap);
        commandMap.put("pageSize", 5);
        Paging paging = new Paging(totalOrderCount, commandMap); 
        List<Map<String, Object>> orderList = null;
        if(totalOrderCount>0)
        {
            // ?????? ???????????? ??????
        	orderList = this.pcMyPageService.selectMyPageOrderList(commandMap);
        }
        
        mv.addObject("commandMap",commandMap);
        mv.addObject("orderList", orderList);
        mv.addObject("paging", paging);
        
        return mv;
    }
    
    /**
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     * @apiSuccess {Object} TAG_LIST
     */
    
    
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myFeedList")
    public ModelAndView myFeedList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
     // ????????? ????????????
        User user = SessionsUser.getSessionUser(request);
     // ??????????????? ????????????
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
        
        Cookie[] cookies	= request.getCookies();
        
        boolean areaCheck	= false;
        if(cookies != null){
    		for(Cookie cookie : cookies){
        		if("areaInfo".equals(cookie.getName())){
        			areaCheck	= true;
        		}
        	}
		}
        mv.addObject(RESPONSE_KEY.TAG_LIST, this.pcTagService.selectTagList());
        
        Map<String, Object> tagParamMap = new HashMap<>();
        if(StringUtils.isEmpty(user.getMEM_MST_MEM_ID())) {
        	tagParamMap.put("CMN_COM_IDX", "3721");
        	tagParamMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
        } else {
        	tagParamMap.put("CMN_COM_IDX", user.getMEM_MST_MEM_ID());
            tagParamMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_MEMBER);	
        }
        
        
        mv.addObject("feedTagList", this.tagDisplayService.selectTagDisplayList(tagParamMap));
        
        tagParamMap.put("CMN_COM_IDX", "3725");
 //     mv.addObject("searchTagList", this.tagDisplayService.selectSearchTagDisplayList(tagParamMap));
        mv.addObject("areaCheck", areaCheck);
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdList")
    public ModelAndView myOotdList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
     // ??????????????? ????????????
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
        
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdDetail")
    public ModelAndView myOotdDetail (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"), "")))
        {
   		 	User curUser = SessionsUser.getSessionUser(request);
        	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        	commandMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
        	
            Map<String, Object> resultMap = this.ootdBoardService.selectOOTDBoardInfo(commandMap);  // OOTD ?????? ????????????
            
            mv.addObject("row",resultMap.get("row")); // ?????? ??????
            mv.addObject("fileList", resultMap.get("fileList"));  // ???????????? ??????
            mv.addObject("ootdProductList", resultMap.get("ootdProductList")); // ???????????? ??????
            mv.addObject("tagList", resultMap.get("tagList")); //OOTD ?????? ?????? ?????????
            mv.addObject("wishTagList", resultMap.get("wishTagList")); //OOTD ?????? ???????????? ?????????
        }
        
        return mv;
    }
    
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdCommentListAjax")
    public JSON myOotdCommentListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        User curUser = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
        json.addObject("list", ootdCommentService.selectOOTDCommentHierachy(commandMap));
        json.addObject("count", ootdCommentService.selectOOTDCommentListCount(commandMap));
        
        
        return json;
    }

    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdCommentRegAjax")
    public JSON myOotdCommentRegAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        User curUser = SessionsUser.getSessionUser(request);
        commandMap.put("OTD_RPL_REG_ID", curUser.getMEM_MST_MEM_ID());
        commandMap.put("OTD_RPL_REG_IP", request.getRemoteAddr());
        
        
        ootdCommentService.insertOOTDComment(commandMap);
        
        return json;
    }

    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdCommentDelAjax")
    public JSON myOotdCommentDelAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        ootdCommentService.deleteOOTDComment(commandMap);
        
        return json;
    }
    
    
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdCommentModAjax")
    public JSON myOotdCommentModAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        User curUser = SessionsUser.getSessionUser(request);
        commandMap.put("OTD_RPL_UPD_ID", curUser.getMEM_MST_MEM_ID());
        commandMap.put("OTD_RPL_UPD_IP", request.getRemoteAddr());
        
        ootdCommentService.updateOOTDComment(commandMap);
        
        return json;
    }
    
    
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myOotdListAjax")
    public JSON myOotdListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
   	 	User curUser = SessionsUser.getSessionUser(request);
   	 	commandMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
   	 	commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
   	 	commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
	 
        List<Map<String, Object>> ootdList = contentListService.selectOotdContentsList(commandMap); //OOTD  ??????
        
        JSON json			= new JSON();
		 json.addObject("list", ootdList);
        return json;
    }
    
    
    //0629 ??????????????? > ????????????
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myReplyList")
    public ModelAndView myReplyList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
       ModelAndView mv = new ModelAndView();
        
       commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        
       //??????????????? ????????????
       Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
       
       //?????? ??????
       Calendar cal = Calendar.getInstance();
       cal.add(Calendar.MONTH,  -1);
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       
       String startDt = StringUtil.getString(commandMap.get("startDt"), sdf.format(cal.getTime()));
       String endDt = StringUtil.getString(commandMap.get("endDt"), sdf.format(new Date()));
       
       commandMap.put("startDt", startDt);
       commandMap.put("endDt", endDt);
       
       //?????????
       int totalCount = pcMyPageService.selectMyReplyListCount(commandMap);
       commandMap.put("pageSize", 10);
       commandMap.put("cPage", StringUtil.getString(commandMap.get("cPage"), "1"));        
       Paging paging = new Paging(totalCount, commandMap); 
       
       //?????? ?????????
       List<Map<String,Object>> replyList = this.pcMyPageService.selectReplyList(commandMap);
       
       try {
       	if(sdf.parse(startDt).compareTo(sdf.parse(endDt)) > 0) {
       		throw new DateTimeException("?????? ????????? ?????? ???????????? ????????? ?????????.");
       	}
			mv.addObject("startDt", sdf.format(sdf.parse(startDt)));
			mv.addObject("endDt", sdf.format(sdf.parse(endDt)));
		} catch (Exception e) {
		mv.addObject("returnUrl", request.getAttribute("serverSslDomain") + "/pc/mypage/myReplyList.do");
           mv.setViewName("pc/common/result");
           mv.addObject("alertMsg", "?????? ????????? ???????????? ????????????.");
           return mv;
		}
       
       mv.addObject("paging",paging);
       mv.addObject("replyList",replyList);
       mv.addObject("summaryMap", summaryMap);
       mv.addObject("commandMap", commandMap);
        
       return mv;
    }
    
    /**************************************************************************************************************************/
	/*
	 * @AccessLevelUser(ROLEUSER.user)
	 * 
	 * @RequestMapping("/pc/mypage/myLikeList") public ModelAndView myLikeList
	 * (HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
	 * throws Exception { ModelAndView mv = new ModelAndView();
	 * 
	 * //??????????????? ???????????? Map<String, Object> summaryMap =
	 * this.pcMyPageService.selectMyPageSummary(request, commandMap);
	 * 
	 * mv.addObject("summaryMap", summaryMap); mv.addObject("commandMap",
	 * commandMap);
	 * 
	 * return mv; }
	 */
    
    /*????????? ?????? ?????????*/
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/restockNotificationList")
    public ModelAndView restockNotificationList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        // ????????? ????????????
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);

        commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
        
        List<Map<String, Object>> restockNotificationList = this.pcMyPageService.restockNotificationList(commandMap); //OOTD  ??????
     
        int totalOrderCount = this.pcMyPageService.restockNotificationListCount(commandMap);
        commandMap.put("pageSize", 10);
        Paging paging = new Paging(totalOrderCount, commandMap);         
        
        
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("restockNotificationList", restockNotificationList);
        mv.addObject("commandMap", commandMap);
        
        
        
        return mv;
    }
    
    
	/*
	 * @AccessLevelUser(ROLEUSER.user)
	 * 
	 * @RequestMapping("/pc/mypage/myFavoriteList") public ModelAndView
	 * myFavoriteList (HttpServletRequest request, @RequestParams Map<String,
	 * Object> commandMap) throws Exception { ModelAndView mv = new ModelAndView();
	 * Map<String, Object> summaryMap =
	 * this.pcMyPageService.selectMyPageSummary(request, commandMap);
	 * 
	 * mv.addObject("summaryMap", summaryMap); mv.addObject("commandMap",
	 * commandMap);
	 * 
	 * 
	 * return mv; }
	 */
    
    
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/mypage/myFitList.do")
    public ModelAndView myFitList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        commandMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
        // ??????????????? ????????????
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request,commandMap);
        
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);
        mv.addObject("myfitCatList", this.pcMyPageService.selectMyFitAllCatList(commandMap));
        mv.addObject("myfitInfoList", this.pcMyPageService.selectMyFitInfoList(commandMap));
        
        return mv;
    }
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myFitListAjax.do")
	public JSON contentListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 

		 ObjectMapper mapper = new ObjectMapper();

		 String myfitList = commandMap.get("myfit_list").toString();
		 
		 
		List<HashMap> rstData = Arrays.asList(mapper.readValue(myfitList, HashMap[].class));
		
		 for(int i = 0 ; i < rstData.size(); i++) {
			 rstData.get(i).put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
		 }
		 this.pcMyPageService.insertMyFitInfo(rstData);
		 
		 return json;
	 }
    
    
	@AccessLevelUser(ROLEUSER.user)
	@RequestMapping("/pc/mypage/myRefundAccountList")
	public ModelAndView myRefundAccountList (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
        ModelAndView mv = new ModelAndView();
        Map<String, Object> summaryMap = this.pcMyPageService.selectMyPageSummary(request, commandMap);
        Map<String, Object> myRefundAccountMap = this.pcMyPageService.selectMyRefundAccount(request, commandMap);
        
        mv.addObject("myRefundAccountMap", myRefundAccountMap);
        mv.addObject("summaryMap", summaryMap);
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
}
