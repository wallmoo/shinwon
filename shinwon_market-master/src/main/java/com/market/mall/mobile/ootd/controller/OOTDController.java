package com.market.mall.mobile.ootd.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.common.constants.VALIDATE_CODE;
import com.market.mall.common.constants.code.RESPONSE_CODE;
import com.market.mall.common.constants.message.RESPONSE_MESSAGE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.User;
import com.market.mall.model.ootd.OOTD_MODEL;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.ootd.service.OOTDCommentService;
import com.market.mall.pc.ootd.service.OOTDService;
import com.market.mall.pc.tag.service.TagService;
import com.market.mall.pc.tag.service.WishTagService;

/**
 * <pre>
 * @PackageName : com.market.mall.pc.ootd.controller
 * @FileName : OOTDController.java
 * </pre>
 *
 * @Author : "KIMHYEWON"
 * @Date : 2020. 1. 30.
 */
@Controller("mobileOOTDController")
public class OOTDController {

    @Resource(name="pcOOTDService")
    private OOTDService pcOOTDService;
    
    @Resource(name="pcOOTDCommentService")
    private OOTDCommentService pcOOTDCommentService;
    
    @Resource(name="wishTagService")
    private WishTagService wishTagService;
    
    @Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;

    @Autowired
    TagService tagService;
    
    
    /**
     * @api {GET} /mobile/ootd/ootdView.do
     * @apiName OOTD ????????? ?????? ??????
     * @apiGroup Mobile OOTD
     *
     * @apiSuccess {String} USER_NM ????????? ??????
     * @apiSuccess {String} USER_IMG ????????? ?????????
     * @apiSuccess {Object[]} TAG_LIST ?????? ??????
     * @apiSuccess {Object[]} OOTD_IMG_LIST OOTD ?????? ?????? ?????? ?????????
     * @apiSuccess {Object} OOTD_DATA OOTD ??????, ??????, ?????????
     * @apiSuccess {Object[]} OOTD_PRD_LIST OOTD ?????? ?????? ?????????
     * @apiSuccess {Object[]} OOTD_COMMENT_LIST OOTD ?????? ?????????
     * @apiSuccess {Number} OOTD_LIKE_TOTAL OOTD ????????? ???
     * @apiSuccess {Number} COMMENT_TOTAL OOTD ?????? ???
     */
    @RequestMapping("/mobile/ootd/ootdView")
    public ModelAndView ootdView(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        
        commandMap.put(PARAM_CONST.MEM_MST_MEM_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
        
        String userNM = user.getMEM_MST_MEM_NM();
        String userIMG = null;
        
        //ootd ?????? ?????? ?????????
        //List<Map<String, Object>> tagList = tagService.selectTagListById(commandMap);
        
        //ootd ?????? ????????? ????????? 
        List<Map<String, Object>> myOOTDImgList = pcOOTDService.selectMyOOTDImageList(commandMap);
        
        Map<String, Object> ootdData = pcOOTDService.selectOotdInfo(commandMap);
        
        //ootd ?????? ?????????
        List<Map<String, Object>> selectedOOTDPrdList = pcMyShoppingService.selectMyOOTDShoppingList(commandMap);
        
        //ootd ?????? ?????????
        List<Map<String, Object>> commentList = pcOOTDCommentService.selectOOTDCommentList(commandMap);
        
        //ootd ????????? ???
        int ootdLikeTotal = pcOOTDService.selectOOTDLikeCount(commandMap);
        
        //ootd ?????? ???
        int commentTotal = pcOOTDCommentService.selectOOTDCommentListCount(commandMap);
        

        mv.addObject(RESPONSE_KEY.USER_NM, userNM);
        mv.addObject(RESPONSE_KEY.USER_IMG, userIMG);
        //mv.addObject(RESPONSE_KEY.TAG_LIST, tagList);
        mv.addObject(RESPONSE_KEY.OOTD_IMG_LIST, myOOTDImgList);
        mv.addObject(RESPONSE_KEY.OOTD_DATA, ootdData);
        mv.addObject(RESPONSE_KEY.OOTD_PRD_LIST, selectedOOTDPrdList);
        mv.addObject(RESPONSE_KEY.OOTD_COMMENT_LIST, commentList);
        mv.addObject(RESPONSE_KEY.OOTD_LIKE_TOTAL, ootdLikeTotal);
        mv.addObject(RESPONSE_KEY.COMMENT_TOTAL, commentTotal);
        
        return mv;
    }
    
    /**
     * @api {POST} /mobile/ootd/ootdRegistForm.do
     * @apiName OOTD ?????? ??????
     * @apiGroup Mobile OOTD
     * 
     * @apiParam {String} searchProductNM ?????????
     * @apiParam {String} searchProductCD ???????????? 
     * @apiParam {String} catIdx ???????????? ?????????  
     * 
     * @apiSuccess {Object[]} TAG_LIST ?????? ?????? 
     * @apiSuccess {Object[]} PRODUCT_LIST ??? ?????? ?????????
     */
    
    @RequestMapping("/mobile/ootd/ootdRegistForm")
    public ModelAndView ootdRegistForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        
        if(!SessionsUser.isLogin(request) ){
            throw new PcAuthenticationException();
        }
        commandMap.put(PARAM_CONST.MEM_MST_MEM_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
        
        List<Map<String, Object>> tagList = tagService.selectTagList();
        List<Map<String, Object>> myProductList = null;
        
        int total = pcMyShoppingService.selectMyShoppingListCount(commandMap);
        
        if(total < 1){
            mv.addObject(PARAM_CONST.OOTD_PRD_LIST, myProductList);
        }
        
        myProductList = pcMyShoppingService.selectMyOOTDShoppingList(commandMap);
        
        mv.addObject(PARAM_CONST.TAG_LIST, tagList);
        mv.addObject(PARAM_CONST.OOTD_PRD_LIST, myProductList);
        
        //mv.setViewName("pc/ootd/ootdForm");
       
        return mv;
   }
    
    /**
     * @api {POST} /mobile/ootd/ootdEdit.do
     * @apiName OOTD ?????? ??????
     * @apiGroup Mobile OOTD
     * 
     * @apiParam {String} CNT_OTD_ID OOTD ?????????
     * 
     * @apiSuccess {Object[]} TAG_LIST ?????? ?????????
     * @apiSuccess {Object[]} OOTD_DATA OOTD ??????,??????
     * @apiSuccess {Object[]} OOTD_PRD_LIST OOTD ?????? ??????  
     */
    @RequestMapping("/mobile/ootd/ootdEdit")
    public ModelAndView ootdEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
        
        User user = SessionsUser.getSessionUser(request);
        ModelAndView mv = new ModelAndView();
        
        if(!SessionsUser.isLogin(request)){
            throw new PcAuthenticationException();
        }
        commandMap.put(OOTD_MODEL.CNT_OTD_ID, commandMap.get(OOTD_MODEL.CNT_OTD_ID));
        commandMap.put(OOTD_MODEL.REG_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
//      commandMap.put(PARAM_CONST.MEM_MST_MEM_ID, "sosoworld2");
        
        //ootd ??????, ??????
        Map<String,Object> OOTDData = pcOOTDService.selectOotdInfo(commandMap);
        
        //ootd ?????? ?????? ?????????
        List<Map<String,Object>> tagList = tagService.selectTagListById(commandMap);
        
        //ootd ?????? ?????? ?????? ?????????
      //  List<Map<String, Object>> selectedOOTDPrdList = pcOOTDService.selectMyOOTDProductList(commandMap);
        
        mv.addObject(RESPONSE_KEY.TAG_LIST, tagList);
        mv.addObject(RESPONSE_KEY.OOTD_DATA, OOTDData);
        mv.addObject(RESPONSE_KEY.OOTD_PRD_LIST, tagList);
        
        mv.setViewName("/mobile/ootd/ootdForm");
       
        return mv;
   }
    
	 /**
	 * @api {POST} /mobile/ootd/ootdRegistAjax.do
	 * @apiName OOTD ??????
	 * @apiGroup Mobile OOTD
	 *
	 * @apiParam {String} OOTD_TITLE ootd ??????
	 * @apiParam {String} OOTD_CONTENTS ootd ??????
	 * @apiParam {String[]} OOTD_IMAGE_LIST ????????? ??????
	 * @apiParam {String[]} TAG_ID_LIST ?????? ?????? ????????? ?????????
	 * @apiParam {String} OOTD_PRD_1 ootd ?????? ?????? ?????? 1
	 * @apiParam {String} OOTD_PRD_2 ootd ?????? ?????? ?????? 2
	 * @apiParam {String} OOTD_PRD_3 ootd ?????? ?????? ?????? 3
	 * 
	 * @apiSuccess {String} RESULT_CODE 200
	 * @apiSuccess {String} RESULT_MSG ?????????
	 * 
	 * @apiError {String} RESULT_CODE 400 ?????? ??????
	 */
    
	@RequestMapping("/mobile/ootd/ootdRegist")
	 public ModelAndView ootdRegist(MultipartHttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
        
        if(!SessionsUser.isLogin(request) ){
            throw new PcAuthenticationException();
        }
        
        commandMap.put(OOTD_MODEL.REG_ID, SessionsUser.getSessionUserValue(PARAM_CONST.MEM_MST_MEM_ID));
        commandMap.put("MEM_LOGIN_YN", "Y");
        
         //ootd ??????
        int result = this.pcOOTDService.insertOOTDData((MultipartHttpServletRequest)request, commandMap);
        
        if(result > 0)
        {
            mv.addObject("alertMsg", "?????? ???????????????.");
            mv.addObject("returnUrl", "mobile/mypage/myOotdList.do");
        }
        else
        {
            mv.addObject("alertMsg", "????????? ?????????????????????.");
            mv.addObject("returnUrl", "mobile/mypage/myOotdList.do");
        }
        
        mv.setViewName("mobile/common/result");
         
        return mv;
	}


	/**
	 * @api {POST} /mobile/ootd/ootdModifyAjax.do
	 * @apiName OOTD ??????
	 * @apiGroup Mobile OOTD
	 *
     * @apiParam {String} OOTD_TITLE ootd ??????
     * @apiParam {String} OOTD_CONTENTS ootd ??????
     * @apiParam {String[]} OOTD_IMAGE_LIST ????????? ??????
     * @apiParam {String[]} TAG_ID_LIST ?????? ?????? ????????? ?????????
     * @apiParam {String} OOTD_PRD_1 ootd ?????? ?????? ?????? 1
     * @apiParam {String} OOTD_PRD_2 ootd ?????? ?????? ?????? 2
     * @apiParam {String} OOTD_PRD_3 ootd ?????? ?????? ?????? 3
	 *
     * @apiSuccess {String} RESULT_CODE 200
     * @apiSuccess {String} RESULT_MSG ?????????
     * 
     * @apiError {String} RESULT_CODE 400
	 */
	@RequestMapping("/mobile/ootd/ootdModifyAjax")
	public JSON ootdModifyAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
	    JSON json = new JSON();
	    
	    //ootd ??????, ?????? ??????
	    int result = pcOOTDService.updateMyOOTDData((MultipartHttpServletRequest)request, commandMap);
	    if (result == VALIDATE_CODE.INSERT_FAIL){
	        return json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.FAIL);
	    }
	    //ootd ?????? ?????? ?????? (?????? ????????? ??????)
	    int OOTDUpdateResult = pcOOTDService.updateMyOOTDProduct(commandMap);
	    
	    //ootd ?????? ??????
	    
	    
	    //?????? ????????? ??????
	    List<Map<String, Object>> tagList = tagService.selectTagListById(commandMap);
	    
	    String tagBindResult = tagService.updateTagBind(commandMap);
	    
        json.put(RESPONSE_CODE.RESULT_CODE, RESPONSE_CODE.SUCCESS);
        json.put(RESPONSE_MESSAGE.RESULT_MESSAGE, RESPONSE_MESSAGE.SUCCESS_MSG);
	    
	    return json;
	}

	
}
