package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : BrandManagerService.java
 * @Date : 2015. 10. 13.
 * @프로그램 설명 : 관리자 > 시스템 관리 > 브랜드 관리를 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface BrandManagerService {
	
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerListCount
	* 2. ClassName  : BrandManagerService.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBrandManagerListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerList
	* 2. ClassName  : BrandManagerService.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectBrandManagerList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertBrandManager
	* 2. ClassName  : BrandManagerService.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertBrandManager (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerInfo
	* 2. ClassName  : BrandManagerService.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectBrandManagerInfo (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateBrandManager
	* 2. ClassName  : BrandManagerService.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 수정 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 13.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateBrandManager (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectBrandManagerNmCheckCount
	* 2. ClassName  : BrandManagerService.java
	* 3. Comment    : 관리자 > 시스템 관리 > 브랜드 관리 > 브랜드명 중복체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 10. 14.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectBrandManagerNmCheckCount (Map<String,Object> commandMap) throws Exception;
	
	public int selectSellerNmCheckCount (Map<String,Object> commandMap) throws Exception;
	
	public int updateBrandStatus (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	public Map<String, Object> selectBrandInfoByVendor(Map<String,Object> commandMap) throws Exception;

	public int updateBrandList (Map<String,Object> commandMap) throws Exception;
	
	public int deleteBrandrManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;		
}
