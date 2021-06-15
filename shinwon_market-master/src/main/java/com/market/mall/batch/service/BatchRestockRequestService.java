package com.market.mall.batch.service;

import java.util.Map;

/**
 * 
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchMemberGradeMonthService.java
 * @Date : 2020. 6. 24.
 * @프로그램 설명 : 재입고알림배치
 * @author : 정경수
 */
public interface BatchRestockRequestService {
	/**
	 * <pre>
	 * 1. MethodName : updateRestockRequest
	 * 2. ClassName  : BatchRestockRequestService.java
	 * 3. Comment    : 재입고알림배치
	 * 4. 작성자       : 정경수
	 * 5. 작성일       : 2020. 6. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateRestockRequest(Map<String, Object> commandMap) throws Exception ;
}
