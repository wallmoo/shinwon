package com.market.mall.am.logo.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.logo.service
 * @FileName : LogoService.java
 * @Date : 2016. 8. 8.
 * @프로그램 설명 : Logo관리를 처리하는 ServiceInterface
 * @author DEV_KIMHYOJOONG
 */
public interface LogoService {

    /**
     * <pre>
     * 1. MethodName : selectLogoList
     * 2. ClassName  : LogoService.java
     * 3. Comment    : 로고 목록
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectLogoList (Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertLogo
     * 2. ClassName  : LogoService.java
     * 3. Comment    : 로고 등록
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 9.
     * </pre>
     *
     * @param multipartRequest
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String insertLogo (MultipartHttpServletRequest multipartRequest, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectLogoUrl
     * 2. ClassName  : LogoService.java
     * 3. Comment    : 로고 주소
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 8. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectLogoUrl (Map<String, Object> commandMap) throws Exception;
}
