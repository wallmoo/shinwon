package com.market.mall.am.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.am.app.service.AppVersionManageService;
import com.market.mall.dao.CommonDefaultDAO;

/**
 * @PackageName: com.market.mall.am.app.service.impl
 * @FileName : AppVersionManageServiceImpl.java
 * @Date : 2016. 3. 7.
 * @프로그램 설명 : 관리자 > APP 관리 > APP VERSION관리를 처리하는 Service Implement Class
 * @author DEV_KIMSOYOUNG
 */
@Service("appVersionManageService")
public class AppVersionManageServiceImpl implements AppVersionManageService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	/**
	* <pre>
	* 1. MethodName : selectAppVersionManageListCount
	* 2. ClassName  : AppVersionManageServiceImpl.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectAppVersionManageListCount (Map<String, Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("AppVersionManage.selectAppVersionManageListCount", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectAppVersionManageList
	* 2. ClassName  : AppVersionManageServiceImpl.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAppVersionManageList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("AppVersionManage.selectAppVersionManageList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : insertAppVersionManage
	* 2. ClassName  : AppVersionManageServiceImpl.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertAppVersionManage (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.insert("AppVersionManage.insertAppVersionManage", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectAppVersionManageInfo
	* 2. ClassName  : AppVersionManageServiceImpl.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectAppVersionManageInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("AppVersionManage.selectAppVersionManageInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : updateAppVersionManage
	* 2. ClassName  : AppVersionManageServiceImpl.java
	* 3. Comment    : 관리자 > APP 관리 > APP VERSION관리 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateAppVersionManage (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.update("AppVersionManage.updateAppVersionManage", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectLatestAppVersionInfo
	* 2. ClassName  : AppVersionManageServiceImpl.java
	* 3. Comment    : 모바일 > APP > intro페이지에서 사용할 최신 안드로이드,아이폰 버전 정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 3. 9.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectLatestAppVersionInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("AppVersionManage.selectLatestAppVersionInfo", commandMap);
	}
}
