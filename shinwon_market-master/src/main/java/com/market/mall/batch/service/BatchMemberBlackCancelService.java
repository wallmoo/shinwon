package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchMemberBlackCancelService.java
 * @Date : 2015. 12. 16
 * @프로그램 설명 : 관리자 > 블랙리스트 종료 회원 상태값 원복을 처리하는 Service Class
 * @author 김소영
 */
public interface BatchMemberBlackCancelService {


    /**
     * <pre>
     * 1. MethodName : updateMemberState
     * 2. ClassName  : BatchMemberBlackCancelService.java
     * 3. Comment    : 관리자 > 배치작업
     * 4. 작성자       : 김소영
     * 5. 작성일       : 2015. 12. 16
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> updateMemberState(Map<String, Object> commandMap) throws Exception ;
}
