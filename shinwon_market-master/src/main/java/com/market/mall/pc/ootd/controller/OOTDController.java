package com.market.mall.pc.ootd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.board.service.OotdBoardService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.VALIDATE_CODE;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.model.ootd.OOTD_MODEL;
import com.market.mall.pc.mypage.service.MyBuyShoppingService;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.ootd.service.OOTDCommentService;
import com.market.mall.pc.ootd.service.OOTDService;
import com.market.mall.pc.product.service.ProductListService;
import com.market.mall.pc.tag.service.TagService;
import com.market.util.TestLoginSession;

/**
 * <pre>
 * @PackageName : com.market.mall.pc.ootd.controller
 * @FileName : OOTDController.java
 * </pre>
 *
 * @Author : "KIMHYEWON"
 * @Date : 2020. 1. 30.
 */
@Controller("pcOOTDController")
public class OOTDController {

    @Resource(name="pcOOTDService") private OOTDService pcOOTDService;
    @Resource(name="pcOOTDCommentService") private OOTDCommentService pcOOTDCommentService;
    @Resource(name="pcMyShoppingService") private MyShoppingService pcMyShoppingService;
    @Resource(name="pcMyBuyShoppingService") private MyBuyShoppingService pcMyBuyShoppingService;
    @Resource(name="productListService") private ProductListService productListService;
    @Resource(name="ootdBoardService") private OotdBoardService ootdBoardService;

    @Autowired
    TagService tagService;
    
    /**
     * @api {POST} /pc/ootd/ootdView.do
     * @apiName OOTD ?????? ??????
     * @apiGroup OOTD
     *
     * @apiParam {String} CNT_MST_IDX OOTD ?????? IDX 
     *
     * @apiSuccess {Object} row OOTD ?????? ??????
     * @apiSuccess {Object[]} fileList OOTD ????????? ?????????
     * @apiSuccess {Object[]} ootdProductList OOTD ?????? ?????? ?????????
     * @apiSuccess {Object[]} tagList ?????? ?????????
     * @apiSuccess {Object[]} wishTagList ?????? ?????? ?????????
     */
    @RequestMapping("/pc/ootd/ootdView")
    public ModelAndView ootdView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        
        commandMap.put(PARAM_CONST.MEM_MST_MEM_ID, user.getMEM_MST_MEM_ID());
        
        //String userNM = user.getMEM_MST_MEM_NM();
        //String userIMG = null;
        
        
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
        
        //mv.addObject(RESPONSE_KEY.USER_NM, userNM);
        //mv.addObject(RESPONSE_KEY.USER_IMG, userIMG);
        
