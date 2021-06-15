package com.market.mall.batch.service;

import java.util.Map;

public interface BatchEmpRetireInfoUpdateService {
	/**
	 * <pre>
	 * 1. MethodName : updateEmpRetireInfoMonth
	 * 2. ClassName  : BatchMemberGradeMonthService.java
	 * 3. Comment    : 퇴직자 변경처리
	 * 4. 작성자       : 
	 * 5. 작성일       : 
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateEmpRetireInfoMonth(Map<String, Object> commandMap) throws Exception ;
}
