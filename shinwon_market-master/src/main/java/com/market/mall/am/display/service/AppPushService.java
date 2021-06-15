package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : AppPushService.java
 * @Date : 2015. 4. 21.
 * @프로그램 설명 : 관리자 > 전시관리 > APP 푸시알림관리를 처리하는 Service Class
 * @author DEV_KIMSOYOUNG
 */
public interface AppPushService {
	
    /**
    * <pre>
    * 1. MethodName : selectAppPushCount
    * 2. ClassName : AppPushService.java
    * 3. Comment : 관리자 > 전시관리 > APP 푸시알림관리 목록 갯수 
    * 4. 작성자       : ejpark
    * 5. 작성일       : 2014. 7. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectAppPushCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectAppPushList
     * 2. ClassName  : AppPushService.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 목록   
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectAppPushList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectAppPushView
     * 2. ClassName  : AppPushService.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 상세보기    
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectAppPushView(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertAppPush
     * 2. ClassName  : AppPushService.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 등록 처리    
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertAppPush(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateAppPush
     * 2. ClassName  : AppPushService.java
     * 3. Comment    : 관리자 > 전시관리 > APP 푸시알림관리 수정 처리  
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 7. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateAppPush(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
