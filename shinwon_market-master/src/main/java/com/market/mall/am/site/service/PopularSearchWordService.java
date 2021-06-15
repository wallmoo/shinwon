package com.market.mall.am.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: com.market.mall.am.site.service
 * @FileName : PopularSearchWordService.java
 * @Date : 2016. 8. 21.
 * @프로그램 설명 :  관리자 > 사이트관리 > 인기 검색어 관리를 처리하는 Service
 * @author DEV_LEESANGWOOK
 */
public interface PopularSearchWordService {

    /**
     * <pre>
     * 1. MethodName : selectPopularSearchWordListCount
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기 검색어 개수
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPopularSearchWordListCount(Map<String,Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertPopularSearchWord
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    : 관리자 > 사이트관리 > 인기검색어 등록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPopularSearchWord(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPopularSearchWordList
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    :  관리자 > 사이트관리 > 인기검색어 목록 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String,Object>> selectPopularSearchWordList(Map<String,Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePopularSearchWord
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    :  관리자 > 사이트관리 > 인기검색어 수정
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePopularSearchWord(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPcPopSearcWordList
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    : 프론트(top) > 검색 > 인기검색어 목록 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 23.
     * </pre>
     *
     * @param request
     * @return
     * @throws Exception
     */
    public List<Map<String,Object>> selectPcPopSearcWordList(HttpServletRequest request) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updatePopularSearchWordHit
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    : 프론트(top) > 검색 > 인기검색어 목록에서 하나 선택 > 조회수 증가
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 23.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePopularSearchWordHit(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectPopSearchWordInfo
     * 2. ClassName  : PopularSearchWordService.java
     * 3. Comment    : 프론트(top) > 검색 > 인기검색어 목록에서 하나 선택 > 해당 검색어 조회
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPopSearchWordInfo(Map<String, Object> commandMap) throws Exception;
}
