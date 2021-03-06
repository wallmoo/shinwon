package com.market.mall.am.product.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.DateUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.board.service.CommentBoardService;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.customer.service.InquiryService;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.am.product.service.ProductNotificationInfoService;
import com.market.mall.am.product.service.ProductUploadService;
import com.market.mall.am.site.service.BrandManagerService;
import com.market.mall.am.site.service.MakerManagerService;
import com.market.mall.am.site.service.VendorManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.common.constants.RESPONSE_KEY;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;
import com.market.util.CompareVdrStateUtil;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.product.controller
 * @FileName : BasicProductController.java
 * @Date : 2014. 4. 7.
 * @???????????? ?????? : ????????? > ???????????? > ??????????????? ???????????? Controller Class
 * @author ejpark
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class BasicProductController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="basicProductService") private BasicProductService basicProductService;
    @Resource(name="commonService") private CommonService commonService;
    @Resource(name="commentBoardService") private CommentBoardService commentBoardService;
    @Resource(name="inquiryService") private InquiryService inquiryService;
    @Resource(name="propertiesService") protected EgovPropertyService propertiesService;
    @Resource(name="productNotificationInfoService") private ProductNotificationInfoService productNotificationInfoService;
    @Resource(name="brandManagerService") private BrandManagerService brandManagerService;
    @Resource(name="makerManagerService") private MakerManagerService makerManagerService;
    @Resource(name="vendorManagerService")	private VendorManagerService vendorManagerService;
    @Resource(name="fileUpload") private FileUpload fileUpload;
    @Resource(name="productUploadService") private ProductUploadService productUploadService;
    @Autowired TagService tagService;

    /**
     * <pre>
     * 1. MethodName : basicProductList
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ????????? > ???????????? > ????????????
     * 4. ?????????       : ?????????
     * 5. ?????????       : 2014. 6. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/basicProductList")
    public ModelAndView basicProductList(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //????????? ??????
        commandMap.put("searchPrdMstDelFlag", "N");        
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }
        String searchPrdMstSellState = StringUtil.getString(commandMap.get("searchPrdMstSellState"),"");
        commandMap.put("searchPrdMstSellState", searchPrdMstSellState);
        
        String tempsearchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "");
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll("\\n", ",");
        searchPrdMstCd = searchPrdMstCd.replaceAll("(\r\n|\r|\n|\n\r)", " ");
        //commandMap.put("searchPrdMstCd", searchPrdMstCd);

        if(!searchPrdMstCd.isEmpty()) {
        	String[] arrSearchPrdMstCd = searchPrdMstCd.split(",");
        	commandMap.put("arrSearchPrdMstCd", arrSearchPrdMstCd);
        	commandMap.put("searchPrdMstCd","" );
        }
                
        
        
        
        commandMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC); //PC ????????????
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        //??????????????? ?????? ?????????????????? ??????
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("searchPrdMstVdrYn", "Y");
        		commandMap.put("searchPrdMstVdrIdx", admin.getADM_MST_SUB_IDX());
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		
        		// ???????????? ????????? ?????? ??????
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
        	}
        }

        //?????????
    	totalCount = this.basicProductService.selectBasicProductCount(commandMap);
    	paging = new Paging(totalCount, commandMap); 
    	
    	if(totalCount>0)
    	{
    		list = this.basicProductService.selectBasicProductList(commandMap);
    	}
                
        //???????????? ????????????
        Map<String, Object> productSum = this.basicProductService.selectProductSumList(commandMap);
        
        // MD?????????
        commandMap.put("AUT_MST_IDX", 26);
        List<Map<String, Object>> basicMdList = this.basicProductService.selectBasicMdList(commandMap);
        
        //????????? ?????????
        List<Map<String, Object>> brandList = this.basicProductService.selectBrandList(commandMap);
        
        //???????????? ?????????
        List<Map<String, Object>> vendorList = this.basicProductService.selectVendorList(commandMap);
        
        //pc -> mobile url ??????
        String isMobileChk = StringUtil.getString(request.getAttribute("isMobileChk"), "N");
        if(isMobileChk.equals("Y")){
        	mv.setViewName("/am/product/basicProductListMobile");
    	}else{
    		mv.setViewName("/am/product/basicProductList");
    	}
        //????????? ?????? ?????? ?????????
        mv.addObject("deleveryFeeList", this.commonService.selectCode("PRODUCT_DELEVERY_FEE"));
        //?????? ?????? ??????
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON"));
        
        //commandMap ?????? 
        commandMap.put("searchPrdMstCd" ,tempsearchPrdMstCd );        
        
        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("summary",productSum);
        mv.addObject("commandMap", commandMap);
        mv.addObject("isMobileChk", isMobileChk);
        mv.addObject("basicMdList", basicMdList);
        mv.addObject("brandList", brandList);
        mv.addObject("vendorList", vendorList);

        return mv;
    }
    

    @RequestMapping(value="/am/product/basicProductStatusListModify")
    public ModelAndView basicProductStatusListModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap
            , @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs  ) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //????????? ?????? - ?????????/????????? ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());
        
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);//????????????
        
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                result = this.basicProductService.updateBasicProductVdrStatusList(request, commandMap);
            }
            if(result > 0)
            {
                alertMsg = "????????? ???????????????.";
            }
            else{
                alertMsg = "?????? ??? ????????? ?????????????????????.";
            }
        }else{
            result = this.basicProductService.updateBasicProductStatusList(request, commandMap);
            
            if(result > 0)
            {
                alertMsg = "????????? ???????????????.";
            } 
            else 
            {
                alertMsg = "?????? ??? ????????? ?????????????????????.";
            }
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);
        
        mv.setViewName("am/common/result");
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicProductForm
    * 2. ClassName  : BasicProductController.java
    * 3. Comment    : ????????? > ???????????? > ?????? ?????? ??????(?????????) R
    * 4. ?????????       : jesong
    * 5. ?????????       : 2015. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return ModelAndView
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/basicProductForm.do
     * @apiName ???????????? ??????
     * @apiGroup SB????????????
     * 
     * @apiSuccess {Object} commandMap ??????????????? {pageSize=20, REG_IP=0:0:0:0:0:0:0:1, cPage=, PRD_FILE_NAME=ad54b2be-f05d-4f38-8a0b-1fc29ade93f9, VDR_MST_IDX=54, searchPrdMstSellState=, PRD_MST_CD=, searchPrdMstDplState=, searchPrdMstVdrIdx=54, searchPrdMstNm=, searchPrdCtgIdx=, searchPrdMstApvState=, PRD_NFI_LEVEL=0, PRD_NFI_USE_YN=Y, productData=, searchPrdCtgEnv=, searchYn=, PATH_ID=VEN, searchDetailY=none, productStateNm=???????????? ????????????, selectMenuCode=001000000, searchPrdCtgDepth2=, searchPrdCtgDepth1=, searchPrdMstMdId=, searchPrdMstCd=, searchPrdCtgDepth3=}
     * @apiSuccess {String} vendorManagerInfo ???????????? ????????? ?????? ?????? {VDR_MST_CTR_ED_DT=2020-04-30, VDR_MST_BUSI3=13527, VDR_MST_BUSI2=02, VDR_MST_BUSI1=133, VDR_MST_MNG_NM=abc, VDR_MST_MD_ID=md002, VDR_MST_FEE=5(????????? ?????????), VDR_MST_CEO_NM=?????????_1, VDR_MST_MNG_HP3=1234, VDR_MST_MNG_HP2=1234, VDR_MST_MNG_HP1=010, VDR_MST_JB_ADDR1=????????????????????????????????????326-1, VDR_MST_IDX=54, VDR_MST_JB_ADDR2=123, VDR_MST_MAIL=abc@naver.com, VDR_MST_BANK_CD=004, VDR_MST_MNG_TYPE=1698, VDR_MST_BUSI_TYPE=??????_1, VDR_MST_MNG_MAIL=abc@naver.com, VDR_MST_CTR_ST_DT=2020-04-01, VDR_MST_NM=BESTIBELLI, VDR_MST_POST5=06779, VDR_MST_FAX3=0000, VDR_MST_FAX1=031, VDR_MST_FAX2=1234, VDR_MST_ACT_NO=1234567890, VDR_MST_ACT_HDR=?????????_1, VDR_MST_MNG_TEL1=02, VDR_MST_MNG_TEL2=1234, VDR_MST_MNG_TEL3=1234, VDR_MST_BUSI_CDT=??????_1, VDR_MST_TEL2=1234, VDR_MST_TEL1=031, VDR_MST_CTR_DT=2020-04-01, VDR_MST_TEL3=5678, VDR_MST_USE_YN=Y, VDR_MST_BAL_ACT=30, VDR_MST_DLV_PRICE=10000, VDR_MST_DR_ADDR2=123, VDR_MST_DR_ADDR1=??????????????????????????????????????12????6?(?????????)}
     * @apiSuccess {Object} brandManagerInfo ????????? ?????? ??????  {BND_MST_IDX=1778, BND_MST_BRAND_NM = MARKM}
     */
    @RequestMapping(value="/am/product/basicProductForm")
    public ModelAndView basicProductForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String alertMsg = "";
        //???????????? ?????? ??? ????????? ??????
        String serverName = request.getServerName().toString();

        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("productStateNm", "???????????? ????????????");
        		commandMap.put("PATH_ID","VEN");
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		// ???????????? ????????? ?????? ??????
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                // ????????? ?????? ??????
                Map<String, Object> brandManagerInfo = new HashMap<String, Object>();
                brandManagerInfo = this.brandManagerService.selectBrandInfoByVendor(commandMap);
                
                if(brandManagerInfo==null || brandManagerInfo.isEmpty()){
                    alertMsg = "????????? ????????? ????????? ????????????.";
                    mv.addObject("alertMsg", alertMsg);
                    mv.addObject("returnUrl", "/am/product/basicProductList.do");
                    
                    mv.setViewName("am/common/result");
                    return mv;
                }
                mv.addObject("brandManagerInfo", brandManagerInfo);
                mv.setViewName("/am/product/basicProductForm");
        	}
        }else{
        	commandMap.put("productStateNm", "????????????");
        	commandMap.put("PATH_ID","SYS");
        	mv.setViewName("/am/product/basicProductForm");
        	
        }
        //?????? ?????? ?????? ????????? ??????
        commandMap.put("PRD_NFI_VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        //?????? ????????? ?????? ??????
        Map<String, Object> resultMap = this.basicProductService.selectBasicProductViewInfo(commandMap);
        
        commandMap.put("PRD_FILE_NAME",UUID.randomUUID().toString());
        //RETURN OBJECT
        mv.addObject("sizeList", this.commonService.selectCode("COMMON_PRODUCT_SIZE")); //????????? ?????? ??????
        mv.addObject("colorList", this.commonService.selectCode("COMMON_PRODUCT_COLOR")); //?????? ?????? ??????
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //?????? ?????? ??????
        mv.addObject("deleveryFeeList", this.commonService.selectCode("PRODUCT_DELEVERY_FEE")); //????????? ?????? ?????? ?????????
        mv.addObject("genderList", this.commonService.selectCode("COMMON_GENDER")); //?????? ?????? ?????? ?????????
        mv.addObject("specListP", resultMap.get("specListP")); 
        mv.addObject("productNfiList", resultMap.get("productNfiList"));
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    

    /**
     * @api {POST} /am/product/tagBatchEditPopup.do
     * @apiName ?????????????????? ?????? ??????
     * @apiGroup SB????????????
     *
     * @apiSuccess {JSON} TAG_GROUP_LIST ?????? ?????? ?????? ?????? ????????? [{"TAG_GRP_ID":????????????ID, "TAG_GRP_TITLE":?????????????????????, "TAG_GRP_DES":??????????????????, "TAG_GRP_CNT":"?????? ?????? ??? ??????", "TAG_LIST":[{"TAG_MST_ID" : ??????ID, "TAG_MST_TITLE" : ???????????????}, {"TAG_MST_ID" : ??????ID, "TAG_MST_TITLE" : ???????????????2}] }]
     * @apiSuccess {Object} commandMap ???????????????
     */
    @RequestMapping(value="/am/product/tagBatchEditPopup")
    public ModelAndView tagBatchEditPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        
        ModelAndView mv = new ModelAndView();
        List<Map<String,Object>> tagGroupList = tagService.selectTagGroup(commandMap);
        
        for(int index=0; index < tagGroupList.size(); index++){
            String tagGrpId = StringUtil.getString(tagGroupList.get(index).get(TAG_MODEL.TAG_GRP_ID),"");
            
            if(!"".equals(tagGrpId)){
                Map<String,Object> param = new HashMap<String,Object>();
                param.put(TAG_MODEL.TAG_GRP_ID, tagGrpId);
                List<Map<String,Object>> tagList = null;
                
                tagList = tagService.selectTagGroupWithTagListById(param);
                
                tagGroupList.get(index).put("TAG_LIST", tagList);
            }
        }
        mv.addObject(RESPONSE_KEY.TAG_GROUP_LIST, tagGroupList);
        mv.addObject("commandMap", commandMap);

        return mv;
    }
    
    /**
     * @api {POST} /am/product/tagBatchModify.do
     * @apiName ?????????????????? ??????
     * @apiGroup SB????????????
     *
     * @apiParam {JSON} tagData ?????? ????????? ?????????  TAG_MST_ID : ???????????????, TAG_BND_REP : ??????????????????  / [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}, {"TAG_MST_ID":"0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d" , "TAG_BND_REP":"Y"}]
     * @apiParam {String[]} PRD_MST_CDs ?????? ?????? ?????????
     * @apiParam {Object} commandMap ???????????????
     * 
     * @apiSuccess {String} alertMsg ?????? ?????? ??????/?????? ?????????
     * @apiSuccess {String} returnUrl ?????? ?????? ?????? ???????????? URL
     * @apiParam {Object} commandMap ???????????????
     */
    @RequestMapping(value="/am/product/tagBatchModify")
    public JSON tagBatchModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception{
        
    	JSON json = new JSON();
        
        int result = 0;
        String resultCode = "200";
        
        result = this.basicProductService.updateTagBatch(commandMap);
        
        if(result < 1){
        	resultCode = "300";
        	
        }
        json.put("resultCode", resultCode);
        
        return json;
        
    }

    /**
     * <pre>
     * 1. MethodName : basicProductRegist
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ????????? > ?????? ?????? > ?????? ??????
     * 4. ?????????       : jesong
     * 5. ?????????       : 2015. 4. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/basicProductRegist")
    public ModelAndView basicProductRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_CTG_IDXs") String[] PRD_CTG_IDXs ) throws Exception
            
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //????????? ?????? - ?????????/????????? ID, IP
        commandMap.put("PRD_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_REG_ID", admin.getADM_MST_ID());
        
        //???????????? ?????? ??? ????????? ??????
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("PRD_MST_VDR_YN", "Y"); //???????????? ??????
        		commandMap.put("PRD_MST_VDR_IDX", admin.getADM_MST_SUB_IDX());
        		commandMap.put("PRD_MST_APV_STATE", "D"); //???????????? ?????????
        		commandMap.put("PRD_MST_INTO_TYPE", "V");	//????????????
        		commandMap.put("SET_PRD_MST_CD", "V");	//?????????????????? ????????? V??? ????????? ??????
        		//commandMap.put("PRD_MST_BRD_IDX", StringUtil.getString(commandMap.get("BND_MST_IDX")));
        		
        		if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC"),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC"),0) > 0){
        			commandMap.put("PRD_MST_CPN_OWN", "V");	//?????????????????? ????????? ?????????????????? ?????? ??????
        		}
        	}else{
        	    alertMsg = "?????? ????????? ????????????.";
        	    mv.addObject("alertMsg", alertMsg);
        	    mv.addObject("loginStateCode", Code.LOGIN_SITE_NOT_ACCESS);
        	    mv.addObject("returnUrl", "/am/product/basicProductList.do");
        	    
        	    //VIEW NAME
                mv.setViewName("am/common/result");
        	    return mv;
        	}
        }else{
            commandMap.put("PRD_MST_VDR_IDX", StringUtil.getString(commandMap.get("PRD_MST_VDR_IDX"))); // ??????????????? ?????? ????????????/?????????(1:1) ??????
        	commandMap.put("PRD_MST_VDR_YN", "Y");
    		commandMap.put("PRD_MST_INTO_TYPE", "S");	//????????????
    		commandMap.put("SET_PRD_MST_CD", "S");	//MarketPlant????????? ????????? S??? ????????? ??????
    		if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC"),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC"),0) > 0){
    			commandMap.put("PRD_MST_CPN_OWN", "S");	//?????????????????? ????????? ?????????????????? ?????? ??????
    		}
        }
        
        //?????? ?????? ????????????
        commandMap.put("arrPRD_CTG_IDX", PRD_CTG_IDXs);
        
        result = this.basicProductService.insertBasicProduct(request, commandMap);        
        if(result > 0)
        {
            alertMsg = "??????????????? ?????????????????????.";
        } 
        else 
        {
            alertMsg = "?????? ??? ????????? ?????????????????????.";
        }
        
        // ??????????????? ????????? ????????? ?????? modify???????????? ????????? ????????? ???????????? ????????? ?????? ?????????.
        /*String t = (String)commandMap.get("PRD_MST_DETAIL_DESC");
        t = URLEncoder.encode(t, "UTF8");
        commandMap.put("PRD_MST_DETAIL_DESC", t);*/	
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : basicProductEdit
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ????????? > ???????????? > ?????? ?????? ?????? 
     * 4. ?????????       : ?????????
     * 5. ?????????       : 2014. 6. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param PRD_CTG_IDXs
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/product/basicProductEdit.do
     * @apiName ?????? ?????? ??????
     * @apiGroup SB????????????
     * 
     * @apiParam {String} PRD_MST_CD ?????? ??????
     * 
     * @apiSuccess {Object} productInfo ?????? ?????? ??????
     * @apiSuccess {Object[]} productGroupList ????????????/???????????? ?????? ?????? [{PRD_MST_NM=MM Oversize corduroy shirt (MYBAX5005), PRD_MST_SEL_CNT=??????????????????, SUB_PRD_MST_CD=S0012100, PRD_MST_PRC = ?????????}]
     * @apiSuccess {Object[]} categoryList ???????????? ????????? [{PRD_CTG_PATH=?????? > TOP > ?????????, DSP_CTG_IDX=63087, DSP_PRD_CTG_IDX=3411, PRD_CTG_ENV=P}]
     * @apiSuccess {Object[]} mustOptionList ???????????? ?????????
     * @apiSuccess {Object[]} addOptionList ???????????? ?????????
     * @apiSuccess {Object[]} imageList ????????? ????????? [{PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0.jpeg, PRD_IMG_SYS_NM=S0012134_0.jpeg, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1.png, PRD_IMG_SYS_NM=S0012134_1.png, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2.jpg, PRD_IMG_SYS_NM=S0012134_2.jpg, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3.jpg, PRD_IMG_SYS_NM=S0012134_3.jpg, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_500.jpeg, PRD_IMG_SYS_NM=S0012134_0_500.jpeg, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_500.png, PRD_IMG_SYS_NM=S0012134_1_500.png, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_500.jpg, PRD_IMG_SYS_NM=S0012134_2_500.jpg, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_500.jpg, PRD_IMG_SYS_NM=S0012134_3_500.jpg, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_450.jpeg, PRD_IMG_SYS_NM=S0012134_0_450.jpeg, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_450.png, PRD_IMG_SYS_NM=S0012134_1_450.png, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_450.jpg, PRD_IMG_SYS_NM=S0012134_2_450.jpg, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_450.jpg, PRD_IMG_SYS_NM=S0012134_3_450.jpg, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_320.jpeg, PRD_IMG_SYS_NM=S0012134_0_320.jpeg, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_320.png, PRD_IMG_SYS_NM=S0012134_1_320.png, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_320.jpg, PRD_IMG_SYS_NM=S0012134_2_320.jpg, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_320.jpg, PRD_IMG_SYS_NM=S0012134_3_320.jpg, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_250.jpeg, PRD_IMG_SYS_NM=S0012134_0_250.jpeg, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_250.png, PRD_IMG_SYS_NM=S0012134_1_250.png, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_250.jpg, PRD_IMG_SYS_NM=S0012134_2_250.jpg, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_250.jpg, PRD_IMG_SYS_NM=S0012134_3_250.jpg, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_180.jpeg, PRD_IMG_SYS_NM=S0012134_0_180.jpeg, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_180.png, PRD_IMG_SYS_NM=S0012134_1_180.png, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_180.jpg, PRD_IMG_SYS_NM=S0012134_2_180.jpg, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_180.jpg, PRD_IMG_SYS_NM=S0012134_3_180.jpg, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_125.jpeg, PRD_IMG_SYS_NM=S0012134_0_125.jpeg, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_125.png, PRD_IMG_SYS_NM=S0012134_1_125.png, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_125.jpg, PRD_IMG_SYS_NM=S0012134_2_125.jpg, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_125.jpg, PRD_IMG_SYS_NM=S0012134_3_125.jpg, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=???????????????.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_84.jpeg, PRD_IMG_SYS_NM=S0012134_0_84.jpeg, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=???????????????, PRD_IMG_IDX=0, PRD_IMG_SORT=7}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_84.png, PRD_IMG_SYS_NM=S0012134_1_84.png, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=7}, {PRD_IMG_ORG_NM=??????.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_84.jpg, PRD_IMG_SYS_NM=S0012134_2_84.jpg, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=7}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_84.jpg, PRD_IMG_SYS_NM=S0012134_3_84.jpg, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=7}]
     * @apiSuccess {Object[]} productNfiList ??????????????????????????? [{RNUM=1, PRD_NFI_IDX=1691, PRD_NFI_USE_YN=Y, PRD_NFI_NM=????????????????????????}, {RNUM=2, PRD_NFI_IDX=1711, PRD_NFI_USE_YN=Y, PRD_NFI_NM=?????????????????????}]
     * @apiSuccess {String} PRD_MST_NFI_INF ?????????????????? ?????? ???|??????|44|?????????????????????|????????????|2020 SS|????????????|????????????||????????????|????????????|????????????||
     * @apiSuccess {String[]} PRD_MST_NFI_INF_ARY ???????????????????????? ??????[???, ??????, 44, ?????????????????????, ????????????, 2020 SS, ????????????, ????????????, , ????????????, ????????????, ????????????, , ]
     * @apiSuccess {Object[]} productNfiInfo ???????????? ????????? ?????? ?????? [{PRD_NFI_REG_IP=0:0:0:0:0:0:0:1, PRD_NFI_LEVEL=1, PRD_NFI_INFO=????????????, PRD_NFI_UP_IDX=1691, PRD_NFI_INFO_YN=N, PRD_NFI_IDX=1692, PRD_NFI_USE_YN=Y, PRD_NFI_REG_DT=20200412021346, PRD_NFI_REG_ID=admin, PRD_NFI_NM=????????????????????????}]
     * @apiSuccess {Object[]} tagList ?????? ?????? ?????? [{TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6603, TAG_MST_TITLE=#???, TAG_BND_REP=N}, {TAG_MST_ID=0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d, TAG_MST_TITLE=#??????, TAG_BND_REP=Y}]
     * @apiSuccess {Object} brandManagerInfo ????????? ?????? ?????? {BND_MST_BRAND_TYPE=I(I:??????/O:??????), BND_MST_IDX=1778, BND_MST_SEL_NM=MARKM, BND_MST_BRAND_NM=MARKM}
     * @apiSuccess {Object} commandMap ???????????? ??? {PRD_NFI_LEVEL=0, PRD_MST_CD=S0012134, productStateNm=????????????, onlineShopCode=ONLINE, selectMenuCode=001000000, IMG_THUMBNAIL_SIZE=83, PRD_NFI_IDX=1691, PRD_NFI_USE_YN=Y, REG_IP=0:0:0:0:0:0:0:1, PATH_ID=SYS, PRD_FILE_NAME=S0012134}
     */
    @RequestMapping(value="/am/product/basicProductEdit")
    public ModelAndView basicProductEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //???????????? ?????? ??? ????????? ??????
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("productStateNm", "???????????? ????????????");
        		commandMap.put("PATH_ID","VEN");
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		// ???????????? ????????? ?????? ??????
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                //mv.setViewName("/am/product/basicProductVdrEdit");
                mv.addObject("brandManagerInfo", this.brandManagerService.selectBrandInfoByVendor(commandMap));
                mv.setViewName("/am/product/basicProductEdit");
        	}
        }else{
        	commandMap.put("productStateNm", "????????????");
        	commandMap.put("PATH_ID","SYS");
        	//commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        	mv.setViewName("/am/product/basicProductEdit");
        }
        
        //????????? ?????? ????????????
        commandMap.put("PRD_FILE_NAME", commandMap.get("PRD_MST_CD"));
        
        //?????? ?????? ??????
        Map<String, Object> resultMap = this.basicProductService.selectBasicProductView(commandMap);

        //???????????? ????????? ??????
        mv.addObject("colorList", this.commonService.selectCode("COMMON_PRODUCT_COLOR")); //?????? ?????? ??????
        mv.addObject("sizeList", this.commonService.selectCode("COMMON_PRODUCT_SIZE")); //????????? ?????? ??????
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //?????? ?????? ??????
        mv.addObject("genderList", this.commonService.selectCode("COMMON_GENDER")); //?????? ?????? ?????? ?????????
        
        //RETURN OBJECT
        mv.addObject("productInfo", resultMap.get("productInfo"));
        mv.addObject("productGroupList", resultMap.get("productGroupList"));
        mv.addObject("categoryList", resultMap.get("categoryList")); 
        mv.addObject("mustOptionList", resultMap.get("mustOptionList"));
        mv.addObject("addOptionList", resultMap.get("addOptionList"));
        mv.addObject("imageList", resultMap.get("imageList"));
        mv.addObject("productNfiList", resultMap.get("productNfiList"));
        mv.addObject("PRD_MST_NFI_INF", resultMap.get("PRD_MST_NFI_INF"));
        mv.addObject("tagList", resultMap.get("tagList"));

        mv.addObject("commandMap", commandMap);
        
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : basicProductModify
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ????????? > ?????? ?????? > ?????? ??????
     * 4. ?????????       : ?????????
     * 5. ?????????       : 2014. 6. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/product/basicProductModify.do
     * @apiName ?????? ?????? ??????
     * @apiGroup SB????????????
     * 
     * @apiParam {String} PRD_MST_CD ????????????
     * @apiParam {String} PRD_CTG_IDXs ???????????? ?????????
     * @apiParam {JSON} mustOptionData ??????/?????? ?????? ?????????  CMN_COM_IDX:?????? ??????, PRD_CMM_TYPE : (??????:C/?????????:S), OPT_STK_CNT:??????, CMM_OPT_NM:?????????, CMM_OPT_USE_YN:???????????? , CMM_OPT_HW : ???,?????????   / ex)[{"CMN_COM_IDX":"1172","OPT_STK_CNT":"100","CMM_OPT_NM":"3312","CMM_OPT_USE_YN":"Y","CMM_OPT_HW":""},{"CMN_COM_IDX":"","OPT_STK_CNT":"100","CMM_OPT_NM":"3315","CMM_OPT_USE_YN":"Y","CMM_OPT_HW":""},{"CMN_COM_IDX":"1173","OPT_STK_CNT":"100","CMM_OPT_NM":"3312","CMM_OPT_USE_YN":"Y","CMM_OPT_HW":""}]
     * @apiParam {JSON} addOptionData ?????????????????????  PRD_OPT_NM:???????????????,PRD_OPT_USE_YN:????????????  / ex) [{"PRD_OPT_NM":"1+1","PRD_OPT_USE_YN":"Y"}]
     * @apiParam {JSON} tagData ?????? ?????? ?????? [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}]
     * 
     * @apiSuccess {String} alertMsg ?????? ??????/?????? ?????????
     * @apiSuccess {String} returnUrl ?????? ?????? ?????? ???????????? URL
     * @apiSuccess {Object} commandMap ???????????????
     */
    @RequestMapping(value="/am/product/basicProductModify")
    public ModelAndView basicProductModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_CTG_IDXs") String[] PRD_CTG_IDXs ) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);

        int result = 0; 
        String alertMsg = "";
        
        //????????? ?????? - ?????????/????????? ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //?????? ?????? ????????????
        commandMap.put("arrPRD_CTG_IDX", PRD_CTG_IDXs);
        
        String serverName = request.getServerName().toString();
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                
        		Map<String, Object> returnMap = this.basicProductService.selectBasicProductView(commandMap);
        		
        		Map<String, Object> target = new HashMap<String, Object>();
        		target.put("PRD_MST_PRC", commandMap.get("PRD_MST_PRC"));
        		target.put("PRD_MST_UNT", commandMap.get("PRD_MST_UNT"));
        		target.put("PRD_MST_SALE_RATE", commandMap.get("PRD_MST_SALE_RATE"));
        		target.put("PRD_MST_SEL_CNT", commandMap.get("PRD_MST_SEL_CNT"));
        		target.put("PRD_MST_SEL_STATE", commandMap.get("PRD_MST_SEL_STATE"));
        		
        		Map<String, Object> productInfo = (Map<String, Object>)returnMap.get("productInfo");
        		
        		boolean updateFlag = CompareVdrStateUtil.decisionApvState(productInfo, target);
        		
        		if(!updateFlag)
        		{
        			commandMap.put("VDR_MST_IDX", productInfo.get("PRD_MST_VDR_IDX"));
        			commandMap.put("PRD_MST_APV_STATE", "D");
        			//?????? ?????? ?????? ??????????????? ??????
        			result = this.basicProductService.updateBasicProduct((MultipartHttpServletRequest)request, commandMap);
        			return basicProductVdrModify(request, commandMap);
        		}
        		else 
        		{
        			result = this.basicProductService.updateBasicProduct((MultipartHttpServletRequest)request, commandMap);
        		}
        		
            }
        }
        else
        {
        	result = this.basicProductService.updateBasicProduct((MultipartHttpServletRequest)request, commandMap);
        }
        
        if(result > 0)
        {
            alertMsg = "??????????????? ?????????????????????.";
        } 
        else 
        {
            alertMsg = "?????? ??? ????????? ?????????????????????.";
        }
        
        // ??????????????? ????????? ????????? ?????? modify???????????? ????????? ????????? ???????????? ????????? ?????? ?????????.
        String t = (String)commandMap.get("PRD_MST_DETAIL_DESC");
        t = URLEncoder.encode(t, "UTF8");
        commandMap.put("PRD_MST_DETAIL_DESC", t);	
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicProductVdrModify
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ???????????? ?????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2016. 1. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/basicProductVdrModify")
    public ModelAndView basicProductVdrModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
     	//???????????? ?????? ??? ????????? ??????
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("PRD_MST_VDR_YN", "Y");
        		commandMap.put("PRD_MST_VDR_IDX", admin.getADM_MST_SUB_IDX());
        		commandMap.put("PRD_MST_APV_STATE", "D");
        		commandMap.put("PRD_MST_INTO_TYPE", "V");	//????????????
        		commandMap.put("SET_PRD_MST_CD", "V");	//?????????????????? ????????? V??? ????????? ??????
        		if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC"),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC"),0) > 0){
        			commandMap.put("VDR_APV_CPN_OWN", "V");	//?????????????????? ????????? ?????????????????? ?????? ??????
        		}
        	}
        }
        commandMap.put("VDR_MST_IDX", commandMap.get("VDR_MST_IDX"));
        
        int vdrCount = 0; 
        
        vdrCount = this.basicProductService.selectBasicProductVdrCount(commandMap);
        
        if(vdrCount > 0 ){
        	alertMsg = "?????? ?????? ?????? ????????? ?????? ??? ??? ??????????????????.";
        }else{
        	result = this.basicProductService.insertProductVdr(commandMap);
        	
        	if(result > 0)
            {
                alertMsg = "??????????????? ??????????????? ???????????????.";
            } 
            else 
            {
                alertMsg = "?????? ??? ????????? ?????????????????????.";
            }
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicProductDetail
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ?????? ?????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 11. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/basicProductDetailPopup")
    public ModelAndView basicProductDetailPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //?????? ?????? ??????
        Map<String, Object> resultMap = this.basicProductService.selectBasicProductView(commandMap);

        //RETURN OBJECT
        mv.addObject("productInfo", resultMap.get("productInfo"));
        mv.addObject("productGroupList", resultMap.get("productGroupList"));
        mv.addObject("categoryListP", resultMap.get("categoryListP"));
        mv.addObject("categoryListM", resultMap.get("categoryListM"));
        mv.addObject("mustOptionList", resultMap.get("mustOptionList"));
        mv.addObject("addOptionList", resultMap.get("addOptionList"));
        mv.addObject("imageList", resultMap.get("imageList"));
        mv.addObject("productNfiList", resultMap.get("productNfiList"));
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicProductListModify
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ????????????????????? ?????? ?????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 11. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @param PRD_MST_CDs
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/basicProductListModify")
    public ModelAndView basicProductListModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //????????? ?????? - ?????????/????????? ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //?????? ?????? 
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//????????????
        
        //??????????????? ?????? ?????????????????? ??????
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){//???????????? ??????
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		
        		result = this.basicProductService.updateBasicProductVdrList(request, commandMap);
        	}
        	if(result > 0)
            {
                alertMsg = "??????????????? ??????????????? ?????? ???????????????.";
            }
        	else{
        		if(result == -3){
            		alertMsg = "???????????? ????????? ????????? ????????? ??????????????? ???????????????.";
            	}else{
            		alertMsg = "?????? ??? ????????? ?????????????????????.";
            	}
        	}
        }else{
        	result = this.basicProductService.updateBasicProductList(request, commandMap);
        	
        	if(result > 0)
            {
                alertMsg = "????????? ???????????????.";
            } 
            else 
            {
            	alertMsg = "?????? ??? ????????? ?????????????????????.";
            }
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : basicProductDelete
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ?????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 11. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @param PRD_MST_CDs
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/basicProductDelete")
    public ModelAndView basicProductDelete(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_MST_CDs") String[] PRD_MST_CDs) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //????????? ?????? - ?????????/????????? ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //?????? ?????? 
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//????????????
    		
        result = this.basicProductService.deleteBasicProductList(request, commandMap);
        if(result > 0)
        {
            alertMsg = "??????????????? ?????????????????????.";
        } 
        else 
        {
            alertMsg = "?????? ??? ????????? ?????????????????????.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);

    	//VIEW NAME
        mv.setViewName("am/common/result");

        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : searchProductPopup
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ????????? > ?????? ?????? ?????? (??????)
     * 4. ?????????       : ?????????
     * 5. ?????????       : 2014. 6. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/searchProductPopup")
    public ModelAndView searchProductPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //????????? ??????
        commandMap.put("searchPrdMstDelFlag", "N");
        //?????? ?????? ?????? ?????? ?????? 
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        if(!searchPrdMstCd.isEmpty()) {
        	String[] arrSearchPrdMstCd = searchPrdMstCd.split("\\r?\\n");
        	commandMap.put("arrSearchPrdMstCd", arrSearchPrdMstCd);
        }
        
        String searchPrdMstErpCd = StringUtil.getString(commandMap.get("searchPrdMstErpCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstErpCd", searchPrdMstErpCd);
        
        commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        commandMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC); //PC ????????????
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        totalCount = this.basicProductService.selectSearchPopupBasicProductCount(commandMap);
    	paging = new Paging(totalCount, commandMap); 
        
        if(totalCount>0)
        {
            list = this.basicProductService.selectSearchPopupBasicProductList(commandMap);
        }
        commandMap.put("caller",request.getParameter("caller"));
        //RETURN OBJECT
        
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //?????? ?????? ??????
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : searchProductCodePopup
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ????????? > ?????? ?????? ?????? ??????
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/am/product/searchProductCodePopup")
    public ModelAndView searchProductCodePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        return mv;
    }
    
    

    
    /**
     * @api {POST} /am/product/searchProductCategoryChangePopup.do
     * @apiName ???????????? ?????? ??????
     * @apiGroup SB????????????
     * 
     * @apiParam {String[]} arrPRD_CTG_IDX ????????? ?????? ???????????? ?????????
     * 
     * @apiParam {Object} commandMap ???????????????
     */
    @RequestMapping(value="/am/product/searchProductCategoryChangePopup")
    public ModelAndView searchProductCategoryChangePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    
    /**
     * @api {POST} /am/product/basicProductCategoryModify.do
     * @apiName ???????????? ?????? ??????
     * @apiGroup SB????????????
     * 
     * @apiParam {String[]} arrPRD_CTG_IDX ????????? ?????? ???????????? ?????????
     * @apiParam {String[]} PRD_MST_CDs ????????? ?????? ?????? ?????????
     * @apiParam {Object} commandMap ???????????????
     * 
     * @apiSuccess {String} alertMsg ???????????? ?????? ??????/?????? ?????????
     * @apiSuccess {String} returnUrl ?????? ?????? ?????? ???????????? URL
     * @apiParam {Object} commandMap ???????????????
     */
    @RequestMapping(value="/am/product/basicProductCategoryModify")
    public ModelAndView basicProductCategoryModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //????????? ?????? - ?????????/????????? ID, IP
        commandMap.put("DSP_CTG_REG_IP", request.getRemoteAddr());
        commandMap.put("DSP_CTG_REG_ID", admin.getADM_MST_ID());
        
//        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs); //?????? ?????? ?????????
//        commandMap.put("arrPRD_CTG_IDX", PRD_CTG_IDXs); //???????????? ?????????
        
        result = this.basicProductService.updateBasicProductCategory(request, commandMap);
        
        if(result > 0){
            alertMsg = "??????????????? ?????????????????????.";
        } else {
            alertMsg = "?????? ??? ????????? ?????????????????????.";
        }
        
        //RETURN OBJECT
        mv.addObject("alertMsg", alertMsg);
        mv.addObject("returnUrl", "/am/product/basicProductList.do");
        mv.addObject("commandMap", commandMap);
        
        mv.setViewName("am/common/result");
        
        return mv;
    }
    

    /**
     * @api {GET} /am/product/productUploadPopup.do
     * @apiName ????????????????????? ??????
     * @apiGroup ????????? ????????????
     *
     * @apiParam {String} PRD_EXC_FILE_IDX ?????? ?????? ?????????
     *
     * @apiSuccess {Object} commandMap ???????????????
     * @apiSuccess {Object[]} list ????????? ?????????
     * @apiSuccess {Integer} count ????????? ??????
     */
    @RequestMapping(value="/am/product/productUploadPopup")
    public ModelAndView productUploadPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String PRD_EXC_FILE_IDX =  StringUtil.getString(commandMap.get("PRD_EXC_FILE_IDX"),"");
        
        if(!"".equals(PRD_EXC_FILE_IDX))
        {
            List<Map<String, Object>> uploadResult = productUploadService.selectProductUploadList(commandMap);
            Map<String, Object> uploadCount = productUploadService.selectProductUploadCount(commandMap);
            mv.addObject("list", uploadResult);
            mv.addObject("count", uploadCount);
        } 
        
        return mv;
    }
    
    /**
     * @api {POST} /am/product/productUploadRegist.do
     * @apiName ????????????????????? ??????
     * @apiGroup ????????? ????????????
     *
     * @apiParam commandMap ???????????????
     *
     * @apiSuccess alertMsg ?????? ??????/?????? ?????????
     * @apiSuccess commandMap ???????????????
     */
