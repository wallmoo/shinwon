package com.market.mall.am.vendor.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.vendor.service
 * @FileName : VendorReqService.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점신청서 관리를 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface VendorReqService {

    /**
     * <pre>
     * 1. MethodName : selectVendorReqListCount
     * 2. ClassName  : VendorReqService.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 목록 갯수
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
	* 2. ClassName  : VendorReqService.java
	* 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 목록
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String,Object>> selectVendorReqList (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorReqInfo
	* 2. ClassName  : VendorReqService.java
	* 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 상세정보
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectVendorReqInfo (Map<String,Object> commandMap) throws Exception;
	
	/** 
	* <pre>
	* 1. MethodName : updateVendorReq
	* 2. ClassName  : VendorReqService.java
	* 3. Comment    : 관리자 > 입점업체관리 > 입점신청서관리 수정
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateVendorReq (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
	
}
