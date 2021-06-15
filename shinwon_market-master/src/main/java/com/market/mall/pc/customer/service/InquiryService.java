package com.market.mall.pc.customer.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.customer.service
 * @FileName : InquiryService.java
 * @Date : 2014. 7. 24.
 * @프로그램 설명 : 프론트 > 고객센터 > 1:1문의를 처리하는 Service Interface
 * @author kanghk
 */
public interface InquiryService {  
	/**
	* <pre>
	* 1. MethodName : insertInquiry
	* 2. ClassName  : InquiryService.java
	* 3. Comment    : 1:1문의 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertInquiry (MultipartHttpServletRequest request,Map<String, Object> commandMap) throws Exception;
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName : selectInquiryOrderProductList
	 * 2. ClassName : InquiryService.java
	 * 3. Comment : 주문내역 검색
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 8.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectInquiryOrderProductList (Map<String, Object> commandMap) throws Exception;

	/**
	 * 
	 * <pre>
	 * 1. MethodName : getSubCodeList
	 * 2. ClassName : InquiryService.java
	 * 3. Comment : 문의유형 하위 카테고리 리스트
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSubCodeList(Map<String, Object> commandMap) throws Exception;
}
