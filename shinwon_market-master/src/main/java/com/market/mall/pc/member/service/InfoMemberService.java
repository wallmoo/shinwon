package com.market.mall.pc.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.pc.member.service
 * @FileName : InfoMemberService.java
 * @Date : 2014. 6. 25.
 * @프로그램 설명 : 프론트 > 회원을 처리하는 Service Interface
 * @author LJH
 */
public interface InfoMemberService {

    /**
     * <pre>
     * 1. MethodName	: selectInfoMemberInfo
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 프론트 > 회원 > 회원 상세 정보 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 25. 오후 2:59:04
     * </pre>
     *
     * @return Map<String,Object>
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectInfoMemberInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectCompanyList
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 프론트 > 회원 > 임직원 인증요청 > 계열사 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 5. 오후 5:54:47
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCompanyList (Map<String, Object> commandMap) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName	: updateTempPasswordReset
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 프론트 > 회원 > 비밀번호 변경 > 임시비밀번호 발급여부 리셋
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 20. 오후 8:21:47
     * </pre>
     *
     * @return int
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateTempPasswordReset (Map<String, Object> commandMap) throws Exception;
}
