package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : VendorManagerService.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 시스템관리 > 입점업체 관리를 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface VendorManagerService {
    
    /**
    * <pre>
    * 1. MethodName : selectVendorManagerListCount
    * 2. ClassName  : VendorManagerService.java
    * 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록 갯수
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
	public int selectVendorManagerListCount(Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorManagerList
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 관리 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectVendorManagerList (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertVendorManager
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 등록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertVendorManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorManagerInfo
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 상세정보
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectVendorManagerInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateVendorManager
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체 수정
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateVendorManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorManagerNmCheckCount
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 입점업체 중복체크
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectVendorManagerNmCheckCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateChangeFee
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 관리자 > 시스템관리 > 입점업체관리 > 수정 > 수수료 변경 > 등록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
//	public int updateChangeFee (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorReqListCount
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 입점신청을 작성한 입점업체 목록 갯수
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectVendorReqListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorReqList
	* 2. ClassName  : VendorManagerService.java
	* 3. Comment    : 입점신청을 작성한 입점업체 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectVendorReqList (Map<String,Object> commandMap) throws Exception;
	
	public int selectSellerListCount (Map<String,Object> commandMap) throws Exception;
	
	public List<Map<String,Object>> selectSellerList (Map<String,Object> commandMap) throws Exception;
	
	public int selectRegistVendorListCount (Map<String,Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectRegistVendorList (Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSellerSearchList (Map<String, Object> commandMap) throws Exception;
	
	public int deleteVendorManager (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;	

	
}
