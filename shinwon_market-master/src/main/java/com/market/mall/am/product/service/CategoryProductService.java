package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : CategoryProductService.java
 * @Date : 2014. 4. 14.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품카테고리관리를 처리하는 Service Class
 * @author ejpark
 */
public interface CategoryProductService {

    /**
     * <pre>
     * 1. MethodName : selectCategoryProductList
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 > 리스트 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCategoryProductList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectSubCategoryProductList
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 > 하위 상품 카테고리 리스트
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectSubCategoryProductList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCategoryProductView
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 상세보기 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCategoryProductView(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertCategoryProduct
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 등록  
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCategoryProduct(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateCategoryProduct
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 수정 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 14.
     * </pre>
     * @param request 
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCategoryProduct(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : deleteCategoryProduct
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품카테고리 삭제 
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteCategoryProduct(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertcategorySpec
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙 등록  
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertcategorySpec(Map<String, Object> commandMap) throws Exception;
    
    
    /**
    * <pre>
    * 1. MethodName : selectSpecCategoryList
    * 2. ClassName : CategoryProductService.java
    * 3. Comment : 관리자 > 상품관리 > 카테고리 스펙 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectSpecCategoryList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : deleteCategorySpec
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙삭제 
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteCategorySpec(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCategorySpecCount
     * 2. ClassName  : CategoryProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 카테고리 스펙 등록여부 
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCategorySpecCount(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectUpperCategoryProductList (Map<String, Object> commandMap) throws Exception;
}
