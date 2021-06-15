package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : VendorApprovalService.java
 * @Date : 2015. 12. 2.
 * @프로그램 설명 : 입점업체 승인요청을 처리하는 Service Class
 * @author DEV_KIMMINHO    
 */
public interface VendorApprovalService {
	
	/**
     * <pre>
     * 1. MethodName : selectBasicProductCount
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 입점업체승인요청 > 상품 목록 갯수
     * 4. 작성자       : DEV_KIMMINHO
     * 5. 작성일       : 2015. 12. 03.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBasicProductCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectBasicProductList
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 입점업체승인요청 > 상품 목록 
     * 4. 작성자       : DEV_KIMMINHO
     * 5. 작성일       : 2015. 12. 03.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectBasicProductList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectProductSumList
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 입점업체승인요청 > 상품 요약
     * 4. 작성자       : DEV_KIMMINHO
     * 5. 작성일       : 2015. 12. 03.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductSumList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectBasicMdList
     * 2. ClassName : BasicProductService.java
     * 3. Comment : MD리스트
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 11. 19.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectBasicMdList(Map<String, Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName : selectBrandList
      * 2. ClassName : BasicProductService.java
      * 3. Comment : 브랜드 리스트
      * 4. 작성자 : DEV_KIMMINHO
      * 5. 작성일 : 2015. 11. 24.
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public List<Map<String, Object>> selectBrandList(Map<String, Object> commandMap) throws Exception;
      
      /**
       * <pre>
       * 1. MethodName : selectBasicProductView
       * 2. ClassName  : BasicProductService.java
       * 3. Comment    : 관리자 > 상품관리 > 상품 상세 정보 
       * 4. 작성자       : DEV_KIMMINHO
       * 5. 작성일       : 2015. 12. 03.
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
      public Map<String, Object> selectBasicProductView(Map<String, Object> commandMap) throws Exception;
      
      /**
       * <pre>
       * 1. MethodName : updateBasicProductList
       * 2. ClassName : BasicProductService.java
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
       public int updateBasicProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
       
       /**
    * <pre>
    * 1. MethodName : selectVendorProductChangeView
    * 2. ClassName : VendorApprovalService.java
    * 3. Comment : 입점업체 수정요청 내용 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectVendorProductChangeView(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : deleteVendorProductList
    * 2. ClassName : VendorApprovalService.java
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
    public int deleteVendorProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateVendorProductChange
    * 2. ClassName : VendorApprovalService.java
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
    public int updateVendorProductChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateVendorProductMulitChange
    * 2. ClassName : VendorApprovalService.java
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
    public int updateVendorProductMulitChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertBasicProductHold
    * 2. ClassName : VendorApprovalService.java
    * 3. Comment : 입점업체 상품 다건 보류 
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertBasicProductHold(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
