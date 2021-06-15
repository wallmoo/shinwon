package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchCIDeleteService.java
 * @Date : 2015. 12. 16
 * @프로그램 설명 : 관리자 > 탈퇴회원 CI 값 삭제를 처리하는 Service Class
 * @author 김소영
 */
public interface BatchDeleteCIService {


    /**
     * <pre>
     * 1. MethodName : deleteCI
     * 2. ClassName  : BatchCIDeleteService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 김소영
     * 5. 작성일       : 2015. 12. 16
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> deleteCI(Map<String, Object> commandMap) throws Exception ;
}
