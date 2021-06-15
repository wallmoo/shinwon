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
 * @프로그램 설명 : 관리자 > 상품관리 > 상품목록을 처리하는 Controller Class
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
     * 3. Comment    : 관리자 > 상품관리 > 상품목록
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 24.
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
        
        //기본값 설정
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
                
        
        
        
        commandMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC); //PC 카테고리
        
        int totalCount = 0;
        List<Map<String, Object>> list = null;
        Paging paging = null;
        
        //입점업체일 경우 입점업체로만 검색
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("searchPrdMstVdrYn", "Y");
        		commandMap.put("searchPrdMstVdrIdx", admin.getADM_MST_SUB_IDX());
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		
        		// 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
        	}
        }

        //페이징
    	totalCount = this.basicProductService.selectBasicProductCount(commandMap);
    	paging = new Paging(totalCount, commandMap); 
    	
    	if(totalCount>0)
    	{
    		list = this.basicProductService.selectBasicProductList(commandMap);
    	}
                
        //화면상단 상품요약
        Map<String, Object> productSum = this.basicProductService.selectProductSumList(commandMap);
        
        // MD리스트
        commandMap.put("AUT_MST_IDX", 26);
        List<Map<String, Object>> basicMdList = this.basicProductService.selectBasicMdList(commandMap);
        
        //브랜드 리스트
        List<Map<String, Object>> brandList = this.basicProductService.selectBrandList(commandMap);
        
        //입점업체 리스트
        List<Map<String, Object>> vendorList = this.basicProductService.selectVendorList(commandMap);
        
        //pc -> mobile url 변경
        String isMobileChk = StringUtil.getString(request.getAttribute("isMobileChk"), "N");
        if(isMobileChk.equals("Y")){
        	mv.setViewName("/am/product/basicProductListMobile");
    	}else{
    		mv.setViewName("/am/product/basicProductList");
    	}
        //배송비 공통 코드 리스트
        mv.addObject("deleveryFeeList", this.commonService.selectCode("PRODUCT_DELEVERY_FEE"));
        //시즌 공통 코드
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON"));
        
        //commandMap 원복 
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
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());
        
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);//상품코드
        
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
            if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
                commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
                result = this.basicProductService.updateBasicProductVdrStatusList(request, commandMap);
            }
            if(result > 0)
            {
                alertMsg = "수정이 되었습니다.";
            }
            else{
                alertMsg = "처리 중 오류가 발생하였습니다.";
            }
        }else{
            result = this.basicProductService.updateBasicProductStatusList(request, commandMap);
            
            if(result > 0)
            {
                alertMsg = "수정이 되었습니다.";
            } 
            else 
            {
                alertMsg = "처리 중 오류가 발생하였습니다.";
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
    * 3. Comment    : 관리자 > 상품관리 > 상품 등록 화면(온라인) R
    * 4. 작성자       : jesong
    * 5. 작성일       : 2015. 4. 14.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return ModelAndView
    * @throws Exception
    */
    /**
     * @api {POST} /am/product/basicProductForm.do
     * @apiName 상품등록 화면
     * @apiGroup SB상품관리
     * 
     * @apiSuccess {Object} commandMap 파라미터맵 {pageSize=20, REG_IP=0:0:0:0:0:0:0:1, cPage=, PRD_FILE_NAME=ad54b2be-f05d-4f38-8a0b-1fc29ade93f9, VDR_MST_IDX=54, searchPrdMstSellState=, PRD_MST_CD=, searchPrdMstDplState=, searchPrdMstVdrIdx=54, searchPrdMstNm=, searchPrdCtgIdx=, searchPrdMstApvState=, PRD_NFI_LEVEL=0, PRD_NFI_USE_YN=Y, productData=, searchPrdCtgEnv=, searchYn=, PATH_ID=VEN, searchDetailY=none, productStateNm=입점업체 상품등록, selectMenuCode=001000000, searchPrdCtgDepth2=, searchPrdCtgDepth1=, searchPrdMstMdId=, searchPrdMstCd=, searchPrdCtgDepth3=}
     * @apiSuccess {String} vendorManagerInfo 입접업체 관리자 상세 정보 {VDR_MST_CTR_ED_DT=2020-04-30, VDR_MST_BUSI3=13527, VDR_MST_BUSI2=02, VDR_MST_BUSI1=133, VDR_MST_MNG_NM=abc, VDR_MST_MD_ID=md002, VDR_MST_FEE=5(브랜드 수수료), VDR_MST_CEO_NM=이대표_1, VDR_MST_MNG_HP3=1234, VDR_MST_MNG_HP2=1234, VDR_MST_MNG_HP1=010, VDR_MST_JB_ADDR1=서울특별시?서초구?양재동?326-1, VDR_MST_IDX=54, VDR_MST_JB_ADDR2=123, VDR_MST_MAIL=abc@naver.com, VDR_MST_BANK_CD=004, VDR_MST_MNG_TYPE=1698, VDR_MST_BUSI_TYPE=업종_1, VDR_MST_MNG_MAIL=abc@naver.com, VDR_MST_CTR_ST_DT=2020-04-01, VDR_MST_NM=BESTIBELLI, VDR_MST_POST5=06779, VDR_MST_FAX3=0000, VDR_MST_FAX1=031, VDR_MST_FAX2=1234, VDR_MST_ACT_NO=1234567890, VDR_MST_ACT_HDR=이대표_1, VDR_MST_MNG_TEL1=02, VDR_MST_MNG_TEL2=1234, VDR_MST_MNG_TEL3=1234, VDR_MST_BUSI_CDT=업태_1, VDR_MST_TEL2=1234, VDR_MST_TEL1=031, VDR_MST_CTR_DT=2020-04-01, VDR_MST_TEL3=5678, VDR_MST_USE_YN=Y, VDR_MST_BAL_ACT=30, VDR_MST_DLV_PRICE=10000, VDR_MST_DR_ADDR2=123, VDR_MST_DR_ADDR1=서울특별시?서초구?강남대로12길?6?(양재동)}
     * @apiSuccess {Object} brandManagerInfo 브랜드 상세 정보  {BND_MST_IDX=1778, BND_MST_BRAND_NM = MARKM}
     */
    @RequestMapping(value="/am/product/basicProductForm")
    public ModelAndView basicProductForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        String alertMsg = "";
        //입점업체 등록 및 관리자 등록
        String serverName = request.getServerName().toString();

        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("productStateNm", "입점업체 상품등록");
        		commandMap.put("PATH_ID","VEN");
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		// 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                // 브랜드 상세 정보
                Map<String, Object> brandManagerInfo = new HashMap<String, Object>();
                brandManagerInfo = this.brandManagerService.selectBrandInfoByVendor(commandMap);
                
                if(brandManagerInfo==null || brandManagerInfo.isEmpty()){
                    alertMsg = "등록한 브랜드 정보가 없습니다.";
                    mv.addObject("alertMsg", alertMsg);
                    mv.addObject("returnUrl", "/am/product/basicProductList.do");
                    
                    mv.setViewName("am/common/result");
                    return mv;
                }
                mv.addObject("brandManagerInfo", brandManagerInfo);
                mv.setViewName("/am/product/basicProductForm");
        	}
        }else{
        	commandMap.put("productStateNm", "상품등록");
        	commandMap.put("PATH_ID","SYS");
        	mv.setViewName("/am/product/basicProductForm");
        	
        }
        //상품 고시 정보 조회시 필요
        commandMap.put("PRD_NFI_VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        //상품 등록시 필요 정보
        Map<String, Object> resultMap = this.basicProductService.selectBasicProductViewInfo(commandMap);
        
        commandMap.put("PRD_FILE_NAME",UUID.randomUUID().toString());
        //RETURN OBJECT
        mv.addObject("sizeList", this.commonService.selectCode("COMMON_PRODUCT_SIZE")); //사이즈 공통 코드
        mv.addObject("colorList", this.commonService.selectCode("COMMON_PRODUCT_COLOR")); //색상 공통 코드
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //시즌 공통 코드
        mv.addObject("deleveryFeeList", this.commonService.selectCode("PRODUCT_DELEVERY_FEE")); //배송비 공통 코드 리스트
        mv.addObject("genderList", this.commonService.selectCode("COMMON_GENDER")); //성별 공통 코드 리스트
        mv.addObject("specListP", resultMap.get("specListP")); 
        mv.addObject("productNfiList", resultMap.get("productNfiList"));
        
        mv.addObject("commandMap", commandMap);
        
        return mv;
    }
    

    /**
     * @api {POST} /am/product/tagBatchEditPopup.do
     * @apiName 태그일괄수정 팝업 화면
     * @apiGroup SB상품관리
     *
     * @apiSuccess {JSON} TAG_GROUP_LIST 태그 그룹 상세 목록 리스트 [{"TAG_GRP_ID":태그그룹ID, "TAG_GRP_TITLE":태그그룹타이틀, "TAG_GRP_DES":태그그룹설명, "TAG_GRP_CNT":"일반 태그 총 개수", "TAG_LIST":[{"TAG_MST_ID" : 태그ID, "TAG_MST_TITLE" : 태그타이틀}, {"TAG_MST_ID" : 태그ID, "TAG_MST_TITLE" : 태그타이틀2}] }]
     * @apiSuccess {Object} commandMap 파라미터맵
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
     * @apiName 태그일괄수정 처리
     * @apiGroup SB상품관리
     *
     * @apiParam {JSON} tagData 태그 데이터 리스트  TAG_MST_ID : 태그아이디, TAG_BND_REP : 대표태그여부  / [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}, {"TAG_MST_ID":"0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d" , "TAG_BND_REP":"Y"}]
     * @apiParam {String[]} PRD_MST_CDs 상품 코드 리스트
     * @apiParam {Object} commandMap 파라미터맵
     * 
     * @apiSuccess {String} alertMsg 태그 수정 성공/오류 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
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
     * 3. Comment    : 관리자 > 상품 관리 > 상품 등록
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 4. 14.
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
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_REG_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_REG_ID", admin.getADM_MST_ID());
        
        //입점업체 등록 및 관리자 등록
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("PRD_MST_VDR_YN", "Y"); //입점업체 여부
        		commandMap.put("PRD_MST_VDR_IDX", admin.getADM_MST_SUB_IDX());
        		commandMap.put("PRD_MST_APV_STATE", "D"); //승인상태 대기중
        		commandMap.put("PRD_MST_INTO_TYPE", "V");	//입점업체
        		commandMap.put("SET_PRD_MST_CD", "V");	//입점업체에서 등록시 V로 앞자리 생성
        		//commandMap.put("PRD_MST_BRD_IDX", StringUtil.getString(commandMap.get("BND_MST_IDX")));
        		
        		if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC"),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC"),0) > 0){
        			commandMap.put("PRD_MST_CPN_OWN", "V");	//입점업체에서 등록시 즉시할인쿠폰 등록 여부
        		}
        	}else{
        	    alertMsg = "접속 권한이 없습니다.";
        	    mv.addObject("alertMsg", alertMsg);
        	    mv.addObject("loginStateCode", Code.LOGIN_SITE_NOT_ACCESS);
        	    mv.addObject("returnUrl", "/am/product/basicProductList.do");
        	    
        	    //VIEW NAME
                mv.setViewName("am/common/result");
        	    return mv;
        	}
        }else{
            commandMap.put("PRD_MST_VDR_IDX", StringUtil.getString(commandMap.get("PRD_MST_VDR_IDX"))); // 슈퍼관리자 자사 입점업체/브랜드(1:1) 등록
        	commandMap.put("PRD_MST_VDR_YN", "Y");
    		commandMap.put("PRD_MST_INTO_TYPE", "S");	//관리자몰
    		commandMap.put("SET_PRD_MST_CD", "S");	//MarketPlant몰에서 등록시 S로 앞자리 생성
    		if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC"),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC"),0) > 0){
    			commandMap.put("PRD_MST_CPN_OWN", "S");	//입점업체에서 등록시 즉시할인쿠폰 등록 여부
    		}
        }
        
        //상품 전시 카테고리
        commandMap.put("arrPRD_CTG_IDX", PRD_CTG_IDXs);
        
        result = this.basicProductService.insertBasicProduct(request, commandMap);        
        if(result > 0)
        {
            alertMsg = "정상적으로 저장되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        // 파라미터에 태그가 섞이는 경우 modify화면에서 화면에 태그가 표시되는 문제가 있어 추가함.
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
     * 3. Comment    : 관리자 > 상품관리 > 상품 수정 화면 
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 24.
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
     * @apiName 상품 수정 화면
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} PRD_MST_CD 상품 코드
     * 
     * @apiSuccess {Object} productInfo 상품 상세 정보
     * @apiSuccess {Object[]} productGroupList 묶음상품/세트상품 상세 정보 [{PRD_MST_NM=MM Oversize corduroy shirt (MYBAX5005), PRD_MST_SEL_CNT=판매가능수량, SUB_PRD_MST_CD=S0012100, PRD_MST_PRC = 판매가}]
     * @apiSuccess {Object[]} categoryList 카테고리 리스트 [{PRD_CTG_PATH=여성 > TOP > 티셔츠, DSP_CTG_IDX=63087, DSP_PRD_CTG_IDX=3411, PRD_CTG_ENV=P}]
     * @apiSuccess {Object[]} mustOptionList 필수옵션 리스트
     * @apiSuccess {Object[]} addOptionList 추가옵션 리스트
     * @apiSuccess {Object[]} imageList 이미지 리스트 [{PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0.jpeg, PRD_IMG_SYS_NM=S0012134_0.jpeg, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1.png, PRD_IMG_SYS_NM=S0012134_1.png, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2.jpg, PRD_IMG_SYS_NM=S0012134_2.jpg, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3.jpg, PRD_IMG_SYS_NM=S0012134_3.jpg, PRD_IMG_ATT_SIZE=0, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=0}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_500.jpeg, PRD_IMG_SYS_NM=S0012134_0_500.jpeg, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_500.png, PRD_IMG_SYS_NM=S0012134_1_500.png, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_500.jpg, PRD_IMG_SYS_NM=S0012134_2_500.jpg, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_500.jpg, PRD_IMG_SYS_NM=S0012134_3_500.jpg, PRD_IMG_ATT_SIZE=500, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=1}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_450.jpeg, PRD_IMG_SYS_NM=S0012134_0_450.jpeg, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_450.png, PRD_IMG_SYS_NM=S0012134_1_450.png, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_450.jpg, PRD_IMG_SYS_NM=S0012134_2_450.jpg, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_450.jpg, PRD_IMG_SYS_NM=S0012134_3_450.jpg, PRD_IMG_ATT_SIZE=450, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=2}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_320.jpeg, PRD_IMG_SYS_NM=S0012134_0_320.jpeg, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_320.png, PRD_IMG_SYS_NM=S0012134_1_320.png, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_320.jpg, PRD_IMG_SYS_NM=S0012134_2_320.jpg, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_320.jpg, PRD_IMG_SYS_NM=S0012134_3_320.jpg, PRD_IMG_ATT_SIZE=320, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=3}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_250.jpeg, PRD_IMG_SYS_NM=S0012134_0_250.jpeg, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_250.png, PRD_IMG_SYS_NM=S0012134_1_250.png, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_250.jpg, PRD_IMG_SYS_NM=S0012134_2_250.jpg, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_250.jpg, PRD_IMG_SYS_NM=S0012134_3_250.jpg, PRD_IMG_ATT_SIZE=250, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=4}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_180.jpeg, PRD_IMG_SYS_NM=S0012134_0_180.jpeg, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_180.png, PRD_IMG_SYS_NM=S0012134_1_180.png, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_180.jpg, PRD_IMG_SYS_NM=S0012134_2_180.jpg, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_180.jpg, PRD_IMG_SYS_NM=S0012134_3_180.jpg, PRD_IMG_ATT_SIZE=180, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=5}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_125.jpeg, PRD_IMG_SYS_NM=S0012134_0_125.jpeg, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_125.png, PRD_IMG_SYS_NM=S0012134_1_125.png, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_125.jpg, PRD_IMG_SYS_NM=S0012134_2_125.jpg, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_125.jpg, PRD_IMG_SYS_NM=S0012134_3_125.jpg, PRD_IMG_ATT_SIZE=125, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=6}, {PRD_IMG_ORG_NM=오리너구리.jpeg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_0_84.jpeg, PRD_IMG_SYS_NM=S0012134_0_84.jpeg, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=오리너구리, PRD_IMG_IDX=0, PRD_IMG_SORT=7}, {PRD_IMG_ORG_NM=elsaa.png, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_1_84.png, PRD_IMG_SYS_NM=S0012134_1_84.png, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=1, PRD_IMG_SORT=7}, {PRD_IMG_ORG_NM=엘사.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_2_84.jpg, PRD_IMG_SYS_NM=S0012134_2_84.jpg, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=2, PRD_IMG_SORT=7}, {PRD_IMG_ORG_NM=elsa.jpg, PRD_IMG_URL_PATH=http://monkey-soft.com:3151/nas/cdn/attach/product/2020/04/24/S0012134/S0012134_3_84.jpg, PRD_IMG_SYS_NM=S0012134_3_84.jpg, PRD_IMG_ATT_SIZE=84, PRD_IMG_ATT_PATH=/attach/product/2020/04/24/S0012134/, PRD_IMG_ALT_TEXT=null, PRD_IMG_IDX=3, PRD_IMG_SORT=7}]
     * @apiSuccess {Object[]} productNfiList 상품고시정보리스트 [{RNUM=1, PRD_NFI_IDX=1691, PRD_NFI_USE_YN=Y, PRD_NFI_NM=신원상품고시품목}, {RNUM=2, PRD_NFI_IDX=1711, PRD_NFI_USE_YN=Y, PRD_NFI_NM=상품고시테스트}]
     * @apiSuccess {String} PRD_MST_NFI_INF 상품고시정보 항목 면|블랙|44|네이처리퍼블릭|대한민국|2020 SS|정보없음|정보없음||정보없음|정보없음|정보없음||
     * @apiSuccess {String[]} PRD_MST_NFI_INF_ARY 상품고시상세정보 배열[면, 블랙, 44, 네이처리퍼블릭, 대한민국, 2020 SS, 정보없음, 정보없음, , 정보없음, 정보없음, 정보없음, , ]
     * @apiSuccess {Object[]} productNfiInfo 상품고시 마스터 정보 상세 [{PRD_NFI_REG_IP=0:0:0:0:0:0:0:1, PRD_NFI_LEVEL=1, PRD_NFI_INFO=제품소재, PRD_NFI_UP_IDX=1691, PRD_NFI_INFO_YN=N, PRD_NFI_IDX=1692, PRD_NFI_USE_YN=Y, PRD_NFI_REG_DT=20200412021346, PRD_NFI_REG_ID=admin, PRD_NFI_NM=신원상품고시품목}]
     * @apiSuccess {Object[]} tagList 태그 상세 정보 [{TAG_MST_ID=f41f94a4-09bd-42f4-9438-1637546b6603, TAG_MST_TITLE=#힙, TAG_BND_REP=N}, {TAG_MST_ID=0f6b08e3-aafb-4fb0-9546-e6a1b3967c5d, TAG_MST_TITLE=#포도, TAG_BND_REP=Y}]
     * @apiSuccess {Object} brandManagerInfo 브랜드 상세 정보 {BND_MST_BRAND_TYPE=I(I:자사/O:타사), BND_MST_IDX=1778, BND_MST_SEL_NM=MARKM, BND_MST_BRAND_NM=MARKM}
     * @apiSuccess {Object} commandMap 파라미터 맵 {PRD_NFI_LEVEL=0, PRD_MST_CD=S0012134, productStateNm=상품수정, onlineShopCode=ONLINE, selectMenuCode=001000000, IMG_THUMBNAIL_SIZE=83, PRD_NFI_IDX=1691, PRD_NFI_USE_YN=Y, REG_IP=0:0:0:0:0:0:0:1, PATH_ID=SYS, PRD_FILE_NAME=S0012134}
     */
    @RequestMapping(value="/am/product/basicProductEdit")
    public ModelAndView basicProductEdit(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //입점업체 등록 및 관리자 등록
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("productStateNm", "입점업체 상품등록");
        		commandMap.put("PATH_ID","VEN");
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		// 입점업체 관리자 상세 정보
                mv.addObject("vendorManagerInfo", this.vendorManagerService.selectVendorManagerInfo(commandMap));
                //mv.setViewName("/am/product/basicProductVdrEdit");
                mv.addObject("brandManagerInfo", this.brandManagerService.selectBrandInfoByVendor(commandMap));
                mv.setViewName("/am/product/basicProductEdit");
        	}
        }else{
        	commandMap.put("productStateNm", "상품수정");
        	commandMap.put("PATH_ID","SYS");
        	//commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        	mv.setViewName("/am/product/basicProductEdit");
        }
        
        //이미지 저장 파일이름
        commandMap.put("PRD_FILE_NAME", commandMap.get("PRD_MST_CD"));
        
        //상품 상세 정보
        Map<String, Object> resultMap = this.basicProductService.selectBasicProductView(commandMap);

        //공통코드 리스트 정보
        mv.addObject("colorList", this.commonService.selectCode("COMMON_PRODUCT_COLOR")); //색상 공통 코드
        mv.addObject("sizeList", this.commonService.selectCode("COMMON_PRODUCT_SIZE")); //사이즈 공통 코드
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //시즌 공통 코드
        mv.addObject("genderList", this.commonService.selectCode("COMMON_GENDER")); //성별 공통 코드 리스트
        
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
     * 3. Comment    : 관리자 > 상품 관리 > 상품 수정
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /am/product/basicProductModify.do
     * @apiName 상품 수정 처리
     * @apiGroup SB상품관리
     * 
     * @apiParam {String} PRD_MST_CD 상품코드
     * @apiParam {String} PRD_CTG_IDXs 카테고리 인덱스
     * @apiParam {JSON} mustOptionData 색상/컬러 옵션 리스트  CMN_COM_IDX:색상 코드, PRD_CMM_TYPE : (색상:C/사이즈:S), OPT_STK_CNT:재고, CMM_OPT_NM:옵션명, CMM_OPT_USE_YN:사용여부 , CMM_OPT_HW : 키,몸무게   / ex)[{"CMN_COM_IDX":"1172","OPT_STK_CNT":"100","CMM_OPT_NM":"3312","CMM_OPT_USE_YN":"Y","CMM_OPT_HW":""},{"CMN_COM_IDX":"","OPT_STK_CNT":"100","CMM_OPT_NM":"3315","CMM_OPT_USE_YN":"Y","CMM_OPT_HW":""},{"CMN_COM_IDX":"1173","OPT_STK_CNT":"100","CMM_OPT_NM":"3312","CMM_OPT_USE_YN":"Y","CMM_OPT_HW":""}]
     * @apiParam {JSON} addOptionData 추가옵션리스트  PRD_OPT_NM:추가옵션명,PRD_OPT_USE_YN:사용여부  / ex) [{"PRD_OPT_NM":"1+1","PRD_OPT_USE_YN":"Y"}]
     * @apiParam {JSON} tagData 태그 상세 정보 [{"TAG_MST_ID":"f41f94a4-09bd-42f4-9438-1637546b6603" , "TAG_BND_REP":"N"}]
     * 
     * @apiSuccess {String} alertMsg 수정 성공/실패 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiSuccess {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/basicProductModify")
    public ModelAndView basicProductModify(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap
    		, @RequestParams(value="PRD_CTG_IDXs") String[] PRD_CTG_IDXs ) throws Exception  
    {
        ModelAndView mv = new ModelAndView();
       
        Admin admin = SessionsAdmin.getSessionAdmin(request);

        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //상품 전시 카테고리
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
        			//상품 판매 상태 대기상태로 변경
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
            alertMsg = "정상적으로 수정되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
        }
        
        // 파라미터에 태그가 섞이는 경우 modify화면에서 화면에 태그가 표시되는 문제가 있어 추가함.
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
    * 3. Comment : 입점업체 수정 요청
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 27.
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
        
     	//입점업체 등록 및 관리자 등록
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("PRD_MST_VDR_YN", "Y");
        		commandMap.put("PRD_MST_VDR_IDX", admin.getADM_MST_SUB_IDX());
        		commandMap.put("PRD_MST_APV_STATE", "D");
        		commandMap.put("PRD_MST_INTO_TYPE", "V");	//입점업체
        		commandMap.put("SET_PRD_MST_CD", "V");	//입점업체에서 등록시 V로 앞자리 생성
        		if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC"),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC"),0) > 0){
        			commandMap.put("VDR_APV_CPN_OWN", "V");	//입점업체에서 등록시 즉시할인쿠폰 등록 여부
        		}
        	}
        }
        commandMap.put("VDR_MST_IDX", commandMap.get("VDR_MST_IDX"));
        
        int vdrCount = 0; 
        
        vdrCount = this.basicProductService.selectBasicProductVdrCount(commandMap);
        
        if(vdrCount > 0 ){
        	alertMsg = "기존 상품 수정 요청이 완료 된 후 진행해주세요.";
        }else{
        	result = this.basicProductService.insertProductVdr(commandMap);
        	
        	if(result > 0)
            {
                alertMsg = "정상적으로 수정요청이 되었습니다.";
            } 
            else 
            {
                alertMsg = "처리 중 오류가 발생하였습니다.";
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
    * 3. Comment : 상품 상세 팝업
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 23.
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
        
        //상품 상세 정보
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
    * 3. Comment : 상품리스트에서 상품 다중 수정
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 20.
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
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //상품 옵션 
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//상품코드
        
        //입점업체일 경우 입점업체로만 검색
        String serverName = request.getServerName().toString();
        
        if(serverName.indexOf("scm") >= 0){//입점업체 수정
        	if(Code.SCM_ADMINISTRATOR_IDX == admin.getAUT_MST_IDX()){
        		commandMap.put("VDR_MST_IDX", admin.getADM_MST_SUB_IDX());
        		
        		result = this.basicProductService.updateBasicProductVdrList(request, commandMap);
        	}
        	if(result > 0)
            {
                alertMsg = "수정요청이 정상적으로 등록 되었습니다.";
            }
        	else{
        		if(result == -3){
            		alertMsg = "수정대기 상품을 제외한 상품은 수정요청을 하였습니다.";
            	}else{
            		alertMsg = "처리 중 오류가 발생하였습니다.";
            	}
        	}
        }else{
        	result = this.basicProductService.updateBasicProductList(request, commandMap);
        	
        	if(result > 0)
            {
                alertMsg = "수정이 되었습니다.";
            } 
            else 
            {
            	alertMsg = "처리 중 오류가 발생하였습니다.";
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
    * 3. Comment : 상품 삭제
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 20.
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
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());

        //상품 옵션 
        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs);			//상품코드
    		
        result = this.basicProductService.deleteBasicProductList(request, commandMap);
        if(result > 0)
        {
            alertMsg = "정상적으로 삭제되었습니다.";
        } 
        else 
        {
            alertMsg = "처리 중 오류가 발생하였습니다.";
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
     * 3. Comment    : 관리자 > 상품 검색 팝업 (공통)
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 24.
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
        
        //기본값 설정
        commandMap.put("searchPrdMstDelFlag", "N");
        //상세 검색 버튼 초기 설정 
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
        commandMap.put("searchPrdCtgEnv", Code.CATEGORY_TYPE_PC); //PC 카테고리
        
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
        
        mv.addObject("seasonList", this.commonService.selectCode("COMMON_PRODUCT_SEASON")); //시즌 공통 코드
        mv.addObject("list", list);
        mv.addObject("paging", paging);
        mv.addObject("commandMap", commandMap);
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : searchProductCodePopup
     * 2. ClassName  : BasicProductController.java
     * 3. Comment    : 관리자 > 상품 품번 검색 팝업
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
     * @apiName 카테고리 변경 팝업
     * @apiGroup SB상품관리
     * 
     * @apiParam {String[]} arrPRD_CTG_IDX 마지막 선택 카테고리 인덱스
     * 
     * @apiParam {Object} commandMap 파라미터맵
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
     * @apiName 카테고리 변경 저장
     * @apiGroup SB상품관리
     * 
     * @apiParam {String[]} arrPRD_CTG_IDX 마지막 선택 카테고리 인덱스
     * @apiParam {String[]} PRD_MST_CDs 선택한 상품 코드 리스트
     * @apiParam {Object} commandMap 파라미터맵
     * 
     * @apiSuccess {String} alertMsg 카테고리 변경 성공/오류 메세지
     * @apiSuccess {String} returnUrl 수정 성공 이후 돌아가는 URL
     * @apiParam {Object} commandMap 파라미터맵
     */
    @RequestMapping(value="/am/product/basicProductCategoryModify")
    public ModelAndView basicProductCategoryModify(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception 
    {
        ModelAndView mv = new ModelAndView();
        
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        int result = 0; 
        String alertMsg = "";
        
        //기본값 설정 - 등록자/수정자 ID, IP
        commandMap.put("DSP_CTG_REG_IP", request.getRemoteAddr());
        commandMap.put("DSP_CTG_REG_ID", admin.getADM_MST_ID());
        
//        commandMap.put("arrPRD_MST_CD", PRD_MST_CDs); //상품 코드 리스트
//        commandMap.put("arrPRD_CTG_IDX", PRD_CTG_IDXs); //카테고리 리스트
        
        result = this.basicProductService.updateBasicProductCategory(request, commandMap);
        
        if(result > 0){
            alertMsg = "카테고리가 변경되었습니다.";
        } else {
            alertMsg = "처리 중 오류가 발생하였습니다.";
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
     * @apiName 상품일괄업로드 팝업
     * @apiGroup 관리자 상품관리
     *
     * @apiParam {String} PRD_EXC_FILE_IDX 엑셀 파일 인덱스
     *
     * @apiSuccess {Object} commandMap 파라미터맵
     * @apiSuccess {Object[]} list 업로드 리스트
     * @apiSuccess {Integer} count 업로드 갯수
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
     * @apiName 상품일괄업로드 저장
     * @apiGroup 관리자 상품관리
     *
     * @apiParam commandMap 파라미터맵
     *
     * @apiSuccess alertMsg 수정 성공/실패 메세지
     * @apiSuccess commandMap 파라미터맵
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
//           mv.addObject("alertMsg", "등록 되었습니다.");
//           //mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "") + "/am/product/productUploadPopup.do?PRD_EXC_FILE_IDX="+PRD_EXC_FILE_IDX);
//           
//       }else
//       {
//          mv.addObject("alertMsg", "엑셀자료에 오류가 있습니다. 확인 후 재업로드 바랍니다.");
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
    * 3. Comment : 견적관리 상품추가를 위한 팝업
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 9.
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
        
        //기본값 설정
        commandMap.put("searchPrdMstDelFlag", "N");
        //상세 검색 버튼 초기 설정 
        if( !commandMap.containsKey("searchDetailY")){ 
        	commandMap.put("searchDetailY", "none");	
        }
        
        String searchPrdMstCd = StringUtil.getString(commandMap.get("searchPrdMstCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstCd", searchPrdMstCd);
        String searchPrdMstErpCd = StringUtil.getString(commandMap.get("searchPrdMstErpCd"), "").replaceAll(" ", "");
        commandMap.put("searchPrdMstErpCd", searchPrdMstErpCd);
        commandMap.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_ING);

        //페이징
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
    * 3. Comment : 견적관리 상품추가를 위해 상품옵션 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 9.
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

      //상품 상세 정보
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
    * 3. Comment    : 상품리스트 엑셀 다운로드
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2015. 1. 6.
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

        	 String [] rowTitle = { "카테고리","상품코드","상품명","입점업체","판매가","검색가","배송비","진열여부","판매상태(I=판매중/T=품절상품/S=미판매/O=일부품절)","승인여부(D=대기/S=승인)","판매가능수량","쇼핑채널PC","쇼핑채널MOBILE"};      
             String [] cellSize = { "50","50","50","50","50","50","50","50","50","50","50","50","50"};
           	 String [] dataName = { "CATEGORY_NAMES","PRD_MST_CD", "PRD_MST_NM","PRD_MST_VDR_NM","PRD_MST_PRC", "PRD_MST_SCH_PRC","PRD_MST_DLV_FEE","PRD_MST_DPL_STATE", "PRD_MST_SEL_STATE","PRD_MST_APV_STATE","PRD_MST_SEL_CNT", "PRD_MST_CNL_PC_YN","PRD_MST_CNL_MB_YN"};
           	 //String [] dataName = { "PRD_CTG_LVL_NM","PRD_MST_CD", "PRD_MST_NM","PRD_MST_VDR_NM","PRD_MST_PRC", "PRD_MST_SCH_PRC","PRD_MST_DLV_FEE","PRD_MST_DPL_STATE", "PRD_MST_SEL_STATE","PRD_MST_APV_STATE","PRD_MST_SEL_CNT", "PRD_MST_CNL_PC_YN","PRD_MST_CNL_MB_YN"};           	 
           	
             String [] dataType = { "String","String","String","String","Number","Number","Number","String","String","String","Number","String","String"};
        	//일정 건수가 넘으면 excel 대신 csv 처리
            if(totalCount > 30000){
            	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
            	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
            	commandMap.put("rowTitleArr", rowTitle); //필드제목
            	commandMap.put("dataNameArr", dataName); //필드명
            	commandMap.put("responseForCsv", response); //response
            }
           
        	list = this.basicProductService.selectBasicProductList(commandMap);
        	
        	if(list != null){
                // 안내문구 목록 엑셀 다운로드
                ExcelUtil.excelDownload(response, rowTitle, cellSize, list, dataName, dataType, fileName);
        	}
        }
         
        return null;
     }
    
    /**
    * <pre>
    * 1. MethodName : subGdsSctnProductAjax
    * 2. ClassName : BasicProductController.java
    * 3. Comment : 상품고시 품목에 대한 항목들 가져오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 23.
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
    * 3. Comment : 관련 콘텐츠 팝업 호출
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 23.
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
    * 3. Comment : 브랜드 팝업
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 24.
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
        
        // 브랜드 관리 목록 갯수
        int totalCount = this.brandManagerService.selectBrandManagerListCount(commandMap);
        
        Paging paging = new Paging(totalCount, commandMap);
		mv.addObject( "paging", paging );

        commandMap.put("startNum", paging.getStartNum());
        commandMap.put("endNum", paging.getEndNum());
        
        List<Map<String, Object>> list = null;
        
        if(totalCount > 0)
        {
        	// 브랜드 관리 목록
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
    * 3. Comment : 제조사 팝업
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 24.
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
        
        // 제조사 관리 목록 갯수
 		int totalCount = this.makerManagerService.selectMakerManagerListCount(commandMap);
 		
 		Paging paging = new Paging(totalCount, commandMap);
 		mv.addObject( "paging", paging );

         commandMap.put("startNum", paging.getStartNum());
         commandMap.put("endNum", paging.getEndNum());
         
         List<Map<String,Object>> list = null;
         
         if(totalCount > 0)
         {
         	// 제조사 관리 목록
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
    * 3. Comment : 제휴체널 하위뎁스 리스트 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 4.
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
     * 3. Comment : 제휴체널 하위뎁스 리스트 
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 12. 4.
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
      * @apiName 보류내역보기 팝업
      * @apiGroup SB상품관리
      * 
      * @apiParam {String} PRD_MST_CD 상품 코드
      * 
      * @apiSuccess {Object[]} productHoldOffInfoList 보류사유 내역 리스트 [{VDR_HLD_DESC=가격이 너무 비싸요!!(상세사유), VDR_HLD_CNT_YN=N(영상/이미지), VDR_HLD_ETC_YN=N(기타), VDR_HLD_PRC_YN=Y(판매가), VDR_HLD_NM_YN=Y(상품명), VDR_HLD_NFI_YN=N(고시정보), VDR_HLD_CTG_YN=Y(카테고리), VDR_HLD_REG_DT=2020-04-26, VDR_HLD_IDX=61}, {VDR_HLD_DESC=영상/이미지가 관련이 없습니다., VDR_HLD_CNT_YN=Y, VDR_HLD_ETC_YN=Y, VDR_HLD_PRC_YN=N, VDR_HLD_NM_YN=N, VDR_HLD_NFI_YN=Y, VDR_HLD_CTG_YN=N, VDR_HLD_REG_DT=2020-04-24, VDR_HLD_IDX=42}]
      * @apiSuccess {Object} commandMap 파라미터맵
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
     * 3. Comment    : 상품 일괄수정 엑셀 다운로드
     * 4. 작성자       : hjkim
     * 5. 작성일       : 2020. 6. 12.
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

         	 String [] rowTitle = { "상품코드", "상품명 변경 전", "상품명 변경후", "판매가 변경 전", "판매가 변경 후", "배송비 변경 전", "배송비 변경 후"};      
             String [] cellSize = { "50", "140", "140", "50", "50", "50", "50"};
             String [] dataName = { "PRD_MST_CD", "PRD_MST_NM_BEFORE", "PRD_MST_NM", "PRD_MST_PRC_BEFORE", "PRD_MST_PRC", "PRD_MST_DLV_FEE_BEFORE", "PRD_MST_DLV_FEE"};
             String [] dataType = { "String","String","String","Number","Number","Number","Number"};
         	//일정 건수가 넘으면 excel 대신 csv 처리
             if(totalCount > 30000){
             	commandMap.put("csvDown", "Y"); //csv 다운로드 여부
             	commandMap.put("dnFileName", fileName); //다운받을 파일 이름
             	commandMap.put("rowTitleArr", rowTitle); //필드제목
             	commandMap.put("dataNameArr", dataName); //필드명
             	commandMap.put("responseForCsv", response); //response
             }
            
         	
         	if(selectedFailList != null){
                 // 안내문구 목록 엑셀 다운로드
                 ExcelUtil.excelDownload(response, rowTitle, cellSize, selectedFailList, dataName, dataType, fileName);
         	}
         }
          
         return null;
      }
}
