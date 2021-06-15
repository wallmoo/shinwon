package com.market.mall.pc.customer.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.customer.service
 * @FileName : SitemapService.java
 * @Date : 2014. 11. 28.
 * @프로그램 설명 : 프론트 > 사이트맵을 처리하는 Service Interface
 * @author 이미정
 */
public interface SitemapService {
	/**
	* <pre>
	* 1. MethodName : selectSubCategory
	* 2. ClassName  : SitemapService.java
	* 3. Comment    : 고객센터 메인
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 11. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectSubCategory (Map<String, Object> commandMap) throws Exception;
}
