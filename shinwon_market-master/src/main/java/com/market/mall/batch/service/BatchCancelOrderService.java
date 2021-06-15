package com.market.mall.batch.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
    * @PackageName: com.market.mall.batch.service
    * @FileName : BatchCancelOrderService.java
    * @Date : 2016. 1. 15.
    * @프로그램 설명 : 입금만료일 기준으로 미입금 있는지 확인하는 Class
    * @author : DEV_LEEKWANGWOON
 */
public interface BatchCancelOrderService {


	/**
	 * 
	    * <pre>
	    * 1. MethodName : selectCancelOrder
	    * 2. ClassName  : BatchCancelOrderService.java
	    * 3. Comment    : 관리자 > 배치작업 - 입금만료 무통장 미입금건 주문취소 목록
	    * 4. 작성자       : DEV_LEEKWANGWOON
	    * 5. 작성일       : 2016. 1. 15.
	    * </pre>
	    *
	    * @param commandMap
	    * @return
	    * @throws Exception
	 */
	public List<Map<String, Object>> selectCancelOrder(Map<String, Object> commandMap) throws Exception;
	
	
}
