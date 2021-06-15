package com.market.mall.am.product.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.routines.UrlValidator;
import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.FileUploadException;
import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.CsvUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.BasicProductService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.product.service.ProductService;
import com.market.util.CompareVdrStateUtil;

import egovframework.rte.fdl.property.EgovPropertyService;
//import org.springframework.transaction.interceptor.TransactionAspectUtils;

/**
 * @PackageName: com.market.mall.am.product.service.impl
 * @FileName : BasicProductServiceImpl.java
 * @Date : 2014. 4. 11.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품관리를 처리하는 Service Implement Class
 * @author ejpark
 */
@Service("basicProductService")
public class BasicProductServiceImpl implements BasicProductService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired 
    private FileUpload fileUpload;
    
    @Autowired 
    private CsvUtil csvUtil;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    @Resource(name="productService") private ProductService productService;
    
    /**
     * <pre>
     * 1. MethodName : selectBasicProductCount
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 목록 갯수
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBasicProductCount(Map<String, Object> commandMap) throws Exception{
        //카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
        String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
        String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
        
        if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgIdx)){
            commandMap.put("searchCategoryYn", "Y");
        }

        return defaultDAO.selectCount("BasicProduct.selectBasicProductCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBasicProductVdrCount
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 상품 수정 요청 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBasicProductVdrCount(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectCount("BasicProduct.selectBasicProductVdrCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectBasicProductList
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 목록
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBasicProductList(Map<String, Object> commandMap) throws Exception {
        commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT);
        
        commandMap.put("onlineShopCode", Code.ONLINE_SHOP_CODE);
        
        //카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
        String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
        String searchPrdCtgBrand = StringUtil.getString(commandMap.get("searchPrdCtgBrand"),"");
        String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
        
        if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgBrand) || !("").equals(searchPrdCtgIdx)){
            commandMap.put("searchCategoryYn", "Y");
        }
        
        List<Map<String, Object>> resultList = null;
        //csv 다운로드인 경우
        if("Y".equals(StringUtil.getString(commandMap.get("csvDown"),""))){
            csvUtil.csvDownload("BasicProduct.selectBasicProductListExcel", commandMap);
        }else{
        	
        	if("Y".equals(StringUtil.getString(commandMap.get("excelDown"),""))){ 
               resultList = defaultDAO.selectList("BasicProduct.selectBasicProductListExcel",commandMap);
        	}else {
                resultList = defaultDAO.selectList("BasicProduct.selectBasicProductList",commandMap);        		
        	}
        }
        
        return resultList;
    }

    /**
     * <pre>
     * 1. MethodName : selectBasicProductRegist
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 입력 화면 
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBasicProductRegist(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        // 상품 상세 정보 + 홍보문구 + 사이즈가이드 + 세탁&취급정보 
        Map<String, Object> productInfo = defaultDAO.select("BasicProduct.selectBasicProductInfo",commandMap);
        
        // 계절입력 - 월 선택 리스트 
        String strPRD_MST_SESN_MONTH = StringUtil.isNullToString(productInfo.get("PRD_MST_SESN_MONTH"));
        String[] arrPRD_MST_SESN_MONTH = new String[12];
        String[] arrMonth = {"N","N","N","N","N","N","N","N","N","N","N","N"};

        if(!"".equals(strPRD_MST_SESN_MONTH)){
            arrPRD_MST_SESN_MONTH = strPRD_MST_SESN_MONTH.split(",");
        }else{
            arrPRD_MST_SESN_MONTH = null;
        }
        
        if(arrPRD_MST_SESN_MONTH != null){
            for(int i=0; i < arrPRD_MST_SESN_MONTH.length ; i++){
                arrMonth[StringUtil.zeroConvert(arrPRD_MST_SESN_MONTH[i])-1] = "Y";
            }
        }

        // 등록대기 상태인경우 기본값을 가져옴.
        if( StringUtil.isNullToString(productInfo.get("PRD_MST_SEL_STATE")).equals(Code.PRODUCT_SELL_STATE_READY)){
            List<Map<String, Object>> tempList = defaultDAO.selectList("BasicProduct.selectBasicProductGuideTemp",commandMap);
            
            for( int i=0; i<tempList.size() ; i++){
                Map<String,Object> temp = (Map<String, Object>)tempList.get(i);
                if( temp.get("BRD_GDS_CAT").equals(Code.PRODUCT_GUIDE_AS)  
                    && StringUtil.nullCheck( productInfo.get("PRD_ASG_IDX")) ){
                    productInfo.put("PRD_ASG_IDX",temp.get("BRD_GDS_IDX") );
                    productInfo.put("PRD_ASG_TITLE",temp.get("BRD_GDS_TITLE") );
                }else if( temp.get("BRD_GDS_CAT").equals(Code.PRODUCT_GUIDE_INFO)  
                        && StringUtil.nullCheck( productInfo.get("PRD_ASG_IDX")) ){
                        productInfo.put("PRD_INF_IDX",temp.get("BRD_GDS_IDX") );
                        productInfo.put("PRD_INF_TITLE",temp.get("BRD_GDS_TITLE") );
                }else if( temp.get("BRD_GDS_CAT").equals(Code.PRODUCT_GUIDE_SHIPPING)  
                        && StringUtil.nullCheck( productInfo.get("PRD_ASG_IDX")) ){
                        productInfo.put("PRD_SHP_IDX",temp.get("BRD_GDS_IDX") );
                        productInfo.put("PRD_SHP_TITLE",temp.get("BRD_GDS_TITLE") );
                }else if( temp.get("BRD_GDS_CAT").equals(Code.PRODUCT_GUIDE_SIZE)  
                        && StringUtil.nullCheck( productInfo.get("PRD_SZG_IDX")) ){
                        productInfo.put("PRD_SZG_IDX",temp.get("BRD_GDS_IDX") );
                        productInfo.put("PRD_SZG_TITLE",temp.get("BRD_GDS_TITLE") );
                }else if( temp.get("BRD_GDS_CAT").equals(Code.PRODUCT_GUIDE_WASH)  
                        && StringUtil.nullCheck( productInfo.get("PRD_ASG_IDX")) ){
                        productInfo.put("PRD_WASH_IDX",temp.get("BRD_GDS_IDX") );
                        productInfo.put("PRD_WASH_TITLE",temp.get("BRD_GDS_TITLE") );
                }
            }
        }
        
        // 상품 옵션 정보 리스트
        List<Map<String, Object>> optionList = defaultDAO.selectList("BasicProduct.selectBasicOnlineProductOptionList",commandMap);
        
        // 상품 카테고리 정보 리스트
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("PRD_CTG_ENV", Code.CATEGORY_TYPE_PC);
        paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));       
        List<Map<String, Object>> categoryListP = defaultDAO.selectList("BasicProduct.selectBasicProductCategoryList",paramMap);
        
        paramMap.put("PRD_CTG_ENV", Code.CATEGORY_TYPE_MOBILE);
        paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));       
        List<Map<String, Object>> categoryListM = defaultDAO.selectList("BasicProduct.selectBasicProductCategoryList",paramMap);
        
        
        // 상품기술정보
        List<Map<String, Object>> techInfoList = defaultDAO.selectList("BasicProduct.selectProductTechInfoList",commandMap);
        
        // 상품 아이콘 정보 리스트
        List<Map<String, Object>> iconList = defaultDAO.selectList("BasicProduct.selectProductIconList",commandMap);        
        
        // 대표이미지
        List<Map<String, Object>> imageList = defaultDAO.selectList("BasicProduct.selectProductImageList",commandMap);      
        
        // activity
        List<Map<String, Object>> activityList = defaultDAO.selectList("BasicProduct.selectBasicProductActivity",commandMap); 
        
        resultMap.put("productInfo", productInfo);
        resultMap.put("optionList", optionList);
        resultMap.put("categoryListP", categoryListP);
        resultMap.put("categoryListM", categoryListM);
        resultMap.put("techInfoList", techInfoList);
        resultMap.put("iconList", iconList);
        resultMap.put("imageList", imageList);
        resultMap.put("arrMonth", arrMonth);
        resultMap.put("activityList", activityList);
        
        return resultMap;
    }
    /**
     * <pre>
     * 1. MethodName : selectBasicProductViewInfo
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 등록시 관련 정보
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBasicProductViewInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        
        //상품 스펙 정보 리스트
        paramMap.put("SPC_MST_ENV", Code.SPEC_TYPE_PC);     
        List<Map<String, Object>> specListP = defaultDAO.selectList("BasicProduct.selectBasicProductSpecList",paramMap);
        
        // 상품고시정보
        commandMap.put("PRD_NFI_LEVEL", "0");
        commandMap.put("PRD_NFI_USE_YN", "Y");
        commandMap.put("VDR_MST_IDX", commandMap.get("PRD_NFI_VDR_MST_IDX"));
        List<Map<String, Object>> productNfiList = defaultDAO.selectList("ProductNotificationInfo.selectProductNotificationInfoList",commandMap);
        
        resultMap.put("specListP", specListP);
        resultMap.put("productNfiList", productNfiList);
        
        return resultMap;
    }
    /**
     * <pre>
     * 1. MethodName : selectBasicProductView
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 상세 정보
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBasicProductView(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();

        // 썸네일 사이즈 지정 
        commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
        commandMap.put("onlineShopCode", Code.ONLINE_SHOP_CODE);
        
        String prdCD = StringUtil.getString(commandMap.get("PRD_MST_CD"),"");
        
        //상품 필수 옵션 리스트
        List<Map<String, Object>> mustOptionList = new ArrayList<Map<String, Object>>();
        //상품 추가 옵션 리스트
        List<Map<String, Object>> addOptionList = new ArrayList<Map<String, Object>>();
        //태그 리스트
        List<Map<String, Object>> tagList = new ArrayList<Map<String, Object>>();
        
        // 상품 상세 정보
        Map<String, Object> productInfo = defaultDAO.select("BasicProduct.selectBasicProductInfo",commandMap);
        String prdType = StringUtil.getString(productInfo.get("PRD_MST_TYPE"),"");
        
        //묵음상품,세트상품일 경우
        List<Map<String, Object>> productGroupList = new ArrayList<Map<String, Object>>();
        if(prdType.equals("S") || prdType.equals("B")){
            productGroupList = defaultDAO.selectList("BasicProduct.selectbasicProductGroup", commandMap);
            resultMap.put("productGroupList", productGroupList);
            
            commandMap.put("TAG_BND_ID", prdCD);
            commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_PRODUCT);
            
            tagList = defaultDAO.selectList("PcTag.selectTagListById", commandMap); //등록한 태그 상세 정보
            
            resultMap.put("tagList", tagList);
        } 
        else {
            //일반 상품일 경우
            mustOptionList = defaultDAO.selectList("BasicProduct.selectProductMustOptionList", commandMap);
            addOptionList = defaultDAO.selectList("BasicProduct.selectProductAddOptionList", commandMap);
            
            resultMap.put("mustOptionList", mustOptionList);
            resultMap.put("addOptionList", addOptionList);
            
            commandMap.put("TAG_BND_ID", prdCD);
            commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_PRODUCT);
            
            tagList = defaultDAO.selectList("PcTag.selectTagListById", commandMap); //등록한 태그 상세 정보
            
            resultMap.put("tagList", tagList);
        }
        
        // 상품 카테고리 정보 리스트
        Map<String, Object> paramMap = new HashMap<String, Object>();
        /*
         * 카테고리 환경 구분 미사용
         * paramMap.put("PRD_CTG_ENV", Code.CATEGORY_TYPE_PC);
         */
        paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));       
        List<Map<String, Object>> categoryList = defaultDAO.selectList("BasicProduct.selectBasicProductCategoryList",paramMap);
        
        //상품 스펙 정보 리스트
        paramMap.put("SPC_MST_ENV", Code.SPEC_TYPE_PC);
        paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));       
        
        
        // 대표이미지
        List<Map<String, Object>> imageList = defaultDAO.selectList("BasicProduct.selectProductImageList",commandMap);      
        
        // 상품고시정보
       
        //commandMap.put("PRD_NFI_USE_YN", "Y");
        
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("VDR_MST_IDX", productInfo.get("PRD_MST_VDR_IDX"));
        param.put("PRD_NFI_USE_YN", "Y");
        param.put("PRD_NFI_LEVEL", "0");
        List<Map<String, Object>> productNfiList = defaultDAO.selectList("ProductNotificationInfo.selectProductNotificationInfoList",param);
        
        //상품속성 고시정보 배열로 담기
        if(productInfo != null){
            String [] PRD_MST_NFI_INF_ARY = {StringUtil.getString(productInfo.get("PRD_MST_NFI_INF1")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF2")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF3")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF4")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF5")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF6")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF7")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF8")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF9")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF10")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF11")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF12")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF13")),StringUtil.getString(productInfo.get("PRD_MST_NFI_INF14"))};
            
            StringBuffer PRD_MST_NFI_INF=new StringBuffer();
            for(int i=0;i<PRD_MST_NFI_INF_ARY.length;i++)
            {
                PRD_MST_NFI_INF.append(PRD_MST_NFI_INF_ARY[i]);
                if(i<PRD_MST_NFI_INF_ARY.length-1)//배열의 끝이 아니라면 문자사이에 , 구분자를 추가
                {
                    PRD_MST_NFI_INF.append("|");
                }
            }
            resultMap.put("PRD_MST_NFI_INF", StringUtil.getString(PRD_MST_NFI_INF));
            resultMap.put("PRD_MST_NFI_INF_ARY", PRD_MST_NFI_INF_ARY);
        }
        //상품고시 마스터 정보 상세
        if(productInfo != null){
            commandMap.put("PRD_NFI_IDX", productInfo.get("PRD_MST_NFI_IDX"));
            List<Map<String, Object>> productNfiInfo = defaultDAO.selectList("ProductNotificationInfo.selectproductNotificationInfo",commandMap);
            resultMap.put("productNfiInfo", productNfiInfo);
        }
        
        resultMap.put("productInfo", productInfo);
        resultMap.put("categoryList", categoryList);
        resultMap.put("imageList", imageList);
        resultMap.put("productNfiList", productNfiList);
        

        return resultMap;
    }

    /**
     * <pre>
     * 1. MethodName : insertBasicProduct
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 등록 (직영몰관리자)
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertBasicProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        //상품코드 생성
        
        String PRD_MST_CD = defaultDAO.selectStr("BasicProduct.selectBasicProductMasterCd", commandMap);
        
        commandMap.put("PRD_MST_CD", PRD_MST_CD);
        
        if(commandMap.get("PRD_MST_MTA_TAG1") == null || commandMap.get("PRD_MST_MTA_TAG1").equals("")){//메타태그1 강제 등록
            commandMap.put("PRD_MST_MTA_TAG1", "MarketPlant MarketA");
        }
        
        if(commandMap.get("PRD_MST_MTA_TAG2") == null || commandMap.get("PRD_MST_MTA_TAG2").equals("")){//메타태그1 강제 등록
            commandMap.put("PRD_MST_MTA_TAG2", commandMap.get("CTG_PATH")+"/"+commandMap.get("PRD_MST_NM")+"/"+commandMap.get("PRD_MST_BRD_NM")+"/"+commandMap.get("PRD_MST_MRK_NM")+"/"+commandMap.get("PRD_MST_CD"));
        }
       
        //상품 마스터 등록
        result = defaultDAO.insert("BasicProduct.insertProductMaster", commandMap);
        
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        // 묶음상품, 세트상품 등록
        String prdType = StringUtil.getString(commandMap.get("PRD_MST_TYPE"),"");

        String [] productCDData = null;
        
        String typeKey = "";
        if(prdType.equals("S")){
            typeKey = "S_";
        }
        if(prdType.equals("B")){
            typeKey = "B_";
        }
                 
        if(prdType.equals("S") || prdType.equals("B")){
            productCDData = (String[]) commandMap.get(typeKey+"PRD_MST_CD");

            if(productCDData != null && !productCDData.equals("")){
                for(int index=0; index < productCDData.length; index++){
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("PRD_MST_CD", PRD_MST_CD);
                    paramMap.put("SUB_PRD_MST_CD", productCDData[index]);
                    
                    defaultDAO.insert("BasicProduct.insertProductGroup", paramMap);
                }
            }
        }

        //태그 등록
        String tagData = StringUtil.getString(commandMap.get("tagData"),"");
        List<Map<String, Object>> tagDataList = null;
        if(tagData!=null && !tagData.isEmpty()) {
        	tagDataList = mapper.readValue(tagData, typeRef);
        }
        
        
        if(tagDataList != null){
            for(int index=0; index < tagDataList.size(); index++){
                Map<String, Object> tagParam = new HashMap<String, Object>();
                
                tagParam.put("TAG_BND_STATUS", StringUtil.getString(tagDataList.get(index).get("TAG_BND_STATUS"), "USE"));
                tagParam.put(TAG_MODEL.TAG_MST_ID, StringUtil.getString(tagDataList.get(index).get("TAG_MST_ID"), ""));
                tagParam.put(TAG_MODEL.TAG_BND_ID, PRD_MST_CD);
                tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PRODUCT);
                tagParam.put(TAG_MODEL.TAG_BND_REP, StringUtil.getString(tagDataList.get(index).get("TAG_BND_REP"), "N"));
                
                //상품 태그 등록
                defaultDAO.insert("PcTag.insertTagBind", tagParam);
            }
        }

        if(prdType.equals("G")){
            //일반 상품일 경우만 색상,사이즈 옵션 등록
            String mustOptionData = StringUtil.getString(commandMap.get("mustOptionData"),"");
            List<Map<String,Object>> mustOptionList = mapper.readValue(mustOptionData,typeRef);
            
            if(mustOptionList != null){

                HashMap<String, Map<String, Object>> colorMaps = new HashMap<>();
                for(int index=0; index < mustOptionList.size(); index++){
                	
                	String colorCode = StringUtil.getString(mustOptionList.get(index).get("CMN_COM_IDX"),"");
                	String stkCnt = StringUtil.getString(mustOptionList.get(index).get("OPT_STK_CNT"),"");
                	String optNm = StringUtil.getString(mustOptionList.get(index).get("CMM_OPT_NM"),"");
                	String optUseYN = StringUtil.getString(mustOptionList.get(index).get("CMM_OPT_USE_YN"),"");
                	String optHW = StringUtil.getString(mustOptionList.get(index).get("CMM_OPT_HW"),"");
                	
                	if(!colorMaps.containsKey(colorCode)) {
                		Map<String, Object> colorMap = new HashMap<String, Object>();
                		colorMap.put("PRD_MST_CD", PRD_MST_CD);
                		colorMap.put("PRD_CMM_TYPE", "C");
                		colorMap.put("UP_COM_OPT_IDX", "-1");
                		
                		colorMap.put("CMN_COM_IDX", colorCode);
                		colorMap.put("OPT_STK_CNT", stkCnt); // 재고
                		colorMap.put("CMM_OPT_NM", optNm); // 옵션명
                		colorMap.put("CMM_OPT_USE_YN", optUseYN); // 사용여부
                		colorMap.put("CMM_OPT_HW", optHW); // 키,몸무게
                		colorMaps.put(colorCode, colorMap);
                	}
                	
                    
                    Map<String, Object> param = new HashMap<String, Object>();
                    param.put("PRD_MST_CD", PRD_MST_CD);
                    param.put("PRD_CMM_TYPE", "S");
                    param.put("UP_COM_OPT_IDX", colorCode); 
    
                    param.put("CMN_COM_IDX", optNm);
                    param.put("OPT_STK_CNT", stkCnt); // 재고
                    param.put("CMM_OPT_NM", optNm); // 옵션명
                    param.put("CMM_OPT_USE_YN", optUseYN); // 사용여부
                    param.put("CMM_OPT_HW", optHW); // 키,몸무게
                    
                    defaultDAO.insert("BasicProduct.insertProductMustOption", param);
                }
                
                for (Map.Entry<String, Map<String, Object>> elem : colorMaps.entrySet()) {
                	defaultDAO.insert("BasicProduct.insertProductMustOption", elem.getValue());
				}
            }

            
            //추가옵션등록
            String addOptionData = StringUtil.getString(commandMap.get("addOptionData"),"");
            List<Map<String,Object>> addOptionList = mapper.readValue(addOptionData,typeRef);
            
            if(addOptionList != null){
                for(int index=0; index < addOptionList.size(); index++){
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("PRD_MST_CD", PRD_MST_CD);
                    paramMap.put("PRD_OPT_NM", StringUtil.getString(addOptionList.get(index).get("PRD_OPT_NM"),"")); 
                    paramMap.put("PRD_OPT_USE_YN", StringUtil.getString(addOptionList.get(index).get("PRD_OPT_USE_YN"),""));
                    
                    defaultDAO.insert("BasicProduct.insertProductOptionMaster", paramMap);
                }
            }
        }

        
        //상품 전시 카테고리 등록
        defaultDAO.delete("BasicProduct.deleteDisplayCategory", commandMap);
        String [] arrPRD_CTG_IDX = (String[]) commandMap.get("arrPRD_CTG_IDX");
        if ( arrPRD_CTG_IDX != null ){
            for( int i = 0; i < arrPRD_CTG_IDX.length; i++ ){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                paramMap.put("PRD_CTG_IDX", arrPRD_CTG_IDX[i]);
                paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
                defaultDAO.insert("BasicProduct.insertDisplayCategory", paramMap);
            }
        }
        
        updateImage(request,commandMap);
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertProductVdr
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 입점업체 상품 수정 요청
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertProductVdr(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.insert("BasicProduct.insertProductVdr", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : updateBasicProduct
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 수정 (직영몰관리자)
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int updateBasicProduct(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        int totalStock = 0;

        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};

        List<Map<String,Object>> mustOptionList = new ArrayList<Map<String, Object>>();
        List<Map<String,Object>> addOptionList = new ArrayList<Map<String, Object>>();
        
        /*
         * PC/MOBILE 즉시쿠폰 정율/금액 여부 동일 값 설정
         * */
        commandMap.put("PRD_MST_PC_CPN_UNT", commandMap.get("PRD_MST_UNT"));
        commandMap.put("PRD_MST_MB_CPN_UNT", commandMap.get("PRD_MST_UNT"));
        /*
         * PC/MOBILE 즉시쿠폰 정율/금액 동일 값 설정
         * */
        commandMap.put("PRD_MST_PC_CPN_PRC", commandMap.get("PRD_MST_SALE_RATE"));
        commandMap.put("PRD_MST_MB_CPN_PRC", commandMap.get("PRD_MST_SALE_RATE"));
        
        //상품 마스터 수정
        result = defaultDAO.update("BasicProduct.updateProductMaster", commandMap);

        //묶음상품, 세트상품 수정
        String prdType = StringUtil.getString(commandMap.get("PRD_MST_TYPE"),"");
      
        if(prdType.equals("G"))
        {
            // 일반 상품일 경우만 색상,사이즈 옵션  수정
            String mustOptionData = StringUtil.getString(commandMap.get("mustOptionData"),"");
            mustOptionList = mapper.readValue(mustOptionData,typeRef);
            
            //필수 옵션 삭제
            defaultDAO.delete("BasicProduct.deleteProductALLOption", commandMap);
            
            if(mustOptionList != null){

            	String PRD_MST_CD = (String)commandMap.get("PRD_MST_CD");
                HashMap<String, Map<String, Object>> colorMaps = new HashMap<>();
                for(int index=0; index < mustOptionList.size(); index++){
                	
                	String colorCode = StringUtil.getString(mustOptionList.get(index).get("CMN_COM_IDX"),"");
                	String stkCnt = StringUtil.getString(mustOptionList.get(index).get("OPT_STK_CNT"),"");
                	String optNm = StringUtil.getString(mustOptionList.get(index).get("CMM_OPT_NM"),"");
                	String optUseYN = StringUtil.getString(mustOptionList.get(index).get("CMM_OPT_USE_YN"),"");
                	String optHW = StringUtil.getString(mustOptionList.get(index).get("CMM_OPT_HW"),"");
                	
                	if(!colorMaps.containsKey(colorCode)) {
                		Map<String, Object> colorMap = new HashMap<String, Object>();
                		colorMap.put("PRD_MST_CD", PRD_MST_CD);
                		colorMap.put("PRD_CMM_TYPE", "C");
                		colorMap.put("UP_COM_OPT_IDX", "-1");
                		
                		colorMap.put("CMN_COM_IDX", colorCode);
                		colorMap.put("OPT_STK_CNT", stkCnt); // 재고
                		colorMap.put("CMM_OPT_NM", optNm); // 옵션명
                		colorMap.put("CMM_OPT_USE_YN", optUseYN); // 사용여부
                		colorMap.put("CMM_OPT_HW", optHW); // 키,몸무게
                		colorMaps.put(colorCode, colorMap);
                	}
                	
                    
                    Map<String, Object> param = new HashMap<String, Object>();
                    param.put("PRD_MST_CD", PRD_MST_CD);
                    param.put("PRD_CMM_TYPE", "S");
                    param.put("UP_COM_OPT_IDX", colorCode); 
    
                    param.put("CMN_COM_IDX", optNm);
                    param.put("OPT_STK_CNT", stkCnt); // 재고
                    param.put("CMM_OPT_NM", optNm); // 옵션명
                    param.put("CMM_OPT_USE_YN", optUseYN); // 사용여부
                    param.put("CMM_OPT_HW", optHW); // 키,몸무게
                    
                    defaultDAO.insert("BasicProduct.insertProductMustOption", param);
                }
                
                for (Map.Entry<String, Map<String, Object>> elem : colorMaps.entrySet()) {
                	defaultDAO.insert("BasicProduct.insertProductMustOption", elem.getValue());
				}
            }
            
            //추가 옵션 수정
            String addOptionData = StringUtil.getString(commandMap.get("addOptionData"),"");
            addOptionList = mapper.readValue(addOptionData,typeRef);
            
            //추가 옵션 삭제
            defaultDAO.delete("BasicProduct.deleteProductAddOption", commandMap);
            if(addOptionList != null && addOptionList.size() > 0){
                for(int index=0; index < addOptionList.size(); index++){
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
                    paramMap.put("PRD_OPT_NM", StringUtil.getString(addOptionList.get(index).get("PRD_OPT_NM"),"")); 
                    paramMap.put("PRD_OPT_USE_YN", StringUtil.getString(addOptionList.get(index).get("PRD_OPT_USE_YN"),""));
                    //추가 옵션 등록
                    defaultDAO.insert("BasicProduct.insertProductOptionMaster", paramMap);
                }
            }
            
        }
        else if(prdType.equals("B"))
        {
          //묶음 상품일 경우 상품 구성 수정
            defaultDAO.delete("BasicProduct.deleteProductGroup", commandMap);
            String [] productCDData = (String[]) commandMap.get("B_PRD_MST_CD");
            if(productCDData != null && productCDData.length > 0){
                for(int index = 0; index < productCDData.length; index++){
                    Map<String,Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
                    paramMap.put("SUB_PRD_MST_CD", productCDData[index]);
                    
                    defaultDAO.insert("BasicProduct.insertProductGroup", paramMap);
                }
            }
        }
        
        commandMap.put("TAG_BND_ID", commandMap.get("PRD_MST_CD"));
        commandMap.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_PRODUCT);
        
        //태그 삭제
        defaultDAO.delete("PcTag.deleteTagBind", commandMap);
        String tagData = StringUtil.getString(commandMap.get("tagData"),"");
        if(!tagData.equals(""))
        {
            List<Map<String, Object>> tagDataList = mapper.readValue(tagData, typeRef);
            if(tagDataList.size() > 0 && tagDataList != null)
            {
                Map<String, Object> tagParam = new HashMap<String, Object>();
                tagParam.put(TAG_MODEL.TAG_BND_ID, commandMap.get("PRD_MST_CD"));
                tagParam.put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PRODUCT);
                
                for(int index=0; index < tagDataList.size(); index++){
                    tagParam.put("TAG_BND_STATUS", StringUtil.getString(tagDataList.get(index).get("TAG_BND_STATUS"), "USE"));
                    tagParam.put(TAG_MODEL.TAG_MST_ID, StringUtil.getString(tagDataList.get(index).get("TAG_MST_ID"), ""));
                    tagParam.put(TAG_MODEL.TAG_BND_REP, StringUtil.getString(tagDataList.get(index).get("TAG_BND_REP"), "N"));
                    
                    //상품 태그 등록
                    defaultDAO.insert("PcTag.insertTagBind", tagParam);
                }
            }
        }

        
        //상품 전시 카테고리 등록
        defaultDAO.delete("BasicProduct.deleteDisplayCategory", commandMap);
        String [] arrPRD_CTG_IDX = (String[]) commandMap.get("arrPRD_CTG_IDX");
        if ( arrPRD_CTG_IDX != null ){
            for( int i = 0; i < arrPRD_CTG_IDX.length; i++ ){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                paramMap.put("PRD_CTG_IDX", arrPRD_CTG_IDX[i]);
                paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
                defaultDAO.insert("BasicProduct.insertDisplayCategory", paramMap);
            }
        }
        defaultDAO.delete("BasicProduct.deleteProductImage", commandMap);
        updateImage(request,commandMap);
       
        
        return result;
    }
    

    /**
    * <pre>
    * 1. MethodName : updateBasicProductStatusList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 상품리스트에서 진열,임직원,제휴사 ,네이버,다음  다중 수정
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicProductStatusList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        
        int result = 0;
        
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");
        
        if(arrPRD_MST_CDs != null){
            String PRD_MST_CD = "";
            for( int i = 0; i < arrPRD_MST_CDs.length; i++ ){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                PRD_MST_CD = arrPRD_MST_CDs[i];
                
                paramMap.put("PRD_MST_CD", PRD_MST_CD);
                paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                
                /*
                String displayState = StringUtil.getString(commandMap.get("PRD_MST_DPL_STATE_"+PRD_MST_CD),"");
                String employeeState = StringUtil.getString(commandMap.get("PRD_MST_EMP_USE_YN"+PRD_MST_CD),"");
                String partnerState = StringUtil.getString(commandMap.get("PRD_MST_PRT_USE_YN"+PRD_MST_CD),"");
                String naverUseState = StringUtil.getString(commandMap.get("PRD_MST_NAVER_USE_YN"+PRD_MST_CD),"");
                String daumUseState = StringUtil.getString(commandMap.get("PRD_MST_DAUM_USE_YN"+PRD_MST_CD),"");
                */
                
                String displayState  = StringUtil.getString(commandMap.get("batchPrdMstDplState"  ),"");
                String employeeState = StringUtil.getString(commandMap.get("batchPrdMstEmpUseYn"  ),"");
                String partnerState  = StringUtil.getString(commandMap.get("batchPrdMstPrtUseYn"  ),"");
                String naverUseState = StringUtil.getString(commandMap.get("batchPrdMstNaverUseYn"),"");
                String daumUseState  = StringUtil.getString(commandMap.get("batchPrdMstDaumUseYn" ),"");
                
                if(!displayState.equals("")){
                    paramMap.put("PRD_MST_DPL_STATE", displayState); //진열
                    result = defaultDAO.update("BasicProduct.updateProductDisplayStatus", paramMap);
                }
                if(!employeeState.equals("")){
                    paramMap.put("PRD_MST_EMP_USE_YN", employeeState);
                    result = defaultDAO.update("BasicProduct.updateProductEmployeeStatus", paramMap);
                }
                if(!partnerState.equals("")){
                    paramMap.put("PRD_MST_PRT_USE_YN", partnerState);
                    result = defaultDAO.update("BasicProduct.updateProductPartnerStatus", paramMap);
                }
                if(!naverUseState.equals("")){
                    paramMap.put("PRD_MST_NAVER_USE_YN", naverUseState);
                    result = defaultDAO.update("BasicProduct.updateProductNaverStatus", paramMap);
                }
                if(!daumUseState.equals("")){
                    paramMap.put("PRD_MST_DAUM_USE_YN", daumUseState);
                    result = defaultDAO.update("BasicProduct.updateProductDaumStatus", paramMap);
                }


            }
        }
        return result;
    }
    
    public int updateBasicProductVdrStatusList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        
        int result = 0;
        
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");
        
        if(arrPRD_MST_CDs != null){
            String PRD_MST_CD = "";
            for( int i = 0; i < arrPRD_MST_CDs.length; i++ ){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                PRD_MST_CD = arrPRD_MST_CDs[i];
                
                paramMap.put("PRD_MST_CD", PRD_MST_CD);
                paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                
                String displayState = StringUtil.getString(commandMap.get("batchPrdMstDplState"),"");

                if(!displayState.equals("")){
                    paramMap.put("PRD_MST_DPL_STATE", commandMap.get("batchPrdMstDplState"));
                    
                    result = defaultDAO.update("BasicProduct.updateProductDisplayStatus", paramMap);
                }
                /*
                if(!displayState.equals("")){
                    paramMap.put("PRD_MST_DPL_STATE", displayState); //진열
                    result = defaultDAO.update("BasicProduct.updateProductDisplayStatus", paramMap);
                }
                 */
            }
        }
        
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateBasicProductCategory
     * 2. ClassName : BasicProductServiceImpl.java
     * 3. Comment : 상품 다건 카테고리 변경
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateBasicProductCategory(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
         
         int result = 0;
         
         ObjectMapper mapper = new ObjectMapper();
         TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
         
         String productData = StringUtil.getString(commandMap.get("productData"),"");
         List<Map<String, Object>> arrPRD_MST_CD = mapper.readValue(productData, typeRef);
         
         String ctgIdx = StringUtil.getString(commandMap.get("arrPRD_CTG_IDX"),"");
         List<Map<String, Object>> arrPRD_CTG_IDX = mapper.readValue(ctgIdx, typeRef);
         
         commandMap.put("arrPRD_MST_CD", arrPRD_MST_CD);
         defaultDAO.delete("BasicProduct.deleteDisplayCategoryGroup", commandMap);
         if(arrPRD_MST_CD != null && arrPRD_MST_CD.size() > 0){
             for(int index=0; index < arrPRD_MST_CD.size(); index ++){
                 if(arrPRD_CTG_IDX != null && arrPRD_CTG_IDX.size() > 0){
                     for(int j=0; j < arrPRD_CTG_IDX.size(); j++){
                         Map<String, Object> paramMap = new HashMap<String, Object>();
                         paramMap.put("PRD_MST_CD", arrPRD_MST_CD.get(index).get("PRD_MST_CD"));
                         paramMap.put("PRD_CTG_IDX", arrPRD_CTG_IDX.get(j).get("PRD_CTG_IDX"));
                         result = defaultDAO.insert("BasicProduct.insertDisplayCategory", paramMap);
                     }
                 }
             }
         }
         return result;
     }
    
    /**
    * <pre>
    * 1. MethodName : updateBasicProductList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 상품리스트에서 상품 다중 수정
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;

        //상품 옵션 수정
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");              //상품코드
        
        if ( arrPRD_MST_CDs != null ){
            String PRD_MST_CD = "";
            for( int i = 0; i < arrPRD_MST_CDs.length; i++ ){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                PRD_MST_CD = arrPRD_MST_CDs[i];
                
                paramMap.put("PRD_MST_CD", PRD_MST_CD);
                
                paramMap.put("PRD_MST_NM", commandMap.get("PRD_MST_NM_"+PRD_MST_CD));
                paramMap.put("PRD_MST_PRC", commandMap.get("PRD_MST_PRC_"+PRD_MST_CD));
                
                paramMap.put("PRD_MST_DLV_FEE", commandMap.get("PRD_MST_DLV_FEE_"+PRD_MST_CD));
                
                paramMap.put("PRD_MST_DPL_STATE", commandMap.get("PRD_MST_DPL_STATE_"+PRD_MST_CD));
                paramMap.put("PRD_MST_SEL_STATE", commandMap.get("PRD_MST_SEL_STATE_"+PRD_MST_CD));
                paramMap.put("PRD_MST_APV_STATE", commandMap.get("PRD_MST_APV_STATE_"+PRD_MST_CD));
                paramMap.put("PRD_MST_SEL_CNT", commandMap.get("PRD_MST_SEL_CNT_"+PRD_MST_CD));
                
                paramMap.put("PRD_MST_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
                paramMap.put("PRD_MST_SALE_RATE", commandMap.get("PRD_MST_SALE_RATE_"+PRD_MST_CD));
                
                paramMap.put("PRD_MST_NAVER_USE_YN", commandMap.get("NAVER_USE_"+PRD_MST_CD));
                paramMap.put("PRD_MST_DAUM_USE_YN", commandMap.get("DAUM_USE_"+PRD_MST_CD));
                
                paramMap.put("PRD_MST_EMP_USE_YN", commandMap.get("PRD_MST_EMP_USE_YN_"+PRD_MST_CD));
                paramMap.put("PRD_MST_PRT_USE_YN", commandMap.get("PRD_MST_PRT_USE_YN_"+PRD_MST_CD));
                
                paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                
                //상품 마스터 수정
                result = defaultDAO.update("BasicProduct.updateProductListMaster", paramMap);
            }
        }
        
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateBasicProductVdrList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 상품리스트에서 입점업체 상품 다중 수정 요청
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicProductVdrList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        int vdrCount = 0;
        int vdrResult = 0;

        //상품 옵션 수정
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");              //상품코드
        
        if ( arrPRD_MST_CDs != null ){
            String PRD_MST_CD = "";
            for( int i = 0; i < arrPRD_MST_CDs.length; i++ ){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                PRD_MST_CD = arrPRD_MST_CDs[i];
                
                paramMap.put("PRD_MST_CD", PRD_MST_CD);
                Map<String, Object> originInfo = defaultDAO.select("BasicProduct.selectVdrProductOriginInfo", paramMap);
                
                Map<String, Object> target = new HashMap<String, Object>();
                target.put("PRD_MST_PRC", commandMap.get("PRD_MST_PRC_"+PRD_MST_CD));
        		target.put("PRD_MST_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
        		target.put("PRD_MST_SALE_RATE", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
        		target.put("PRD_MST_SEL_CNT", commandMap.get("PRD_MST_SEL_CNT_"+PRD_MST_CD));
        		target.put("PRD_MST_SEL_STATE", commandMap.get("PRD_MST_SEL_STATE_"+PRD_MST_CD));
                
        		boolean updateFlag = CompareVdrStateUtil.decisionApvState(originInfo, target);
               
        		paramMap.put("PRD_MST_NM", commandMap.get("PRD_MST_NM_"+PRD_MST_CD));
        		paramMap.put("PRD_MST_PRC", commandMap.get("PRD_MST_PRC_"+PRD_MST_CD));
        		 
        		paramMap.put("PRD_MST_DPL_STATE", commandMap.get("PRD_MST_DPL_STATE_"+PRD_MST_CD));
        		paramMap.put("PRD_MST_SEL_STATE", commandMap.get("PRD_MST_SEL_STATE_"+PRD_MST_CD));
        		 
        		paramMap.put("PRD_MST_DLV_FEE", commandMap.get("PRD_MST_DLV_FEE_"+PRD_MST_CD));
        		paramMap.put("PRD_MST_SEL_CNT", commandMap.get("PRD_MST_SEL_CNT_"+PRD_MST_CD));
                 
        		paramMap.put("PRD_MST_NAVER_USE_YN", commandMap.get("NAVER_USE_"+PRD_MST_CD));
				paramMap.put("PRD_MST_DAUM_USE_YN", commandMap.get("DAUM_USE_"+PRD_MST_CD));
				 
				paramMap.put("PRD_MST_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
				paramMap.put("PRD_MST_SALE_RATE", commandMap.get("PRD_MST_SALE_RATE_"+PRD_MST_CD));
				 
				paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
				paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
				 
				paramMap.put("VDR_APV_REG_IP", commandMap.get("PRD_MST_UPD_IP"));
				 
				paramMap.put("VDR_MST_IDX", commandMap.get("VDR_MST_IDX"));
                 
				if(StringUtil.getInt(commandMap.get("PRD_MST_PC_CPN_PRC_"+PRD_MST_CD),0) > 0 || StringUtil.getInt(commandMap.get("PRD_MST_MB_CPN_PRC_"+PRD_MST_CD),0) > 0){
					paramMap.put("VDR_APV_CPN_OWN", "V");   //입점업체에서 등록시 즉시할인쿠폰 등록 여부
				}
				 
				if(!updateFlag)
				{
					paramMap.put("PRD_MST_APV_STATE", "D");
					result = defaultDAO.update("BasicProduct.updateProductListMaster", paramMap);
					
					//기존 상품 코드로 등록 된 수가 있다면 등록 안함.
	                vdrCount = defaultDAO.selectCount("BasicProduct.selectBasicProductVdrCount", paramMap);
	                if(vdrCount == 0){
	                    //입점업체 상품 수정 요청 등록
	                    result = defaultDAO.insert("BasicProduct.insertProductVdr", paramMap);
	                    if(result > 0){//수정요청 등록 후 판매여부 변경
	                        result = defaultDAO.insert("BasicProduct.updateProductMstVdr", paramMap);
	                    }
	                }else{
	                    vdrResult ++;
	                }
				}
				else
				{
					result = defaultDAO.update("BasicProduct.updateProductListMaster", paramMap);
				}
            }
        }
        
        if(vdrResult > 0){
            result = -3;
        }
        
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : selectProductSumList
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 브랜드 목록
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 3. 31.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductSumList(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Map<String, String> searchCondition = new HashMap<String, String>();
        searchCondition.put("searchPrdMstDelFlag", "N");
        searchCondition.put("searchPrdMstCd", StringUtil.getString(commandMap.get("searchPrdMstCd")));
        searchCondition.put("searchPrdMstNm", StringUtil.getString(commandMap.get("searchPrdMstNm")));
        searchCondition.put("searchPrdMstVdrYn",StringUtil.getString(commandMap.get("searchPrdMstVdrYn")));
        searchCondition.put("searchPrdMstVdrIdx",StringUtil.getString(commandMap.get("searchPrdMstVdrIdx")));
        searchCondition.put("searchStartDate",StringUtil.getString(commandMap.get("searchStartDate")));
        searchCondition.put("searchEndDate",StringUtil.getString(commandMap.get("searchEndDate")));
        searchCondition.put("searchPrdMstDplState",StringUtil.getString(commandMap.get("searchPrdMstDplState")));
        searchCondition.put("searchPrdMstApvState",StringUtil.getString(commandMap.get("searchPrdMstApvState")));
        searchCondition.put("searchPrdMstSeason",StringUtil.getString(commandMap.get("searchPrdMstSeason")));
        searchCondition.put("searchPrdMstBrand",StringUtil.getString(commandMap.get("searchPrdMstBrand")));
        searchCondition.put("searchPrdMstType",StringUtil.getString(commandMap.get("searchPrdMstType")));
        searchCondition.put("searchPrdCtgIdx", StringUtil.getString(commandMap.get("searchPrdCtgIdx")));
        searchCondition.put("searchCategoryYn", StringUtil.getString(commandMap.get("searchCategoryYn")));
        // 전체상품
        resultMap.put("all", defaultDAO.selectCount("BasicProduct.selectBasicProductCount", searchCondition) );
        
        // 판매중
        searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_ING);
        resultMap.put(Code.PRODUCT_SELL_STATE_ING, Integer.valueOf(defaultDAO.selectCount("BasicProduct.selectBasicProductCount", searchCondition) ));
    
        // 미판매
        searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_STOP);
        resultMap.put(Code.PRODUCT_SELL_STATE_STOP, Integer.valueOf(defaultDAO.selectCount("BasicProduct.selectBasicProductCount", searchCondition) ));
        
        // 품절상품 
        searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_TEMPOUT);
        resultMap.put(Code.PRODUCT_SELL_STATE_TEMPOUT, Integer.valueOf(defaultDAO.selectCount("BasicProduct.selectBasicProductCount", searchCondition) ));
        
        // 일부 품절
        searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_OP_TEMPOUT);
        resultMap.put(Code.PRODUCT_SELL_STATE_OP_TEMPOUT, Integer.valueOf(defaultDAO.selectCount("BasicProduct.selectBasicProductCount", searchCondition) ));      
                
        return resultMap;
    }
    
    @Autowired
    PlatformTransactionManager transactionManager;
    
    /**
    * <pre>
    * 1. MethodName : updateProductInfoByExcel
    * 2. ClassName  : BasicProductServiceImpl.java
    * 3. Comment    : 엑셀 업로드 상품 수정
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 8. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @Transactional(propagation =  Propagation.NOT_SUPPORTED)
    public Map<String, Object> updateProductInfoByExcel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String failedPrdMstCdList = "";//미존재 상품코드
        String failedImgList = "";//잘못된 이미지 경로
        int failedPrdMstCount = 0;//미존재 상품코드 개수
        int failedImgCount = 0;//잘못된 이미지 경로 개수
        int successPrdMstCount = 0;//성공한 상품코드 개수
        String resultMsg = "엑셀 업로드 중 에러가 발생했습니다.";
        String resultState = "F";
        int result = 0;
        int prdMstCnt = 0;
        Admin admin = SessionsAdmin.getSessionAdmin(request);
        
        //DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        //def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
        //TransactionStatus status = this.transactionManager.getTransaction(def);
        
        String [] columName = {"ROWNUM", "PRD_MST_CD", "PRD_MST_CHANNEL_TYPE", "PRD_PRM_IDX", "PRD_SZG_IDX", "PRD_SZM_IDX", "PRD_BRD_SHG_IDXs", "PRD_MST_DETAIL_IMG_YN", "PRD_MST_DETAIL_DESC", "PRD_MST_DETAIL_TXT", "REL_PRD_MST_CDs", "PRD_INF_IDX", "PRD_SHP_IDX", "PRD_ASG_IDX", "PRD_CTG_IDXs", "IMGs"};
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");
        
        // 엑셀 파일 read
        List<Map<String, Object>> productList = ExcelUtil.excelReadProduct(file, columName);
        
        if(productList.size() > 0){
            for(int i = 0;i < productList.size();i++){
                Map<String, Object> dataMap = (Map<String, Object>) productList.get(i);
                dataMap.put("PRD_MST_UPD_ID", admin.getADM_MST_ID());//수정자 ID
                dataMap.put("PRD_MST_UPD_IP", request.getRemoteAddr());//수정자 IP
                dataMap.put("PRD_MST_SEL_STATE", Code.PRODUCT_SELL_STATE_ING);//판매상태는 판매중으로 고정.
                
                this.trimMap(dataMap);
                
                if(!("").equals(StringUtil.getString(dataMap.get("PRD_MST_CD"),""))){//상품 코드 있는 경우에만 update..
                    prdMstCnt++;//상품코드 개수 플러스.
                    
                    //상품코드 대문자로 수정
                    dataMap.put("PRD_MST_CD", ((String)dataMap.get("PRD_MST_CD")).toUpperCase());
                    
                    /** 이미지 경로 이상여부 체크 시작 **/
                    //이미지 경로 체크
                    String IMGs = StringUtil.getString(dataMap.get("IMGs"),"");
                    /*if(!("").equals(IMGs)){
                        String[] IMG_ARR = IMGs.split("\\|"); // 구분 기호는 |
                        for(String IMG_URL : IMG_ARR){
                            //이미지 경로
                            IMG_URL = propertiesService.getString("file.excel.image.uploadPath") + IMG_URL.trim();
                            File imgFile = new File(IMG_URL);
                            if (!imgFile.isFile()){
                                failedImgList += imgFile.getAbsolutePath().replace("\\", "/") + "</br>";
                                failedImgCount++;
                            }
                        }
                    }*/
                    /** 이미지 경로 이상여부 체크 끝 **/
                    
                    if(failedImgCount == 0){
                        //상품 마스터 수정
                        result = defaultDAO.update("BasicProduct.updateProductInfoByExcel", dataMap);
                        
                        if(result > 0){
                            //홍보문구 수정
                            if(!("").equals(StringUtil.getString(dataMap.get("PRD_PRM_IDX")))){
                                defaultDAO.delete("BasicProduct.deleteProductSellingPoint", dataMap);
                                defaultDAO.update("BasicProduct.insertProductSellingPoint", dataMap);
                            }
                            
                            //사이즈 가이드 수정
                            if(!("").equals(StringUtil.getString(dataMap.get("PRD_SZG_IDX")))){
                                defaultDAO.delete("BasicProduct.deleteProductSizeGuide", dataMap);
                                defaultDAO.update("BasicProduct.insertProductSizeGuide", dataMap);
                            }
                            
                            
                            //상품고시정보 수정
                            if(!("").equals(StringUtil.getString(dataMap.get("PRD_INF_IDX")))){
                                dataMap.put("PRD_INF_USE_YN", "Y");//상품고시정보 사용여부
                                defaultDAO.delete("BasicProduct.deleteProductNotiInfo", dataMap);
                                defaultDAO.update("BasicProduct.insertProductNotiInfo", dataMap);
                            }
                            
                            //배송/반품/교환안내 수정
                            if(!("").equals(StringUtil.getString(dataMap.get("PRD_SHP_IDX")))){
                                dataMap.put("PRD_SHP_USE_YN", "Y");//배송/반품/교환안내 사용여부
                                defaultDAO.delete("BasicProduct.deleteProductShippingGuide", dataMap);
                                defaultDAO.update("BasicProduct.insertProductShippingGuide", dataMap);
                            }
                            
                            //품질보증 AS안내 수정
                            if(!("").equals(StringUtil.getString(dataMap.get("PRD_ASG_IDX")))){
                                dataMap.put("PRD_ASG_USE_YN", "Y");//품질보증 AS안내
                                defaultDAO.delete("BasicProduct.deleteProductAsGuide", dataMap);
                                defaultDAO.update("BasicProduct.insertProductAsGuide", dataMap);
                            }
                            
                            //상품 기술정보 수정
                            String PRD_BRD_SHG_IDXs = StringUtil.getString(dataMap.get("PRD_BRD_SHG_IDXs"),"");
                            if(!("").equals(PRD_BRD_SHG_IDXs)){
                                //기존 상품 기술정보 삭제
                                defaultDAO.delete("BasicProduct.deleteProductTechInfo", dataMap);
                                
                                //기술정보 등록
                                String[] PRD_BRD_SHG_IDX_ARR = PRD_BRD_SHG_IDXs.split(",");
                                int PRD_SHG_SORT = 1;
                                for(String PRD_BRD_SHG_IDX : PRD_BRD_SHG_IDX_ARR){
                                    dataMap.put("PRD_BRD_SHG_IDX", PRD_BRD_SHG_IDX.trim());
                                    dataMap.put("PRD_SHG_SORT", PRD_SHG_SORT++);
                                    defaultDAO.insert("BasicProduct.insertProductTechInfo", dataMap);
                                }
                            }
                            
                            //연관상품 수정(5개)
                            String REL_PRD_MST_CDs = StringUtil.getString(dataMap.get("REL_PRD_MST_CDs"),"");
                            if(!("").equals(REL_PRD_MST_CDs)){
                                //기존 연관상품 삭제
                                defaultDAO.delete("BasicProduct.deleteProductRelated", dataMap);
                                
                                //연관상품 등록
                                String[] REL_PRD_MST_CD_ARR = REL_PRD_MST_CDs.split(",");
                                int REL_SORT = 1;
                                for(String REL_PRD_MST_CD : REL_PRD_MST_CD_ARR){
                                    if(REL_SORT > 5){//5개만 등록 가능
                                        break;
                                    }
                                    dataMap.put("REL_PRD_MST_CD", REL_PRD_MST_CD.trim());
                                    dataMap.put("REL_SORT", REL_SORT++);
                                    defaultDAO.insert("BasicProduct.insertProductRelated", dataMap);
                                }
                            }
                            
                            //상품 카테고리 수정
                            String PRD_CTG_IDXs = StringUtil.getString(dataMap.get("PRD_CTG_IDXs"),"");
                            if(!("").equals(PRD_CTG_IDXs)){
                                //기존 상품 카테고리 삭제
                                defaultDAO.delete("BasicProduct.deleteDisplayCategory", dataMap);
                                
                                //카테고리 등록
                                String[] PRD_CTG_IDX_ARR = PRD_CTG_IDXs.split(",");
                                for(String PRD_CTG_IDX : PRD_CTG_IDX_ARR){
                                    dataMap.put("PRD_CTG_IDX", PRD_CTG_IDX.trim());
                                    defaultDAO.insert("BasicProduct.insertDisplayCategory", dataMap);
                                }
                            }
                            
                            //이미지 업로드
                            if(!("").equals(IMGs)){
                                int product_image_env = 0;
                                dataMap.put("makeThumbnail", "Y"); //makeThumbnail
                                
                                //기존 등록되어있던 이미지 데이터 삭제
                                defaultDAO.insert("BasicProduct.deleteProductImage", dataMap);
                                
                                String[] IMG_ARR = IMGs.split("\\|"); // 구분 기호는 |
                                for(String IMG_URL : IMG_ARR){
                                    //이미지는 최대 8개까지만 등록된다.(0~7)
                                    if(product_image_env >= 8){
                                        break;
                                    }
                                    
                                    dataMap.put("fileObj", dataMap.get("PRD_MST_CD") +"_"+ product_image_env); //FILEOBJ
                                    dataMap.put("product_image_env",product_image_env++);//상품이미지 종류.. 0은 대표이미지, 1~7은 추가이미지
                                    
                                    //이미지 경로
                                    IMG_URL = propertiesService.getString("file.excel.image.uploadPath") + IMG_URL.trim();
                                    
                                    File imgFile = new File(IMG_URL);
                                    
                                    if (imgFile.isFile()){
                                        //이미지 업로드
                                        commandMap = fileUpload.productImageExecuteByExcel(dataMap, imgFile, "product", "image", "");
                                        
                                        //결과 리스트
                                        @SuppressWarnings("unchecked")
                                        ArrayList<Map<String, Object>> imgList = (ArrayList<Map<String, Object>>) commandMap.get("imgList");
                                        
                                        int PRD_IMG_SORT = 0;//sort값
                                        for(Map<String, Object> imgMap : imgList){
                                            //이미지 데이터 등록
                                            Map<String, Object> paramMap = new HashMap<String, Object>();
                                            paramMap.put("PRD_MST_CD", dataMap.get("PRD_MST_CD"));
                                            paramMap.put("PRD_IMG_IDX", dataMap.get("product_image_env"));
                                            paramMap.put("PRD_IMG_SORT", PRD_IMG_SORT++);
                                            paramMap.put("PRD_IMG_ATT_PATH", imgMap.get("webpath"));
                                            paramMap.put("PRD_IMG_SYS_NM", imgMap.get("filename"));
                                            paramMap.put("PRD_IMG_ATT_SIZE", StringUtil.getInt(imgMap.get("size"),0));
                                            paramMap.put("PRD_IMG_URL_PATH", StringUtil.getString(imgMap.get("domain")) + imgMap.get("webpath") +""+ imgMap.get("filename"));
                                            paramMap.put("PRD_IMG_ORG_NM", imgMap.get("fileOrgName"));
                                            paramMap.put("PRD_IMG_ALT_TEXT", dataMap.get("PRD_MST_CD"));//대체텍스트는 일단 상품코드로..
                                            defaultDAO.insert("BasicProduct.insertProductImage", paramMap);
                                        }
                                    }else{
                                         String filePath = imgFile.getAbsolutePath().replace("\\", "/"); 
                                         throw new FileUploadException("지정된 파일을 찾을 수 없습니다.업로드 실패하였습니다.<br/>"+filePath);
                                    }
                                }
                            }

                            //this.transactionManager.commit(status);
                            
                            resultMsg = "전체 상품코드: "+ prdMstCnt +"건<br/>존재하지 않는 상품코드: "+ failedPrdMstCount +"건<br/>등록된 상품코드: "+ ++successPrdMstCount + "건";
                            
                        }else{// 상품 마스터 업데이트 안된 경우.. 상품코드가 없다는 이야기
                            failedPrdMstCdList += (String)dataMap.get("PRD_MST_CD")+"</br>";
                            resultMsg = "전체 상품코드: "+ prdMstCnt +"건<br/>존재하지 않는 상품코드: "+ ++failedPrdMstCount +"건<br/>등록된 상품코드: "+ successPrdMstCount +"건";
                        }
                    }else{//상품코드, 이미지 경로에 이상 있는 경우
                        resultMsg = "잘못된 이미지 경로가 "+ failedImgCount +"건 있어 업로드에 실패했습니다. 확인해주십시오.";
                    }
                }
            }
        }
        
        if(prdMstCnt == successPrdMstCount){
            resultState = "S";
        }
        
        resultMap.put("result", resultState);
        resultMap.put("resultMsg", resultMsg);
        resultMap.put("failedPrdMstCdList", failedPrdMstCdList);
        resultMap.put("failedImgList", failedImgList);
        
        return resultMap;
    }
    
    
    /**
    * <pre>
    * 1. MethodName : trimMap
    * 2. ClassName  : BasicProductServiceImpl.java
    * 3. Comment    : 데이터 공백 제거
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 8. 21.
    * </pre>
    *
    * @param commandMap
    * @return
    */
    public void trimMap(Map<String, Object> commandMap){
        for(String key : commandMap.keySet()){
            commandMap.put(key,StringUtil.getString(commandMap.get(key),"").trim());
        }
    }
    
    /**
    * <pre>
    * 1. MethodName : selectBasicMdList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : MD리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBasicMdList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("BasicProduct.selectBasicMdList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteBasicProductList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 상품삭제
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 20.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteBasicProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;

        //상품 옵션 수정
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");              //상품코드
        
        if ( arrPRD_MST_CDs != null )
        {
            for( int i = 0; i < arrPRD_MST_CDs.length; i++ )
            {
                Map<String, Object> paramMap = new HashMap<String, Object>();
                
                paramMap.put("PRD_MST_CD", arrPRD_MST_CDs[i]);
                paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                
                //상품 마스터 삭제
                result = defaultDAO.update("BasicProduct.deleteProductMaster", paramMap);
            }
        }
        
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateBasicProductApv
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 입점업체 승은요청 상품 승인처리
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicProductApv(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;

        //상품 옵션 수정
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");              //상품코드
        
        if ( arrPRD_MST_CDs != null )
        {
            for( int i = 0; i < arrPRD_MST_CDs.length; i++ )
            {
                Map<String, Object> paramMap = new HashMap<String, Object>();
                
                paramMap.put("PRD_MST_CD", arrPRD_MST_CDs[i]);
                paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                
                //상품 마스터 삭제
                result = defaultDAO.update("BasicProduct.updateBasicProductApv", paramMap);
            }
        }
        
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : updateBasicProductHold
     * 2. ClassName : BasicProductServiceImpl.java
     * 3. Comment : 입점업체 승인요청 상품 보류처리
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int updateBasicProductHold(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
         int result = 0;

         //상품 옵션 수정
         String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");              //상품코드
         
         if ( arrPRD_MST_CDs != null )
         {
             for( int i = 0; i < arrPRD_MST_CDs.length; i++ )
             {
                 Map<String, Object> paramMap = new HashMap<String, Object>();
                 
                 paramMap.put("PRD_MST_CD", arrPRD_MST_CDs[i]);
                 paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                 paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                 
                 //상품 마스터 삭제
                 //result = defaultDAO.update("BasicProduct.updateBasicProductApv", paramMap);
             }
         }
         
         return result;
     }
    
    /**
    * <pre>
    * 1. MethodName : selectBrandList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 브랜드 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBrandList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("BasicProduct.selectBasicProductBrandList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectVendorList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 입점업체 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectVendorList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("BasicProduct.selectVendorList",commandMap);
    }
    
    
    /**
    * <pre>
    * 1. MethodName : selectSubChannelList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 제휴체널 하위뎁스 리스트 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSubChannelList(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("BasicProduct.selectSubChannelList",commandMap);
    }
    
    @SuppressWarnings("unchecked")
    public int insertProductMustOption (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.insert("BasicProduct.insertProductMustOption",commandMap);
    }
    
    public int updateTagBatch (Map<String, Object> commandMap) throws Exception {
        
        int result = 0;

        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
        
        String tagData = StringUtil.getString(commandMap.get("tagData"),"");
        List<Map<String, Object>> tagDataList = mapper.readValue(tagData, typeRef);

        Set prdMstCdSet = new HashSet();
        
        for(int index = 0; index < tagDataList.size(); index++)
        {	
        	prdMstCdSet.add(tagDataList.get(index).get("PRD_MST_CD"));	
        }
        Map<String, Object> deleteParam = new HashMap<String, Object>();
        deleteParam.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_PRODUCT);
        deleteParam.put("arrPRD_MST_CD", prdMstCdSet.toArray());
        defaultDAO.delete("BasicProduct.deleteTagBind", deleteParam);
        
        if(tagDataList != null ){
            for(int index=0; index < tagDataList.size(); index++){
            	tagDataList.get(index).put(TAG_MODEL.TAG_BND_TYPE, CONTENTS_TYPE_CODE.TYPE_PRODUCT);
            }
            Map<String, Object> insertParam = new HashMap<String, Object>();
            insertParam.put("tagList", tagDataList);
            result = defaultDAO.insertObject("BasicProduct.insertTagBatch", insertParam);
        }
        return result;
        
    }

	@Override
	public boolean erpDuplicateCheck(Map<String, Object> commandMap) {
		int result = defaultDAO.selectCount("BasicProduct.erpDuplicateCheck", commandMap);
		return result != 0;
	}
	
	public int selectHoldOffDetailListCount (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectCount("BasicProduct.selectHoldOffDetailListCount", commandMap);
	}
	
	public List<Map<String, Object>> selectHoldOffDetailList (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("BasicProduct.selectHoldOffDetailList", commandMap);
	}

	@Override
	public int selectSearchPopupBasicProductCount(Map<String, Object> commandMap) throws Exception {
		//카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
        String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
        String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
        
        if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgIdx)){
            commandMap.put("searchCategoryYn", "Y");
        }

        return defaultDAO.selectCount("BasicProduct.selectSearchPopupBasicProductCount",commandMap);
	}

	@Override
	public List<Map<String, Object>> selectSearchPopupBasicProductList(Map<String, Object> commandMap) throws Exception {
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_SHORT);
        
        commandMap.put("onlineShopCode", Code.ONLINE_SHOP_CODE);
        
        //카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
        String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
        String searchPrdCtgBrand = StringUtil.getString(commandMap.get("searchPrdCtgBrand"),"");
        String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
        
        if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgBrand) || !("").equals(searchPrdCtgIdx)){
            commandMap.put("searchCategoryYn", "Y");
        }
        
        List<Map<String, Object>> resultList = null;
        //csv 다운로드인 경우
        if("Y".equals(StringUtil.getString(commandMap.get("csvDown"),""))){
            csvUtil.csvDownload("BasicProduct.selectSearchPopupBasicProductList", commandMap);
        }else{
            resultList = defaultDAO.selectList("BasicProduct.selectSearchPopupBasicProductList",commandMap);
        }
        
        return resultList;
	}
	
	public List<Map<String, Object>> selectbasicProductGroup (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("BasicProduct.selectbasicProductGroup", commandMap);
	}
	
	private void updateImage(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		if(!"on".equals(StringUtil.getString(commandMap.get("imageUploadType")))) {
        	// 이미지 등록
            defaultDAO.insert("BasicProduct.deleteProductImage", commandMap);
            String [] arrPRD_IMG = (String[]) commandMap.get("_product_image");
            if ( arrPRD_IMG != null ){
                //이미지 파일 이동
                int imgResult = fileUpload.productImageFolderMove(commandMap, commandMap.get("pathType").toString());
                
                if(imgResult < 0){
                    throw new TransactionException("이미지 등록 중 오류가 발생하였습니다.");
                }
                for( int i = 0; i < arrPRD_IMG.length; i++ ){
                    String [] arrImgInfo = arrPRD_IMG[i].split("\\|");
                    String PRD_IMG_SYS_NM = "";
                    String PRD_IMG_ATT_PATH = "";
                    String PRD_IMG_URL_PATH = "";
                    
                    if(arrImgInfo[4].indexOf(StringUtil.getString(commandMap.get("PRD_FILE_NAME"))) != -1){
                        PRD_IMG_SYS_NM = arrImgInfo[4].replace(StringUtil.getString(commandMap.get("PRD_FILE_NAME")), StringUtil.getString(commandMap.get("PRD_MST_CD")));
                        PRD_IMG_ATT_PATH = arrImgInfo[2].replace("temp", StringUtil.getString(commandMap.get("PRD_MST_CD")));
                        PRD_IMG_URL_PATH = arrImgInfo[3].replace("temp", StringUtil.getString(commandMap.get("PRD_MST_CD")));
                        PRD_IMG_URL_PATH = PRD_IMG_URL_PATH.replace(StringUtil.getString(commandMap.get("PRD_FILE_NAME")), StringUtil.getString(commandMap.get("PRD_MST_CD")));
                    }else{
                        String newPath = fileUpload.getUploadPath(commandMap.get("pathType").toString()) + "/";
                        newPath += Calendar.getInstance().get(Calendar.YEAR);
                        String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH)+1);
                        if(month.length()==1) month = "0"+month;

                        String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
                        if(day.length()==1) day = "0"+day;
                        newPath += "/" + month + "/";
                        newPath += day + "/";
                        newPath += commandMap.get("PRD_MST_CD") + "/";
                        String newDestFileDir = newPath;
                        
                        PRD_IMG_SYS_NM = arrImgInfo[4].replace(StringUtil.getString(commandMap.get("OLD_PRD_MST_CD")), StringUtil.getString(commandMap.get("PRD_MST_CD")));
                        PRD_IMG_ATT_PATH = newDestFileDir.replace(StringUtil.getString(commandMap.get("OLD_PRD_MST_CD")), StringUtil.getString(commandMap.get("PRD_MST_CD")));
                        PRD_IMG_URL_PATH =newDestFileDir.replace(StringUtil.getString(commandMap.get("OLD_PRD_MST_CD")), StringUtil.getString(commandMap.get("PRD_MST_CD")));
                        PRD_IMG_URL_PATH = request.getAttribute("cdnDomain") + PRD_IMG_URL_PATH.replace(StringUtil.getString(commandMap.get("OLD_PRD_MST_CD")), StringUtil.getString(commandMap.get("PRD_MST_CD")));
                    }
                                
                    Map<String, Object> paramMap = new HashMap<String, Object>();
                    paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
                    paramMap.put("PRD_IMG_IDX", arrImgInfo[0]);
                    paramMap.put("PRD_IMG_SORT", arrImgInfo[1]);
                    paramMap.put("PRD_IMG_ATT_PATH", PRD_IMG_ATT_PATH);
                    paramMap.put("PRD_IMG_SYS_NM", PRD_IMG_SYS_NM);
                    paramMap.put("PRD_IMG_ATT_SIZE", arrImgInfo[5]);
                    paramMap.put("PRD_IMG_URL_PATH", PRD_IMG_URL_PATH);
                    paramMap.put("PRD_IMG_ORG_NM", arrImgInfo[6]);
                    if( arrImgInfo.length>7){
                        paramMap.put("PRD_IMG_ALT_TEXT", StringUtil.getString(arrImgInfo[7],""));
                    }
                    else{
                        paramMap.put("PRD_IMG_ALT_TEXT", "");
                    }
                    defaultDAO.insert("BasicProduct.insertProductImage", paramMap);

                }
            }
	
        } else {
        	String[] imageUrlArray = StringUtil.getArray(commandMap, "PRD_MST_DTL_IMG_URL");            
            UrlValidator urlValidator = new UrlValidator();
            for(int i=0;i<imageUrlArray.length;i++) {
            	String imgUrl = imageUrlArray[i];
            	if(imgUrl!=null && !imgUrl.isEmpty() && urlValidator.isValid(imgUrl) ) {
            		productService.downloadImage(imgUrl, StringUtil.getString(commandMap.get("PRD_MST_CD")), i);
                }
            }
        }
	}

	public List<Map<String, Object>> updateBasicProductEditList (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{

        Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("EXP_ETR_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("EXP_ETR_UPD_IP", request.getRemoteAddr());
        List<Map<String, Object>> failPrdEditList = new ArrayList<Map<String,Object>>();

        List<Map<String, Object>> list = (List<Map<String, Object>>)commandMap.get("basicProductEditList");
        for(int i = 0;i < list.size();i++){
            Map<String, Object> dataMap = (Map<String, Object>) list.get(i);
        	try {
				commandMap.put("PRD_MST_CD", StringUtil.getString(dataMap.get("PRD_MST_CD"), ""));
				commandMap.put("PRD_MST_NM",StringUtil.getString(dataMap.get("PRD_MST_NM"), ""));
				commandMap.put("PRD_MST_PRC", StringUtil.getString(dataMap.get("PRD_MST_PRC"), ""));
				commandMap.put("PRD_MST_DLV_FEE", StringUtil.getString(dataMap.get("PRD_MST_DLV_FEE"), ""));
				 
				defaultDAO.update("BasicProduct.updateBasicProductEditList", commandMap);
			} catch (Exception e) {
				dataMap.put("row", (i+1));
				failPrdEditList.add(dataMap);
			}
        }
        
        return failPrdEditList;
	}
	
	
}
