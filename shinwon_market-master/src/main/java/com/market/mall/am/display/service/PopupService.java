package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.display.service
 * @FileName : PopupService.java
 * @Date : 2014. 4. 17.
 * @프로그램 설명 : 관리자 > 전시관리 > 팝업관리를 처리하는 Service Class
 * @author ejpark
 */
public interface PopupService {

    /**
     * <pre>
     * 1. MethodName : selectPopupCount
     * 2. ClassName  : PopupService.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 목록 갯수 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPopupCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPopupList
     * 2. ClassName  : PopupService.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 목록 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPopupList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPopupView
     * 2. ClassName  : PopupService.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 상세보기 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPopupView(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertPopup
     * 2. ClassName  : PopupService.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 등록 처리   
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPopup(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePopup
     * 2. ClassName  : PopupService.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 수정 처리   
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePopup(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : popupFormMobile
     * 2. ClassName  : PopupService.java
     * 3. Comment    : 관리자 > 전시관리 > 팝업관리 모바일팝업 등록 화면  
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 6. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> popupFormMobile(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectViewPageCnt
    * 2. ClassName : PopupService.java
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

    public int updatePopupStatus (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
}
