package com.market.mall.pc.product.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.product.service
 * @FileName : ProductListService.java
 * @Date : 2014. 7. 3.
 * @프로그램 설명 : 매장전시 리스트 조회 업무를 처리하는 Service Interface
 * @author 이상준
 */
public interface ProductListService {
	
    /**
   	 * <pre>
   	 * 1. MethodName : selectBannerDisplayList
   	 * 2. ClassName  : ProductListService.java
   	 * 3. Comment    : 상품카테고리 > 배너 목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
	public List<Map<String, Object>> selectBannerDisplayList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectBannerDisplayListShinwon(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectBannerDisplayCatCodeList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectCategoryTabList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectCatTabProductList(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBannerDisplayListTypeB
	* 2. ClassName : ProductListService.java
	* 3. Comment : 상품카테고리 > 배너 목록 타입B 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 3. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectBannerDisplayListTypeB(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectBannerDisplayInterval
     * 2. ClassName  : ProductListService.java
     * 3. Comment    : 브랜드 > 배너  목록  롤링 시간간격
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectBannerDisplayInterval(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectProductListCount
     * 2. ClassName  : ProductListService.java
     * 3. Comment    : 상품카테고리 > 상품카테고리 상품 목록 갯수
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
   	 * 2. ClassName  : ProductListService.java
   	 * 3. Comment    : 상품카테고리 > 상품카테고리 상품 목록
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
	 * 1. MethodName : selectSubCategoryList
	 * 2. ClassName  : ProductListService.java
	 * 3. Comment    : 카테고리 > 카테고리 상품 중간 카테고리 선택용 목록
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectSubCategoryList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMenuCategoryList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 카테고리 > 카테고리 1뎁스 목록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectMenuCategoryList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectBannerDisplayInfoList
   	 * 2. ClassName  : ProductListServiceImpl.java
   	 * 3. Comment    : 배너  정보 + 목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 25.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public Map<String, Object> selectBannerDisplayInfoList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductDisplayList
   	 * 2. ClassName  : ProductListService.java
   	 * 3. Comment    : 전시영역 상품 리스트 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductDisplayList
   	 * 2. ClassName  : ProductListService.java
   	 * 3. Comment    : 전시영역 상품 리스트 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<List<Map<String, Object>>> selectBestProductDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMdPickBannerDisplayList
    * 2. ClassName : ProductListService.java
    * 3. Comment : MD 추천 배너 아이콘 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<List<Map<String, Object>>> selectMdPickBannerDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayMdPickList
    * 2. ClassName : ProductListService.java
    * 3. Comment : MD PICK 전시 상품 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductDisplayMdPickList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductMaxMinPrice
    * 2. ClassName : ProductListService.java
    * 3. Comment : 상품 최대가격 , 최소가격
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductMaxMinPrice(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCategorySpecList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 카테고리 2뎁스 스펙리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCategorySpecList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductPlanList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 상품에 속한 기획전 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductPlanList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductTopPlanList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 기획전 1뎁스 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductTopPlanList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductPlanListCount
    * 2. ClassName : ProductListService.java
    * 3. Comment : 상품에 속한 기획전 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductPlanListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductGuideList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 상품 콘텐츠 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductGuideList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMainGuideList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 메인 콘텐츠 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectMainGuideList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMainGuide2List
    * 2. ClassName : ProductListService.java
    * 3. Comment : 메인 E메거진 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 4. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectMainGuide2List(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectReputationList
    * 2. ClassName : ProductListService.java
    * 3. Comment : 대 카테고리 상품평 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectReputationList(Map<String, Object> commandMap) throws Exception;
    
    
    public List<Map<String, Object>> selectRank10CategoryList(Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectRank10BrandList(Map<String, Object> commandMap) throws Exception;
    
}
