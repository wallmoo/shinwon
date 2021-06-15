package com.market.mall.pc.brand.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.brand.service.BrandStoreOpenService;

/**
 * @PackageName: com.market.mall.pc.brand.service.impl
 * @FileName : BrandStoreOpenServiceImpl.java
 * @Date : 2015. 6. 12.
 * @프로그램 설명 : 사용자 > 매장개설문의 관련하여 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("pcBrandStoreOpenService")
public class BrandStoreOpenServiceImpl implements BrandStoreOpenService 
{
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : insertBrandStoreOpen
	* 2. ClassName : BrandStoreOpenServiceImpl.java
	* 3. Comment : 사용자 > 매장개설문의 등록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBrandStoreOpen (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.insert("pcBrandStoreOpen.insertBrandStoreOpen", commandMap);
	}
}
