package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : ThemeProductService.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시상품관리를 처리하는 Service Interface
 * @author 이미정
 */
public interface ThemeProductService {

    /**
    * <pre>
    * 1. MethodName : selectThemeProductCodeList
    * 2. ClassName  : ThemeProductService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 배너 코드 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectThemeProductCodeList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductListCount
    * 2. ClassName  : ThemeProductService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 갯수 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectThemeProductListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductList
    * 2. ClassName  : ThemeProductService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 목록 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectThemeProductList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectThemeProductInfo
    * 2. ClassName  : ThemeProductService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시상품관리 상세정보 
    * 4. 작성자       : 이미정
    * 5. 작성일       : 2014. 7. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectThemeProductInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertThemeProduct
    * 2. ClassName  : ThemeProductService.java
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
    public int insertThemeProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectProductCatCodeList
     * 2. ClassName  : ThemeProductService.java
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
     public int deleteThemeProduct (Map<String, Object> commandMap) throws Exception;
     
     /**
    * <pre>
    * 1. MethodName : updateThemeProductOrder
    * 2. ClassName : ThemeProductService.java
    * 3. Comment : 관리자 > 전시관리 > 상품관리 정렬 순서 변경
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 21.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateThemeProductOrder(Map<String,Object> commandMap) throws Exception;
     
     
}
