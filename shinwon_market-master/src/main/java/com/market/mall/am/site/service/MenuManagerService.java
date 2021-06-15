package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : MenuManagerService.java
 * @Date : 2014. 3. 26.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 메뉴관리를 처리하는 Service Inerface
 * @author jangsin
 */
public interface MenuManagerService {

    /**
    * <pre>
    * 1. MethodName : selectMenuManagerListCount
    * 2. ClassName  : MenuManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMenuManagerListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectmenuManagerList
    * 2. ClassName  : MenuManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectmenuManagerList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMenuManagerInfo
    * 2. ClassName  : MenuManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMenuManagerInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertMenuManager
    * 2. ClassName  : MenuManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 등록
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 3. 31.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertMenuManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
    /**
    * <pre>
    * 1. MethodName : updateMenuManager
    * 2. ClassName  : MenuManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴관리 수정
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMenuManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateMenuManagerSortArray
    * 2. ClassName  : MenuManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 메뉴 순서 변경 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 1.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMenuManagerSortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
