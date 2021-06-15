package com.market.mall.pc.brand.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.brand.service.BrandService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("brandService")
public class BrandServiceImpl implements BrandService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") protected EgovPropertyService propertiesService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectBannerDisplayList
   	 * 2. ClassName  : BrandServiceImpl.java
   	 * 3. Comment    : 브랜드 > 배너  목록 
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
   		return this.defaultDAO.selectList("Brand.selectBannerDisplayList", commandMap);
   	}
    

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
    public int selectBannerDisplayInterval(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Brand.selectBannerDisplayInterval",commandMap);
    }
    
    
    
    /**
	 * <pre>
	 * 1. MethodName : selectTopSellerList
	 * 2. ClassName  : BrandServiceImpl.java
	 * 3. Comment    : 브랜드 > top seller 목록 
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectTopSellerList(Map<String, Object> commandMap) throws Exception {
		
    	return this.defaultDAO.selectList("Brand.selectTopSellerList", commandMap);		
	}
    
    /**
     * <pre>
     * 1. MethodName : selectProductListCount
     * 2. ClassName  : BrandServiceImpl.java
     * 3. Comment    : 브랜드 > 브랜드 상품 목록 갯수
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
        return defaultDAO.selectCount("Brand.selectProductListCount",commandMap);
    }
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductList
	 * 2. ClassName  : BrandServiceImpl.java
	 * 3. Comment    : 브랜드 > 브랜드 상품 목록
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
		
    	if( StringUtil.isNullToString(commandMap.get("PRODUCT_LIST_ORDER")).equals("") ){
        	commandMap.put("PRODUCT_LIST_ORDER", "ORD ASC");
    	}
    	return this.defaultDAO.selectList("Brand.selectProductList", commandMap);		
	}
    
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductDisplayList
   	 * 2. ClassName  : BrandServiceImpl.java
   	 * 3. Comment    : 브랜드 > 상품 목록 
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductDisplayList(Map<String, Object> commandMap) throws Exception {
   		return this.defaultDAO.selectList("Brand.selectProductDisplayList", commandMap);
   	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectSubCategoryList
	 * 2. ClassName  : BrandServiceImpl.java
	 * 3. Comment    : 브랜드 > 카테고리 상품 중간 카테고리 선택용 목록
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
		
    	return this.defaultDAO.selectList("Brand.selectSubCategoryList", commandMap);		
	}
    
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectBrandInfo(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.select("Brand.selectBrandInfo", commandMap);
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBrandBannerList (Map<String, Object> commandMap) throws Exception {
        
        return this.defaultDAO.selectList("Brand.selectBrandBannerList", commandMap);       
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBrandAllList (Map<String, Object> commandMap) throws Exception {
        
        return this.defaultDAO.selectList("Brand.selectBrandAllList", commandMap);       
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBrandCategoryList (Map<String, Object> commandMap) throws Exception {
        
        return this.defaultDAO.selectList("Brand.selectBrandCategoryList", commandMap);       
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBrandProductList (Map<String, Object> commandMap) throws Exception {
        
        List<Map<String, Object>> result = this.defaultDAO.selectList("Brand.selectBrandProductList", commandMap);

    	List<Map<String, Object>> colorList = null;
    	try {
    		Map<String, Object> colorParam = new HashMap<String, Object>();
        	colorParam.put("productList", result);
    		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
    	} catch (Exception e) {
    		
    	}
		
		if(colorList != null) {
			
			for(int i = 0 ; i < result.size(); i ++ ) {
				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
				String targetPrdCD = result.get(i).get("PRD_MST_CD").toString();
				for(int k = 0; k < colorList.size(); k++) {
					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
						colorResult.add(colorList.get(k));
					}
				}
				result.get(i).put("CNT_PRD_COLOR", colorResult);
			}
		}

        return result;       
    }
    
    public int selectBrandProductCount (Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectCount("Brand.selectBrandProductCount", commandMap);      
    }
    
    
    
}
