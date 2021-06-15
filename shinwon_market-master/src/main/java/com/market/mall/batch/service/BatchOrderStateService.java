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
public interface BatchOrderStateService {
	
	/**
	 * 
	    * <pre>
	    * 1. MethodName : updateOrderState
	    * 2. ClassName  : BatchOrderStateService.java
	    * 3. Comment    : 주문상태 업데이트
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	public Map<String,Object> updateOrderState(Map<String, Object> commandMap) throws Exception;
	
	/**
	* <pre>
	* 1. MethodName : kiccManagePayment
	* 2. ClassName  : BatchOrderStateService.java
	* 3. Comment    : kicc 변경 요청(취소, 에스크로 등등)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 3. 16.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public Map<String, Object> kiccManagePayment(Map<String, Object> commandMap) throws Exception;
	
}
