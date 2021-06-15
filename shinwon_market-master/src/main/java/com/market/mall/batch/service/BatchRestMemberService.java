package com.market.mall.batch.service;

import java.util.Map;

/**
 * @PackageName: com.market.mall.am.batch.service
 * @FileName : BatchRestMemberService.java
 * @Date : 2015. 12. 16
 * @프로그램 설명 : 관리자 > 휴면회원 정보 이관을 처리하는 Service Class
 * @author 김소영
 */
public interface BatchRestMemberService {


    /**
     * <pre>
     * 1. MethodName : transMember
     * 2. ClassName  : BatchRestMemberService.java
     * 3. Comment    : 관리자 > 휴면회원 정보 이관
     * 4. 작성자       : 김소영
     * 5. 작성일       : 2015. 12. 16
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
	public Map<String, Object> transMember(Map<String, Object> commandMap) throws Exception ;
}
