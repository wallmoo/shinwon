package com.market.mall.am.display.service.impl;

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

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.ProductDisplayService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : ProductDisplayServiceImpl.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("productDisplayService")
public class ProductDisplayServiceImpl implements ProductDisplayService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayCodeList
    * 2. ClassName  : ProductDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상품 코드 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductDisplayCodeList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("ProductDisplay.selectSubCodeList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayListCount
    * 2. ClassName  : ProductDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 갯수 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductDisplayListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("ProductDisplay.selectProductDisplayListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayList
    * 2. ClassName  : ProductDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductDisplayList (Map<String, Object> commandMap) throws Exception
    {
    	if( !commandMap.containsKey("PRODUCT_THUMBNAIL_IMAGE_WIDTH") ){
    		commandMap.put("PRODUCT_THUMBNAIL_IMAGE_WIDTH", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
    	}
        return defaultDAO.selectList("ProductDisplay.selectProductDisplayList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayInfo
    * 2. ClassName  : ProductDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상세정보 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductDisplayInfo (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("ProductDisplay.selectProductDisplayInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertProductDisplay
    * 2. ClassName  : ProductDisplayServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 등록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertProductDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        //상품코드/전시순서 등록
        String [] DSP_MST_IDX = (String[]) commandMap.get("arrDSP_MST_IDX");
        String [] DSP_MST_TXT = (String[]) commandMap.get("arrDSP_MST_TXTs");
        if ( DSP_MST_IDX != null ){
        	for(int i=0;i<DSP_MST_IDX.length;i++){
        		commandMap.put("PRD_MST_CD", DSP_MST_IDX[i]);
        		commandMap.put("DSP_MST_TXT", DSP_MST_TXT[i]);
        		result+=defaultDAO.insert("ProductDisplay.insertProductDisplay", commandMap);
        		if(result > 0){
        			defaultDAO.insert("ProductDisplay.updateProductDisplaySort", commandMap);
        		}
        	}
        }
        
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductCatCodeList
     * 2. ClassName  : ProductDisplayServiceImpl.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상단 제목 표시
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectProductCatCodeList (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectList("ProductDisplay.selectProductCatCodeList",commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : deleteProductDisplay
      * 2. ClassName  : ProductDisplayService.java
      * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상품삭제
      * 4. 작성자       : 이미정
      * 5. 작성일       : 2014. 7. 74.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @return
      * @throws Exception
      */
      public int deleteProductDisplay (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.insert("ProductDisplay.deleteProductDisplay", commandMap);
      }
      
      
      public int deleteTabProductDisplay (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.insert("ProductDisplay.deleteTabProductDisplay", commandMap);
      }
      
      
      /**
    * <pre>
    * 1. MethodName : updateProductDisplayOrder
    * 2. ClassName : ProductDisplayServiceImpl.java
    * 3. Comment : 관리자 > 전시관리 > 상품관리 정렬 순서 변경
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return9642
    * @throws Exception
    */
    public int updateProductDisplayOrder(HttpServletRequest request,Map<String,Object> commandMap) throws Exception
      {
    	  int result = 0;
        
	  	  String[] DSP_CTG_IDX = (String[])commandMap.get("DSP_CTG_IDX[]");
	  	  String[] DSP_CTG_USE = (String[])commandMap.get("DSP_CTG_USE[]");
	  	
	  	  
        if(DSP_CTG_IDX!=null && DSP_CTG_USE!=null){
	          for(int i = 0 ; i < DSP_CTG_IDX.length ; i++)
	          {
	        	  commandMap.put("DSP_CTG_IDX", DSP_CTG_IDX[i]);
	        	  
	              commandMap.put("DSP_CTG_SRT", i+1);
	              
	              commandMap.put("DSP_CTG_USE_YN", DSP_CTG_USE[i]);
	              
	              result = defaultDAO.update("ProductDisplay.updateProductDisplayOrder", commandMap);
	          }
        }
	                   
	        return result; 
      }
    
    public List<Map<String, Object>> selectDisplayCatTabList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("ProductDisplay.selectDisplayCatTabList", commandMap);
    }
    
    //전시 배너 > 탭 상품 리스트
    public List<Map<String, Object>> selectDisplayCatTabProductList(Map<String, Object> commandMap) throws Exception{
        return defaultDAO.selectList("ProductDisplay.selectDisplayCatTabProductList", commandMap);
    }
    
    public int insertDisplayTab(Map<String,Object> commandMap) throws Exception{
        int result = 0;
        
        Map<String, Object> resultMap = defaultDAO.select("ProductDisplay.createDisplayTabIdx", commandMap);
        int displayIdx = Integer.parseInt(StringUtil.getString(resultMap.get("DSP_TAB_IDX")));
        
        commandMap.put("DSP_TAB_IDX", displayIdx);

        commandMap.put("PRD_CTG_IDX", StringUtil.getString(commandMap.get("PRD_CTG_IDX"))); //상품 카테고리 IDX
        
        result = defaultDAO.insert("ProductDisplay.insertDisplayTab", commandMap);
        
        if( result > 0) return displayIdx;
        
        return displayIdx;
    }
    
    public int insertDisplayTabProduct(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        Map<String, Object> resultMap = defaultDAO.select("ProductDisplay.createDisplayMstIdx", commandMap);
        int displayMstIdx = Integer.parseInt(StringUtil.getString(resultMap.get("DSP_MST_IDX")));
        
        commandMap.put("DSP_MST_IDX", displayMstIdx);
        commandMap.put("CMN_COM_IDX", commandMap.get("DSP_TAB_IDX"));
        
        result = defaultDAO.insert("ProductDisplay.insertDisplayTabProduct", commandMap);

        return result;        
    }
    
    //탭별 전시상품 상세 조회
    public Map<String, Object> selectProductTabDisplayInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ProductDisplay.selectProductTabDisplayInfo",commandMap);
    }

    public List<Map<String, Object>> selectDisplayTapProductList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("ProductDisplay.selectDisplayTapProductList", commandMap);
    }
    
    public int deleteProductDisplayTab (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.delete("ProductDisplay.deleteProductDisplayTab", commandMap);
    }
    
    public int updateProductDisplayTab (Map<String, Object> commandMap) throws Exception {
        int result = 0;
        TypeReference<List<Map<String, Object>>> typeRef = new TypeReference<List<Map<String, Object>>>(){};
		ObjectMapper mapper = new ObjectMapper();
        List<Map<String, Object>> productList = mapper.readValue(commandMap.get("productList").toString(), typeRef);
        
        for(int index=0; index < productList.size(); index++){
           result = defaultDAO.update("ProductDisplay.updateProductDisplayTab", productList.get(index));
        }
        return result;
    }
}
