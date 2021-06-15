package com.market.mall.pc.vendor.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface VendorSellerPickService {
    
    //셀러픽 리스트
    public List<Map<String, Object>> selectSellerPickList (Map<String, Object> commandMap) throws Exception;
    
    //셀러픽 기본 정보
    public Map<String, Object> selectSellerPickInfo (Map<String, Object> commandMap) throws Exception;
    
    //셀러픽 상단 목록
    public List<Map<String, Object>> selectSellerPickBannerList(Map<String, Object> commandMap) throws Exception;
    
    public int selectSellerPickCount(Map<String, Object> commandMap) throws Exception;
    
    //셀러픽 상품 목록
    public List<Map<String, Object>> selectSellerPickProductList(Map<String, Object> commandMap) throws Exception;
    
    //셀러픽 상품 목록 총 갯수
    public int selectContentProductListCount(Map<String, Object> commandMap) throws Exception;
}
