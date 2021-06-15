package com.market.mall.batch.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
    * @PackageName: com.market.mall.batch.service
    * @FileName : BatchOrderStateService.java
    * @Date : 2016. 1. 15.
    * @프로그램 설명 : 주문상태 업데이트
    * @author : DEV_LEEKWANGWOON
 */
public interface BatchOrderStateFixService {
	
	/**
	 * <pre>
	 * 1. MethodName : updateOrderStateEnd
	 * 2. ClassName  : BatchOrderStateFixService.java
	 * 3. Comment    : 주문확정 처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 3. 10.
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateOrderStateEnd(Map<String, Object> commandMap) throws Exception ;	
	
}