//    @RequestMapping(value="/am/product/productUploadRegist")
//    public ModelAndView productUploadRegist(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
//    {
//        ModelAndView mv = new ModelAndView();
//        
//        List<Map<String, Object>> list = new  ArrayList<Map<String, Object>>();
//        
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("file");
//        
//        String fName = file.getOriginalFilename();
//        
//        String [] columName = {"PRD_MST_CD", "PRD_MST_NM", "PRD_MST_SET_YN", "PRD_MST_SET1", "PRD_MST_SET2", "PRD_MST_NAVER_USE_YN", "PRD_MST_COLOR", "PRD_MST_SEX"};
//        
//        List<Map<String, Object>> productList = ExcelUtil.excelRead(file, columName);
//
//        int result = 0;
//        int errorCount = 0;
//        int listCnt = productList.size();
//        
//        for(int i=0;i<listCnt;i++)
//        {
//           Map<String, Object> productData = productList.get(i);
//           
//           String PRD_MST_CD = StringUtil.getString(productData.get("PRD_MST_CD"),"");
//           String PRD_MST_NM = StringUtil.getString(productData.get("PRD_MST_NM"),"");
//           String PRD_MST_SET_YN = StringUtil.getString(productData.get("PRD_MST_SET_YN"),"");
//           String PRD_MST_SET1 = StringUtil.getString(productData.get("PRD_MST_SET1"),"");
//           String PRD_MST_SET2 = StringUtil.getString(productData.get("PRD_MST_SET2"),"");
//           String PRD_MST_NAVER_USE_YN = StringUtil.getString(productData.get("PRD_MST_NAVER_USE_YN"),"");
//           String PRD_MST_COLOR = StringUtil.getString(productData.get("PRD_MST_COLOR"),"");
//           String PRD_MST_SEX = StringUtil.getString(productData.get("PRD_MST_SEX"),"");
//           
//           byte[] temp = PRD_MST_CD.getBytes();
//           if(temp.length>20) errorCount++;
//           
//           temp = PRD_MST_NM.getBytes();
//           if(temp.length>300) errorCount++;
//           
//           temp = PRD_MST_SET_YN.getBytes();
//           if(temp.length>1) errorCount++;
//           
//           temp = PRD_MST_SET1.getBytes();
//           if(temp.length>9) errorCount++;
//           
//           temp = PRD_MST_SET2.getBytes();
//           if(temp.length>9) errorCount++;
//           
//           temp = PRD_MST_NAVER_USE_YN.getBytes();
//           if(temp.length>1) errorCount++;
//           
//           temp = PRD_MST_COLOR.getBytes();
//           if(temp.length>200) errorCount++;
//           
//           temp = PRD_MST_SEX.getBytes();
//           if(temp.length>1) errorCount++;
//           
//        }
//        
//        System.out.println("################errorCount : "+errorCount);
//      
//        if(errorCount == 0)
//        {
//          if(productList !=null&&productList.size() > 0)
//            {
//               result = productUploadService.productUploadRegist((MultipartHttpServletRequest) request, productList, fName);
//            }
//        }
//       
//       if(errorCount ==0)
//       {
//           mv.addObject("alertMsg", "?????? ???????????????.");
//           //mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadPopup.do?PRD_EXC_FILE_IDX="+PRD_EXC_FILE_IDX);
//           
//       }else
//       {
//          mv.addObject("alertMsg", "??????????????? ????????? ????????????. ?????? ??? ???????????? ????????????.");
//          mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadPopup.do");
//       }
//        
//        mv.setViewName("/am/common/result");
//        
//        return mv;
//    }
    
    public static boolean isStringDouble(String s) {
        try {
            Double.parseDouble(s);
            return true;
        } catch (NumberFormatException e) {
           return false;
        }
    }
    
    
    /**
    * <pre>
    * 1. MethodName : searchProductEsmPopup
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ???????????? ??????????????? ?????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/searchProductEsmPopup")
    public ModelAndView searchProductEsmPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        //????????? ??????
        commandMap.put("searchPrdMstDelFlag", "N");
        //?????? ?????? ?????? ?????? ?????? 
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }
        
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        String searchPrdMstErpCd = StringUtil.getString(commandMap.get("searchPrdMstErpCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstErpCd", searchPrdMstErpCd);
        commandMap.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_ING);

        //?????????
        int totalCount = 0;
        if( !StringUtil.getString(commandMap.get("searchYn"), "N").equals("N") ){
        	totalCount = this.basicProductService.selectBasicProductCount(commandMap);
        }
        Paging paging = new Paging(totalCount, commandMap); 
        
        List<Map<String, Object>> list = null;
        if(totalCount>0)
        {
        	list = this.basicProductService.selectBasicProductList(commandMap);
        }

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : searchProductOptionPopup
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ???????????? ??????????????? ?????? ???????????? ????????????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/searchProductOptionPopup")
    public ModelAndView searchProductOptionPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        String PRD_MST_CD = StringUtil.getString(commandMap.get("PRD_MST_CD"), "").replaceAll(" ", "");
        commandMap.put("PRD_MST_CD", PRD_MST_CD);

      //?????? ?????? ??????
        Map<String, Object> resultMap = this.basicProductService.selectBasicProductView(commandMap);

        //RETURN OBJECT
        mv.addObject("productInfo", resultMap.get("productInfo"));
        mv.addObject("optionList", resultMap.get("optionList"));
        mv.addObject("optionDetailList", resultMap.get("optionDetailList"));
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : productListExcelDownload
    * 2. ClassName  : BasicProductController.java
    * 3. Comment    : ??????????????? ?????? ????????????
    * 4. ?????????       : kanghk
    * 5. ?????????       : 2015. 1. 6.
    * </pre>
    *
    * @param request
    * @param response
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/basicProductListExcelDownload")
    public ModelAndView basicProductListExcelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
    {
    	String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        
        commandMap.put("excelDown", "Y");
        int totalCount = this.basicProductService.selectBasicProductCount(commandMap);
        
        if(totalCount > 0){
        	 List<Map<String, Object>> list = null;
        	 
        	 String fileName = "productList_"+DateUtil.getToday();

        	 String [] rowTitle = { "????????????","????????????","?????????","????????????","?????????","?????????","?????????","????????????","????????????(I=?????????/T=????????????/S=?????????/O=????????????)","????????????(D=??????/S=??????)","??????????????????","????????????PC","????????????MOBILE"};      
             String [] cellSize = { "50","50","50","50","50","50","50","50","50","50","50","50","50"};
           	 String [] dataName = { "CATEGORY_NAMES","PRD_MST_CD", "PRD_MST_NM","PRD_MST_VDR_NM","PRD_MST_PRC", "PRD_MST_SCH_PRC","PRD_MST_DLV_FEE","PRD_MST_DPL_STATE", "PRD_MST_SEL_STATE","PRD_MST_APV_STATE","PRD_MST_SEL_CNT", "PRD_MST_CNL_PC_YN","PRD_MST_CNL_MB_YN"};
           	 //String [] dataName = { "PRD_CTG_LVL_NM","PRD_MST_CD", "PRD_MST_NM","PRD_MST_VDR_NM","PRD_MST_PRC", "PRD_MST_SCH_PRC","PRD_MST_DLV_FEE","PRD_MST_DPL_STATE", "PRD_MST_SEL_STATE","PRD_MST_APV_STATE","PRD_MST_SEL_CNT", "PRD_MST_CNL_PC_YN","PRD_MST_CNL_MB_YN"};           	 
           	
             String [] dataType = { "String","String","String","String","Number","Number","Number","String","String","String","Number","String","String"};
        	//?????? ????????? ????????? excel ?????? csv ??????
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv ???????????? ??????
            	commandMap.put("dnFileName", fileName); //???????????? ?????? ??????
            	commandMap.put("rowTitleArr", rowTitle); //????????????
            	commandMap.put("dataNameArr", dataName); //?????????
            	commandMap.put("responseForCsv", response); //response
            }
           
        	list = this.basicProductService.selectBasicProductList(commandMap);
        	
        	if(list != null){
                // ???????????? ?????? ?????? ????????????
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
    
    /**
    * <pre>
    * 1. MethodName : subGdsSctnProductAjax
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ???????????? ????????? ?????? ????????? ????????????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 10. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/productNotificationInfoAjax")
    public JSON productNotificationInfoAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        List<Map<String, Object>> list = this.productNotificationInfoService.selectproductNotificationInfo(commandMap);

        json.put("prdNfiList", list);
        
        return json;
    }
    
    /**
    * <pre>
    * 1. MethodName : searchEmagazinePopup
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ?????? ????????? ?????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 11. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/searchEmagazinePopup")
    public ModelAndView searchEmagazinePopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : searchBrandPopup
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ????????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 11. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/searchBrandPopup")
    public ModelAndView searchBrandPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // ????????? ?????? ?????? ??????
        int totalCount = this.brandManagerService.selectBrandManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0)
        {
        	// ????????? ?????? ??????
        	commandMap.put("searchBrandUseYn", "Y");
        	list = this.brandManagerService.selectBrandManagerList(commandMap);
        }

        //RETURN OBJECT
        mv.addObject("list", list);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
    * <pre>
    * 1. MethodName : searchMrkPopup
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ????????? ??????
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 11. 24.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping("/am/product/searchMrkPopup")
    public ModelAndView searchMrkPopup(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        // ????????? ?????? ?????? ??????
 		int totalCount = this.makerManagerService.selectMakerManagerListCount(commandMap);
 		
 		Paging paging = new Paging(totalCount, commandMap);
 		mv.addObject( "paging", paging );

         commandMap.put("startNum", paging.getStartNum());
         commandMap.put("endNum", paging.getEndNum());
         
         List<Map<String,Object>> list = null;
         
         if(totalCount > 0)
         {
         	// ????????? ?????? ??????
        	commandMap.put("searchMrkMstUseYn", "Y");
         	list = this.makerManagerService.selectMakerManagerList(commandMap);
         }
         
         mv.addObject("list", list);
         mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    
    /**
    * <pre>
    * 1. MethodName : subChannelListAjax
    * 2. ClassName : BasicProductController.java
    * 3. Comment : ???????????? ???????????? ????????? 
    * 4. ????????? : DEV_KIMMINHO
    * 5. ????????? : 2015. 12. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/am/product/subChannelListAjax")
    public JSON subChannelListAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        List<Map<String, Object>> list = this.basicProductService.selectSubChannelList(commandMap);

        json.put("ChannelList", list);
        
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : subChannelListAjax
     * 2. ClassName : BasicProductController.java
     * 3. Comment : ???????????? ???????????? ????????? 
     * 4. ????????? : DEV_KIMMINHO
     * 5. ????????? : 2015. 12. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping(value="/am/product/vendorProductView")
     public ModelAndView vendorProductView(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {   
    	 ModelAndView mv = new ModelAndView();
         return mv;
     }
     
     /**
      * @api {POST} /am/product/pendingHistoryPopup.do
      * @apiName ?????????????????? ??????
      * @apiGroup SB????????????
      * 
      * @apiParam {String} PRD_MST_CD ?????? ??????
      * 
      * @apiSuccess {Object[]} productHoldOffInfoList ???????????? ?????? ????????? [{VDR_HLD_DESC=????????? ?????? ?????????!!(????????????), VDR_HLD_CNT_YN=N(??????/?????????), VDR_HLD_ETC_YN=N(??????), VDR_HLD_PRC_YN=Y(?????????), VDR_HLD_NM_YN=Y(?????????), VDR_HLD_NFI_YN=N(????????????), VDR_HLD_CTG_YN=Y(????????????), VDR_HLD_REG_DT=2020-04-26, VDR_HLD_IDX=61}, {VDR_HLD_DESC=??????/???????????? ????????? ????????????., VDR_HLD_CNT_YN=Y, VDR_HLD_ETC_YN=Y, VDR_HLD_PRC_YN=N, VDR_HLD_NM_YN=N, VDR_HLD_NFI_YN=Y, VDR_HLD_CTG_YN=N, VDR_HLD_REG_DT=2020-04-24, VDR_HLD_IDX=42}]
      * @apiSuccess {Object} commandMap ???????????????
      */
     @RequestMapping(value="/am/product/pendingHistoryPopup")
     public ModelAndView pendingHistoryPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
     {   
    	 ModelAndView mv = new ModelAndView();
         
    	 String prdCD = StringUtil.getString(commandMap.get("PRD_MST_CD"),"");
         commandMap.put("PRD_MST_CD", prdCD);
    	 commandMap.put("pageSize", 5);
         
    	 int totalCount = this.basicProductService.selectHoldOffDetailListCount(commandMap);
    	 
         Paging paging = new Paging(totalCount, commandMap);
         mv.addObject( "paging", paging );
    	 
         commandMap.put("startNum", paging.getStartNum());
         commandMap.put("endNum", paging.getEndNum());
    	 
         List<Map<String, Object>> productHoldOffInfoList = null;
    	 
    	 if(totalCount > 0){
    	     productHoldOffInfoList = this.basicProductService.selectHoldOffDetailList(commandMap);
    	 }
         mv.addObject("productHoldOffInfoList", productHoldOffInfoList);
         mv.addObject("commandMap", commandMap);
         
         return mv;
     }
     
     @RequestMapping(value="/am/product/basicProductBatchEdit")
     public ModelAndView basicProductBatchEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
         ModelAndView mv = new ModelAndView();
         return mv;
     }
     
     @RequestMapping(value="/am/product/basicProductList_temp")
     public ModelAndView basicProductList_temp(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
         ModelAndView mv = new ModelAndView();
         return mv;
     }

     @RequestMapping(value="/am/product/basicProductBatchEditExcelAjax")
     public JSON basicProductBatchEditExcel(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception {
         JSON json = new JSON();

         String [] columName = new String[]{"PRD_MST_CD", "PRD_MST_NM_BEFORE", "PRD_MST_NM", "PRD_MST_PRC_BEFORE", "PRD_MST_PRC", "PRD_MST_DLV_FEE_BEFORE", "PRD_MST_DLV_FEE" };
     	
         MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
         CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
         List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
         List<Map<String, Object>> basicProductEditList  = new ArrayList<Map<String,Object>>();

         if(file != null)
         {
	           basicProductEditList = ExcelUtil.excelRead(file, columName);
	           if(basicProductEditList != null)
	           {
		           if(basicProductEditList.size() > 0)
		           {
		        	   commandMap.put("basicProductEditList", basicProductEditList);
		        	   list = this.basicProductService.updateBasicProductEditList(request, commandMap);
		           }
	           }
         }

         json.put("allSize", Integer.toString(basicProductEditList.size()));
         json.put("failList", list);
         return json;
     }

     /**
     * <pre>
     * 1. MethodName : basicProductEditListExcelDownload
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : ?????? ???????????? ?????? ????????????
     * 4. ?????????       : hjkim
     * 5. ?????????       : 2020. 6. 12.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping("/am/product/basicProductBatchEditListDownload")
     public ModelAndView basicProductBatchEditListDownload(HttpServletRequest request, HttpServletResponse response, @RequestParams Map<String, Object> commandMap) throws Exception
     {
         ObjectMapper mapper = new ObjectMapper();
         TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
         String basicProductData = StringUtil.getString(commandMap.get("selectedFailList"),"");
         List<Map<String, Object>> selectedFailList = mapper.readValue(basicProductData, typeRef);

         int totalCount = selectedFailList.size();
         commandMap.put("excelDown", "Y");
         
         if(totalCount > 0){
         	 String fileName = "failProductBatchModification_"+DateUtil.getToday();

         	 String [] rowTitle = { "????????????", "????????? ?????? ???", "????????? ?????????", "????????? ?????? ???", "????????? ?????? ???", "????????? ?????? ???", "????????? ?????? ???"};      
             String [] cellSize = { "50", "140", "140", "50", "50", "50", "50"};
             String [] dataName = { "PRD_MST_CD", "PRD_MST_NM_BEFORE", "PRD_MST_NM", "PRD_MST_PRC_BEFORE", "PRD_MST_PRC", "PRD_MST_DLV_FEE_BEFORE", "PRD_MST_DLV_FEE"};
             String [] dataType = { "String","String","String","Number","Number","Number","Number"};
         	//?????? ????????? ????????? excel ?????? csv ??????
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv ???????????? ??????
             	commandMap.put("dnFileName", fileName); //???????????? ?????? ??????
             	commandMap.put("rowTitleArr", rowTitle); //????????????
             	commandMap.put("dataNameArr", dataName); //?????????
             	commandMap.put("responseForCsv", response); //response
             }
            
         	
         	if(selectedFailList != null){
                 // ???????????? ?????? ?????? ????????????
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, selectedFailList, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }
}
