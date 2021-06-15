package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : ProductDisplayService.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Service Interface
 * @author 이미정
 */
public interface ProductDisplayService {

    /**
    * <pre>
    * 1. MethodName : selectProductDisplayCodeList
    * 2. ClassName  : ProductDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 배너 코드 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductDisplayCodeList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayListCount
    * 2. ClassName  : ProductDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 갯수 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductDisplayListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayList
    * 2. ClassName  : ProductDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductDisplayList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayInfo
    * 2. ClassName  : ProductDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상세정보 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductDisplayInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertProductDisplay
    * 2. ClassName  : ProductDisplayService.java
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
    public int insertProductDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectProductCatCodeList
     * 2. ClassName  : ProductDisplayService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상단 제목 표시
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 4.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectProductCatCodeList (Map<String, Object> commandMap) throws Exception;
     
     

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
     public int deleteProductDisplay (Map<String, Object> commandMap) throws Exception;
     
     /**
    * <pre>
    * 1. MethodName : updateProductDisplayOrder
    * 2. ClassName : ProductDisplayService.java
    * 3. Comment : 관리자 > 전시관리 > 상품관리 정렬 순서 변경
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 21.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateProductDisplayOrder(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectDisplayCatTabList(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectDisplayCatTabProductList(Map<String, Object> commandMap) throws Exception;
    
    public int insertDisplayTab (Map<String,Object> commandMap) throws Exception;

    public int insertDisplayTabProduct (Map<String,Object> commandMap) throws Exception;
    
    public Map<String, Object> selectProductTabDisplayInfo(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectDisplayTapProductList (Map<String, Object> commandMap) throws Exception;
    
    public int deleteProductDisplayTab (Map<String, Object> commandMap) throws Exception;
    
    public int updateProductDisplayTab (Map<String, Object> commandMap) throws Exception;
    
    public int deleteTabProductDisplay (Map<String, Object> commandMap) throws Exception;
}
