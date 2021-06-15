package com.market.mall.am.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.mall.am.member.service.OOTDMemberService;
import com.market.mall.dao.CommonDefaultDAO;

@Service("ootdMemberService")
public class OOTDMemberServiceImpl implements OOTDMemberService{
    
    @Autowired
    CommonDefaultDAO dao;
    
    public List<Map<String, Object>> selectOOTDListByUserId(Map<String, Object> commandMap){
        return dao.selectList("OOTD.selectOOTDListByUserId", commandMap);
    }
    
    public int selectOOTDListCount(Map<String, Object> commandMap){
        return dao.selectCount("OOTD.selectOOTDListCount", commandMap);
    }
}
