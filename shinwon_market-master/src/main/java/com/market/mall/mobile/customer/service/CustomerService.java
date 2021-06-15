package com.market.mall.mobile.customer.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.pc.customer.service
 * @FileName : CustomerService.java
 * @Date : 2014. 7. 21.
 * @프로그램 설명 : 프론트 > 고객센터 메인을 처리하는 Service Interface
 * @author kanghk
 */
public interface CustomerService {
	/**
	 * <pre>
	 * 1. MethodName : selectCustomerMain
	 * 2. ClassName : CustomerService.java
	 * 3. Comment : 
	 * 4. 작성자 : Lee
	 * 5. 작성일 : 2016. 1. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCustomerMain (Map<String, Object> commandMap) throws Exception;
}
