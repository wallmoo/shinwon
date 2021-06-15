package com.market.mall.pc.brand.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.brand.service.BrandTechService;

/**
 * @PackageName: com.market.mall.pc.brand.service.impl
 * @FileName : BrandTechServiceImpl.java
 * @Date : 2015. 6. 11.
 * @프로그램 설명 : 사용자 > 브랜드사이트 > tech 관련하여 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("pcBrandTechService")
public class BrandTechServiceImpl implements BrandTechService 
{
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectBrandTechCount
	* 2. ClassName : BrandTechServiceImpl.java
	* 3. Comment : 사용자 > tech > technology / equipmentKeep / useMenual 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBrandTechCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("pcBrandTech.selectBrandTechCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectBrandTechList
	* 2. ClassName : BrandTechServiceImpl.java
	* 3. Comment : 사용자 > tech > technology / equipmentKeep / useMenual 목록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 11.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectBrandTechList (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("pcBrandTech.selectBrandTechList", commandMap);
	}
}
