package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : AdService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 광고관리를 처리하는 Service Class
 * @author khcho
 */
public interface AdService {

    /**
     * <pre>
     * 1. MethodName : selectAdCount
     * 2. ClassName  : AdService.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 목록 갯수 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectAdCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectAdList
     * 2. ClassName  : AdService.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 목록 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectAdList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectAdView
     * 2. ClassName  : AdService.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 상세보기 
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectAdView(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertAd
     * 2. ClassName  : AdService.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 등록 처리   
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertAd(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateAd
     * 2. ClassName  : AdService.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 수정 처리   
     * 4. 작성자       : khcho
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateAd(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : adFormMobile
     * 2. ClassName  : AdService.java
     * 3. Comment    : 관리자 > 전시관리 > 광고관리 모바일광고 등록 화면  
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> adFormMobile(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectViewPageCnt
    * 2. ClassName : AdService.java
    * 3. Comment : 노출페이지 중복 체크
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 8. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> selectViewPageCnt (Map<String,Object> commandMap) throws Exception;

}
