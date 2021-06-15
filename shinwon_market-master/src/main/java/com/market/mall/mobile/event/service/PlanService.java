package com.market.mall.mobile.event.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.event.service
 * @FileName : PlanService.java
 * @Date : 2014. 7. 29.
 * @프로그램 설명 : 프론트 > 이벤트 처리하는 Service Interface
 * @author kanghk
 */
public interface PlanService {
	
	/**
	* <pre>
	* 1. MethodName : selectPlanBrandList
	* 2. ClassName  : PlanService.java
	* 3. Comment    : 브랜드 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectPlanBrandList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectPlanListCount
	* 2. ClassName  : PlanService.java
	* 3. Comment    : 기획전 개수
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 29.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectPlanListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanList
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 기획전 목록 
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectPlanList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectPlanTopList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOtherPlanList
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 해당 브랜드 다른 기획전 목록
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOtherPlanList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanInfo
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 기획전 상세
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectPlanInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanBannerList
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 기획전 배너 리스트
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectPlanBannerList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanProductListCount
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 기획전 상세 상품 개수
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectPlanProductListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectPlanProductList
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 기획전 상세 상품 리스트
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectPlanProductList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSubCategoryList
    * 2. ClassName  : PlanService.java
    * 3. Comment    : 브랜드별 하위 카테고리
    * 4. 작성자       : kanghk
    * 5. 작성일       : 2014. 7. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectSubCategoryList(Map<String, Object> commandMap) throws Exception;


    /**
    * <pre>
    * 1. MethodName : selectEventProductCategoryList
    * 2. ClassName  : PlanService.java
	* 3. Comment    : 브랜드별 하위 카테고리 (모바일용)
	* 4. 작성자     		: 이미정
	* 5. 작성일      		: 2014. 12. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectEventProductCategoryList(Map<String, Object> commandMap) throws Exception;

}
