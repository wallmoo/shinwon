package com.market.mall.pc.vendor.service;

import java.util.List;
import java.util.Map;

public interface VendorTopSellerService {
    
    public List<Map<String,Object>> selectTopBannerList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> selectBottomBannerList (Map<String, Object> commandMap) throws Exception;
    
    public int selectSellerProductListCount (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSellerProductList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectRoomHomeBannerLIst (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectRoomHomeBannerWithProductLIst (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectTopBannerTagLIst (Map<String, Object> commandMap) throws Exception;
    
    public Map<String, Object> selectSellerInfo (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectRoomHomeProductList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSellerBrandList (Map<String, Object> commandMap) throws Exception;
    
    public int selectSellerShopProductListCount (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectSellerShopProductList (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectSellerLookBookList (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectSellerSeasonList (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectSellerMediaList (Map<String, Object> commandMap) throws Exception;
    
    
    public List<Map<String, Object>> selectSellerQnaList (Map<String, Object> commandMap) throws Exception;
    public int selectSellerQnaListCount (Map<String, Object> commandMap) throws Exception;
    public Map<String, Object> selectSellerQnaInfo (Map<String, Object> commandMap) throws Exception;
    
    public int insertSellerQna (Map<String, Object> commandMap) throws Exception;
    public int updateSellerQna (Map<String, Object> commandMap) throws Exception;
    public int deleteSellerQna (Map<String, Object> commandMap) throws Exception;
    
    
    public List<Map<String, Object>> selectSellerpickList (Map<String, Object> commandMap) throws Exception;
    public int selectSellerpickProductListCount (Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectSellerpickProductList (Map<String, Object> commandMap) throws Exception;
    public Map<String, Object> selectSellerpickInfo (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectRoomHomeMainSellerPickLIst (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSearchArea (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSelShpList (Map<String, Object> commandMap) throws Exception;
    
    
    
}
