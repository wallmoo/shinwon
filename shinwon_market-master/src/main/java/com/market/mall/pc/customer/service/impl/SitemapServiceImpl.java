package com.market.mall.pc.customer.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.customer.service.SitemapService;

/**
 * @PackageName: com.market.mall.pc.customer.service
 * @FileName : SitemapServiceImpl.java
 * @Date : 2014. 11. 28.
 * @프로그램 설명 : 프론트 > 사이트맵을 처리하는 Service Interface
 * @author 이미정
 */
@Service("sitemapService")
public class SitemapServiceImpl implements SitemapService {
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;


	/**
	* <pre>
	* 1. MethodName : selectSubCategory
	* 2. ClassName  : SitemapServiceImpl.java
	* 3. Comment    : 고객센터 메인
	* 4. 작성자       : 이미정
	* 5. 작성일       : 2014. 11. 28.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSubCategory(Map<String, Object> commandMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> list = defaultDAO.selectList("Sitemap.selectSubCategory", commandMap);
		
		if( list != null && list.size()>0 ){
			for( Map<String, Object> data : list ){
				String key = data.get("PRD_CTG_UP_IDX").toString();
				
				if( resultMap.containsKey(data.get("PRD_CTG_UP_IDX").toString())){
					// 리스트가 있는 경우
					List<Map<String, Object>> newList = new ArrayList ((List<Map<String, Object>>) resultMap.get(key));
					newList.add(data);
					resultMap.put(key, newList);
				}
				else{
					// 리스트가 없는 경우
					resultMap.put(key,  Arrays.asList(data));
				}
			}
		}		
		return resultMap;
	}

}
