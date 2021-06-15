package com.market.mall.am.vendor.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.sgsplus.etland.am.createboard.service
 * @FileName : ShopInqService.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 관리자 > 게시판관리 > 입점업체문의사항를 처리하는 Service Interface
 * @author khcho
 */
public interface VendorInqService {

    /**
    * <pre>
    * 1. MethodName : selectShopInqListCount
    * 2. ClassName  : ShopInqService.java
    * 3. Comment    : 관리자 > 게시판관리 > 입점업체문의사항 목록 갯수 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 12.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectVendorInqListCount (Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectShopInqList
    * 2. ClassName  : ShopInqService.java
    * 3. Comment    : 관리자 > 게시판관리 > 입점업체문의사항 목록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 12.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectVendorInqList (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectShopInqInfo
    * 2. ClassName  : ShopInqService.java
    * 3. Comment    : 관리자 > 게시판관리 > 입점업체문의사항 상세정보 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 12.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectVendorInqInfo (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateShopInq
    * 2. ClassName  : ShopInqService.java
    * 3. Comment    : 관리자 > 게시판관리 > 입점업체문의사항 답변 등록 
    * 4. 작성자       : khcho
    * 5. 작성일       : 2015. 11. 12.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateVendorInq (HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertShopInqToEtland
    * 2. ClassName  : ShopInqService.java
    * 3. Comment    : 관리자 > 게시판관리 > MarketPlant 문의하기 > 등록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertVendorInqToEtland (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateShopInqToEtland
    * 2. ClassName  : ShopInqService.java
    * 3. Comment    : 관리자 > 게시판관리 > MarketPlant 문의하기 > 수정 
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateVendorInqToEtland (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception;    
    
}
