package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : CommonCodeManagerService.java
 * @Date : 2014. 4. 2.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 공통코드 관리를 처리하는 Service Inerface
 * @author jangsin
 */
public interface CommonCodeManagerService {

    /**
    * <pre>
    * 1. MethodName : commonCodeManagerListCount
    * 2. ClassName  : CommonCodeManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCommonCodeManagerListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : commonCodeManagerList
    * 2. ClassName  : CommonCodeManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCommonCodeManagerList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCommonCodeManagerInfo
    * 2. ClassName  : CommonCodeManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCommonCodeManagerInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertCommonCodeManager
    * 2. ClassName  : CommonCodeManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertCommonCodeManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateCommonCodeManager
    * 2. ClassName  : CommonCodeManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCommonCodeManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateCommonCodeSortArray
    * 2. ClassName  : CommonCodeManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 공통코드 순서 정렬 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCommonCodeManagerSortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
