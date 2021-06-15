package com.market.mall.pc.ootd.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface OOTDService {
    
    public int selectMyShoppingListCount (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectMyShoppingList (Map<String, Object> commandMap) throws Exception;
    
    public int selectMyOOTDCount (Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectOotdInfo (Map<String, Object> commandMap) throws Exception;
    
    public int insertOOTDData(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSpecialOOTDProductList (Map<String, Object> commandMap) throws Exception;
    
    public int deleteMyOOTDData (Map<String, Object> commandMap) throws Exception;
    
    
    //ootd 수정
    public int updateMyOOTDData (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
    //ootd 등록 상품 수정
    public int updateMyOOTDProduct (Map<String, Object> commandMap);
    
    //ootd 등록 상품 조회
    public List<Map<String, Object>> selectMyOOTDProductList (Map<String, Object> commandMap);
    
    //ootd 등록 이미지 조회
    public List<Map<String, Object>> selectMyOOTDImageList (Map<String, Object> commandMap);
    
    //ootd 좋아요 수
    public int selectOOTDLikeCount (Map<String, Object> commandMap);
    
    //
    public int deletOOTDData(Map<String, Object> commandMap);
    
    public Map<String, Object> selectMemberPrivilege (Map<String, Object> commandMap) throws Exception;
}