        return mv;
    }
    
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/ootdCommentListAjax")
    public JSON ootdCommentListAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        User curUser = SessionsUser.getSessionUser(request);
        commandMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
        json.addObject("list", pcOOTDCommentService.selectOOTDCommentHierachy(commandMap));
        json.addObject("count", pcOOTDCommentService.selectOOTDCommentListCount(commandMap));
        
        
        return json;
    }
    
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/ootdCommentRegAjax")
    public JSON ootdCommentRegAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        User curUser = SessionsUser.getSessionUser(request);
        commandMap.put("OTD_RPL_REG_ID", curUser.getMEM_MST_MEM_ID());
        commandMap.put("OTD_RPL_REG_IP", request.getRemoteAddr());
        
        
        pcOOTDCommentService.insertOOTDComment(commandMap);
        
        return json;
    }

    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/ootdCommentDelAjax")
    public JSON ootdCommentDelAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        pcOOTDCommentService.deleteOOTDComment(commandMap);
        
        return json;
    }
    
    
    @FrontBannerSkip
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/ootdCommentModAjax")
    public JSON ootdCommentModAjax (HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        
        User curUser = SessionsUser.getSessionUser(request);
        commandMap.put("OTD_RPL_UPD_ID", curUser.getMEM_MST_MEM_ID());
        commandMap.put("OTD_RPL_UPD_IP", request.getRemoteAddr());
        
        pcOOTDCommentService.updateOOTDComment(commandMap);
        
        return json;
    }
    
    
    
    /**
     * @api {POST} /pc/ootd/ootdForm.do
     * @apiName OOTD ?????? ??????
     * @apiGroup OOTD
     * 
     * @apiParam {String} MEM_MST_MEM_ID ?????? ID
     * 
     * @apiSuccess {Object[]} TAG_LIST ?????? ??????  [{TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6603, TAG_MST_TITLE=#???}, {TAG_MST_ID=0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d, TAG_MST_TITLE=#??????}, {TAG_MST_ID=3ab567b2-6b9b-4956-9661-0ffaccb5b280, TAG_MST_TITLE=#?????????}, {TAG_MST_ID=42ab4d51-62bb-4cc2-8cec-437199a64c7f, TAG_MST_TITLE=#???}]
     * @apiSuccess {Object[]} OOTD_PRD_LIST ??? ?????? ????????? [{ORD_PRD_IDX=341208, ORD_MST_CD=2020050303900, PRD_IMAGE_ALT=??????????????????, PRD_MST_OPT_EST_CNT=0, PRD_NOW_DST_PRICE=20000, TAG_MST_TITLE=#???, SUB_OPTION_CNT=0, PRD_MST_NM=[GINNASIX2] ??????????????????05-01, PRD_IMAGE=/attach/product/2020/05/01/S0012189/S0012189_0_125.png, ERP_MST_DSP_PRC=0, PRD_MST_CD=S0012189, PRD_RNUM=1, ORD_MST_ORD_DT=20200503115442, BND_MST_BRAND_NM=GINNASIX2, PRD_MST_PRICE=20000}, {ORD_PRD_IDX=341184, ORD_MST_CD=2020043003836, PRD_MST_OPT_EST_CNT=0, PRD_NOW_DST_PRICE=45000, TAG_MST_TITLE=#???, SUB_OPTION_CNT=0, PRD_MST_NM=[MARKM] [20SS??????]?????? ??? ????????? (BAAFB2002), PRD_IMAGE=/pc/img/second/NoImage_250.jpg, ERP_MST_DSP_PRC=0, PRD_MST_CD=S0012152, PRD_RNUM=2, ORD_MST_ORD_DT=20200430092149, BND_MST_BRAND_NM=MARKM, PRD_MST_PRICE=45000}, {ORD_PRD_IDX=341176, ORD_MST_CD=2020042603800, PRD_MST_OPT_EST_CNT=0, PRD_NOW_DST_PRICE=80000, TAG_MST_TITLE=#??????, SUB_OPTION_CNT=0, PRD_MST_NM=[GINNASIX2] , PRD_IMAGE=/attach/product/2020/04/16/S0012084/S0012084_0_125.png, ERP_MST_DSP_PRC=0, PRD_MST_CD=S0012084, PRD_RNUM=3, ORD_MST_ORD_DT=20200426094405, BND_MST_BRAND_NM=GINNASIX2, PRD_MST_PRICE=80000}]
     * @apiSuccess {Object} commandMap ???????????????
     */
    @AccessLevelUser(ROLEUSER.user)
    @RequestMapping("/pc/ootd/ootdForm")
    public ModelAndView ootdForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        
        if(!SessionsUser.isLogin(request) ){
            throw new PcAuthenticationException();
        }
        commandMap.put(PARAM_CONST.MEM_MST_MEM_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
        
        Map<String, Object> memberParamMap = new HashMap<String, Object>();
        memberParamMap.put(PARAM_CONST.MEM_MST_MEM_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
        memberParamMap.put("CMN_COM_IDX", Code.OOTD_PREVILEGE);  //OOTD ?????? ??????
        
        Map<String, Object> memberPrivilege = this.pcOOTDService.selectMemberPrivilege(memberParamMap);
        //OOTD ?????? ?????? ??????
        
        if(memberPrivilege != null && StringUtil.getString(memberPrivilege.get("CMN_COM_IDX")).equals(Code.OOTD_PREVILEGE))
        {
            mv.addObject("OOTD_PREVILEGE_YN", "Y");
        }
        
        Map<String, Object> tagParam = new HashMap<String, Object>();
        tagParam.put("CMN_COM_IDX", Integer.toString(Code.TAG_DISPLAY_TAG_OOTD_REG)); //OOTD ?????? ??????
        tagParam.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY); //OOTD ?????? ??????
        
        List<Map<String, Object>> tagList = this.tagService.selectTagDisplayList(tagParam);
        
        List<Map<String, Object>> myProductList = null;
        
        //?????? ????????? ??????
        //????????? ?????? - ?????? ??????(-6?????? ??????)
        commandMap.put("OST_FIX", Code.OST_FIX);
        
        commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
        commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL);
        
        int total = this.pcOOTDService.selectMyShoppingListCount(commandMap);
        
        if(total > 0){
            myProductList = this.pcOOTDService.selectMyShoppingList(commandMap);
        }
        else if(memberPrivilege == null || !StringUtil.getString(memberPrivilege.get("CMN_COM_IDX")).equals(Code.OOTD_PREVILEGE))
        {
            mv.addObject("alertMsg", "????????? ????????? ????????????.");
            mv.addObject("returnUrl", "/pc/main/index.do");
            mv.setViewName("pc/common/result");
            return mv;
        }
        
        mv.addObject(PARAM_CONST.TAG_LIST, tagList);
        mv.addObject(PARAM_CONST.OOTD_PRD_LIST, myProductList);
        mv.addObject("commandMap", commandMap);
        
        return mv;
   }
    /**
     * @api {POST} /pc/ootd/ootdSearchProductAjax.do
     * @apiName ???????????? OOTD ?????? ??????  Ajax
     * @apiGroup OOTD
     *
     * @apiParam {String} PRD_CTG_IDX ?????? ???????????? ????????? ?????????
     * @apiParam {String} searchPrdMstCd ?????? ????????????
     * @apiParam {String} searchPrdMstNm ?????? ?????????
     * 
     * @apiSuccess {Integer} totalCount ?????? ?????? ?????? ??? ??????
     * @apiSuccess {Object[]} productList ?????? ????????? 
     */
    @FrontBannerSkip()
    @RequestMapping("/pc/ootd/ootdSearchProductAjax")
    public JSON ootdSearchProductAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	
    	JSON json = new JSON();
    	User user = SessionsUser.getSessionUser(request);
    	
        commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
        commandMap.put("catIdx", StringUtil.getString(commandMap.get("PRD_CTG_IDX")));
        
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
        commandMap.put("MEM_MST_ID", user.getMEM_MST_MEM_ID());
        commandMap.put("MEM_CRT_SES_ID", user.getMEM_MST_MEM_ID());
        
        if(commandMap.containsKey("searchPrdMstCd")) {
        	String prdMstCds = commandMap.get("searchPrdMstCd").toString();
        	String[] mstCds = prdMstCds.split("\r\n");
        	
        	List<String> prdMstList = new ArrayList<String>();

        	for(int i = 0 ; i < mstCds.length; i++) {
        		if(!StringUtil.isEmpty(mstCds[i]))
        		prdMstList.add(mstCds[i]);
        	}
        	
        	commandMap.put("searchPrdMstCds", prdMstList);
        	commandMap.remove("searchPrdMstCd");
        }
        
         
        int totalCount = this.productListService.selectProductListCount(commandMap);
        
        List<Map<String,Object>> productList = null;
        
        if(totalCount > 0){
            productList = this.productListService.selectProductList(commandMap);
        }
        json.addObject("totalCount", totalCount);
        json.addObject("productList", productList);
        
        return json;
    }
    
    /**
     * @api {POST} /pc/ootd/ootdRegist.do
     * @apiName OOTD ?????? ??????
     * @apiGroup OOTD
     *
     * @apiParam {String} CNT_MST_TITLE ootd ??????
     * @apiParam {String} CNT_MST_DESC ootd ??????
     * @apiParam {File} file ootd ?????????????????????
     * @apiParam {String[]} PRD_MST_CD OOTD ?????? ???????????? ??????
     * @apiParam {JSON} tagData  OOTD??????  [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}]
     * @apiParam {String} WSH_TAG_TITLE_LIST  ???????????? ?????????
     * 
     * @apiSuccess {String} alertMsg ?????? ??????/?????? ?????????
     * @apiSuccess {String} returnUrl ?????? ??? ???????????? URL
     */
    
    @RequestMapping("/pc/ootd/ootdRegist")
    public ModelAndView ootdRegist(MultipartHttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        ModelAndView mv = new ModelAndView();
        
        if(!SessionsUser.isLogin(request) ){
            throw new PcAuthenticationException();
        }
        
        commandMap.put(OOTD_MODEL.REG_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
        commandMap.put("MEM_LOGIN_YN", "Y");
        
         //ootd ??????
        int result = this.pcOOTDService.insertOOTDData(request, commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "?????? ???????????????.");
            mv.addObject("returnUrl", "/pc/mypage/myOotdList.do");
        }
        else
        {
            mv.addObject("alertMsg", "????????? ?????????????????????.");
            mv.addObject("returnUrl", "/pc/main/index.do");
        }
        
        mv.setViewName("pc/common/result");
         
        return mv;
    }
    
    /**
     * @api {POST} /pc/ootd/ootdEdit.do
     * @apiName OOTD ?????? ??????
     * @apiGroup OOTD
     *
     * @apiParam {String} CNT_MST_IDX OOTD??????IDX 
     *
     * @apiSuccess {Object} row OOTD ?????? ??????  {CNT_MST_DESC=OOTD ????????????????????????, REPLY_COUNTS=3, CNT_MST_TYPE=TYPE_OOTD, LIKE_COUNTS=0, CNT_MST_TITLE=OOTD ?????????, CNT_MST_REG_DT=20200504113701, MY_LIKE=N, CNT_MST_REG_ID=pure0311, CNT_MST_IDX=145, CNT_MST_USE_YN=Y}
     * @apiSuccess {Object[]} fileList OOTD ????????? ????????? [{CMM_FLE_ATT_EXT=jpg, CMM_FLE_ATT_SIZE=55691, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/board/2020/05/04/1938c41b-f884-4d5c-8c75-9746c5b734d5.jpg, CMM_FLE_ATT_PATH=/attach/board/2020/05/04/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=elsa.jpg, CMM_FLE_SORT=1, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=145, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5777, CMM_FLE_REG_DT=20200504113733, CMM_FLE_SYS_NM=1938c41b-f884-4d5c-8c75-9746c5b734d5.jpg}, {CMM_FLE_ATT_EXT=jpg, CMM_FLE_ATT_SIZE=37725, CMM_FLE_SAVE_PATH=/mnt/data/tomcat/cdn/attach/board/2020/05/04/c4acad85-3ef6-4c44-8451-bfdbf194fe28.jpg, CMM_FLE_ATT_PATH=/attach/board/2020/05/04/, CMM_FLE_TB_NM=T_CNT_MST, CMM_FLE_ORG_NM=??????.jpg, CMM_FLE_SORT=2, CMM_FLE_SYS_PATH=/mnt/data/tomcat/cdn, CMM_FLE_TB_PK=145, CMM_FLE_USE_YN=Y, CMM_FLE_DW_CNT=0, CMM_FLE_IDX=5778, CMM_FLE_REG_DT=20200504113737, CMM_FLE_SYS_NM=c4acad85-3ef6-4c44-8451-bfdbf194fe28.jpg}]
     * @apiSuccess {Object[]} ootdProductList OOTD ?????? ?????? ?????????
     * @apiSuccess {Object[]} tagList ?????? ????????? [{TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6603, TAG_MST_TITLE=#???, TAG_BND_REP=N}]
     * @apiSuccess {Object[]} wishTagList ?????? ?????? ????????? [{WSH_TAG_REG_DT=20200504113701, WSH_TAG_ID=f7482b9e-4143-4705-80de-2fc2e7c5807a, WSH_TAG_STATUS=USE, WSH_TAG_TYPE=TYPE_OOTD, WSH_TAG_BND_ID=145}, {WSH_TAG_REG_DT=20200504113701, WSH_TAG_ID=be41d754-208d-4426-a6e0-7b59f5045132, WSH_TAG_STATUS=USE, WSH_TAG_TYPE=TYPE_OOTD, WSH_TAG_TITLE=????????? , WSH_TAG_BND_ID=145}, {WSH_TAG_REG_DT=20200504113701, WSH_TAG_ID=7cc69106-25f5-40a2-b5a4-e7e9e6d8c1b8, WSH_TAG_STATUS=USE, WSH_TAG_TYPE=TYPE_OOTD, WSH_TAG_TITLE=????????????, WSH_TAG_BND_ID=145}]
     * @apiSuccess {Object[]} tagdisplayList OOTD ?????? ?????? ?????????
     * @apiSuccess {Object} commandMap ???????????? ???
     */
    
    @RequestMapping("/pc/ootd/ootdEdit")
    public ModelAndView ootdEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        
        if(!SessionsUser.isLogin(request)){
            throw new PcAuthenticationException();
        }
        commandMap.put("CNT_MST_REG_ID", user.getMEM_MST_MEM_ID());
        
        if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"),"")))
        {
            //?????? OOTD ?????? ?????? ????????? ?????? 
            int ootdCheckCnt = this.pcOOTDService.selectMyOOTDCount(commandMap);
            
            if(ootdCheckCnt > 0)
            {
            	commandMap.put("MEM_MST_ID", user.getMEM_MST_MEM_ID());
                Map<String, Object> resultMap = this.pcOOTDService.selectOotdInfo(commandMap); // OOTD?????? ????????????

                mv.addObject("row",resultMap.get("row")); // ?????? ??????
                mv.addObject("fileList", resultMap.get("fileList"));  // ???????????? ??????
                
                List<Map<String, Object>> ootdProductList = (List<Map<String, Object>>)resultMap.get("ootdProductList");
                mv.addObject("ootdProductList", ootdProductList); // ???????????? ??????
                mv.addObject("tagList", resultMap.get("tagList")); //OOTD ?????? ?????? ?????????
                mv.addObject("wishTagList", resultMap.get("wishTagList")); //OOTD ?????? ???????????? ?????????
                
                Map<String, Object> memberParamMap = new HashMap<String, Object>();
                memberParamMap.put(PARAM_CONST.MEM_MST_MEM_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
                memberParamMap.put("CMN_COM_IDX", Code.OOTD_PREVILEGE);  //OOTD ?????? ??????
                
                Map<String, Object> memberPrivilege = this.pcOOTDService.selectMemberPrivilege(memberParamMap);
                //OOTD ?????? ?????? ??????
                if(StringUtil.getString(memberPrivilege.get("CMN_COM_IDX")).equals(Code.OOTD_PREVILEGE))
                {
                    mv.addObject("OOTD_PREVILEGE_YN", "Y");
                }
                
                Map<String, Object> tagParam = new HashMap<String, Object>();
                tagParam.put("CMN_COM_IDX", Integer.toString(Code.TAG_DISPLAY_TAG_OOTD_REG)); //OOTD ?????? ??????
                tagParam.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY); //OOTD ?????? ??????
                
                List<Map<String, Object>> tagList = this.tagService.selectTagDisplayList(tagParam);
                
                //?????? ????????? ??????
                //????????? ?????? - ?????? ??????(-6?????? ??????)
                commandMap.put("OST_FIX", Code.OST_FIX);
                
                commandMap.put("searchStartDate", FormatUtil.formatDate(DateUtil.addMonth(DateUtil.getToday(""),-6),"-"));
                commandMap.put("searchEndDate", StringUtil.getString(commandMap.get("searchEndDate"), DateUtil.getToday("-")));

                commandMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
                commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SMALL);
                commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
                
                int total = this.pcOOTDService.selectMyShoppingListCount(commandMap);
        
                List<Map<String, Object>> myProductList = null;
     
                if(total > 0){
                    myProductList = this.pcOOTDService.selectMyShoppingList(commandMap);
                    
                    for(int i = myProductList.size() -1; i >= 0; i--) {
                    	
                    	String curMstCD = myProductList.get(i).get("PRD_MST_CD").toString();
                    	for(int j = 0 ; j < ootdProductList.size(); j++) {
                    		if(curMstCD.equals(ootdProductList.get(j).get("CNT_PRD_MST_CD").toString())) {
                    			myProductList.remove(i);
                    			break;
                    		}
                    	}
                    }
                }
                
                mv.addObject(PARAM_CONST.TAG_LIST, tagList);
                mv.addObject(PARAM_CONST.OOTD_PRD_LIST, myProductList);
            }
            else
            {
                mv.addObject("alertMsg", "?????? ????????? ????????????.");
                mv.addObject("returnUrl", "/pc/main/index.do");
                mv.setViewName("pc/common/result");
                return mv;
            }
        }
        mv.addObject("commandMap",commandMap);
       
        return mv;
   }

    
    

	/**
	 * @api {POST} /pc/ootd/ootdModify.do
	 * @apiName OOTD ?????? ??????
	 * @apiGroup OOTD
	 *
	 * @apiParam {String} CNT_MST_IDX OOTD ??????IDX
     * @apiParam {String} CNT_MST_TITLE OOTD ??????
     * @apiParam {String} CNT_MST_DESC OOTD ??????
     * @apiParam {String[]} file_del_idx OOTD ?????? ????????????IDX
     * @apiParam {File} file OOTD?????????????????????
     * @apiParam {String[]} PRD_MST_CD OOTD ?????? ???????????? ??????
     * @apiParam {JSON} tagData  OOTD??????  [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}]
	 *
     * @apiSuccess {String} alertMsg ?????? ??????/?????? ?????????
     * @apiSuccess {String} returnUrl
     * 
	 */

	@RequestMapping("/pc/ootd/ootdModify")
	public ModelAndView ootdModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
	    ModelAndView mv = new ModelAndView();
	    User user  = SessionsUser.getSessionUser(request);
	    
	    int result = 0;
	    
	    if(!SessionsUser.isLogin(request))
	    {
	        mv.addObject("alertMsg", "????????? ??? ?????? ?????? ??? ??? ????????????.");
	        mv.addObject("returnUrl", "/pc/main/index.do");
	        mv.setViewName("pc/common/result");
	        return mv;
	    }

	    commandMap.put("CNT_MST_REG_ID", user.getMEM_MST_MEM_ID());
	    
	    if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"),"")))
	    {
            //?????? OOTD ?????? ?????? ????????? ?????? 
            int ootdCheckCnt = this.pcOOTDService.selectMyOOTDCount(commandMap);
            
            if(ootdCheckCnt > 0)
            {
                result = this.pcOOTDService.updateMyOOTDData((MultipartHttpServletRequest)request, commandMap);
                
                if(result > 0)
                {
                    mv.addObject("alertMsg", "?????? ???????????????.");
                    mv.addObject("returnUrl", "/pc/mypage/myOotdList.do");
                }
                else
                {
                    mv.addObject("alertMsg", "?????? ?????????????????????");
                    mv.addObject("returnUrl", "/pc/main/index.do");
                }
            }
            else
            {
                mv.addObject("alertMsg", "?????? ????????? ????????????.");
                mv.addObject("returnUrl", "/pc/main/index.do");
                mv.setViewName("pc/common/result");
                return mv;
            }

	    }
	    mv.setViewName("pc/common/result");
	    
	    return mv;
	}
	
	
	@RequestMapping("/pc/ootd/ootdDelete")
	public ModelAndView ootdDelete(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
	{
	    ModelAndView mv = new ModelAndView();
	    User user  = SessionsUser.getSessionUser(request);
	    
	    int result = 0;
	    
	    if(!SessionsUser.isLogin(request))
	    {
	        mv.addObject("alertMsg", "????????? ??? ?????? ?????? ??? ??? ????????????.");
	        mv.addObject("returnUrl", "/pc/main/index.do");
	        mv.setViewName("pc/common/result");
	        return mv;
	    }

	    commandMap.put("CNT_MST_REG_ID", user.getMEM_MST_MEM_ID());
	    
	    if(!"".equals(StringUtil.getString(commandMap.get("CNT_MST_IDX"),"")))
	    {
	    	commandMap.put("CNT_MST_UPD_ID",  user.getMEM_MST_MEM_ID());
	    	commandMap.put("CNT_MST_UPD_IP",  request.getRemoteAddr());
	    	
            //?????? OOTD ?????? ?????? ????????? ?????? 
            int ootdCheckCnt = this.pcOOTDService.selectMyOOTDCount(commandMap);
            
            if(ootdCheckCnt > 0)
            {
                result = this.pcOOTDService.deleteMyOOTDData(commandMap);
                
                if(result > 0)
                {
                    mv.addObject("alertMsg", "?????? ???????????????.");
                    mv.addObject("returnUrl", "/pc/mypage/myOotdList.do");
                }
                else
                {
                    mv.addObject("alertMsg", "?????? ?????????????????????");
                    mv.addObject("returnUrl", "/pc/main/index.do");
                }
            }
            else
            {
                mv.addObject("alertMsg", "?????? ????????? ????????????.");
                mv.addObject("returnUrl", "/pc/main/index.do");
                mv.setViewName("pc/common/result");
                return mv;
            }

	    }
	    mv.setViewName("pc/common/result");
	    
	    return mv;
	}
	
}
