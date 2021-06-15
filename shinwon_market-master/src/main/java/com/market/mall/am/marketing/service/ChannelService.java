package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : ChannelService.java
 * @Date : 2015. 12. 01.
 * @프로그램 설명 : 관리자 > 프로모션관리 > 채널관리를 처리하는 Service Interface
 * @author khcho
 */
public interface ChannelService {

    /**
    * <pre>
    * 1. MethodName : selectChannelCodeList
    * 2. ClassName  : ChannelService.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널 코드 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    
    /**
    * <pre>
    * 1. MethodName : selectChannelList
    * 2. ClassName  : ChannelService.java
    * 3. Comment    : 관리자 > 프로모션관리 > 하위채널 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectChannelList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectChannelMst
     * 2. ClassName  : ChannelService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 대표채널 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 01.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String, Object> selectChannelMst (Map<String, Object> commandMap) throws Exception;
     
    
    /**
    * <pre>
    * 1. MethodName : selectChannelInfo
    * 2. ClassName  : ChannelService.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 02.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectChannelInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertChannel
    * 2. ClassName  : ChannelService.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertChannel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertChannelMst
     * 2. ClassName  : ChannelService.java
     * 3. Comment    : 관리자 > 프로모션관리 > 대표채널 등록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2015. 12. 01.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int insertChannelMst (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateChannel
    * 2. ClassName  : ChannelService.java
    * 3. Comment    : 관리자 > 프로모션관리 > 채널관리 수정 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 12. 01.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateChannel (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
    public List<Map<String, Object>> selectChannelCodeList (Map<String, Object> commandMap) throws Exception;
    
     
}
