package com.market.mall.pc.brand.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.brand.service
 * @FileName : BrandTechService.java
 * @Date : 2015. 6. 11.
 * @프로그램 설명 : 사용자 > 브랜드사이트 > tech 관련하여 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface BrandTechService 
{
	/**
	* <pre>
	* 1. MethodName : selectBrandTechCount
	* 2. ClassName : BrandTechService.java
	* 3. Comment : 사용자 > tech > technology / equipmentKeep / useMenual 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBrandTechCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBrandTechList
	* 2. ClassName : BrandTechService.java
	* 3. Comment : 사용자 > tech > technology / equipmentKeep / useMenual 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectBrandTechList (Map<String,Object> commandMap) throws Exception;
	
	
}
