package com.market.mall.pc.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.FileUpload;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.product.service.CategoryService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.product.service.impl
 * @FileName : CategoryServiceImpl.java
 * @Date : 2016. 1. 8.
 * @프로그램 설명 : 카테고리를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
    @Autowired 
    private FileUpload fileUpload;
    
    /**
    * <pre>
    * 1. MethodName : selectSubCategoryProductList
    * 2. ClassName : CategoryServiceImpl.java
    * 3. Comment : 카테고리 리스트 Ajax
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSubCategoryProductList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("PcCategoryProduct.selectSubCategoryProductList",commandMap);
    }

}
