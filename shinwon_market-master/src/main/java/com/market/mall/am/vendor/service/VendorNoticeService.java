package com.market.mall.am.vendor.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.sgsplus.etland.am.board.service
 * @FileName : ShopNoticeService.java
 * @Date : 2015. 10. 27.
 * @프로그램 설명 : 관리자 > 게시판 관리 > 몰공지사항을 처리하는 Service Interface
 * @author khcho
 */
/**
 * @PackageName: com.market.mall.am.vendor.service
 * @FileName : VendorNoticeService.java
 * @Date : 2016. 8. 24.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점업체 공지시항을 처리하는 Service Interface
 * @author DEV_LEESANGWOOK
 */
public interface VendorNoticeService {

    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeListCount
     * 2. ClassName  : VendorNoticeService.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 목록 개수
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorNoticeListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeList
     * 2. ClassName  : VendorNoticeService.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 목록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectVendorNoticeList (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectVendorNoticeInfo
     * 2. ClassName  : VendorNoticeService.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 상세정보 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectVendorNoticeInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertVendorNotice
     * 2. ClassName  : VendorNoticeService.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 공지사항 등록
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertVendorNotice (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateVendorNotice
     * 2. ClassName  : VendorNoticeService.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점업체 공지사항 수정 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorNotice (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
     /**
     * <pre>
     * 1. MethodName : selectVendorNoticeTopCount
     * 2. ClassName  : VendorNoticeService.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 상단 공지 목록 개수 
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorNoticeTopCount (Map<String, Object> commandMap) throws Exception;
}
