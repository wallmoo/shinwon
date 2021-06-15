package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : BannerDisplayService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 전시배너관리를 처리하는 Service Interface
 * @author jangsin
 */
public interface BannerDisplayService {

    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayCodeList
    * 2. ClassName  : BannerDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 배너 코드 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectBannerDisplayCodeList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayListCount
    * 2. ClassName  : BannerDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectBannerDisplayListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayList
    * 2. ClassName  : BannerDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectBannerDisplayList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectBannerDisplayInfo
    * 2. ClassName  : BannerDisplayService.java
    * 3. Comment    : 관리자 > 전시관리 > 전시배너관리 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 17.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectBannerDisplayInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertBannerDisplay
    * 2. ClassName  : BannerDisplayService.java
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
    public int insertBannerDisplay (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateBannerDisplay
    * 2. ClassName  : BannerDisplayService.java
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
    public int updateBannerDisplay (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectBnrCatCodeList
     * 2. ClassName  : BannerDisplayService.java
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
      * <pre>
      * 1. MethodName : updateBannerDisplaySortArray
      * 2. ClassName  : BannerDisplayServiceImpl.java
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
       public int updateBannerDisplaySortArray (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
       
       /**
    * <pre>
    * 1. MethodName : deleteBannerDisplay
    * 2. ClassName : BannerDisplayService.java
    * 3. Comment : 배너삭제
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 3.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int deleteBannerDisplay (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;     

    public int deleteBannerDisplayBatch (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public int updateBannerDisplayUseYNBatch (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    
    public List<Map<String, Object>> selectBannerProductList (Map<String, Object> commandMap) throws Exception;
    
    public int deleteBannerCNT (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    public int deleteBannerCNTBatch (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;        
    
}
