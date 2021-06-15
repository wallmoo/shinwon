package com.market.mall.am.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.CsvUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.product.service.VendorApprovalService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

import egovframework.rte.fdl.property.EgovPropertyService;
import oracle.sql.CLOB;

/**
 * @PackageName: com.market.mall.am.product.service.impl
 * @FileName : VendorApprovalServiceImpl.java
 * @Date : 2015. 12. 2.
 * @프로그램 설명 : 입점업체 승인요청을 처리하는 Service Implement Class
 * @author DEV_KIMMINHO    
 */
@Service("vendorApprovalService")
public class VendorApprovalServiceImpl implements VendorApprovalService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
    private FileUpload fileUpload;
    
    @Autowired 
    private CsvUtil csvUtil;
    
    @Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
	@Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	/**
     * <pre>
     * 1. MethodName : selectBasicProductCount
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 목록 갯수
     * 4. 작성자       : DEV_KIMMINHO
     * 5. 작성일       : 2015. 12. 03.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBasicProductCount(Map<String, Object> commandMap) throws Exception
    {
    	//카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
    	String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
    	String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
    	
    	if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgIdx)){
    		commandMap.put("searchCategoryYn", "Y");
    	}
    	
        return defaultDAO.selectCount("VendorApproval.selectBasicProductCount",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectBasicProductList
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 목록
     * 4. 작성자       : DEV_KIMMINHO
     * 5. 작성일       : 2015. 12. 03.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBasicProductList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH); //관리자 상품 썸네일 사이즈
    	
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
    		csvUtil.csvDownload("VendorApproval.selectBasicProductList", commandMap);
    	}else{
    		resultList = defaultDAO.selectList("VendorApproval.selectBasicProductList",commandMap);
    	}
    	
        return resultList;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductSumList
     * 2. ClassName  : BasicProductServiceImpl.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 브랜드 목록
     * 4. 작성자       : DEV_KIMMINHO
     * 5. 작성일       : 2015. 12. 03.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductSumList(Map<String, Object> commandMap) throws Exception 
    {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	Map<String, String> searchCondition = new HashMap<String, String>();
    	searchCondition.put("searchPrdMstDelFlag", "N");
    	
    	// 전체상품
    	resultMap.put("all", defaultDAO.selectCount("VendorApproval.selectBasicProductCount", searchCondition) );
        
    	// 판매중
    	searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_ING);
    	resultMap.put(Code.PRODUCT_SELL_STATE_ING, Integer.valueOf(defaultDAO.selectCount("VendorApproval.selectBasicProductCount", searchCondition) ));
   	
    	// 미판매
    	searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_STOP);
    	resultMap.put(Code.PRODUCT_SELL_STATE_STOP, Integer.valueOf(defaultDAO.selectCount("VendorApproval.selectBasicProductCount", searchCondition) ));
    	
    	// 일시품절
    	searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_OP_TEMPOUT);
    	resultMap.put(Code.PRODUCT_SELL_STATE_OP_TEMPOUT, Integer.valueOf(defaultDAO.selectCount("VendorApproval.selectBasicProductCount", searchCondition) ));
    	
    	// 품절
    	searchCondition.put("searchPrdMstSellState", Code.PRODUCT_SELL_STATE_TEMPOUT);
    	resultMap.put(Code.PRODUCT_SELL_STATE_TEMPOUT, Integer.valueOf(defaultDAO.selectCount("VendorApproval.selectBasicProductCount", searchCondition) ));    	
    	    	
    	return resultMap;
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
     	return defaultDAO.selectList("VendorApproval.selectBasicMdList",commandMap);
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
      	return defaultDAO.selectList("VendorApproval.selectBasicProductBrandList",commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : selectBasicProductView
      * 2. ClassName  : BasicProductServiceImpl.java
      * 3. Comment    : 관리자 > 상품관리 > 상품 상세 정보
      * 4. 작성자       : DEV_KIMMINHO
      * 5. 작성일       : 2015. 12. 03.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
     @SuppressWarnings("unchecked")
     public Map<String, Object> selectBasicProductView(Map<String, Object> commandMap) throws Exception 
     {
    	 Map<String, Object> resultMap = new HashMap<String, Object>();
     	
     	// 썸네일 사이즈 지정 
     	commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
     	
     	commandMap.put("onlineShopCode", Code.ONLINE_SHOP_CODE);
     	
     	// 상품 상세 정보
     	Map<String, Object> productInfo = defaultDAO.select("BasicProduct.selectBasicProductInfo",commandMap);
     	String prdType = StringUtil.getString(productInfo.get("PRD_MST_TYPE"),"");
     	
        //묵음상품,세트상품일 경우
        List<Map<String, Object>> productGroupList = new ArrayList<Map<String, Object>>();
        if(prdType.equals("S") || prdType.equals("B")){
            productGroupList = defaultDAO.selectList("BasicProduct.selectbasicProductGroup", commandMap);
        }
 		
        //상품 필수 옵션 리스트
        List<Map<String, Object>> mustOptionList = defaultDAO.selectList("BasicProduct.selectProductMustOptionList", commandMap);
        
        //상품 추가 옵션 리스트
        List<Map<String, Object>> addOptionList = defaultDAO.selectList("BasicProduct.selectProductAddOptionList", commandMap);
        
        
     	// 상품 카테고리 정보 리스트
 		Map<String, Object> paramMap = new HashMap<String, Object>();
 		paramMap.put("PRD_CTG_ENV", Code.CATEGORY_TYPE_PC);
 		paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));    	
     	List<Map<String, Object>> categoryListP = defaultDAO.selectList("BasicProduct.selectBasicProductCategoryList",paramMap);
     	
 		paramMap.put("PRD_CTG_ENV", Code.CATEGORY_TYPE_MOBILE);
 		paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));    	
     	List<Map<String, Object>> categoryListM = defaultDAO.selectList("BasicProduct.selectBasicProductCategoryList",paramMap);
     	
     	//상품 스펙 정보 리스트
     	paramMap.put("SPC_MST_ENV", Code.SPEC_TYPE_PC);
 		paramMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));    	
     	List<Map<String, Object>> specListP = defaultDAO.selectList("BasicProduct.selectBasicProductSpecList",paramMap);
     	
     	// 대표이미지
     	List<Map<String, Object>> imageList = defaultDAO.selectList("BasicProduct.selectProductImageList",commandMap);    	
     	
     	// 상품고시정보
     	commandMap.put("PRD_NFI_LEVEL", "0");
     	commandMap.put("PRD_NFI_USE_YN", "Y");
     	List<Map<String, Object>> productNfiList = defaultDAO.selectList("ProductNotificationInfo.selectProductNotificationInfoList",commandMap);
     	
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
        resultMap.put("productGroupList", productGroupList);
        resultMap.put("categoryListP", categoryListP);
        resultMap.put("categoryListM", categoryListM);
        resultMap.put("mustOptionList", mustOptionList);
        resultMap.put("addOptionList", addOptionList);
        resultMap.put("specListP", specListP);
        resultMap.put("imageList", imageList);
        resultMap.put("productNfiList", productNfiList);

        return resultMap;
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
      public int updateBasicProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
      {
          int result = 0;

          //상품 옵션 수정
          String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");				//상품코드
          
          if ( arrPRD_MST_CDs != null )
          {
          	String PRD_MST_CD = "";
          	for( int i = 0; i < arrPRD_MST_CDs.length; i++ )
              {
          		Map<String, Object> paramMap = new HashMap<String, Object>();
          		PRD_MST_CD = arrPRD_MST_CDs[i];
          		
          		paramMap.put("PRD_MST_CD", PRD_MST_CD);
          		paramMap.put("PRD_MST_NM", commandMap.get("PRD_MST_NM_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_PRC", commandMap.get("PRD_MST_PRC_"+PRD_MST_CD));
          		//paramMap.put("PRD_MST_SCH_PRC", commandMap.get("PRD_MST_SCH_PRC_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_DLV_FEE", commandMap.get("PRD_MST_DLV_FEE_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_DPL_STATE", commandMap.get("PRD_MST_DPL_STATE_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_SEL_STATE", commandMap.get("PRD_MST_SEL_STATE_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_APV_STATE", commandMap.get("PRD_MST_APV_STATE_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_SEL_CNT", commandMap.get("PRD_MST_SEL_CNT_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_PC_CPN_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_PC_CPN_PRC", commandMap.get("PRD_MST_SALE_RATE_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_MB_CPN_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_MB_CPN_PRC", commandMap.get("PRD_MST_SALE_RATE_"+PRD_MST_CD));
          		
          		paramMap.put("PRD_MST_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_SALE_RATE", commandMap.get("PRD_MST_SALE_RATE_"+PRD_MST_CD));
          		
          		//paramMap.put("PRD_MST_CPN_OWN", commandMap.get("PRD_MST_CPN_OWN_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
          		paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
          		paramMap.put("PRD_MST_NAVER_USE_YN", commandMap.get("NAVER_USE_"+PRD_MST_CD));
          		paramMap.put("PRD_MST_DAUM_USE_YN", commandMap.get("DAUM_USE_"+PRD_MST_CD));
          		//상품 마스터 수정
                  result = defaultDAO.update("BasicProduct.updateProductListMaster", paramMap);
              }
          }
          
          return result;
      }
      
      /**
    * <pre>
    * 1. MethodName : selectVendorProductChangeView
    * 2. ClassName : VendorApprovalServiceImpl.java
    * 3. Comment : 입점업체 수정요청 내용 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectVendorProductChangeView(Map<String, Object> commandMap) throws Exception 
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        //입점업체 수정요청 내용
    	returnMap.put("productChangeInfo", defaultDAO.select("VendorApproval.selectVendorProductChangeView",commandMap));
    	
    	//보류사유
    	List<Map<String, Object>> productHoldOffDetailList = defaultDAO.selectList("VendorApproval.selectHoldOffDetailList", commandMap);

    	returnMap.put("productHoldOffDetail", productHoldOffDetailList);
    	
    	return returnMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : deleteVendorProductList
    * 2. ClassName : VendorApprovalServiceImpl.java
    * 3. Comment : 입점업체 상품수정요청 승인거절
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteVendorProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
    	int result = 0;
    	
    	result = defaultDAO.update("VendorApproval.deleteVendorProductList", commandMap);
    	
    	if(result > 0){
    	    //보류 사유 등록
    	    result = defaultDAO.insert("VendorApproval.insertBasicProductHold", commandMap);
    	}

    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateVendorProductChange
    * 2. ClassName : VendorApprovalServiceImpl.java
    * 3. Comment : 입점업체 상품수정요청 승인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateVendorProductChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
    	int result = 0;
    	result = defaultDAO.update("VendorApproval.updateVendorProductChange", commandMap);	//수정요청 테이블
    	
    	if(result > 0){
    		result = defaultDAO.update("VendorApproval.updateProductChangeToVendor", commandMap); //상품마스터 업데이트
    	}
    	
    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateVendorProductMulitChange
    * 2. ClassName : VendorApprovalServiceImpl.java
    * 3. Comment : 입점업체 상품변경요청 멀티
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 4. 5.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateVendorProductMulitChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception 
    {
    	int result = 0;
    	
    	//상품 옵션 수정
        String [] arrPRD_MST_CDs = (String[]) commandMap.get("arrPRD_MST_CD");				//상품코드
        
        if ( arrPRD_MST_CDs != null )
        {
        	String PRD_MST_CD = "";
        	for( int i = 0; i < arrPRD_MST_CDs.length; i++ )
            {
        		Map<String, Object> paramMap = new HashMap<String, Object>();
        		PRD_MST_CD = arrPRD_MST_CDs[i];
        		
        		paramMap.put("PRD_MST_CD", PRD_MST_CD);
        		paramMap.put("VDR_APV_IDX", commandMap.get("VDR_APV_IDX_"+PRD_MST_CD));
        		paramMap.put("VAV_PRD_MST_DPL_STATE", commandMap.get("PRD_MST_DPL_STATE_"+PRD_MST_CD));//진열상태
        		paramMap.put("VAV_PRD_MST_SEL_STATE", commandMap.get("PRD_MST_SEL_STATE_"+PRD_MST_CD));//판매상태
        		paramMap.put("VAV_PRD_MST_DLV_FEE", commandMap.get("PRD_MST_DLV_FEE_"+PRD_MST_CD));//배송비
        		
        		paramMap.put("VAV_PRD_MST_APV_STATE", commandMap.get("PRD_MST_APV_STATE_"+PRD_MST_CD)); //승인
        		paramMap.put("VAV_PRD_MST_SEL_CNT", commandMap.get("PRD_MST_SEL_CNT_"+PRD_MST_CD)); //판매가능수량
        		
        		paramMap.put("VAV_PRD_MST_NAVER_USE_YN", commandMap.get("NAVER_USE_"+PRD_MST_CD));//네이버쇼핑
        		paramMap.put("VAV_PRD_MST_DAUM_USE_YN", commandMap.get("DAUM_USE_"+PRD_MST_CD));//다음쇼핑하우
        		paramMap.put("VAV_PRD_MST_UNT", commandMap.get("PRD_MST_UNT_"+PRD_MST_CD));//할인단위
        		paramMap.put("VAV_PRD_MST_SALE_RATE", commandMap.get("PRD_MST_SALE_RATE_"+PRD_MST_CD));//할인율
        		
        		paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
        		paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
        		paramMap.put("VDR_APV_UPD_ID", commandMap.get("VDR_APV_UPD_ID"));
        		paramMap.put("VDR_APV_UPD_IP", commandMap.get("VDR_APV_UPD_IP"));
        		
        		//상품 마스터 수정
        		result = defaultDAO.update("VendorApproval.updateVendorProductChange", paramMap);	//수정요청 테이블
        		
        		if(result > 0){
            		result = defaultDAO.update("VendorApproval.updateProductChangeToVendor", paramMap); //상품마스터 업데이트
            	}
            }
        }
    	
    	return result;
    }
    

    public int insertBasicProductHold(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;

        String productCodeList = StringUtil.getString(commandMap.get("productCodeList"),"");
        
        if(!productCodeList.equals("")){
            ObjectMapper mapper = new ObjectMapper();
            TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
            
            List<Map<String,Object>> vendorHoldOffList = mapper.readValue(productCodeList,typeRef);
            
            for(int index=0; index < vendorHoldOffList.size(); index++){
                Map<String, Object> paramMap = new HashMap<String, Object>();
                
                paramMap.put("PRD_MST_CD", StringUtil.getString(vendorHoldOffList.get(index).get("PRD_MST_CD")));
                
                paramMap.put("VDR_HLD_DESC", commandMap.get("VDR_HLD_DESC"));
                paramMap.put("VDR_HLD_APV_STATE", commandMap.get("VDR_HLD_APV_STATE"));
                paramMap.put("VDR_HLD_PRC_YN", commandMap.get("VDR_HLD_PRC_YN"));
                paramMap.put("VDR_HLD_NM_YN", commandMap.get("VDR_HLD_NM_YN"));
                paramMap.put("VDR_HLD_CTG_YN", commandMap.get("VDR_HLD_CTG_YN"));
                paramMap.put("VDR_HLD_CNT_YN", commandMap.get("VDR_HLD_CNT_YN"));
                paramMap.put("VDR_HLD_NFI_YN", commandMap.get("VDR_HLD_NFI_YN"));
                paramMap.put("VDR_HLD_ETC_YN", commandMap.get("VDR_HLD_ETC_YN"));
                paramMap.put("VDR_HLD_REG_IP", commandMap.get("VDR_HLD_REG_IP"));
                paramMap.put("VDR_HLD_REG_ID", commandMap.get("VDR_HLD_REG_ID"));
                
                result = defaultDAO.insert("VendorApproval.insertBasicProductHold", paramMap);
                
                if(result > 0 ){
                    paramMap.put("PRD_MST_UPD_IP", commandMap.get("PRD_MST_UPD_IP"));
                    paramMap.put("PRD_MST_UPD_ID", commandMap.get("PRD_MST_UPD_ID"));
                    //상품 보류 처리
                    defaultDAO.update("BasicProduct.updateBasicProductApvRejection", paramMap);
                }
            }
            

        }

        return result;
    }
}
