package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : authManagerService.java
 * @Date : 2014. 3. 25.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 권한관리를 처리하는 Service Interface
 * @author jangsin
 */
public interface AuthManagerService {


    /**
    * <pre>
    * 1. MethodName : selectAuthManagerListCount
    * 2. ClassName  : authManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectAuthManagerListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectAuthManagerList
    * 2. ClassName  : authManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectAuthManagerList (Map<String, Object> commandMap) throws Exception;
   
    
    /**
    * <pre>
    * 1. MethodName : insertAuthManager
    * 2. ClassName  : AuthManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertAuthManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectAuthManagerInfo
    * 2. ClassName  : AuthManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 상세보기 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectAuthManagerInfo (Map<String, Object> commandMap) throws Exception;
    
    
    /**
    * <pre>
    * 1. MethodName : updateAuthManager
    * 2. ClassName  : AuthManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 권한관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateAuthManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
}
