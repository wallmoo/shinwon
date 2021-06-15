package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : OneDayService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 원데이특가를 처리하는 Service Class
 * @author khcho
 */
public interface OneDayService {

    /**
     * <pre>
     * 1. MethodName : selectOneDayCount
     * 2. ClassName  : OneDayService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectOneDayCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectOneDayList
     * 2. ClassName  : OneDayService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectOneDayList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectOneDayInfo
     * 2. ClassName  : OneDayService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 수정
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectOneDayInfo(Map<String, Object> commandMap) throws Exception;


   
    /**
     * <pre>
     * 1. MethodName : insertOneDay
     * 2. ClassName  : OneDayService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 등록 처리   
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertOneDay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateOneDay
     * 2. ClassName  : OneDayService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 원데이특가 수정 처리   
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateOneDay(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
 
    
   

}
