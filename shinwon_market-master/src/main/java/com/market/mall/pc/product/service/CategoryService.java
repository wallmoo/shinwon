package com.market.mall.pc.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.epasscni.util.StringUtil;
import com.market.mall.model.User;

/**
 * @PackageName: com.market.mall.pc.product.service
 * @FileName : CategoryService.java
 * @Date : 2016. 1. 8.
 * @프로그램 설명 : 카테고리를 처리하는 Controller Class
 * @author DEV_KIMMINHO    
 */
public interface CategoryService {
	
	/**
	* <pre>
	* 1. MethodName : selectSubCategoryProductList
	* 2. ClassName : CategoryService.java
	* 3. Comment : 카테고리 리스트 Ajax
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectSubCategoryProductList(Map<String, Object> commandMap) throws Exception;
}
