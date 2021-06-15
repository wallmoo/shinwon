package com.market.mall.am.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * @PackageName: com.market.mall.am.product.service
 * @FileName : BasicProductService.java
 * @Date : 2014. 4. 11.
 * @프로그램 설명 : 관리자 > 상품관리 > 상품관리를 처리하는 Service Class
 * @author ejpark
 */
public interface BasicProductService {

    /**
     * <pre>
     * 1. MethodName : selectBasicProductCount
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 목록 갯수
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBasicProductCount(Map<String, Object> commandMap) throws Exception;
    
    public int selectSearchPopupBasicProductCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBasicProductVdrCount
    * 2. ClassName : BasicProductService.java
    * 3. Comment : 상품 수정 요청 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBasicProductVdrCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectBasicProductList
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 목록 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectBasicProductList(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSearchPopupBasicProductList(Map<String, Object> commandMap) throws Exception;

    public Map<String, Object> selectBasicProductViewInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectBasicProductView
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 상세 정보 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectBasicProductView(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateBasicProduct
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 수정 (직영몰관리자) 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBasicProduct(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateBasicProductStatusList
    * 2. ClassName : BasicProductServiceImpl.java
    * 3. Comment : 상품리스트에서 진열,임직원,네이버,다음  다중 수정
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicProductStatusList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int updateBasicProductVdrStatusList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
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
    public int updateBasicProductCategory(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
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
    * 1. MethodName : updateBasicProductVdrList
    * 2. ClassName : BasicProductService.java
    * 3. Comment : 입점업체 상품 변경 요청
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 27.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicProductVdrList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectProductSumList
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 요약
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductSumList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertBasicProduct
     * 2. ClassName  : BasicProductService.java
     * 3. Comment    : 관리자 > 상품관리 > 상품 등록 (직영몰관리자)
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 4. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertBasicProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertProductVdr
    * 2. ClassName : BasicProductService.java
    * 3. Comment : 입점업체 상품 수정 요청
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertProductVdr(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateProductInfoByExcel
    * 2. ClassName  : BasicProductService.java
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
    public Map<String, Object> updateProductInfoByExcel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
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
    * 1. MethodName : deleteBasicProductList
    * 2. ClassName : BasicProductService.java
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
    public int deleteBasicProductList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateBasicProductApv
    * 2. ClassName : BasicProductService.java
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
    public int updateBasicProductApv(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateBasicProductHold
     * 2. ClassName : BasicProductService.java
     * 3. Comment : 입점업체 승인요청 상품 보류처리
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateBasicProductHold(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
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
    * 1. MethodName : selectVendorList
    * 2. ClassName : BasicProductService.java
    * 3. Comment : 입점업체 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectVendorList(Map<String, Object> commandMap) throws Exception;
    
    
    /**
    * <pre>
    * 1. MethodName : selectSubChannelList
    * 2. ClassName : BasicProductService.java
    * 3. Comment : 제휴체널 하위뎁스 리스트 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectSubChannelList(Map<String, Object> commandMap) throws Exception;
    
    public int insertProductMustOption(Map<String,Object> commandMap) throws Exception;
    
    public int updateTagBatch (Map<String, Object> commandMap) throws Exception;
    
    public boolean erpDuplicateCheck(Map<String, Object> commandMap);
    
    public int selectHoldOffDetailListCount (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectHoldOffDetailList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectbasicProductGroup (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> updateBasicProductEditList (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
}
