package com.market.mall.pc.product.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.product.service.ProductListService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("productListService")
public class ProductListServiceImpl implements ProductListService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name="propertiesService") 
	protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectBannerDisplayList
   	 * 2. ClassName  : ProductListServiceImpl.java
   	 * 3. Comment    : 카테고리 > 배너  목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectBannerDisplayList", commandMap);
   	}
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayListShinwon(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectBannerDisplayListShinwon", commandMap);
   	}
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayCatCodeList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectBannerDisplayCatCodeList", commandMap);
   	}
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryTabList(Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.selectList("ProductList.selectCategoryTabList", commandMap);
    };
	
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCatTabProductList(Map<String, Object> commandMap) throws Exception{
    	List<Map<String, Object>> list = this.defaultDAO.selectList("ProductList.selectCatTabProductList", commandMap);
    	Map<String, Object> colorParam = new HashMap<String, Object>();
    	colorParam.put("productList", list);
    		
    	List<Map<String, Object>> colorList = null;
    	try {
    		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
    	} catch (Exception e) {
    		
    	}
		
		if(colorList != null) {
			
			for(int i = 0 ; i < list.size(); i ++ ) {
				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
				String targetPrdCD = list.get(i).get("PRD_MST_CD").toString();
				for(int k = 0; k < colorList.size(); k++) {
					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
						colorResult.add(colorList.get(k));
					}
				}
				list.get(i).put("CNT_PRD_COLOR", colorResult);
			}
			
		}

    	return list;
    };
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayListTypeB
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 상품카테고리 > 배너 목록 타입B 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 3. 7.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayListTypeB(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", commandMap);
   	}
    
    /**
     * <pre>
     * 1. MethodName : selectBannerDisplayInterval
     * 2. ClassName  : ProductListServiceImpl.java
     * 3. Comment    : 카테고리 > 배너  목록  롤링 시간간격
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectBannerDisplayInterval(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectStr("ProductList.selectBannerDisplayInterval",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 상품전시
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductDisplayList(Map<String, Object> commandMap) throws Exception {
   		return this.defaultDAO.selectList("ProductList.selectProductDisplayList", commandMap);
   	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductDisplayList
   	 * 2. ClassName  : ProductListServiceImpl.java
   	 * 3. Comment    : 전시영역 상품 리스트 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public List<List<Map<String, Object>>> selectBestProductDisplayList(Map<String, Object> commandMap) throws Exception {
   		
    	List<List<Map<String, Object>>> bestItemList = new ArrayList<List<Map<String, Object>>>();
    	
    	Map<String, Object> bestPrdMap = new HashMap<String, Object>();
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD1);
    	bestPrdMap.put("USER_ENV_TYPE", commandMap.get("PRD_CTG_ENV"));
    	bestPrdMap.put("THUMBNAIL_SIZE", commandMap.get("THUMBNAIL_SIZE"));
    	bestPrdMap.put("MEM_CRT_SES_ID", commandMap.get("MEM_CRT_SES_ID"));
    	bestPrdMap.put("RNUM", 5);
    	List<Map<String, Object>> bestListMd1 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD2);
    	List<Map<String, Object>> bestListMd2 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD3);
    	List<Map<String, Object>> bestListMd3 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD4);
    	List<Map<String, Object>> bestListMd4 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD5);
    	List<Map<String, Object>> bestListMd5 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD6);
    	List<Map<String, Object>> bestListMd6 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD7);
    	List<Map<String, Object>> bestListMd7 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	bestPrdMap.put("CMN_COM_IDX", Code.PC_MANIN_BEST_ITEM_MD8);
    	List<Map<String, Object>> bestListMd8 =  this.defaultDAO.selectList("ProductList.selectProductDisplayList", bestPrdMap);
    	
    	if(bestListMd1 != null && bestListMd1.size() == 4){
    		bestItemList.add(bestListMd1);
    	}
    	if(bestListMd2 != null && bestListMd2.size() == 4){
    		bestItemList.add(bestListMd2);
    	}
    	if(bestListMd3 != null && bestListMd3.size() == 4){
    		bestItemList.add(bestListMd3);
    	}
    	if(bestListMd4 != null && bestListMd4.size() == 4){
    		bestItemList.add(bestListMd4);
    	}
    	if(bestListMd5 != null && bestListMd5.size() == 4){
    		bestItemList.add(bestListMd5);
    	}
    	if(bestListMd6 != null && bestListMd6.size() == 4){
    		bestItemList.add(bestListMd6);
    	}
    	if(bestListMd7 != null && bestListMd7.size() == 4){
    		bestItemList.add(bestListMd7);
    	}
    	if(bestListMd8 != null && bestListMd8.size() == 4){
    		bestItemList.add(bestListMd8);
    	}
    	
    	return bestItemList;
   	}
    
    /**
    * <pre>
    * 1. MethodName : selectMdPickBannerDisplayList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : MD 추천 배너 아이콘 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<List<Map<String, Object>>> selectMdPickBannerDisplayList(Map<String, Object> commandMap) throws Exception {
   		
    	List<List<Map<String, Object>>> mdPickItemList = new ArrayList<List<Map<String, Object>>>();
    	
    	Map<String, Object> mdPickBannerMap = new HashMap<String, Object>();
    	mdPickBannerMap.put("BANNER_IDX", Code.PC_MANIN_MD_PICK_MD1);
    	mdPickBannerMap.put("BNR_MST_GBN", Code.BANNER_CONTROLL_TYPE_B);
    	mdPickBannerMap.put("BNR_MST_ENV", commandMap.get("PRD_CTG_ENV"));
    	mdPickBannerMap.put("RUNM", 2);
    	List<Map<String, Object>> mdPickBannerMd1 =  this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", mdPickBannerMap);
    	
    	mdPickBannerMap.put("BANNER_IDX", Code.PC_MANIN_MD_PICK_MD2);
    	List<Map<String, Object>> mdPickBannerMd2 =  this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", mdPickBannerMap);
    	
    	mdPickBannerMap.put("BANNER_IDX", Code.PC_MANIN_MD_PICK_MD3);
    	List<Map<String, Object>> mdPickBannerMd3 =  this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", mdPickBannerMap);
    	
    	mdPickBannerMap.put("BANNER_IDX", Code.PC_MANIN_MD_PICK_MD4);
    	List<Map<String, Object>> mdPickBannerMd4 =  this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", mdPickBannerMap);
    	
    	mdPickBannerMap.put("BANNER_IDX", Code.PC_MANIN_MD_PICK_MD5);
    	List<Map<String, Object>> mdPickBannerMd5 =  this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", mdPickBannerMap);
    	
    	mdPickBannerMap.put("BANNER_IDX", Code.PC_MANIN_MD_PICK_MD6);
    	List<Map<String, Object>> mdPickBannerMd6 =  this.defaultDAO.selectList("ProductList.selectBannerDisplayListTypeB", mdPickBannerMap);
    	
    	
    	if(mdPickBannerMd1 != null){
    		mdPickItemList.add(mdPickBannerMd1);
    	}
    	if(mdPickBannerMd2 != null){
    		mdPickItemList.add(mdPickBannerMd2);
    	}
    	if(mdPickBannerMd3 != null){
    		mdPickItemList.add(mdPickBannerMd3);
    	}
    	if(mdPickBannerMd4 != null){
    		mdPickItemList.add(mdPickBannerMd4);
    	}
    	if(mdPickBannerMd5 != null){
    		mdPickItemList.add(mdPickBannerMd5);
    	}
    	if(mdPickBannerMd6 != null){
    		mdPickItemList.add(mdPickBannerMd6);
    	}

    	return mdPickItemList;
   	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductDisplayMdPickList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : MD PICK 전시 상품 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductDisplayMdPickList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("ProductList.selectProductList", commandMap);		
	}
    
    
    /**
     * <pre>
     * 1. MethodName : selectProductListCount
     * 2. ClassName  : ProductListServiceImpl.java
     * 3. Comment    : 카테고리 > 카테고리 상품 목록 갯수
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("ProductList.selectProductListCount",commandMap);
    }
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductList
	 * 2. ClassName  : ProductListServiceImpl.java
	 * 3. Comment    : 카테고리 > 카테고리 상품 목록
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductList(Map<String, Object> commandMap) throws Exception {
		
    	List<Map<String,Object>> result =  this.defaultDAO.selectList("ProductList.selectProductList", commandMap);
    	
        for(int index=0; index < result.size(); index++){
            
            Map<String,Object> paramMap = new HashMap<String, Object>();
            
            String prdCD = StringUtil.getString(result.get(index).get("PRD_MST_CD"),"");
            
            paramMap.put("PRD_MST_CD", prdCD);
            List<Map<String, Object>> prdColorList = new ArrayList<Map<String,Object>>();
            prdColorList = this.defaultDAO.selectList("Product.selectProductColorList", paramMap);
            
            result.get(index).put("CNT_PRD_COLOR", prdColorList);
        }
    	
    	return result;
	}
    
    
    /**
	 * <pre>
	 * 1. MethodName : selectSubCategoryList
	 * 2. ClassName  : ProductListServiceImpl.java
	 * 3. Comment    : 카테고리 > 카테고리 상품 중간 카테고리 선택용 목록
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSubCategoryList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("ProductList.selectSubCategoryList", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : selectMenuCategoryList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 카테고리 > 카테고리 1뎁스 목록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMenuCategoryList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("ProductList.selectMenuCategoryList", commandMap);		
	}

    /**
   	 * <pre>
   	 * 1. MethodName : selectBannerDisplayList
   	 * 2. ClassName  : ProductListServiceImpl.java
   	 * 3. Comment    : 카테고리 > 배너  목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBannerDisplayInfoList(Map<String, Object> commandMap) throws Exception {
    	
		commandMap.put("CMN_COM_IDX", commandMap.get("BANNER_IDX") );
		Map<String, Object> info =  this.defaultDAO.select("PcCommon.selectCodeInfo", commandMap);
		if(info != null && "Y".equals(StringUtil.getString(info.get("CMN_COM_ETC4"),"")) ){
			commandMap.put("LIST_ORDER", "BNR_DTL_ORDER" );
		}
		else {
			commandMap.put("LIST_ORDER", "DBMS_RANDOM.RANDOM");	
		}

    	List<Map<String, Object>> list = this.defaultDAO.selectList("ProductList.selectBannerDisplayList", commandMap);
    	
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	returnMap.put("info", info);
    	returnMap.put("list", list);
    	return returnMap;
   	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductMaxMinPrice
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 상품 최대가격 , 최소가격
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductMaxMinPrice(Map<String, Object> commandMap) throws Exception {
		
    	return defaultDAO.select("ProductList.selectProductMaxMinPrice", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectCategorySpecList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 카테고리 3뎁스 스펙리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategorySpecList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("Product.selectCategorySpecList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductPlanList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 상품에 속한 기획전 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductPlanList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("ProductList.selectProductPlanList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductTopPlanList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 기획전 1뎁스
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 4.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductTopPlanList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("ProductList.selectProductTopPlanList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductPlanListCount
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 상품에 속한 기획전 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 16.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductPlanListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("ProductList.selectProductPlanListCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductGuideList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 상품 콘텐츠 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductGuideList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectProductGuideList", commandMap);
   	}
    
    /**
    * <pre>
    * 1. MethodName : selectMainGuideList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 메인 콘텐츠 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMainGuideList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectMainGuideList", commandMap);
   	}
    
    /**
    * <pre>
    * 1. MethodName : selectMainGuide2List
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 메인 E메거진 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 4. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMainGuide2List(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("ProductList.selectMainGuide2List", commandMap);
   	}
    
    /**
    * <pre>
    * 1. MethodName : selectReputationList
    * 2. ClassName : ProductListServiceImpl.java
    * 3. Comment : 대 카테고리 상품평 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectReputationList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("ProductList.selectReputationList", commandMap);		
	}
    
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectRank10CategoryList(Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.selectList("ProductList.selectRank10CategoryList", commandMap);
    };
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectRank10BrandList(Map<String, Object> commandMap) throws Exception{
    	return this.defaultDAO.selectList("ProductList.selectRank10BrandList", commandMap);
    };
}
