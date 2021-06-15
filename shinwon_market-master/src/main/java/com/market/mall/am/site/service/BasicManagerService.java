package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : BasicManagerService.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 사이트 관리 > 관리자 관리를 처리하는 Service Interface
 * @author DEV_KIMYEONGJUN
 */
public interface BasicManagerService {

    /**
     * <pre>
     * 1. MethodName : selectBasicManagerListCount
     * 2. ClassName  : BasicManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 목록 갯수 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectBasicManagerListCount (Map<String, Object> commandMap) throws Exception;
     
     /**
     * <pre>
     * 1. MethodName : basicManagerList
     * 2. ClassName  : BasicManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 목록 
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectBasicManagerList (Map<String, Object> commandMap) throws Exception;
     
     
     /**
     * <pre>
     * 1. MethodName : selectBasicManagerIdCheckCount
     * 2. ClassName  : BasicManagerService.java
     * 3. Comment    : 관리자 > 사이트 관리 > 관리자 아이디 중복 체크
     * 4. 작성자       : DEV_KIMYEONGJUN
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectBasicManagerIdCheckCount (Map<String, Object> commandMap) throws Exception;
     
     /**
    * <pre>
    * 1. MethodName : sleectBasicManagerInfo
    * 2. ClassName  : BasicManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 상세보기 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectBasicManagerInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertBasicManager
    * 2. ClassName  : BasicManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 등록 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertBasicManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateBasicManager
    * 2. ClassName  : BasicManagerService.java
    * 3. Comment    : 관리자 > 사이트 관리 > 관리자 관리 수정 
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateBasicManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBasicManagerTypeList
    * 2. ClassName  : BasicManagerService.java
    * 3. Comment    : 관리자 타입별로 리스트를 반환한다.  
    * 4. 작성자       : DEV_KIMYEONGJUN
    * 5. 작성일       : 2016. 8. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectBasicManagerTypeList (Map<String, Object> commandMap) throws Exception;
    
    
    public int deleteBasicManager (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;    
    
}
