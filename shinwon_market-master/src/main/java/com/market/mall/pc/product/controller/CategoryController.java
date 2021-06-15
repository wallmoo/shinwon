package com.market.mall.pc.product.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.epasscni.common.annotations.RequestParams;
import com.epasscni.viewer.JSON;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.pc.product.service.CategoryService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.product.controller
 * @FileName : CategoryController.java
 * @Date : 2016. 1. 8.
 * @프로그램 설명 : 카테고리를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
@Controller
public class CategoryController {
	
	@Resource(name="categoryService") 
	private CategoryService categoryService;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
	/**
	* <pre>
	* 1. MethodName : subCategoryProductAjax
	* 2. ClassName : CategoryController.java
	* 3. Comment : 카테고리 리스트 Ajax
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 8.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@FrontBannerSkip()
	@RequestMapping(value="/pc/product/subCategoryProductAjax")
    public JSON subCategoryProductAjax(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception  
    {
        JSON json = new JSON();

        List<Map<String, Object>> list = this.categoryService.selectSubCategoryProductList(commandMap);

        json.put("categoryList", list);
        
        return json;
    }
}
