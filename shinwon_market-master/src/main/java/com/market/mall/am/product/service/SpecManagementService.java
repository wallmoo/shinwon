package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : SpecManagementService.java
 * @Date : 2015. 10. 14.
 * @프로그램 설명 : 스펙관리를 처리하는 Service Class
 * @author DEV_KIMMINHO    
 */
public interface SpecManagementService {
	
	/**
	* <pre>
	* 1. MethodName : selectSpecManagementView
	* 2. ClassName : SpecManagementService.java
	* 3. Comment : 상품관리 > 스펙관리 > 스펙상세보기
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectSpecManagementView(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectSubSpecManagementList
	* 2. ClassName : SpecManagementService.java
	* 3. Comment : 상품관리 > 스펙관리 > 스펙 카테고리
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectSubSpecManagementList(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectSpecManagementList
	* 2. ClassName : SpecManagementService.java
	* 3. Comment : 상품관리 > 스펙관리 > 스펙 리스트 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectSpecManagementList(Map<String, Object> commandMap) throws Exception;
	
	
	/**
     * <pre>
     * 1. MethodName : insertSpecManagement
     * 2. ClassName  : SpecManagementService.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 등록  
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 10. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertSpecManagement(Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : deleteCategoryProduct
     * 2. ClassName  : SpecManagementService.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 삭제 
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteSpecManagement(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateSpecManagement
     * 2. ClassName  : SpecManagementService.java
     * 3. Comment    : 관리자 > 상품관리 > 스펙카테고리 수정 
     * 4. 작성자       : kmh
     * 5. 작성일       : 2015. 10. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateSpecManagement(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectSpecCategoryList
     * 2. ClassName : SpecManagementService.java
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
    * 1. MethodName : selectSubCategoryProductList
    * 2. ClassName : SpecManagementService.java
    * 3. Comment : 관리자 > 상품관리 > 상품카테고리 > 하위 스펙 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 10. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> subSpecManagementProductAjax(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSpecProductCount
    * 2. ClassName : SpecManagementService.java
    * 3. Comment : 상품에서 스펙 사용유무 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 11. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectSpecProductCount(Map<String, Object> commandMap) throws Exception;

}
