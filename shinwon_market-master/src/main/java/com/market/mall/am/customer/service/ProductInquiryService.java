package com.market.mall.am.customer.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.customer.service
 * @FileName : ProductInquiryService.java
 * @Date : 2015. 4. 10.
 * @프로그램 설명 : 관리자 > 고객센터 > 상품 문의를 처리하는 Service Interface
 * @author DEV_KIMSOYOUNG
 */
public interface ProductInquiryService {
	
	/**
	* <pre>
	* 1. MethodName : selectProductInquiryListCount
	* 2. ClassName : ProductInquiryService.java
	* 3. Comment : 관리자 > 고객센터 > 상품 문의 목록 갯수
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectProductInquiryListCount (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectProductInquiryList
	* 2. ClassName : ProductInquiryService.java
	* 3. Comment : 관리자 > 고객센터 > 상품 문의 목록
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> selectProductInquiryList (Map<String, Object> commandMap) throws Exception;

	/**
	* <pre>
	* 1. MethodName : selectProductInquiryInfo
	* 2. ClassName : ProductInquiryService.java
	* 3. Comment : 관리자 > 고객센터 > 상품문의 상세정보 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectProductInquiryInfo (Map<String, Object> commandMap) throws Exception;
	
	public Map<String, Object> selectSellerInquiryInfo (Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : updateProductInquiry
	* 2. ClassName : ProductInquiryService.java
	* 3. Comment : 관리자 > 고객센터 > 상품문의 답변 등록 
	* 4. 작성자 : DEV_KIMSOYOUNG
	* 5. 작성일 : 2015. 4. 10.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateProductInquiry (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	public int selectSellerInquiryListCount (Map<String, Object> commandMap) throws Exception;

	public List<Map<String, Object>> selectSellerInquiryList (Map<String, Object> commandMap) throws Exception;


}
