package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : CardEventService.java
 * @Date : 2015. 11. 10.
 * @프로그램 설명 : 관리자 > 마케팅관리 > 카드행사관리 처리하는 Service Interface
 * @author khcho
 */
public interface CardEventService {

    /**
    * <pre>
    * 1. MethodName : selectCardEventListCount
    * 2. ClassName  : CardEventService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCardEventListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCardEventList
    * 2. ClassName  : CardEventService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectCardEventList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCardEventInfo
    * 2. ClassName  : CardEventService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectCardEventInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertCardEvent
    * 2. ClassName  : CardEventService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertCardEvent (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateCardEvent
    * 2. ClassName  : CardEventService.java
    * 3. Comment    : 관리자 > 마케팅관리 > 카드행사관리 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 10.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateCardEvent (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCardCodeList
     * 2. ClassName  : CardEventService.java
     * 3. Comment    : 카드 코드조회 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectCardCodeList () throws Exception;
    
    
}
