package com.market.mall.pc.category.service;

import java.util.List;
import java.util.Map;

public interface MainCategoryService {
    
    public int selectProductListCount(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> selectProductList(Map<String, Object> commandMap) throws Exception;
    public Map<String,Object> selectCategoryByIdx(Map<String, Object> commandMap) throws Exception;
    public Map<String,Object> selectCategoryDetailByIdx(Map<String, Object> commandMap) throws Exception;
    public List<Map<String,Object>> selectCategoryChildrenByIdx(Map<String, Object> commandMap) throws Exception;
    public void updateCategoryReadCount(Map<String, Object> commandMap) throws Exception;
}
