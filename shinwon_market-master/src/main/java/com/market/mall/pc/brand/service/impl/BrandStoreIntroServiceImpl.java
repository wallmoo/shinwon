package com.market.mall.pc.brand.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.brand.service.BrandStoreIntroService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.pc.brand.service.impl
 * @FileName : BrandStoreIntroServiceImpl.java
 * @Date : 2015. 6. 12.
 * @프로그램 설명 : 사용자 > 브랜드 사이트 > 매장안내 관련하여 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */

@Service("pcBrandStoreIntroService")
public class BrandStoreIntroServiceImpl implements BrandStoreIntroService 
{
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectStoreAreaList
	* 2. ClassName : BrandStoreIntroServiceImpl.java
	* 3. Comment : 사용자 > 매장 > 매장 지역 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectStoreAreaList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("pcBrandStoreIntro.selectStoreAreaList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMarmotStoreCount
	* 2. ClassName : BrandStoreIntroServiceImpl.java
	* 3. Comment : 사용자 > 마모트 > 매장 > 매장 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMarmotStoreCount (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("pcBrandStoreIntro.selectMarmotStoreCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMarmotStoreList
	* 2. ClassName : BrandStoreIntroServiceImpl.java
	* 3. Comment : 사용자 > 마모트 > 매장 > 매장 목록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMarmotStoreList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("pcBrandStoreIntro.selectMarmotStoreList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectStoreAreaNm
	* 2. ClassName : BrandStoreIntroServiceImpl.java
	* 3. Comment : 사용자 > 매장 > 지역 이름 가져오기
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 12.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public String selectStoreAreaNm (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectStr("pcBrandStoreIntro.selectStoreAreaNm", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMountiaStoreCount
	* 2. ClassName : BrandStoreIntroServiceImpl.java
	* 3. Comment : 사용자 > 마운티아 > 매장 > 매장 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMountiaStoreCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("pcBrandStoreIntro.selectMountiaStoreCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMountiaStoreList
	* 2. ClassName : BrandStoreIntroServiceImpl.java
	* 3. Comment : 사용자 > 마운티아 > 매장 > 매장 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 6. 15.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMountiaStoreList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("pcBrandStoreIntro.selectMountiaStoreList", commandMap);
	}
}
