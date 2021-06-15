package com.market.mall.pc.manager.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.mall.model.User;

/**
 * @PackageName: com.market.mall.pc.manager.service
 * @FileName : LoginManagerService.java
 * @Date : 2016. 8. 31.
 * @프로그램 설명 : 프론트 > 사용자 로그인을 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface LoginManagerService {
    
    /**
     * <pre>
     * 1. MethodName : loginManagerProc
     * 2. ClassName  : LoginManagerService.java
     * 3. Comment    : 회원, 비회원 로그인을 처리 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 31.
     * </pre>
     *
     * @param request
     * @param user
     * @param response
     * @return
     * @throws Exception
     */
    public User loginManagerProc (HttpServletRequest request, User user,HttpServletResponse response) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : loginSnsManagerProc
     * 2. ClassName  : LoginManagerService.java
     * 3. Comment    : SNS 계정 사용자 로그인 처리
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 22.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception   
     */
    public User loginSnsManagerProc (HttpServletRequest request, User user,HttpServletResponse response) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertLoginPoint
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 로그인 성공 시 포인트 지급
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 16.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void insertLoginPoint (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectRestMemberInfo
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 휴면회원 > 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectRestMemberInfo (HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCertifyInfo
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : siren 본인인증(휴대폰, 아이핀) CI값으로 회원 조회 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectCertifyInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSimpleMemInfo
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 아이디 찾기 > 간편회원 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectSimpleMemInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBusinessMemIdList
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 아이디 찾기 > 기업회원 조회 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String,Object>> selectBusinessMemIdList (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCheckBasicMemInfoCount
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 비밀번호찾기 > 통합회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCheckBasicMemInfoCount (Map<String,Object> commandMap) throws Exception;
     
    /**
    * <pre>
    * 1. MethodName : updateBasicMemPw
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 비밀번호찾기 결과 > 통합회원 > 비밀번호 변경
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMemberRegularPasswordChange (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;  
    
    public int updateBasicMemPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    /**
    * <pre>
    * 1. MethodName : selectCheckSimpleMemInfo
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 비밀번호 찾기 > 간편회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectCheckSimpleMemInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCheckBusinessMemInfo
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 비밀번호 찾기 > 기업회원 회원정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectCheckBusinessMemInfo (Map<String,Object> commandMap) throws Exception;
    
    
    /**
    * <pre>
    * 1. MethodName : updateMemberTempPw
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 비밀번호 찾기 > 임시 비밀번호 발송(간편회원, 기업회원)
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 12. 9.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMemberTempPw (HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectChangeSimpleMemInfo
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 프론트 > 로그인 > 간편회원 전환 > 정보 조회
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 20.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectChangeSimpleMemInfo (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : checkCI
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 전환하려는 회원의 CI값이 IPN테이블에 존재하는지 여부 체크
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 29.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> checkSimpleMem (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateToken
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 모바일 > APP > token ID 추가
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 9.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void updateToken (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : mergeToken
    * 2. ClassName  : LoginManagerService.java
    * 3. Comment    : 모바일 > APP > token ID 추가
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 3. 9.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void mergeToken (Map<String,Object> commandMap) throws Exception;
    public Map<String,Object> selectCertifyIntegrationUserInfo (Map<String,Object> commandMap) throws Exception;

	public Map<String, Object> selectCheckSimpleMemInfoByCertInfo(Map<String, Object> commandMap) throws Exception;
	public Map<String,Object> checkPwSkip (Map<String,Object> commandMap) throws Exception;
}
