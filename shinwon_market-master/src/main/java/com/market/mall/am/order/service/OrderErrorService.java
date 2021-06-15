package com.market.mall.am.order.service;

import java.util.List;
import java.util.Map;

/**
 * @PackageName: com.market.mall.am.order.service
 * @FileName : OrderErrorService.java
 * @Date : 2015. 10. 27.
 * @프로그램 설명 : 결제오류조회 처리하는 interface
 * @author DEV_KANGHYUNKYU
 */
public interface OrderErrorService {
	
	public int selectOrdErrCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectOrdErrList(Map<String, Object> commandMap) throws Exception;
	
	public int insertOrdErr(Map<String, Object> commandMap) throws Exception;
	
}
