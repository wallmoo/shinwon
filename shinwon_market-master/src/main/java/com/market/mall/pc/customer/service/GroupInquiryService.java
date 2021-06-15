package com.market.mall.pc.customer.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.customer.service
 * @FileName : GroupInquiryService.java
 * @Date : 2014. 7. 25.
 * @프로그램 설명 : 프론트 > 고객센터 > 단체주문을 처리하는 Service Interface
 * @author kanghk
 */
public interface GroupInquiryService {

	/**
	* <pre>
	* 1. MethodName : insertGroupInquiry
	* 2. ClassName  : GroupInquiryService.java
	* 3. Comment    : 단체주문 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertGroupInquiry (MultipartHttpServletRequest request,Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : selectProductInfo
	* 2. ClassName  : GroupInquiryService.java
	* 3. Comment    : 상품코드 확인
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> selectProductInfo (Map<String, Object> commandMap) throws Exception;
}
