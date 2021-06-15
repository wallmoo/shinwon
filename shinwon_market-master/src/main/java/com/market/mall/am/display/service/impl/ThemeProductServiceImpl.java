package com.market.mall.am.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.ThemeProductService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.display.service.impl
 * @FileName : ThemeProductServiceImpl.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Service Implement Class
 * @author 이미정
 */
@Service("themeProductService")
public class ThemeProductServiceImpl implements ThemeProductService{

    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductCodeList
    * 2. ClassName  : ThemeProductServiceImpl.java
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
    public List<Map<String, Object>> selectThemeProductCodeList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("ThemeProduct.selectSubCodeList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductListCount
    * 2. ClassName  : ThemeProductServiceImpl.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 갯수 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectThemeProductListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("ThemeProduct.selectThemeProductListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductList
    * 2. ClassName  : ThemeProductServiceImpl.java
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
    public List<Map<String, Object>> selectThemeProductList (Map<String, Object> commandMap) throws Exception
    {
    	if( !commandMap.containsKey("PRODUCT_THUMBNAIL_IMAGE_WIDTH") ){
    		commandMap.put("PRODUCT_THUMBNAIL_IMAGE_WIDTH", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
    	}
        return defaultDAO.selectList("ThemeProduct.selectThemeProductList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductInfo
    * 2. ClassName  : ThemeProductServiceImpl.java
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
    public Map<String, Object> selectThemeProductInfo (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.select("ThemeProduct.selectThemeProductInfo", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : insertThemeProduct
    * 2. ClassName  : ThemeProductServiceImpl.java
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
    public int insertThemeProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        int result = 0;
        
        //상품코드/전시순서 등록
        String [] DSP_MST_IDX = (String[]) commandMap.get("arrDSP_MST_IDX");
        String [] DSP_MST_TXT = (String[]) commandMap.get("arrDSP_MST_TXTs");
        if ( DSP_MST_IDX != null ){
        	for(int i=0;i<DSP_MST_IDX.length;i++){
        		commandMap.put("PRD_MST_CD", DSP_MST_IDX[i]);
        		commandMap.put("DSP_MST_TXT", DSP_MST_TXT[i]);
        		result+=defaultDAO.insert("ThemeProduct.insertThemeProduct", commandMap);
        	}
        }
        
        return result;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductCatCodeList
     * 2. ClassName  : ThemeProductServiceImpl.java
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
         return defaultDAO.selectList("ThemeProduct.selectProductCatCodeList",commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : deleteThemeProduct
      * 2. ClassName  : ThemeProductService.java
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
      public int deleteThemeProduct (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.insert("ThemeProduct.deleteThemeProduct", commandMap);
      }
      
      /**
    * <pre>
    * 1. MethodName : updateThemeProductOrder
    * 2. ClassName : ThemeProductServiceImpl.java
    * 3. Comment : 관리자 > 전시관리 > 상품관리 정렬 순서 변경
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateThemeProductOrder(Map<String,Object> commandMap) throws Exception
      {
    	  String[] DSP_MST_IDXs = (String[])commandMap.get("DSP_MST_IDX[]");
    	  String[] DSP_MST_SRTs = (String[])commandMap.get("DSP_MST_SRT[]");
    	  String[] DSP_MST_USE_YNs = (String[])commandMap.get("DSP_MST_USE_YN[]");
    	  //String[] DSP_MST_IDXs = (String[])commandMap.get("DSP_MST_IDX");
    	  
          int result = 0;
    	  for(int i = 0;i < DSP_MST_IDXs.length;i++)
          {
    		  Map<String, Object> param = new HashMap<String, Object>();
    		  param.put("DSP_MST_IDX", DSP_MST_IDXs[i]);
    		  param.put("DSP_MST_SRT", StringUtil.getString(DSP_MST_SRTs[i], ""));
    		  param.put("DSP_MST_USE_YN", StringUtil.getString(DSP_MST_USE_YNs[i], ""));
              
              // 상품 구성 등록
              result = defaultDAO.update("ThemeProduct.updateThemeProductOrder", param);
          }
    	  
    	  return result;
      }
}
