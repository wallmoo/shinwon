package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

public interface OOTDMemberService {
    
    public List<Map<String, Object>> selectOOTDListByUserId(Map<String, Object> commandMap);
    
    public int selectOOTDListCount(Map<String, Object> commandMap);
}
