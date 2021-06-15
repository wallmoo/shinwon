package com.market.mall.batch.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchOrderSendEndService.java
 * @Date : 2015. 7. 8.
 * @프로그램 설명 : 관리자 > 자동배송완료를 처리하는 Service Class
 * @author DEV_KANGHYUNKYU
 */
public interface BatchOrderSendEndService {
	
	
	
	/**
	 * <pre>
	 * 1. MethodName : updateOrderState
	 * 2. ClassName  : BatchOrderSendEndService.java
	 * 3. Comment    : 주문상태 변경
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 3. 10.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateOrderState(Map<String, Object> commandMap) throws Exception ;
	
}
