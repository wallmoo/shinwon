package com.market.mall.am.vendor.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.vendor.service
 * @FileName : VendorCounselService.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점상담관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
public interface VendorCounselService {
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorCounselListCount
	 * 2. ClassName  : VendorCounselService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 목록 개수
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectVendorCounselListCount (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorCounselList
	 * 2. ClassName  : VendorCounselService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> selectVendorCounselList (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorCounselInfo
	 * 2. ClassName  : VendorCounselService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectVendorCounselInfo (Map<String,Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : updateVendorCounsel
	 * 2. ClassName  : VendorCounselService.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담관리 수정
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateVendorCounsel (Map<String,Object> commandMap) throws Exception;

}
