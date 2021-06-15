package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : VendorDisplayService.java
 * @Date : 2016. 2. 17.
 * @프로그램 설명 : 입점업체 상품상세 공지를 처리하는 Service
 * @author DEV_KIMMINHO    
 */
public interface VendorDisplayService {
	
	/**
	* <pre>
	* 1. MethodName : selectVendorDisplayCount
	* 2. ClassName : VendorDisplayService.java
	* 3. Comment : 입점업체 공통전시 등록 갯수
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectVendorDisplayCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : insertVendorDisplay
	* 2. ClassName : VendorDisplayService.java
	* 3. Comment : 입점업체 공통전시 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertVendorDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateVendorDisplay
	* 2. ClassName : VendorDisplayService.java
	* 3. Comment : 입점업체 공통전시 수정
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateVendorDisplay(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectVendorDisplayInfo
	* 2. ClassName : VendorDisplayService.java
	* 3. Comment : 입점업체 공통전시 상세
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 17.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String,Object> selectVendorDisplayInfo (Map<String,Object> commandMap) throws Exception;
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisPcListImage (Map<String,Object> commandMap) throws Exception;
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisMobileListImage (Map<String,Object> commandMap) throws Exception;
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisPcDetailImage (Map<String,Object> commandMap) throws Exception;
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorDisMobileDetailImage (Map<String,Object> commandMap) throws Exception;
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorDisplayFileList (Map<String,Object> commandMap) throws Exception;
	
	@SuppressWarnings("unchecked")
	public Integer modifyVendorDisplay (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
}

