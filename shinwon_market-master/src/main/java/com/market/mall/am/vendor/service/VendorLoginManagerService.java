package com.market.mall.am.vendor.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.vendor.service
 * @FileName : VendorLoginManagerService.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점상담 업체관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
public interface VendorLoginManagerService {
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorLoginManagerListCount
	 * 2. ClassName  : VendorLoginManagerService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체 관리 목록 개수 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectVendorLoginManagerListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorLoginManagerList
	 * 2. ClassName  : VendorLoginManagerService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체관리 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> selectVendorLoginManagerList (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorLoginManagerInfo
	 * 2. ClassName  : VendorLoginManagerService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectVendorLoginManagerInfo (Map<String,Object> commandMap) throws Exception;
	
    /**
     * <pre>
     * 1. MethodName : updateVendorLoginManager
     * 2. ClassName  : VendorLoginManagerService.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 입점상담 업체 수정
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorLoginManager (Map<String,Object> commandMap) throws Exception;
	    
	    
	/**
	 * <pre>
	 * 1. MethodName : updateVendorMemTempPw
	 * 2. ClassName  : VendorLoginManagerService.java
	 * 3. Comment    :  
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateVendorMemTempPw (Map<String,Object> commandMap) throws Exception;
	
	

}
