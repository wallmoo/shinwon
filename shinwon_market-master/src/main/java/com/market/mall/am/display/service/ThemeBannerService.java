package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : ThemeBannerService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시배너관리를 처리하는 Service Interface
 * @author jangsin
 */
public interface ThemeBannerService {

    /**
    * <pre>
    * 1. MethodName : selectThemeBannerCodeList
    * 2. ClassName  : ThemeBannerService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 배너 코드 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectThemeBannerCodeList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerListCount
    * 2. ClassName  : ThemeBannerService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectThemeBannerListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerList
    * 2. ClassName  : ThemeBannerService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectThemeBannerList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectThemeBannerInfo
    * 2. ClassName  : ThemeBannerService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectThemeBannerInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertThemeBanner
    * 2. ClassName  : ThemeBannerService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 등록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertThemeBanner (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateThemeBanner
    * 2. ClassName  : ThemeBannerService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 수정 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateThemeBanner (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int deleteThemeBanner (Map<String, Object> commandMap) throws Exception;

    public int updateThemeBannerStatus (Map<String, Object> commandMap) throws Exception;
    
    public int updateBannerStatus (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectBnrCatCodeList
     * 2. ClassName  : ThemeBannerService.java
     * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 상단 제목 표시
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectBnrCatCodeList (Map<String, Object> commandMap) throws Exception;
         
     /**
      * <pre>\
      * 1. MethodName : updateThemeBannerSortArray
      * 2. ClassName  : ThemeBannerServiceImpl.java
      * 3. Comment    : 관리자 > 전시관리 > 공통코드 순서 정렬 
      * 4. 작성자       : 이미정
      * 5. 작성일       : 2014. 7. 3.
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
     public int updateThemeBannerSortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception; 

     
     public List<Map<String, Object>> selectThemeBannerCategory (Map<String, Object> commandMap) throws Exception; 

     public List<Map<String, Object>> selectProductBanner (Map<String, Object> commandMap) throws Exception; 

       
}
