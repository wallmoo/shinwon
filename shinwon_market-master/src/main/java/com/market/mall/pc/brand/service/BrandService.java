package com.market.mall.pc.brand.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.cart.service
 * @FileName : BrandService.java
 * @Date : 2014. 7. 3.
 * @프로그램 설명 : 장바구니 / 주문.결제 관련 업무를 처리하는 Service Interface
 * @author 이상준
 */
public interface BrandService {
	
    /**
   	 * <pre>
   	 * 1. MethodName : selectBannerDisplayList
   	 * 2. ClassName  : BrandService.java
   	 * 3. Comment    : 브랜드 > 배너 목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
	public List<Map<String, Object>> selectBannerDisplayList(Map<String, Object> commandMap) throws Exception;
	
	/**
     * <pre>
     * 1. MethodName : selectBannerDisplayInterval
     * 2. ClassName  : BrandServiceImpl.java
     * 3. Comment    : 브랜드 > 배너  목록  롤링 시간간격
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectBannerDisplayInterval(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectBrandlist
	 * 2. ClassName  : BrandService.java
	 * 3. Comment    : 브랜드 > top seller 목록 
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectTopSellerList(Map<String, Object> commandMap) throws Exception; 
    

    /**
     * <pre>
     * 1. MethodName : selectProductListCount
     * 2. ClassName  : BrandService.java
     * 3. Comment    : 브랜드 > 브랜드 상품 목록 갯수
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductList
   	 * 2. ClassName  : BrandService.java
   	 * 3. Comment    : 브랜드 > 브랜드 상품 목록
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductList(Map<String, Object> commandMap) throws Exception;

    /**
   	 * <pre>
   	 * 1. MethodName : selectProductDisplayList
   	 * 2. ClassName  : BrandService.java
   	 * 3. Comment    : 브랜드 > 상품 목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectSubCategoryList
   	 * 2. ClassName  : BrandService.java
   	 * 3. Comment    : 브랜드 > 카테고리 상품 중간 카테고리 선택용 목록
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
     public List<Map<String, Object>> selectSubCategoryList(Map<String, Object> commandMap) throws Exception;
     
     public Map<String, Object> selectBrandInfo(Map<String, Object> commandMap) throws Exception;
     
     public List<Map<String, Object>> selectBrandBannerList (Map<String, Object> commandMap) throws Exception;
     
     public List<Map<String, Object>> selectBrandAllList (Map<String, Object> commandMap) throws Exception;
     
     public List<Map<String, Object>> selectBrandCategoryList (Map<String, Object> commandMap) throws Exception;
     
     public List<Map<String, Object>> selectBrandProductList (Map<String, Object> commandMap) throws Exception;
     
     public int selectBrandProductCount (Map<String, Object> commandMap) throws Exception;
}
