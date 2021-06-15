package com.market.mall.pc.brand.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.brand.service
 * @FileName : BrandStoreOpenService.java
 * @Date : 2015. 6. 12.
 * @프로그램 설명 : 사용자 > 매장개설문의 관련하여 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface BrandStoreOpenService 
{
	/**
	* <pre>
	* 1. MethodName : insertBrandStoreOpen
	* 2. ClassName : BrandStoreOpenService.java
	* 3. Comment : 사용자 > 매장개설문의 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBrandStoreOpen (Map<String, Object> commandMap) throws Exception;
	
}
