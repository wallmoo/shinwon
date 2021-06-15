package com.market.mall.pc.liveon.service;

import java.util.List;
import java.util.Map;

public interface LiveOnService {
    
    //라이브온 상품 목록 총 갯수
    public int selectLiveOnProductListCount(Map<String, Object> commandMap) throws Exception;
    
    //라이브온 상품 목록
    public List<Map<String, Object>> selectLiveOnProductList(Map<String, Object> commandMap) throws Exception;
}
